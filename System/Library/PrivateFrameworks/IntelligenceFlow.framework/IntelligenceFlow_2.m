uint64_t sub_23F238BF0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for SystemResponse(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  char *v29;
  char *v30;
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
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  uint64_t v48;

  v6 = sub_23F267D84();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_23F1217E8(&qword_256DFEB98);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_OWORD *)v10 = *(_OWORD *)v11;
  v12 = *(_OWORD *)&a2[v9];
  *((_QWORD *)v10 + 2) = *((_QWORD *)v11 + 2);
  *(_OWORD *)&a1[v9] = v12;
  v13 = a3[7];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for StatementOutcome(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v17 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      v48 = type metadata accessor for ActionSuccess(0);
      v18 = *(int *)(v48 + 20);
      v19 = &v14[v18];
      v20 = &v15[v18];
      v21 = type metadata accessor for ActionSuccess.UndoContext(0);
      if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v20, 1, v21))
      {
        v22 = sub_23F1217E8(&qword_256DFEBA0);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v19, v20, v6);
        *(_OWORD *)&v19[*(int *)(v21 + 20)] = *(_OWORD *)&v20[*(int *)(v21 + 20)];
        *(_OWORD *)&v19[*(int *)(v21 + 24)] = *(_OWORD *)&v20[*(int *)(v21 + 24)];
        _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v19, 0, 1, v21);
      }
      v14[*(int *)(v48 + 24)] = v15[*(int *)(v48 + 24)];
      goto LABEL_14;
    case 3u:
      *(_OWORD *)v14 = *(_OWORD *)v15;
      v23 = *(int *)(type metadata accessor for ParameterNeedsValue(0) + 20);
      v24 = &v14[v23];
      v25 = &v15[v23];
      v26 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
      goto LABEL_14;
    case 4u:
      *(_OWORD *)v14 = *(_OWORD *)v15;
      *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
      v14[24] = v15[24];
      v27 = (int *)type metadata accessor for ParameterConfirmation(0);
      v28 = v27[6];
      v29 = &v14[v28];
      v30 = &v15[v28];
      v31 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
      *(_OWORD *)&v14[v27[7]] = *(_OWORD *)&v15[v27[7]];
      *(_OWORD *)&v14[v27[8]] = *(_OWORD *)&v15[v27[8]];
      goto LABEL_14;
    case 6u:
      *(_OWORD *)v14 = *(_OWORD *)v15;
      v32 = type metadata accessor for ParameterNotAllowed(0);
      v33 = *(int *)(v32 + 20);
      v34 = &v14[v33];
      v35 = &v15[v33];
      v36 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 32))(v34, v35, v36);
      v14[*(int *)(v32 + 24)] = v15[*(int *)(v32 + 24)];
      goto LABEL_14;
    case 7u:
      *(_OWORD *)v14 = *(_OWORD *)v15;
      v37 = *(int *)(type metadata accessor for ParameterCandidatesNotFound(0) + 20);
      v38 = &v14[v37];
      v39 = &v15[v37];
      v40 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 32))(v38, v39, v40);
LABEL_14:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      break;
  }
  v41 = a3[8];
  v42 = a3[9];
  v43 = &a1[v41];
  v44 = &a2[v41];
  v45 = *((_OWORD *)v44 + 1);
  *(_OWORD *)v43 = *(_OWORD *)v44;
  *((_OWORD *)v43 + 1) = v45;
  v46 = *((_OWORD *)v44 + 3);
  *((_OWORD *)v43 + 2) = *((_OWORD *)v44 + 2);
  *((_OWORD *)v43 + 3) = v46;
  *(_OWORD *)&a1[v42] = *(_OWORD *)&a2[v42];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  return a1;
}

char *assignWithTake for SystemResponse(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  _OWORD *v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  _OWORD *v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;

  v6 = sub_23F267D84();
  v7 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a1, 1, v6);
  v8 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = sub_23F1217E8(&qword_256DFEB98);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  v11 = a3[5];
  v12 = (uint64_t)&a1[v11];
  v13 = &a2[v11];
  if (*(_QWORD *)&a1[v11 + 16] == 1)
  {
LABEL_10:
    *(_OWORD *)v12 = *(_OWORD *)v13;
    *(_QWORD *)(v12 + 16) = *((_QWORD *)v13 + 2);
    goto LABEL_12;
  }
  v14 = *((_QWORD *)v13 + 2);
  if (v14 == 1)
  {
    sub_23F238BF0(v12);
    goto LABEL_10;
  }
  *(_DWORD *)v12 = *(_DWORD *)v13;
  *(_QWORD *)(v12 + 8) = *((_QWORD *)v13 + 1);
  *(_QWORD *)(v12 + 16) = v14;
  swift_bridgeObjectRelease();
LABEL_12:
  v15 = a3[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v19 = *(_QWORD *)v17;
  v18 = *((_QWORD *)v17 + 1);
  *(_QWORD *)v16 = v19;
  *((_QWORD *)v16 + 1) = v18;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v20 = a3[7];
    v21 = &a1[v20];
    v22 = &a2[v20];
    sub_23F1BE0BC((uint64_t)&a1[v20], type metadata accessor for StatementOutcome);
    v23 = type metadata accessor for StatementOutcome(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v24 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v21, v22, v24);
        v69 = type metadata accessor for ActionSuccess(0);
        v25 = *(int *)(v69 + 20);
        v26 = &v21[v25];
        v27 = &v22[v25];
        v28 = type metadata accessor for ActionSuccess.UndoContext(0);
        if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v27, 1, v28))
        {
          v29 = sub_23F1217E8(&qword_256DFEBA0);
          memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v26, v27, v6);
          *(_OWORD *)&v26[*(int *)(v28 + 20)] = *(_OWORD *)&v27[*(int *)(v28 + 20)];
          *(_OWORD *)&v26[*(int *)(v28 + 24)] = *(_OWORD *)&v27[*(int *)(v28 + 24)];
          _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v26, 0, 1, v28);
        }
        v21[*(int *)(v69 + 24)] = v22[*(int *)(v69 + 24)];
        goto LABEL_24;
      case 3u:
        *(_OWORD *)v21 = *(_OWORD *)v22;
        v30 = *(int *)(type metadata accessor for ParameterNeedsValue(0) + 20);
        v31 = &v21[v30];
        v32 = &v22[v30];
        v33 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
        goto LABEL_24;
      case 4u:
        *(_OWORD *)v21 = *(_OWORD *)v22;
        *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
        v21[24] = v22[24];
        v34 = (int *)type metadata accessor for ParameterConfirmation(0);
        v35 = v34[6];
        v36 = &v21[v35];
        v37 = &v22[v35];
        v38 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
        *(_OWORD *)&v21[v34[7]] = *(_OWORD *)&v22[v34[7]];
        *(_OWORD *)&v21[v34[8]] = *(_OWORD *)&v22[v34[8]];
        goto LABEL_24;
      case 6u:
        *(_OWORD *)v21 = *(_OWORD *)v22;
        v39 = type metadata accessor for ParameterNotAllowed(0);
        v40 = *(int *)(v39 + 20);
        v41 = &v21[v40];
        v42 = &v22[v40];
        v43 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
        v21[*(int *)(v39 + 24)] = v22[*(int *)(v39 + 24)];
        goto LABEL_24;
      case 7u:
        *(_OWORD *)v21 = *(_OWORD *)v22;
        v44 = *(int *)(type metadata accessor for ParameterCandidatesNotFound(0) + 20);
        v45 = &v21[v44];
        v46 = &v22[v44];
        v47 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v45, v46, v47);
LABEL_24:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
        break;
    }
  }
  v48 = a3[8];
  v49 = (uint64_t)&a1[v48];
  v50 = &a2[v48];
  if (*(_QWORD *)&a1[v48])
  {
    if (*(_QWORD *)v50)
    {
      *(_QWORD *)v49 = *(_QWORD *)v50;
      swift_bridgeObjectRelease();
      v51 = v50 + 8;
      v52 = *(unsigned __int8 *)(v49 + 24);
      if (v52 != 255)
      {
        v53 = v50[24];
        if (v53 != 255)
        {
          v54 = *(_QWORD *)(v49 + 8);
          v55 = *(_QWORD *)(v49 + 16);
          *(_OWORD *)(v49 + 8) = *v51;
          *(_BYTE *)(v49 + 24) = v53;
          sub_23F137270(v54, v55, v52);
          goto LABEL_34;
        }
        sub_23F1640D0(v49 + 8);
      }
      *(_OWORD *)(v49 + 8) = *v51;
      *(_BYTE *)(v49 + 24) = v50[24];
LABEL_34:
      v58 = v50 + 32;
      v59 = *(unsigned __int8 *)(v49 + 48);
      if (v59 != 255)
      {
        v60 = v50[48];
        if (v60 != 255)
        {
          v61 = *(_QWORD *)(v49 + 32);
          v62 = *(_QWORD *)(v49 + 40);
          *(_OWORD *)(v49 + 32) = *v58;
          *(_BYTE *)(v49 + 48) = v60;
          sub_23F137270(v61, v62, v59);
LABEL_39:
          *(_BYTE *)(v49 + 49) = v50[49];
          *(_QWORD *)(v49 + 56) = *((_QWORD *)v50 + 7);
          swift_bridgeObjectRelease();
          goto LABEL_40;
        }
        sub_23F1640D0(v49 + 32);
      }
      *(_OWORD *)(v49 + 32) = *v58;
      *(_BYTE *)(v49 + 48) = v50[48];
      goto LABEL_39;
    }
    sub_23F2369D0(v49);
  }
  v56 = *((_OWORD *)v50 + 1);
  *(_OWORD *)v49 = *(_OWORD *)v50;
  *(_OWORD *)(v49 + 16) = v56;
  v57 = *((_OWORD *)v50 + 3);
  *(_OWORD *)(v49 + 32) = *((_OWORD *)v50 + 2);
  *(_OWORD *)(v49 + 48) = v57;
LABEL_40:
  v63 = a3[9];
  v64 = &a1[v63];
  v65 = &a2[v63];
  v67 = *(_QWORD *)v65;
  v66 = *((_QWORD *)v65 + 1);
  *(_QWORD *)v64 = v67;
  *((_QWORD *)v64 + 1) = v66;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemResponse()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F239548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F239554(a1, a2, a3);
}

void sub_23F239554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F180250();
  sub_23F1217E8(&qword_256DFEB98);
  sub_23F17F9A8();
  if (v6)
  {
    v7 = sub_23F180064();
  }
  else
  {
    if ((_DWORD)v3 == 0x7FFFFFFF)
    {
      sub_23F13188C(*(_QWORD *)(v4 + *(int *)(a3 + 24) + 8));
      sub_23F12612C();
      return;
    }
    v8 = sub_23F25096C();
    v7 = v4 + *(int *)(a3 + 28);
  }
  sub_23F1315B8(v7, v3, v8);
}

uint64_t storeEnumTagSinglePayload for SystemResponse()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F2395D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_23F2395E4(a1, a2, a3, a4);
}

void sub_23F2395E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23F180250();
  if (*(_DWORD *)(*(_QWORD *)(sub_23F1217E8(&qword_256DFEB98) - 8) + 84) == a3)
  {
    sub_23F18010C();
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      sub_23F25004C(*(int *)(a4 + 24));
      sub_23F131ABC();
      return;
    }
    sub_23F25096C();
  }
  sub_23F17FE5C();
  sub_23F250378(v6, v7, v8, v9);
}

void sub_23F239664()
{
  unint64_t v0;
  unint64_t v1;

  sub_23F178624(319, (unint64_t *)&qword_256E005C0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for StatementOutcome(319);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for InterpretedStatementResult(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char *v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    v7 = sub_23F267D84();
    if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a2, 1, v7))
    {
      v8 = sub_23F1217E8(&qword_256DFEB98);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = a3[6];
    v13 = (char *)a1 + v11;
    v14 = (char *)a2 + v11;
    *(_DWORD *)v13 = *(_DWORD *)v14;
    v15 = *((_QWORD *)v14 + 2);
    *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
    *((_QWORD *)v13 + 2) = v15;
    v16 = (char *)a1 + v12;
    v17 = (char *)a2 + v12;
    *(_DWORD *)v16 = *(_DWORD *)v17;
    v18 = *((_QWORD *)v17 + 2);
    *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
    *((_QWORD *)v16 + 2) = v18;
    v19 = a3[7];
    v20 = a3[8];
    v21 = (char *)a1 + v19;
    v22 = (char *)a2 + v19;
    *(_DWORD *)v21 = *(_DWORD *)v22;
    v23 = *((_QWORD *)v22 + 2);
    *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
    *((_QWORD *)v21 + 2) = v23;
    v24 = (uint64_t *)((char *)a1 + v20);
    v25 = (uint64_t *)((char *)a2 + v20);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    type metadata accessor for StatementOutcome(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27 = (char *)&loc_23F2398B0 + 4 * byte_23F279F58[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v9 = *a2;
  *a1 = *a2;
  v10 = v9 + ((v5 + 16) & ~(unint64_t)v5);
  swift_retain();
  return v10;
}

unint64_t destroy for InterpretedStatementResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_23F267D84();
  if (!_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(a2 + 36);
  type metadata accessor for StatementOutcome(0);
  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v7 = sub_23F268078();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
      v8 = v5 + *(int *)(type metadata accessor for ActionSuccess(0) + 20);
      v9 = type metadata accessor for ActionSuccess.UndoContext(0);
      result = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v8, 1, v9);
      if (!(_DWORD)result)
      {
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v8, v4);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      return result;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 2:
      goto LABEL_16;
    case 3:
      swift_bridgeObjectRelease();
      v10 = type metadata accessor for ParameterNeedsValue(0);
      goto LABEL_12;
    case 4:
      swift_bridgeObjectRelease();
      v11 = v5 + *(int *)(type metadata accessor for ParameterConfirmation(0) + 24);
      v12 = sub_23F268078();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 6:
      swift_bridgeObjectRelease();
      v10 = type metadata accessor for ParameterNotAllowed(0);
      goto LABEL_12;
    case 7:
      swift_bridgeObjectRelease();
      v10 = type metadata accessor for ParameterCandidatesNotFound(0);
LABEL_12:
      v13 = v5 + *(int *)(v10 + 20);
      v14 = sub_23F268078();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
    case 8:
      return sub_23F137248(*(_QWORD *)v5, *(_QWORD *)(v5 + 8), *(_BYTE *)(v5 + 16));
    case 9:
      return swift_bridgeObjectRelease();
    case 10:
      result = *(_QWORD *)(v5 + 8);
      if (result < 0x10)
        return result;
LABEL_16:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    default:
      return result;
  }
}

void initializeWithCopy for InterpretedStatementResult(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;

  v6 = sub_23F267D84();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_23F1217E8(&qword_256DFEB98);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_DWORD *)v10 = *(_DWORD *)v11;
  v12 = *((_QWORD *)v11 + 2);
  *((_QWORD *)v10 + 1) = *((_QWORD *)v11 + 1);
  *((_QWORD *)v10 + 2) = v12;
  v13 = &a1[v9];
  v14 = &a2[v9];
  *(_DWORD *)v13 = *(_DWORD *)v14;
  v15 = *((_QWORD *)v14 + 2);
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  *((_QWORD *)v13 + 2) = v15;
  v16 = a3[7];
  v17 = a3[8];
  v18 = &a1[v16];
  v19 = &a2[v16];
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v20 = *((_QWORD *)v19 + 2);
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  *((_QWORD *)v18 + 2) = v20;
  v21 = &a1[v17];
  v22 = &a2[v17];
  v23 = *((_QWORD *)v22 + 1);
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = v23;
  type metadata accessor for StatementOutcome(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = (char *)sub_23F23A0DC + 4 * byte_23F279F6E[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23F23A0DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v4 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v1, v2, v4);
  v5 = type metadata accessor for ActionSuccess(0);
  v6 = *(int *)(v5 + 20);
  v7 = (char *)(v1 + v6);
  v8 = (char *)(v2 + v6);
  v9 = type metadata accessor for ActionSuccess.UndoContext(0);
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v8, 1, v9))
  {
    v10 = sub_23F1217E8(&qword_256DFEBA0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v7, v8, v3);
    v11 = *(int *)(v9 + 20);
    v12 = &v7[v11];
    v13 = &v8[v11];
    v14 = *((_QWORD *)v13 + 1);
    *(_QWORD *)v12 = *(_QWORD *)v13;
    *((_QWORD *)v12 + 1) = v14;
    v15 = *(int *)(v9 + 24);
    v16 = &v7[v15];
    v17 = &v8[v15];
    v18 = *((_QWORD *)v17 + 1);
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_QWORD *)v16 + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v7, 0, 1, v9);
  }
  *(_BYTE *)(v1 + *(int *)(v5 + 24)) = *(_BYTE *)(v2 + *(int *)(v5 + 24));
  swift_storeEnumTagMultiPayload();
  return v0;
}

char *assignWithCopy for InterpretedStatementResult(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;

  v6 = sub_23F267D84();
  v7 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a1, 1, v6);
  v8 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = sub_23F1217E8(&qword_256DFEB98);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_DWORD *)v12 = *(_DWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_DWORD *)v15 = *(_DWORD *)v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  *((_QWORD *)v15 + 2) = *((_QWORD *)v16 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_DWORD *)v18 = *(_DWORD *)v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    sub_23F1BE0BC((uint64_t)&a1[a3[9]], type metadata accessor for StatementOutcome);
    type metadata accessor for StatementOutcome(0);
    v23 = (char *)&loc_23F23A61C + 4 * byte_23F279F79[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return a1;
}

char *initializeWithTake for InterpretedStatementResult(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;

  v6 = sub_23F267D84();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a2, 1, v6))
  {
    v7 = sub_23F1217E8(&qword_256DFEB98);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *((_QWORD *)v10 + 2) = *((_QWORD *)v11 + 2);
  v12 = &a1[v9];
  v13 = &a2[v9];
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
  v14 = a3[7];
  v15 = a3[8];
  v16 = &a1[v14];
  v17 = &a2[v14];
  *(_OWORD *)v16 = *(_OWORD *)v17;
  v18 = *(_OWORD *)&a2[v15];
  *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
  *(_OWORD *)&a1[v15] = v18;
  v19 = a3[9];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = type metadata accessor for StatementOutcome(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v23 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
      v24 = type metadata accessor for ActionSuccess(0);
      v25 = *(int *)(v24 + 20);
      v26 = &v20[v25];
      v27 = &v21[v25];
      v28 = type metadata accessor for ActionSuccess.UndoContext(0);
      if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v27, 1, v28))
      {
        v29 = sub_23F1217E8(&qword_256DFEBA0);
        memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v26, v27, v6);
        *(_OWORD *)&v26[*(int *)(v28 + 20)] = *(_OWORD *)&v27[*(int *)(v28 + 20)];
        *(_OWORD *)&v26[*(int *)(v28 + 24)] = *(_OWORD *)&v27[*(int *)(v28 + 24)];
        _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v26, 0, 1, v28);
      }
      v20[*(int *)(v24 + 24)] = v21[*(int *)(v24 + 24)];
      goto LABEL_14;
    case 3u:
      *(_OWORD *)v20 = *(_OWORD *)v21;
      v30 = *(int *)(type metadata accessor for ParameterNeedsValue(0) + 20);
      v31 = &v20[v30];
      v32 = &v21[v30];
      v33 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
      goto LABEL_14;
    case 4u:
      *(_OWORD *)v20 = *(_OWORD *)v21;
      *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
      v20[24] = v21[24];
      v34 = (int *)type metadata accessor for ParameterConfirmation(0);
      v35 = v34[6];
      v36 = &v20[v35];
      v37 = &v21[v35];
      v38 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
      *(_OWORD *)&v20[v34[7]] = *(_OWORD *)&v21[v34[7]];
      *(_OWORD *)&v20[v34[8]] = *(_OWORD *)&v21[v34[8]];
      goto LABEL_14;
    case 6u:
      *(_OWORD *)v20 = *(_OWORD *)v21;
      v39 = type metadata accessor for ParameterNotAllowed(0);
      v40 = *(int *)(v39 + 20);
      v41 = &v20[v40];
      v42 = &v21[v40];
      v43 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v41, v42, v43);
      v20[*(int *)(v39 + 24)] = v21[*(int *)(v39 + 24)];
      goto LABEL_14;
    case 7u:
      *(_OWORD *)v20 = *(_OWORD *)v21;
      v44 = *(int *)(type metadata accessor for ParameterCandidatesNotFound(0) + 20);
      v45 = &v20[v44];
      v46 = &v21[v44];
      v47 = sub_23F268078();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 32))(v45, v46, v47);
LABEL_14:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      break;
  }
  return a1;
}

char *assignWithTake for InterpretedStatementResult(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
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
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;

  v6 = sub_23F267D84();
  v7 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a1, 1, v6);
  v8 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = sub_23F1217E8(&qword_256DFEB98);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_DWORD *)v12 = *(_DWORD *)v13;
  v15 = *((_QWORD *)v13 + 1);
  v14 = *((_QWORD *)v13 + 2);
  *((_QWORD *)v12 + 1) = v15;
  *((_QWORD *)v12 + 2) = v14;
  swift_bridgeObjectRelease();
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_DWORD *)v17 = *(_DWORD *)v18;
  v20 = *((_QWORD *)v18 + 1);
  v19 = *((_QWORD *)v18 + 2);
  *((_QWORD *)v17 + 1) = v20;
  *((_QWORD *)v17 + 2) = v19;
  swift_bridgeObjectRelease();
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = &a2[v21];
  *(_DWORD *)v22 = *(_DWORD *)v23;
  v25 = *((_QWORD *)v23 + 1);
  v24 = *((_QWORD *)v23 + 2);
  *((_QWORD *)v22 + 1) = v25;
  *((_QWORD *)v22 + 2) = v24;
  swift_bridgeObjectRelease();
  v26 = a3[8];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v30 = *(_QWORD *)v28;
  v29 = *((_QWORD *)v28 + 1);
  *(_QWORD *)v27 = v30;
  *((_QWORD *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v31 = a3[9];
    v32 = &a1[v31];
    v33 = &a2[v31];
    sub_23F1BE0BC((uint64_t)&a1[v31], type metadata accessor for StatementOutcome);
    v34 = type metadata accessor for StatementOutcome(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v35 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 32))(v32, v33, v35);
        v36 = type metadata accessor for ActionSuccess(0);
        v37 = *(int *)(v36 + 20);
        v38 = &v32[v37];
        v39 = &v33[v37];
        v40 = type metadata accessor for ActionSuccess.UndoContext(0);
        if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v39, 1, v40))
        {
          v41 = sub_23F1217E8(&qword_256DFEBA0);
          memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v38, v39, v6);
          *(_OWORD *)&v38[*(int *)(v40 + 20)] = *(_OWORD *)&v39[*(int *)(v40 + 20)];
          *(_OWORD *)&v38[*(int *)(v40 + 24)] = *(_OWORD *)&v39[*(int *)(v40 + 24)];
          _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v38, 0, 1, v40);
        }
        v32[*(int *)(v36 + 24)] = v33[*(int *)(v36 + 24)];
        goto LABEL_19;
      case 3u:
        *(_OWORD *)v32 = *(_OWORD *)v33;
        v42 = *(int *)(type metadata accessor for ParameterNeedsValue(0) + 20);
        v43 = &v32[v42];
        v44 = &v33[v42];
        v45 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v45 - 8) + 32))(v43, v44, v45);
        goto LABEL_19;
      case 4u:
        *(_OWORD *)v32 = *(_OWORD *)v33;
        *((_QWORD *)v32 + 2) = *((_QWORD *)v33 + 2);
        v32[24] = v33[24];
        v46 = (int *)type metadata accessor for ParameterConfirmation(0);
        v47 = v46[6];
        v48 = &v32[v47];
        v49 = &v33[v47];
        v50 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 32))(v48, v49, v50);
        *(_OWORD *)&v32[v46[7]] = *(_OWORD *)&v33[v46[7]];
        *(_OWORD *)&v32[v46[8]] = *(_OWORD *)&v33[v46[8]];
        goto LABEL_19;
      case 6u:
        *(_OWORD *)v32 = *(_OWORD *)v33;
        v51 = type metadata accessor for ParameterNotAllowed(0);
        v52 = *(int *)(v51 + 20);
        v53 = &v32[v52];
        v54 = &v33[v52];
        v55 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v55 - 8) + 32))(v53, v54, v55);
        v32[*(int *)(v51 + 24)] = v33[*(int *)(v51 + 24)];
        goto LABEL_19;
      case 7u:
        *(_OWORD *)v32 = *(_OWORD *)v33;
        v56 = *(int *)(type metadata accessor for ParameterCandidatesNotFound(0) + 20);
        v57 = &v32[v56];
        v58 = &v33[v56];
        v59 = sub_23F268078();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v59 - 8) + 32))(v57, v58, v59);
LABEL_19:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for InterpretedStatementResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F23B210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F180250();
  sub_23F1217E8(&qword_256DFEB98);
  sub_23F17F9A8();
  if (v6)
  {
    v7 = sub_23F180064();
  }
  else
  {
    if ((_DWORD)v3 == 2147483646)
    {
      sub_23F17FA58(*(_QWORD *)(v4 + *(int *)(a3 + 20) + 16));
      sub_23F12612C();
      return;
    }
    v8 = sub_23F250200();
    v7 = v4 + *(int *)(a3 + 36);
  }
  sub_23F1315B8(v7, v3, v8);
}

uint64_t storeEnumTagSinglePayload for InterpretedStatementResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23B290(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23F180250();
  sub_23F1217E8(&qword_256DFEB98);
  sub_23F17F968();
  if (v6)
  {
    sub_23F18010C();
  }
  else
  {
    if (a3 == 2147483646)
    {
      sub_23F251164(*(int *)(a4 + 20));
      sub_23F12612C();
      return;
    }
    sub_23F250200();
  }
  sub_23F17FE5C();
  sub_23F126098(v7, v8, v9, v10);
}

void sub_23F23B300()
{
  unint64_t v0;
  unint64_t v1;

  sub_23F178624(319, (unint64_t *)&qword_256E005C0, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for StatementOutcome(319);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void assignWithCopy for ActionOutcome(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_23F23B9D4(a1, a2, a3, (uint64_t)type metadata accessor for ActionOutcome, a5, a6, a7, a8, a9, a10, a11, a12);
}

void assignWithTake for ActionOutcome()
{
  sub_23F23BE0C();
}

void _s16IntelligenceFlow16StatementOutcomeOwCP_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t *v12;
  uint64_t v13;
  uint64_t EnumCaseMultiPayload;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_23F125F3C();
  if ((*(_DWORD *)(*(_QWORD *)(v13 - 8) + 80) & 0x20000) != 0)
  {
    sub_23F2507EC(*v12);
    sub_23F125EFC();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23F23B42C + 4 * byte_23F279F94[EnumCaseMultiPayload]))(EnumCaseMultiPayload, v15, v16, v17, v18, v19, v20, v21, a9, a10, a11, a12);
  }
}

void _s16IntelligenceFlow16StatementOutcomeOwxx_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v2 = sub_23F125F84();
      sub_23F1261A8(v2);
      v3 = a1 + *(int *)(type metadata accessor for ActionSuccess(0) + 20);
      v4 = sub_23F2523B8();
      if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v3, 1, v4))
        goto LABEL_15;
      v5 = sub_23F131B8C();
      sub_23F1261A8(v5);
      sub_23F2516DC();
      goto LABEL_17;
    case 1u:
      sub_23F24FF64();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    case 2u:
      sub_23F24FF64();
      goto LABEL_17;
    case 3u:
      sub_23F24FF64();
      type metadata accessor for ParameterNeedsValue(0);
      goto LABEL_12;
    case 4u:
      sub_23F24FF64();
      v6 = a1 + *(int *)(sub_23F250E20() + 24);
      v7 = sub_23F125F84();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
      sub_23F2516DC();
      goto LABEL_17;
    case 5u:
      sub_23F24FF64();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    case 6u:
      sub_23F24FF64();
      sub_23F251618();
      goto LABEL_12;
    case 7u:
      sub_23F24FF64();
      type metadata accessor for ParameterCandidatesNotFound(0);
LABEL_12:
      sub_23F125F84();
      v8 = sub_23F2507B8();
      v9(v8);
      return;
    case 8u:
      sub_23F137248(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
      return;
    case 9u:
      goto LABEL_17;
    case 0xAu:
      if (*(_QWORD *)(a1 + 8) < 0x10uLL)
        goto LABEL_15;
      swift_bridgeObjectRelease();
LABEL_17:
      sub_23F250908();
      break;
    default:
LABEL_15:
      sub_23F12612C();
      break;
  }
}

uint64_t _s16IntelligenceFlow16StatementOutcomeOwcp_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_23F125F3C();
  v12 = sub_23F24FABC();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_23F23B7E4 + 4 * byte_23F279FAA[v12]))(v12, v13, v14, v15, v16, v17, v18, v19, a9, a10, a11, a12);
}

void sub_23F23B7E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_23F125F84();
  sub_23F126040(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16));
  if (sub_23F24F0E0())
  {
    v2 = sub_23F1217E8(&qword_256DFEBA0);
    sub_23F24FEC0(v2);
  }
  else
  {
    v3 = sub_23F131B8C();
    sub_23F24FAE0(v3);
    sub_23F24F998();
    sub_23F13184C();
    sub_23F24FE98();
  }
  sub_23F24F200();
  swift_storeEnumTagMultiPayload();
  sub_23F125EFC();
}

void assignWithCopy for StatementOutcome(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_23F23B9D4(a1, a2, a3, (uint64_t)type metadata accessor for StatementOutcome, a5, a6, a7, a8, a9, a10, a11, a12);
}

void sub_23F23B9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_23F125F3C();
  if (v12 == v13)
  {
    sub_23F125EFC();
  }
  else
  {
    sub_23F24FEAC(v12, v13, v14, v15);
    v16 = sub_23F24F958();
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_23F23BA1C + 4 * byte_23F279FB5[v16]))(v16, v17, v18, v19, v20, v21, v22, v23, a9, a10, a11, a12);
  }
}

void _s16IntelligenceFlow16StatementOutcomeOwtk_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23F18039C();
  switch(sub_23F24FABC())
  {
    case 0u:
      v2 = sub_23F125F84();
      sub_23F24F4FC(v2);
      if (sub_23F24FAF8())
      {
        v3 = sub_23F1217E8(&qword_256DFEBA0);
        sub_23F17FC68(v3);
      }
      else
      {
        v9 = sub_23F131B8C();
        sub_23F24EF4C(v9);
        sub_23F24FA84();
      }
      sub_23F24F200();
      goto LABEL_11;
    case 3u:
      *(_OWORD *)v0 = *(_OWORD *)v1;
      type metadata accessor for ParameterNeedsValue(0);
      v4 = sub_23F125F84();
      sub_23F17FEF0(v4);
      sub_23F2501B4();
      goto LABEL_11;
    case 4u:
      *(_OWORD *)v0 = *(_OWORD *)v1;
      *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
      *(_BYTE *)(v0 + 24) = *(_BYTE *)(v1 + 24);
      type metadata accessor for ParameterConfirmation(0);
      v5 = sub_23F125F84();
      sub_23F24EF4C(v5);
      sub_23F250084();
      goto LABEL_11;
    case 6u:
      *(_OWORD *)v0 = *(_OWORD *)v1;
      v6 = type metadata accessor for ParameterNotAllowed(0);
      v7 = sub_23F125F84();
      sub_23F24EF4C(v7);
      sub_23F24F45C(*(int *)(v6 + 24));
      goto LABEL_11;
    case 7u:
      *(_OWORD *)v0 = *(_OWORD *)v1;
      type metadata accessor for ParameterCandidatesNotFound(0);
      v8 = sub_23F125F84();
      sub_23F17FEF0(v8);
      sub_23F2501C4();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      sub_23F24F698();
      break;
  }
  sub_23F131680();
}

void assignWithTake for StatementOutcome()
{
  sub_23F23BE0C();
}

void sub_23F23BE0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_23F18039C();
  v5 = v1;
  if (v1 != v2)
  {
    sub_23F24FEAC(v1, v2, v3, v4);
    switch(sub_23F24F958())
    {
      case 0u:
        v6 = sub_23F125F84();
        sub_23F24F4FC(v6);
        if (sub_23F24FAF8())
        {
          v7 = sub_23F1217E8(&qword_256DFEBA0);
          sub_23F17FC68(v7);
        }
        else
        {
          v13 = sub_23F131B8C();
          sub_23F24EF4C(v13);
          sub_23F24FA84();
        }
        sub_23F24F200();
        goto LABEL_12;
      case 3u:
        *(_OWORD *)v5 = *(_OWORD *)v0;
        type metadata accessor for ParameterNeedsValue(0);
        v8 = sub_23F125F84();
        sub_23F17FEF0(v8);
        sub_23F2501B4();
        goto LABEL_12;
      case 4u:
        *(_OWORD *)v5 = *(_OWORD *)v0;
        *(_QWORD *)(v5 + 16) = *(_QWORD *)(v0 + 16);
        *(_BYTE *)(v5 + 24) = *(_BYTE *)(v0 + 24);
        type metadata accessor for ParameterConfirmation(0);
        v9 = sub_23F125F84();
        sub_23F24EF4C(v9);
        sub_23F250084();
        goto LABEL_12;
      case 6u:
        *(_OWORD *)v5 = *(_OWORD *)v0;
        v10 = type metadata accessor for ParameterNotAllowed(0);
        v11 = sub_23F125F84();
        sub_23F24EF4C(v11);
        sub_23F24F45C(*(int *)(v10 + 24));
        goto LABEL_12;
      case 7u:
        *(_OWORD *)v5 = *(_OWORD *)v0;
        type metadata accessor for ParameterCandidatesNotFound(0);
        v12 = sub_23F125F84();
        sub_23F17FEF0(v12);
        sub_23F2501C4();
LABEL_12:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        sub_23F24F698();
        break;
    }
  }
  sub_23F131680();
}

uint64_t sub_23F23BF74()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  result = type metadata accessor for ActionSuccess(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for ParameterNeedsValue(319);
    if (v2 <= 0x3F)
    {
      sub_23F24FED4();
      result = type metadata accessor for ParameterConfirmation(319);
      if (v3 <= 0x3F)
      {
        sub_23F24FED4();
        result = type metadata accessor for ParameterNotAllowed(319);
        if (v4 <= 0x3F)
        {
          sub_23F24FED4();
          result = type metadata accessor for ParameterCandidatesNotFound(319);
          if (v5 <= 0x3F)
          {
            sub_23F24FED4();
            swift_initEnumMetadataMultiPayload();
            return sub_23F24FEF4();
          }
        }
      }
    }
  }
  return result;
}

void sub_23F23C074(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  sub_23F126078();
}

uint64_t assignWithCopy for StatementID(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for StatementID(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatementID(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatementID(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

void type metadata accessor for StatementID()
{
  sub_23F131844();
}

_QWORD *initializeBufferWithCopyOfBuffer for ActionSuccess(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23F268078();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for ActionSuccess.UndoContext(0);
    if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v10, 1, v11))
    {
      v12 = sub_23F1217E8(&qword_256DFEBA0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v14 = sub_23F267D84();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v9, v10, v14);
      v15 = *(int *)(v11 + 20);
      v16 = &v9[v15];
      v17 = &v10[v15];
      v18 = *((_QWORD *)v17 + 1);
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = v18;
      v19 = *(int *)(v11 + 24);
      v20 = &v9[v19];
      v21 = &v10[v19];
      v22 = *((_QWORD *)v21 + 1);
      *(_QWORD *)v20 = *(_QWORD *)v21;
      *((_QWORD *)v20 + 1) = v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v9, 0, 1, v11);
    }
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for ActionSuccess(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v4 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for ActionSuccess.UndoContext(0);
  result = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v5, 1, v6);
  if (!(_DWORD)result)
  {
    v8 = sub_23F267D84();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v5, v8);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ActionSuccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for ActionSuccess.UndoContext(0);
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v9, 1, v10))
  {
    v11 = sub_23F1217E8(&qword_256DFEBA0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = sub_23F267D84();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
    v13 = *(int *)(v10 + 20);
    v14 = &v8[v13];
    v15 = &v9[v13];
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v16;
    v17 = *(int *)(v10 + 24);
    v18 = &v8[v17];
    v19 = &v9[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v8, 0, 1, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for ActionSuccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for ActionSuccess.UndoContext(0);
  v11 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v8, 1, v10);
  v12 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v9, 1, v10);
  if (!v11)
  {
    if (!v12)
    {
      v22 = sub_23F267D84();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v8, v9, v22);
      v23 = *(int *)(v10 + 20);
      v24 = &v8[v23];
      v25 = &v9[v23];
      *(_QWORD *)v24 = *(_QWORD *)v25;
      *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v26 = *(int *)(v10 + 24);
      v27 = &v8[v26];
      v28 = &v9[v26];
      *(_QWORD *)v27 = *(_QWORD *)v28;
      *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_23F1BE0BC((uint64_t)v8, type metadata accessor for ActionSuccess.UndoContext);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v20 = sub_23F1217E8(&qword_256DFEBA0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  v13 = sub_23F267D84();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v8, v9, v13);
  v14 = *(int *)(v10 + 20);
  v15 = &v8[v14];
  v16 = &v9[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  v17 = *(int *)(v10 + 24);
  v18 = &v8[v17];
  v19 = &v9[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v8, 0, 1, v10);
LABEL_7:
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for ActionSuccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for ActionSuccess.UndoContext(0);
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v9, 1, v10))
  {
    v11 = sub_23F1217E8(&qword_256DFEBA0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = sub_23F267D84();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v8, v9, v12);
    *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
    *(_OWORD *)&v8[*(int *)(v10 + 24)] = *(_OWORD *)&v9[*(int *)(v10 + 24)];
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v8, 0, 1, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for ActionSuccess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for ActionSuccess.UndoContext(0);
  v11 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v8, 1, v10);
  v12 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v9, 1, v10);
  if (!v11)
  {
    if (!v12)
    {
      v16 = sub_23F267D84();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v8, v9, v16);
      v17 = *(int *)(v10 + 20);
      v18 = &v8[v17];
      v19 = &v9[v17];
      v21 = *(_QWORD *)v19;
      v20 = *((_QWORD *)v19 + 1);
      *(_QWORD *)v18 = v21;
      *((_QWORD *)v18 + 1) = v20;
      swift_bridgeObjectRelease();
      v22 = *(int *)(v10 + 24);
      v23 = &v8[v22];
      v24 = &v9[v22];
      v26 = *(_QWORD *)v24;
      v25 = *((_QWORD *)v24 + 1);
      *(_QWORD *)v23 = v26;
      *((_QWORD *)v23 + 1) = v25;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_23F1BE0BC((uint64_t)v8, type metadata accessor for ActionSuccess.UndoContext);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = sub_23F1217E8(&qword_256DFEBA0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v13 = sub_23F267D84();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v8, v9, v13);
  *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
  *(_OWORD *)&v8[*(int *)(v10 + 24)] = *(_OWORD *)&v9[*(int *)(v10 + 24)];
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v8, 0, 1, v10);
LABEL_7:
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionSuccess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F23C95C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  sub_23F125F84();
  sub_23F17F9A8();
  if (v5)
  {
    v3 = sub_23F180064();
  }
  else
  {
    sub_23F1217E8(&qword_256DFEBA0);
    sub_23F17F9A8();
    if (!v5)
    {
      sub_23F12612C();
      return;
    }
    v3 = sub_23F2502CC();
  }
  sub_23F1315B8(v3, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ActionSuccess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23C9F0(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_23F125F84();
  sub_23F17F968();
  if (v7)
  {
    sub_23F18010C();
  }
  else
  {
    sub_23F1217E8(&qword_256DFEBA0);
    sub_23F17F968();
    if (!v7)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
      sub_23F12612C();
      return;
    }
    sub_23F2502CC();
  }
  sub_23F17FE5C();
  sub_23F126098(v8, v9, v10, v11);
}

void sub_23F23CA60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F23CA84(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], qword_256E069A8, (void (*)(uint64_t))type metadata accessor for ActionSuccess.UndoContext);
}

void sub_23F23CA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), unint64_t *a5, void (*a6)(uint64_t))
{
  unint64_t v8;
  unint64_t v9;

  sub_23F250C84(a1, a2, a3, a4);
  if (v8 <= 0x3F)
  {
    sub_23F2515F8();
    sub_23F178624(319, a5, a6);
    if (v9 <= 0x3F)
    {
      sub_23F24FED4();
      sub_23F24F6B8();
      sub_23F24FEF4();
    }
  }
  sub_23F250454();
}

uint64_t *initializeBufferWithCopyOfBuffer for ActionSuccess.UndoContext(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_23F267D84();
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

uint64_t destroy for ActionSuccess.UndoContext(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActionSuccess.UndoContext(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_23F267D84();
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

uint64_t assignWithCopy for ActionSuccess.UndoContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_23F267D84();
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

uint64_t initializeWithTake for ActionSuccess.UndoContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for ActionSuccess.UndoContext(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_23F267D84();
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

uint64_t getEnumTagSinglePayload for ActionSuccess.UndoContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F23CE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F131B8C();
  sub_23F1A9650();
  if (v5)
  {
    v6 = sub_23F1A96A4();
    sub_23F1315B8(v6, v7, v8);
  }
  else
  {
    sub_23F13188C(*(_QWORD *)(a1 + *(int *)(a3 + 20) + 8));
    sub_23F12612C();
  }
}

uint64_t storeEnumTagSinglePayload for ActionSuccess.UndoContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23CE74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_23F131B8C();
  sub_23F17F968();
  if (v5)
  {
    v6 = sub_23F1A92F4();
    sub_23F126098(v6, v7, v8, v9);
  }
  else
  {
    sub_23F25004C(*(int *)(a4 + 20));
    sub_23F12612C();
  }
}

void sub_23F23CEBC()
{
  sub_23F23CECC();
}

void sub_23F23CECC()
{
  unint64_t v0;

  sub_23F2520B4();
  if (v0 <= 0x3F)
  {
    sub_23F24FED4();
    sub_23F24F6B8();
    sub_23F24FEF4();
  }
  sub_23F250454();
}

void initializeBufferWithCopyOfBuffer for ActionRequirement(uint64_t a1, uint64_t a2)
{
  sub_23F23D070(a1, a2);
}

uint64_t destroy for ActionRequirement(uint64_t a1)
{
  return sub_23F137248(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void assignWithCopy for ActionRequirement(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_23F23D0B0(a1, a2, a3, (uint64_t)sub_23F135CB4, (void (*)(uint64_t, uint64_t, uint64_t))sub_23F137248);
}

void assignWithTake for ActionRequirement(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  sub_23F23D10C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_23F137248);
}

uint64_t getEnumTagSinglePayload for ActionRequirement(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x3D && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 60;
    }
    else
    {
      v2 = (*(_BYTE *)(a1 + 16) & 0x3C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x3F;
      if (v2 >= 0x3C)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for ActionRequirement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3C)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 61;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3D)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3D)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_23F23CFF4(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 16) >> 6;
  if (v1 == 3)
    return (*(_DWORD *)a1 + 3);
  else
    return v1;
}

uint64_t sub_23F23D010(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_23F23D020(uint64_t result, unsigned int a2)
{
  char v2;

  if (a2 < 3)
  {
    v2 = *(_BYTE *)(result + 16) & 3 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    v2 = -64;
  }
  *(_BYTE *)(result + 16) = v2;
  return result;
}

void type metadata accessor for ActionRequirement()
{
  sub_23F131844();
}

void initializeBufferWithCopyOfBuffer for SystemRequirement(uint64_t a1, uint64_t a2)
{
  sub_23F23D070(a1, a2);
}

uint64_t destroy for SystemRequirement(uint64_t a1)
{
  return sub_23F13725C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_23F23D070(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  void (*v7)(uint64_t);

  v6 = sub_23F250C68(a1, a2);
  v7(v6);
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  *(_BYTE *)(v2 + 16) = v5;
  sub_23F12612C();
}

void assignWithCopy for SystemRequirement(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  sub_23F23D0B0(a1, a2, a3, (uint64_t)sub_23F135CC8, (void (*)(uint64_t, uint64_t, uint64_t))sub_23F13725C);
}

void sub_23F23D0B0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = *a2;
  v8 = a2[1];
  v9 = *((_BYTE *)a2 + 16);
  sub_23F250DE4();
  v10();
  v11 = *a1;
  v12 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  v13 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v9;
  a5(v11, v12, v13);
  sub_23F131ABC();
}

void assignWithTake for SystemRequirement(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  sub_23F23D10C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_23F13725C);
}

void sub_23F23D10C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_BYTE *)(a2 + 16);
  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v8 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v5;
  a4(v6, v7, v8);
  sub_23F126078();
}

uint64_t _s16IntelligenceFlow22SystemPromptResolutionV15ResolutionInputOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return sub_23F180230(-1);
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return sub_23F180230(*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 > 2)
    return sub_23F180230(v3 ^ 0xFF);
  else
    return sub_23F180230(-1);
}

uint64_t _s16IntelligenceFlow22SystemPromptResolutionV15ResolutionInputOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23F23D1CC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23F23D1E4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

void type metadata accessor for SystemRequirement()
{
  sub_23F131844();
}

void type metadata accessor for SystemRequirement.ProtectedAppRequest()
{
  sub_23F131844();
}

void type metadata accessor for SystemRequirement.AuthenticationRequest()
{
  sub_23F131844();
}

void type metadata accessor for SystemRequirement.AuthenticationRequest.AuthenticationLevel()
{
  sub_23F131844();
}

void type metadata accessor for AppRequirement()
{
  sub_23F131844();
}

void type metadata accessor for PermissionRequirement()
{
  sub_23F131844();
}

unint64_t destroy for ActionFailure(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0x10)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for ActionFailure(_QWORD *a1, _QWORD *a2)
{
  unint64_t v3;
  __int128 v4;
  uint64_t v5;

  v3 = a2[1];
  if (v3 >= 0x10)
  {
    *a1 = *a2;
    a1[1] = v3;
    v5 = a2[3];
    a1[2] = a2[2];
    a1[3] = v5;
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v4;
    a1[4] = a2[4];
  }
  return a1;
}

_QWORD *assignWithCopy for ActionFailure(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;

  v4 = a2[1];
  if (a1[1] >= 0x10uLL)
  {
    if (v4 >= 0x10)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v7 = a2[4];
    }
    else
    {
      sub_23F23D3E0((uint64_t)a1);
      v7 = a2[4];
      v8 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v8;
    }
    a1[4] = v7;
  }
  else if (v4 >= 0x10)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    a1[4] = a2[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v5 = *(_OWORD *)a2;
    v6 = *((_OWORD *)a2 + 1);
    a1[4] = a2[4];
    *(_OWORD *)a1 = v5;
    *((_OWORD *)a1 + 1) = v6;
  }
  return a1;
}

uint64_t sub_23F23D3E0(uint64_t a1)
{
  destroy for ActionFailure.DeveloperDefinedError(a1, &type metadata for ActionFailure.DeveloperDefinedError);
  return a1;
}

_QWORD *assignWithTake for ActionFailure(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  __int128 v5;
  uint64_t v6;

  if (a1[1] >= 0x10uLL)
  {
    v4 = a2[1];
    if (v4 >= 0x10)
    {
      *a1 = *a2;
      a1[1] = v4;
      swift_bridgeObjectRelease();
      v6 = a2[3];
      a1[2] = a2[2];
      a1[3] = v6;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_23F23D3E0((uint64_t)a1);
  }
  v5 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v5;
LABEL_6:
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionFailure(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 > 0x7FFFFFEF && *(_BYTE *)(a1 + 40))
    {
      v2 = *(_DWORD *)a1 + 2147483631;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 16;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActionFailure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFEF)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 2147483632;
    if (a3 > 0x7FFFFFEF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 > 0x7FFFFFEF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 15;
  }
  return result;
}

void type metadata accessor for ActionFailure()
{
  sub_23F131844();
}

unint64_t destroy for ActionFailure.Failure(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ActionFailure.Failure(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  __int128 v5;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    v4 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for ActionFailure.Failure(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      a1[4] = a2[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    v5 = *(_OWORD *)a2;
    v6 = *((_OWORD *)a2 + 1);
    a1[4] = a2[4];
    *(_OWORD *)a1 = v5;
    *((_OWORD *)a1 + 1) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t assignWithTake for ActionFailure.Failure(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_6;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionFailure.Failure(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFF0 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 2147483632);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 15;
  if (v4 >= 0x11)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ActionFailure.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFEF)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2147483632;
    if (a3 >= 0x7FFFFFF0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF0)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 15;
  }
  return result;
}

uint64_t sub_23F23D810(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

double sub_23F23D828(uint64_t a1, int a2)
{
  double result;

  if (a2 < 0)
  {
    result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
  }
  return result;
}

void type metadata accessor for ActionFailure.Failure()
{
  sub_23F131844();
}

_QWORD *initializeWithCopy for ActionFailure.DeveloperDefinedError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ActionFailure.DeveloperDefinedError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

_QWORD *assignWithTake for ActionFailure.DeveloperDefinedError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

void type metadata accessor for ActionFailure.DeveloperDefinedError()
{
  sub_23F131844();
}

void type metadata accessor for ActionConfirmation()
{
  sub_23F131844();
}

uint64_t *initializeBufferWithCopyOfBuffer for ParameterValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23F268078();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    *(_QWORD *)v9 = *(_QWORD *)v10;
    *((_WORD *)v9 + 4) = *((_WORD *)v10 + 4);
  }
  return a1;
}

uint64_t initializeWithCopy for ParameterValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t assignWithCopy for ParameterValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_WORD *)(v9 + 8);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_WORD *)(v8 + 8) = v10;
  return a1;
}

uint64_t initializeWithTake for ParameterValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t assignWithTake for ParameterValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_WORD *)(v8 + 8) = *(_WORD *)(v9 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParameterValue()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ParameterValue()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23DBF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F22B424(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18]);
}

uint64_t getEnumTagSinglePayload for PromptSelection(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PromptSelection(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_23F23DC54(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23F23DC70(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 8) = v2;
  return result;
}

void type metadata accessor for PromptSelection()
{
  sub_23F131844();
}

uint64_t getEnumTagSinglePayload for ParameterNeedsValue()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ParameterNeedsValue()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23DCBC()
{
  sub_23F23E994();
}

_QWORD *initializeBufferWithCopyOfBuffer for ParameterConfirmation(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v8 = a3[6];
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_23F268078();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    v14 = a3[8];
    v15 = (_QWORD *)((char *)v4 + v13);
    v16 = (uint64_t *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (_QWORD *)((char *)v4 + v14);
    v19 = (uint64_t *)((char *)a2 + v14);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ParameterConfirmation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ParameterConfirmation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23F268078();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (_QWORD *)(a1 + v13);
  v18 = (_QWORD *)(a2 + v13);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParameterConfirmation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[8];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ParameterConfirmation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  return a1;
}

uint64_t assignWithTake for ParameterConfirmation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ParameterConfirmation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F23E128()
{
  sub_23F2407BC();
}

uint64_t storeEnumTagSinglePayload for ParameterConfirmation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23E140()
{
  sub_23F240824();
}

uint64_t sub_23F23E14C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23F268078();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for ParameterDisambiguation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ParameterDisambiguation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParameterDisambiguation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ParameterDisambiguation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for ParameterDisambiguation()
{
  sub_23F131844();
}

void type metadata accessor for ValueDisambiguation()
{
  sub_23F131844();
}

_QWORD *initializeBufferWithCopyOfBuffer for ParameterNotAllowed(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23F268078();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

_QWORD *initializeWithCopy for ParameterNotAllowed(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23F268078();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithCopy for ParameterNotAllowed(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23F268078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *initializeWithTake for ParameterNotAllowed(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23F268078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for ParameterNotAllowed(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23F268078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for ParameterNotAllowed()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ParameterNotAllowed()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F23E694()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23F268078();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for ParameterNotAllowed.Reason()
{
  sub_23F131844();
}

void _s16IntelligenceFlow14MessagePayloadO29StepExecutedWithReturnedValueVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    sub_23F2507EC(*a2);
  }
  else
  {
    v3 = a2[1];
    *a1 = *a2;
    a1[1] = v3;
    sub_23F125F84();
    sub_23F1315C4();
    sub_23F2515D0();
  }
  sub_23F131ABC();
}

uint64_t _s16IntelligenceFlow14MessagePayloadO29StepExecutedWithReturnedValueVwxx_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  sub_23F180250();
  destroy for MessagePayload.SpeechQuery.Candidate();
  sub_23F125F84();
  v0 = sub_23F2507B8();
  return sub_23F250CA4(v0, v1, v2);
}

void _s16IntelligenceFlow14MessagePayloadO29StepExecutedWithReturnedValueVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  sub_23F125F84();
  sub_23F1315C4();
  sub_23F2515D0();
  sub_23F131ABC();
}

void _s16IntelligenceFlow14MessagePayloadO29StepExecutedWithReturnedValueVwca_0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_23F2511B8();
  *v2 = *v1;
  *(_QWORD *)(v0 + 8) = v1[1];
  swift_bridgeObjectRetain();
  sub_23F1262C0();
  v3 = sub_23F125F84();
  sub_23F143964(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 24));
  sub_23F12612C();
}

void _s16IntelligenceFlow14MessagePayloadO29StepExecutedWithReturnedValueVwtk_0(_OWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  *a1 = *a2;
  sub_23F125F84();
  v2 = sub_23F25239C();
  sub_23F126040(v2, v3);
  sub_23F12612C();
}

void _s16IntelligenceFlow14MessagePayloadO29StepExecutedWithReturnedValueVwta_0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F2511B8();
  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  swift_bridgeObjectRelease();
  v3 = sub_23F125F84();
  sub_23F143964(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  sub_23F12612C();
}

uint64_t getEnumTagSinglePayload for ParameterCandidatesNotFound()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F23E8FC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23F2509A4();
  if (v1)
  {
    sub_23F13188C(*(_QWORD *)(v0 + 8));
    sub_23F12612C();
  }
  else
  {
    sub_23F125F84();
    v2 = sub_23F24FEE0();
    sub_23F1315B8(v2, v3, v4);
  }
}

uint64_t storeEnumTagSinglePayload for ParameterCandidatesNotFound()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23E94C()
{
  int v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23F131BA4();
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_23F12612C();
  }
  else
  {
    sub_23F125F84();
    sub_23F17FE5C();
    sub_23F126098(v3, v4, v5, v6);
  }
}

void sub_23F23E994()
{
  unint64_t v0;

  sub_23F268078();
  if (v0 <= 0x3F)
  {
    sub_23F2515F8();
    sub_23F250AA4();
    sub_23F24FEF4();
  }
  sub_23F1A9BE8();
}

uint64_t _s16IntelligenceFlow14MessagePayloadO12SessionErrorVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return sub_23F180230(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return sub_23F180230(v2);
}

uint64_t sub_23F23EA18(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      return sub_23F251FF4(result);
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ToolDisambiguation()
{
  sub_23F131844();
}

uint64_t _s16IntelligenceFlow27AppIntentsInvocationPreviewVwxx_0()
{
  destroy for MessagePayload.SpeechQuery.Candidate();
  swift_bridgeObjectRelease();
  return sub_23F15E420();
}

void _s16IntelligenceFlow27AppIntentsInvocationPreviewVwcp_0(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  sub_23F251384(a1, a2);
  v4 = v3[3];
  v2[2] = v3[2];
  v2[3] = v4;
  v2[4] = v3[4];
  swift_bridgeObjectRetain();
  sub_23F1315C4();
  sub_23F131798();
  sub_23F12612C();
}

void _s16IntelligenceFlow27AppIntentsInvocationPreviewVwca_0(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  sub_23F24F5F4(a1, a2);
  sub_23F131A30();
  v3[2] = v2[2];
  v3[3] = v2[3];
  swift_bridgeObjectRetain();
  sub_23F131A30();
  v3[4] = v2[4];
  swift_bridgeObjectRetain();
  sub_23F1318B8();
  sub_23F12612C();
}

void _s16IntelligenceFlow27AppIntentsInvocationPreviewVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_23F2509C0(a1, a2);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v2 + 24);
  swift_bridgeObjectRelease();
  sub_23F126078();
}

uint64_t _s16IntelligenceFlow27AppIntentsInvocationPreviewVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return sub_23F180230(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return sub_23F180230(v2);
}

uint64_t sub_23F23EB8C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return sub_23F250294(result, a2);
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      return sub_23F250294(result, a2);
  }
  return result;
}

void type metadata accessor for AppIntentsInvocationPreview()
{
  sub_23F131844();
}

uint64_t destroy for AppIntentsInvocationPreview.Parameter()
{
  swift_bridgeObjectRelease();
  return sub_23F131110();
}

uint64_t initializeWithCopy for AppIntentsInvocationPreview.Parameter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_23F131104();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for AppIntentsInvocationPreview.Parameter(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v2[2];
  v5 = v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  sub_23F131104();
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = (_BYTE)v2;
  sub_23F131110();
  return a1;
}

uint64_t assignWithTake for AppIntentsInvocationPreview.Parameter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v5;
  sub_23F131110();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppIntentsInvocationPreview.Parameter(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppIntentsInvocationPreview.Parameter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for AppIntentsInvocationPreview.Parameter()
{
  sub_23F131844();
}

uint64_t destroy for AppIntentsInvocationPreview.Parameter.Value()
{
  return sub_23F131110();
}

void _s16IntelligenceFlow27AppIntentsInvocationPreviewV9ParameterV5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  sub_23F250C68(a1, a2);
  sub_23F131104();
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  *(_BYTE *)(v2 + 16) = v5;
  sub_23F12612C();
}

uint64_t assignWithCopy for AppIntentsInvocationPreview.Parameter.Value(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23F131104();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23F131110();
  return a1;
}

uint64_t assignWithTake for AppIntentsInvocationPreview.Parameter.Value(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23F131110();
  return a1;
}

void type metadata accessor for AppIntentsInvocationPreview.Parameter.Value()
{
  sub_23F131844();
}

uint64_t _s16IntelligenceFlow14MessagePayloadO14RequestContentO11TextContentVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return sub_23F180230(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return sub_23F180230(v2);
}

uint64_t sub_23F23EED0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return sub_23F250294(result, a2);
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      return sub_23F250294(result, a2);
  }
  return result;
}

void type metadata accessor for AppIntentsInvocationPreview.Parameter.Value.StringValue()
{
  sub_23F131844();
}

void type metadata accessor for AppIntentsInvocationPreview.Parameter.Value.ArrayValue()
{
  sub_23F131844();
}

void type metadata accessor for PlannerPromptData()
{
  sub_23F131844();
}

_QWORD *initializeBufferWithCopyOfBuffer for PlannerPromptData.OnScreenContextValue(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    v7 = sub_23F268078();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t initializeWithCopy for PlannerPromptData.OnScreenContextValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for PlannerPromptData.OnScreenContextValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for PlannerPromptData.OnScreenContextValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for PlannerPromptData.OnScreenContextValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for PlannerPromptData.OnScreenContextValue()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F23F12C()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F125F84();
  sub_23F1A9650();
  if (v0)
  {
    v1 = sub_23F1A96A4();
    sub_23F1315B8(v1, v2, v3);
  }
  else
  {
    sub_23F12612C();
  }
}

uint64_t storeEnumTagSinglePayload for PlannerPromptData.OnScreenContextValue()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F23F188(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_23F125F84();
  sub_23F17F968();
  if (v7)
  {
    v8 = sub_23F1A92F4();
    sub_23F126098(v8, v9, v10, v11);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 6;
    sub_23F12612C();
  }
}

void sub_23F23F1D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F22B424(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18]);
}

void type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType()
{
  sub_23F131844();
}

uint64_t initializeBufferWithCopyOfBuffer for PlannerPromptData.Tool(uint64_t *a1, uint64_t *a2)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(type metadata accessor for PlannerPromptData.Tool.Definition(0) - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23F23F260 + 4 * byte_23F279FD0[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for PlannerPromptData.Tool(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for PlannerPromptData.Tool.Definition(0);
  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      goto LABEL_4;
    case 2:
      v3 = sub_23F2680D8();
      goto LABEL_5;
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 += *(int *)(type metadata accessor for PlannerPromptData.Tool.Definition.UIControlTool(0) + 24);
LABEL_4:
      v3 = sub_23F26800C();
LABEL_5:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for PlannerPromptData.Tool()
{
  char *v0;

  type metadata accessor for PlannerPromptData.Tool.Definition(0);
  v0 = (char *)sub_23F23F4AC + 4 * byte_23F279FD8[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23F23F4AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23F26800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for PlannerPromptData.Tool(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23F1BE0BC(result, type metadata accessor for PlannerPromptData.Tool.Definition);
    type metadata accessor for PlannerPromptData.Tool.Definition(0);
    v2 = (char *)&loc_23F23F644 + 4 * byte_23F279FDC[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void initializeWithTake for PlannerPromptData.Tool()
{
  char *v0;

  type metadata accessor for PlannerPromptData.Tool.Definition(0);
  v0 = (char *)sub_23F23F7D8 + 4 * byte_23F279FE0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23F23F7D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23F26800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for PlannerPromptData.Tool(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23F1BE0BC(result, type metadata accessor for PlannerPromptData.Tool.Definition);
    type metadata accessor for PlannerPromptData.Tool.Definition(0);
    v2 = (char *)&loc_23F23F8D8 + 4 * byte_23F279FE4[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PlannerPromptData.Tool()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F23F978()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F250F54();
  v0 = sub_23F1A99EC();
  return sub_23F1A9568(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for PlannerPromptData.Tool()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F23F9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F250F54();
  v0 = sub_23F1A92F4();
  return sub_23F1A9570(v0, v1, v2, v3);
}

void sub_23F23F9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F23F9C8(a1, a2, a3, type metadata accessor for PlannerPromptData.Tool.Definition);
}

void sub_23F23F9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  unint64_t v4;

  sub_23F250C84(a1, a2, a3, a4);
  if (v4 <= 0x3F)
  {
    sub_23F2515F8();
    swift_initStructMetadata();
    sub_23F24FEF4();
  }
  sub_23F1A9BE8();
}

uint64_t initializeBufferWithCopyOfBuffer for PlannerPromptData.Tool.Definition(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23F23FA70 + 4 * byte_23F279FE8[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for PlannerPromptData.Tool.Definition(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
      goto LABEL_4;
    case 2:
      v3 = sub_23F2680D8();
      goto LABEL_5;
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 += *(int *)(type metadata accessor for PlannerPromptData.Tool.Definition.UIControlTool(0) + 24);
LABEL_4:
      v3 = sub_23F26800C();
LABEL_5:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for PlannerPromptData.Tool.Definition()
{
  char *v0;

  v0 = (char *)sub_23F23FCA4 + 4 * byte_23F279FF0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23F23FCA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23F26800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for PlannerPromptData.Tool.Definition(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23F1BE0BC(result, type metadata accessor for PlannerPromptData.Tool.Definition);
    v2 = (char *)&loc_23F23FE34 + 4 * byte_23F279FF4[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void initializeWithTake for PlannerPromptData.Tool.Definition()
{
  char *v0;

  v0 = (char *)sub_23F23FFC0 + 4 * byte_23F279FF8[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23F23FFC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_23F26800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for PlannerPromptData.Tool.Definition(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23F1BE0BC(result, type metadata accessor for PlannerPromptData.Tool.Definition);
    v2 = (char *)&loc_23F2400B8 + 4 * byte_23F279FFC[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_23F24014C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_23F26800C();
  if (v1 <= 0x3F)
  {
    result = sub_23F2680D8();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for PlannerPromptData.Tool.Definition.UIControlTool(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PlannerPromptData.Tool.Definition.ToolDefinition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23F2402C0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEB8FE0]);
}

uint64_t destroy for PlannerPromptData.Tool.Definition.ToolDefinition(uint64_t a1, uint64_t a2)
{
  return sub_23F2402F4(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BEB8FE0]);
}

void initializeWithCopy for PlannerPromptData.Tool.Definition.ToolDefinition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F240320(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEB8FE0]);
}

void assignWithCopy for PlannerPromptData.Tool.Definition.ToolDefinition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F240358(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEB8FE0]);
}

void initializeWithTake for PlannerPromptData.Tool.Definition.ToolDefinition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F240390(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEB8FE0]);
}

void assignWithTake for PlannerPromptData.Tool.Definition.ToolDefinition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F2403BC(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEB8FE0]);
}

uint64_t getEnumTagSinglePayload for PlannerPromptData.Tool.Definition.ToolDefinition()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F24023C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F2505F4();
  v0 = sub_23F1A99EC();
  return sub_23F1A9568(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for PlannerPromptData.Tool.Definition.ToolDefinition()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F24026C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F2505F4();
  v0 = sub_23F1A92F4();
  return sub_23F1A9570(v0, v1, v2, v3);
}

void sub_23F240290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F23F9C8(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8FE0]);
}

uint64_t getEnumTagSinglePayload for PlannerPromptData.Tool.Definition.ClientAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for PlannerPromptData.Tool.Definition.ClientAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t initializeBufferWithCopyOfBuffer for PlannerPromptData.Tool.Definition.AssistantSchema(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23F2402C0(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEBA5E0]);
}

uint64_t sub_23F2402C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  sub_23F24F83C(a1, a2, a3, a4);
  v4 = sub_23F17FE50();
  return sub_23F126180(v4, v5, v6, v7);
}

uint64_t destroy for PlannerPromptData.Tool.Definition.AssistantSchema(uint64_t a1, uint64_t a2)
{
  return sub_23F2402F4(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BEBA5E0]);
}

uint64_t sub_23F2402F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  sub_23F2505FC(a1, a2, a3);
  v3 = sub_23F2507B8();
  return sub_23F250CA4(v3, v4, v5);
}

void initializeWithCopy for PlannerPromptData.Tool.Definition.AssistantSchema(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F240320(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEBA5E0]);
}

void sub_23F240320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = sub_23F24F83C(a1, a2, a3, a4);
  sub_23F12619C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  sub_23F126078();
}

void assignWithCopy for PlannerPromptData.Tool.Definition.AssistantSchema(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F240358(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEBA5E0]);
}

void sub_23F240358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = sub_23F24F83C(a1, a2, a3, a4);
  sub_23F12619C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24));
  sub_23F126078();
}

void initializeWithTake for PlannerPromptData.Tool.Definition.AssistantSchema(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F240390(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEBA5E0]);
}

void sub_23F240390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = sub_23F24F83C(a1, a2, a3, a4);
  sub_23F24F1C0(v4);
  sub_23F126078();
}

void assignWithTake for PlannerPromptData.Tool.Definition.AssistantSchema(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F2403BC(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BEBA5E0]);
}

void sub_23F2403BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  v4 = sub_23F24F83C(a1, a2, a3, a4);
  sub_23F12619C(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40));
  sub_23F126078();
}

uint64_t getEnumTagSinglePayload for PlannerPromptData.Tool.Definition.AssistantSchema()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F2403F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F250F64();
  v0 = sub_23F1A99EC();
  return sub_23F1A9568(v0, v1, v2);
}

uint64_t storeEnumTagSinglePayload for PlannerPromptData.Tool.Definition.AssistantSchema()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F24041C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F250F64();
  v0 = sub_23F1A92F4();
  return sub_23F1A9570(v0, v1, v2, v3);
}

void sub_23F240438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F23F9C8(a1, a2, a3, (uint64_t (*)(uint64_t))MEMORY[0x24BEBA5E0]);
}

uint64_t *initializeBufferWithCopyOfBuffer for PlannerPromptData.Tool.Definition.UIControlTool(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    v11 = sub_23F26800C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v10, v9, v11);
  }
  return v3;
}

uint64_t destroy for PlannerPromptData.Tool.Definition.UIControlTool(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23F26800C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for PlannerPromptData.Tool.Definition.UIControlTool(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = sub_23F26800C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v9, v8, v10);
  return a1;
}

_QWORD *assignWithCopy for PlannerPromptData.Tool.Definition.UIControlTool(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23F26800C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for PlannerPromptData.Tool.Definition.UIControlTool(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_23F26800C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *assignWithTake for PlannerPromptData.Tool.Definition.UIControlTool(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 24);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_23F26800C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlannerPromptData.Tool.Definition.UIControlTool()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_23F2407B0()
{
  sub_23F2407BC();
}

void sub_23F2407BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23F2509A4();
  if (v4)
  {
    sub_23F13188C(*(_QWORD *)(v0 + 8));
    sub_23F12612C();
  }
  else
  {
    v5 = v2;
    v6 = v1;
    v7 = v3(0);
    sub_23F1315B8(v0 + *(int *)(v5 + 24), v6, v7);
  }
}

uint64_t storeEnumTagSinglePayload for PlannerPromptData.Tool.Definition.UIControlTool()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F240818()
{
  sub_23F240824();
}

void sub_23F240824()
{
  int v0;
  uint64_t v1;
  void (*v2)(_QWORD);
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_23F131BA4();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_23F12612C();
  }
  else
  {
    v2(0);
    sub_23F17FE5C();
    sub_23F126098(v4, v5, v6, v7);
  }
}

uint64_t sub_23F240870()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23F26800C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s16IntelligenceFlow13ActionFailureV21DeveloperDefinedErrorVwxx_0()
{
  destroy for MessagePayload.SpeechQuery.Candidate();
  return sub_23F15E420();
}

_QWORD *initializeWithCopy for PlannerPromptData.Tool.Definition.UIControlTool.Command(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PlannerPromptData.Tool.Definition.UIControlTool.Command(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for PlannerPromptData.Tool.Definition.UIControlTool.Command(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for PlannerPromptData.Tool.Definition.UIControlTool.Command()
{
  sub_23F131844();
}

uint64_t _s16IntelligenceFlow14MessagePayloadO35ExternalAgentRequestRewriteMetadataVwxx_0()
{
  destroy for MessagePayload.SpeechQuery.Candidate();
  return sub_23F15E420();
}

void _s16IntelligenceFlow14MessagePayloadO35ExternalAgentRequestRewriteMetadataVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_23F251384(a1, a2);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  sub_23F1315C4();
  sub_23F126078();
}

void _s16IntelligenceFlow14MessagePayloadO35ExternalAgentRequestRewriteMetadataVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  sub_23F24F5F4(a1, a2);
  sub_23F131A30();
  sub_23F251684(*(_QWORD *)(v2 + 16));
  sub_23F1318B8();
  sub_23F12612C();
}

void _s16IntelligenceFlow14MessagePayloadO35ExternalAgentRequestRewriteMetadataVwta_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  destroy for MessagePayload.SpeechQuery.Candidate();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  sub_23F126078();
}

uint64_t _s16IntelligenceFlow14MessagePayloadO35ExternalAgentRequestRewriteMetadataVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return sub_23F180230(-1);
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2 >= 0xFFFFFFFF)
      LODWORD(v2) = -1;
  }
  return sub_23F180230(v2);
}

uint64_t sub_23F240AFC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      return sub_23F251FF4(result);
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return sub_23F250294(result, a2);
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      return sub_23F250294(result, a2);
  }
  return result;
}

void type metadata accessor for ActionResolutionUpdate()
{
  sub_23F131844();
}

ValueMetadata *type metadata accessor for ActionResolutionUpdate.CodingKeys()
{
  return &type metadata for ActionResolutionUpdate.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.CodingKeys()
{
  return &type metadata for PlannerPromptData.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.CodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.CodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.ToolCodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.ToolCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.ClientActionCodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.ClientActionCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.AssistantSchemaCodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.AssistantSchemaCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.UiControlCodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.UiControlCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.UIControlTool.CodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.UIControlTool.Command.CodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.Command.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.AssistantSchema.CodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.AssistantSchema.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.ClientAction.CodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.ClientAction.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.Tool.Definition.ToolDefinition.CodingKeys()
{
  return &type metadata for PlannerPromptData.Tool.Definition.ToolDefinition.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.CodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.CodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.CodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.InFocusAppCodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.InFocusAppCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenPersonCodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenPersonCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPostalAddressCodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPostalAddressCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentAppEntityCodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentAppEntityCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentEmailAddressCodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentEmailAddressCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPhoneNumberCodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPhoneNumberCodingKeys;
}

ValueMetadata *type metadata accessor for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentUriLinkCodingKeys()
{
  return &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentUriLinkCodingKeys;
}

ValueMetadata *type metadata accessor for AppIntentsInvocationPreview.CodingKeys()
{
  return &type metadata for AppIntentsInvocationPreview.CodingKeys;
}

ValueMetadata *type metadata accessor for AppIntentsInvocationPreview.Parameter.CodingKeys()
{
  return &type metadata for AppIntentsInvocationPreview.Parameter.CodingKeys;
}

ValueMetadata *type metadata accessor for AppIntentsInvocationPreview.Parameter.Value.CodingKeys()
{
  return &type metadata for AppIntentsInvocationPreview.Parameter.Value.CodingKeys;
}

ValueMetadata *type metadata accessor for AppIntentsInvocationPreview.Parameter.Value.StringCodingKeys()
{
  return &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringCodingKeys;
}

ValueMetadata *type metadata accessor for AppIntentsInvocationPreview.Parameter.Value.ArrayCodingKeys()
{
  return &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayCodingKeys;
}

ValueMetadata *type metadata accessor for AppIntentsInvocationPreview.Parameter.Value.ArrayValue.CodingKeys()
{
  return &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayValue.CodingKeys;
}

ValueMetadata *type metadata accessor for AppIntentsInvocationPreview.Parameter.Value.StringValue.CodingKeys()
{
  return &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringValue.CodingKeys;
}

ValueMetadata *type metadata accessor for ToolDisambiguation.CodingKeys()
{
  return &type metadata for ToolDisambiguation.CodingKeys;
}

ValueMetadata *type metadata accessor for ParameterCandidatesNotFound.CodingKeys()
{
  return &type metadata for ParameterCandidatesNotFound.CodingKeys;
}

ValueMetadata *type metadata accessor for ParameterNotAllowed.CodingKeys()
{
  return &type metadata for ParameterNotAllowed.CodingKeys;
}

ValueMetadata *type metadata accessor for ValueDisambiguation.CodingKeys()
{
  return &type metadata for ValueDisambiguation.CodingKeys;
}

ValueMetadata *type metadata accessor for ParameterDisambiguation.CodingKeys()
{
  return &type metadata for ParameterDisambiguation.CodingKeys;
}

ValueMetadata *type metadata accessor for ParameterConfirmation.CodingKeys()
{
  return &type metadata for ParameterConfirmation.CodingKeys;
}

ValueMetadata *type metadata accessor for ParameterNeedsValue.CodingKeys()
{
  return &type metadata for ParameterNeedsValue.CodingKeys;
}

ValueMetadata *type metadata accessor for PromptSelection.CodingKeys()
{
  return &type metadata for PromptSelection.CodingKeys;
}

ValueMetadata *type metadata accessor for PromptSelection.ConfirmedCodingKeys()
{
  return &type metadata for PromptSelection.ConfirmedCodingKeys;
}

ValueMetadata *type metadata accessor for PromptSelection.SelectedInDisambiguationCodingKeys()
{
  return &type metadata for PromptSelection.SelectedInDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for PromptSelection.DeniedCodingKeys()
{
  return &type metadata for PromptSelection.DeniedCodingKeys;
}

ValueMetadata *type metadata accessor for ParameterValue.CodingKeys()
{
  return &type metadata for ParameterValue.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionConfirmation.CodingKeys()
{
  return &type metadata for ActionConfirmation.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.CodingKeys()
{
  return &type metadata for ActionFailure.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.DeveloperDefinedError.CodingKeys()
{
  return &type metadata for ActionFailure.DeveloperDefinedError.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ActionFailure.Failure.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF0)
  {
    if (a2 + 16 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 16) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 17;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v5 = v6 - 17;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ActionFailure.Failure.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_23F240ED8 + 4 * byte_23F27A005[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_23F240F0C + 4 * byte_23F27A000[v4]))();
}

uint64_t sub_23F240F0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F240F14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F240F1CLL);
  return result;
}

uint64_t sub_23F240F28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F240F30);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_23F240F34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F240F3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.CodingKeys()
{
  return &type metadata for ActionFailure.Failure.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.PreflightCheckFailureCodingKeys()
{
  return &type metadata for ActionFailure.Failure.PreflightCheckFailureCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.PreciseLocationDisabledCodingKeys()
{
  return &type metadata for ActionFailure.Failure.PreciseLocationDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.LocationDisabledCodingKeys()
{
  return &type metadata for ActionFailure.Failure.LocationDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.WifiDisabledCodingKeys()
{
  return &type metadata for ActionFailure.Failure.WifiDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.BluetoothDisabledCodingKeys()
{
  return &type metadata for ActionFailure.Failure.BluetoothDisabledCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.NetworkFailureCodingKeys()
{
  return &type metadata for ActionFailure.Failure.NetworkFailureCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.PartialFailureCodingKeys()
{
  return &type metadata for ActionFailure.Failure.PartialFailureCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.UnsupportedOnDeviceCodingKeys()
{
  return &type metadata for ActionFailure.Failure.UnsupportedOnDeviceCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.FeatureCurrentlyRestrictedCodingKeys()
{
  return &type metadata for ActionFailure.Failure.FeatureCurrentlyRestrictedCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.EntityNotFoundCodingKeys()
{
  return &type metadata for ActionFailure.Failure.EntityNotFoundCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.ActionNotAllowedCodingKeys()
{
  return &type metadata for ActionFailure.Failure.ActionNotAllowedCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.ValueDisambiguationRejectedCodingKeys()
{
  return &type metadata for ActionFailure.Failure.ValueDisambiguationRejectedCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.NoMatchingToolCodingKeys()
{
  return &type metadata for ActionFailure.Failure.NoMatchingToolCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.UnableToUndoCodingKeys()
{
  return &type metadata for ActionFailure.Failure.UnableToUndoCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.ActionCanceledCodingKeys()
{
  return &type metadata for ActionFailure.Failure.ActionCanceledCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.DeveloperDefinedErrorCodingKeys()
{
  return &type metadata for ActionFailure.Failure.DeveloperDefinedErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ActionFailure.Failure.UnableToCancelCodingKeys()
{
  return &type metadata for ActionFailure.Failure.UnableToCancelCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.CodingKeys()
{
  return &type metadata for PermissionRequirement.CodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.SiriPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.SiriPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.ShortcutsPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.ShortcutsPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.PreciseLocationPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.PreciseLocationPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.LocationPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.LocationPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.WifiPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.WifiPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.BluetoothPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.BluetoothPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.PhotosPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.PhotosPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for PermissionRequirement.ContactsPermissionRequiredCodingKeys()
{
  return &type metadata for PermissionRequirement.ContactsPermissionRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for AppRequirement.CodingKeys()
{
  return &type metadata for AppRequirement.CodingKeys;
}

ValueMetadata *type metadata accessor for AppRequirement.SignInRequiredCodingKeys()
{
  return &type metadata for AppRequirement.SignInRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for AppRequirement.AccountSetupRequiredCodingKeys()
{
  return &type metadata for AppRequirement.AccountSetupRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for AppRequirement.UserConfirmationRequiredCodingKeys()
{
  return &type metadata for AppRequirement.UserConfirmationRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.CodingKeys()
{
  return &type metadata for SystemRequirement.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.DeviceUnlockRequiredCodingKeys()
{
  return &type metadata for SystemRequirement.DeviceUnlockRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.AuthenticationRequiredCodingKeys()
{
  return &type metadata for SystemRequirement.AuthenticationRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.AppLaunchRequiredCodingKeys()
{
  return &type metadata for SystemRequirement.AppLaunchRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.CarPlayIncompatibleCodingKeys()
{
  return &type metadata for SystemRequirement.CarPlayIncompatibleCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.CarBluetoothIncompatibleCodingKeys()
{
  return &type metadata for SystemRequirement.CarBluetoothIncompatibleCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.ProtectedAppApprovalRequiredCodingKeys()
{
  return &type metadata for SystemRequirement.ProtectedAppApprovalRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.UserAuthenticationRequiredCodingKeys()
{
  return &type metadata for SystemRequirement.UserAuthenticationRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.AuthenticationRequest.CodingKeys()
{
  return &type metadata for SystemRequirement.AuthenticationRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.AuthenticationRequest.AuthenticationLevel.CodingKeys()
{
  return &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.AuthenticationRequest.AuthenticationLevel.AlternativeAuthenticationPermittedCodingKeys()
{
  return &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.AlternativeAuthenticationPermittedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.AuthenticationRequest.AuthenticationLevel.OriginDeviceAuthenticationRequiredCodingKeys()
{
  return &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.OriginDeviceAuthenticationRequiredCodingKeys;
}

ValueMetadata *type metadata accessor for SystemRequirement.ProtectedAppRequest.CodingKeys()
{
  return &type metadata for SystemRequirement.ProtectedAppRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionRequirement.CodingKeys()
{
  return &type metadata for ActionRequirement.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionRequirement.SystemRequirementCodingKeys()
{
  return &type metadata for ActionRequirement.SystemRequirementCodingKeys;
}

ValueMetadata *type metadata accessor for ActionRequirement.AppRequirementCodingKeys()
{
  return &type metadata for ActionRequirement.AppRequirementCodingKeys;
}

ValueMetadata *type metadata accessor for ActionRequirement.PermissionsRequirementCodingKeys()
{
  return &type metadata for ActionRequirement.PermissionsRequirementCodingKeys;
}

ValueMetadata *type metadata accessor for ActionRequirement.UnsupportedCodingKeys()
{
  return &type metadata for ActionRequirement.UnsupportedCodingKeys;
}

ValueMetadata *type metadata accessor for ActionSuccess.CodingKeys()
{
  return &type metadata for ActionSuccess.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionSuccess.UndoContext.CodingKeys()
{
  return &type metadata for ActionSuccess.UndoContext.CodingKeys;
}

ValueMetadata *type metadata accessor for StatementID.CodingKeys()
{
  return &type metadata for StatementID.CodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.CodingKeys()
{
  return &type metadata for StatementOutcome.CodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.SuccessCodingKeys()
{
  return &type metadata for StatementOutcome.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ActionConfirmationCodingKeys()
{
  return &type metadata for StatementOutcome.ActionConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ToolDisambiguationCodingKeys()
{
  return &type metadata for StatementOutcome.ToolDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ParameterNeedsValueCodingKeys()
{
  return &type metadata for StatementOutcome.ParameterNeedsValueCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ParameterConfirmationCodingKeys()
{
  return &type metadata for StatementOutcome.ParameterConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ParameterDisambiguationCodingKeys()
{
  return &type metadata for StatementOutcome.ParameterDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ParameterNotAllowedCodingKeys()
{
  return &type metadata for StatementOutcome.ParameterNotAllowedCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ParameterCandidatesNotFoundCodingKeys()
{
  return &type metadata for StatementOutcome.ParameterCandidatesNotFoundCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ActionRequirementCodingKeys()
{
  return &type metadata for StatementOutcome.ActionRequirementCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.ValueDisambiguationCodingKeys()
{
  return &type metadata for StatementOutcome.ValueDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for StatementOutcome.FailureCodingKeys()
{
  return &type metadata for StatementOutcome.FailureCodingKeys;
}

uint64_t _s16IntelligenceFlow16StatementOutcomeO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23F180230(-1);
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return sub_23F180230((*a1 | (v4 << 8)) - 11);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23F180230((*a1 | (v4 << 8)) - 11);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23F180230((*a1 | (v4 << 8)) - 11);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return sub_23F180230(v8);
}

uint64_t _s16IntelligenceFlow16StatementOutcomeO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_23F241420 + 4 * byte_23F27A00F[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_23F241454 + 4 * byte_23F27A00A[v4]))();
}

uint64_t sub_23F241458(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F241460);
  return result;
}

_BYTE *sub_23F241468(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F241470);
  return sub_23F1801B4((_BYTE *)a1, a2 + 10);
}

ValueMetadata *type metadata accessor for ActionOutcome.CodingKeys()
{
  return &type metadata for ActionOutcome.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.SuccessCodingKeys()
{
  return &type metadata for ActionOutcome.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ActionConfirmationCodingKeys()
{
  return &type metadata for ActionOutcome.ActionConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ToolDisambiguationCodingKeys()
{
  return &type metadata for ActionOutcome.ToolDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ParameterNeedsValueCodingKeys()
{
  return &type metadata for ActionOutcome.ParameterNeedsValueCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ParameterConfirmationCodingKeys()
{
  return &type metadata for ActionOutcome.ParameterConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ParameterDisambiguationCodingKeys()
{
  return &type metadata for ActionOutcome.ParameterDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ParameterNotAllowedCodingKeys()
{
  return &type metadata for ActionOutcome.ParameterNotAllowedCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ParameterCandidatesNotFoundCodingKeys()
{
  return &type metadata for ActionOutcome.ParameterCandidatesNotFoundCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ActionRequirementCodingKeys()
{
  return &type metadata for ActionOutcome.ActionRequirementCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.ValueDisambiguationCodingKeys()
{
  return &type metadata for ActionOutcome.ValueDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for ActionOutcome.FailureCodingKeys()
{
  return &type metadata for ActionOutcome.FailureCodingKeys;
}

ValueMetadata *type metadata accessor for InterpretedStatementResult.CodingKeys()
{
  return &type metadata for InterpretedStatementResult.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemResponse.CodingKeys()
{
  return &type metadata for SystemResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for ActionResponse.CodingKeys()
{
  return &type metadata for ActionResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.CodingKeys()
{
  return &type metadata for SystemPromptResolution.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.ActionCancellation.CodingKeys()
{
  return &type metadata for SystemPromptResolution.ActionCancellation.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.RequirementResolution.CodingKeys()
{
  return &type metadata for SystemPromptResolution.RequirementResolution.CodingKeys;
}

uint64_t _s16IntelligenceFlow21PermissionRequirementOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23F2415F0 + 4 * byte_23F27A019[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23F241624 + 4 * byte_23F27A014[v4]))();
}

uint64_t sub_23F241628(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F241630);
  return result;
}

_BYTE *sub_23F241638(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F241640);
  return sub_23F1801B4((_BYTE *)a1, a2 + 7);
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.CodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.ActionConfirmedCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.ActionConfirmedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.DeviceUnlockedCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.DeviceUnlockedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.ParameterValueSelectedCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.ParameterValueSelectedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.ParameterConfirmedCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.ParameterConfirmedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.ParameterItemSelectedCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.ParameterItemSelectedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.DisambiguationIndexSelectedCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.DisambiguationIndexSelectedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.RequirementAddressedCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.RequirementAddressedCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.UserAction.ActionCanceledCodingKeys()
{
  return &type metadata for SystemPromptResolution.UserAction.ActionCanceledCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.ResolutionInput.CodingKeys()
{
  return &type metadata for SystemPromptResolution.ResolutionInput.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.ResolutionInput.TouchCodingKeys()
{
  return &type metadata for SystemPromptResolution.ResolutionInput.TouchCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.ResolutionInput.HeadGestureCodingKeys()
{
  return &type metadata for SystemPromptResolution.ResolutionInput.HeadGestureCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.ResolutionInput.TextCodingKeys()
{
  return &type metadata for SystemPromptResolution.ResolutionInput.TextCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.ResolutionInput.SpeechCodingKeys()
{
  return &type metadata for SystemPromptResolution.ResolutionInput.SpeechCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.InputModality.CodingKeys()
{
  return &type metadata for SystemPromptResolution.InputModality.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.InputModality.TouchCodingKeys()
{
  return &type metadata for SystemPromptResolution.InputModality.TouchCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPromptResolution.InputModality.HeadGestureCodingKeys()
{
  return &type metadata for SystemPromptResolution.InputModality.HeadGestureCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPrompt.CodingKeys()
{
  return &type metadata for SystemPrompt.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPrompt.Prompt.CodingKeys()
{
  return &type metadata for SystemPrompt.Prompt.CodingKeys;
}

ValueMetadata *type metadata accessor for SystemPrompt.Prompt.ActionConfirmationCodingKeys()
{
  return &type metadata for SystemPrompt.Prompt.ActionConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPrompt.Prompt.ParameterNeedsValueCodingKeys()
{
  return &type metadata for SystemPrompt.Prompt.ParameterNeedsValueCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPrompt.Prompt.ParameterConfirmationCodingKeys()
{
  return &type metadata for SystemPrompt.Prompt.ParameterConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for SystemPrompt.Prompt.ParameterDisambiguationCodingKeys()
{
  return &type metadata for SystemPrompt.Prompt.ParameterDisambiguationCodingKeys;
}

uint64_t getEnumTagSinglePayload for MessagePayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD8)
  {
    if (a2 + 40 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 40) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 41;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x29;
  v5 = v6 - 41;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MessagePayload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 40 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 40) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD7)
    return ((uint64_t (*)(void))((char *)&loc_23F241894 + 4 * byte_23F27A023[v4]))();
  *a1 = a2 + 40;
  return ((uint64_t (*)(void))((char *)sub_23F2418C8 + 4 * byte_23F27A01E[v4]))();
}

uint64_t sub_23F2418C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2418D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2418D8);
  return result;
}

uint64_t sub_23F2418E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F2418ECLL);
  *(_BYTE *)result = a2 + 40;
  return result;
}

uint64_t sub_23F2418F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F2418F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessagePayload.CodingKeys()
{
  return &type metadata for MessagePayload.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestCodingKeys()
{
  return &type metadata for MessagePayload.RequestCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.TerminateCodingKeys()
{
  return &type metadata for MessagePayload.TerminateCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SessionSuspendedCodingKeys()
{
  return &type metadata for MessagePayload.SessionSuspendedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.EndOfPlanCodingKeys()
{
  return &type metadata for MessagePayload.EndOfPlanCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.StepExecutedWithReturnedValueCodingKeys()
{
  return &type metadata for MessagePayload.StepExecutedWithReturnedValueCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ErrorCodingKeys()
{
  return &type metadata for MessagePayload.ErrorCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.PlannerReturnedRawPlanCodingKeys()
{
  return &type metadata for MessagePayload.PlannerReturnedRawPlanCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.QueryCodingKeys()
{
  return &type metadata for MessagePayload.QueryCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SpeechQueryCodingKeys()
{
  return &type metadata for MessagePayload.SpeechQueryCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientInitiatedClientActionCodingKeys()
{
  return &type metadata for MessagePayload.ClientInitiatedClientActionCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.PrescribedPlanCodingKeys()
{
  return &type metadata for MessagePayload.PrescribedPlanCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.MockTranscriptCodingKeys()
{
  return &type metadata for MessagePayload.MockTranscriptCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.DisambiguationNeededCodingKeys()
{
  return &type metadata for MessagePayload.DisambiguationNeededCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientEffectInvocationCodingKeys()
{
  return &type metadata for MessagePayload.ClientEffectInvocationCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientEffectResolvedCodingKeys()
{
  return &type metadata for MessagePayload.ClientEffectResolvedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecuteCodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecuteCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientActionCodingKeys()
{
  return &type metadata for MessagePayload.ClientActionCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientActionResultCodingKeys()
{
  return &type metadata for MessagePayload.ClientActionResultCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientCustomCodingKeys()
{
  return &type metadata for MessagePayload.ClientCustomCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientIdentifierCodingKeys()
{
  return &type metadata for MessagePayload.ClientIdentifierCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SystemPromptRequestedCodingKeys()
{
  return &type metadata for MessagePayload.SystemPromptRequestedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SystemPromptResolvedCodingKeys()
{
  return &type metadata for MessagePayload.SystemPromptResolvedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionResponseCodingKeys()
{
  return &type metadata for MessagePayload.ActionResponseCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SystemResponseCodingKeys()
{
  return &type metadata for MessagePayload.SystemResponseCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ContextPrewarmRequestCodingKeys()
{
  return &type metadata for MessagePayload.ContextPrewarmRequestCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ContextPrewarmCompletedCodingKeys()
{
  return &type metadata for MessagePayload.ContextPrewarmCompletedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SafetyModeReleaseCodingKeys()
{
  return &type metadata for MessagePayload.SafetyModeReleaseCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SafetyModeExceptionCodingKeys()
{
  return &type metadata for MessagePayload.SafetyModeExceptionCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentTextQueryCodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentTextQueryCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentSpeechQueryCodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentSpeechQueryCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentRequestCodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentRequestCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentOutcomeCodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentOutcomeCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentQueryRewriteMetadataCodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadataCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadataCodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadataCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientUndoRedoRequestCodingKeys()
{
  return &type metadata for MessagePayload.ClientUndoRedoRequestCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdateCodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdateCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientDebuggerEventCodingKeys()
{
  return &type metadata for MessagePayload.ClientDebuggerEventCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ServerDebuggerEventCodingKeys()
{
  return &type metadata for MessagePayload.ServerDebuggerEventCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.StatusUpdateCodingKeys()
{
  return &type metadata for MessagePayload.StatusUpdateCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.PlannerPromptDataCodingKeys()
{
  return &type metadata for MessagePayload.PlannerPromptDataCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionResolutionUpdateCodingKeys()
{
  return &type metadata for MessagePayload.ActionResolutionUpdateCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.CodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.CodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder.CodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.CodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue.CodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.CodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValueCodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValueCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValuesCodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValuesCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.PlaceholderCodingKeys()
{
  return &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.PlaceholderCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientUndoRedoRequest.CodingKeys()
{
  return &type metadata for MessagePayload.ClientUndoRedoRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientUndoRedoRequest.UndoOperation.CodingKeys()
{
  return &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientUndoRedoRequest.UndoOperation.UndoCodingKeys()
{
  return &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.UndoCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientUndoRedoRequest.UndoOperation.RedoCodingKeys()
{
  return &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.RedoCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentRequestRewriteMetadata.CodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentQueryRewriteMetadata.CodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadata.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentOutcome.CodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentOutcome.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentSpeechQuery.CodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentSpeechQuery.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentSpeechQuery.Candidate.CodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentSpeechQuery.Candidate.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentTextQuery.CodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentTextQuery.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ExternalAgentRequest.CodingKeys()
{
  return &type metadata for MessagePayload.ExternalAgentRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SafetyModeException.CodingKeys()
{
  return &type metadata for MessagePayload.SafetyModeException.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SafetyModeRelease.CodingKeys()
{
  return &type metadata for MessagePayload.SafetyModeRelease.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ContextPrewarmCompleted.CodingKeys()
{
  return &type metadata for MessagePayload.ContextPrewarmCompleted.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ContextPrewarmRequest.CodingKeys()
{
  return &type metadata for MessagePayload.ContextPrewarmRequest.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientInitiatedClientAction.CodingKeys()
{
  return &type metadata for MessagePayload.ClientInitiatedClientAction.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientIdentifier.CodingKeys()
{
  return &type metadata for MessagePayload.ClientIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientCustom.CodingKeys()
{
  return &type metadata for MessagePayload.ClientCustom.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientActionResult.CodingKeys()
{
  return &type metadata for MessagePayload.ClientActionResult.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientEffectResolved.CodingKeys()
{
  return &type metadata for MessagePayload.ClientEffectResolved.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientEffectResolved.Result.CodingKeys()
{
  return &type metadata for MessagePayload.ClientEffectResolved.Result.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientEffectResolved.Result.CompleteCodingKeys()
{
  return &type metadata for MessagePayload.ClientEffectResolved.Result.CompleteCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientEffectResolved.Result.ErrorCodingKeys()
{
  return &type metadata for MessagePayload.ClientEffectResolved.Result.ErrorCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.ParameterValue.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.ParameterValue.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.PromptSelection.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.PromptSelection.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.PromptSelection.ConfirmedCodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.PromptSelection.ConfirmedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguationCodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.PromptSelection.DeniedCodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.PromptSelection.DeniedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.PromptSelection.Denied.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.PromptSelection.Denied.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguation.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguation.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.PromptSelection.Confirmed.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.PromptSelection.Confirmed.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.ToolParameterValue.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.ToolParameterValue.ReferenceCodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ReferenceCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.ToolParameterValue.ValueCodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ValueCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.ToolParameterValue.Value.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Value.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ActionWillExecute.ToolParameterValue.Reference.CodingKeys()
{
  return &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Reference.CodingKeys;
}

uint64_t _s16IntelligenceFlow23ParameterDisambiguationV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23F241ED0 + 4 * byte_23F27A02D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23F241F04 + 4 * byte_23F27A028[v4]))();
}

uint64_t sub_23F241F08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F241F10);
  return result;
}

_BYTE *sub_23F241F18(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F241F20);
  return sub_23F1801B4((_BYTE *)a1, a2 + 4);
}

ValueMetadata *type metadata accessor for MessagePayload.ClientAction.CodingKeys()
{
  return &type metadata for MessagePayload.ClientAction.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientAction.UnresolvedParameterValue.CodingKeys()
{
  return &type metadata for MessagePayload.ClientAction.UnresolvedParameterValue.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientAction.ShimParameterResolution.CodingKeys()
{
  return &type metadata for MessagePayload.ClientAction.ShimParameterResolution.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientAction.ShimParameterResolution.ResolvedCodingKeys()
{
  return &type metadata for MessagePayload.ClientAction.ShimParameterResolution.ResolvedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientAction.ShimParameterResolution.UnresolvedCodingKeys()
{
  return &type metadata for MessagePayload.ClientAction.ShimParameterResolution.UnresolvedCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.ClientEffectInvocation.CodingKeys()
{
  return &type metadata for MessagePayload.ClientEffectInvocation.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.DisambiguationNeeded.CodingKeys()
{
  return &type metadata for MessagePayload.DisambiguationNeeded.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.MockTranscript.CodingKeys()
{
  return &type metadata for MessagePayload.MockTranscript.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.PrescribedPlan.CodingKeys()
{
  return &type metadata for MessagePayload.PrescribedPlan.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SpeechQuery.CodingKeys()
{
  return &type metadata for MessagePayload.SpeechQuery.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SpeechQuery.Candidate.CodingKeys()
{
  return &type metadata for MessagePayload.SpeechQuery.Candidate.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.Query.CodingKeys()
{
  return &type metadata for MessagePayload.Query.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.CodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.SearchToolCodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.SearchToolCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeToolCodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeToolCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.TextToolCodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.TextToolCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.ConvertToolCodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.ConvertToolCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.DisplayToolCodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.DisplayToolCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.KnowledgeToolCodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeToolCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.KnowledgeTool.CodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeTool.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.DisplayTool.CodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.DisplayTool.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.ConvertTool.CodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.ConvertTool.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.TextTool.CodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.TextTool.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeTool.CodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeTool.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestPrescribedPlan.SearchTool.CodingKeys()
{
  return &type metadata for MessagePayload.RequestPrescribedPlan.SearchTool.CodingKeys;
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV4ToolV10DefinitionO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F24210C + 4 * byte_23F27A037[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23F242140 + 4 * byte_23F27A032[v4]))();
}

uint64_t sub_23F242144(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F24214CLL);
  return result;
}

_BYTE *sub_23F242154(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F24215CLL);
  return sub_23F1801B4((_BYTE *)a1, a2 + 3);
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.CodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.StopCodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.StopCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.TextCodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.TextCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.SpeechCodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.SpeechCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.PromptResolutionCodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.PromptResolutionCodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.SpeechContent.CodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.SpeechContent.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.SpeechContent.Candidate.CodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.SpeechContent.Candidate.CodingKeys;
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV4ToolV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23F24221C + 4 * byte_23F27A03C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23F24223C + 4 * byte_23F27A041[v4]))();
}

_BYTE *sub_23F24221C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23F24223C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F242244(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F24224C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F242254(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F24225C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.TextContent.CodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.TextContent.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.RequestContent.StopContent.CodingKeys()
{
  return &type metadata for MessagePayload.RequestContent.StopContent.CodingKeys;
}

uint64_t _s16IntelligenceFlow26InterpretedStatementResultV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23F2422D4 + 4 * byte_23F27A04B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23F242308 + 4 * byte_23F27A046[v4]))();
}

uint64_t sub_23F24230C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F242314);
  return result;
}

_BYTE *sub_23F24231C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F242324);
  return sub_23F1801B4((_BYTE *)a1, a2 + 5);
}

ValueMetadata *type metadata accessor for MessagePayload.Request.CodingKeys()
{
  return &type metadata for MessagePayload.Request.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.PlannerReturnedRawPlan.CodingKeys()
{
  return &type metadata for MessagePayload.PlannerReturnedRawPlan.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SessionError.CodingKeys()
{
  return &type metadata for MessagePayload.SessionError.CodingKeys;
}

uint64_t _s16IntelligenceFlow17SystemRequirementO21AuthenticationRequestV19AuthenticationLevelOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23F2423B0 + 4 * byte_23F27A055[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23F2423E4 + 4 * byte_23F27A050[v4]))();
}

uint64_t sub_23F2423E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F2423F0);
  return result;
}

_BYTE *sub_23F2423F8(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F242400);
  return sub_23F1801B4((_BYTE *)a1, a2 + 1);
}

ValueMetadata *type metadata accessor for MessagePayload.StepExecutedWithReturnedValue.CodingKeys()
{
  return &type metadata for MessagePayload.StepExecutedWithReturnedValue.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.SessionSuspended.CodingKeys()
{
  return &type metadata for MessagePayload.SessionSuspended.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.EndOfPlan.CodingKeys()
{
  return &type metadata for MessagePayload.EndOfPlan.CodingKeys;
}

ValueMetadata *type metadata accessor for MessagePayload.Terminate.CodingKeys()
{
  return &type metadata for MessagePayload.Terminate.CodingKeys;
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV20OnScreenContextValueV11ContextTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return sub_23F180230(-1);
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return sub_23F180230((*a1 | (v4 << 8)) - 7);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return sub_23F180230((*a1 | (v4 << 8)) - 7);
    }
    v4 = a1[1];
    if (a1[1])
      return sub_23F180230((*a1 | (v4 << 8)) - 7);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return sub_23F180230(v8);
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV20OnScreenContextValueV11ContextTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_23F242520 + 4 * byte_23F27A05F[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23F242554 + 4 * byte_23F27A05A[v4]))();
}

uint64_t sub_23F242558(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F242560);
  return result;
}

_BYTE *sub_23F242568(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F242570);
  return sub_23F1801B4((_BYTE *)a1, a2 + 6);
}

ValueMetadata *type metadata accessor for SessionServerMessage.CodingKeys()
{
  return &type metadata for SessionServerMessage.CodingKeys;
}

uint64_t _s16IntelligenceFlow19ParameterNotAllowedV6ReasonOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F2425DC + 4 * byte_23F27A069[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23F242610 + 4 * byte_23F27A064[v4]))();
}

uint64_t sub_23F242614(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F24261CLL);
  return result;
}

_BYTE *sub_23F242624(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F24262CLL);
  return sub_23F1801B4((_BYTE *)a1, a2 + 2);
}

ValueMetadata *type metadata accessor for SessionClientMessage.CodingKeys()
{
  return &type metadata for SessionClientMessage.CodingKeys;
}

unint64_t sub_23F242650()
{
  unint64_t result;

  result = qword_256E07170;
  if (!qword_256E07170)
  {
    result = MEMORY[0x242667160](&unk_23F28051C, &type metadata for SessionClientMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07170);
  }
  return result;
}

unint64_t sub_23F242690()
{
  unint64_t result;

  result = qword_256E07178;
  if (!qword_256E07178)
  {
    result = MEMORY[0x242667160](&unk_23F2805D4, &type metadata for SessionServerMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07178);
  }
  return result;
}

unint64_t sub_23F2426D0()
{
  unint64_t result;

  result = qword_256E07180;
  if (!qword_256E07180)
  {
    result = MEMORY[0x242667160](&unk_23F28077C, &type metadata for MessagePayload.StepExecutedWithReturnedValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07180);
  }
  return result;
}

unint64_t sub_23F242710()
{
  unint64_t result;

  result = qword_256E07188;
  if (!qword_256E07188)
  {
    result = MEMORY[0x242667160](&unk_23F280834, &type metadata for MessagePayload.SessionError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07188);
  }
  return result;
}

unint64_t sub_23F242750()
{
  unint64_t result;

  result = qword_256E07190;
  if (!qword_256E07190)
  {
    result = MEMORY[0x242667160](&unk_23F2808EC, &type metadata for MessagePayload.PlannerReturnedRawPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07190);
  }
  return result;
}

unint64_t sub_23F242790()
{
  unint64_t result;

  result = qword_256E07198;
  if (!qword_256E07198)
  {
    result = MEMORY[0x242667160](&unk_23F2809A4, &type metadata for MessagePayload.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07198);
  }
  return result;
}

unint64_t sub_23F2427D0()
{
  unint64_t result;

  result = qword_256E071A0;
  if (!qword_256E071A0)
  {
    result = MEMORY[0x242667160](&unk_23F280AAC, &type metadata for MessagePayload.RequestContent.TextContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071A0);
  }
  return result;
}

unint64_t sub_23F242810()
{
  unint64_t result;

  result = qword_256E071A8;
  if (!qword_256E071A8)
  {
    result = MEMORY[0x242667160](&unk_23F280B64, &type metadata for MessagePayload.RequestContent.SpeechContent.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071A8);
  }
  return result;
}

unint64_t sub_23F242850()
{
  unint64_t result;

  result = qword_256E071B0;
  if (!qword_256E071B0)
  {
    result = MEMORY[0x242667160](&unk_23F280C1C, &type metadata for MessagePayload.RequestContent.SpeechContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071B0);
  }
  return result;
}

unint64_t sub_23F242890()
{
  unint64_t result;

  result = qword_256E071B8;
  if (!qword_256E071B8)
  {
    result = MEMORY[0x242667160](&unk_23F280CD4, &type metadata for MessagePayload.RequestContent.PromptResolutionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071B8);
  }
  return result;
}

unint64_t sub_23F2428D0()
{
  unint64_t result;

  result = qword_256E071C0;
  if (!qword_256E071C0)
  {
    result = MEMORY[0x242667160](&unk_23F280D8C, &type metadata for MessagePayload.RequestContent.SpeechCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071C0);
  }
  return result;
}

unint64_t sub_23F242910()
{
  unint64_t result;

  result = qword_256E071C8;
  if (!qword_256E071C8)
  {
    result = MEMORY[0x242667160](&unk_23F280E44, &type metadata for MessagePayload.RequestContent.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071C8);
  }
  return result;
}

unint64_t sub_23F242950()
{
  unint64_t result;

  result = qword_256E071D0;
  if (!qword_256E071D0)
  {
    result = MEMORY[0x242667160](&unk_23F280EFC, &type metadata for MessagePayload.RequestContent.StopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071D0);
  }
  return result;
}

unint64_t sub_23F242990()
{
  unint64_t result;

  result = qword_256E071D8;
  if (!qword_256E071D8)
  {
    result = MEMORY[0x242667160](&unk_23F280FB4, &type metadata for MessagePayload.RequestContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071D8);
  }
  return result;
}

unint64_t sub_23F2429D0()
{
  unint64_t result;

  result = qword_256E071E0;
  if (!qword_256E071E0)
  {
    result = MEMORY[0x242667160](&unk_23F28106C, &type metadata for MessagePayload.RequestPrescribedPlan.SearchTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071E0);
  }
  return result;
}

unint64_t sub_23F242A10()
{
  unint64_t result;

  result = qword_256E071E8;
  if (!qword_256E071E8)
  {
    result = MEMORY[0x242667160](&unk_23F281124, &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071E8);
  }
  return result;
}

unint64_t sub_23F242A50()
{
  unint64_t result;

  result = qword_256E071F0;
  if (!qword_256E071F0)
  {
    result = MEMORY[0x242667160](&unk_23F2811DC, &type metadata for MessagePayload.RequestPrescribedPlan.TextTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071F0);
  }
  return result;
}

unint64_t sub_23F242A90()
{
  unint64_t result;

  result = qword_256E071F8;
  if (!qword_256E071F8)
  {
    result = MEMORY[0x242667160](&unk_23F281294, &type metadata for MessagePayload.RequestPrescribedPlan.ConvertTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E071F8);
  }
  return result;
}

unint64_t sub_23F242AD0()
{
  unint64_t result;

  result = qword_256E07200;
  if (!qword_256E07200)
  {
    result = MEMORY[0x242667160](&unk_23F28134C, &type metadata for MessagePayload.RequestPrescribedPlan.DisplayTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07200);
  }
  return result;
}

unint64_t sub_23F242B10()
{
  unint64_t result;

  result = qword_256E07208;
  if (!qword_256E07208)
  {
    result = MEMORY[0x242667160](&unk_23F281404, &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07208);
  }
  return result;
}

unint64_t sub_23F242B50()
{
  unint64_t result;

  result = qword_256E07210;
  if (!qword_256E07210)
  {
    result = MEMORY[0x242667160](&unk_23F2814BC, &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07210);
  }
  return result;
}

unint64_t sub_23F242B90()
{
  unint64_t result;

  result = qword_256E07218;
  if (!qword_256E07218)
  {
    result = MEMORY[0x242667160](&unk_23F281574, &type metadata for MessagePayload.RequestPrescribedPlan.DisplayToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07218);
  }
  return result;
}

unint64_t sub_23F242BD0()
{
  unint64_t result;

  result = qword_256E07220;
  if (!qword_256E07220)
  {
    result = MEMORY[0x242667160](&unk_23F28162C, &type metadata for MessagePayload.RequestPrescribedPlan.ConvertToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07220);
  }
  return result;
}

unint64_t sub_23F242C10()
{
  unint64_t result;

  result = qword_256E07228;
  if (!qword_256E07228)
  {
    result = MEMORY[0x242667160](&unk_23F2816E4, &type metadata for MessagePayload.RequestPrescribedPlan.TextToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07228);
  }
  return result;
}

unint64_t sub_23F242C50()
{
  unint64_t result;

  result = qword_256E07230;
  if (!qword_256E07230)
  {
    result = MEMORY[0x242667160](&unk_23F28179C, &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07230);
  }
  return result;
}

unint64_t sub_23F242C90()
{
  unint64_t result;

  result = qword_256E07238;
  if (!qword_256E07238)
  {
    result = MEMORY[0x242667160](&unk_23F281854, &type metadata for MessagePayload.RequestPrescribedPlan.SearchToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07238);
  }
  return result;
}

unint64_t sub_23F242CD0()
{
  unint64_t result;

  result = qword_256E07240;
  if (!qword_256E07240)
  {
    result = MEMORY[0x242667160](&unk_23F28190C, &type metadata for MessagePayload.RequestPrescribedPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07240);
  }
  return result;
}

unint64_t sub_23F242D10()
{
  unint64_t result;

  result = qword_256E07248;
  if (!qword_256E07248)
  {
    result = MEMORY[0x242667160](&unk_23F2819C4, &type metadata for MessagePayload.Query.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07248);
  }
  return result;
}

unint64_t sub_23F242D50()
{
  unint64_t result;

  result = qword_256E07250;
  if (!qword_256E07250)
  {
    result = MEMORY[0x242667160](&unk_23F281A7C, &type metadata for MessagePayload.SpeechQuery.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07250);
  }
  return result;
}

unint64_t sub_23F242D90()
{
  unint64_t result;

  result = qword_256E07258;
  if (!qword_256E07258)
  {
    result = MEMORY[0x242667160](&unk_23F281B34, &type metadata for MessagePayload.SpeechQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07258);
  }
  return result;
}

unint64_t sub_23F242DD0()
{
  unint64_t result;

  result = qword_256E07260;
  if (!qword_256E07260)
  {
    result = MEMORY[0x242667160](&unk_23F281BEC, &type metadata for MessagePayload.PrescribedPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07260);
  }
  return result;
}

unint64_t sub_23F242E10()
{
  unint64_t result;

  result = qword_256E07268;
  if (!qword_256E07268)
  {
    result = MEMORY[0x242667160](&unk_23F281CA4, &type metadata for MessagePayload.MockTranscript.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07268);
  }
  return result;
}

unint64_t sub_23F242E50()
{
  unint64_t result;

  result = qword_256E07270;
  if (!qword_256E07270)
  {
    result = MEMORY[0x242667160](&unk_23F281D5C, &type metadata for MessagePayload.DisambiguationNeeded.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07270);
  }
  return result;
}

unint64_t sub_23F242E90()
{
  unint64_t result;

  result = qword_256E07278;
  if (!qword_256E07278)
  {
    result = MEMORY[0x242667160](&unk_23F281E14, &type metadata for MessagePayload.ClientEffectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07278);
  }
  return result;
}

unint64_t sub_23F242ED0()
{
  unint64_t result;

  result = qword_256E07280;
  if (!qword_256E07280)
  {
    result = MEMORY[0x242667160](&unk_23F281ECC, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.UnresolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07280);
  }
  return result;
}

unint64_t sub_23F242F10()
{
  unint64_t result;

  result = qword_256E07288;
  if (!qword_256E07288)
  {
    result = MEMORY[0x242667160](&unk_23F281F84, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.ResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07288);
  }
  return result;
}

unint64_t sub_23F242F50()
{
  unint64_t result;

  result = qword_256E07290;
  if (!qword_256E07290)
  {
    result = MEMORY[0x242667160](&unk_23F28203C, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07290);
  }
  return result;
}

unint64_t sub_23F242F90()
{
  unint64_t result;

  result = qword_256E07298;
  if (!qword_256E07298)
  {
    result = MEMORY[0x242667160](&unk_23F2820F4, &type metadata for MessagePayload.ClientAction.UnresolvedParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07298);
  }
  return result;
}

unint64_t sub_23F242FD0()
{
  unint64_t result;

  result = qword_256E072A0;
  if (!qword_256E072A0)
  {
    result = MEMORY[0x242667160](&unk_23F2821AC, &type metadata for MessagePayload.ClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072A0);
  }
  return result;
}

unint64_t sub_23F243010()
{
  unint64_t result;

  result = qword_256E072A8;
  if (!qword_256E072A8)
  {
    result = MEMORY[0x242667160](&unk_23F282264, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Reference.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072A8);
  }
  return result;
}

unint64_t sub_23F243050()
{
  unint64_t result;

  result = qword_256E072B0;
  if (!qword_256E072B0)
  {
    result = MEMORY[0x242667160](&unk_23F28231C, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072B0);
  }
  return result;
}

unint64_t sub_23F243090()
{
  unint64_t result;

  result = qword_256E072B8;
  if (!qword_256E072B8)
  {
    result = MEMORY[0x242667160](&unk_23F2823D4, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072B8);
  }
  return result;
}

unint64_t sub_23F2430D0()
{
  unint64_t result;

  result = qword_256E072C0;
  if (!qword_256E072C0)
  {
    result = MEMORY[0x242667160](&unk_23F28248C, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ReferenceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072C0);
  }
  return result;
}

unint64_t sub_23F243110()
{
  unint64_t result;

  result = qword_256E072C8;
  if (!qword_256E072C8)
  {
    result = MEMORY[0x242667160](&unk_23F282544, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072C8);
  }
  return result;
}

unint64_t sub_23F243150()
{
  unint64_t result;

  result = qword_256E072D0;
  if (!qword_256E072D0)
  {
    result = MEMORY[0x242667160](&unk_23F28264C, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072D0);
  }
  return result;
}

unint64_t sub_23F243190()
{
  unint64_t result;

  result = qword_256E072D8;
  if (!qword_256E072D8)
  {
    result = MEMORY[0x242667160](&unk_23F282754, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.DeniedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072D8);
  }
  return result;
}

unint64_t sub_23F2431D0()
{
  unint64_t result;

  result = qword_256E072E0;
  if (!qword_256E072E0)
  {
    result = MEMORY[0x242667160](&unk_23F28280C, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072E0);
  }
  return result;
}

unint64_t sub_23F243210()
{
  unint64_t result;

  result = qword_256E072E8;
  if (!qword_256E072E8)
  {
    result = MEMORY[0x242667160](&unk_23F2828C4, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072E8);
  }
  return result;
}

unint64_t sub_23F243250()
{
  unint64_t result;

  result = qword_256E072F0;
  if (!qword_256E072F0)
  {
    result = MEMORY[0x242667160](&unk_23F28297C, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072F0);
  }
  return result;
}

unint64_t sub_23F243290()
{
  unint64_t result;

  result = qword_256E072F8;
  if (!qword_256E072F8)
  {
    result = MEMORY[0x242667160](&unk_23F282A34, &type metadata for MessagePayload.ActionWillExecute.ParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E072F8);
  }
  return result;
}

unint64_t sub_23F2432D0()
{
  unint64_t result;

  result = qword_256E07300;
  if (!qword_256E07300)
  {
    result = MEMORY[0x242667160](&unk_23F282AEC, &type metadata for MessagePayload.ActionWillExecute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07300);
  }
  return result;
}

unint64_t sub_23F243310()
{
  unint64_t result;

  result = qword_256E07308;
  if (!qword_256E07308)
  {
    result = MEMORY[0x242667160](&unk_23F282BA4, &type metadata for MessagePayload.ClientEffectResolved.Result.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07308);
  }
  return result;
}

unint64_t sub_23F243350()
{
  unint64_t result;

  result = qword_256E07310;
  if (!qword_256E07310)
  {
    result = MEMORY[0x242667160](&unk_23F282C5C, &type metadata for MessagePayload.ClientEffectResolved.Result.CompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07310);
  }
  return result;
}

unint64_t sub_23F243390()
{
  unint64_t result;

  result = qword_256E07318;
  if (!qword_256E07318)
  {
    result = MEMORY[0x242667160](&unk_23F282D14, &type metadata for MessagePayload.ClientEffectResolved.Result.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07318);
  }
  return result;
}

unint64_t sub_23F2433D0()
{
  unint64_t result;

  result = qword_256E07320;
  if (!qword_256E07320)
  {
    result = MEMORY[0x242667160](&unk_23F282DCC, &type metadata for MessagePayload.ClientEffectResolved.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07320);
  }
  return result;
}

unint64_t sub_23F243410()
{
  unint64_t result;

  result = qword_256E07328;
  if (!qword_256E07328)
  {
    result = MEMORY[0x242667160](&unk_23F282E84, &type metadata for MessagePayload.ClientActionResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07328);
  }
  return result;
}

unint64_t sub_23F243450()
{
  unint64_t result;

  result = qword_256E07330;
  if (!qword_256E07330)
  {
    result = MEMORY[0x242667160](&unk_23F282F3C, &type metadata for MessagePayload.ClientCustom.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07330);
  }
  return result;
}

unint64_t sub_23F243490()
{
  unint64_t result;

  result = qword_256E07338;
  if (!qword_256E07338)
  {
    result = MEMORY[0x242667160](&unk_23F282FF4, &type metadata for MessagePayload.ClientIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07338);
  }
  return result;
}

unint64_t sub_23F2434D0()
{
  unint64_t result;

  result = qword_256E07340;
  if (!qword_256E07340)
  {
    result = MEMORY[0x242667160](&unk_23F2830AC, &type metadata for MessagePayload.ClientInitiatedClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07340);
  }
  return result;
}

unint64_t sub_23F243510()
{
  unint64_t result;

  result = qword_256E07348;
  if (!qword_256E07348)
  {
    result = MEMORY[0x242667160](&unk_23F283164, &type metadata for MessagePayload.ContextPrewarmRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07348);
  }
  return result;
}

unint64_t sub_23F243550()
{
  unint64_t result;

  result = qword_256E07350;
  if (!qword_256E07350)
  {
    result = MEMORY[0x242667160](&unk_23F28321C, &type metadata for MessagePayload.ContextPrewarmCompleted.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07350);
  }
  return result;
}

unint64_t sub_23F243590()
{
  unint64_t result;

  result = qword_256E07358;
  if (!qword_256E07358)
  {
    result = MEMORY[0x242667160](&unk_23F283324, &type metadata for MessagePayload.SafetyModeException.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07358);
  }
  return result;
}

unint64_t sub_23F2435D0()
{
  unint64_t result;

  result = qword_256E07360;
  if (!qword_256E07360)
  {
    result = MEMORY[0x242667160](&unk_23F2833DC, &type metadata for MessagePayload.ExternalAgentRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07360);
  }
  return result;
}

unint64_t sub_23F243610()
{
  unint64_t result;

  result = qword_256E07368;
  if (!qword_256E07368)
  {
    result = MEMORY[0x242667160](&unk_23F283494, &type metadata for MessagePayload.ExternalAgentTextQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07368);
  }
  return result;
}

unint64_t sub_23F243650()
{
  unint64_t result;

  result = qword_256E07370;
  if (!qword_256E07370)
  {
    result = MEMORY[0x242667160](&unk_23F28354C, &type metadata for MessagePayload.ExternalAgentSpeechQuery.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07370);
  }
  return result;
}

unint64_t sub_23F243690()
{
  unint64_t result;

  result = qword_256E07378;
  if (!qword_256E07378)
  {
    result = MEMORY[0x242667160](&unk_23F283604, &type metadata for MessagePayload.ExternalAgentSpeechQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07378);
  }
  return result;
}

unint64_t sub_23F2436D0()
{
  unint64_t result;

  result = qword_256E07380;
  if (!qword_256E07380)
  {
    result = MEMORY[0x242667160](&unk_23F2836BC, &type metadata for MessagePayload.ExternalAgentOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07380);
  }
  return result;
}

unint64_t sub_23F243710()
{
  unint64_t result;

  result = qword_256E07388;
  if (!qword_256E07388)
  {
    result = MEMORY[0x242667160](&unk_23F283774, &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07388);
  }
  return result;
}

unint64_t sub_23F243750()
{
  unint64_t result;

  result = qword_256E07390;
  if (!qword_256E07390)
  {
    result = MEMORY[0x242667160](&unk_23F28382C, &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07390);
  }
  return result;
}

unint64_t sub_23F243790()
{
  unint64_t result;

  result = qword_256E07398;
  if (!qword_256E07398)
  {
    result = MEMORY[0x242667160](&unk_23F283984, &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07398);
  }
  return result;
}

unint64_t sub_23F2437D0()
{
  unint64_t result;

  result = qword_256E073A0;
  if (!qword_256E073A0)
  {
    result = MEMORY[0x242667160](&unk_23F283A3C, &type metadata for MessagePayload.ClientUndoRedoRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073A0);
  }
  return result;
}

unint64_t sub_23F243810()
{
  unint64_t result;

  result = qword_256E073A8;
  if (!qword_256E073A8)
  {
    result = MEMORY[0x242667160](&unk_23F283AF4, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.PlaceholderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073A8);
  }
  return result;
}

unint64_t sub_23F243850()
{
  unint64_t result;

  result = qword_256E073B0;
  if (!qword_256E073B0)
  {
    result = MEMORY[0x242667160](&unk_23F283BAC, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073B0);
  }
  return result;
}

unint64_t sub_23F243890()
{
  unint64_t result;

  result = qword_256E073B8;
  if (!qword_256E073B8)
  {
    result = MEMORY[0x242667160](&unk_23F283C64, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073B8);
  }
  return result;
}

unint64_t sub_23F2438D0()
{
  unint64_t result;

  result = qword_256E073C0;
  if (!qword_256E073C0)
  {
    result = MEMORY[0x242667160](&unk_23F283D1C, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073C0);
  }
  return result;
}

unint64_t sub_23F243910()
{
  unint64_t result;

  result = qword_256E073C8;
  if (!qword_256E073C8)
  {
    result = MEMORY[0x242667160](&unk_23F283DD4, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073C8);
  }
  return result;
}

unint64_t sub_23F243950()
{
  unint64_t result;

  result = qword_256E073D0;
  if (!qword_256E073D0)
  {
    result = MEMORY[0x242667160](&unk_23F283E8C, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073D0);
  }
  return result;
}

unint64_t sub_23F243990()
{
  unint64_t result;

  result = qword_256E073D8;
  if (!qword_256E073D8)
  {
    result = MEMORY[0x242667160](&unk_23F283F44, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073D8);
  }
  return result;
}

unint64_t sub_23F2439D0()
{
  unint64_t result;

  result = qword_256E073E0;
  if (!qword_256E073E0)
  {
    result = MEMORY[0x242667160](&unk_23F283FFC, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073E0);
  }
  return result;
}

unint64_t sub_23F243A10()
{
  unint64_t result;

  result = qword_256E073E8;
  if (!qword_256E073E8)
  {
    result = MEMORY[0x242667160](&unk_23F2840B4, &type metadata for MessagePayload.ActionSummaryUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073E8);
  }
  return result;
}

unint64_t sub_23F243A50()
{
  unint64_t result;

  result = qword_256E073F0;
  if (!qword_256E073F0)
  {
    result = MEMORY[0x242667160](&unk_23F28416C, &type metadata for MessagePayload.ActionResolutionUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073F0);
  }
  return result;
}

unint64_t sub_23F243A90()
{
  unint64_t result;

  result = qword_256E073F8;
  if (!qword_256E073F8)
  {
    result = MEMORY[0x242667160](&unk_23F284224, &type metadata for MessagePayload.PlannerPromptDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E073F8);
  }
  return result;
}

unint64_t sub_23F243AD0()
{
  unint64_t result;

  result = qword_256E07400;
  if (!qword_256E07400)
  {
    result = MEMORY[0x242667160](&unk_23F2842DC, &type metadata for MessagePayload.StatusUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07400);
  }
  return result;
}

unint64_t sub_23F243B10()
{
  unint64_t result;

  result = qword_256E07408;
  if (!qword_256E07408)
  {
    result = MEMORY[0x242667160](&unk_23F284394, &type metadata for MessagePayload.ServerDebuggerEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07408);
  }
  return result;
}

unint64_t sub_23F243B50()
{
  unint64_t result;

  result = qword_256E07410;
  if (!qword_256E07410)
  {
    result = MEMORY[0x242667160](&unk_23F28444C, &type metadata for MessagePayload.ClientDebuggerEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07410);
  }
  return result;
}

unint64_t sub_23F243B90()
{
  unint64_t result;

  result = qword_256E07418;
  if (!qword_256E07418)
  {
    result = MEMORY[0x242667160](&unk_23F284504, &type metadata for MessagePayload.ActionSummaryUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07418);
  }
  return result;
}

unint64_t sub_23F243BD0()
{
  unint64_t result;

  result = qword_256E07420;
  if (!qword_256E07420)
  {
    result = MEMORY[0x242667160](&unk_23F2845BC, &type metadata for MessagePayload.ClientUndoRedoRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07420);
  }
  return result;
}

unint64_t sub_23F243C10()
{
  unint64_t result;

  result = qword_256E07428;
  if (!qword_256E07428)
  {
    result = MEMORY[0x242667160](&unk_23F284674, &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07428);
  }
  return result;
}

unint64_t sub_23F243C50()
{
  unint64_t result;

  result = qword_256E07430;
  if (!qword_256E07430)
  {
    result = MEMORY[0x242667160](&unk_23F28472C, &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07430);
  }
  return result;
}

unint64_t sub_23F243C90()
{
  unint64_t result;

  result = qword_256E07438;
  if (!qword_256E07438)
  {
    result = MEMORY[0x242667160](&unk_23F2847E4, &type metadata for MessagePayload.ExternalAgentOutcomeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07438);
  }
  return result;
}

unint64_t sub_23F243CD0()
{
  unint64_t result;

  result = qword_256E07440;
  if (!qword_256E07440)
  {
    result = MEMORY[0x242667160](&unk_23F28489C, &type metadata for MessagePayload.ExternalAgentRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07440);
  }
  return result;
}

unint64_t sub_23F243D10()
{
  unint64_t result;

  result = qword_256E07448;
  if (!qword_256E07448)
  {
    result = MEMORY[0x242667160](&unk_23F284954, &type metadata for MessagePayload.ExternalAgentSpeechQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07448);
  }
  return result;
}

unint64_t sub_23F243D50()
{
  unint64_t result;

  result = qword_256E07450;
  if (!qword_256E07450)
  {
    result = MEMORY[0x242667160](&unk_23F284A0C, &type metadata for MessagePayload.ExternalAgentTextQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07450);
  }
  return result;
}

unint64_t sub_23F243D90()
{
  unint64_t result;

  result = qword_256E07458;
  if (!qword_256E07458)
  {
    result = MEMORY[0x242667160](&unk_23F284AC4, &type metadata for MessagePayload.SafetyModeExceptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07458);
  }
  return result;
}

unint64_t sub_23F243DD0()
{
  unint64_t result;

  result = qword_256E07460;
  if (!qword_256E07460)
  {
    result = MEMORY[0x242667160](&unk_23F284B7C, &type metadata for MessagePayload.SafetyModeReleaseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07460);
  }
  return result;
}

unint64_t sub_23F243E10()
{
  unint64_t result;

  result = qword_256E07468;
  if (!qword_256E07468)
  {
    result = MEMORY[0x242667160](&unk_23F284C34, &type metadata for MessagePayload.ContextPrewarmCompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07468);
  }
  return result;
}

unint64_t sub_23F243E50()
{
  unint64_t result;

  result = qword_256E07470;
  if (!qword_256E07470)
  {
    result = MEMORY[0x242667160](&unk_23F284CEC, &type metadata for MessagePayload.ContextPrewarmRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07470);
  }
  return result;
}

unint64_t sub_23F243E90()
{
  unint64_t result;

  result = qword_256E07478;
  if (!qword_256E07478)
  {
    result = MEMORY[0x242667160](&unk_23F284DA4, &type metadata for MessagePayload.SystemResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07478);
  }
  return result;
}

unint64_t sub_23F243ED0()
{
  unint64_t result;

  result = qword_256E07480;
  if (!qword_256E07480)
  {
    result = MEMORY[0x242667160](&unk_23F284E5C, &type metadata for MessagePayload.ActionResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07480);
  }
  return result;
}

unint64_t sub_23F243F10()
{
  unint64_t result;

  result = qword_256E07488;
  if (!qword_256E07488)
  {
    result = MEMORY[0x242667160](&unk_23F284F14, &type metadata for MessagePayload.SystemPromptResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07488);
  }
  return result;
}

unint64_t sub_23F243F50()
{
  unint64_t result;

  result = qword_256E07490;
  if (!qword_256E07490)
  {
    result = MEMORY[0x242667160](&unk_23F284FCC, &type metadata for MessagePayload.SystemPromptRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07490);
  }
  return result;
}

unint64_t sub_23F243F90()
{
  unint64_t result;

  result = qword_256E07498;
  if (!qword_256E07498)
  {
    result = MEMORY[0x242667160](&unk_23F285084, &type metadata for MessagePayload.ClientIdentifierCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07498);
  }
  return result;
}

unint64_t sub_23F243FD0()
{
  unint64_t result;

  result = qword_256E074A0;
  if (!qword_256E074A0)
  {
    result = MEMORY[0x242667160](&unk_23F28513C, &type metadata for MessagePayload.ClientCustomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074A0);
  }
  return result;
}

unint64_t sub_23F244010()
{
  unint64_t result;

  result = qword_256E074A8;
  if (!qword_256E074A8)
  {
    result = MEMORY[0x242667160](&unk_23F2851F4, &type metadata for MessagePayload.ClientActionResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074A8);
  }
  return result;
}

unint64_t sub_23F244050()
{
  unint64_t result;

  result = qword_256E074B0;
  if (!qword_256E074B0)
  {
    result = MEMORY[0x242667160](&unk_23F2852AC, &type metadata for MessagePayload.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074B0);
  }
  return result;
}

unint64_t sub_23F244090()
{
  unint64_t result;

  result = qword_256E074B8;
  if (!qword_256E074B8)
  {
    result = MEMORY[0x242667160](&unk_23F285364, &type metadata for MessagePayload.ActionWillExecuteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074B8);
  }
  return result;
}

unint64_t sub_23F2440D0()
{
  unint64_t result;

  result = qword_256E074C0;
  if (!qword_256E074C0)
  {
    result = MEMORY[0x242667160](&unk_23F28541C, &type metadata for MessagePayload.ClientEffectResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074C0);
  }
  return result;
}

unint64_t sub_23F244110()
{
  unint64_t result;

  result = qword_256E074C8;
  if (!qword_256E074C8)
  {
    result = MEMORY[0x242667160](&unk_23F2854D4, &type metadata for MessagePayload.ClientEffectInvocationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074C8);
  }
  return result;
}

unint64_t sub_23F244150()
{
  unint64_t result;

  result = qword_256E074D0;
  if (!qword_256E074D0)
  {
    result = MEMORY[0x242667160](&unk_23F28558C, &type metadata for MessagePayload.DisambiguationNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074D0);
  }
  return result;
}

unint64_t sub_23F244190()
{
  unint64_t result;

  result = qword_256E074D8;
  if (!qword_256E074D8)
  {
    result = MEMORY[0x242667160](&unk_23F285644, &type metadata for MessagePayload.MockTranscriptCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074D8);
  }
  return result;
}

unint64_t sub_23F2441D0()
{
  unint64_t result;

  result = qword_256E074E0;
  if (!qword_256E074E0)
  {
    result = MEMORY[0x242667160](&unk_23F2856FC, &type metadata for MessagePayload.PrescribedPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074E0);
  }
  return result;
}

unint64_t sub_23F244210()
{
  unint64_t result;

  result = qword_256E074E8;
  if (!qword_256E074E8)
  {
    result = MEMORY[0x242667160](&unk_23F2857B4, &type metadata for MessagePayload.ClientInitiatedClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074E8);
  }
  return result;
}

unint64_t sub_23F244250()
{
  unint64_t result;

  result = qword_256E074F0;
  if (!qword_256E074F0)
  {
    result = MEMORY[0x242667160](&unk_23F28586C, &type metadata for MessagePayload.SpeechQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074F0);
  }
  return result;
}

unint64_t sub_23F244290()
{
  unint64_t result;

  result = qword_256E074F8;
  if (!qword_256E074F8)
  {
    result = MEMORY[0x242667160](&unk_23F285924, &type metadata for MessagePayload.QueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E074F8);
  }
  return result;
}

unint64_t sub_23F2442D0()
{
  unint64_t result;

  result = qword_256E07500;
  if (!qword_256E07500)
  {
    result = MEMORY[0x242667160](&unk_23F2859DC, &type metadata for MessagePayload.PlannerReturnedRawPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07500);
  }
  return result;
}

unint64_t sub_23F244310()
{
  unint64_t result;

  result = qword_256E07508;
  if (!qword_256E07508)
  {
    result = MEMORY[0x242667160](&unk_23F285A94, &type metadata for MessagePayload.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07508);
  }
  return result;
}

unint64_t sub_23F244350()
{
  unint64_t result;

  result = qword_256E07510;
  if (!qword_256E07510)
  {
    result = MEMORY[0x242667160](&unk_23F285B4C, &type metadata for MessagePayload.StepExecutedWithReturnedValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07510);
  }
  return result;
}

unint64_t sub_23F244390()
{
  unint64_t result;

  result = qword_256E07518;
  if (!qword_256E07518)
  {
    result = MEMORY[0x242667160](&unk_23F285C04, &type metadata for MessagePayload.EndOfPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07518);
  }
  return result;
}

unint64_t sub_23F2443D0()
{
  unint64_t result;

  result = qword_256E07520;
  if (!qword_256E07520)
  {
    result = MEMORY[0x242667160](&unk_23F285CBC, &type metadata for MessagePayload.SessionSuspendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07520);
  }
  return result;
}

unint64_t sub_23F244410()
{
  unint64_t result;

  result = qword_256E07528;
  if (!qword_256E07528)
  {
    result = MEMORY[0x242667160](&unk_23F285D74, &type metadata for MessagePayload.TerminateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07528);
  }
  return result;
}

unint64_t sub_23F244450()
{
  unint64_t result;

  result = qword_256E07530;
  if (!qword_256E07530)
  {
    result = MEMORY[0x242667160](&unk_23F285E2C, &type metadata for MessagePayload.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07530);
  }
  return result;
}

unint64_t sub_23F244490()
{
  unint64_t result;

  result = qword_256E07538;
  if (!qword_256E07538)
  {
    result = MEMORY[0x242667160](&unk_23F285EE4, &type metadata for MessagePayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07538);
  }
  return result;
}

unint64_t sub_23F2444D0()
{
  unint64_t result;

  result = qword_256E07540;
  if (!qword_256E07540)
  {
    result = MEMORY[0x242667160](&unk_23F285F9C, &type metadata for SystemPrompt.Prompt.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07540);
  }
  return result;
}

unint64_t sub_23F244510()
{
  unint64_t result;

  result = qword_256E07548;
  if (!qword_256E07548)
  {
    result = MEMORY[0x242667160](&unk_23F286054, &type metadata for SystemPrompt.Prompt.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07548);
  }
  return result;
}

unint64_t sub_23F244550()
{
  unint64_t result;

  result = qword_256E07550;
  if (!qword_256E07550)
  {
    result = MEMORY[0x242667160](&unk_23F28610C, &type metadata for SystemPrompt.Prompt.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07550);
  }
  return result;
}

unint64_t sub_23F244590()
{
  unint64_t result;

  result = qword_256E07558;
  if (!qword_256E07558)
  {
    result = MEMORY[0x242667160](&unk_23F2861C4, &type metadata for SystemPrompt.Prompt.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07558);
  }
  return result;
}

unint64_t sub_23F2445D0()
{
  unint64_t result;

  result = qword_256E07560;
  if (!qword_256E07560)
  {
    result = MEMORY[0x242667160](&unk_23F28627C, &type metadata for SystemPrompt.Prompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07560);
  }
  return result;
}

unint64_t sub_23F244610()
{
  unint64_t result;

  result = qword_256E07568;
  if (!qword_256E07568)
  {
    result = MEMORY[0x242667160](&unk_23F286334, &type metadata for SystemPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07568);
  }
  return result;
}

unint64_t sub_23F244650()
{
  unint64_t result;

  result = qword_256E07570;
  if (!qword_256E07570)
  {
    result = MEMORY[0x242667160](&unk_23F28648C, &type metadata for SystemPromptResolution.InputModality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07570);
  }
  return result;
}

unint64_t sub_23F244690()
{
  unint64_t result;

  result = qword_256E07578;
  if (!qword_256E07578)
  {
    result = MEMORY[0x242667160](&unk_23F286544, &type metadata for SystemPromptResolution.ResolutionInput.SpeechCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07578);
  }
  return result;
}

unint64_t sub_23F2446D0()
{
  unint64_t result;

  result = qword_256E07580;
  if (!qword_256E07580)
  {
    result = MEMORY[0x242667160](&unk_23F2865FC, &type metadata for SystemPromptResolution.ResolutionInput.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07580);
  }
  return result;
}

unint64_t sub_23F244710()
{
  unint64_t result;

  result = qword_256E07588;
  if (!qword_256E07588)
  {
    result = MEMORY[0x242667160](&unk_23F286754, &type metadata for SystemPromptResolution.ResolutionInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07588);
  }
  return result;
}

unint64_t sub_23F244750()
{
  unint64_t result;

  result = qword_256E07590;
  if (!qword_256E07590)
  {
    result = MEMORY[0x242667160](&unk_23F28680C, &type metadata for SystemPromptResolution.UserAction.ActionCanceledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07590);
  }
  return result;
}

unint64_t sub_23F244790()
{
  unint64_t result;

  result = qword_256E07598;
  if (!qword_256E07598)
  {
    result = MEMORY[0x242667160](&unk_23F2868C4, &type metadata for SystemPromptResolution.UserAction.RequirementAddressedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07598);
  }
  return result;
}

unint64_t sub_23F2447D0()
{
  unint64_t result;

  result = qword_256E075A0;
  if (!qword_256E075A0)
  {
    result = MEMORY[0x242667160](&unk_23F28697C, &type metadata for SystemPromptResolution.UserAction.DisambiguationIndexSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075A0);
  }
  return result;
}

unint64_t sub_23F244810()
{
  unint64_t result;

  result = qword_256E075A8;
  if (!qword_256E075A8)
  {
    result = MEMORY[0x242667160](&unk_23F286A34, &type metadata for SystemPromptResolution.UserAction.ParameterItemSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075A8);
  }
  return result;
}

unint64_t sub_23F244850()
{
  unint64_t result;

  result = qword_256E075B0;
  if (!qword_256E075B0)
  {
    result = MEMORY[0x242667160](&unk_23F286AEC, &type metadata for SystemPromptResolution.UserAction.ParameterConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075B0);
  }
  return result;
}

unint64_t sub_23F244890()
{
  unint64_t result;

  result = qword_256E075B8;
  if (!qword_256E075B8)
  {
    result = MEMORY[0x242667160](&unk_23F286BA4, &type metadata for SystemPromptResolution.UserAction.ParameterValueSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075B8);
  }
  return result;
}

unint64_t sub_23F2448D0()
{
  unint64_t result;

  result = qword_256E075C0;
  if (!qword_256E075C0)
  {
    result = MEMORY[0x242667160](&unk_23F286CAC, &type metadata for SystemPromptResolution.UserAction.ActionConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075C0);
  }
  return result;
}

unint64_t sub_23F244910()
{
  unint64_t result;

  result = qword_256E075C8;
  if (!qword_256E075C8)
  {
    result = MEMORY[0x242667160](&unk_23F286D64, &type metadata for SystemPromptResolution.UserAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075C8);
  }
  return result;
}

unint64_t sub_23F244950()
{
  unint64_t result;

  result = qword_256E075D0;
  if (!qword_256E075D0)
  {
    result = MEMORY[0x242667160](&unk_23F286E1C, &type metadata for SystemPromptResolution.RequirementResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075D0);
  }
  return result;
}

unint64_t sub_23F244990()
{
  unint64_t result;

  result = qword_256E075D8;
  if (!qword_256E075D8)
  {
    result = MEMORY[0x242667160](&unk_23F286F24, &type metadata for SystemPromptResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075D8);
  }
  return result;
}

unint64_t sub_23F2449D0()
{
  unint64_t result;

  result = qword_256E075E0;
  if (!qword_256E075E0)
  {
    result = MEMORY[0x242667160](&unk_23F286FDC, &type metadata for ActionResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075E0);
  }
  return result;
}

unint64_t sub_23F244A10()
{
  unint64_t result;

  result = qword_256E075E8;
  if (!qword_256E075E8)
  {
    result = MEMORY[0x242667160](&unk_23F287094, &type metadata for SystemResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075E8);
  }
  return result;
}

unint64_t sub_23F244A50()
{
  unint64_t result;

  result = qword_256E075F0;
  if (!qword_256E075F0)
  {
    result = MEMORY[0x242667160](&unk_23F28714C, &type metadata for InterpretedStatementResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075F0);
  }
  return result;
}

unint64_t sub_23F244A90()
{
  unint64_t result;

  result = qword_256E075F8;
  if (!qword_256E075F8)
  {
    result = MEMORY[0x242667160](&unk_23F287204, &type metadata for ActionOutcome.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E075F8);
  }
  return result;
}

unint64_t sub_23F244AD0()
{
  unint64_t result;

  result = qword_256E07600;
  if (!qword_256E07600)
  {
    result = MEMORY[0x242667160](&unk_23F2872BC, &type metadata for ActionOutcome.ValueDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07600);
  }
  return result;
}

unint64_t sub_23F244B10()
{
  unint64_t result;

  result = qword_256E07608;
  if (!qword_256E07608)
  {
    result = MEMORY[0x242667160](&unk_23F287374, &type metadata for ActionOutcome.ActionRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07608);
  }
  return result;
}

unint64_t sub_23F244B50()
{
  unint64_t result;

  result = qword_256E07610;
  if (!qword_256E07610)
  {
    result = MEMORY[0x242667160](&unk_23F28742C, &type metadata for ActionOutcome.ParameterCandidatesNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07610);
  }
  return result;
}

unint64_t sub_23F244B90()
{
  unint64_t result;

  result = qword_256E07618;
  if (!qword_256E07618)
  {
    result = MEMORY[0x242667160](&unk_23F2874E4, &type metadata for ActionOutcome.ParameterNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07618);
  }
  return result;
}

unint64_t sub_23F244BD0()
{
  unint64_t result;

  result = qword_256E07620;
  if (!qword_256E07620)
  {
    result = MEMORY[0x242667160](&unk_23F28759C, &type metadata for ActionOutcome.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07620);
  }
  return result;
}

unint64_t sub_23F244C10()
{
  unint64_t result;

  result = qword_256E07628;
  if (!qword_256E07628)
  {
    result = MEMORY[0x242667160](&unk_23F287654, &type metadata for ActionOutcome.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07628);
  }
  return result;
}

unint64_t sub_23F244C50()
{
  unint64_t result;

  result = qword_256E07630;
  if (!qword_256E07630)
  {
    result = MEMORY[0x242667160](&unk_23F28770C, &type metadata for ActionOutcome.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07630);
  }
  return result;
}

unint64_t sub_23F244C90()
{
  unint64_t result;

  result = qword_256E07638;
  if (!qword_256E07638)
  {
    result = MEMORY[0x242667160](&unk_23F2877C4, &type metadata for ActionOutcome.ToolDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07638);
  }
  return result;
}

unint64_t sub_23F244CD0()
{
  unint64_t result;

  result = qword_256E07640;
  if (!qword_256E07640)
  {
    result = MEMORY[0x242667160](&unk_23F28787C, &type metadata for ActionOutcome.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07640);
  }
  return result;
}

unint64_t sub_23F244D10()
{
  unint64_t result;

  result = qword_256E07648;
  if (!qword_256E07648)
  {
    result = MEMORY[0x242667160](&unk_23F287934, &type metadata for ActionOutcome.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07648);
  }
  return result;
}

unint64_t sub_23F244D50()
{
  unint64_t result;

  result = qword_256E07650;
  if (!qword_256E07650)
  {
    result = MEMORY[0x242667160](&unk_23F2879EC, &type metadata for ActionOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07650);
  }
  return result;
}

unint64_t sub_23F244D90()
{
  unint64_t result;

  result = qword_256E07658;
  if (!qword_256E07658)
  {
    result = MEMORY[0x242667160](&unk_23F287AA4, &type metadata for StatementOutcome.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07658);
  }
  return result;
}

unint64_t sub_23F244DD0()
{
  unint64_t result;

  result = qword_256E07660;
  if (!qword_256E07660)
  {
    result = MEMORY[0x242667160](&unk_23F287B5C, &type metadata for StatementOutcome.ValueDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07660);
  }
  return result;
}

unint64_t sub_23F244E10()
{
  unint64_t result;

  result = qword_256E07668;
  if (!qword_256E07668)
  {
    result = MEMORY[0x242667160](&unk_23F287C14, &type metadata for StatementOutcome.ActionRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07668);
  }
  return result;
}

unint64_t sub_23F244E50()
{
  unint64_t result;

  result = qword_256E07670;
  if (!qword_256E07670)
  {
    result = MEMORY[0x242667160](&unk_23F287CCC, &type metadata for StatementOutcome.ParameterCandidatesNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07670);
  }
  return result;
}

unint64_t sub_23F244E90()
{
  unint64_t result;

  result = qword_256E07678;
  if (!qword_256E07678)
  {
    result = MEMORY[0x242667160](&unk_23F287D84, &type metadata for StatementOutcome.ParameterNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07678);
  }
  return result;
}

unint64_t sub_23F244ED0()
{
  unint64_t result;

  result = qword_256E07680;
  if (!qword_256E07680)
  {
    result = MEMORY[0x242667160](&unk_23F287E3C, &type metadata for StatementOutcome.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07680);
  }
  return result;
}

unint64_t sub_23F244F10()
{
  unint64_t result;

  result = qword_256E07688;
  if (!qword_256E07688)
  {
    result = MEMORY[0x242667160](&unk_23F287EF4, &type metadata for StatementOutcome.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07688);
  }
  return result;
}

unint64_t sub_23F244F50()
{
  unint64_t result;

  result = qword_256E07690;
  if (!qword_256E07690)
  {
    result = MEMORY[0x242667160](&unk_23F287FAC, &type metadata for StatementOutcome.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07690);
  }
  return result;
}

unint64_t sub_23F244F90()
{
  unint64_t result;

  result = qword_256E07698;
  if (!qword_256E07698)
  {
    result = MEMORY[0x242667160](&unk_23F288064, &type metadata for StatementOutcome.ToolDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07698);
  }
  return result;
}

unint64_t sub_23F244FD0()
{
  unint64_t result;

  result = qword_256E076A0;
  if (!qword_256E076A0)
  {
    result = MEMORY[0x242667160](&unk_23F28811C, &type metadata for StatementOutcome.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076A0);
  }
  return result;
}

unint64_t sub_23F245010()
{
  unint64_t result;

  result = qword_256E076A8;
  if (!qword_256E076A8)
  {
    result = MEMORY[0x242667160](&unk_23F2881D4, &type metadata for StatementOutcome.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076A8);
  }
  return result;
}

unint64_t sub_23F245050()
{
  unint64_t result;

  result = qword_256E076B0;
  if (!qword_256E076B0)
  {
    result = MEMORY[0x242667160](&unk_23F28828C, &type metadata for StatementOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076B0);
  }
  return result;
}

unint64_t sub_23F245090()
{
  unint64_t result;

  result = qword_256E076B8;
  if (!qword_256E076B8)
  {
    result = MEMORY[0x242667160](&unk_23F288344, &type metadata for StatementID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076B8);
  }
  return result;
}

unint64_t sub_23F2450D0()
{
  unint64_t result;

  result = qword_256E076C0;
  if (!qword_256E076C0)
  {
    result = MEMORY[0x242667160](&unk_23F2883FC, &type metadata for ActionSuccess.UndoContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076C0);
  }
  return result;
}

unint64_t sub_23F245110()
{
  unint64_t result;

  result = qword_256E076C8;
  if (!qword_256E076C8)
  {
    result = MEMORY[0x242667160](&unk_23F2884B4, &type metadata for ActionSuccess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076C8);
  }
  return result;
}

unint64_t sub_23F245150()
{
  unint64_t result;

  result = qword_256E076D0;
  if (!qword_256E076D0)
  {
    result = MEMORY[0x242667160](&unk_23F2885BC, &type metadata for ActionRequirement.PermissionsRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076D0);
  }
  return result;
}

unint64_t sub_23F245190()
{
  unint64_t result;

  result = qword_256E076D8;
  if (!qword_256E076D8)
  {
    result = MEMORY[0x242667160](&unk_23F288674, &type metadata for ActionRequirement.AppRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076D8);
  }
  return result;
}

unint64_t sub_23F2451D0()
{
  unint64_t result;

  result = qword_256E076E0;
  if (!qword_256E076E0)
  {
    result = MEMORY[0x242667160](&unk_23F28872C, &type metadata for ActionRequirement.SystemRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076E0);
  }
  return result;
}

unint64_t sub_23F245210()
{
  unint64_t result;

  result = qword_256E076E8;
  if (!qword_256E076E8)
  {
    result = MEMORY[0x242667160](&unk_23F2887E4, &type metadata for ActionRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076E8);
  }
  return result;
}

unint64_t sub_23F245250()
{
  unint64_t result;

  result = qword_256E076F0;
  if (!qword_256E076F0)
  {
    result = MEMORY[0x242667160](&unk_23F28889C, &type metadata for SystemRequirement.ProtectedAppRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076F0);
  }
  return result;
}

unint64_t sub_23F245290()
{
  unint64_t result;

  result = qword_256E076F8;
  if (!qword_256E076F8)
  {
    result = MEMORY[0x242667160](&unk_23F2889F4, &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E076F8);
  }
  return result;
}

unint64_t sub_23F2452D0()
{
  unint64_t result;

  result = qword_256E07700;
  if (!qword_256E07700)
  {
    result = MEMORY[0x242667160](&unk_23F288AAC, &type metadata for SystemRequirement.AuthenticationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07700);
  }
  return result;
}

unint64_t sub_23F245310()
{
  unint64_t result;

  result = qword_256E07708;
  if (!qword_256E07708)
  {
    result = MEMORY[0x242667160](&unk_23F288B64, &type metadata for SystemRequirement.UserAuthenticationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07708);
  }
  return result;
}

unint64_t sub_23F245350()
{
  unint64_t result;

  result = qword_256E07710;
  if (!qword_256E07710)
  {
    result = MEMORY[0x242667160](&unk_23F288C1C, &type metadata for SystemRequirement.ProtectedAppApprovalRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07710);
  }
  return result;
}

unint64_t sub_23F245390()
{
  unint64_t result;

  result = qword_256E07718;
  if (!qword_256E07718)
  {
    result = MEMORY[0x242667160](&unk_23F288E64, &type metadata for SystemRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07718);
  }
  return result;
}

unint64_t sub_23F2453D0()
{
  unint64_t result;

  result = qword_256E07720;
  if (!qword_256E07720)
  {
    result = MEMORY[0x242667160](&unk_23F28900C, &type metadata for AppRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07720);
  }
  return result;
}

unint64_t sub_23F245410()
{
  unint64_t result;

  result = qword_256E07728;
  if (!qword_256E07728)
  {
    result = MEMORY[0x242667160](&unk_23F289344, &type metadata for PermissionRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07728);
  }
  return result;
}

unint64_t sub_23F245450()
{
  unint64_t result;

  result = qword_256E07730;
  if (!qword_256E07730)
  {
    result = MEMORY[0x242667160](&unk_23F28944C, &type metadata for ActionFailure.Failure.DeveloperDefinedErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07730);
  }
  return result;
}

unint64_t sub_23F245490()
{
  unint64_t result;

  result = qword_256E07738;
  if (!qword_256E07738)
  {
    result = MEMORY[0x242667160](&unk_23F2899B4, &type metadata for ActionFailure.Failure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07738);
  }
  return result;
}

unint64_t sub_23F2454D0()
{
  unint64_t result;

  result = qword_256E07740;
  if (!qword_256E07740)
  {
    result = MEMORY[0x242667160](&unk_23F289A6C, &type metadata for ActionFailure.DeveloperDefinedError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07740);
  }
  return result;
}

unint64_t sub_23F245510()
{
  unint64_t result;

  result = qword_256E07748;
  if (!qword_256E07748)
  {
    result = MEMORY[0x242667160](&unk_23F289B24, &type metadata for ActionFailure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07748);
  }
  return result;
}

unint64_t sub_23F245550()
{
  unint64_t result;

  result = qword_256E07750;
  if (!qword_256E07750)
  {
    result = MEMORY[0x242667160](&unk_23F289BDC, &type metadata for ActionConfirmation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07750);
  }
  return result;
}

unint64_t sub_23F245590()
{
  unint64_t result;

  result = qword_256E07758;
  if (!qword_256E07758)
  {
    result = MEMORY[0x242667160](&unk_23F289C94, &type metadata for ParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07758);
  }
  return result;
}

unint64_t sub_23F2455D0()
{
  unint64_t result;

  result = qword_256E07760;
  if (!qword_256E07760)
  {
    result = MEMORY[0x242667160](&unk_23F289D9C, &type metadata for PromptSelection.SelectedInDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07760);
  }
  return result;
}

unint64_t sub_23F245610()
{
  unint64_t result;

  result = qword_256E07768;
  if (!qword_256E07768)
  {
    result = MEMORY[0x242667160](&unk_23F289EA4, &type metadata for PromptSelection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07768);
  }
  return result;
}

unint64_t sub_23F245650()
{
  unint64_t result;

  result = qword_256E07770;
  if (!qword_256E07770)
  {
    result = MEMORY[0x242667160](&unk_23F289F5C, &type metadata for ParameterNeedsValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07770);
  }
  return result;
}

unint64_t sub_23F245690()
{
  unint64_t result;

  result = qword_256E07778;
  if (!qword_256E07778)
  {
    result = MEMORY[0x242667160](&unk_23F28A014, &type metadata for ParameterConfirmation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07778);
  }
  return result;
}

unint64_t sub_23F2456D0()
{
  unint64_t result;

  result = qword_256E07780;
  if (!qword_256E07780)
  {
    result = MEMORY[0x242667160](&unk_23F28A0CC, &type metadata for ParameterDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07780);
  }
  return result;
}

unint64_t sub_23F245710()
{
  unint64_t result;

  result = qword_256E07788;
  if (!qword_256E07788)
  {
    result = MEMORY[0x242667160](&unk_23F28A184, &type metadata for ValueDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07788);
  }
  return result;
}

unint64_t sub_23F245750()
{
  unint64_t result;

  result = qword_256E07790;
  if (!qword_256E07790)
  {
    result = MEMORY[0x242667160](&unk_23F28A23C, &type metadata for ParameterNotAllowed.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07790);
  }
  return result;
}

unint64_t sub_23F245790()
{
  unint64_t result;

  result = qword_256E07798;
  if (!qword_256E07798)
  {
    result = MEMORY[0x242667160](&unk_23F28A2F4, &type metadata for ParameterCandidatesNotFound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07798);
  }
  return result;
}

unint64_t sub_23F2457D0()
{
  unint64_t result;

  result = qword_256E077A0;
  if (!qword_256E077A0)
  {
    result = MEMORY[0x242667160](&unk_23F28A3AC, &type metadata for ToolDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077A0);
  }
  return result;
}

unint64_t sub_23F245810()
{
  unint64_t result;

  result = qword_256E077A8;
  if (!qword_256E077A8)
  {
    result = MEMORY[0x242667160](&unk_23F28A464, &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077A8);
  }
  return result;
}

unint64_t sub_23F245850()
{
  unint64_t result;

  result = qword_256E077B0;
  if (!qword_256E077B0)
  {
    result = MEMORY[0x242667160](&unk_23F28A51C, &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077B0);
  }
  return result;
}

unint64_t sub_23F245890()
{
  unint64_t result;

  result = qword_256E077B8;
  if (!qword_256E077B8)
  {
    result = MEMORY[0x242667160](&unk_23F28A5D4, &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077B8);
  }
  return result;
}

unint64_t sub_23F2458D0()
{
  unint64_t result;

  result = qword_256E077C0;
  if (!qword_256E077C0)
  {
    result = MEMORY[0x242667160](&unk_23F28A68C, &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077C0);
  }
  return result;
}

unint64_t sub_23F245910()
{
  unint64_t result;

  result = qword_256E077C8;
  if (!qword_256E077C8)
  {
    result = MEMORY[0x242667160](&unk_23F28A744, &type metadata for AppIntentsInvocationPreview.Parameter.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077C8);
  }
  return result;
}

unint64_t sub_23F245950()
{
  unint64_t result;

  result = qword_256E077D0;
  if (!qword_256E077D0)
  {
    result = MEMORY[0x242667160](&unk_23F28A7FC, &type metadata for AppIntentsInvocationPreview.Parameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077D0);
  }
  return result;
}

unint64_t sub_23F245990()
{
  unint64_t result;

  result = qword_256E077D8;
  if (!qword_256E077D8)
  {
    result = MEMORY[0x242667160](&unk_23F28A8B4, &type metadata for AppIntentsInvocationPreview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077D8);
  }
  return result;
}

unint64_t sub_23F2459D0()
{
  unint64_t result;

  result = qword_256E077E0;
  if (!qword_256E077E0)
  {
    result = MEMORY[0x242667160](&unk_23F28AB9C, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077E0);
  }
  return result;
}

unint64_t sub_23F245A10()
{
  unint64_t result;

  result = qword_256E077E8;
  if (!qword_256E077E8)
  {
    result = MEMORY[0x242667160](&unk_23F28AC54, &type metadata for PlannerPromptData.OnScreenContextValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077E8);
  }
  return result;
}

unint64_t sub_23F245A50()
{
  unint64_t result;

  result = qword_256E077F0;
  if (!qword_256E077F0)
  {
    result = MEMORY[0x242667160](&unk_23F28AD0C, &type metadata for PlannerPromptData.Tool.Definition.ToolDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077F0);
  }
  return result;
}

unint64_t sub_23F245A90()
{
  unint64_t result;

  result = qword_256E077F8;
  if (!qword_256E077F8)
  {
    result = MEMORY[0x242667160](&unk_23F28ADC4, &type metadata for PlannerPromptData.Tool.Definition.ClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E077F8);
  }
  return result;
}

unint64_t sub_23F245AD0()
{
  unint64_t result;

  result = qword_256E07800;
  if (!qword_256E07800)
  {
    result = MEMORY[0x242667160](&unk_23F28AE7C, &type metadata for PlannerPromptData.Tool.Definition.AssistantSchema.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07800);
  }
  return result;
}

unint64_t sub_23F245B10()
{
  unint64_t result;

  result = qword_256E07808;
  if (!qword_256E07808)
  {
    result = MEMORY[0x242667160](&unk_23F28AF34, &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07808);
  }
  return result;
}

unint64_t sub_23F245B50()
{
  unint64_t result;

  result = qword_256E07810;
  if (!qword_256E07810)
  {
    result = MEMORY[0x242667160](&unk_23F28AFEC, &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07810);
  }
  return result;
}

unint64_t sub_23F245B90()
{
  unint64_t result;

  result = qword_256E07818;
  if (!qword_256E07818)
  {
    result = MEMORY[0x242667160](&unk_23F28B0A4, &type metadata for PlannerPromptData.Tool.Definition.UiControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07818);
  }
  return result;
}

unint64_t sub_23F245BD0()
{
  unint64_t result;

  result = qword_256E07820;
  if (!qword_256E07820)
  {
    result = MEMORY[0x242667160](&unk_23F28B15C, &type metadata for PlannerPromptData.Tool.Definition.AssistantSchemaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07820);
  }
  return result;
}

unint64_t sub_23F245C10()
{
  unint64_t result;

  result = qword_256E07828;
  if (!qword_256E07828)
  {
    result = MEMORY[0x242667160](&unk_23F28B214, &type metadata for PlannerPromptData.Tool.Definition.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07828);
  }
  return result;
}

unint64_t sub_23F245C50()
{
  unint64_t result;

  result = qword_256E07830;
  if (!qword_256E07830)
  {
    result = MEMORY[0x242667160](&unk_23F28B2CC, &type metadata for PlannerPromptData.Tool.Definition.ToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07830);
  }
  return result;
}

unint64_t sub_23F245C90()
{
  unint64_t result;

  result = qword_256E07838;
  if (!qword_256E07838)
  {
    result = MEMORY[0x242667160](&unk_23F28B384, &type metadata for PlannerPromptData.Tool.Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07838);
  }
  return result;
}

unint64_t sub_23F245CD0()
{
  unint64_t result;

  result = qword_256E07840;
  if (!qword_256E07840)
  {
    result = MEMORY[0x242667160](&unk_23F28B43C, &type metadata for PlannerPromptData.Tool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07840);
  }
  return result;
}

unint64_t sub_23F245D10()
{
  unint64_t result;

  result = qword_256E07848;
  if (!qword_256E07848)
  {
    result = MEMORY[0x242667160](&unk_23F28B4F4, &type metadata for PlannerPromptData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07848);
  }
  return result;
}

unint64_t sub_23F245D50()
{
  unint64_t result;

  result = qword_256E07850;
  if (!qword_256E07850)
  {
    result = MEMORY[0x242667160](&unk_23F28B5AC, &type metadata for ActionResolutionUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07850);
  }
  return result;
}

unint64_t sub_23F245D90()
{
  unint64_t result;

  result = qword_256E07858;
  if (!qword_256E07858)
  {
    result = MEMORY[0x242667160](&unk_23F28B51C, &type metadata for ActionResolutionUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07858);
  }
  return result;
}

unint64_t sub_23F245DD0()
{
  unint64_t result;

  result = qword_256E07860;
  if (!qword_256E07860)
  {
    result = MEMORY[0x242667160](&unk_23F28B544, &type metadata for ActionResolutionUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07860);
  }
  return result;
}

unint64_t sub_23F245E10()
{
  unint64_t result;

  result = qword_256E07868;
  if (!qword_256E07868)
  {
    result = MEMORY[0x242667160](&unk_23F28B464, &type metadata for PlannerPromptData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07868);
  }
  return result;
}

unint64_t sub_23F245E50()
{
  unint64_t result;

  result = qword_256E07870;
  if (!qword_256E07870)
  {
    result = MEMORY[0x242667160](&unk_23F28B48C, &type metadata for PlannerPromptData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07870);
  }
  return result;
}

unint64_t sub_23F245E90()
{
  unint64_t result;

  result = qword_256E07878;
  if (!qword_256E07878)
  {
    result = MEMORY[0x242667160](&unk_23F28B3AC, &type metadata for PlannerPromptData.Tool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07878);
  }
  return result;
}

unint64_t sub_23F245ED0()
{
  unint64_t result;

  result = qword_256E07880;
  if (!qword_256E07880)
  {
    result = MEMORY[0x242667160](&unk_23F28B3D4, &type metadata for PlannerPromptData.Tool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07880);
  }
  return result;
}

unint64_t sub_23F245F10()
{
  unint64_t result;

  result = qword_256E07888;
  if (!qword_256E07888)
  {
    result = MEMORY[0x242667160](&unk_23F28B23C, &type metadata for PlannerPromptData.Tool.Definition.ToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07888);
  }
  return result;
}

unint64_t sub_23F245F50()
{
  unint64_t result;

  result = qword_256E07890;
  if (!qword_256E07890)
  {
    result = MEMORY[0x242667160](&unk_23F28B264, &type metadata for PlannerPromptData.Tool.Definition.ToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07890);
  }
  return result;
}

unint64_t sub_23F245F90()
{
  unint64_t result;

  result = qword_256E07898;
  if (!qword_256E07898)
  {
    result = MEMORY[0x242667160](&unk_23F28B184, &type metadata for PlannerPromptData.Tool.Definition.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07898);
  }
  return result;
}

unint64_t sub_23F245FD0()
{
  unint64_t result;

  result = qword_256E078A0;
  if (!qword_256E078A0)
  {
    result = MEMORY[0x242667160](&unk_23F28B1AC, &type metadata for PlannerPromptData.Tool.Definition.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078A0);
  }
  return result;
}

unint64_t sub_23F246010()
{
  unint64_t result;

  result = qword_256E078A8;
  if (!qword_256E078A8)
  {
    result = MEMORY[0x242667160](&unk_23F28B0CC, &type metadata for PlannerPromptData.Tool.Definition.AssistantSchemaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078A8);
  }
  return result;
}

unint64_t sub_23F246050()
{
  unint64_t result;

  result = qword_256E078B0;
  if (!qword_256E078B0)
  {
    result = MEMORY[0x242667160](&unk_23F28B0F4, &type metadata for PlannerPromptData.Tool.Definition.AssistantSchemaCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078B0);
  }
  return result;
}

unint64_t sub_23F246090()
{
  unint64_t result;

  result = qword_256E078B8;
  if (!qword_256E078B8)
  {
    result = MEMORY[0x242667160](&unk_23F28B014, &type metadata for PlannerPromptData.Tool.Definition.UiControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078B8);
  }
  return result;
}

unint64_t sub_23F2460D0()
{
  unint64_t result;

  result = qword_256E078C0;
  if (!qword_256E078C0)
  {
    result = MEMORY[0x242667160](&unk_23F28B03C, &type metadata for PlannerPromptData.Tool.Definition.UiControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078C0);
  }
  return result;
}

unint64_t sub_23F246110()
{
  unint64_t result;

  result = qword_256E078C8;
  if (!qword_256E078C8)
  {
    result = MEMORY[0x242667160](&unk_23F28B2F4, &type metadata for PlannerPromptData.Tool.Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078C8);
  }
  return result;
}

unint64_t sub_23F246150()
{
  unint64_t result;

  result = qword_256E078D0;
  if (!qword_256E078D0)
  {
    result = MEMORY[0x242667160](&unk_23F28B31C, &type metadata for PlannerPromptData.Tool.Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078D0);
  }
  return result;
}

unint64_t sub_23F246190()
{
  unint64_t result;

  result = qword_256E078D8;
  if (!qword_256E078D8)
  {
    result = MEMORY[0x242667160](&unk_23F28AF5C, &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078D8);
  }
  return result;
}

unint64_t sub_23F2461D0()
{
  unint64_t result;

  result = qword_256E078E0;
  if (!qword_256E078E0)
  {
    result = MEMORY[0x242667160](&unk_23F28AF84, &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078E0);
  }
  return result;
}

unint64_t sub_23F246210()
{
  unint64_t result;

  result = qword_256E078E8;
  if (!qword_256E078E8)
  {
    result = MEMORY[0x242667160](&unk_23F28AEA4, &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078E8);
  }
  return result;
}

unint64_t sub_23F246250()
{
  unint64_t result;

  result = qword_256E078F0;
  if (!qword_256E078F0)
  {
    result = MEMORY[0x242667160](&unk_23F28AECC, &type metadata for PlannerPromptData.Tool.Definition.UIControlTool.Command.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078F0);
  }
  return result;
}

unint64_t sub_23F246290()
{
  unint64_t result;

  result = qword_256E078F8;
  if (!qword_256E078F8)
  {
    result = MEMORY[0x242667160](&unk_23F28ADEC, &type metadata for PlannerPromptData.Tool.Definition.AssistantSchema.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E078F8);
  }
  return result;
}

unint64_t sub_23F2462D0()
{
  unint64_t result;

  result = qword_256E07900;
  if (!qword_256E07900)
  {
    result = MEMORY[0x242667160](&unk_23F28AE14, &type metadata for PlannerPromptData.Tool.Definition.AssistantSchema.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07900);
  }
  return result;
}

unint64_t sub_23F246310()
{
  unint64_t result;

  result = qword_256E07908;
  if (!qword_256E07908)
  {
    result = MEMORY[0x242667160](&unk_23F28AD34, &type metadata for PlannerPromptData.Tool.Definition.ClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07908);
  }
  return result;
}

unint64_t sub_23F246350()
{
  unint64_t result;

  result = qword_256E07910;
  if (!qword_256E07910)
  {
    result = MEMORY[0x242667160](&unk_23F28AD5C, &type metadata for PlannerPromptData.Tool.Definition.ClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07910);
  }
  return result;
}

unint64_t sub_23F246390()
{
  unint64_t result;

  result = qword_256E07918;
  if (!qword_256E07918)
  {
    result = MEMORY[0x242667160](&unk_23F28AC7C, &type metadata for PlannerPromptData.Tool.Definition.ToolDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07918);
  }
  return result;
}

unint64_t sub_23F2463D0()
{
  unint64_t result;

  result = qword_256E07920;
  if (!qword_256E07920)
  {
    result = MEMORY[0x242667160](&unk_23F28ACA4, &type metadata for PlannerPromptData.Tool.Definition.ToolDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07920);
  }
  return result;
}

unint64_t sub_23F246410()
{
  unint64_t result;

  result = qword_256E07928;
  if (!qword_256E07928)
  {
    result = MEMORY[0x242667160](&unk_23F28ABC4, &type metadata for PlannerPromptData.OnScreenContextValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07928);
  }
  return result;
}

unint64_t sub_23F246450()
{
  unint64_t result;

  result = qword_256E07930;
  if (!qword_256E07930)
  {
    result = MEMORY[0x242667160](&unk_23F28ABEC, &type metadata for PlannerPromptData.OnScreenContextValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07930);
  }
  return result;
}

unint64_t sub_23F246490()
{
  unint64_t result;

  result = qword_256E07938;
  if (!qword_256E07938)
  {
    result = MEMORY[0x242667160](&unk_23F28AABC, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.InFocusAppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07938);
  }
  return result;
}

unint64_t sub_23F2464D0()
{
  unint64_t result;

  result = qword_256E07940;
  if (!qword_256E07940)
  {
    result = MEMORY[0x242667160](&unk_23F28AAE4, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.InFocusAppCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07940);
  }
  return result;
}

unint64_t sub_23F246510()
{
  unint64_t result;

  result = qword_256E07948;
  if (!qword_256E07948)
  {
    result = MEMORY[0x242667160](&unk_23F28AA6C, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenPersonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07948);
  }
  return result;
}

unint64_t sub_23F246550()
{
  unint64_t result;

  result = qword_256E07950;
  if (!qword_256E07950)
  {
    result = MEMORY[0x242667160](&unk_23F28AA94, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenPersonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07950);
  }
  return result;
}

unint64_t sub_23F246590()
{
  unint64_t result;

  result = qword_256E07958;
  if (!qword_256E07958)
  {
    result = MEMORY[0x242667160](&unk_23F28AA1C, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPostalAddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07958);
  }
  return result;
}

unint64_t sub_23F2465D0()
{
  unint64_t result;

  result = qword_256E07960;
  if (!qword_256E07960)
  {
    result = MEMORY[0x242667160](&unk_23F28AA44, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPostalAddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07960);
  }
  return result;
}

unint64_t sub_23F246610()
{
  unint64_t result;

  result = qword_256E07968;
  if (!qword_256E07968)
  {
    result = MEMORY[0x242667160](&unk_23F28A9CC, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentAppEntityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07968);
  }
  return result;
}

unint64_t sub_23F246650()
{
  unint64_t result;

  result = qword_256E07970;
  if (!qword_256E07970)
  {
    result = MEMORY[0x242667160](&unk_23F28A9F4, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentAppEntityCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07970);
  }
  return result;
}

unint64_t sub_23F246690()
{
  unint64_t result;

  result = qword_256E07978;
  if (!qword_256E07978)
  {
    result = MEMORY[0x242667160](&unk_23F28A97C, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentEmailAddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07978);
  }
  return result;
}

unint64_t sub_23F2466D0()
{
  unint64_t result;

  result = qword_256E07980;
  if (!qword_256E07980)
  {
    result = MEMORY[0x242667160](&unk_23F28A9A4, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentEmailAddressCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07980);
  }
  return result;
}

unint64_t sub_23F246710()
{
  unint64_t result;

  result = qword_256E07988;
  if (!qword_256E07988)
  {
    result = MEMORY[0x242667160](&unk_23F28A92C, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPhoneNumberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07988);
  }
  return result;
}

unint64_t sub_23F246750()
{
  unint64_t result;

  result = qword_256E07990;
  if (!qword_256E07990)
  {
    result = MEMORY[0x242667160](&unk_23F28A954, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentPhoneNumberCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07990);
  }
  return result;
}

unint64_t sub_23F246790()
{
  unint64_t result;

  result = qword_256E07998;
  if (!qword_256E07998)
  {
    result = MEMORY[0x242667160](&unk_23F28A8DC, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentUriLinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07998);
  }
  return result;
}

unint64_t sub_23F2467D0()
{
  unint64_t result;

  result = qword_256E079A0;
  if (!qword_256E079A0)
  {
    result = MEMORY[0x242667160](&unk_23F28A904, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.OnScreenContentUriLinkCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079A0);
  }
  return result;
}

unint64_t sub_23F246810()
{
  unint64_t result;

  result = qword_256E079A8;
  if (!qword_256E079A8)
  {
    result = MEMORY[0x242667160](&unk_23F28AB0C, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079A8);
  }
  return result;
}

unint64_t sub_23F246850()
{
  unint64_t result;

  result = qword_256E079B0;
  if (!qword_256E079B0)
  {
    result = MEMORY[0x242667160](&unk_23F28AB34, &type metadata for PlannerPromptData.OnScreenContextValue.ContextType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079B0);
  }
  return result;
}

unint64_t sub_23F246890()
{
  unint64_t result;

  result = qword_256E079B8;
  if (!qword_256E079B8)
  {
    result = MEMORY[0x242667160](&unk_23F28A824, &type metadata for AppIntentsInvocationPreview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079B8);
  }
  return result;
}

unint64_t sub_23F2468D0()
{
  unint64_t result;

  result = qword_256E079C0;
  if (!qword_256E079C0)
  {
    result = MEMORY[0x242667160](&unk_23F28A84C, &type metadata for AppIntentsInvocationPreview.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079C0);
  }
  return result;
}

unint64_t sub_23F246910()
{
  unint64_t result;

  result = qword_256E079C8;
  if (!qword_256E079C8)
  {
    result = MEMORY[0x242667160](&unk_23F28A76C, &type metadata for AppIntentsInvocationPreview.Parameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079C8);
  }
  return result;
}

unint64_t sub_23F246950()
{
  unint64_t result;

  result = qword_256E079D0;
  if (!qword_256E079D0)
  {
    result = MEMORY[0x242667160](&unk_23F28A794, &type metadata for AppIntentsInvocationPreview.Parameter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079D0);
  }
  return result;
}

unint64_t sub_23F246990()
{
  unint64_t result;

  result = qword_256E079D8;
  if (!qword_256E079D8)
  {
    result = MEMORY[0x242667160](&unk_23F28A5FC, &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079D8);
  }
  return result;
}

unint64_t sub_23F2469D0()
{
  unint64_t result;

  result = qword_256E079E0;
  if (!qword_256E079E0)
  {
    result = MEMORY[0x242667160](&unk_23F28A624, &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079E0);
  }
  return result;
}

unint64_t sub_23F246A10()
{
  unint64_t result;

  result = qword_256E079E8;
  if (!qword_256E079E8)
  {
    result = MEMORY[0x242667160](&unk_23F28A544, &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079E8);
  }
  return result;
}

unint64_t sub_23F246A50()
{
  unint64_t result;

  result = qword_256E079F0;
  if (!qword_256E079F0)
  {
    result = MEMORY[0x242667160](&unk_23F28A56C, &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079F0);
  }
  return result;
}

unint64_t sub_23F246A90()
{
  unint64_t result;

  result = qword_256E079F8;
  if (!qword_256E079F8)
  {
    result = MEMORY[0x242667160](&unk_23F28A6B4, &type metadata for AppIntentsInvocationPreview.Parameter.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E079F8);
  }
  return result;
}

unint64_t sub_23F246AD0()
{
  unint64_t result;

  result = qword_256E07A00;
  if (!qword_256E07A00)
  {
    result = MEMORY[0x242667160](&unk_23F28A6DC, &type metadata for AppIntentsInvocationPreview.Parameter.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A00);
  }
  return result;
}

unint64_t sub_23F246B10()
{
  unint64_t result;

  result = qword_256E07A08;
  if (!qword_256E07A08)
  {
    result = MEMORY[0x242667160](&unk_23F28A48C, &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A08);
  }
  return result;
}

unint64_t sub_23F246B50()
{
  unint64_t result;

  result = qword_256E07A10;
  if (!qword_256E07A10)
  {
    result = MEMORY[0x242667160](&unk_23F28A4B4, &type metadata for AppIntentsInvocationPreview.Parameter.Value.ArrayValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A10);
  }
  return result;
}

unint64_t sub_23F246B90()
{
  unint64_t result;

  result = qword_256E07A18;
  if (!qword_256E07A18)
  {
    result = MEMORY[0x242667160](&unk_23F28A3D4, &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A18);
  }
  return result;
}

unint64_t sub_23F246BD0()
{
  unint64_t result;

  result = qword_256E07A20;
  if (!qword_256E07A20)
  {
    result = MEMORY[0x242667160](&unk_23F28A3FC, &type metadata for AppIntentsInvocationPreview.Parameter.Value.StringValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A20);
  }
  return result;
}

unint64_t sub_23F246C10()
{
  unint64_t result;

  result = qword_256E07A28;
  if (!qword_256E07A28)
  {
    result = MEMORY[0x242667160](&unk_23F28A31C, &type metadata for ToolDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A28);
  }
  return result;
}

unint64_t sub_23F246C50()
{
  unint64_t result;

  result = qword_256E07A30;
  if (!qword_256E07A30)
  {
    result = MEMORY[0x242667160](&unk_23F28A344, &type metadata for ToolDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A30);
  }
  return result;
}

unint64_t sub_23F246C90()
{
  unint64_t result;

  result = qword_256E07A38;
  if (!qword_256E07A38)
  {
    result = MEMORY[0x242667160](&unk_23F28A264, &type metadata for ParameterCandidatesNotFound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A38);
  }
  return result;
}

unint64_t sub_23F246CD0()
{
  unint64_t result;

  result = qword_256E07A40;
  if (!qword_256E07A40)
  {
    result = MEMORY[0x242667160](&unk_23F28A28C, &type metadata for ParameterCandidatesNotFound.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A40);
  }
  return result;
}

unint64_t sub_23F246D10()
{
  unint64_t result;

  result = qword_256E07A48;
  if (!qword_256E07A48)
  {
    result = MEMORY[0x242667160](&unk_23F28A1AC, &type metadata for ParameterNotAllowed.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A48);
  }
  return result;
}

unint64_t sub_23F246D50()
{
  unint64_t result;

  result = qword_256E07A50;
  if (!qword_256E07A50)
  {
    result = MEMORY[0x242667160](&unk_23F28A1D4, &type metadata for ParameterNotAllowed.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A50);
  }
  return result;
}

unint64_t sub_23F246D90()
{
  unint64_t result;

  result = qword_256E07A58;
  if (!qword_256E07A58)
  {
    result = MEMORY[0x242667160](&unk_23F28A0F4, &type metadata for ValueDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A58);
  }
  return result;
}

unint64_t sub_23F246DD0()
{
  unint64_t result;

  result = qword_256E07A60;
  if (!qword_256E07A60)
  {
    result = MEMORY[0x242667160](&unk_23F28A11C, &type metadata for ValueDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A60);
  }
  return result;
}

unint64_t sub_23F246E10()
{
  unint64_t result;

  result = qword_256E07A68;
  if (!qword_256E07A68)
  {
    result = MEMORY[0x242667160](&unk_23F28A03C, &type metadata for ParameterDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A68);
  }
  return result;
}

unint64_t sub_23F246E50()
{
  unint64_t result;

  result = qword_256E07A70;
  if (!qword_256E07A70)
  {
    result = MEMORY[0x242667160](&unk_23F28A064, &type metadata for ParameterDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A70);
  }
  return result;
}

unint64_t sub_23F246E90()
{
  unint64_t result;

  result = qword_256E07A78;
  if (!qword_256E07A78)
  {
    result = MEMORY[0x242667160](&unk_23F289F84, &type metadata for ParameterConfirmation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A78);
  }
  return result;
}

unint64_t sub_23F246ED0()
{
  unint64_t result;

  result = qword_256E07A80;
  if (!qword_256E07A80)
  {
    result = MEMORY[0x242667160](&unk_23F289FAC, &type metadata for ParameterConfirmation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A80);
  }
  return result;
}

unint64_t sub_23F246F10()
{
  unint64_t result;

  result = qword_256E07A88;
  if (!qword_256E07A88)
  {
    result = MEMORY[0x242667160](&unk_23F289ECC, &type metadata for ParameterNeedsValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A88);
  }
  return result;
}

unint64_t sub_23F246F50()
{
  unint64_t result;

  result = qword_256E07A90;
  if (!qword_256E07A90)
  {
    result = MEMORY[0x242667160](&unk_23F289EF4, &type metadata for ParameterNeedsValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A90);
  }
  return result;
}

unint64_t sub_23F246F90()
{
  unint64_t result;

  result = qword_256E07A98;
  if (!qword_256E07A98)
  {
    result = MEMORY[0x242667160](&unk_23F289DC4, &type metadata for PromptSelection.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07A98);
  }
  return result;
}

unint64_t sub_23F246FD0()
{
  unint64_t result;

  result = qword_256E07AA0;
  if (!qword_256E07AA0)
  {
    result = MEMORY[0x242667160](&unk_23F289DEC, &type metadata for PromptSelection.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AA0);
  }
  return result;
}

unint64_t sub_23F247010()
{
  unint64_t result;

  result = qword_256E07AA8;
  if (!qword_256E07AA8)
  {
    result = MEMORY[0x242667160](&unk_23F289D0C, &type metadata for PromptSelection.SelectedInDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AA8);
  }
  return result;
}

unint64_t sub_23F247050()
{
  unint64_t result;

  result = qword_256E07AB0;
  if (!qword_256E07AB0)
  {
    result = MEMORY[0x242667160](&unk_23F289D34, &type metadata for PromptSelection.SelectedInDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AB0);
  }
  return result;
}

unint64_t sub_23F247090()
{
  unint64_t result;

  result = qword_256E07AB8;
  if (!qword_256E07AB8)
  {
    result = MEMORY[0x242667160](&unk_23F289CBC, &type metadata for PromptSelection.DeniedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AB8);
  }
  return result;
}

unint64_t sub_23F2470D0()
{
  unint64_t result;

  result = qword_256E07AC0;
  if (!qword_256E07AC0)
  {
    result = MEMORY[0x242667160](&unk_23F289CE4, &type metadata for PromptSelection.DeniedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AC0);
  }
  return result;
}

unint64_t sub_23F247110()
{
  unint64_t result;

  result = qword_256E07AC8;
  if (!qword_256E07AC8)
  {
    result = MEMORY[0x242667160](&unk_23F289E14, &type metadata for PromptSelection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AC8);
  }
  return result;
}

unint64_t sub_23F247150()
{
  unint64_t result;

  result = qword_256E07AD0;
  if (!qword_256E07AD0)
  {
    result = MEMORY[0x242667160](&unk_23F289E3C, &type metadata for PromptSelection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AD0);
  }
  return result;
}

unint64_t sub_23F247190()
{
  unint64_t result;

  result = qword_256E07AD8;
  if (!qword_256E07AD8)
  {
    result = MEMORY[0x242667160](&unk_23F289C04, &type metadata for ParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AD8);
  }
  return result;
}

unint64_t sub_23F2471D0()
{
  unint64_t result;

  result = qword_256E07AE0;
  if (!qword_256E07AE0)
  {
    result = MEMORY[0x242667160](&unk_23F289C2C, &type metadata for ParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AE0);
  }
  return result;
}

unint64_t sub_23F247210()
{
  unint64_t result;

  result = qword_256E07AE8;
  if (!qword_256E07AE8)
  {
    result = MEMORY[0x242667160](&unk_23F289B4C, &type metadata for ActionConfirmation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AE8);
  }
  return result;
}

unint64_t sub_23F247250()
{
  unint64_t result;

  result = qword_256E07AF0;
  if (!qword_256E07AF0)
  {
    result = MEMORY[0x242667160](&unk_23F289B74, &type metadata for ActionConfirmation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AF0);
  }
  return result;
}

unint64_t sub_23F247290()
{
  unint64_t result;

  result = qword_256E07AF8;
  if (!qword_256E07AF8)
  {
    result = MEMORY[0x242667160](&unk_23F289A94, &type metadata for ActionFailure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07AF8);
  }
  return result;
}

unint64_t sub_23F2472D0()
{
  unint64_t result;

  result = qword_256E07B00;
  if (!qword_256E07B00)
  {
    result = MEMORY[0x242667160](&unk_23F289ABC, &type metadata for ActionFailure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B00);
  }
  return result;
}

unint64_t sub_23F247310()
{
  unint64_t result;

  result = qword_256E07B08;
  if (!qword_256E07B08)
  {
    result = MEMORY[0x242667160](&unk_23F2899DC, &type metadata for ActionFailure.DeveloperDefinedError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B08);
  }
  return result;
}

unint64_t sub_23F247350()
{
  unint64_t result;

  result = qword_256E07B10;
  if (!qword_256E07B10)
  {
    result = MEMORY[0x242667160](&unk_23F289A04, &type metadata for ActionFailure.DeveloperDefinedError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B10);
  }
  return result;
}

unint64_t sub_23F247390()
{
  unint64_t result;

  result = qword_256E07B18;
  if (!qword_256E07B18)
  {
    result = MEMORY[0x242667160](&unk_23F2898D4, &type metadata for ActionFailure.Failure.PreflightCheckFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B18);
  }
  return result;
}

unint64_t sub_23F2473D0()
{
  unint64_t result;

  result = qword_256E07B20;
  if (!qword_256E07B20)
  {
    result = MEMORY[0x242667160](&unk_23F2898FC, &type metadata for ActionFailure.Failure.PreflightCheckFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B20);
  }
  return result;
}

unint64_t sub_23F247410()
{
  unint64_t result;

  result = qword_256E07B28;
  if (!qword_256E07B28)
  {
    result = MEMORY[0x242667160](&unk_23F289884, &type metadata for ActionFailure.Failure.PreciseLocationDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B28);
  }
  return result;
}

unint64_t sub_23F247450()
{
  unint64_t result;

  result = qword_256E07B30;
  if (!qword_256E07B30)
  {
    result = MEMORY[0x242667160](&unk_23F2898AC, &type metadata for ActionFailure.Failure.PreciseLocationDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B30);
  }
  return result;
}

unint64_t sub_23F247490()
{
  unint64_t result;

  result = qword_256E07B38;
  if (!qword_256E07B38)
  {
    result = MEMORY[0x242667160](&unk_23F289834, &type metadata for ActionFailure.Failure.LocationDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B38);
  }
  return result;
}

unint64_t sub_23F2474D0()
{
  unint64_t result;

  result = qword_256E07B40;
  if (!qword_256E07B40)
  {
    result = MEMORY[0x242667160](&unk_23F28985C, &type metadata for ActionFailure.Failure.LocationDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B40);
  }
  return result;
}

unint64_t sub_23F247510()
{
  unint64_t result;

  result = qword_256E07B48;
  if (!qword_256E07B48)
  {
    result = MEMORY[0x242667160](&unk_23F2897E4, &type metadata for ActionFailure.Failure.WifiDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B48);
  }
  return result;
}

unint64_t sub_23F247550()
{
  unint64_t result;

  result = qword_256E07B50;
  if (!qword_256E07B50)
  {
    result = MEMORY[0x242667160](&unk_23F28980C, &type metadata for ActionFailure.Failure.WifiDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B50);
  }
  return result;
}

unint64_t sub_23F247590()
{
  unint64_t result;

  result = qword_256E07B58;
  if (!qword_256E07B58)
  {
    result = MEMORY[0x242667160](&unk_23F289794, &type metadata for ActionFailure.Failure.BluetoothDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B58);
  }
  return result;
}

unint64_t sub_23F2475D0()
{
  unint64_t result;

  result = qword_256E07B60;
  if (!qword_256E07B60)
  {
    result = MEMORY[0x242667160](&unk_23F2897BC, &type metadata for ActionFailure.Failure.BluetoothDisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B60);
  }
  return result;
}

unint64_t sub_23F247610()
{
  unint64_t result;

  result = qword_256E07B68;
  if (!qword_256E07B68)
  {
    result = MEMORY[0x242667160](&unk_23F289744, &type metadata for ActionFailure.Failure.NetworkFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B68);
  }
  return result;
}

unint64_t sub_23F247650()
{
  unint64_t result;

  result = qword_256E07B70;
  if (!qword_256E07B70)
  {
    result = MEMORY[0x242667160](&unk_23F28976C, &type metadata for ActionFailure.Failure.NetworkFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B70);
  }
  return result;
}

unint64_t sub_23F247690()
{
  unint64_t result;

  result = qword_256E07B78;
  if (!qword_256E07B78)
  {
    result = MEMORY[0x242667160](&unk_23F2896F4, &type metadata for ActionFailure.Failure.PartialFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B78);
  }
  return result;
}

unint64_t sub_23F2476D0()
{
  unint64_t result;

  result = qword_256E07B80;
  if (!qword_256E07B80)
  {
    result = MEMORY[0x242667160](&unk_23F28971C, &type metadata for ActionFailure.Failure.PartialFailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B80);
  }
  return result;
}

unint64_t sub_23F247710()
{
  unint64_t result;

  result = qword_256E07B88;
  if (!qword_256E07B88)
  {
    result = MEMORY[0x242667160](&unk_23F2896A4, &type metadata for ActionFailure.Failure.UnsupportedOnDeviceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B88);
  }
  return result;
}

unint64_t sub_23F247750()
{
  unint64_t result;

  result = qword_256E07B90;
  if (!qword_256E07B90)
  {
    result = MEMORY[0x242667160](&unk_23F2896CC, &type metadata for ActionFailure.Failure.UnsupportedOnDeviceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B90);
  }
  return result;
}

unint64_t sub_23F247790()
{
  unint64_t result;

  result = qword_256E07B98;
  if (!qword_256E07B98)
  {
    result = MEMORY[0x242667160](&unk_23F289654, &type metadata for ActionFailure.Failure.FeatureCurrentlyRestrictedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07B98);
  }
  return result;
}

unint64_t sub_23F2477D0()
{
  unint64_t result;

  result = qword_256E07BA0;
  if (!qword_256E07BA0)
  {
    result = MEMORY[0x242667160](&unk_23F28967C, &type metadata for ActionFailure.Failure.FeatureCurrentlyRestrictedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BA0);
  }
  return result;
}

unint64_t sub_23F247810()
{
  unint64_t result;

  result = qword_256E07BA8;
  if (!qword_256E07BA8)
  {
    result = MEMORY[0x242667160](&unk_23F289604, &type metadata for ActionFailure.Failure.EntityNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BA8);
  }
  return result;
}

unint64_t sub_23F247850()
{
  unint64_t result;

  result = qword_256E07BB0;
  if (!qword_256E07BB0)
  {
    result = MEMORY[0x242667160](&unk_23F28962C, &type metadata for ActionFailure.Failure.EntityNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BB0);
  }
  return result;
}

unint64_t sub_23F247890()
{
  unint64_t result;

  result = qword_256E07BB8;
  if (!qword_256E07BB8)
  {
    result = MEMORY[0x242667160](&unk_23F2895B4, &type metadata for ActionFailure.Failure.ActionNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BB8);
  }
  return result;
}

unint64_t sub_23F2478D0()
{
  unint64_t result;

  result = qword_256E07BC0;
  if (!qword_256E07BC0)
  {
    result = MEMORY[0x242667160](&unk_23F2895DC, &type metadata for ActionFailure.Failure.ActionNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BC0);
  }
  return result;
}

unint64_t sub_23F247910()
{
  unint64_t result;

  result = qword_256E07BC8;
  if (!qword_256E07BC8)
  {
    result = MEMORY[0x242667160](&unk_23F289564, &type metadata for ActionFailure.Failure.ValueDisambiguationRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BC8);
  }
  return result;
}

unint64_t sub_23F247950()
{
  unint64_t result;

  result = qword_256E07BD0;
  if (!qword_256E07BD0)
  {
    result = MEMORY[0x242667160](&unk_23F28958C, &type metadata for ActionFailure.Failure.ValueDisambiguationRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BD0);
  }
  return result;
}

unint64_t sub_23F247990()
{
  unint64_t result;

  result = qword_256E07BD8;
  if (!qword_256E07BD8)
  {
    result = MEMORY[0x242667160](&unk_23F289514, &type metadata for ActionFailure.Failure.NoMatchingToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BD8);
  }
  return result;
}

unint64_t sub_23F2479D0()
{
  unint64_t result;

  result = qword_256E07BE0;
  if (!qword_256E07BE0)
  {
    result = MEMORY[0x242667160](&unk_23F28953C, &type metadata for ActionFailure.Failure.NoMatchingToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BE0);
  }
  return result;
}

unint64_t sub_23F247A10()
{
  unint64_t result;

  result = qword_256E07BE8;
  if (!qword_256E07BE8)
  {
    result = MEMORY[0x242667160](&unk_23F2894C4, &type metadata for ActionFailure.Failure.UnableToUndoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BE8);
  }
  return result;
}

unint64_t sub_23F247A50()
{
  unint64_t result;

  result = qword_256E07BF0;
  if (!qword_256E07BF0)
  {
    result = MEMORY[0x242667160](&unk_23F2894EC, &type metadata for ActionFailure.Failure.UnableToUndoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BF0);
  }
  return result;
}

unint64_t sub_23F247A90()
{
  unint64_t result;

  result = qword_256E07BF8;
  if (!qword_256E07BF8)
  {
    result = MEMORY[0x242667160](&unk_23F289474, &type metadata for ActionFailure.Failure.ActionCanceledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07BF8);
  }
  return result;
}

unint64_t sub_23F247AD0()
{
  unint64_t result;

  result = qword_256E07C00;
  if (!qword_256E07C00)
  {
    result = MEMORY[0x242667160](&unk_23F28949C, &type metadata for ActionFailure.Failure.ActionCanceledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C00);
  }
  return result;
}

unint64_t sub_23F247B10()
{
  unint64_t result;

  result = qword_256E07C08;
  if (!qword_256E07C08)
  {
    result = MEMORY[0x242667160](&unk_23F2893BC, &type metadata for ActionFailure.Failure.DeveloperDefinedErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C08);
  }
  return result;
}

unint64_t sub_23F247B50()
{
  unint64_t result;

  result = qword_256E07C10;
  if (!qword_256E07C10)
  {
    result = MEMORY[0x242667160](&unk_23F2893E4, &type metadata for ActionFailure.Failure.DeveloperDefinedErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C10);
  }
  return result;
}

unint64_t sub_23F247B90()
{
  unint64_t result;

  result = qword_256E07C18;
  if (!qword_256E07C18)
  {
    result = MEMORY[0x242667160](&unk_23F28936C, &type metadata for ActionFailure.Failure.UnableToCancelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C18);
  }
  return result;
}

unint64_t sub_23F247BD0()
{
  unint64_t result;

  result = qword_256E07C20;
  if (!qword_256E07C20)
  {
    result = MEMORY[0x242667160](&unk_23F289394, &type metadata for ActionFailure.Failure.UnableToCancelCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C20);
  }
  return result;
}

unint64_t sub_23F247C10()
{
  unint64_t result;

  result = qword_256E07C28;
  if (!qword_256E07C28)
  {
    result = MEMORY[0x242667160](&unk_23F289924, &type metadata for ActionFailure.Failure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C28);
  }
  return result;
}

unint64_t sub_23F247C50()
{
  unint64_t result;

  result = qword_256E07C30;
  if (!qword_256E07C30)
  {
    result = MEMORY[0x242667160](&unk_23F28994C, &type metadata for ActionFailure.Failure.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C30);
  }
  return result;
}

unint64_t sub_23F247C90()
{
  unint64_t result;

  result = qword_256E07C38;
  if (!qword_256E07C38)
  {
    result = MEMORY[0x242667160](&unk_23F289264, &type metadata for PermissionRequirement.SiriPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C38);
  }
  return result;
}

unint64_t sub_23F247CD0()
{
  unint64_t result;

  result = qword_256E07C40;
  if (!qword_256E07C40)
  {
    result = MEMORY[0x242667160](&unk_23F28928C, &type metadata for PermissionRequirement.SiriPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C40);
  }
  return result;
}

unint64_t sub_23F247D10()
{
  unint64_t result;

  result = qword_256E07C48;
  if (!qword_256E07C48)
  {
    result = MEMORY[0x242667160](&unk_23F289214, &type metadata for PermissionRequirement.ShortcutsPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C48);
  }
  return result;
}

unint64_t sub_23F247D50()
{
  unint64_t result;

  result = qword_256E07C50;
  if (!qword_256E07C50)
  {
    result = MEMORY[0x242667160](&unk_23F28923C, &type metadata for PermissionRequirement.ShortcutsPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C50);
  }
  return result;
}

unint64_t sub_23F247D90()
{
  unint64_t result;

  result = qword_256E07C58;
  if (!qword_256E07C58)
  {
    result = MEMORY[0x242667160](&unk_23F2891C4, &type metadata for PermissionRequirement.PreciseLocationPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C58);
  }
  return result;
}

unint64_t sub_23F247DD0()
{
  unint64_t result;

  result = qword_256E07C60;
  if (!qword_256E07C60)
  {
    result = MEMORY[0x242667160](&unk_23F2891EC, &type metadata for PermissionRequirement.PreciseLocationPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C60);
  }
  return result;
}

unint64_t sub_23F247E10()
{
  unint64_t result;

  result = qword_256E07C68;
  if (!qword_256E07C68)
  {
    result = MEMORY[0x242667160](&unk_23F289174, &type metadata for PermissionRequirement.LocationPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C68);
  }
  return result;
}

unint64_t sub_23F247E50()
{
  unint64_t result;

  result = qword_256E07C70;
  if (!qword_256E07C70)
  {
    result = MEMORY[0x242667160](&unk_23F28919C, &type metadata for PermissionRequirement.LocationPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C70);
  }
  return result;
}

unint64_t sub_23F247E90()
{
  unint64_t result;

  result = qword_256E07C78;
  if (!qword_256E07C78)
  {
    result = MEMORY[0x242667160](&unk_23F289124, &type metadata for PermissionRequirement.WifiPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C78);
  }
  return result;
}

unint64_t sub_23F247ED0()
{
  unint64_t result;

  result = qword_256E07C80;
  if (!qword_256E07C80)
  {
    result = MEMORY[0x242667160](&unk_23F28914C, &type metadata for PermissionRequirement.WifiPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C80);
  }
  return result;
}

unint64_t sub_23F247F10()
{
  unint64_t result;

  result = qword_256E07C88;
  if (!qword_256E07C88)
  {
    result = MEMORY[0x242667160](&unk_23F2890D4, &type metadata for PermissionRequirement.BluetoothPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C88);
  }
  return result;
}

unint64_t sub_23F247F50()
{
  unint64_t result;

  result = qword_256E07C90;
  if (!qword_256E07C90)
  {
    result = MEMORY[0x242667160](&unk_23F2890FC, &type metadata for PermissionRequirement.BluetoothPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C90);
  }
  return result;
}

unint64_t sub_23F247F90()
{
  unint64_t result;

  result = qword_256E07C98;
  if (!qword_256E07C98)
  {
    result = MEMORY[0x242667160](&unk_23F289084, &type metadata for PermissionRequirement.PhotosPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07C98);
  }
  return result;
}

unint64_t sub_23F247FD0()
{
  unint64_t result;

  result = qword_256E07CA0;
  if (!qword_256E07CA0)
  {
    result = MEMORY[0x242667160](&unk_23F2890AC, &type metadata for PermissionRequirement.PhotosPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CA0);
  }
  return result;
}

unint64_t sub_23F248010()
{
  unint64_t result;

  result = qword_256E07CA8;
  if (!qword_256E07CA8)
  {
    result = MEMORY[0x242667160](&unk_23F289034, &type metadata for PermissionRequirement.ContactsPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CA8);
  }
  return result;
}

unint64_t sub_23F248050()
{
  unint64_t result;

  result = qword_256E07CB0;
  if (!qword_256E07CB0)
  {
    result = MEMORY[0x242667160](&unk_23F28905C, &type metadata for PermissionRequirement.ContactsPermissionRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CB0);
  }
  return result;
}

unint64_t sub_23F248090()
{
  unint64_t result;

  result = qword_256E07CB8;
  if (!qword_256E07CB8)
  {
    result = MEMORY[0x242667160](&unk_23F2892B4, &type metadata for PermissionRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CB8);
  }
  return result;
}

unint64_t sub_23F2480D0()
{
  unint64_t result;

  result = qword_256E07CC0;
  if (!qword_256E07CC0)
  {
    result = MEMORY[0x242667160](&unk_23F2892DC, &type metadata for PermissionRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CC0);
  }
  return result;
}

unint64_t sub_23F248110()
{
  unint64_t result;

  result = qword_256E07CC8;
  if (!qword_256E07CC8)
  {
    result = MEMORY[0x242667160](&unk_23F288F2C, &type metadata for AppRequirement.SignInRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CC8);
  }
  return result;
}

unint64_t sub_23F248150()
{
  unint64_t result;

  result = qword_256E07CD0;
  if (!qword_256E07CD0)
  {
    result = MEMORY[0x242667160](&unk_23F288F54, &type metadata for AppRequirement.SignInRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CD0);
  }
  return result;
}

unint64_t sub_23F248190()
{
  unint64_t result;

  result = qword_256E07CD8;
  if (!qword_256E07CD8)
  {
    result = MEMORY[0x242667160](&unk_23F288EDC, &type metadata for AppRequirement.AccountSetupRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CD8);
  }
  return result;
}

unint64_t sub_23F2481D0()
{
  unint64_t result;

  result = qword_256E07CE0;
  if (!qword_256E07CE0)
  {
    result = MEMORY[0x242667160](&unk_23F288F04, &type metadata for AppRequirement.AccountSetupRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CE0);
  }
  return result;
}

unint64_t sub_23F248210()
{
  unint64_t result;

  result = qword_256E07CE8;
  if (!qword_256E07CE8)
  {
    result = MEMORY[0x242667160](&unk_23F288E8C, &type metadata for AppRequirement.UserConfirmationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CE8);
  }
  return result;
}

unint64_t sub_23F248250()
{
  unint64_t result;

  result = qword_256E07CF0;
  if (!qword_256E07CF0)
  {
    result = MEMORY[0x242667160](&unk_23F288EB4, &type metadata for AppRequirement.UserConfirmationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CF0);
  }
  return result;
}

unint64_t sub_23F248290()
{
  unint64_t result;

  result = qword_256E07CF8;
  if (!qword_256E07CF8)
  {
    result = MEMORY[0x242667160](&unk_23F288F7C, &type metadata for AppRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07CF8);
  }
  return result;
}

unint64_t sub_23F2482D0()
{
  unint64_t result;

  result = qword_256E07D00;
  if (!qword_256E07D00)
  {
    result = MEMORY[0x242667160](&unk_23F288FA4, &type metadata for AppRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D00);
  }
  return result;
}

unint64_t sub_23F248310()
{
  unint64_t result;

  result = qword_256E07D08;
  if (!qword_256E07D08)
  {
    result = MEMORY[0x242667160](&unk_23F288D84, &type metadata for SystemRequirement.DeviceUnlockRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D08);
  }
  return result;
}

unint64_t sub_23F248350()
{
  unint64_t result;

  result = qword_256E07D10;
  if (!qword_256E07D10)
  {
    result = MEMORY[0x242667160](&unk_23F288DAC, &type metadata for SystemRequirement.DeviceUnlockRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D10);
  }
  return result;
}

unint64_t sub_23F248390()
{
  unint64_t result;

  result = qword_256E07D18;
  if (!qword_256E07D18)
  {
    result = MEMORY[0x242667160](&unk_23F288D34, &type metadata for SystemRequirement.AuthenticationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D18);
  }
  return result;
}

unint64_t sub_23F2483D0()
{
  unint64_t result;

  result = qword_256E07D20;
  if (!qword_256E07D20)
  {
    result = MEMORY[0x242667160](&unk_23F288D5C, &type metadata for SystemRequirement.AuthenticationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D20);
  }
  return result;
}

unint64_t sub_23F248410()
{
  unint64_t result;

  result = qword_256E07D28;
  if (!qword_256E07D28)
  {
    result = MEMORY[0x242667160](&unk_23F288CE4, &type metadata for SystemRequirement.AppLaunchRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D28);
  }
  return result;
}

unint64_t sub_23F248450()
{
  unint64_t result;

  result = qword_256E07D30;
  if (!qword_256E07D30)
  {
    result = MEMORY[0x242667160](&unk_23F288D0C, &type metadata for SystemRequirement.AppLaunchRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D30);
  }
  return result;
}

unint64_t sub_23F248490()
{
  unint64_t result;

  result = qword_256E07D38;
  if (!qword_256E07D38)
  {
    result = MEMORY[0x242667160](&unk_23F288C94, &type metadata for SystemRequirement.CarPlayIncompatibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D38);
  }
  return result;
}

unint64_t sub_23F2484D0()
{
  unint64_t result;

  result = qword_256E07D40;
  if (!qword_256E07D40)
  {
    result = MEMORY[0x242667160](&unk_23F288CBC, &type metadata for SystemRequirement.CarPlayIncompatibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D40);
  }
  return result;
}

unint64_t sub_23F248510()
{
  unint64_t result;

  result = qword_256E07D48;
  if (!qword_256E07D48)
  {
    result = MEMORY[0x242667160](&unk_23F288C44, &type metadata for SystemRequirement.CarBluetoothIncompatibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D48);
  }
  return result;
}

unint64_t sub_23F248550()
{
  unint64_t result;

  result = qword_256E07D50;
  if (!qword_256E07D50)
  {
    result = MEMORY[0x242667160](&unk_23F288C6C, &type metadata for SystemRequirement.CarBluetoothIncompatibleCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D50);
  }
  return result;
}

unint64_t sub_23F248590()
{
  unint64_t result;

  result = qword_256E07D58;
  if (!qword_256E07D58)
  {
    result = MEMORY[0x242667160](&unk_23F288B8C, &type metadata for SystemRequirement.ProtectedAppApprovalRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D58);
  }
  return result;
}

unint64_t sub_23F2485D0()
{
  unint64_t result;

  result = qword_256E07D60;
  if (!qword_256E07D60)
  {
    result = MEMORY[0x242667160](&unk_23F288BB4, &type metadata for SystemRequirement.ProtectedAppApprovalRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D60);
  }
  return result;
}

unint64_t sub_23F248610()
{
  unint64_t result;

  result = qword_256E07D68;
  if (!qword_256E07D68)
  {
    result = MEMORY[0x242667160](&unk_23F288AD4, &type metadata for SystemRequirement.UserAuthenticationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D68);
  }
  return result;
}

unint64_t sub_23F248650()
{
  unint64_t result;

  result = qword_256E07D70;
  if (!qword_256E07D70)
  {
    result = MEMORY[0x242667160](&unk_23F288AFC, &type metadata for SystemRequirement.UserAuthenticationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D70);
  }
  return result;
}

unint64_t sub_23F248690()
{
  unint64_t result;

  result = qword_256E07D78;
  if (!qword_256E07D78)
  {
    result = MEMORY[0x242667160](&unk_23F288DD4, &type metadata for SystemRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D78);
  }
  return result;
}

unint64_t sub_23F2486D0()
{
  unint64_t result;

  result = qword_256E07D80;
  if (!qword_256E07D80)
  {
    result = MEMORY[0x242667160](&unk_23F288DFC, &type metadata for SystemRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D80);
  }
  return result;
}

unint64_t sub_23F248710()
{
  unint64_t result;

  result = qword_256E07D88;
  if (!qword_256E07D88)
  {
    result = MEMORY[0x242667160](&unk_23F288A1C, &type metadata for SystemRequirement.AuthenticationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D88);
  }
  return result;
}

unint64_t sub_23F248750()
{
  unint64_t result;

  result = qword_256E07D90;
  if (!qword_256E07D90)
  {
    result = MEMORY[0x242667160](&unk_23F288A44, &type metadata for SystemRequirement.AuthenticationRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D90);
  }
  return result;
}

unint64_t sub_23F248790()
{
  unint64_t result;

  result = qword_256E07D98;
  if (!qword_256E07D98)
  {
    result = MEMORY[0x242667160](&unk_23F288914, &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.AlternativeAuthenticationPermittedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07D98);
  }
  return result;
}

unint64_t sub_23F2487D0()
{
  unint64_t result;

  result = qword_256E07DA0;
  if (!qword_256E07DA0)
  {
    result = MEMORY[0x242667160](&unk_23F28893C, &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.AlternativeAuthenticationPermittedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DA0);
  }
  return result;
}

unint64_t sub_23F248810()
{
  unint64_t result;

  result = qword_256E07DA8;
  if (!qword_256E07DA8)
  {
    result = MEMORY[0x242667160](&unk_23F2888C4, &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.OriginDeviceAuthenticationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DA8);
  }
  return result;
}

unint64_t sub_23F248850()
{
  unint64_t result;

  result = qword_256E07DB0;
  if (!qword_256E07DB0)
  {
    result = MEMORY[0x242667160](&unk_23F2888EC, &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.OriginDeviceAuthenticationRequiredCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DB0);
  }
  return result;
}

unint64_t sub_23F248890()
{
  unint64_t result;

  result = qword_256E07DB8;
  if (!qword_256E07DB8)
  {
    result = MEMORY[0x242667160](&unk_23F288964, &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DB8);
  }
  return result;
}

unint64_t sub_23F2488D0()
{
  unint64_t result;

  result = qword_256E07DC0;
  if (!qword_256E07DC0)
  {
    result = MEMORY[0x242667160](&unk_23F28898C, &type metadata for SystemRequirement.AuthenticationRequest.AuthenticationLevel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DC0);
  }
  return result;
}

unint64_t sub_23F248910()
{
  unint64_t result;

  result = qword_256E07DC8;
  if (!qword_256E07DC8)
  {
    result = MEMORY[0x242667160](&unk_23F28880C, &type metadata for SystemRequirement.ProtectedAppRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DC8);
  }
  return result;
}

unint64_t sub_23F248950()
{
  unint64_t result;

  result = qword_256E07DD0;
  if (!qword_256E07DD0)
  {
    result = MEMORY[0x242667160](&unk_23F288834, &type metadata for SystemRequirement.ProtectedAppRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DD0);
  }
  return result;
}

unint64_t sub_23F248990()
{
  unint64_t result;

  result = qword_256E07DD8;
  if (!qword_256E07DD8)
  {
    result = MEMORY[0x242667160](&unk_23F28869C, &type metadata for ActionRequirement.SystemRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DD8);
  }
  return result;
}

unint64_t sub_23F2489D0()
{
  unint64_t result;

  result = qword_256E07DE0;
  if (!qword_256E07DE0)
  {
    result = MEMORY[0x242667160](&unk_23F2886C4, &type metadata for ActionRequirement.SystemRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DE0);
  }
  return result;
}

unint64_t sub_23F248A10()
{
  unint64_t result;

  result = qword_256E07DE8;
  if (!qword_256E07DE8)
  {
    result = MEMORY[0x242667160](&unk_23F2885E4, &type metadata for ActionRequirement.AppRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DE8);
  }
  return result;
}

unint64_t sub_23F248A50()
{
  unint64_t result;

  result = qword_256E07DF0;
  if (!qword_256E07DF0)
  {
    result = MEMORY[0x242667160](&unk_23F28860C, &type metadata for ActionRequirement.AppRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DF0);
  }
  return result;
}

unint64_t sub_23F248A90()
{
  unint64_t result;

  result = qword_256E07DF8;
  if (!qword_256E07DF8)
  {
    result = MEMORY[0x242667160](&unk_23F28852C, &type metadata for ActionRequirement.PermissionsRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07DF8);
  }
  return result;
}

unint64_t sub_23F248AD0()
{
  unint64_t result;

  result = qword_256E07E00;
  if (!qword_256E07E00)
  {
    result = MEMORY[0x242667160](&unk_23F288554, &type metadata for ActionRequirement.PermissionsRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E00);
  }
  return result;
}

unint64_t sub_23F248B10()
{
  unint64_t result;

  result = qword_256E07E08;
  if (!qword_256E07E08)
  {
    result = MEMORY[0x242667160](&unk_23F2884DC, &type metadata for ActionRequirement.UnsupportedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E08);
  }
  return result;
}

unint64_t sub_23F248B50()
{
  unint64_t result;

  result = qword_256E07E10;
  if (!qword_256E07E10)
  {
    result = MEMORY[0x242667160](&unk_23F288504, &type metadata for ActionRequirement.UnsupportedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E10);
  }
  return result;
}

unint64_t sub_23F248B90()
{
  unint64_t result;

  result = qword_256E07E18;
  if (!qword_256E07E18)
  {
    result = MEMORY[0x242667160](&unk_23F288754, &type metadata for ActionRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E18);
  }
  return result;
}

unint64_t sub_23F248BD0()
{
  unint64_t result;

  result = qword_256E07E20;
  if (!qword_256E07E20)
  {
    result = MEMORY[0x242667160](&unk_23F28877C, &type metadata for ActionRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E20);
  }
  return result;
}

unint64_t sub_23F248C10()
{
  unint64_t result;

  result = qword_256E07E28;
  if (!qword_256E07E28)
  {
    result = MEMORY[0x242667160](&unk_23F288424, &type metadata for ActionSuccess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E28);
  }
  return result;
}

unint64_t sub_23F248C50()
{
  unint64_t result;

  result = qword_256E07E30;
  if (!qword_256E07E30)
  {
    result = MEMORY[0x242667160](&unk_23F28844C, &type metadata for ActionSuccess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E30);
  }
  return result;
}

unint64_t sub_23F248C90()
{
  unint64_t result;

  result = qword_256E07E38;
  if (!qword_256E07E38)
  {
    result = MEMORY[0x242667160](&unk_23F28836C, &type metadata for ActionSuccess.UndoContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E38);
  }
  return result;
}

unint64_t sub_23F248CD0()
{
  unint64_t result;

  result = qword_256E07E40;
  if (!qword_256E07E40)
  {
    result = MEMORY[0x242667160](&unk_23F288394, &type metadata for ActionSuccess.UndoContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E40);
  }
  return result;
}

unint64_t sub_23F248D10()
{
  unint64_t result;

  result = qword_256E07E48;
  if (!qword_256E07E48)
  {
    result = MEMORY[0x242667160](&unk_23F2882B4, &type metadata for StatementID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E48);
  }
  return result;
}

unint64_t sub_23F248D50()
{
  unint64_t result;

  result = qword_256E07E50;
  if (!qword_256E07E50)
  {
    result = MEMORY[0x242667160](&unk_23F2882DC, &type metadata for StatementID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E50);
  }
  return result;
}

unint64_t sub_23F248D90()
{
  unint64_t result;

  result = qword_256E07E58;
  if (!qword_256E07E58)
  {
    result = MEMORY[0x242667160](&unk_23F288144, &type metadata for StatementOutcome.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E58);
  }
  return result;
}

unint64_t sub_23F248DD0()
{
  unint64_t result;

  result = qword_256E07E60;
  if (!qword_256E07E60)
  {
    result = MEMORY[0x242667160](&unk_23F28816C, &type metadata for StatementOutcome.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E60);
  }
  return result;
}

unint64_t sub_23F248E10()
{
  unint64_t result;

  result = qword_256E07E68;
  if (!qword_256E07E68)
  {
    result = MEMORY[0x242667160](&unk_23F28808C, &type metadata for StatementOutcome.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E68);
  }
  return result;
}

unint64_t sub_23F248E50()
{
  unint64_t result;

  result = qword_256E07E70;
  if (!qword_256E07E70)
  {
    result = MEMORY[0x242667160](&unk_23F2880B4, &type metadata for StatementOutcome.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E70);
  }
  return result;
}

unint64_t sub_23F248E90()
{
  unint64_t result;

  result = qword_256E07E78;
  if (!qword_256E07E78)
  {
    result = MEMORY[0x242667160](&unk_23F287FD4, &type metadata for StatementOutcome.ToolDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E78);
  }
  return result;
}

unint64_t sub_23F248ED0()
{
  unint64_t result;

  result = qword_256E07E80;
  if (!qword_256E07E80)
  {
    result = MEMORY[0x242667160](&unk_23F287FFC, &type metadata for StatementOutcome.ToolDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E80);
  }
  return result;
}

unint64_t sub_23F248F10()
{
  unint64_t result;

  result = qword_256E07E88;
  if (!qword_256E07E88)
  {
    result = MEMORY[0x242667160](&unk_23F287F1C, &type metadata for StatementOutcome.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E88);
  }
  return result;
}

unint64_t sub_23F248F50()
{
  unint64_t result;

  result = qword_256E07E90;
  if (!qword_256E07E90)
  {
    result = MEMORY[0x242667160](&unk_23F287F44, &type metadata for StatementOutcome.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E90);
  }
  return result;
}

unint64_t sub_23F248F90()
{
  unint64_t result;

  result = qword_256E07E98;
  if (!qword_256E07E98)
  {
    result = MEMORY[0x242667160](&unk_23F287E64, &type metadata for StatementOutcome.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07E98);
  }
  return result;
}

unint64_t sub_23F248FD0()
{
  unint64_t result;

  result = qword_256E07EA0;
  if (!qword_256E07EA0)
  {
    result = MEMORY[0x242667160](&unk_23F287E8C, &type metadata for StatementOutcome.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EA0);
  }
  return result;
}

unint64_t sub_23F249010()
{
  unint64_t result;

  result = qword_256E07EA8;
  if (!qword_256E07EA8)
  {
    result = MEMORY[0x242667160](&unk_23F287DAC, &type metadata for StatementOutcome.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EA8);
  }
  return result;
}

unint64_t sub_23F249050()
{
  unint64_t result;

  result = qword_256E07EB0;
  if (!qword_256E07EB0)
  {
    result = MEMORY[0x242667160](&unk_23F287DD4, &type metadata for StatementOutcome.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EB0);
  }
  return result;
}

unint64_t sub_23F249090()
{
  unint64_t result;

  result = qword_256E07EB8;
  if (!qword_256E07EB8)
  {
    result = MEMORY[0x242667160](&unk_23F287CF4, &type metadata for StatementOutcome.ParameterNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EB8);
  }
  return result;
}

unint64_t sub_23F2490D0()
{
  unint64_t result;

  result = qword_256E07EC0;
  if (!qword_256E07EC0)
  {
    result = MEMORY[0x242667160](&unk_23F287D1C, &type metadata for StatementOutcome.ParameterNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EC0);
  }
  return result;
}

unint64_t sub_23F249110()
{
  unint64_t result;

  result = qword_256E07EC8;
  if (!qword_256E07EC8)
  {
    result = MEMORY[0x242667160](&unk_23F287C3C, &type metadata for StatementOutcome.ParameterCandidatesNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EC8);
  }
  return result;
}

unint64_t sub_23F249150()
{
  unint64_t result;

  result = qword_256E07ED0;
  if (!qword_256E07ED0)
  {
    result = MEMORY[0x242667160](&unk_23F287C64, &type metadata for StatementOutcome.ParameterCandidatesNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07ED0);
  }
  return result;
}

unint64_t sub_23F249190()
{
  unint64_t result;

  result = qword_256E07ED8;
  if (!qword_256E07ED8)
  {
    result = MEMORY[0x242667160](&unk_23F287B84, &type metadata for StatementOutcome.ActionRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07ED8);
  }
  return result;
}

unint64_t sub_23F2491D0()
{
  unint64_t result;

  result = qword_256E07EE0;
  if (!qword_256E07EE0)
  {
    result = MEMORY[0x242667160](&unk_23F287BAC, &type metadata for StatementOutcome.ActionRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EE0);
  }
  return result;
}

unint64_t sub_23F249210()
{
  unint64_t result;

  result = qword_256E07EE8;
  if (!qword_256E07EE8)
  {
    result = MEMORY[0x242667160](&unk_23F287ACC, &type metadata for StatementOutcome.ValueDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EE8);
  }
  return result;
}

unint64_t sub_23F249250()
{
  unint64_t result;

  result = qword_256E07EF0;
  if (!qword_256E07EF0)
  {
    result = MEMORY[0x242667160](&unk_23F287AF4, &type metadata for StatementOutcome.ValueDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EF0);
  }
  return result;
}

unint64_t sub_23F249290()
{
  unint64_t result;

  result = qword_256E07EF8;
  if (!qword_256E07EF8)
  {
    result = MEMORY[0x242667160](&unk_23F287A14, &type metadata for StatementOutcome.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07EF8);
  }
  return result;
}

unint64_t sub_23F2492D0()
{
  unint64_t result;

  result = qword_256E07F00;
  if (!qword_256E07F00)
  {
    result = MEMORY[0x242667160](&unk_23F287A3C, &type metadata for StatementOutcome.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F00);
  }
  return result;
}

unint64_t sub_23F249310()
{
  unint64_t result;

  result = qword_256E07F08;
  if (!qword_256E07F08)
  {
    result = MEMORY[0x242667160](&unk_23F2881FC, &type metadata for StatementOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F08);
  }
  return result;
}

unint64_t sub_23F249350()
{
  unint64_t result;

  result = qword_256E07F10;
  if (!qword_256E07F10)
  {
    result = MEMORY[0x242667160](&unk_23F288224, &type metadata for StatementOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F10);
  }
  return result;
}

unint64_t sub_23F249390()
{
  unint64_t result;

  result = qword_256E07F18;
  if (!qword_256E07F18)
  {
    result = MEMORY[0x242667160](&unk_23F2878A4, &type metadata for ActionOutcome.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F18);
  }
  return result;
}

unint64_t sub_23F2493D0()
{
  unint64_t result;

  result = qword_256E07F20;
  if (!qword_256E07F20)
  {
    result = MEMORY[0x242667160](&unk_23F2878CC, &type metadata for ActionOutcome.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F20);
  }
  return result;
}

unint64_t sub_23F249410()
{
  unint64_t result;

  result = qword_256E07F28;
  if (!qword_256E07F28)
  {
    result = MEMORY[0x242667160](&unk_23F2877EC, &type metadata for ActionOutcome.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F28);
  }
  return result;
}

unint64_t sub_23F249450()
{
  unint64_t result;

  result = qword_256E07F30;
  if (!qword_256E07F30)
  {
    result = MEMORY[0x242667160](&unk_23F287814, &type metadata for ActionOutcome.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F30);
  }
  return result;
}

unint64_t sub_23F249490()
{
  unint64_t result;

  result = qword_256E07F38;
  if (!qword_256E07F38)
  {
    result = MEMORY[0x242667160](&unk_23F287734, &type metadata for ActionOutcome.ToolDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F38);
  }
  return result;
}

unint64_t sub_23F2494D0()
{
  unint64_t result;

  result = qword_256E07F40;
  if (!qword_256E07F40)
  {
    result = MEMORY[0x242667160](&unk_23F28775C, &type metadata for ActionOutcome.ToolDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F40);
  }
  return result;
}

unint64_t sub_23F249510()
{
  unint64_t result;

  result = qword_256E07F48;
  if (!qword_256E07F48)
  {
    result = MEMORY[0x242667160](&unk_23F28767C, &type metadata for ActionOutcome.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F48);
  }
  return result;
}

unint64_t sub_23F249550()
{
  unint64_t result;

  result = qword_256E07F50;
  if (!qword_256E07F50)
  {
    result = MEMORY[0x242667160](&unk_23F2876A4, &type metadata for ActionOutcome.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F50);
  }
  return result;
}

unint64_t sub_23F249590()
{
  unint64_t result;

  result = qword_256E07F58;
  if (!qword_256E07F58)
  {
    result = MEMORY[0x242667160](&unk_23F2875C4, &type metadata for ActionOutcome.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F58);
  }
  return result;
}

unint64_t sub_23F2495D0()
{
  unint64_t result;

  result = qword_256E07F60;
  if (!qword_256E07F60)
  {
    result = MEMORY[0x242667160](&unk_23F2875EC, &type metadata for ActionOutcome.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F60);
  }
  return result;
}

unint64_t sub_23F249610()
{
  unint64_t result;

  result = qword_256E07F68;
  if (!qword_256E07F68)
  {
    result = MEMORY[0x242667160](&unk_23F28750C, &type metadata for ActionOutcome.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F68);
  }
  return result;
}

unint64_t sub_23F249650()
{
  unint64_t result;

  result = qword_256E07F70;
  if (!qword_256E07F70)
  {
    result = MEMORY[0x242667160](&unk_23F287534, &type metadata for ActionOutcome.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F70);
  }
  return result;
}

unint64_t sub_23F249690()
{
  unint64_t result;

  result = qword_256E07F78;
  if (!qword_256E07F78)
  {
    result = MEMORY[0x242667160](&unk_23F287454, &type metadata for ActionOutcome.ParameterNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F78);
  }
  return result;
}

unint64_t sub_23F2496D0()
{
  unint64_t result;

  result = qword_256E07F80;
  if (!qword_256E07F80)
  {
    result = MEMORY[0x242667160](&unk_23F28747C, &type metadata for ActionOutcome.ParameterNotAllowedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F80);
  }
  return result;
}

unint64_t sub_23F249710()
{
  unint64_t result;

  result = qword_256E07F88;
  if (!qword_256E07F88)
  {
    result = MEMORY[0x242667160](&unk_23F28739C, &type metadata for ActionOutcome.ParameterCandidatesNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F88);
  }
  return result;
}

unint64_t sub_23F249750()
{
  unint64_t result;

  result = qword_256E07F90;
  if (!qword_256E07F90)
  {
    result = MEMORY[0x242667160](&unk_23F2873C4, &type metadata for ActionOutcome.ParameterCandidatesNotFoundCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F90);
  }
  return result;
}

unint64_t sub_23F249790()
{
  unint64_t result;

  result = qword_256E07F98;
  if (!qword_256E07F98)
  {
    result = MEMORY[0x242667160](&unk_23F2872E4, &type metadata for ActionOutcome.ActionRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07F98);
  }
  return result;
}

unint64_t sub_23F2497D0()
{
  unint64_t result;

  result = qword_256E07FA0;
  if (!qword_256E07FA0)
  {
    result = MEMORY[0x242667160](&unk_23F28730C, &type metadata for ActionOutcome.ActionRequirementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FA0);
  }
  return result;
}

unint64_t sub_23F249810()
{
  unint64_t result;

  result = qword_256E07FA8;
  if (!qword_256E07FA8)
  {
    result = MEMORY[0x242667160](&unk_23F28722C, &type metadata for ActionOutcome.ValueDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FA8);
  }
  return result;
}

unint64_t sub_23F249850()
{
  unint64_t result;

  result = qword_256E07FB0;
  if (!qword_256E07FB0)
  {
    result = MEMORY[0x242667160](&unk_23F287254, &type metadata for ActionOutcome.ValueDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FB0);
  }
  return result;
}

unint64_t sub_23F249890()
{
  unint64_t result;

  result = qword_256E07FB8;
  if (!qword_256E07FB8)
  {
    result = MEMORY[0x242667160](&unk_23F287174, &type metadata for ActionOutcome.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FB8);
  }
  return result;
}

unint64_t sub_23F2498D0()
{
  unint64_t result;

  result = qword_256E07FC0;
  if (!qword_256E07FC0)
  {
    result = MEMORY[0x242667160](&unk_23F28719C, &type metadata for ActionOutcome.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FC0);
  }
  return result;
}

unint64_t sub_23F249910()
{
  unint64_t result;

  result = qword_256E07FC8;
  if (!qword_256E07FC8)
  {
    result = MEMORY[0x242667160](&unk_23F28795C, &type metadata for ActionOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FC8);
  }
  return result;
}

unint64_t sub_23F249950()
{
  unint64_t result;

  result = qword_256E07FD0;
  if (!qword_256E07FD0)
  {
    result = MEMORY[0x242667160](&unk_23F287984, &type metadata for ActionOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FD0);
  }
  return result;
}

unint64_t sub_23F249990()
{
  unint64_t result;

  result = qword_256E07FD8;
  if (!qword_256E07FD8)
  {
    result = MEMORY[0x242667160](&unk_23F2870BC, &type metadata for InterpretedStatementResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FD8);
  }
  return result;
}

unint64_t sub_23F2499D0()
{
  unint64_t result;

  result = qword_256E07FE0;
  if (!qword_256E07FE0)
  {
    result = MEMORY[0x242667160](&unk_23F2870E4, &type metadata for InterpretedStatementResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FE0);
  }
  return result;
}

unint64_t sub_23F249A10()
{
  unint64_t result;

  result = qword_256E07FE8;
  if (!qword_256E07FE8)
  {
    result = MEMORY[0x242667160](&unk_23F287004, &type metadata for SystemResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FE8);
  }
  return result;
}

unint64_t sub_23F249A50()
{
  unint64_t result;

  result = qword_256E07FF0;
  if (!qword_256E07FF0)
  {
    result = MEMORY[0x242667160](&unk_23F28702C, &type metadata for SystemResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FF0);
  }
  return result;
}

unint64_t sub_23F249A90()
{
  unint64_t result;

  result = qword_256E07FF8;
  if (!qword_256E07FF8)
  {
    result = MEMORY[0x242667160](&unk_23F286F4C, &type metadata for ActionResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E07FF8);
  }
  return result;
}

unint64_t sub_23F249AD0()
{
  unint64_t result;

  result = qword_256E08000;
  if (!qword_256E08000)
  {
    result = MEMORY[0x242667160](&unk_23F286F74, &type metadata for ActionResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08000);
  }
  return result;
}

unint64_t sub_23F249B10()
{
  unint64_t result;

  result = qword_256E08008;
  if (!qword_256E08008)
  {
    result = MEMORY[0x242667160](&unk_23F286E94, &type metadata for SystemPromptResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08008);
  }
  return result;
}

unint64_t sub_23F249B50()
{
  unint64_t result;

  result = qword_256E08010;
  if (!qword_256E08010)
  {
    result = MEMORY[0x242667160](&unk_23F286EBC, &type metadata for SystemPromptResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08010);
  }
  return result;
}

unint64_t sub_23F249B90()
{
  unint64_t result;

  result = qword_256E08018;
  if (!qword_256E08018)
  {
    result = MEMORY[0x242667160](&unk_23F286E44, &type metadata for SystemPromptResolution.ActionCancellation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08018);
  }
  return result;
}

unint64_t sub_23F249BD0()
{
  unint64_t result;

  result = qword_256E08020;
  if (!qword_256E08020)
  {
    result = MEMORY[0x242667160](&unk_23F286E6C, &type metadata for SystemPromptResolution.ActionCancellation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08020);
  }
  return result;
}

unint64_t sub_23F249C10()
{
  unint64_t result;

  result = qword_256E08028;
  if (!qword_256E08028)
  {
    result = MEMORY[0x242667160](&unk_23F286D8C, &type metadata for SystemPromptResolution.RequirementResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08028);
  }
  return result;
}

unint64_t sub_23F249C50()
{
  unint64_t result;

  result = qword_256E08030;
  if (!qword_256E08030)
  {
    result = MEMORY[0x242667160](&unk_23F286DB4, &type metadata for SystemPromptResolution.RequirementResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08030);
  }
  return result;
}

unint64_t sub_23F249C90()
{
  unint64_t result;

  result = qword_256E08038;
  if (!qword_256E08038)
  {
    result = MEMORY[0x242667160](&unk_23F286C1C, &type metadata for SystemPromptResolution.UserAction.ActionConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08038);
  }
  return result;
}

unint64_t sub_23F249CD0()
{
  unint64_t result;

  result = qword_256E08040;
  if (!qword_256E08040)
  {
    result = MEMORY[0x242667160](&unk_23F286C44, &type metadata for SystemPromptResolution.UserAction.ActionConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08040);
  }
  return result;
}

unint64_t sub_23F249D10()
{
  unint64_t result;

  result = qword_256E08048;
  if (!qword_256E08048)
  {
    result = MEMORY[0x242667160](&unk_23F286BCC, &type metadata for SystemPromptResolution.UserAction.DeviceUnlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08048);
  }
  return result;
}

unint64_t sub_23F249D50()
{
  unint64_t result;

  result = qword_256E08050;
  if (!qword_256E08050)
  {
    result = MEMORY[0x242667160](&unk_23F286BF4, &type metadata for SystemPromptResolution.UserAction.DeviceUnlockedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08050);
  }
  return result;
}

unint64_t sub_23F249D90()
{
  unint64_t result;

  result = qword_256E08058;
  if (!qword_256E08058)
  {
    result = MEMORY[0x242667160](&unk_23F286B14, &type metadata for SystemPromptResolution.UserAction.ParameterValueSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08058);
  }
  return result;
}

unint64_t sub_23F249DD0()
{
  unint64_t result;

  result = qword_256E08060;
  if (!qword_256E08060)
  {
    result = MEMORY[0x242667160](&unk_23F286B3C, &type metadata for SystemPromptResolution.UserAction.ParameterValueSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08060);
  }
  return result;
}

unint64_t sub_23F249E10()
{
  unint64_t result;

  result = qword_256E08068;
  if (!qword_256E08068)
  {
    result = MEMORY[0x242667160](&unk_23F286A5C, &type metadata for SystemPromptResolution.UserAction.ParameterConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08068);
  }
  return result;
}

unint64_t sub_23F249E50()
{
  unint64_t result;

  result = qword_256E08070;
  if (!qword_256E08070)
  {
    result = MEMORY[0x242667160](&unk_23F286A84, &type metadata for SystemPromptResolution.UserAction.ParameterConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08070);
  }
  return result;
}

unint64_t sub_23F249E90()
{
  unint64_t result;

  result = qword_256E08078;
  if (!qword_256E08078)
  {
    result = MEMORY[0x242667160](&unk_23F2869A4, &type metadata for SystemPromptResolution.UserAction.ParameterItemSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08078);
  }
  return result;
}

unint64_t sub_23F249ED0()
{
  unint64_t result;

  result = qword_256E08080;
  if (!qword_256E08080)
  {
    result = MEMORY[0x242667160](&unk_23F2869CC, &type metadata for SystemPromptResolution.UserAction.ParameterItemSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08080);
  }
  return result;
}

unint64_t sub_23F249F10()
{
  unint64_t result;

  result = qword_256E08088;
  if (!qword_256E08088)
  {
    result = MEMORY[0x242667160](&unk_23F2868EC, &type metadata for SystemPromptResolution.UserAction.DisambiguationIndexSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08088);
  }
  return result;
}

unint64_t sub_23F249F50()
{
  unint64_t result;

  result = qword_256E08090;
  if (!qword_256E08090)
  {
    result = MEMORY[0x242667160](&unk_23F286914, &type metadata for SystemPromptResolution.UserAction.DisambiguationIndexSelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08090);
  }
  return result;
}

unint64_t sub_23F249F90()
{
  unint64_t result;

  result = qword_256E08098;
  if (!qword_256E08098)
  {
    result = MEMORY[0x242667160](&unk_23F286834, &type metadata for SystemPromptResolution.UserAction.RequirementAddressedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08098);
  }
  return result;
}

unint64_t sub_23F249FD0()
{
  unint64_t result;

  result = qword_256E080A0;
  if (!qword_256E080A0)
  {
    result = MEMORY[0x242667160](&unk_23F28685C, &type metadata for SystemPromptResolution.UserAction.RequirementAddressedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080A0);
  }
  return result;
}

unint64_t sub_23F24A010()
{
  unint64_t result;

  result = qword_256E080A8;
  if (!qword_256E080A8)
  {
    result = MEMORY[0x242667160](&unk_23F28677C, &type metadata for SystemPromptResolution.UserAction.ActionCanceledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080A8);
  }
  return result;
}

unint64_t sub_23F24A050()
{
  unint64_t result;

  result = qword_256E080B0;
  if (!qword_256E080B0)
  {
    result = MEMORY[0x242667160](&unk_23F2867A4, &type metadata for SystemPromptResolution.UserAction.ActionCanceledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080B0);
  }
  return result;
}

unint64_t sub_23F24A090()
{
  unint64_t result;

  result = qword_256E080B8;
  if (!qword_256E080B8)
  {
    result = MEMORY[0x242667160](&unk_23F286CD4, &type metadata for SystemPromptResolution.UserAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080B8);
  }
  return result;
}

unint64_t sub_23F24A0D0()
{
  unint64_t result;

  result = qword_256E080C0;
  if (!qword_256E080C0)
  {
    result = MEMORY[0x242667160](&unk_23F286CFC, &type metadata for SystemPromptResolution.UserAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080C0);
  }
  return result;
}

unint64_t sub_23F24A110()
{
  unint64_t result;

  result = qword_256E080C8;
  if (!qword_256E080C8)
  {
    result = MEMORY[0x242667160](&unk_23F286674, &type metadata for SystemPromptResolution.ResolutionInput.TouchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080C8);
  }
  return result;
}

unint64_t sub_23F24A150()
{
  unint64_t result;

  result = qword_256E080D0;
  if (!qword_256E080D0)
  {
    result = MEMORY[0x242667160](&unk_23F28669C, &type metadata for SystemPromptResolution.ResolutionInput.TouchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080D0);
  }
  return result;
}

unint64_t sub_23F24A190()
{
  unint64_t result;

  result = qword_256E080D8;
  if (!qword_256E080D8)
  {
    result = MEMORY[0x242667160](&unk_23F286624, &type metadata for SystemPromptResolution.ResolutionInput.HeadGestureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080D8);
  }
  return result;
}

unint64_t sub_23F24A1D0()
{
  unint64_t result;

  result = qword_256E080E0;
  if (!qword_256E080E0)
  {
    result = MEMORY[0x242667160](&unk_23F28664C, &type metadata for SystemPromptResolution.ResolutionInput.HeadGestureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080E0);
  }
  return result;
}

unint64_t sub_23F24A210()
{
  unint64_t result;

  result = qword_256E080E8;
  if (!qword_256E080E8)
  {
    result = MEMORY[0x242667160](&unk_23F28656C, &type metadata for SystemPromptResolution.ResolutionInput.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080E8);
  }
  return result;
}

unint64_t sub_23F24A250()
{
  unint64_t result;

  result = qword_256E080F0;
  if (!qword_256E080F0)
  {
    result = MEMORY[0x242667160](&unk_23F286594, &type metadata for SystemPromptResolution.ResolutionInput.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080F0);
  }
  return result;
}

unint64_t sub_23F24A290()
{
  unint64_t result;

  result = qword_256E080F8;
  if (!qword_256E080F8)
  {
    result = MEMORY[0x242667160](&unk_23F2864B4, &type metadata for SystemPromptResolution.ResolutionInput.SpeechCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E080F8);
  }
  return result;
}

unint64_t sub_23F24A2D0()
{
  unint64_t result;

  result = qword_256E08100;
  if (!qword_256E08100)
  {
    result = MEMORY[0x242667160](&unk_23F2864DC, &type metadata for SystemPromptResolution.ResolutionInput.SpeechCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08100);
  }
  return result;
}

unint64_t sub_23F24A310()
{
  unint64_t result;

  result = qword_256E08108;
  if (!qword_256E08108)
  {
    result = MEMORY[0x242667160](&unk_23F2866C4, &type metadata for SystemPromptResolution.ResolutionInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08108);
  }
  return result;
}

unint64_t sub_23F24A350()
{
  unint64_t result;

  result = qword_256E08110;
  if (!qword_256E08110)
  {
    result = MEMORY[0x242667160](&unk_23F2866EC, &type metadata for SystemPromptResolution.ResolutionInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08110);
  }
  return result;
}

unint64_t sub_23F24A390()
{
  unint64_t result;

  result = qword_256E08118;
  if (!qword_256E08118)
  {
    result = MEMORY[0x242667160](&unk_23F2863AC, &type metadata for SystemPromptResolution.InputModality.TouchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08118);
  }
  return result;
}

unint64_t sub_23F24A3D0()
{
  unint64_t result;

  result = qword_256E08120;
  if (!qword_256E08120)
  {
    result = MEMORY[0x242667160](&unk_23F2863D4, &type metadata for SystemPromptResolution.InputModality.TouchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08120);
  }
  return result;
}

unint64_t sub_23F24A410()
{
  unint64_t result;

  result = qword_256E08128;
  if (!qword_256E08128)
  {
    result = MEMORY[0x242667160](&unk_23F28635C, &type metadata for SystemPromptResolution.InputModality.HeadGestureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08128);
  }
  return result;
}

unint64_t sub_23F24A450()
{
  unint64_t result;

  result = qword_256E08130;
  if (!qword_256E08130)
  {
    result = MEMORY[0x242667160](&unk_23F286384, &type metadata for SystemPromptResolution.InputModality.HeadGestureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08130);
  }
  return result;
}

unint64_t sub_23F24A490()
{
  unint64_t result;

  result = qword_256E08138;
  if (!qword_256E08138)
  {
    result = MEMORY[0x242667160](&unk_23F2863FC, &type metadata for SystemPromptResolution.InputModality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08138);
  }
  return result;
}

unint64_t sub_23F24A4D0()
{
  unint64_t result;

  result = qword_256E08140;
  if (!qword_256E08140)
  {
    result = MEMORY[0x242667160](&unk_23F286424, &type metadata for SystemPromptResolution.InputModality.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08140);
  }
  return result;
}

unint64_t sub_23F24A510()
{
  unint64_t result;

  result = qword_256E08148;
  if (!qword_256E08148)
  {
    result = MEMORY[0x242667160](&unk_23F2862A4, &type metadata for SystemPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08148);
  }
  return result;
}

unint64_t sub_23F24A550()
{
  unint64_t result;

  result = qword_256E08150;
  if (!qword_256E08150)
  {
    result = MEMORY[0x242667160](&unk_23F2862CC, &type metadata for SystemPrompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08150);
  }
  return result;
}

unint64_t sub_23F24A590()
{
  unint64_t result;

  result = qword_256E08158;
  if (!qword_256E08158)
  {
    result = MEMORY[0x242667160](&unk_23F286134, &type metadata for SystemPrompt.Prompt.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08158);
  }
  return result;
}

unint64_t sub_23F24A5D0()
{
  unint64_t result;

  result = qword_256E08160;
  if (!qword_256E08160)
  {
    result = MEMORY[0x242667160](&unk_23F28615C, &type metadata for SystemPrompt.Prompt.ActionConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08160);
  }
  return result;
}

unint64_t sub_23F24A610()
{
  unint64_t result;

  result = qword_256E08168;
  if (!qword_256E08168)
  {
    result = MEMORY[0x242667160](&unk_23F28607C, &type metadata for SystemPrompt.Prompt.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08168);
  }
  return result;
}

unint64_t sub_23F24A650()
{
  unint64_t result;

  result = qword_256E08170;
  if (!qword_256E08170)
  {
    result = MEMORY[0x242667160](&unk_23F2860A4, &type metadata for SystemPrompt.Prompt.ParameterNeedsValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08170);
  }
  return result;
}

unint64_t sub_23F24A690()
{
  unint64_t result;

  result = qword_256E08178;
  if (!qword_256E08178)
  {
    result = MEMORY[0x242667160](&unk_23F285FC4, &type metadata for SystemPrompt.Prompt.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08178);
  }
  return result;
}

unint64_t sub_23F24A6D0()
{
  unint64_t result;

  result = qword_256E08180;
  if (!qword_256E08180)
  {
    result = MEMORY[0x242667160](&unk_23F285FEC, &type metadata for SystemPrompt.Prompt.ParameterConfirmationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08180);
  }
  return result;
}

unint64_t sub_23F24A710()
{
  unint64_t result;

  result = qword_256E08188;
  if (!qword_256E08188)
  {
    result = MEMORY[0x242667160](&unk_23F285F0C, &type metadata for SystemPrompt.Prompt.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08188);
  }
  return result;
}

unint64_t sub_23F24A750()
{
  unint64_t result;

  result = qword_256E08190;
  if (!qword_256E08190)
  {
    result = MEMORY[0x242667160](&unk_23F285F34, &type metadata for SystemPrompt.Prompt.ParameterDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08190);
  }
  return result;
}

unint64_t sub_23F24A790()
{
  unint64_t result;

  result = qword_256E08198;
  if (!qword_256E08198)
  {
    result = MEMORY[0x242667160](&unk_23F2861EC, &type metadata for SystemPrompt.Prompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08198);
  }
  return result;
}

unint64_t sub_23F24A7D0()
{
  unint64_t result;

  result = qword_256E081A0;
  if (!qword_256E081A0)
  {
    result = MEMORY[0x242667160](&unk_23F286214, &type metadata for SystemPrompt.Prompt.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081A0);
  }
  return result;
}

unint64_t sub_23F24A810()
{
  unint64_t result;

  result = qword_256E081A8;
  if (!qword_256E081A8)
  {
    result = MEMORY[0x242667160](&unk_23F285D9C, &type metadata for MessagePayload.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081A8);
  }
  return result;
}

unint64_t sub_23F24A850()
{
  unint64_t result;

  result = qword_256E081B0;
  if (!qword_256E081B0)
  {
    result = MEMORY[0x242667160](&unk_23F285DC4, &type metadata for MessagePayload.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081B0);
  }
  return result;
}

unint64_t sub_23F24A890()
{
  unint64_t result;

  result = qword_256E081B8;
  if (!qword_256E081B8)
  {
    result = MEMORY[0x242667160](&unk_23F285CE4, &type metadata for MessagePayload.TerminateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081B8);
  }
  return result;
}

unint64_t sub_23F24A8D0()
{
  unint64_t result;

  result = qword_256E081C0;
  if (!qword_256E081C0)
  {
    result = MEMORY[0x242667160](&unk_23F285D0C, &type metadata for MessagePayload.TerminateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081C0);
  }
  return result;
}

unint64_t sub_23F24A910()
{
  unint64_t result;

  result = qword_256E081C8;
  if (!qword_256E081C8)
  {
    result = MEMORY[0x242667160](&unk_23F285C2C, &type metadata for MessagePayload.SessionSuspendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081C8);
  }
  return result;
}

unint64_t sub_23F24A950()
{
  unint64_t result;

  result = qword_256E081D0;
  if (!qword_256E081D0)
  {
    result = MEMORY[0x242667160](&unk_23F285C54, &type metadata for MessagePayload.SessionSuspendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081D0);
  }
  return result;
}

unint64_t sub_23F24A990()
{
  unint64_t result;

  result = qword_256E081D8;
  if (!qword_256E081D8)
  {
    result = MEMORY[0x242667160](&unk_23F285B74, &type metadata for MessagePayload.EndOfPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081D8);
  }
  return result;
}

unint64_t sub_23F24A9D0()
{
  unint64_t result;

  result = qword_256E081E0;
  if (!qword_256E081E0)
  {
    result = MEMORY[0x242667160](&unk_23F285B9C, &type metadata for MessagePayload.EndOfPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081E0);
  }
  return result;
}

unint64_t sub_23F24AA10()
{
  unint64_t result;

  result = qword_256E081E8;
  if (!qword_256E081E8)
  {
    result = MEMORY[0x242667160](&unk_23F285ABC, &type metadata for MessagePayload.StepExecutedWithReturnedValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081E8);
  }
  return result;
}

unint64_t sub_23F24AA50()
{
  unint64_t result;

  result = qword_256E081F0;
  if (!qword_256E081F0)
  {
    result = MEMORY[0x242667160](&unk_23F285AE4, &type metadata for MessagePayload.StepExecutedWithReturnedValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081F0);
  }
  return result;
}

unint64_t sub_23F24AA90()
{
  unint64_t result;

  result = qword_256E081F8;
  if (!qword_256E081F8)
  {
    result = MEMORY[0x242667160](&unk_23F285A04, &type metadata for MessagePayload.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E081F8);
  }
  return result;
}

unint64_t sub_23F24AAD0()
{
  unint64_t result;

  result = qword_256E08200;
  if (!qword_256E08200)
  {
    result = MEMORY[0x242667160](&unk_23F285A2C, &type metadata for MessagePayload.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08200);
  }
  return result;
}

unint64_t sub_23F24AB10()
{
  unint64_t result;

  result = qword_256E08208;
  if (!qword_256E08208)
  {
    result = MEMORY[0x242667160](&unk_23F28594C, &type metadata for MessagePayload.PlannerReturnedRawPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08208);
  }
  return result;
}

unint64_t sub_23F24AB50()
{
  unint64_t result;

  result = qword_256E08210;
  if (!qword_256E08210)
  {
    result = MEMORY[0x242667160](&unk_23F285974, &type metadata for MessagePayload.PlannerReturnedRawPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08210);
  }
  return result;
}

unint64_t sub_23F24AB90()
{
  unint64_t result;

  result = qword_256E08218;
  if (!qword_256E08218)
  {
    result = MEMORY[0x242667160](&unk_23F285894, &type metadata for MessagePayload.QueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08218);
  }
  return result;
}

unint64_t sub_23F24ABD0()
{
  unint64_t result;

  result = qword_256E08220;
  if (!qword_256E08220)
  {
    result = MEMORY[0x242667160](&unk_23F2858BC, &type metadata for MessagePayload.QueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08220);
  }
  return result;
}

unint64_t sub_23F24AC10()
{
  unint64_t result;

  result = qword_256E08228;
  if (!qword_256E08228)
  {
    result = MEMORY[0x242667160](&unk_23F2857DC, &type metadata for MessagePayload.SpeechQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08228);
  }
  return result;
}

unint64_t sub_23F24AC50()
{
  unint64_t result;

  result = qword_256E08230;
  if (!qword_256E08230)
  {
    result = MEMORY[0x242667160](&unk_23F285804, &type metadata for MessagePayload.SpeechQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08230);
  }
  return result;
}

unint64_t sub_23F24AC90()
{
  unint64_t result;

  result = qword_256E08238;
  if (!qword_256E08238)
  {
    result = MEMORY[0x242667160](&unk_23F285724, &type metadata for MessagePayload.ClientInitiatedClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08238);
  }
  return result;
}

unint64_t sub_23F24ACD0()
{
  unint64_t result;

  result = qword_256E08240;
  if (!qword_256E08240)
  {
    result = MEMORY[0x242667160](&unk_23F28574C, &type metadata for MessagePayload.ClientInitiatedClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08240);
  }
  return result;
}

unint64_t sub_23F24AD10()
{
  unint64_t result;

  result = qword_256E08248;
  if (!qword_256E08248)
  {
    result = MEMORY[0x242667160](&unk_23F28566C, &type metadata for MessagePayload.PrescribedPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08248);
  }
  return result;
}

unint64_t sub_23F24AD50()
{
  unint64_t result;

  result = qword_256E08250;
  if (!qword_256E08250)
  {
    result = MEMORY[0x242667160](&unk_23F285694, &type metadata for MessagePayload.PrescribedPlanCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08250);
  }
  return result;
}

unint64_t sub_23F24AD90()
{
  unint64_t result;

  result = qword_256E08258;
  if (!qword_256E08258)
  {
    result = MEMORY[0x242667160](&unk_23F2855B4, &type metadata for MessagePayload.MockTranscriptCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08258);
  }
  return result;
}

unint64_t sub_23F24ADD0()
{
  unint64_t result;

  result = qword_256E08260;
  if (!qword_256E08260)
  {
    result = MEMORY[0x242667160](&unk_23F2855DC, &type metadata for MessagePayload.MockTranscriptCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08260);
  }
  return result;
}

unint64_t sub_23F24AE10()
{
  unint64_t result;

  result = qword_256E08268;
  if (!qword_256E08268)
  {
    result = MEMORY[0x242667160](&unk_23F2854FC, &type metadata for MessagePayload.DisambiguationNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08268);
  }
  return result;
}

unint64_t sub_23F24AE50()
{
  unint64_t result;

  result = qword_256E08270;
  if (!qword_256E08270)
  {
    result = MEMORY[0x242667160](&unk_23F285524, &type metadata for MessagePayload.DisambiguationNeededCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08270);
  }
  return result;
}

unint64_t sub_23F24AE90()
{
  unint64_t result;

  result = qword_256E08278;
  if (!qword_256E08278)
  {
    result = MEMORY[0x242667160](&unk_23F285444, &type metadata for MessagePayload.ClientEffectInvocationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08278);
  }
  return result;
}

unint64_t sub_23F24AED0()
{
  unint64_t result;

  result = qword_256E08280;
  if (!qword_256E08280)
  {
    result = MEMORY[0x242667160](&unk_23F28546C, &type metadata for MessagePayload.ClientEffectInvocationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08280);
  }
  return result;
}

unint64_t sub_23F24AF10()
{
  unint64_t result;

  result = qword_256E08288;
  if (!qword_256E08288)
  {
    result = MEMORY[0x242667160](&unk_23F28538C, &type metadata for MessagePayload.ClientEffectResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08288);
  }
  return result;
}

unint64_t sub_23F24AF50()
{
  unint64_t result;

  result = qword_256E08290;
  if (!qword_256E08290)
  {
    result = MEMORY[0x242667160](&unk_23F2853B4, &type metadata for MessagePayload.ClientEffectResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08290);
  }
  return result;
}

unint64_t sub_23F24AF90()
{
  unint64_t result;

  result = qword_256E08298;
  if (!qword_256E08298)
  {
    result = MEMORY[0x242667160](&unk_23F2852D4, &type metadata for MessagePayload.ActionWillExecuteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08298);
  }
  return result;
}

unint64_t sub_23F24AFD0()
{
  unint64_t result;

  result = qword_256E082A0;
  if (!qword_256E082A0)
  {
    result = MEMORY[0x242667160](&unk_23F2852FC, &type metadata for MessagePayload.ActionWillExecuteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082A0);
  }
  return result;
}

unint64_t sub_23F24B010()
{
  unint64_t result;

  result = qword_256E082A8;
  if (!qword_256E082A8)
  {
    result = MEMORY[0x242667160](&unk_23F28521C, &type metadata for MessagePayload.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082A8);
  }
  return result;
}

unint64_t sub_23F24B050()
{
  unint64_t result;

  result = qword_256E082B0;
  if (!qword_256E082B0)
  {
    result = MEMORY[0x242667160](&unk_23F285244, &type metadata for MessagePayload.ClientActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082B0);
  }
  return result;
}

unint64_t sub_23F24B090()
{
  unint64_t result;

  result = qword_256E082B8;
  if (!qword_256E082B8)
  {
    result = MEMORY[0x242667160](&unk_23F285164, &type metadata for MessagePayload.ClientActionResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082B8);
  }
  return result;
}

unint64_t sub_23F24B0D0()
{
  unint64_t result;

  result = qword_256E082C0;
  if (!qword_256E082C0)
  {
    result = MEMORY[0x242667160](&unk_23F28518C, &type metadata for MessagePayload.ClientActionResultCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082C0);
  }
  return result;
}

unint64_t sub_23F24B110()
{
  unint64_t result;

  result = qword_256E082C8;
  if (!qword_256E082C8)
  {
    result = MEMORY[0x242667160](&unk_23F2850AC, &type metadata for MessagePayload.ClientCustomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082C8);
  }
  return result;
}

unint64_t sub_23F24B150()
{
  unint64_t result;

  result = qword_256E082D0;
  if (!qword_256E082D0)
  {
    result = MEMORY[0x242667160](&unk_23F2850D4, &type metadata for MessagePayload.ClientCustomCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082D0);
  }
  return result;
}

unint64_t sub_23F24B190()
{
  unint64_t result;

  result = qword_256E082D8;
  if (!qword_256E082D8)
  {
    result = MEMORY[0x242667160](&unk_23F284FF4, &type metadata for MessagePayload.ClientIdentifierCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082D8);
  }
  return result;
}

unint64_t sub_23F24B1D0()
{
  unint64_t result;

  result = qword_256E082E0;
  if (!qword_256E082E0)
  {
    result = MEMORY[0x242667160](&unk_23F28501C, &type metadata for MessagePayload.ClientIdentifierCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082E0);
  }
  return result;
}

unint64_t sub_23F24B210()
{
  unint64_t result;

  result = qword_256E082E8;
  if (!qword_256E082E8)
  {
    result = MEMORY[0x242667160](&unk_23F284F3C, &type metadata for MessagePayload.SystemPromptRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082E8);
  }
  return result;
}

unint64_t sub_23F24B250()
{
  unint64_t result;

  result = qword_256E082F0;
  if (!qword_256E082F0)
  {
    result = MEMORY[0x242667160](&unk_23F284F64, &type metadata for MessagePayload.SystemPromptRequestedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082F0);
  }
  return result;
}

unint64_t sub_23F24B290()
{
  unint64_t result;

  result = qword_256E082F8;
  if (!qword_256E082F8)
  {
    result = MEMORY[0x242667160](&unk_23F284E84, &type metadata for MessagePayload.SystemPromptResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E082F8);
  }
  return result;
}

unint64_t sub_23F24B2D0()
{
  unint64_t result;

  result = qword_256E08300;
  if (!qword_256E08300)
  {
    result = MEMORY[0x242667160](&unk_23F284EAC, &type metadata for MessagePayload.SystemPromptResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08300);
  }
  return result;
}

unint64_t sub_23F24B310()
{
  unint64_t result;

  result = qword_256E08308;
  if (!qword_256E08308)
  {
    result = MEMORY[0x242667160](&unk_23F284DCC, &type metadata for MessagePayload.ActionResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08308);
  }
  return result;
}

unint64_t sub_23F24B350()
{
  unint64_t result;

  result = qword_256E08310;
  if (!qword_256E08310)
  {
    result = MEMORY[0x242667160](&unk_23F284DF4, &type metadata for MessagePayload.ActionResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08310);
  }
  return result;
}

unint64_t sub_23F24B390()
{
  unint64_t result;

  result = qword_256E08318;
  if (!qword_256E08318)
  {
    result = MEMORY[0x242667160](&unk_23F284D14, &type metadata for MessagePayload.SystemResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08318);
  }
  return result;
}

unint64_t sub_23F24B3D0()
{
  unint64_t result;

  result = qword_256E08320;
  if (!qword_256E08320)
  {
    result = MEMORY[0x242667160](&unk_23F284D3C, &type metadata for MessagePayload.SystemResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08320);
  }
  return result;
}

unint64_t sub_23F24B410()
{
  unint64_t result;

  result = qword_256E08328;
  if (!qword_256E08328)
  {
    result = MEMORY[0x242667160](&unk_23F284C5C, &type metadata for MessagePayload.ContextPrewarmRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08328);
  }
  return result;
}

unint64_t sub_23F24B450()
{
  unint64_t result;

  result = qword_256E08330;
  if (!qword_256E08330)
  {
    result = MEMORY[0x242667160](&unk_23F284C84, &type metadata for MessagePayload.ContextPrewarmRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08330);
  }
  return result;
}

unint64_t sub_23F24B490()
{
  unint64_t result;

  result = qword_256E08338;
  if (!qword_256E08338)
  {
    result = MEMORY[0x242667160](&unk_23F284BA4, &type metadata for MessagePayload.ContextPrewarmCompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08338);
  }
  return result;
}

unint64_t sub_23F24B4D0()
{
  unint64_t result;

  result = qword_256E08340;
  if (!qword_256E08340)
  {
    result = MEMORY[0x242667160](&unk_23F284BCC, &type metadata for MessagePayload.ContextPrewarmCompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08340);
  }
  return result;
}

unint64_t sub_23F24B510()
{
  unint64_t result;

  result = qword_256E08348;
  if (!qword_256E08348)
  {
    result = MEMORY[0x242667160](&unk_23F284AEC, &type metadata for MessagePayload.SafetyModeReleaseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08348);
  }
  return result;
}

unint64_t sub_23F24B550()
{
  unint64_t result;

  result = qword_256E08350;
  if (!qword_256E08350)
  {
    result = MEMORY[0x242667160](&unk_23F284B14, &type metadata for MessagePayload.SafetyModeReleaseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08350);
  }
  return result;
}

unint64_t sub_23F24B590()
{
  unint64_t result;

  result = qword_256E08358;
  if (!qword_256E08358)
  {
    result = MEMORY[0x242667160](&unk_23F284A34, &type metadata for MessagePayload.SafetyModeExceptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08358);
  }
  return result;
}

unint64_t sub_23F24B5D0()
{
  unint64_t result;

  result = qword_256E08360;
  if (!qword_256E08360)
  {
    result = MEMORY[0x242667160](&unk_23F284A5C, &type metadata for MessagePayload.SafetyModeExceptionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08360);
  }
  return result;
}

unint64_t sub_23F24B610()
{
  unint64_t result;

  result = qword_256E08368;
  if (!qword_256E08368)
  {
    result = MEMORY[0x242667160](&unk_23F28497C, &type metadata for MessagePayload.ExternalAgentTextQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08368);
  }
  return result;
}

unint64_t sub_23F24B650()
{
  unint64_t result;

  result = qword_256E08370;
  if (!qword_256E08370)
  {
    result = MEMORY[0x242667160](&unk_23F2849A4, &type metadata for MessagePayload.ExternalAgentTextQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08370);
  }
  return result;
}

unint64_t sub_23F24B690()
{
  unint64_t result;

  result = qword_256E08378;
  if (!qword_256E08378)
  {
    result = MEMORY[0x242667160](&unk_23F2848C4, &type metadata for MessagePayload.ExternalAgentSpeechQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08378);
  }
  return result;
}

unint64_t sub_23F24B6D0()
{
  unint64_t result;

  result = qword_256E08380;
  if (!qword_256E08380)
  {
    result = MEMORY[0x242667160](&unk_23F2848EC, &type metadata for MessagePayload.ExternalAgentSpeechQueryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08380);
  }
  return result;
}

unint64_t sub_23F24B710()
{
  unint64_t result;

  result = qword_256E08388;
  if (!qword_256E08388)
  {
    result = MEMORY[0x242667160](&unk_23F28480C, &type metadata for MessagePayload.ExternalAgentRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08388);
  }
  return result;
}

unint64_t sub_23F24B750()
{
  unint64_t result;

  result = qword_256E08390;
  if (!qword_256E08390)
  {
    result = MEMORY[0x242667160](&unk_23F284834, &type metadata for MessagePayload.ExternalAgentRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08390);
  }
  return result;
}

unint64_t sub_23F24B790()
{
  unint64_t result;

  result = qword_256E08398;
  if (!qword_256E08398)
  {
    result = MEMORY[0x242667160](&unk_23F284754, &type metadata for MessagePayload.ExternalAgentOutcomeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08398);
  }
  return result;
}

unint64_t sub_23F24B7D0()
{
  unint64_t result;

  result = qword_256E083A0;
  if (!qword_256E083A0)
  {
    result = MEMORY[0x242667160](&unk_23F28477C, &type metadata for MessagePayload.ExternalAgentOutcomeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083A0);
  }
  return result;
}

unint64_t sub_23F24B810()
{
  unint64_t result;

  result = qword_256E083A8;
  if (!qword_256E083A8)
  {
    result = MEMORY[0x242667160](&unk_23F28469C, &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083A8);
  }
  return result;
}

unint64_t sub_23F24B850()
{
  unint64_t result;

  result = qword_256E083B0;
  if (!qword_256E083B0)
  {
    result = MEMORY[0x242667160](&unk_23F2846C4, &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083B0);
  }
  return result;
}

unint64_t sub_23F24B890()
{
  unint64_t result;

  result = qword_256E083B8;
  if (!qword_256E083B8)
  {
    result = MEMORY[0x242667160](&unk_23F2845E4, &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083B8);
  }
  return result;
}

unint64_t sub_23F24B8D0()
{
  unint64_t result;

  result = qword_256E083C0;
  if (!qword_256E083C0)
  {
    result = MEMORY[0x242667160](&unk_23F28460C, &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083C0);
  }
  return result;
}

unint64_t sub_23F24B910()
{
  unint64_t result;

  result = qword_256E083C8;
  if (!qword_256E083C8)
  {
    result = MEMORY[0x242667160](&unk_23F28452C, &type metadata for MessagePayload.ClientUndoRedoRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083C8);
  }
  return result;
}

unint64_t sub_23F24B950()
{
  unint64_t result;

  result = qword_256E083D0;
  if (!qword_256E083D0)
  {
    result = MEMORY[0x242667160](&unk_23F284554, &type metadata for MessagePayload.ClientUndoRedoRequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083D0);
  }
  return result;
}

unint64_t sub_23F24B990()
{
  unint64_t result;

  result = qword_256E083D8;
  if (!qword_256E083D8)
  {
    result = MEMORY[0x242667160](&unk_23F284474, &type metadata for MessagePayload.ActionSummaryUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083D8);
  }
  return result;
}

unint64_t sub_23F24B9D0()
{
  unint64_t result;

  result = qword_256E083E0;
  if (!qword_256E083E0)
  {
    result = MEMORY[0x242667160](&unk_23F28449C, &type metadata for MessagePayload.ActionSummaryUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083E0);
  }
  return result;
}

unint64_t sub_23F24BA10()
{
  unint64_t result;

  result = qword_256E083E8;
  if (!qword_256E083E8)
  {
    result = MEMORY[0x242667160](&unk_23F2843BC, &type metadata for MessagePayload.ClientDebuggerEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083E8);
  }
  return result;
}

unint64_t sub_23F24BA50()
{
  unint64_t result;

  result = qword_256E083F0;
  if (!qword_256E083F0)
  {
    result = MEMORY[0x242667160](&unk_23F2843E4, &type metadata for MessagePayload.ClientDebuggerEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083F0);
  }
  return result;
}

unint64_t sub_23F24BA90()
{
  unint64_t result;

  result = qword_256E083F8;
  if (!qword_256E083F8)
  {
    result = MEMORY[0x242667160](&unk_23F284304, &type metadata for MessagePayload.ServerDebuggerEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E083F8);
  }
  return result;
}

unint64_t sub_23F24BAD0()
{
  unint64_t result;

  result = qword_256E08400;
  if (!qword_256E08400)
  {
    result = MEMORY[0x242667160](&unk_23F28432C, &type metadata for MessagePayload.ServerDebuggerEventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08400);
  }
  return result;
}

unint64_t sub_23F24BB10()
{
  unint64_t result;

  result = qword_256E08408;
  if (!qword_256E08408)
  {
    result = MEMORY[0x242667160](&unk_23F28424C, &type metadata for MessagePayload.StatusUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08408);
  }
  return result;
}

unint64_t sub_23F24BB50()
{
  unint64_t result;

  result = qword_256E08410;
  if (!qword_256E08410)
  {
    result = MEMORY[0x242667160](&unk_23F284274, &type metadata for MessagePayload.StatusUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08410);
  }
  return result;
}

unint64_t sub_23F24BB90()
{
  unint64_t result;

  result = qword_256E08418;
  if (!qword_256E08418)
  {
    result = MEMORY[0x242667160](&unk_23F284194, &type metadata for MessagePayload.PlannerPromptDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08418);
  }
  return result;
}

unint64_t sub_23F24BBD0()
{
  unint64_t result;

  result = qword_256E08420;
  if (!qword_256E08420)
  {
    result = MEMORY[0x242667160](&unk_23F2841BC, &type metadata for MessagePayload.PlannerPromptDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08420);
  }
  return result;
}

unint64_t sub_23F24BC10()
{
  unint64_t result;

  result = qword_256E08428;
  if (!qword_256E08428)
  {
    result = MEMORY[0x242667160](&unk_23F2840DC, &type metadata for MessagePayload.ActionResolutionUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08428);
  }
  return result;
}

unint64_t sub_23F24BC50()
{
  unint64_t result;

  result = qword_256E08430;
  if (!qword_256E08430)
  {
    result = MEMORY[0x242667160](&unk_23F284104, &type metadata for MessagePayload.ActionResolutionUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08430);
  }
  return result;
}

unint64_t sub_23F24BC90()
{
  unint64_t result;

  result = qword_256E08438;
  if (!qword_256E08438)
  {
    result = MEMORY[0x242667160](&unk_23F285E54, &type metadata for MessagePayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08438);
  }
  return result;
}

unint64_t sub_23F24BCD0()
{
  unint64_t result;

  result = qword_256E08440;
  if (!qword_256E08440)
  {
    result = MEMORY[0x242667160](&unk_23F285E7C, &type metadata for MessagePayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08440);
  }
  return result;
}

unint64_t sub_23F24BD10()
{
  unint64_t result;

  result = qword_256E08448;
  if (!qword_256E08448)
  {
    result = MEMORY[0x242667160](&unk_23F284024, &type metadata for MessagePayload.ActionSummaryUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08448);
  }
  return result;
}

unint64_t sub_23F24BD50()
{
  unint64_t result;

  result = qword_256E08450;
  if (!qword_256E08450)
  {
    result = MEMORY[0x242667160](&unk_23F28404C, &type metadata for MessagePayload.ActionSummaryUpdate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08450);
  }
  return result;
}

unint64_t sub_23F24BD90()
{
  unint64_t result;

  result = qword_256E08458;
  if (!qword_256E08458)
  {
    result = MEMORY[0x242667160](&unk_23F283F6C, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08458);
  }
  return result;
}

unint64_t sub_23F24BDD0()
{
  unint64_t result;

  result = qword_256E08460;
  if (!qword_256E08460)
  {
    result = MEMORY[0x242667160](&unk_23F283F94, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08460);
  }
  return result;
}

unint64_t sub_23F24BE10()
{
  unint64_t result;

  result = qword_256E08468;
  if (!qword_256E08468)
  {
    result = MEMORY[0x242667160](&unk_23F283EB4, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08468);
  }
  return result;
}

unint64_t sub_23F24BE50()
{
  unint64_t result;

  result = qword_256E08470;
  if (!qword_256E08470)
  {
    result = MEMORY[0x242667160](&unk_23F283EDC, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryPlaceholder.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08470);
  }
  return result;
}

unint64_t sub_23F24BE90()
{
  unint64_t result;

  result = qword_256E08478;
  if (!qword_256E08478)
  {
    result = MEMORY[0x242667160](&unk_23F283DFC, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08478);
  }
  return result;
}

unint64_t sub_23F24BED0()
{
  unint64_t result;

  result = qword_256E08480;
  if (!qword_256E08480)
  {
    result = MEMORY[0x242667160](&unk_23F283E24, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08480);
  }
  return result;
}

unint64_t sub_23F24BF10()
{
  unint64_t result;

  result = qword_256E08488;
  if (!qword_256E08488)
  {
    result = MEMORY[0x242667160](&unk_23F283D44, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08488);
  }
  return result;
}

unint64_t sub_23F24BF50()
{
  unint64_t result;

  result = qword_256E08490;
  if (!qword_256E08490)
  {
    result = MEMORY[0x242667160](&unk_23F283D6C, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummaryValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08490);
  }
  return result;
}

unint64_t sub_23F24BF90()
{
  unint64_t result;

  result = qword_256E08498;
  if (!qword_256E08498)
  {
    result = MEMORY[0x242667160](&unk_23F283BD4, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08498);
  }
  return result;
}

unint64_t sub_23F24BFD0()
{
  unint64_t result;

  result = qword_256E084A0;
  if (!qword_256E084A0)
  {
    result = MEMORY[0x242667160](&unk_23F283BFC, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084A0);
  }
  return result;
}

unint64_t sub_23F24C010()
{
  unint64_t result;

  result = qword_256E084A8;
  if (!qword_256E084A8)
  {
    result = MEMORY[0x242667160](&unk_23F283B1C, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084A8);
  }
  return result;
}

unint64_t sub_23F24C050()
{
  unint64_t result;

  result = qword_256E084B0;
  if (!qword_256E084B0)
  {
    result = MEMORY[0x242667160](&unk_23F283B44, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.ValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084B0);
  }
  return result;
}

unint64_t sub_23F24C090()
{
  unint64_t result;

  result = qword_256E084B8;
  if (!qword_256E084B8)
  {
    result = MEMORY[0x242667160](&unk_23F283A64, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.PlaceholderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084B8);
  }
  return result;
}

unint64_t sub_23F24C0D0()
{
  unint64_t result;

  result = qword_256E084C0;
  if (!qword_256E084C0)
  {
    result = MEMORY[0x242667160](&unk_23F283A8C, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.PlaceholderCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084C0);
  }
  return result;
}

unint64_t sub_23F24C110()
{
  unint64_t result;

  result = qword_256E084C8;
  if (!qword_256E084C8)
  {
    result = MEMORY[0x242667160](&unk_23F283C8C, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084C8);
  }
  return result;
}

unint64_t sub_23F24C150()
{
  unint64_t result;

  result = qword_256E084D0;
  if (!qword_256E084D0)
  {
    result = MEMORY[0x242667160](&unk_23F283CB4, &type metadata for MessagePayload.ActionSummaryUpdate.ToolInvocationSummary.ParameterSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084D0);
  }
  return result;
}

unint64_t sub_23F24C190()
{
  unint64_t result;

  result = qword_256E084D8;
  if (!qword_256E084D8)
  {
    result = MEMORY[0x242667160](&unk_23F2839AC, &type metadata for MessagePayload.ClientUndoRedoRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084D8);
  }
  return result;
}

unint64_t sub_23F24C1D0()
{
  unint64_t result;

  result = qword_256E084E0;
  if (!qword_256E084E0)
  {
    result = MEMORY[0x242667160](&unk_23F2839D4, &type metadata for MessagePayload.ClientUndoRedoRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084E0);
  }
  return result;
}

unint64_t sub_23F24C210()
{
  unint64_t result;

  result = qword_256E084E8;
  if (!qword_256E084E8)
  {
    result = MEMORY[0x242667160](&unk_23F2838A4, &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.UndoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084E8);
  }
  return result;
}

unint64_t sub_23F24C250()
{
  unint64_t result;

  result = qword_256E084F0;
  if (!qword_256E084F0)
  {
    result = MEMORY[0x242667160](&unk_23F2838CC, &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.UndoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084F0);
  }
  return result;
}

unint64_t sub_23F24C290()
{
  unint64_t result;

  result = qword_256E084F8;
  if (!qword_256E084F8)
  {
    result = MEMORY[0x242667160](&unk_23F283854, &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.RedoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E084F8);
  }
  return result;
}

unint64_t sub_23F24C2D0()
{
  unint64_t result;

  result = qword_256E08500;
  if (!qword_256E08500)
  {
    result = MEMORY[0x242667160](&unk_23F28387C, &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.RedoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08500);
  }
  return result;
}

unint64_t sub_23F24C310()
{
  unint64_t result;

  result = qword_256E08508;
  if (!qword_256E08508)
  {
    result = MEMORY[0x242667160](&unk_23F2838F4, &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08508);
  }
  return result;
}

unint64_t sub_23F24C350()
{
  unint64_t result;

  result = qword_256E08510;
  if (!qword_256E08510)
  {
    result = MEMORY[0x242667160](&unk_23F28391C, &type metadata for MessagePayload.ClientUndoRedoRequest.UndoOperation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08510);
  }
  return result;
}

unint64_t sub_23F24C390()
{
  unint64_t result;

  result = qword_256E08518;
  if (!qword_256E08518)
  {
    result = MEMORY[0x242667160](&unk_23F28379C, &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08518);
  }
  return result;
}

unint64_t sub_23F24C3D0()
{
  unint64_t result;

  result = qword_256E08520;
  if (!qword_256E08520)
  {
    result = MEMORY[0x242667160](&unk_23F2837C4, &type metadata for MessagePayload.ExternalAgentRequestRewriteMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08520);
  }
  return result;
}

unint64_t sub_23F24C410()
{
  unint64_t result;

  result = qword_256E08528;
  if (!qword_256E08528)
  {
    result = MEMORY[0x242667160](&unk_23F2836E4, &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08528);
  }
  return result;
}

unint64_t sub_23F24C450()
{
  unint64_t result;

  result = qword_256E08530;
  if (!qword_256E08530)
  {
    result = MEMORY[0x242667160](&unk_23F28370C, &type metadata for MessagePayload.ExternalAgentQueryRewriteMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08530);
  }
  return result;
}

unint64_t sub_23F24C490()
{
  unint64_t result;

  result = qword_256E08538;
  if (!qword_256E08538)
  {
    result = MEMORY[0x242667160](&unk_23F28362C, &type metadata for MessagePayload.ExternalAgentOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08538);
  }
  return result;
}

unint64_t sub_23F24C4D0()
{
  unint64_t result;

  result = qword_256E08540;
  if (!qword_256E08540)
  {
    result = MEMORY[0x242667160](&unk_23F283654, &type metadata for MessagePayload.ExternalAgentOutcome.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08540);
  }
  return result;
}

unint64_t sub_23F24C510()
{
  unint64_t result;

  result = qword_256E08548;
  if (!qword_256E08548)
  {
    result = MEMORY[0x242667160](&unk_23F283574, &type metadata for MessagePayload.ExternalAgentSpeechQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08548);
  }
  return result;
}

unint64_t sub_23F24C550()
{
  unint64_t result;

  result = qword_256E08550;
  if (!qword_256E08550)
  {
    result = MEMORY[0x242667160](&unk_23F28359C, &type metadata for MessagePayload.ExternalAgentSpeechQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08550);
  }
  return result;
}

unint64_t sub_23F24C590()
{
  unint64_t result;

  result = qword_256E08558;
  if (!qword_256E08558)
  {
    result = MEMORY[0x242667160](&unk_23F2834BC, &type metadata for MessagePayload.ExternalAgentSpeechQuery.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08558);
  }
  return result;
}

unint64_t sub_23F24C5D0()
{
  unint64_t result;

  result = qword_256E08560;
  if (!qword_256E08560)
  {
    result = MEMORY[0x242667160](&unk_23F2834E4, &type metadata for MessagePayload.ExternalAgentSpeechQuery.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08560);
  }
  return result;
}

unint64_t sub_23F24C610()
{
  unint64_t result;

  result = qword_256E08568;
  if (!qword_256E08568)
  {
    result = MEMORY[0x242667160](&unk_23F283404, &type metadata for MessagePayload.ExternalAgentTextQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08568);
  }
  return result;
}

unint64_t sub_23F24C650()
{
  unint64_t result;

  result = qword_256E08570;
  if (!qword_256E08570)
  {
    result = MEMORY[0x242667160](&unk_23F28342C, &type metadata for MessagePayload.ExternalAgentTextQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08570);
  }
  return result;
}

unint64_t sub_23F24C690()
{
  unint64_t result;

  result = qword_256E08578;
  if (!qword_256E08578)
  {
    result = MEMORY[0x242667160](&unk_23F28334C, &type metadata for MessagePayload.ExternalAgentRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08578);
  }
  return result;
}

unint64_t sub_23F24C6D0()
{
  unint64_t result;

  result = qword_256E08580;
  if (!qword_256E08580)
  {
    result = MEMORY[0x242667160](&unk_23F283374, &type metadata for MessagePayload.ExternalAgentRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08580);
  }
  return result;
}

unint64_t sub_23F24C710()
{
  unint64_t result;

  result = qword_256E08588;
  if (!qword_256E08588)
  {
    result = MEMORY[0x242667160](&unk_23F283294, &type metadata for MessagePayload.SafetyModeException.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08588);
  }
  return result;
}

unint64_t sub_23F24C750()
{
  unint64_t result;

  result = qword_256E08590;
  if (!qword_256E08590)
  {
    result = MEMORY[0x242667160](&unk_23F2832BC, &type metadata for MessagePayload.SafetyModeException.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08590);
  }
  return result;
}

unint64_t sub_23F24C790()
{
  unint64_t result;

  result = qword_256E08598;
  if (!qword_256E08598)
  {
    result = MEMORY[0x242667160](&unk_23F283244, &type metadata for MessagePayload.SafetyModeRelease.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08598);
  }
  return result;
}

unint64_t sub_23F24C7D0()
{
  unint64_t result;

  result = qword_256E085A0;
  if (!qword_256E085A0)
  {
    result = MEMORY[0x242667160](&unk_23F28326C, &type metadata for MessagePayload.SafetyModeRelease.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085A0);
  }
  return result;
}

unint64_t sub_23F24C810()
{
  unint64_t result;

  result = qword_256E085A8;
  if (!qword_256E085A8)
  {
    result = MEMORY[0x242667160](&unk_23F28318C, &type metadata for MessagePayload.ContextPrewarmCompleted.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085A8);
  }
  return result;
}

unint64_t sub_23F24C850()
{
  unint64_t result;

  result = qword_256E085B0;
  if (!qword_256E085B0)
  {
    result = MEMORY[0x242667160](&unk_23F2831B4, &type metadata for MessagePayload.ContextPrewarmCompleted.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085B0);
  }
  return result;
}

unint64_t sub_23F24C890()
{
  unint64_t result;

  result = qword_256E085B8;
  if (!qword_256E085B8)
  {
    result = MEMORY[0x242667160](&unk_23F2830D4, &type metadata for MessagePayload.ContextPrewarmRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085B8);
  }
  return result;
}

unint64_t sub_23F24C8D0()
{
  unint64_t result;

  result = qword_256E085C0;
  if (!qword_256E085C0)
  {
    result = MEMORY[0x242667160](&unk_23F2830FC, &type metadata for MessagePayload.ContextPrewarmRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085C0);
  }
  return result;
}

unint64_t sub_23F24C910()
{
  unint64_t result;

  result = qword_256E085C8;
  if (!qword_256E085C8)
  {
    result = MEMORY[0x242667160](&unk_23F28301C, &type metadata for MessagePayload.ClientInitiatedClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085C8);
  }
  return result;
}

unint64_t sub_23F24C950()
{
  unint64_t result;

  result = qword_256E085D0;
  if (!qword_256E085D0)
  {
    result = MEMORY[0x242667160](&unk_23F283044, &type metadata for MessagePayload.ClientInitiatedClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085D0);
  }
  return result;
}

unint64_t sub_23F24C990()
{
  unint64_t result;

  result = qword_256E085D8;
  if (!qword_256E085D8)
  {
    result = MEMORY[0x242667160](&unk_23F282F64, &type metadata for MessagePayload.ClientIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085D8);
  }
  return result;
}

unint64_t sub_23F24C9D0()
{
  unint64_t result;

  result = qword_256E085E0;
  if (!qword_256E085E0)
  {
    result = MEMORY[0x242667160](&unk_23F282F8C, &type metadata for MessagePayload.ClientIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085E0);
  }
  return result;
}

unint64_t sub_23F24CA10()
{
  unint64_t result;

  result = qword_256E085E8;
  if (!qword_256E085E8)
  {
    result = MEMORY[0x242667160](&unk_23F282EAC, &type metadata for MessagePayload.ClientCustom.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085E8);
  }
  return result;
}

unint64_t sub_23F24CA50()
{
  unint64_t result;

  result = qword_256E085F0;
  if (!qword_256E085F0)
  {
    result = MEMORY[0x242667160](&unk_23F282ED4, &type metadata for MessagePayload.ClientCustom.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085F0);
  }
  return result;
}

unint64_t sub_23F24CA90()
{
  unint64_t result;

  result = qword_256E085F8;
  if (!qword_256E085F8)
  {
    result = MEMORY[0x242667160](&unk_23F282DF4, &type metadata for MessagePayload.ClientActionResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E085F8);
  }
  return result;
}

unint64_t sub_23F24CAD0()
{
  unint64_t result;

  result = qword_256E08600;
  if (!qword_256E08600)
  {
    result = MEMORY[0x242667160](&unk_23F282E1C, &type metadata for MessagePayload.ClientActionResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08600);
  }
  return result;
}

unint64_t sub_23F24CB10()
{
  unint64_t result;

  result = qword_256E08608;
  if (!qword_256E08608)
  {
    result = MEMORY[0x242667160](&unk_23F282D3C, &type metadata for MessagePayload.ClientEffectResolved.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08608);
  }
  return result;
}

unint64_t sub_23F24CB50()
{
  unint64_t result;

  result = qword_256E08610;
  if (!qword_256E08610)
  {
    result = MEMORY[0x242667160](&unk_23F282D64, &type metadata for MessagePayload.ClientEffectResolved.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08610);
  }
  return result;
}

unint64_t sub_23F24CB90()
{
  unint64_t result;

  result = qword_256E08618;
  if (!qword_256E08618)
  {
    result = MEMORY[0x242667160](&unk_23F282BCC, &type metadata for MessagePayload.ClientEffectResolved.Result.CompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08618);
  }
  return result;
}

unint64_t sub_23F24CBD0()
{
  unint64_t result;

  result = qword_256E08620;
  if (!qword_256E08620)
  {
    result = MEMORY[0x242667160](&unk_23F282BF4, &type metadata for MessagePayload.ClientEffectResolved.Result.CompleteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08620);
  }
  return result;
}

unint64_t sub_23F24CC10()
{
  unint64_t result;

  result = qword_256E08628;
  if (!qword_256E08628)
  {
    result = MEMORY[0x242667160](&unk_23F282B14, &type metadata for MessagePayload.ClientEffectResolved.Result.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08628);
  }
  return result;
}

unint64_t sub_23F24CC50()
{
  unint64_t result;

  result = qword_256E08630;
  if (!qword_256E08630)
  {
    result = MEMORY[0x242667160](&unk_23F282B3C, &type metadata for MessagePayload.ClientEffectResolved.Result.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08630);
  }
  return result;
}

unint64_t sub_23F24CC90()
{
  unint64_t result;

  result = qword_256E08638;
  if (!qword_256E08638)
  {
    result = MEMORY[0x242667160](&unk_23F282C84, &type metadata for MessagePayload.ClientEffectResolved.Result.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08638);
  }
  return result;
}

unint64_t sub_23F24CCD0()
{
  unint64_t result;

  result = qword_256E08640;
  if (!qword_256E08640)
  {
    result = MEMORY[0x242667160](&unk_23F282CAC, &type metadata for MessagePayload.ClientEffectResolved.Result.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08640);
  }
  return result;
}

unint64_t sub_23F24CD10()
{
  unint64_t result;

  result = qword_256E08648;
  if (!qword_256E08648)
  {
    result = MEMORY[0x242667160](&unk_23F282A5C, &type metadata for MessagePayload.ActionWillExecute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08648);
  }
  return result;
}

unint64_t sub_23F24CD50()
{
  unint64_t result;

  result = qword_256E08650;
  if (!qword_256E08650)
  {
    result = MEMORY[0x242667160](&unk_23F282A84, &type metadata for MessagePayload.ActionWillExecute.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08650);
  }
  return result;
}

unint64_t sub_23F24CD90()
{
  unint64_t result;

  result = qword_256E08658;
  if (!qword_256E08658)
  {
    result = MEMORY[0x242667160](&unk_23F2829A4, &type metadata for MessagePayload.ActionWillExecute.ParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08658);
  }
  return result;
}

unint64_t sub_23F24CDD0()
{
  unint64_t result;

  result = qword_256E08660;
  if (!qword_256E08660)
  {
    result = MEMORY[0x242667160](&unk_23F2829CC, &type metadata for MessagePayload.ActionWillExecute.ParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08660);
  }
  return result;
}

unint64_t sub_23F24CE10()
{
  unint64_t result;

  result = qword_256E08668;
  if (!qword_256E08668)
  {
    result = MEMORY[0x242667160](&unk_23F282834, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08668);
  }
  return result;
}

unint64_t sub_23F24CE50()
{
  unint64_t result;

  result = qword_256E08670;
  if (!qword_256E08670)
  {
    result = MEMORY[0x242667160](&unk_23F28285C, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08670);
  }
  return result;
}

unint64_t sub_23F24CE90()
{
  unint64_t result;

  result = qword_256E08678;
  if (!qword_256E08678)
  {
    result = MEMORY[0x242667160](&unk_23F28277C, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08678);
  }
  return result;
}

unint64_t sub_23F24CED0()
{
  unint64_t result;

  result = qword_256E08680;
  if (!qword_256E08680)
  {
    result = MEMORY[0x242667160](&unk_23F2827A4, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08680);
  }
  return result;
}

unint64_t sub_23F24CF10()
{
  unint64_t result;

  result = qword_256E08688;
  if (!qword_256E08688)
  {
    result = MEMORY[0x242667160](&unk_23F2826C4, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.DeniedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08688);
  }
  return result;
}

unint64_t sub_23F24CF50()
{
  unint64_t result;

  result = qword_256E08690;
  if (!qword_256E08690)
  {
    result = MEMORY[0x242667160](&unk_23F2826EC, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.DeniedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08690);
  }
  return result;
}

unint64_t sub_23F24CF90()
{
  unint64_t result;

  result = qword_256E08698;
  if (!qword_256E08698)
  {
    result = MEMORY[0x242667160](&unk_23F2828EC, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08698);
  }
  return result;
}

unint64_t sub_23F24CFD0()
{
  unint64_t result;

  result = qword_256E086A0;
  if (!qword_256E086A0)
  {
    result = MEMORY[0x242667160](&unk_23F282914, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086A0);
  }
  return result;
}

unint64_t sub_23F24D010()
{
  unint64_t result;

  result = qword_256E086A8;
  if (!qword_256E086A8)
  {
    result = MEMORY[0x242667160](&unk_23F282674, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.Denied.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086A8);
  }
  return result;
}

unint64_t sub_23F24D050()
{
  unint64_t result;

  result = qword_256E086B0;
  if (!qword_256E086B0)
  {
    result = MEMORY[0x242667160](&unk_23F28269C, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.Denied.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086B0);
  }
  return result;
}

unint64_t sub_23F24D090()
{
  unint64_t result;

  result = qword_256E086B8;
  if (!qword_256E086B8)
  {
    result = MEMORY[0x242667160](&unk_23F2825BC, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086B8);
  }
  return result;
}

unint64_t sub_23F24D0D0()
{
  unint64_t result;

  result = qword_256E086C0;
  if (!qword_256E086C0)
  {
    result = MEMORY[0x242667160](&unk_23F2825E4, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.SelectedInDisambiguation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086C0);
  }
  return result;
}

unint64_t sub_23F24D110()
{
  unint64_t result;

  result = qword_256E086C8;
  if (!qword_256E086C8)
  {
    result = MEMORY[0x242667160](&unk_23F28256C, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.Confirmed.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086C8);
  }
  return result;
}

unint64_t sub_23F24D150()
{
  unint64_t result;

  result = qword_256E086D0;
  if (!qword_256E086D0)
  {
    result = MEMORY[0x242667160](&unk_23F282594, &type metadata for MessagePayload.ActionWillExecute.PromptSelection.Confirmed.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086D0);
  }
  return result;
}

unint64_t sub_23F24D190()
{
  unint64_t result;

  result = qword_256E086D8;
  if (!qword_256E086D8)
  {
    result = MEMORY[0x242667160](&unk_23F2823FC, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ReferenceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086D8);
  }
  return result;
}

unint64_t sub_23F24D1D0()
{
  unint64_t result;

  result = qword_256E086E0;
  if (!qword_256E086E0)
  {
    result = MEMORY[0x242667160](&unk_23F282424, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ReferenceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086E0);
  }
  return result;
}

unint64_t sub_23F24D210()
{
  unint64_t result;

  result = qword_256E086E8;
  if (!qword_256E086E8)
  {
    result = MEMORY[0x242667160](&unk_23F282344, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086E8);
  }
  return result;
}

unint64_t sub_23F24D250()
{
  unint64_t result;

  result = qword_256E086F0;
  if (!qword_256E086F0)
  {
    result = MEMORY[0x242667160](&unk_23F28236C, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.ValueCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086F0);
  }
  return result;
}

unint64_t sub_23F24D290()
{
  unint64_t result;

  result = qword_256E086F8;
  if (!qword_256E086F8)
  {
    result = MEMORY[0x242667160](&unk_23F2824B4, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E086F8);
  }
  return result;
}

unint64_t sub_23F24D2D0()
{
  unint64_t result;

  result = qword_256E08700;
  if (!qword_256E08700)
  {
    result = MEMORY[0x242667160](&unk_23F2824DC, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08700);
  }
  return result;
}

unint64_t sub_23F24D310()
{
  unint64_t result;

  result = qword_256E08708;
  if (!qword_256E08708)
  {
    result = MEMORY[0x242667160](&unk_23F28228C, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08708);
  }
  return result;
}

unint64_t sub_23F24D350()
{
  unint64_t result;

  result = qword_256E08710;
  if (!qword_256E08710)
  {
    result = MEMORY[0x242667160](&unk_23F2822B4, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08710);
  }
  return result;
}

unint64_t sub_23F24D390()
{
  unint64_t result;

  result = qword_256E08718;
  if (!qword_256E08718)
  {
    result = MEMORY[0x242667160](&unk_23F2821D4, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Reference.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08718);
  }
  return result;
}

unint64_t sub_23F24D3D0()
{
  unint64_t result;

  result = qword_256E08720;
  if (!qword_256E08720)
  {
    result = MEMORY[0x242667160](&unk_23F2821FC, &type metadata for MessagePayload.ActionWillExecute.ToolParameterValue.Reference.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08720);
  }
  return result;
}

unint64_t sub_23F24D410()
{
  unint64_t result;

  result = qword_256E08728;
  if (!qword_256E08728)
  {
    result = MEMORY[0x242667160](&unk_23F28211C, &type metadata for MessagePayload.ClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08728);
  }
  return result;
}

unint64_t sub_23F24D450()
{
  unint64_t result;

  result = qword_256E08730;
  if (!qword_256E08730)
  {
    result = MEMORY[0x242667160](&unk_23F282144, &type metadata for MessagePayload.ClientAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08730);
  }
  return result;
}

unint64_t sub_23F24D490()
{
  unint64_t result;

  result = qword_256E08738;
  if (!qword_256E08738)
  {
    result = MEMORY[0x242667160](&unk_23F282064, &type metadata for MessagePayload.ClientAction.UnresolvedParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08738);
  }
  return result;
}

unint64_t sub_23F24D4D0()
{
  unint64_t result;

  result = qword_256E08740;
  if (!qword_256E08740)
  {
    result = MEMORY[0x242667160](&unk_23F28208C, &type metadata for MessagePayload.ClientAction.UnresolvedParameterValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08740);
  }
  return result;
}

unint64_t sub_23F24D510()
{
  unint64_t result;

  result = qword_256E08748;
  if (!qword_256E08748)
  {
    result = MEMORY[0x242667160](&unk_23F281EF4, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.ResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08748);
  }
  return result;
}

unint64_t sub_23F24D550()
{
  unint64_t result;

  result = qword_256E08750;
  if (!qword_256E08750)
  {
    result = MEMORY[0x242667160](&unk_23F281F1C, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.ResolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08750);
  }
  return result;
}

unint64_t sub_23F24D590()
{
  unint64_t result;

  result = qword_256E08758;
  if (!qword_256E08758)
  {
    result = MEMORY[0x242667160](&unk_23F281E3C, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.UnresolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08758);
  }
  return result;
}

unint64_t sub_23F24D5D0()
{
  unint64_t result;

  result = qword_256E08760;
  if (!qword_256E08760)
  {
    result = MEMORY[0x242667160](&unk_23F281E64, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.UnresolvedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08760);
  }
  return result;
}

unint64_t sub_23F24D610()
{
  unint64_t result;

  result = qword_256E08768;
  if (!qword_256E08768)
  {
    result = MEMORY[0x242667160](&unk_23F281FAC, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08768);
  }
  return result;
}

unint64_t sub_23F24D650()
{
  unint64_t result;

  result = qword_256E08770;
  if (!qword_256E08770)
  {
    result = MEMORY[0x242667160](&unk_23F281FD4, &type metadata for MessagePayload.ClientAction.ShimParameterResolution.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08770);
  }
  return result;
}

unint64_t sub_23F24D690()
{
  unint64_t result;

  result = qword_256E08778;
  if (!qword_256E08778)
  {
    result = MEMORY[0x242667160](&unk_23F281D84, &type metadata for MessagePayload.ClientEffectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08778);
  }
  return result;
}

unint64_t sub_23F24D6D0()
{
  unint64_t result;

  result = qword_256E08780;
  if (!qword_256E08780)
  {
    result = MEMORY[0x242667160](&unk_23F281DAC, &type metadata for MessagePayload.ClientEffectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08780);
  }
  return result;
}

unint64_t sub_23F24D710()
{
  unint64_t result;

  result = qword_256E08788;
  if (!qword_256E08788)
  {
    result = MEMORY[0x242667160](&unk_23F281CCC, &type metadata for MessagePayload.DisambiguationNeeded.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08788);
  }
  return result;
}

unint64_t sub_23F24D750()
{
  unint64_t result;

  result = qword_256E08790;
  if (!qword_256E08790)
  {
    result = MEMORY[0x242667160](&unk_23F281CF4, &type metadata for MessagePayload.DisambiguationNeeded.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08790);
  }
  return result;
}

unint64_t sub_23F24D790()
{
  unint64_t result;

  result = qword_256E08798;
  if (!qword_256E08798)
  {
    result = MEMORY[0x242667160](&unk_23F281C14, &type metadata for MessagePayload.MockTranscript.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08798);
  }
  return result;
}

unint64_t sub_23F24D7D0()
{
  unint64_t result;

  result = qword_256E087A0;
  if (!qword_256E087A0)
  {
    result = MEMORY[0x242667160](&unk_23F281C3C, &type metadata for MessagePayload.MockTranscript.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087A0);
  }
  return result;
}

unint64_t sub_23F24D810()
{
  unint64_t result;

  result = qword_256E087A8;
  if (!qword_256E087A8)
  {
    result = MEMORY[0x242667160](&unk_23F281B5C, &type metadata for MessagePayload.PrescribedPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087A8);
  }
  return result;
}

unint64_t sub_23F24D850()
{
  unint64_t result;

  result = qword_256E087B0;
  if (!qword_256E087B0)
  {
    result = MEMORY[0x242667160](&unk_23F281B84, &type metadata for MessagePayload.PrescribedPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087B0);
  }
  return result;
}

unint64_t sub_23F24D890()
{
  unint64_t result;

  result = qword_256E087B8;
  if (!qword_256E087B8)
  {
    result = MEMORY[0x242667160](&unk_23F281AA4, &type metadata for MessagePayload.SpeechQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087B8);
  }
  return result;
}

unint64_t sub_23F24D8D0()
{
  unint64_t result;

  result = qword_256E087C0;
  if (!qword_256E087C0)
  {
    result = MEMORY[0x242667160](&unk_23F281ACC, &type metadata for MessagePayload.SpeechQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087C0);
  }
  return result;
}

unint64_t sub_23F24D910()
{
  unint64_t result;

  result = qword_256E087C8;
  if (!qword_256E087C8)
  {
    result = MEMORY[0x242667160](&unk_23F2819EC, &type metadata for MessagePayload.SpeechQuery.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087C8);
  }
  return result;
}

unint64_t sub_23F24D950()
{
  unint64_t result;

  result = qword_256E087D0;
  if (!qword_256E087D0)
  {
    result = MEMORY[0x242667160](&unk_23F281A14, &type metadata for MessagePayload.SpeechQuery.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087D0);
  }
  return result;
}

unint64_t sub_23F24D990()
{
  unint64_t result;

  result = qword_256E087D8;
  if (!qword_256E087D8)
  {
    result = MEMORY[0x242667160](&unk_23F281934, &type metadata for MessagePayload.Query.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087D8);
  }
  return result;
}

unint64_t sub_23F24D9D0()
{
  unint64_t result;

  result = qword_256E087E0;
  if (!qword_256E087E0)
  {
    result = MEMORY[0x242667160](&unk_23F28195C, &type metadata for MessagePayload.Query.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087E0);
  }
  return result;
}

unint64_t sub_23F24DA10()
{
  unint64_t result;

  result = qword_256E087E8;
  if (!qword_256E087E8)
  {
    result = MEMORY[0x242667160](&unk_23F2817C4, &type metadata for MessagePayload.RequestPrescribedPlan.SearchToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087E8);
  }
  return result;
}

unint64_t sub_23F24DA50()
{
  unint64_t result;

  result = qword_256E087F0;
  if (!qword_256E087F0)
  {
    result = MEMORY[0x242667160](&unk_23F2817EC, &type metadata for MessagePayload.RequestPrescribedPlan.SearchToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087F0);
  }
  return result;
}

unint64_t sub_23F24DA90()
{
  unint64_t result;

  result = qword_256E087F8;
  if (!qword_256E087F8)
  {
    result = MEMORY[0x242667160](&unk_23F28170C, &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E087F8);
  }
  return result;
}

unint64_t sub_23F24DAD0()
{
  unint64_t result;

  result = qword_256E08800;
  if (!qword_256E08800)
  {
    result = MEMORY[0x242667160](&unk_23F281734, &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08800);
  }
  return result;
}

unint64_t sub_23F24DB10()
{
  unint64_t result;

  result = qword_256E08808;
  if (!qword_256E08808)
  {
    result = MEMORY[0x242667160](&unk_23F281654, &type metadata for MessagePayload.RequestPrescribedPlan.TextToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08808);
  }
  return result;
}

unint64_t sub_23F24DB50()
{
  unint64_t result;

  result = qword_256E08810;
  if (!qword_256E08810)
  {
    result = MEMORY[0x242667160](&unk_23F28167C, &type metadata for MessagePayload.RequestPrescribedPlan.TextToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08810);
  }
  return result;
}

unint64_t sub_23F24DB90()
{
  unint64_t result;

  result = qword_256E08818;
  if (!qword_256E08818)
  {
    result = MEMORY[0x242667160](&unk_23F28159C, &type metadata for MessagePayload.RequestPrescribedPlan.ConvertToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08818);
  }
  return result;
}

unint64_t sub_23F24DBD0()
{
  unint64_t result;

  result = qword_256E08820;
  if (!qword_256E08820)
  {
    result = MEMORY[0x242667160](&unk_23F2815C4, &type metadata for MessagePayload.RequestPrescribedPlan.ConvertToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08820);
  }
  return result;
}

unint64_t sub_23F24DC10()
{
  unint64_t result;

  result = qword_256E08828;
  if (!qword_256E08828)
  {
    result = MEMORY[0x242667160](&unk_23F2814E4, &type metadata for MessagePayload.RequestPrescribedPlan.DisplayToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08828);
  }
  return result;
}

unint64_t sub_23F24DC50()
{
  unint64_t result;

  result = qword_256E08830;
  if (!qword_256E08830)
  {
    result = MEMORY[0x242667160](&unk_23F28150C, &type metadata for MessagePayload.RequestPrescribedPlan.DisplayToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08830);
  }
  return result;
}

unint64_t sub_23F24DC90()
{
  unint64_t result;

  result = qword_256E08838;
  if (!qword_256E08838)
  {
    result = MEMORY[0x242667160](&unk_23F28142C, &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08838);
  }
  return result;
}

unint64_t sub_23F24DCD0()
{
  unint64_t result;

  result = qword_256E08840;
  if (!qword_256E08840)
  {
    result = MEMORY[0x242667160](&unk_23F281454, &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeToolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08840);
  }
  return result;
}

unint64_t sub_23F24DD10()
{
  unint64_t result;

  result = qword_256E08848;
  if (!qword_256E08848)
  {
    result = MEMORY[0x242667160](&unk_23F28187C, &type metadata for MessagePayload.RequestPrescribedPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08848);
  }
  return result;
}

unint64_t sub_23F24DD50()
{
  unint64_t result;

  result = qword_256E08850;
  if (!qword_256E08850)
  {
    result = MEMORY[0x242667160](&unk_23F2818A4, &type metadata for MessagePayload.RequestPrescribedPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08850);
  }
  return result;
}

unint64_t sub_23F24DD90()
{
  unint64_t result;

  result = qword_256E08858;
  if (!qword_256E08858)
  {
    result = MEMORY[0x242667160](&unk_23F281374, &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08858);
  }
  return result;
}

unint64_t sub_23F24DDD0()
{
  unint64_t result;

  result = qword_256E08860;
  if (!qword_256E08860)
  {
    result = MEMORY[0x242667160](&unk_23F28139C, &type metadata for MessagePayload.RequestPrescribedPlan.KnowledgeTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08860);
  }
  return result;
}

unint64_t sub_23F24DE10()
{
  unint64_t result;

  result = qword_256E08868;
  if (!qword_256E08868)
  {
    result = MEMORY[0x242667160](&unk_23F2812BC, &type metadata for MessagePayload.RequestPrescribedPlan.DisplayTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08868);
  }
  return result;
}

unint64_t sub_23F24DE50()
{
  unint64_t result;

  result = qword_256E08870;
  if (!qword_256E08870)
  {
    result = MEMORY[0x242667160](&unk_23F2812E4, &type metadata for MessagePayload.RequestPrescribedPlan.DisplayTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08870);
  }
  return result;
}

unint64_t sub_23F24DE90()
{
  unint64_t result;

  result = qword_256E08878;
  if (!qword_256E08878)
  {
    result = MEMORY[0x242667160](&unk_23F281204, &type metadata for MessagePayload.RequestPrescribedPlan.ConvertTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08878);
  }
  return result;
}

unint64_t sub_23F24DED0()
{
  unint64_t result;

  result = qword_256E08880;
  if (!qword_256E08880)
  {
    result = MEMORY[0x242667160](&unk_23F28122C, &type metadata for MessagePayload.RequestPrescribedPlan.ConvertTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08880);
  }
  return result;
}

unint64_t sub_23F24DF10()
{
  unint64_t result;

  result = qword_256E08888;
  if (!qword_256E08888)
  {
    result = MEMORY[0x242667160](&unk_23F28114C, &type metadata for MessagePayload.RequestPrescribedPlan.TextTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08888);
  }
  return result;
}

unint64_t sub_23F24DF50()
{
  unint64_t result;

  result = qword_256E08890;
  if (!qword_256E08890)
  {
    result = MEMORY[0x242667160](&unk_23F281174, &type metadata for MessagePayload.RequestPrescribedPlan.TextTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08890);
  }
  return result;
}

unint64_t sub_23F24DF90()
{
  unint64_t result;

  result = qword_256E08898;
  if (!qword_256E08898)
  {
    result = MEMORY[0x242667160](&unk_23F281094, &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08898);
  }
  return result;
}

unint64_t sub_23F24DFD0()
{
  unint64_t result;

  result = qword_256E088A0;
  if (!qword_256E088A0)
  {
    result = MEMORY[0x242667160](&unk_23F2810BC, &type metadata for MessagePayload.RequestPrescribedPlan.LowConfidenceKnowledgeTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088A0);
  }
  return result;
}

unint64_t sub_23F24E010()
{
  unint64_t result;

  result = qword_256E088A8;
  if (!qword_256E088A8)
  {
    result = MEMORY[0x242667160](&unk_23F280FDC, &type metadata for MessagePayload.RequestPrescribedPlan.SearchTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088A8);
  }
  return result;
}

unint64_t sub_23F24E050()
{
  unint64_t result;

  result = qword_256E088B0;
  if (!qword_256E088B0)
  {
    result = MEMORY[0x242667160](&unk_23F281004, &type metadata for MessagePayload.RequestPrescribedPlan.SearchTool.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088B0);
  }
  return result;
}

unint64_t sub_23F24E090()
{
  unint64_t result;

  result = qword_256E088B8;
  if (!qword_256E088B8)
  {
    result = MEMORY[0x242667160](&unk_23F280E6C, &type metadata for MessagePayload.RequestContent.StopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088B8);
  }
  return result;
}

unint64_t sub_23F24E0D0()
{
  unint64_t result;

  result = qword_256E088C0;
  if (!qword_256E088C0)
  {
    result = MEMORY[0x242667160](&unk_23F280E94, &type metadata for MessagePayload.RequestContent.StopCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088C0);
  }
  return result;
}

unint64_t sub_23F24E110()
{
  unint64_t result;

  result = qword_256E088C8;
  if (!qword_256E088C8)
  {
    result = MEMORY[0x242667160](&unk_23F280DB4, &type metadata for MessagePayload.RequestContent.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088C8);
  }
  return result;
}

unint64_t sub_23F24E150()
{
  unint64_t result;

  result = qword_256E088D0;
  if (!qword_256E088D0)
  {
    result = MEMORY[0x242667160](&unk_23F280DDC, &type metadata for MessagePayload.RequestContent.TextCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088D0);
  }
  return result;
}

unint64_t sub_23F24E190()
{
  unint64_t result;

  result = qword_256E088D8;
  if (!qword_256E088D8)
  {
    result = MEMORY[0x242667160](&unk_23F280CFC, &type metadata for MessagePayload.RequestContent.SpeechCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088D8);
  }
  return result;
}

unint64_t sub_23F24E1D0()
{
  unint64_t result;

  result = qword_256E088E0;
  if (!qword_256E088E0)
  {
    result = MEMORY[0x242667160](&unk_23F280D24, &type metadata for MessagePayload.RequestContent.SpeechCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088E0);
  }
  return result;
}

unint64_t sub_23F24E210()
{
  unint64_t result;

  result = qword_256E088E8;
  if (!qword_256E088E8)
  {
    result = MEMORY[0x242667160](&unk_23F280C44, &type metadata for MessagePayload.RequestContent.PromptResolutionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088E8);
  }
  return result;
}

unint64_t sub_23F24E250()
{
  unint64_t result;

  result = qword_256E088F0;
  if (!qword_256E088F0)
  {
    result = MEMORY[0x242667160](&unk_23F280C6C, &type metadata for MessagePayload.RequestContent.PromptResolutionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088F0);
  }
  return result;
}

unint64_t sub_23F24E290()
{
  unint64_t result;

  result = qword_256E088F8;
  if (!qword_256E088F8)
  {
    result = MEMORY[0x242667160](&unk_23F280F24, &type metadata for MessagePayload.RequestContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E088F8);
  }
  return result;
}

unint64_t sub_23F24E2D0()
{
  unint64_t result;

  result = qword_256E08900;
  if (!qword_256E08900)
  {
    result = MEMORY[0x242667160](&unk_23F280F4C, &type metadata for MessagePayload.RequestContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08900);
  }
  return result;
}

unint64_t sub_23F24E310()
{
  unint64_t result;

  result = qword_256E08908;
  if (!qword_256E08908)
  {
    result = MEMORY[0x242667160](&unk_23F280B8C, &type metadata for MessagePayload.RequestContent.SpeechContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08908);
  }
  return result;
}

unint64_t sub_23F24E350()
{
  unint64_t result;

  result = qword_256E08910;
  if (!qword_256E08910)
  {
    result = MEMORY[0x242667160](&unk_23F280BB4, &type metadata for MessagePayload.RequestContent.SpeechContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08910);
  }
  return result;
}

unint64_t sub_23F24E390()
{
  unint64_t result;

  result = qword_256E08918;
  if (!qword_256E08918)
  {
    result = MEMORY[0x242667160](&unk_23F280AD4, &type metadata for MessagePayload.RequestContent.SpeechContent.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08918);
  }
  return result;
}

unint64_t sub_23F24E3D0()
{
  unint64_t result;

  result = qword_256E08920;
  if (!qword_256E08920)
  {
    result = MEMORY[0x242667160](&unk_23F280AFC, &type metadata for MessagePayload.RequestContent.SpeechContent.Candidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08920);
  }
  return result;
}

unint64_t sub_23F24E410()
{
  unint64_t result;

  result = qword_256E08928;
  if (!qword_256E08928)
  {
    result = MEMORY[0x242667160](&unk_23F280A1C, &type metadata for MessagePayload.RequestContent.TextContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08928);
  }
  return result;
}

unint64_t sub_23F24E450()
{
  unint64_t result;

  result = qword_256E08930;
  if (!qword_256E08930)
  {
    result = MEMORY[0x242667160](&unk_23F280A44, &type metadata for MessagePayload.RequestContent.TextContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08930);
  }
  return result;
}

unint64_t sub_23F24E490()
{
  unint64_t result;

  result = qword_256E08938;
  if (!qword_256E08938)
  {
    result = MEMORY[0x242667160](&unk_23F2809CC, &type metadata for MessagePayload.RequestContent.StopContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08938);
  }
  return result;
}

unint64_t sub_23F24E4D0()
{
  unint64_t result;

  result = qword_256E08940;
  if (!qword_256E08940)
  {
    result = MEMORY[0x242667160](&unk_23F2809F4, &type metadata for MessagePayload.RequestContent.StopContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08940);
  }
  return result;
}

unint64_t sub_23F24E510()
{
  unint64_t result;

  result = qword_256E08948;
  if (!qword_256E08948)
  {
    result = MEMORY[0x242667160](&unk_23F280914, &type metadata for MessagePayload.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08948);
  }
  return result;
}

unint64_t sub_23F24E550()
{
  unint64_t result;

  result = qword_256E08950;
  if (!qword_256E08950)
  {
    result = MEMORY[0x242667160](&unk_23F28093C, &type metadata for MessagePayload.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08950);
  }
  return result;
}

unint64_t sub_23F24E590()
{
  unint64_t result;

  result = qword_256E08958;
  if (!qword_256E08958)
  {
    result = MEMORY[0x242667160](&unk_23F28085C, &type metadata for MessagePayload.PlannerReturnedRawPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08958);
  }
  return result;
}

unint64_t sub_23F24E5D0()
{
  unint64_t result;

  result = qword_256E08960;
  if (!qword_256E08960)
  {
    result = MEMORY[0x242667160](&unk_23F280884, &type metadata for MessagePayload.PlannerReturnedRawPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08960);
  }
  return result;
}

unint64_t sub_23F24E610()
{
  unint64_t result;

  result = qword_256E08968;
  if (!qword_256E08968)
  {
    result = MEMORY[0x242667160](&unk_23F2807A4, &type metadata for MessagePayload.SessionError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08968);
  }
  return result;
}

unint64_t sub_23F24E650()
{
  unint64_t result;

  result = qword_256E08970;
  if (!qword_256E08970)
  {
    result = MEMORY[0x242667160](&unk_23F2807CC, &type metadata for MessagePayload.SessionError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08970);
  }
  return result;
}

unint64_t sub_23F24E690()
{
  unint64_t result;

  result = qword_256E08978;
  if (!qword_256E08978)
  {
    result = MEMORY[0x242667160](&unk_23F2806EC, &type metadata for MessagePayload.StepExecutedWithReturnedValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08978);
  }
  return result;
}

unint64_t sub_23F24E6D0()
{
  unint64_t result;

  result = qword_256E08980;
  if (!qword_256E08980)
  {
    result = MEMORY[0x242667160](&unk_23F280714, &type metadata for MessagePayload.StepExecutedWithReturnedValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08980);
  }
  return result;
}

unint64_t sub_23F24E710()
{
  unint64_t result;

  result = qword_256E08988;
  if (!qword_256E08988)
  {
    result = MEMORY[0x242667160](&unk_23F28069C, &type metadata for MessagePayload.SessionSuspended.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08988);
  }
  return result;
}

unint64_t sub_23F24E750()
{
  unint64_t result;

  result = qword_256E08990;
  if (!qword_256E08990)
  {
    result = MEMORY[0x242667160](&unk_23F2806C4, &type metadata for MessagePayload.SessionSuspended.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08990);
  }
  return result;
}

unint64_t sub_23F24E790()
{
  unint64_t result;

  result = qword_256E08998;
  if (!qword_256E08998)
  {
    result = MEMORY[0x242667160](&unk_23F28064C, &type metadata for MessagePayload.EndOfPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E08998);
  }
  return result;
}

unint64_t sub_23F24E7D0()
{
  unint64_t result;

  result = qword_256E089A0;
  if (!qword_256E089A0)
  {
    result = MEMORY[0x242667160](&unk_23F280674, &type metadata for MessagePayload.EndOfPlan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E089A0);
  }
  return result;
}

unint64_t sub_23F24E810()
{
  unint64_t result;

  result = qword_256E089A8;
  if (!qword_256E089A8)
  {
    result = MEMORY[0x242667160](&unk_23F2805FC, &type metadata for MessagePayload.Terminate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E089A8);
  }
  return result;
}

unint64_t sub_23F24E850()
{
  unint64_t result;

  result = qword_256E089B0;
  if (!qword_256E089B0)
  {
    result = MEMORY[0x242667160](&unk_23F280624, &type metadata for MessagePayload.Terminate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E089B0);
  }
  return result;
}

unint64_t sub_23F24E890()
{
  unint64_t result;

  result = qword_256E089B8;
  if (!qword_256E089B8)
  {
    result = MEMORY[0x242667160](&unk_23F280544, &type metadata for SessionServerMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E089B8);
  }
  return result;
}

unint64_t sub_23F24E8D0()
{
  unint64_t result;

  result = qword_256E089C0;
  if (!qword_256E089C0)
  {
    result = MEMORY[0x242667160](&unk_23F28056C, &type metadata for SessionServerMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E089C0);
  }
  return result;
}

unint64_t sub_23F24E910()
{
  unint64_t result;

  result = qword_256E089C8;
  if (!qword_256E089C8)
  {
    result = MEMORY[0x242667160](&unk_23F28048C, &type metadata for SessionClientMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E089C8);
  }
  return result;
}

unint64_t sub_23F24E950()
{
  unint64_t result;

  result = qword_256E089D0;
  if (!qword_256E089D0)
  {
    result = MEMORY[0x242667160](&unk_23F2804B4, &type metadata for SessionClientMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E089D0);
  }
  return result;
}

unint64_t sub_23F24E98C()
{
  unint64_t result;

  result = qword_256E089D8;
  if (!qword_256E089D8)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ParameterNotAllowed.Reason, &type metadata for ParameterNotAllowed.Reason);
    atomic_store(result, (unint64_t *)&qword_256E089D8);
  }
  return result;
}

uint64_t sub_23F24EC20()
{
  return sub_23F26863C();
}

uint64_t sub_23F24EC44()
{
  return sub_23F26863C();
}

uint64_t sub_23F24EC60()
{
  return sub_23F26863C();
}

uint64_t sub_23F24EC74@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_23F24EC80()
{
  return sub_23F26863C();
}

uint64_t sub_23F24EC94()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v1 - 200) + 8))(*(_QWORD *)(v1 - 176), v0);
}

uint64_t sub_23F24ECA8()
{
  return sub_23F2686B4();
}

uint64_t sub_23F24ECC0()
{
  return sub_23F2686B4();
}

uint64_t sub_23F24ECCC()
{
  return sub_23F268588();
}

uint64_t sub_23F24ECE8()
{
  return sub_23F26863C();
}

void sub_23F24ED00(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE0F4(a1, *(_QWORD *)(a2 - 256), v2);
}

uint64_t sub_23F24ED10()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 304);
}

void sub_23F24ED20(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

_QWORD *sub_23F24ED3C(_QWORD *a1)
{
  uint64_t v1;

  return sub_23F12545C(a1, v1);
}

uint64_t sub_23F24ED54()
{
  return sub_23F2686E4();
}

void sub_23F24ED68(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_23F1BE0F4(a1, v2, v1);
}

uint64_t sub_23F24ED74(uint64_t a1, unint64_t a2)
{
  return sub_23F1F52C4(a1, a2);
}

void sub_23F24ED84(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23F24EDA0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F24EDA8()
{
  return sub_23F268750();
}

uint64_t sub_23F24EDB8()
{
  return sub_23F2686B4();
}

uint64_t sub_23F24EDD0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F24EDE0()
{
  return sub_23F26863C();
}

uint64_t sub_23F24EDE8()
{
  return sub_23F268750();
}

uint64_t sub_23F24EE08()
{
  return sub_23F268750();
}

uint64_t sub_23F24EE10()
{
  return sub_23F2686E4();
}

void sub_23F24EE1C(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X2>, uint64_t a3@<X8>)
{
  sub_23F1BE1A0(a1, *(_QWORD *)(a3 - 256), a2);
}

uint64_t sub_23F24EE28()
{
  return sub_23F26863C();
}

_QWORD *sub_23F24EE44(_QWORD *a1)
{
  uint64_t v1;

  return sub_23F12545C(a1, v1);
}

void sub_23F24EE5C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE0F4(a1, a2, v2);
}

void sub_23F24EE64(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE0F4(a1, *(_QWORD *)(a2 - 256), v2);
}

void sub_23F24EE74(uint64_t a1)
{
  sub_23F12E488(a1);
}

uint64_t sub_23F24EE7C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24EE8C()
{
  uint64_t v0;

  _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F24EEA4()
{
  return sub_23F268888();
}

uint64_t sub_23F24EEAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_23F24EEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

void sub_23F24EEC8(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23F24EEE4()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23F135C9C(v5, v4, v0);
  sub_23F135C9C(v3, v2, v1);
  sub_23F137230(v3, v2, v1);
  return sub_23F137230(v5, v4, v0);
}

void sub_23F24EF2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F24EF34()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 0;
  return sub_23F268684();
}

uint64_t sub_23F24EF4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t sub_23F24EF64()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F24EF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, a2, v2);
}

uint64_t sub_23F24EF80()
{
  return sub_23F2686B4();
}

__n128 sub_23F24EFA4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __n128 result;

  v7 = v4[6];
  v8 = *((_BYTE *)v4 + 24);
  v9 = v4[2];
  v10 = *v4;
  v11 = *v1;
  v12 = v1[1];
  v13 = v1[2];
  v14 = *((_BYTE *)v1 + 24);
  v15 = v1[4];
  v16 = v1[7];
  *(_QWORD *)(v6 - 152) = v10;
  *(_QWORD *)(v6 - 144) = v3;
  *(_QWORD *)(v6 - 136) = v9;
  *(_BYTE *)(v6 - 128) = v8;
  *(_QWORD *)(v6 - 120) = v5;
  *(_QWORD *)(v6 - 112) = v2;
  *(_QWORD *)(v6 - 104) = v7;
  *(_QWORD *)(v6 - 96) = v0;
  *(_QWORD *)(v6 - 216) = v11;
  *(_QWORD *)(v6 - 208) = v12;
  *(_QWORD *)(v6 - 200) = v13;
  *(_BYTE *)(v6 - 192) = v14;
  *(_QWORD *)(v6 - 184) = v15;
  v17 = *(_OWORD *)(v1 + 5);
  *(_OWORD *)(v6 - 240) = v17;
  *(_OWORD *)(v6 - 176) = v17;
  *(_QWORD *)(v6 - 160) = v16;
  static ParameterDisambiguation.== infix(_:_:)();
  return result;
}

uint64_t sub_23F24F008()
{
  return sub_23F2686E4();
}

uint64_t sub_23F24F014()
{
  return sub_23F26863C();
}

uint64_t sub_23F24F030()
{
  return sub_23F26863C();
}

void sub_23F24F044(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_23F24F060()
{
  return 0;
}

uint64_t sub_23F24F07C()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F1F5578(v1, v0);
}

uint64_t sub_23F24F08C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

void sub_23F24F0B8(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE1A0(a1, a2, v2);
}

uint64_t sub_23F24F0C0()
{
  return sub_23F2686E4();
}

void sub_23F24F0CC(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23F1BE0BC(a1, v1);
}

uint64_t sub_23F24F0D4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24F0E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for ActionSuccess(0) + 20);
  v2 = type metadata accessor for ActionSuccess.UndoContext(0);
  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v1, 1, v2);
}

uint64_t sub_23F24F11C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24F128()
{
  return sub_23F2686F0();
}

uint64_t sub_23F24F138()
{
  return sub_23F2686B4();
}

uint64_t sub_23F24F164()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23F24F16C()
{
  return sub_23F268684();
}

void sub_23F24F178(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X2>, uint64_t a3@<X8>)
{
  sub_23F1BE1A0(a1, *(_QWORD *)(a3 - 256), a2);
}

uint64_t sub_23F24F184()
{
  return sub_23F26863C();
}

uint64_t sub_23F24F18C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_23F268720();
}

void sub_23F24F1B8(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23F1BE0BC(a1, v1);
}

uint64_t sub_23F24F1C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

_QWORD *sub_23F24F1D8(_QWORD *a1)
{
  uint64_t v1;

  return sub_23F12545C(a1, v1);
}

uint64_t sub_23F24F1F0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24F200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v0 + *(int *)(v2 + 24)) = *(_BYTE *)(v1 + *(int *)(v2 + 24));
  return v0;
}

void sub_23F24F21C(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 224) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

_QWORD *sub_23F24F270(_QWORD *a1)
{
  uint64_t v1;

  return sub_23F12545C(a1, v1);
}

uint64_t sub_23F24F288()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24F294()
{
  uint64_t v0;

  return v0;
}

void *sub_23F24F2AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v1 + 24) = v2;
  return malloc(*(_QWORD *)(v2 + 64));
}

uint64_t sub_23F24F2C8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

uint64_t sub_23F24F2D0()
{
  return sub_23F26863C();
}

void sub_23F24F2EC(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X2>, uint64_t a3@<X8>)
{
  sub_23F1BE0F4(a1, *(_QWORD *)(a3 - 256), a2);
}

uint64_t sub_23F24F2F8()
{
  return sub_23F26863C();
}

uint64_t sub_23F24F308()
{
  return sub_23F268720();
}

void sub_23F24F318(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23F1BE0BC(v2, a2);
}

uint64_t sub_23F24F320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  sub_23F135CB4(v2, v3, v4);
  *(_QWORD *)v0 = v2;
  *(_QWORD *)(v0 + 8) = v3;
  *(_BYTE *)(v0 + 16) = v4;
  return v0;
}

uint64_t sub_23F24F368()
{
  return 1;
}

uint64_t sub_23F24F398()
{
  return _s16IntelligenceFlow14MessagePayloadO17ActionWillExecuteV18ToolParameterValueO0J0V2eeoiySbAI_AItFZ_0();
}

uint64_t sub_23F24F3AC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24F3C4()
{
  return sub_23F26863C();
}

uint64_t sub_23F24F3E8(uint64_t (*a1)(_QWORD))
{
  return a1(0);
}

uint64_t sub_23F24F3FC()
{
  return sub_23F26863C();
}

uint64_t sub_23F24F414()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 - 144);
  v2 = *(_BYTE *)(v0 - 136);
  v3 = *(_QWORD *)(v0 - 128);
  v4 = *(_QWORD *)(v0 - 104);
  v5 = *(_QWORD *)(v0 - 520);
  *(_OWORD *)v5 = *(_OWORD *)(v0 - 160);
  *(_QWORD *)(v5 + 16) = v1;
  *(_BYTE *)(v5 + 24) = v2;
  *(_QWORD *)(v5 + 32) = v3;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)(v0 - 120);
  *(_QWORD *)(v5 + 56) = v4;
  return v5;
}

uint64_t sub_23F24F45C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + a1) = *(_BYTE *)(v2 + a1);
  return v1;
}

uint64_t sub_23F24F474()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v1 - 104) + 32))(v0, *(_QWORD *)(v1 - 88), *(_QWORD *)(v1 - 72));
}

uint64_t sub_23F24F49C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F1F52C4(v1, v0);
}

uint64_t sub_23F24F4B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 8))(v1, *(_QWORD *)(v2 - 144));
}

uint64_t sub_23F24F4C4()
{
  return sub_23F268888();
}

uint64_t sub_23F24F4DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t sub_23F24F4EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v0, v2);
}

uint64_t sub_23F24F4FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

void sub_23F24F514(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  *(_QWORD *)(v3 + 40) = a1;
  sub_23F1752C4(v2, v1, v4);
}

uint64_t sub_23F24F52C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F24F538()
{
  return sub_23F26863C();
}

uint64_t sub_23F24F558()
{
  return sub_23F2688A0();
}

uint64_t sub_23F24F564()
{
  return sub_23F268888();
}

uint64_t sub_23F24F570()
{
  uint64_t v0;

  return v0;
}

void *sub_23F24F57C(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xBAuLL);
}

void sub_23F24F584(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F24F58C@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, *(_QWORD *)(v2 - 144));
}

void sub_23F24F598(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_23F24F5B4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_23F24F5EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23F125E40(v2, a2);
}

uint64_t sub_23F24F5F4(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F24F614()
{
  return sub_23F268750();
}

uint64_t sub_23F24F620()
{
  return sub_23F268750();
}

uint64_t sub_23F24F628()
{
  return swift_bridgeObjectRelease();
}

void sub_23F24F630(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v1, 1, 1, a1);
  v2 = type metadata accessor for ActionResponse(0);
  v3 = (_QWORD *)(v1 + *(int *)(v2 + 20));
  *v3 = 0;
  v3[1] = 0;
  bzero((void *)(v1 + *(int *)(v2 + 32)), 0xB8uLL);
}

uint64_t sub_23F24F678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_23F24F680()
{
  return 1;
}

uint64_t sub_23F24F690(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  return a2(0);
}

void *sub_23F24F698()
{
  void *v0;
  uint64_t v1;
  const void *v2;

  return memcpy(v0, v2, *(_QWORD *)(*(_QWORD *)(v1 - 8) + 64));
}

uint64_t sub_23F24F6AC()
{
  return _s16IntelligenceFlow14MessagePayloadO17ActionWillExecuteV18ToolParameterValueO0J0V2eeoiySbAI_AItFZ_0();
}

uint64_t sub_23F24F6B8()
{
  return swift_initStructMetadata();
}

uint64_t sub_23F24F6CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 152) = v1;
  *(_QWORD *)(v4 - 144) = v0;
  *(_QWORD *)(v4 - 136) = v2;
  *(_QWORD *)(v4 - 88) = v3;
  return sub_23F2686D8();
}

uint64_t sub_23F24F6E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v0, v2);
}

uint64_t sub_23F24F6FC()
{
  return sub_23F26863C();
}

uint64_t sub_23F24F710@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 - 104), *(_QWORD *)(v1 - 120));
}

void sub_23F24F738()
{
  uint64_t v0;
  uint64_t *v1;
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

  v7 = *v1;
  v8 = v1[1];
  v9 = v1[2];
  v10 = v1[3];
  v11 = v1[4];
  *(_QWORD *)(v6 - 240) = v11;
  *(_QWORD *)(v6 - 152) = v5;
  *(_QWORD *)(v6 - 144) = v4;
  *(_QWORD *)(v6 - 136) = v3;
  *(_QWORD *)(v6 - 128) = v2;
  *(_QWORD *)(v6 - 120) = v0;
  *(_QWORD *)(v6 - 216) = v7;
  *(_QWORD *)(v6 - 208) = v8;
  *(_QWORD *)(v6 - 200) = v9;
  *(_QWORD *)(v6 - 192) = v10;
  *(_QWORD *)(v6 - 184) = v11;
  static ActionFailure.Failure.== infix(_:_:)();
}

uint64_t sub_23F24F76C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 8))(*(_QWORD *)(v1 - 136), *(_QWORD *)(v1 - 112));
}

uint64_t sub_23F24F77C()
{
  return sub_23F268138();
}

uint64_t sub_23F24F790()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F24F7A0()
{
  return sub_23F2686E4();
}

void sub_23F24F7B4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F1752C4(a1, a2, v2);
}

uint64_t sub_23F24F7BC()
{
  return sub_23F2681BC();
}

uint64_t sub_23F24F7C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 544) = v3;
  *(_QWORD *)(v5 - 560) = v0;
  *(_QWORD *)(v5 - 552) = v1;
  *(_QWORD *)(v5 - 536) = v2;
  *(_QWORD *)(v5 - 72) = v4;
  return sub_23F2686D8();
}

uint64_t sub_23F24F7FC()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F13725C(v0, v1, 2);
}

uint64_t sub_23F24F80C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  sub_23F137248(v0, v5, v3);
  return sub_23F137248(v1, v4, v2);
}

void sub_23F24F834(uint64_t a1)
{
  sub_23F1FA0D8(a1);
}

uint64_t sub_23F24F83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  return a4(0);
}

uint64_t sub_23F24F84C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23F24F854@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)a1;
}

uint64_t sub_23F24F864()
{
  return sub_23F2688A0();
}

uint64_t sub_23F24F86C()
{
  return sub_23F268888();
}

uint64_t sub_23F24F884(uint64_t a1)
{
  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(a1);
}

uint64_t sub_23F24F89C()
{
  return sub_23F2686F0();
}

uint64_t sub_23F24F8A4(uint64_t a1)
{
  uint64_t v1;

  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(a1, 1, 1, v1);
  return type metadata accessor for SystemPromptResolution(0);
}

void sub_23F24F8D0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F1752C4(a1, a2, v2);
}

void sub_23F24F8D8()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 - 136);
  *(_QWORD *)(v1 - 112) = *(_QWORD *)(v1 - 144);
  *(_QWORD *)(v1 - 104) = v2;
  *(_BYTE *)(v1 - 96) = v0;
}

uint64_t sub_23F24F900@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 112));
}

uint64_t sub_23F24F908()
{
  return sub_23F268678();
}

uint64_t sub_23F24F958()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F24F96C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)v0 = *(_QWORD *)v1;
  *(_QWORD *)(v0 + 8) = v2;
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v1 + 16);
  *(_BYTE *)(v0 + 24) = *(_BYTE *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v0 + 40) = v3;
  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v0 + 56) = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F24F998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = *(int *)(v1 + 20);
  v4 = (_QWORD *)(v0 + v3);
  v5 = (_QWORD *)(v2 + v3);
  v6 = v5[1];
  *v4 = *v5;
  v4[1] = v6;
  v7 = *(int *)(v1 + 24);
  v8 = (_QWORD *)(v0 + v7);
  v9 = (_QWORD *)(v2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F24F9C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v3 = *(int *)(v2 + 28);
  v4 = (_QWORD *)(v0 + v3);
  v5 = (_QWORD *)(v1 + v3);
  v6 = v5[1];
  *v4 = *v5;
  v4[1] = v6;
  v7 = *(int *)(v2 + 32);
  v8 = (_QWORD *)(v0 + v7);
  v9 = (_QWORD *)(v1 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F24F9F0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 120));
}

uint64_t sub_23F24FA10()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24FA1C()
{
  return sub_23F2686E4();
}

uint64_t sub_23F24FA28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, a2, v2);
}

uint64_t sub_23F24FA40()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F1F91AC(v0, v1);
}

void sub_23F24FA58(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);
  uint64_t v3;

  sub_23F1BE1A0(*(_QWORD *)(v3 - 248), (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
}

uint64_t sub_23F24FA84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_OWORD *)(v0 + *(int *)(v2 + 20)) = *(_OWORD *)(v1 + *(int *)(v2 + 20));
  *(_OWORD *)(v0 + *(int *)(v2 + 24)) = *(_OWORD *)(v1 + *(int *)(v2 + 24));
  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v0, 0, 1, v2);
}

uint64_t sub_23F24FAB0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24FABC()
{
  return swift_getEnumCaseMultiPayload();
}

void *sub_23F24FAD4(uint64_t a1)
{
  return malloc(*(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

uint64_t sub_23F24FAE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t sub_23F24FAF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for ActionSuccess(0) + 20);
  v2 = type metadata accessor for ActionSuccess.UndoContext(0);
  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v1, 1, v2);
}

uint64_t sub_23F24FB34()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t sub_23F24FB3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 - 144);
  v2 = *(_QWORD *)(v0 - 560);
  *(_OWORD *)v2 = *(_OWORD *)(v0 - 160);
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(v0 - 136);
  return v2;
}

uint64_t sub_23F24FB7C()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0);
}

void *sub_23F24FBA0()
{
  return malloc(0x30uLL);
}

uint64_t sub_23F24FBB0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F24FBC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_23F24FBD0()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_23F24FBE0()
{
  return sub_23F268684();
}

unint64_t sub_23F24FBE8@<X0>(uint64_t a1@<X8>)
{
  return (a1 - 32) | 0x8000000000000000;
}

uint64_t sub_23F24FC04()
{
  return sub_23F2688A0();
}

_QWORD *sub_23F24FC14(_QWORD *a1)
{
  uint64_t v1;

  return sub_23F12545C(a1, v1);
}

void sub_23F24FC2C(uint64_t a1)
{
  uint64_t *v1;

  sub_23F125E40(a1, v1);
}

uint64_t sub_23F24FC34()
{
  return 1;
}

uint64_t sub_23F24FC54(uint64_t a1, unint64_t a2)
{
  return sub_23F1F52C4(a1, a2);
}

void sub_23F24FC80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v0[2];
  *(_QWORD *)(v1 - 112) = v0[3];
  *(_QWORD *)(v1 - 104) = v2;
  *(_QWORD *)(v1 - 120) = v0[4];
}

uint64_t sub_23F24FCB0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F1F55A0(v1, v0);
}

uint64_t sub_23F24FCC0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  return sub_23F137248(v2, v1, v0);
}

void sub_23F24FCD0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 64) = 0;
  *(_QWORD *)(v0 - 56) = 0xE000000000000000;
}

uint64_t sub_23F24FCE0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F1F5578(v0, v1);
}

uint64_t sub_23F24FCF0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F1F55A0(v0, v1);
}

uint64_t sub_23F24FD00(uint64_t a1)
{
  uint64_t v1;

  return v1 + *(int *)(a1 + 20);
}

unint64_t sub_23F24FD10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 152) = *(_QWORD *)(v5 - 72);
  *(_QWORD *)(v5 - 144) = v3;
  *(_QWORD *)(v5 - 72) = v3;
  *(_QWORD *)(v5 - 136) = *(_QWORD *)(v5 - 192);
  *(_BYTE *)(v5 - 128) = *(_DWORD *)(v5 - 200);
  *(_QWORD *)(v5 - 120) = v4;
  *(_QWORD *)(v5 - 112) = v2;
  *(_QWORD *)(v5 - 104) = v0;
  *(_QWORD *)(v5 - 96) = v1;
  return sub_23F1F74E0();
}

uint64_t sub_23F24FD38()
{
  return sub_23F268654();
}

uint64_t sub_23F24FD4C()
{
  uint64_t *v0;

  return sub_23F1F6000(*v0, v0[1], v0[2], v0[3], v0[4], v0[5], v0[6]);
}

__n128 sub_23F24FD60@<Q0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  v4 = v2 + v1;
  *(_DWORD *)v4 = a1;
  result = *(__n128 *)(v3 - 96);
  *(__n128 *)(v4 + 8) = result;
  return result;
}

double sub_23F24FD74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
  double result;
  _QWORD *v5;

  *(_WORD *)(v2 + 184) = 514;
  v3 = (_OWORD *)(v0 + *(int *)(v1 + 36));
  result = 0.0;
  v3[2] = 0u;
  v3[3] = 0u;
  *v3 = 0u;
  v3[1] = 0u;
  v5 = (_QWORD *)(v0 + *(int *)(v1 + 40));
  *v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t sub_23F24FDA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v1, v2, v3);
}

uint64_t sub_23F24FDB4()
{
  return sub_23F2688A0();
}

uint64_t sub_23F24FDBC@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 - 112), *(_QWORD *)(v1 - 136));
}

uint64_t sub_23F24FDC8()
{
  return sub_23F2686B4();
}

uint64_t sub_23F24FDD0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F1311B4(v0, v1);
}

uint64_t sub_23F24FDDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return sub_23F137288(v6, v5, v4, v3, v2, v1, v0);
}

void sub_23F24FE00()
{
  char v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v5 = *v1;
  v6 = v1[1];
  v7 = *((_BYTE *)v1 + 16);
  *(_QWORD *)(v4 - 152) = v3;
  *(_QWORD *)(v4 - 144) = v2;
  *(_BYTE *)(v4 - 136) = v0;
  *(_QWORD *)(v4 - 216) = v5;
  *(_QWORD *)(v4 - 208) = v6;
  *(_BYTE *)(v4 - 200) = v7;
  static ActionRequirement.== infix(_:_:)(v4 - 152);
}

uint64_t sub_23F24FE24()
{
  _QWORD *v0;
  uint64_t (*v1)(void);

  sub_23F12545C(v0, v0[3]);
  return v1();
}

uint64_t sub_23F24FE44()
{
  return sub_23F268720();
}

void sub_23F24FE50(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F17537C(a1, a2, v2);
}

void sub_23F24FE58()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = *(_QWORD *)v0;
  *(_QWORD *)(v1 - 192) = *(_QWORD *)(v0 + 16);
  *(_DWORD *)(v1 - 200) = *(unsigned __int8 *)(v0 + 24);
  *(_BYTE *)(v1 - 152) = 5;
}

void sub_23F24FE84(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_23F1BE0F4(v3, *(_QWORD *)(v4 - 96), a3);
}

void sub_23F24FE90(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F24FE98()
{
  uint64_t v0;
  uint64_t v1;

  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v0, 0, 1, v1);
}

void sub_23F24FEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;

  sub_23F1BE0BC(v4, a4);
}

void *sub_23F24FEC0(uint64_t a1)
{
  void *v1;
  const void *v2;

  return memcpy(v1, v2, *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

uint64_t sub_23F24FEE0()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(v1 + 20);
}

uint64_t sub_23F24FEF4()
{
  return 0;
}

uint64_t sub_23F24FF00()
{
  return 0;
}

uint64_t sub_23F24FF14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 - 144);
  v2 = *(_QWORD *)(v0 - 552);
  *(_OWORD *)v2 = *(_OWORD *)(v0 - 160);
  *(_QWORD *)(v2 + 16) = v1;
  return v2;
}

_QWORD *sub_23F24FF3C(_QWORD *a1)
{
  uint64_t v1;

  return sub_23F12545C(a1, v1);
}

uint64_t sub_23F24FF64()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F24FF6C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 - 128);
  v2 = *(_OWORD *)(v0 - 144);
  v3 = *(_QWORD *)(v0 - 512);
  *(_OWORD *)v3 = *(_OWORD *)(v0 - 160);
  *(_OWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 32) = v1;
  return v3;
}

uint64_t sub_23F24FF9C()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  v0[1] = v1[1];
  return 0;
}

uint64_t sub_23F24FFB4()
{
  return sub_23F268888();
}

uint64_t sub_23F24FFBC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = *(_QWORD *)(v0 + 16);
  sub_23F12545C(v1, v1[3]);
  return (*(uint64_t (**)(void))(v2 - 112))();
}

uint64_t sub_23F24FFEC()
{
  return sub_23F26863C();
}

__n128 sub_23F24FFF4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 result;

  v3 = v1 + a1;
  *(_DWORD *)(v2 - 88) = *(_DWORD *)v3;
  result = *(__n128 *)(v3 + 8);
  *(__n128 *)(v2 - 80) = result;
  return result;
}

uint64_t sub_23F250034@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = v2 + a1;
  v5 = *(_QWORD *)(v3 + 8);
  result = *(_QWORD *)(v3 + 16);
  *(_DWORD *)v1 = *(_DWORD *)v3;
  *(_QWORD *)(v1 + 8) = v5;
  *(_QWORD *)(v1 + 16) = result;
  return result;
}

void sub_23F25004C(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;

  *(_QWORD *)(v2 + a1 + 8) = (v1 - 1);
}

uint64_t sub_23F25005C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (uint64_t *)(v2 + a1);
  result = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9 = v3[5];
  v10 = v3[6];
  v11 = v3[7];
  *v1 = *v3;
  v1[1] = v5;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v8;
  v1[5] = v9;
  v1[6] = v10;
  v1[7] = v11;
  return result;
}

uint64_t sub_23F250084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_OWORD *)(v0 + *(int *)(v2 + 28)) = *(_OWORD *)(v1 + *(int *)(v2 + 28));
  *(_OWORD *)(v0 + *(int *)(v2 + 32)) = *(_OWORD *)(v1 + *(int *)(v2 + 32));
  return v0;
}

uint64_t sub_23F2500AC@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_23F2500BC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2500C8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2500D8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2500E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 88) = v0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v0 + 32))(v1, v2, *(_QWORD *)(v3 - 104));
}

uint64_t sub_23F250108()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  v1 = *(_BYTE *)(v0 - 144);
  v2 = *(_QWORD *)(v0 - 528);
  *(_OWORD *)v2 = *(_OWORD *)(v0 - 160);
  *(_BYTE *)(v2 + 16) = v1;
  return v2;
}

void sub_23F250130(void *a1)
{
  free(a1);
}

uint64_t sub_23F250144()
{
  return swift_willThrow();
}

uint64_t sub_23F25014C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 0;
  return sub_23F268720();
}

void *sub_23F25016C()
{
  size_t v0;

  return malloc(v0);
}

uint64_t sub_23F250174()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F250180()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25018C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 568) = v0;
  return 1;
}

uint64_t sub_23F2501B4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2501C4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2501D4()
{
  uint64_t v0;

  return v0;
}

void sub_23F2501E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE0F4(v3, a2, a3);
}

uint64_t sub_23F2501F8()
{
  return type metadata accessor for SystemResponse(0);
}

uint64_t sub_23F250200()
{
  return type metadata accessor for StatementOutcome(0);
}

uint64_t sub_23F250208()
{
  return type metadata accessor for MessagePayload.ClientAction(0);
}

uint64_t sub_23F250210()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F250250()
{
  uint64_t *v0;

  return sub_23F1F55A0(*v0, v0[1]);
}

uint64_t sub_23F25025C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  v3 = v1[3];
  v0[2] = v1[2];
  v0[3] = v3;
  v0[4] = v1[4];
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F250294(uint64_t result, int a2)
{
  *(_QWORD *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23F2502A0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return sub_23F268648();
}

uint64_t sub_23F2502AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 104));
}

uint64_t sub_23F2502BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 128));
}

uint64_t sub_23F2502CC()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(v1 + 20);
}

uint64_t sub_23F2502D8()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F1F52C4(v0, v1);
}

uint64_t sub_23F250318()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t result;

  *v0 = *v1;
  result = v1[1];
  v0[1] = result;
  v0[2] = v1[2];
  v0[3] = v1[3];
  return result;
}

uint64_t sub_23F25033C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *v1 = *v2;
  v1[1] = a1;
  v3 = v2[3];
  v1[2] = v2[2];
  v1[3] = v3;
  v1[4] = v2[4];
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F250358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 104));
}

void sub_23F250368(void *a1)
{
  free(a1);
}

uint64_t sub_23F250378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(a1, a2, a3, a4);
}

uint64_t sub_23F250388()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(*(_QWORD *)(v0 - 104));
}

uint64_t sub_23F250390()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25039C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2503A4()
{
  return sub_23F26863C();
}

uint64_t sub_23F2503C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(a1, a2, 1, v2);
}

uint64_t sub_23F2503CC()
{
  return sub_23F268648();
}

uint64_t sub_23F2503D4()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t sub_23F2503EC()
{
  return sub_23F268138();
}

void sub_23F2503F4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F17537C(a1, a2, v2);
}

uint64_t sub_23F2503FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 8))(v2, *(_QWORD *)(v1 + 72));
}

void sub_23F25040C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 - 216) = v5;
  *(_QWORD *)(v6 - 208) = v4;
  *(_QWORD *)(v6 - 200) = v1;
  *(_QWORD *)(v6 - 192) = v0;
  *(_QWORD *)(v6 - 184) = v3;
  *(_QWORD *)(v6 - 176) = v2;
  v7 = *(_QWORD *)(v6 - 288);
  *(_QWORD *)(v6 - 168) = *(_QWORD *)(v6 - 312);
  *(_QWORD *)(v6 - 160) = v7;
}

void sub_23F250430(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X2>, uint64_t a3@<X8>)
{
  sub_23F1BE1A0(a1, *(_QWORD *)(a3 - 256), a2);
}

uint64_t sub_23F25043C()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 104), *(_QWORD *)(v1 - 96));
}

uint64_t sub_23F250448()
{
  return sub_23F2686E4();
}

uint64_t sub_23F250464(uint64_t a1)
{
  return *(_QWORD *)a1;
}

__n128 sub_23F250478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 *v3;
  unint64_t v4;
  __n128 result;

  v3 = (__n128 *)(v0 + *(int *)(v1 + 24));
  v4 = v3[1].n128_u64[0];
  result = *v3;
  *(__n128 *)(v2 - 96) = *v3;
  *(_QWORD *)(v2 - 80) = v4;
  *(_BYTE *)(v2 - 97) = 2;
  return result;
}

uint64_t sub_23F25049C()
{
  return sub_23F268888();
}

void sub_23F2504A8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 1;
}

uint64_t sub_23F2504B4()
{
  return sub_23F268750();
}

void sub_23F2504D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE0F4(a1, v3, a3);
}

uint64_t sub_23F2504D8()
{
  uint64_t v0;

  return v0;
}

void sub_23F2504E4()
{
  void *v0;

  sub_23F131164(v0);
}

uint64_t sub_23F2504F0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2504FC()
{
  uint64_t v0;

  return v0;
}

void sub_23F250508()
{
  ActionOutcome.asStatementOutcome.getter();
}

uint64_t sub_23F250524()
{
  return type metadata accessor for SystemPromptResolution.UserAction(0);
}

uint64_t sub_23F250540()
{
  return type metadata accessor for MessagePayload.ClientAction.ShimParameterResolution(0);
}

void sub_23F25055C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_23F1752C4(v3, v4, a3);
}

uint64_t sub_23F250568()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F1311B4(v1, v0);
}

uint64_t sub_23F250574()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F250580()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F250588()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F250594()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F2505A0()
{
  return sub_23F2681A4();
}

uint64_t sub_23F2505B0()
{
  uint64_t v0;

  return v0;
}

void sub_23F2505BC()
{
  uint64_t v0;

  sub_23F12E488(v0);
}

void sub_23F2505CC()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_23F129820(v1, v0);
}

uint64_t sub_23F2505D8()
{
  return sub_23F2688A0();
}

uint64_t sub_23F2505F4()
{
  return sub_23F26800C();
}

uint64_t sub_23F2505FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t sub_23F250604()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250614()
{
  return sub_23F268888();
}

uint64_t sub_23F25061C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;

  *(_DWORD *)a2 = v2;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F250628()
{
  uint64_t v0;
  _QWORD *v1;

  *v1 = v0;
  return sub_23F268648();
}

uint64_t sub_23F250640()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = *(_QWORD *)(v1 - 160);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23F250678()
{
  return 0;
}

uint64_t sub_23F25068C()
{
  return 0;
}

uint64_t sub_23F2506AC()
{
  return sub_23F268888();
}

uint64_t sub_23F2506B4()
{
  return sub_23F26863C();
}

void sub_23F2506BC(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + a1);
  *v2 = 0;
  v2[1] = 0;
}

uint64_t sub_23F2506C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_23F2506D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v2;

  v2 = (uint64_t *)(v1 + a1);
  return sub_23F1F6000(*v2, v2[1], v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_23F2506E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(v2 + a1);
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  *v1 = *v3;
  v1[1] = v5;
  v1[2] = v6;
  return sub_23F1F5578(v4, v5);
}

_BYTE *sub_23F250700@<X0>(char a1@<W8>)
{
  uint64_t v1;
  _BYTE *v2;

  v2 = *(_BYTE **)(v1 - 256);
  *v2 = a1;
  return v2;
}

uint64_t sub_23F250714(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;

  result = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v3, 1, 1, a1);
  v5 = (_QWORD *)(v1 + *(int *)(v2 + 24));
  *v5 = 0;
  v5[1] = 0;
  v5[2] = 0;
  return result;
}

uint64_t sub_23F250744()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0);
}

void sub_23F25074C()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 240);
  *(_QWORD *)(v2 - 240) = v0;
  sub_23F1BE1A0(v3, v0, v1);
}

_QWORD *sub_23F250774(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = result;
  *result = v2;
  return result;
}

uint64_t sub_23F250784(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_23F250798()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + *(int *)(v1 + 24));
}

uint64_t sub_23F2507B8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2507D8()
{
  return 0;
}

void sub_23F2507E4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE1A0(a1, a2, v2);
}

uint64_t sub_23F2507EC(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_retain();
}

uint64_t sub_23F250804()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 176) = v0;
  return sub_23F2688A0();
}

uint64_t sub_23F25081C()
{
  return 1;
}

uint64_t sub_23F25082C()
{
  uint64_t v0;

  return v0;
}

void sub_23F250838(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23F1BE0BC(v2, a2);
}

uint64_t sub_23F250840()
{
  uint64_t v0;

  return v0;
}

void sub_23F2508A4(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23F1BE0BC(a1, v1);
}

void sub_23F2508AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F2508B4()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F1F91AC(v0, v1);
}

uint64_t sub_23F2508CC()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F1F52C4(*(_QWORD *)(v1 - 72), v0);
}

void sub_23F2508E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_23F1F86F4(a1, v3, a3);
}

uint64_t sub_23F2508EC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F250908()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250914()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F250924(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_23F25092C()
{
  sub_23F131104();
  return sub_23F131104();
}

uint64_t sub_23F250954(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

uint64_t sub_23F25096C()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t sub_23F250974()
{
  return type metadata accessor for MessagePayload.ExternalAgentTextQuery(0);
}

uint64_t sub_23F25097C()
{
  return sub_23F267D24();
}

uint64_t sub_23F250984()
{
  return type metadata accessor for ParameterConfirmation(0);
}

uint64_t sub_23F25099C()
{
  return type metadata accessor for MessagePayload.ExternalAgentSpeechQuery(0);
}

uint64_t sub_23F2509C0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2509D8()
{
  uint64_t v0;

  return v0 - 72;
}

uint64_t sub_23F2509EC()
{
  return sub_23F2688A0();
}

uint64_t _s16IntelligenceFlow18ActionConfirmationV15parameterValuesSDySSAA14ParameterValueVGvg_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F250A08()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = v1;
  return sub_23F268648();
}

uint64_t sub_23F250A1C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250A54()
{
  uint64_t *v0;

  return sub_23F1F6000(*v0, v0[1], v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_23F250A68()
{
  return sub_23F2681A4();
}

void sub_23F250A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  *v6 = v4;
  v6[1] = v3;
  v7 = (_QWORD *)(v2 + *(int *)(v5 + 24));
  *v7 = v1;
  v7[1] = v0;
}

uint64_t sub_23F250A90()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  v0[2] = v1[2];
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F250AA4()
{
  return swift_initStructMetadata();
}

void sub_23F250AB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_23F1F86F4(a1, *(_QWORD *)(v3 - 128), a3);
}

__n128 sub_23F250AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9, __int128 a10, __int128 a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 result;

  *(_OWORD *)v12 = a11;
  *(_OWORD *)(v12 + 16) = a10;
  result = a9;
  *(__n128 *)(v12 + 32) = a9;
  *(_QWORD *)(v12 + 48) = v11;
  *(_QWORD *)(v12 + 56) = v13;
  return result;
}

uint64_t sub_23F250AE0()
{
  return sub_23F268750();
}

unint64_t sub_23F250AEC@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_23F163D7C();
}

uint64_t sub_23F250AF4()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  return swift_bridgeObjectRetain();
}

void sub_23F250B18()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
}

uint64_t sub_23F250B24()
{
  return sub_23F268684();
}

uint64_t sub_23F250B38()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250B44()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F1311B4(v1, v0);
}

uint64_t _s16IntelligenceFlow14MessagePayloadO5QueryV9variablesSDySS7ToolKit10TypedValueOGSgvg_0()
{
  return swift_bridgeObjectRetain();
}

id sub_23F250B74(id a1)
{
  return sub_23F131158(a1);
}

uint64_t sub_23F250B88(uint64_t a1)
{
  uint64_t v1;

  return sub_23F137210(*(_QWORD *)(v1 + *(int *)(a1 + 32)), *(_QWORD *)(v1 + *(int *)(a1 + 32) + 8), *(_BYTE *)(v1 + *(int *)(a1 + 32) + 16));
}

uint64_t sub_23F250B9C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 304);
}

uint64_t sub_23F250BA8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250BB0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_23F258B8C(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t sub_23F250BC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_23F250BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void sub_23F250BE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F250BEC()
{
  return sub_23F268690();
}

uint64_t sub_23F250C00()
{
  return sub_23F268750();
}

uint64_t sub_23F250C08(uint64_t a1)
{
  uint64_t v1;

  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v1, 1, 1, a1);
  return type metadata accessor for InterpretedStatementResult(0);
}

uint64_t sub_23F250C2C()
{
  return swift_bridgeObjectRetain();
}

void sub_23F250C34()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
}

void sub_23F250C40()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 81) = 1;
}

uint64_t sub_23F250C4C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F250C68(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a2;
}

uint64_t sub_23F250C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  return a4(319);
}

uint64_t sub_23F250C9C(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  return sub_23F1F5EF8(result, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_23F250CA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_23F250CAC()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t sub_23F250CC0()
{
  return sub_23F26812C();
}

void sub_23F250CC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23F125E40(v2, a2);
}

uint64_t sub_23F250CD0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F175240(v1, v0);
}

uint64_t sub_23F250CDC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

_QWORD *sub_23F250CE8()
{
  _QWORD *v0;

  return sub_23F12545C(v0, v0[3]);
}

uint64_t sub_23F250CFC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F250D08()
{
  uint64_t v0;

  return v0;
}

void sub_23F250D20(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F250D28()
{
  uint64_t v0;
  uint64_t v1;

  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v1, 0, 1, v0);
}

uint64_t sub_23F250D3C()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0);
}

uint64_t sub_23F250D44()
{
  uint64_t *v0;

  return sub_23F1217E8(v0);
}

uint64_t sub_23F250D68()
{
  return 0;
}

void sub_23F250DA0(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + a1);
  *v2 = 0;
  v2[1] = 0;
}

uint64_t sub_23F250DAC()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 56));
}

void sub_23F250DB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F250DCC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void sub_23F250DDC(uint64_t a1)
{
  uint64_t *v1;

  sub_23F125E40(a1, v1);
}

void sub_23F250DF0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = v0;
}

uint64_t sub_23F250DFC()
{
  return sub_23F2681BC();
}

uint64_t sub_23F250E08()
{
  return type metadata accessor for MessagePayload.ExternalAgentRequest(0);
}

uint64_t sub_23F250E10()
{
  return type metadata accessor for SystemPromptResolution(0);
}

uint64_t sub_23F250E18()
{
  return type metadata accessor for InterpretedStatementResult(0);
}

uint64_t sub_23F250E20()
{
  return type metadata accessor for ParameterConfirmation(0);
}

uint64_t sub_23F250E28()
{
  return type metadata accessor for MessagePayload.ClientEffectInvocation(0);
}

unint64_t sub_23F250E30()
{
  return sub_23F1254BC();
}

unint64_t sub_23F250E44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 72) = v4;
  *(_QWORD *)(v5 - 152) = v4;
  *(_QWORD *)(v5 - 144) = v0;
  *(_QWORD *)(v5 - 136) = v2;
  *(_QWORD *)(v5 - 128) = v3;
  *(_QWORD *)(v5 - 120) = v1;
  return sub_23F1F7FB0();
}

uint64_t sub_23F250E58()
{
  uint64_t v0;

  return v0;
}

__n128 sub_23F250E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __n128 *a6)
{
  return a6[2];
}

uint64_t _s16IntelligenceFlow21ParameterConfirmationV14parameterIndexSiSgvs_0(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t sub_23F250E98()
{
  uint64_t v0;

  return v0 - 192;
}

uint64_t sub_23F250EA4()
{
  return swift_bridgeObjectRelease_n();
}

void sub_23F250ED4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

__n128 sub_23F250EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  unint64_t v9;
  __n128 *v10;
  __n128 result;

  result = a9;
  *v10 = a9;
  v10[1].n128_u64[0] = v9;
  return result;
}

void sub_23F250EFC()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 - 120) = v0;
  *(_BYTE *)(v1 - 65) = 1;
}

uint64_t sub_23F250F0C()
{
  char v0;

  return v0 & 1;
}

uint64_t sub_23F250F34()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250F3C()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t sub_23F250F54()
{
  return type metadata accessor for PlannerPromptData.Tool.Definition(0);
}

uint64_t sub_23F250F64()
{
  return sub_23F2680D8();
}

id sub_23F250F74(id a1)
{
  return sub_23F131158(a1);
}

uint64_t sub_23F250F7C()
{
  return sub_23F267D78();
}

uint64_t sub_23F250F84()
{
  return swift_bridgeObjectRelease();
}

void sub_23F250F8C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 128);
  *(_QWORD *)(v0 - 96) = *(_QWORD *)(v0 - 120);
  *(_QWORD *)(v0 - 88) = v1;
}

void sub_23F250F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 192) = v2;
  *(_QWORD *)(v3 - 184) = v0;
  *(_QWORD *)(v3 - 176) = v1;
}

uint64_t sub_23F250FD0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F250FE4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = v0;
  return v0;
}

uint64_t sub_23F251010(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 168) = result;
  return result;
}

void sub_23F25101C(uint64_t a1@<X8>)
{
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
}

uint64_t sub_23F251024()
{
  return swift_willThrow();
}

void sub_23F251038(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23F1BE0BC(v2, a2);
}

uint64_t sub_23F251040()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25104C()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_23F137230(v2, v1, v0);
}

uint64_t sub_23F25105C()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_23F135C9C(v2, v1, v0);
}

uint64_t sub_23F25106C()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_23F1BE4CC(v2, v1, v0);
}

uint64_t sub_23F25107C()
{
  uint64_t v0;

  return v0;
}

void sub_23F251088()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);

  sub_23F1BE1A0(v1, v0, v2);
}

void sub_23F251098(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE1A0(a1, v3, a3);
}

uint64_t sub_23F2510A0()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[1] + 8))(v0[10], v0[9]);
}

uint64_t sub_23F2510BC()
{
  return 0;
}

uint64_t sub_23F2510D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(a1, 1, 1, a4);
  return type metadata accessor for ActionResponse(0);
}

uint64_t sub_23F2510FC()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 88) + 8))(v0, *(_QWORD *)(v1 - 96));
}

uint64_t sub_23F25110C()
{
  return sub_23F268840();
}

uint64_t sub_23F251114()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251120()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25112C(uint64_t a1)
{
  uint64_t v1;

  return v1 + *(int *)(a1 + 20);
}

void sub_23F251144()
{
  sub_23F1298E0();
}

uint64_t sub_23F251154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23F1F55A0(*(_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 8));
}

void sub_23F251164(uint64_t a1@<X8>)
{
  unsigned int v1;
  uint64_t v2;

  *(_QWORD *)(v2 + a1 + 16) = v1;
}

uint64_t sub_23F251174@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;

  v3 = (uint64_t *)(v2 + a1);
  result = *v3;
  v5 = v3[1];
  *(_QWORD *)v1 = *v3;
  *(_QWORD *)(v1 + 8) = v5;
  *(_BYTE *)(v1 + 16) = *((_BYTE *)v3 + 16);
  return result;
}

void sub_23F251198(uint64_t a1@<X8>)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;
  uint64_t v3;

  sub_23F1BE1A0(v2 + a1, v3, v1);
}

uint64_t sub_23F2511A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return v1(v2 + a1, v4, v3);
}

void sub_23F2511C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F1752C4(a1, a2, v2);
}

uint64_t sub_23F2511E8()
{
  uint64_t v0;

  return v0;
}

uint64_t _s16IntelligenceFlow13ActionFailureV21DeveloperDefinedErrorV15localizedString6domain4codeAESS_SSSitcfC_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t sub_23F251208()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 320);
}

uint64_t sub_23F251220()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_23F251230()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251248()
{
  _QWORD *v0;
  uint64_t (*v1)(void);

  sub_23F12545C(v0, v0[3]);
  return v1();
}

uint64_t sub_23F251288()
{
  return swift_bridgeObjectRelease();
}

void sub_23F2512B8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = v1;
  *(_QWORD *)(v2 - 112) = a1;
}

void sub_23F2512C8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 2;
}

uint64_t sub_23F2512D4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
  return v0 - 67;
}

void sub_23F2512E4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
}

uint64_t sub_23F2512F4()
{
  return sub_23F2686F0();
}

uint64_t sub_23F251304()
{
  return sub_23F268708();
}

uint64_t sub_23F251314()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return v0 - 66;
}

void sub_23F251324()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
}

void sub_23F251334()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
}

uint64_t sub_23F251344()
{
  return sub_23F268654();
}

uint64_t sub_23F25134C()
{
  return sub_23F268678();
}

uint64_t sub_23F251354()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_23F25135C()
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

  v3[35] = v6;
  v3[36] = v5;
  v3[37] = v7;
  v3[38] = v2;
  v3[39] = v1;
  v3[40] = v4;
  v8 = v3[10];
  v3[41] = v0;
  v3[42] = v8;
}

uint64_t sub_23F251384(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;

  result = a2[1];
  *a1 = *a2;
  a1[1] = result;
  return result;
}

void sub_23F251394()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 152) = 10;
}

unint64_t sub_23F2513B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 152) = v3;
  *(_QWORD *)(v5 - 144) = v0;
  *(_QWORD *)(v5 - 136) = v4;
  *(_QWORD *)(v5 - 128) = v1;
  *(_QWORD *)(v5 - 120) = v2;
  return sub_23F1F75D0();
}

void sub_23F2513D8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 152) = 1;
}

uint64_t sub_23F251410()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F251418()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251430(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 264) = result;
  return result;
}

void sub_23F251440(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F1752C4(a1, a2, v2);
}

uint64_t sub_23F251448()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0);
}

uint64_t sub_23F251450()
{
  uint64_t v0;

  return v0;
}

void sub_23F25145C(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_23F1BE0BC(a1, v1);
}

void sub_23F251470(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 72) = v1;
  *(_QWORD *)(v2 - 144) = a1;
}

void sub_23F251480(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 72) = v1;
  *(_QWORD *)(v2 - 240) = a1;
}

void sub_23F251490(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F17537C(a1, a2, v2);
}

uint64_t sub_23F251498()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23F2514A8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2514B4()
{
  return sub_23F268690();
}

uint64_t sub_23F2514C4()
{
  return sub_23F2686D8();
}

uint64_t sub_23F2514CC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2514D8()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F137210(v1, v0, 2u);
}

void sub_23F2514E8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_23F1752C4(a1, a2, v2);
}

void sub_23F2514F0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE1A0(a1, a2, v2);
}

uint64_t sub_23F2514F8()
{
  return sub_23F268744();
}

uint64_t sub_23F251508()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251520()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251530()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251540()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23F251550()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251560()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251570()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  return sub_23F137248(v0, v2, v1);
}

uint64_t sub_23F251580()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  return sub_23F135CB4(v0, v2, v1);
}

uint64_t sub_23F251590()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  return sub_23F137248(v0, v1, v2);
}

uint64_t sub_23F2515B0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return 0;
}

void sub_23F2515C8(uint64_t a1)
{
  uint64_t *v1;

  sub_23F125E40(a1, v1);
}

uint64_t sub_23F2515D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

void sub_23F2515E0()
{
  void *v0;

  free(v0);
}

uint64_t sub_23F2515E8()
{
  return sub_23F131110();
}

uint64_t sub_23F251608()
{
  return sub_23F26812C();
}

uint64_t sub_23F251618()
{
  return type metadata accessor for ParameterNotAllowed(0);
}

uint64_t sub_23F251620()
{
  return type metadata accessor for MessagePayload.ClientActionResult(0);
}

uint64_t sub_23F251628()
{
  return type metadata accessor for ActionResponse(0);
}

uint64_t sub_23F251630()
{
  return type metadata accessor for MessagePayload.Request(0);
}

unint64_t sub_23F251638()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_23F1255A4();
}

uint64_t sub_23F251648()
{
  return ActionResponse.stepId.getter();
}

uint64_t sub_23F251660()
{
  return type metadata accessor for ActionResponse(0);
}

uint64_t sub_23F25167C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F251684(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRetain();
}

void sub_23F25168C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)v1 = v0;
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v3;
}

uint64_t sub_23F251698()
{
  return swift_bridgeObjectRelease();
}

void sub_23F2516A0()
{
  static StatementOutcome.== infix(_:_:)();
}

uint64_t sub_23F2516AC()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(*(_QWORD *)(v0 - 160));
}

uint64_t sub_23F2516B4()
{
  uint64_t v0;

  return v0 - 104;
}

void sub_23F2516C8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + a1;
  *(_QWORD *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  *(_BYTE *)(v2 + 16) = 2;
}

uint64_t sub_23F2516DC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2516E8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  *v1 = *a1;
  result = a1[1];
  v1[1] = result;
  return result;
}

uint64_t sub_23F2516FC()
{
  return sub_23F268684();
}

__n128 sub_23F251718()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v1;
  v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)v0 = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 16) = v3;
  *(_QWORD *)(v0 + 32) = *(_QWORD *)(v1 + 32);
  return result;
}

uint64_t sub_23F25172C()
{
  uint64_t v0;

  return sub_23F137210(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

unint64_t sub_23F251738()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 40;
  return sub_23F1F60E0();
}

unint64_t sub_23F251758()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 39;
  return sub_23F1F6158();
}

unint64_t sub_23F251764()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 38;
  return sub_23F1F61D0();
}

unint64_t sub_23F251770()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 37;
  return sub_23F1F6248();
}

unint64_t sub_23F25177C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 36;
  return sub_23F1F6284();
}

unint64_t sub_23F251788()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 35;
  return sub_23F1F62C0();
}

unint64_t sub_23F251794()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 34;
  return sub_23F1F62FC();
}

unint64_t sub_23F2517A0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 33;
  return sub_23F1F6338();
}

unint64_t sub_23F2517AC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 32;
  return sub_23F1F6374();
}

unint64_t sub_23F2517B8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 31;
  return sub_23F1F63B0();
}

unint64_t sub_23F2517C4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 30;
  return sub_23F1F63EC();
}

unint64_t sub_23F2517D0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 29;
  return sub_23F1F6428();
}

uint64_t sub_23F2517DC()
{
  uint64_t *v0;

  return sub_23F1F6090(*v0, v0[1], v0[2]);
}

uint64_t sub_23F2517E8()
{
  uint64_t *v0;

  return sub_23F1F55A0(*v0, v0[1]);
}

unint64_t sub_23F2517F4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 28;
  return sub_23F1F6464();
}

unint64_t sub_23F251800()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 27;
  return sub_23F1F64A0();
}

unint64_t sub_23F25180C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 26;
  return sub_23F1F6518();
}

unint64_t sub_23F251818()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 25;
  return sub_23F1F6590();
}

unint64_t sub_23F251824()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 24;
  return sub_23F1F6608();
}

uint64_t sub_23F251830@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

unint64_t sub_23F25183C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 23;
  return sub_23F1F6680();
}

BOOL sub_23F251848@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return *(unsigned __int8 *)(v2 + a1) == *(unsigned __int8 *)(v1 + a1);
}

uint64_t sub_23F25185C()
{
  return sub_23F2686D8();
}

unint64_t sub_23F251864()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 22;
  return sub_23F1F66BC();
}

unint64_t sub_23F251870()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 21;
  return sub_23F1F66F8();
}

unint64_t sub_23F25187C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 20;
  return sub_23F1F6734();
}

unint64_t sub_23F251888()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 19;
  return sub_23F1F6770();
}

unint64_t sub_23F251894()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 18;
  return sub_23F1F67E8();
}

uint64_t sub_23F2518A0()
{
  return sub_23F268678();
}

unint64_t sub_23F2518B4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 17;
  return sub_23F1F6860();
}

unint64_t sub_23F2518C0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 16;
  return sub_23F1F689C();
}

unint64_t sub_23F2518CC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 16;
  return sub_23F1F921C();
}

unint64_t sub_23F2518D8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 15;
  return sub_23F1F68D8();
}

unint64_t sub_23F2518E4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 15;
  return sub_23F1F9258();
}

unint64_t sub_23F2518F0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 14;
  return sub_23F1F6950();
}

unint64_t sub_23F2518FC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 14;
  return sub_23F1F92D0();
}

unint64_t sub_23F251908()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 13;
  return sub_23F1F698C();
}

unint64_t sub_23F251914()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 13;
  return sub_23F1F930C();
}

unint64_t sub_23F251920()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 12;
  return sub_23F1F69C8();
}

unint64_t sub_23F25192C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 12;
  return sub_23F1F9348();
}

unint64_t sub_23F251938()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 11;
  return sub_23F1F6A40();
}

unint64_t sub_23F251944()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 11;
  return sub_23F1F9384();
}

unint64_t sub_23F251950()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 10;
  return sub_23F1F6AB8();
}

unint64_t sub_23F25195C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 10;
  return sub_23F1F93C0();
}

unint64_t sub_23F251968()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 9;
  return sub_23F1F6B30();
}

unint64_t sub_23F251974()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 9;
  return sub_23F1F93FC();
}

uint64_t sub_23F251980()
{
  uint64_t *v0;

  return sub_23F1F6090(*v0, v0[1], v0[2]);
}

uint64_t sub_23F25198C()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(v1 + 24);
}

unint64_t sub_23F251998()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 8;
  return sub_23F1F6BA8();
}

unint64_t sub_23F2519A4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 8;
  return sub_23F1F9438();
}

unint64_t sub_23F2519B0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 7;
  return sub_23F1F6C20();
}

unint64_t sub_23F2519BC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 7;
  return sub_23F1F8FCC();
}

unint64_t sub_23F2519C8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 7;
  return sub_23F1F78F0();
}

unint64_t sub_23F2519D4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 7;
  return sub_23F1F9474();
}

uint64_t sub_23F2519E0()
{
  return swift_willThrow();
}

uint64_t sub_23F251A0C()
{
  uint64_t *v0;

  return sub_23F1F55A0(*v0, v0[1]);
}

uint64_t sub_23F251A18()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t sub_23F251A2C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 144);
}

uint64_t sub_23F251A40()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 136);
}

uint64_t sub_23F251A54()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(*(_QWORD *)(v0 - 88));
}

uint64_t sub_23F251A70()
{
  uint64_t *v0;

  return sub_23F1F55A0(*v0, v0[1]);
}

uint64_t sub_23F251A7C()
{
  return sub_23F2686E4();
}

void sub_23F251A9C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE0F4(a1, a2, v2);
}

uint64_t sub_23F251AA4()
{
  return sub_23F268750();
}

uint64_t sub_23F251AAC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = result;
  return result;
}

uint64_t sub_23F251AB8()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_23F251AE0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 6;
  return sub_23F1F6C98();
}

unint64_t sub_23F251AEC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 6;
  return sub_23F1F8C0C();
}

unint64_t sub_23F251AF8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 6;
  return sub_23F1FA1B4();
}

unint64_t sub_23F251B04()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 6;
  return sub_23F1F94B0();
}

unint64_t sub_23F251B10()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 6;
  return sub_23F1F7968();
}

unint64_t sub_23F251B1C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 6;
  return sub_23F1F9008();
}

unint64_t sub_23F251B28()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 5;
  return sub_23F1F6D10();
}

unint64_t sub_23F251B34()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 5;
  return sub_23F1F8C84();
}

void sub_23F251B40()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 5;
}

unint64_t sub_23F251B4C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 5;
  return sub_23F1F3D9C();
}

unint64_t sub_23F251B58()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 5;
  return sub_23F1F94EC();
}

unint64_t sub_23F251B64()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 5;
  return sub_23F1F9044();
}

unint64_t sub_23F251B70()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 5;
  return sub_23F1FA1F0();
}

void sub_23F251B7C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 5;
}

unint64_t sub_23F251B88()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 5;
  return sub_23F1F79E0();
}

unint64_t sub_23F251B94()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 4;
  return sub_23F1F6D88();
}

unint64_t sub_23F251BA0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 4;
  return sub_23F1F8CFC();
}

unint64_t sub_23F251BAC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 4;
  return sub_23F1F3E14();
}

unint64_t sub_23F251BB8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 4;
  return sub_23F1F9528();
}

unint64_t sub_23F251BC4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 4;
  return sub_23F1FA22C();
}

unint64_t sub_23F251BD0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 4;
  return sub_23F1F9080();
}

unint64_t sub_23F251BDC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 4;
  return sub_23F1F7A1C();
}

unint64_t sub_23F251BE8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 3;
  return sub_23F1F6DC4();
}

unint64_t sub_23F251BF4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 152) = 3;
  return sub_23F1F74A4();
}

void sub_23F251C00()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 3;
}

unint64_t sub_23F251C0C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 3;
  return sub_23F1F8D38();
}

unint64_t sub_23F251C18()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 3;
  return sub_23F1F77C4();
}

unint64_t sub_23F251C24()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
  return sub_23F1FA650();
}

unint64_t sub_23F251C30()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 3;
  return sub_23F1F3E8C();
}

unint64_t sub_23F251C3C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 3;
  return sub_23F1F9564();
}

unint64_t sub_23F251C48()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 3;
  return sub_23F1F7A58();
}

uint64_t sub_23F251C54()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 3;
  return v0 - 68;
}

unint64_t sub_23F251C68()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 3;
  return sub_23F1FA268();
}

unint64_t sub_23F251C74()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 3;
  return sub_23F1F90BC();
}

uint64_t sub_23F251C80()
{
  return 1;
}

uint64_t sub_23F251C94()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F251C9C()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F131170(v0, v1);
}

void sub_23F251CA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE0F4(v3, a2, a3);
}

void sub_23F251CB0()
{
  static ActionSuccess.== infix(_:_:)();
}

uint64_t sub_23F251CBC()
{
  return sub_23F268648();
}

uint64_t _s16IntelligenceFlow21ParameterConfirmationV14parameterIndexSiSgvg_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_23F251CD4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F251D1C()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_23F251D24(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE0F4(a1, *(_QWORD *)(v3 - 72), a3);
}

uint64_t sub_23F251D44()
{
  uint64_t v0;

  return v0;
}

void sub_23F251D50()
{
  StatementOutcome.asActionOutcome.getter();
}

uint64_t sub_23F251D84()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23F251D8C()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(*(_QWORD *)(v0 - 128));
}

uint64_t sub_23F251DA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t _s16IntelligenceFlow14MessagePayloadO015ClientInitiatedE6ActionV6toolId10parametersAESS_SDySS7ToolKit10TypedValueOGtcfC_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t sub_23F251DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  *a3 = a1;
  a3[1] = a2;
  *(_BYTE *)(v3 - 69) = 4;
  return v3 - 69;
}

uint64_t _s16IntelligenceFlow14MessagePayloadO11SpeechQueryV9CandidateV11recognitionAGSS_tcfC_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_23F251DFC(uint64_t a1)
{
  unint64_t v1;

  return sub_23F1311B4(a1, v1);
}

uint64_t sub_23F251E04()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 144), *(_QWORD *)(v1 - 136));
}

uint64_t sub_23F251E10()
{
  return swift_willThrow();
}

uint64_t sub_23F251E40()
{
  return sub_23F268750();
}

uint64_t sub_23F251E54()
{
  uint64_t v0;

  return v0;
}

void sub_23F251E6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_23F1BE0F4(v4, v3, a3);
}

uint64_t sub_23F251E78()
{
  uint64_t *v0;

  return sub_23F1217E8(v0);
}

uint64_t sub_23F251E80(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = result;
  return result;
}

uint64_t sub_23F251E8C()
{
  return type metadata accessor for MessagePayload.RequestContent(0);
}

unint64_t sub_23F251EA4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 2;
  return sub_23F1F6E3C();
}

unint64_t sub_23F251EB0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 152) = 2;
  return sub_23F1F751C();
}

unint64_t sub_23F251EBC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 2;
  return sub_23F1F8D74();
}

unint64_t sub_23F251EC8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 2;
  return sub_23F1F5A18();
}

unint64_t sub_23F251ED4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 2;
  return sub_23F1F7800();
}

unint64_t sub_23F251EE0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_23F1F8EDC();
}

unint64_t sub_23F251EEC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_23F1F5644();
}

unint64_t sub_23F251EF8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_23F1F4A28();
}

unint64_t sub_23F251F04()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_23F1F99C8();
}

void sub_23F251F10()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 2;
}

unint64_t sub_23F251F1C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 2;
  return sub_23F1F3F04();
}

unint64_t sub_23F251F28()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 71) = 2;
  return sub_23F1F7A94();
}

unint64_t sub_23F251F34()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 2;
  return sub_23F1F95A0();
}

unint64_t sub_23F251F40()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 2;
  return sub_23F1FA68C();
}

unint64_t sub_23F251F4C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 2;
  return sub_23F1F90F8();
}

unint64_t sub_23F251F58()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 2;
  return sub_23F1FA2A4();
}

unint64_t sub_23F251F64()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 1;
  return sub_23F1F6EB4();
}

unint64_t sub_23F251F70()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 152) = 1;
  return sub_23F1F7558();
}

unint64_t sub_23F251F7C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = 1;
  return sub_23F1F8DB0();
}

unint64_t sub_23F251F88()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 1;
  return sub_23F1F4848();
}

unint64_t sub_23F251F94()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 1;
  return sub_23F1F9EBC();
}

unint64_t sub_23F251FA0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 1;
  return sub_23F1F783C();
}

unint64_t sub_23F251FAC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 1;
  return sub_23F1F5A90();
}

unint64_t sub_23F251FB8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_23F163BDC();
}

unint64_t sub_23F251FC4()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_23F1F447C();
}

unint64_t sub_23F251FD0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_23F1F4EC0();
}

unint64_t sub_23F251FDC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 1;
  return sub_23F1F3F7C();
}

unint64_t sub_23F251FE8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 71) = 1;
  return sub_23F1F9134();
}

uint64_t sub_23F251FF4(uint64_t result)
{
  *(_BYTE *)(result + 24) = 1;
  return result;
}

unint64_t sub_23F252000()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 1;
  return sub_23F1FA6C8();
}

unint64_t sub_23F25200C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 128) = 1;
  return sub_23F1F95DC();
}

unint64_t sub_23F252018()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_23F1F9A04();
}

unint64_t sub_23F252024()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_23F1F4AA0();
}

uint64_t sub_23F252030()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return *(_QWORD *)(v0 - 104);
}

unint64_t sub_23F252044()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_23F1F8F18();
}

unint64_t sub_23F252050()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 1;
  return sub_23F1FA2E0();
}

unint64_t sub_23F25205C()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return sub_23F1F7AD0();
}

uint64_t sub_23F252068()
{
  return sub_23F26872C();
}

uint64_t sub_23F252074()
{
  return sub_23F1F4F74((uint64_t)&STACK[0x540]);
}

unint64_t sub_23F252094()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 152) = v0;
  *(_QWORD *)(v3 - 144) = v1;
  *(_BYTE *)(v3 - 136) = v2;
  return sub_23F1F80A0();
}

void sub_23F2520A0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 152) = 8;
}

uint64_t sub_23F2520B4()
{
  return sub_23F267D84();
}

uint64_t sub_23F2520D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(int *)(a1 + 20);
  *(_QWORD *)(v2 - 104) = v1;
  return v1 + v3;
}

uint64_t sub_23F2520F4()
{
  return sub_23F2681BC();
}

void sub_23F252100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)(v0 + 24) = *(_BYTE *)(v1 + 24);
  *(_QWORD *)(v0 + 16) = v2;
}

uint64_t sub_23F25212C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

unint64_t sub_23F252138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 152) = v2;
  *(_QWORD *)(v3 - 144) = v0;
  *(_QWORD *)(v3 - 136) = v1;
  return sub_23F1F8244();
}

void sub_23F252144()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 152) = 2;
}

uint64_t sub_23F252178()
{
  return type metadata accessor for ActionResponse(0);
}

uint64_t sub_23F252184()
{
  return type metadata accessor for InterpretedStatementResult(0);
}

uint64_t sub_23F252190()
{
  return type metadata accessor for SystemResponse(0);
}

uint64_t sub_23F25219C()
{
  return type metadata accessor for MessagePayload.ClientActionResult(0);
}

uint64_t sub_23F2521A8()
{
  return type metadata accessor for MessagePayload.Request(0);
}

void sub_23F2521B4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE1A0(a1, a2, v2);
}

id sub_23F2521BC()
{
  void *v0;

  return sub_23F131158(v0);
}

uint64_t sub_23F2521C8()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_23F2521D4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F12CA90(v1, v0);
}

unint64_t sub_23F2521E0()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23F12545C(v1, v0);
  return sub_23F1F7468();
}

uint64_t sub_23F2521FC()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F1311B4(v0, v1);
}

void sub_23F252208()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = v0;
}

uint64_t sub_23F252214()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

void sub_23F252220()
{
  sub_23F123100();
}

uint64_t sub_23F25222C()
{
  return sub_23F2681BC();
}

uint64_t sub_23F252238(uint64_t a1)
{
  unint64_t v1;

  return sub_23F1311B4(a1, v1);
}

void sub_23F252240(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23F1BE0BC(v2, a2);
}

uint64_t sub_23F252248()
{
  uint64_t v0;

  return v0;
}

void sub_23F252254()
{
  uint64_t v0;

  static ParameterConfirmation.== infix(_:_:)(v0);
}

void sub_23F252260()
{
  void *v0;

  free(v0);
}

void sub_23F252268(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_23F1BE1A0(a1, a2, v2);
}

uint64_t sub_23F252270()
{
  return swift_getEnumCaseMultiPayload();
}

void sub_23F252278(uint64_t a1)
{
  sub_23F12E488(a1);
}

void sub_23F252280(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_23F1BE0BC(v2, a2);
}

void sub_23F252288()
{
  void *v0;

  sub_23F131164(v0);
}

uint64_t sub_23F252294()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23F25229C()
{
  uint64_t v0;

  return v0;
}

void sub_23F2522A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_23F125E40(v2, a2);
}

void sub_23F2522C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + *(int *)(v0 + 24));
  *v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
}

void sub_23F2522D8()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_23F129820(v0, v1);
}

uint64_t sub_23F2522E4()
{
  uint64_t v0;

  return v0;
}

void sub_23F2522F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_23F1F86F4(v3, v4, a3);
}

uint64_t sub_23F2522FC()
{
  return sub_23F2686D8();
}

void sub_23F252308(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_23F1F86F4(v3, v4, a3);
}

void sub_23F252314(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_23F1F4C44(v3, v4, a3);
}

uint64_t sub_23F252320(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;

  v4 = v2 + *(int *)(result + 20);
  *(_QWORD *)v4 = v1;
  *(_BYTE *)(v4 + 8) = v3;
  return result;
}

uint64_t sub_23F252334()
{
  return _s16IntelligenceFlow7EventIDV2eeoiySbAC_ACtFZ_0();
}

void sub_23F252340(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);
  uint64_t v3;

  sub_23F1F4C44(v3, a2, v2);
}

void sub_23F25234C()
{
  void *v0;

  sub_23F131164(v0);
}

void sub_23F252358(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_23F1F4C44(v3, v4, a3);
}

void sub_23F252364()
{
  sub_23F12A5A0();
}

void sub_23F252370(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  sub_23F1BE0F4(v3, a2, a3);
}

void sub_23F252378()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_23F1BE0BC(v0, v1);
}

void sub_23F252384()
{
  void *v0;

  sub_23F131164(v0);
}

uint64_t sub_23F252390()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25239C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F2523B0()
{
  return type metadata accessor for ActionSuccess(0);
}

uint64_t sub_23F2523B8()
{
  return type metadata accessor for ActionSuccess.UndoContext(0);
}

unint64_t sub_23F2523C0()
{
  return sub_23F1F4530();
}

__n128 sub_23F2523C8(uint64_t a1, uint64_t a2)
{
  return *(__n128 *)a2;
}

uint64_t sub_23F2523DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 96))();
}

uint64_t sub_23F2523E8()
{
  return _s16IntelligenceFlow14MessagePayloadO17ActionWillExecuteV18ToolParameterValueO0J0V2eeoiySbAI_AItFZ_0();
}

void sub_23F2523F4()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = *(_QWORD *)(v1 - 72);
}

uint64_t sub_23F252400()
{
  return sub_23F2686D8();
}

uint64_t sub_23F252408()
{
  return sub_23F2686A8();
}

uint64_t EventsSubscription.Iterator.next()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_23F1217E8(&qword_256DFEB68);
  *v1 = v0;
  v1[1] = sub_23F12EE90;
  return sub_23F268318();
}

uint64_t sub_23F252480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v5;

  v3[3] = a2;
  v3[4] = a3;
  v5 = (_QWORD *)swift_task_alloc();
  v3[5] = v5;
  *v5 = v3;
  v5[1] = sub_23F2524D8;
  return SessionDebuggerEventsSubscription.Iterator.next()(a1);
}

uint64_t sub_23F2524D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F25A3A4();
  if (!v1)
    return sub_23F25A378(*(uint64_t (**)(void))(v2 + 8));
  if (*(_QWORD *)(v0 + 24))
  {
    sub_23F25A670();
    sub_23F2682D0();
  }
  return sub_23F131838();
}

uint64_t sub_23F25253C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v3[3] = a2;
  v3[4] = a3;
  v4 = (_QWORD *)swift_task_alloc();
  v3[5] = v4;
  sub_23F1217E8(&qword_256DFEB68);
  *v4 = v3;
  v4[1] = sub_23F2525AC;
  return sub_23F268318();
}

uint64_t sub_23F2525AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F25A3A4();
  if (!v1)
    return sub_23F25A378(*(uint64_t (**)(void))(v2 + 8));
  if (*(_QWORD *)(v0 + 24))
  {
    sub_23F25A670();
    sub_23F2682D0();
  }
  return sub_23F131838();
}

uint64_t sub_23F252610()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 48);
  sub_23F1217E8(&qword_256DFEB10);
  swift_willThrowTypedImpl();
  return sub_23F13182C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23F252660(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_23F267D84();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_23F25697C(&qword_256DFEAF0, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]),
        v6 = sub_23F268120(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_23F25697C(&qword_256DFEAF8, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      v12 = sub_23F268138();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

void *sub_23F2527EC()
{
  qword_256E089F0 = (uint64_t)&unk_256E63D08;
  return &unk_256E63D08;
}

id static SessionXPCServerService.interface.getter()
{
  return sub_23F256C70(&qword_256DFE4D8, (id *)&qword_256E089F0);
}

unint64_t static SessionXPCServerService.serviceName.getter()
{
  return sub_23F25A52C();
}

void sub_23F252828()
{
  qword_256E089F8 = MEMORY[0x24BEE4AF8];
}

uint64_t static SessionXPCServerService.selectorClasses.getter()
{
  return sub_23F256CE0(&qword_256DFE4E0);
}

void sub_23F252858(uint64_t a1)
{
  sub_23F256D20(a1, qword_256E08A00);
}

uint64_t static SessionXPCServerService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23F256D7C(&qword_256DFE4E8, (uint64_t)qword_256E08A00, a1);
}

id static SessionXPCServerService.customize(serverInterface:)()
{
  void *v0;
  SEL v1;
  void *v2;
  SEL v3;

  sub_23F267FE8();
  v0 = (void *)sub_23F25A640();
  objc_msgSend(v0, v1);
  sub_23F267FE8();
  v2 = (void *)sub_23F25A640();
  return objc_msgSend(v2, v3);
}

uint64_t sub_23F2528E0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23F143894;
  return EventsSubscription.Iterator.next()();
}

uint64_t sub_23F252930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v4 + 16) = a4;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_256E09108 + dword_256E09108);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = sub_23F2529B4;
  return v10(a1, a2, a3);
}

uint64_t sub_23F2529B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
    **(_QWORD **)(v2 + 16) = v0;
  return sub_23F25A378(*(uint64_t (**)(void))(v3 + 8));
}

void EventsSubscription.__allocating_init(continuation:stream:)()
{
  uint64_t v0;

  sub_23F25A464();
  EventsSubscription.init(continuation:stream:)(v0);
  sub_23F12612C();
}

void EventsSubscription.init(continuation:stream:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23F1217E8(&qword_256E08A48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  *(_QWORD *)(v1 + 16) = 0;
  v4 = sub_23F1217E8(qword_256DFEB78);
  sub_23F25A4B0(v4);
  sub_23F12612C();
}

void EventsSubscription.__allocating_init(stream:)()
{
  sub_23F252B34();
}

void EventsSubscription.init(stream:)()
{
  sub_23F252B94();
}

void sub_23F252AB4()
{
  sub_23F1217E8(qword_256DFEB78);
  sub_23F26830C();
  sub_23F126078();
}

void EventsSubscription.deinit()
{
  sub_23F252C14();
}

uint64_t EventsSubscription.__deallocating_deinit()
{
  return sub_23F252C58();
}

uint64_t sub_23F252B04()
{
  sub_23F252AB4();
  return swift_release();
}

void ThrowingEventsSubscription.__allocating_init(stream:)()
{
  sub_23F252B34();
}

void sub_23F252B34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_23F25A464();
  *(_QWORD *)(v2 + 16) = 0;
  v3 = v2 + *v0;
  v4 = sub_23F1217E8(qword_256DFEB78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, v1, v4);
  sub_23F12612C();
}

void ThrowingEventsSubscription.init(stream:)()
{
  sub_23F252B94();
}

void sub_23F252B94()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = 0;
  v1 = sub_23F1217E8(qword_256DFEB78);
  sub_23F25A4B0(v1);
  sub_23F12612C();
}

void sub_23F252BD0()
{
  sub_23F1217E8(qword_256DFEB78);
  sub_23F26830C();
  sub_23F126078();
}

void ThrowingEventsSubscription.deinit()
{
  sub_23F252C14();
}

void sub_23F252C14()
{
  uint64_t v0;

  sub_23F25A448();
  v0 = sub_23F1217E8(qword_256DFEB78);
  sub_23F1261A8(v0);
  sub_23F126078();
}

uint64_t ThrowingEventsSubscription.__deallocating_deinit()
{
  return sub_23F252C58();
}

uint64_t sub_23F252C58()
{
  uint64_t v0;

  sub_23F25A448();
  v0 = sub_23F1217E8(qword_256DFEB78);
  sub_23F1261A8(v0);
  return swift_deallocClassInstance();
}

uint64_t sub_23F252CA0()
{
  sub_23F252BD0();
  return swift_release();
}

uint64_t SessionClient.__allocating_init(clientIdentifier:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  char v6;

  swift_bridgeObjectRelease();
  type metadata accessor for SessionClient.ReverseServer();
  sub_23F14F4D0();
  sub_23F25A6A8();
  v2 = sub_23F131C14();
  v5 = MEMORY[0x24BEE4AF8];
  v6 = 0;
  v3 = (*(uint64_t (**)(uint64_t, uint64_t *))(v0 + 168))(v2, &v5);
  if (v1)
    sub_23F25A59C();
  else
    sub_23F25A67C();
  return v3;
}

uint64_t type metadata accessor for SessionClient.ReverseServer()
{
  return objc_opt_self();
}

void SessionClient.__allocating_init(localObject:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = MEMORY[0x24BEE4AF8];
  v3 = 0;
  (*(void (**)(uint64_t, uint64_t *))(v1 + 168))(a1, &v2);
  sub_23F25A688();
}

void SessionClient.__allocating_init()()
{
  uint64_t v0;
  char v1;

  v0 = MEMORY[0x24BEE4AF8];
  v1 = 0;
  SessionClient.__allocating_init(configuration:)(&v0);
  sub_23F25A688();
}

void SessionClient.__allocating_init(configuration:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  void (*v5)(uint64_t, uint64_t *);
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *a1;
  v4 = *((_BYTE *)a1 + 8);
  type metadata accessor for SessionClient.ReverseServer();
  sub_23F14F4D0();
  sub_23F25A6A8();
  v7 = v3;
  v8 = v4;
  v5 = *(void (**)(uint64_t, uint64_t *))(v1 + 168);
  v6 = sub_23F131C14();
  v5(v6, &v7);
  if (v2)
    sub_23F25A59C();
  else
    sub_23F25A67C();
  sub_23F25A540();
}

void SessionClient.__allocating_init(localObject:configuration:)()
{
  sub_23F25A3D4();
  sub_23F25A450();
  SessionClient.init(localObject:configuration:)();
  sub_23F25A4E0();
}

void SessionClient.init(localObject:configuration:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD *v19;
  uint64_t v20;
  id v21[4];
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;

  sub_23F131874();
  v26 = v2;
  v27 = v3;
  v4 = v0;
  v6 = v5;
  v8 = *v7;
  v9 = *((_BYTE *)v7 + 8);
  sub_23F267C70();
  *(_OWORD *)(v0 + 16) = 0u;
  v10 = v0 + 16;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  sub_23F150918();
  *(_QWORD *)(v0 + 64) = sub_23F267C64();
  sub_23F267C4C();
  sub_23F150918();
  v11 = sub_23F267C40();
  *(_QWORD *)(v0 + 56) = v6;
  *(_QWORD *)(v0 + 72) = v11;
  *(_QWORD *)(v0 + 80) = v8;
  *(_BYTE *)(v0 + 88) = v9;
  sub_23F25697C(&qword_256E08A60, v12, (void (*)(uint64_t))type metadata accessor for SessionClient);
  v13 = sub_23F1217E8(&qword_256E08A68);
  sub_23F150918();
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_23F131C14();
  v14 = sub_23F267F10();
  if (v1)
  {
    sub_23F25A59C();
    swift_bridgeObjectRelease();
    sub_23F15EB1C();
  }
  else
  {
    v15 = v14;
    *((_QWORD *)&v23 + 1) = v13;
    sub_23F25A218(&qword_256E08A70, &qword_256E08A68);
    v24 = v16;
    *(_QWORD *)&v22 = v15;
    sub_23F25A690();
    if (*(_QWORD *)(v4 + 40))
      _s16IntelligenceFlow17AnySessionMessageVwxx_0(v10);
    sub_23F14387C(&v22, v10);
    swift_endAccess();
    *(_QWORD *)&v22 = v8;
    BYTE8(v22) = v9;
    sub_23F256928();
    v17 = sub_23F267C58();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v4 + 40))
    {
      sub_23F1328E8(v10, (uint64_t)&v22);
    }
    else
    {
      v18 = *(_OWORD *)(v10 + 16);
      v22 = *(_OWORD *)v10;
      v23 = v18;
      v24 = *(_QWORD *)(v10 + 32);
    }
    if (*((_QWORD *)&v23 + 1))
    {
      v19 = sub_23F12545C(&v22, *((uint64_t *)&v23 + 1));
      v25 = v21;
      v20 = MEMORY[0x24BDAC7A8](v19);
      sub_23F25A508(v20, (unint64_t *)&qword_256E091E0);
      sub_23F267EF8();
      sub_23F15EB1C();

      sub_23F15EA4C(v17);
      sub_23F25A594();
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_23F25312C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D00();
  v9[4] = sub_23F25A324;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F25C2D4;
  v9[3] = &unk_250FBC3E0;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_performSetupWithConfigData_reply_, v7, v8);
  _Block_release(v8);

}

void SessionClient.__allocating_init<A>(clientIdentifier:connection:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t);
  uint64_t v6;

  sub_23F25A5A4();
  MEMORY[0x24BDAC7A8](v0);
  v2 = sub_23F25A47C(v1, v6);
  v5(v2, v3, v4);
  SessionClient.__allocating_init<A>(clientIdentifier:connection:configuration:)();
  sub_23F25A3C4();
  sub_23F131680();
}

void SessionClient.__allocating_init<A>(clientIdentifier:connection:configuration:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  sub_23F125F3C();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v12);
  sub_23F126058();
  swift_bridgeObjectRelease();
  v13 = *v8;
  v14 = *((_BYTE *)v8 + 8);
  type metadata accessor for SessionClient.ReverseServer();
  v15 = sub_23F14F4D0();
  sub_23F256730();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v10, v6);
  v19 = v13;
  v20 = v14;
  v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))(v2 + 176);
  v17 = swift_retain();
  v18 = v16(v17, v1, &v19, v6, v4);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v6);
  *(_QWORD *)(v18 + 56) = v15;
  swift_unknownObjectRelease();
  sub_23F125EFC();
}

void SessionClient.__allocating_init<A>(localObject:connection:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void (*v3)(char *);
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  sub_23F25A5A4();
  MEMORY[0x24BDAC7A8](v0);
  v2 = sub_23F25A47C(v1, v6);
  v3(v2);
  v4 = sub_23F25A654();
  v5(v4);
  sub_23F25A3C4();
  sub_23F131680();
}

void SessionClient.__allocating_init<A>(localObject:connection:configuration:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  sub_23F14F4D0();
  v0 = sub_23F25A4EC();
  SessionClient.init<A>(localObject:connection:configuration:)(v0, v1, v2, v3, v4);
  sub_23F131ABC();
}

uint64_t SessionClient.init<A>(localObject:connection:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v6 = v5;
  v11 = *a3;
  v12 = *((_BYTE *)a3 + 8);
  sub_23F267C70();
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  v13 = v5 + 16;
  *(_QWORD *)(v5 + 48) = 0;
  sub_23F150918();
  *(_QWORD *)(v5 + 64) = sub_23F267C64();
  sub_23F267C4C();
  sub_23F150918();
  *(_QWORD *)(v5 + 72) = sub_23F267C40();
  *(_QWORD *)(v5 + 56) = a1;
  *((_QWORD *)&v19 + 1) = a4;
  v20 = a5;
  v14 = sub_23F1BE128((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v14, a2, a4);
  swift_beginAccess();
  v15 = *((_QWORD *)&v19 + 1);
  if (!*(_QWORD *)(v13 + 24))
  {
    if (*((_QWORD *)&v19 + 1))
      goto LABEL_3;
LABEL_5:
    v16 = v19;
    *(_OWORD *)v13 = v18;
    *(_OWORD *)(v13 + 16) = v16;
    *(_QWORD *)(v13 + 32) = v20;
    goto LABEL_6;
  }
  _s16IntelligenceFlow17AnySessionMessageVwxx_0(v13);
  if (!v15)
    goto LABEL_5;
LABEL_3:
  sub_23F14387C(&v18, v13);
LABEL_6:
  swift_endAccess();
  *(_QWORD *)(v6 + 80) = v11;
  *(_BYTE *)(v6 + 88) = v12;
  return v6;
}

uint64_t SessionClient.deinit()
{
  uint64_t v0;

  _s16IntelligenceFlow13SessionClientC40xpcBidirectionalConnectionWasInvalidatedyyF_0();
  if (*(_QWORD *)(v0 + 40))
    _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0 + 16);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SessionClient.__deallocating_deinit()
{
  SessionClient.deinit();
  return swift_deallocClassInstance();
}

void sub_23F2535DC()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  uint64_t v4;

  sub_23F25A384();
  if (*(_QWORD *)(v0 + 40))
  {
    sub_23F1328E8(v0 + 16, (uint64_t)&v2);
  }
  else
  {
    v1 = *(_OWORD *)(v0 + 32);
    v2 = *(_OWORD *)(v0 + 16);
    v3 = v1;
    v4 = *(_QWORD *)(v0 + 48);
  }
  if (*((_QWORD *)&v3 + 1))
  {
    sub_23F12545C(&v2, *((uint64_t *)&v3 + 1));
    sub_23F131B8C();
    sub_23F25A5B0();
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v2);
  }
  else
  {
    __break(1u);
  }
}

void sub_23F253698(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[6];

  v5[4] = a2;
  v5[5] = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_23F264554;
  v5[3] = &unk_250FBC368;
  v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_fetchSessionClientIdWithReply_, v4);
  _Block_release(v4);
}

void sub_23F253734()
{
  sub_23F253848();
}

void sub_23F253750(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v9[4] = sub_23F25A324;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F25C2D4;
  v9[3] = &unk_250FBC340;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_attachAsObserverTo_with_, v7, v8);
  _Block_release(v8);

}

void sub_23F25382C()
{
  sub_23F253848();
}

void sub_23F253848()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  uint64_t v6;

  sub_23F25A384();
  if (*(_QWORD *)(v0 + 40))
    sub_23F25A6D0();
  else
    sub_23F25A6B4();
  if (v6)
  {
    v2 = sub_23F12545C(v5, v6);
    v3 = MEMORY[0x24BDAC7A8](v2);
    sub_23F25A508(v3, (unint64_t *)&qword_256E091E0);
    sub_23F25A55C();
    if (!v1)

    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v5);
    sub_23F1A93B4();
    sub_23F18AB98();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F253924(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v9[4] = sub_23F25A324;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F25C2D4;
  v9[3] = &unk_250FBC2F0;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_detachObservationFrom_with_, v7, v8);
  _Block_release(v8);

}

void sub_23F253A00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
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
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  xpc_object_t empty;
  _QWORD *v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  sub_23F131874();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  sub_23F1217E8(&qword_256E08A80);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v11);
  sub_23F1262C8();
  v14 = v13 - v12;
  v15 = (int *)type metadata accessor for SessionConfiguration(0);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v16);
  sub_23F1262C8();
  v19 = v18 - v17;
  sub_23F258098(v4, v14, &qword_256E08A80);
  v35[2] = v10;
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v14, 1, (uint64_t)v15) == 1)
  {
    *(_BYTE *)v19 = 4;
    *(_QWORD *)(v19 + 8) = 0;
    *(_QWORD *)(v19 + 16) = 0;
    *(_BYTE *)(v19 + 24) = 2;
    v20 = v19 + v15[8];
    v21 = type metadata accessor for LocaleSettings(0);
    sub_23F126158(v20, v22, v23, v21);
    *(_BYTE *)(v19 + v15[9]) = 2;
    v24 = v19 + v15[10];
    *(_BYTE *)(v24 + 2) = 0;
    *(_WORD *)v24 = 512;
    *(_QWORD *)(v19 + v15[11]) = 0;
    v25 = v19 + v15[12];
    *(_QWORD *)v25 = 0;
    *(_QWORD *)(v25 + 8) = 0;
    *(_DWORD *)(v25 + 16) = 0;
    sub_23F125E40(v14, &qword_256E08A80);
  }
  else
  {
    sub_23F2569C0(v14, v19);
  }
  if (v6)
    v27 = v8;
  else
    v27 = 0;
  if (v6)
    v28 = v6;
  else
    v28 = 0xE000000000000000;
  sub_23F25A668(&qword_256E08A88, v26, (void (*)(uint64_t))type metadata accessor for SessionConfiguration);
  swift_bridgeObjectRetain();
  v29 = sub_23F267C58();
  if (v1)
  {
    sub_23F125D68(v19, type metadata accessor for SessionConfiguration);
    swift_bridgeObjectRelease();
LABEL_17:
    sub_23F1313FC();
    return;
  }
  v31 = v29;
  v32 = v30;
  v39 = v27;
  empty = xpc_dictionary_create_empty();
  sub_23F186B3C();
  sub_23F25A384();
  if (*(_QWORD *)(v2 + 40))
    sub_23F25A588();
  else
    sub_23F25A49C();
  if (v37)
  {
    v35[0] = v38;
    v34 = sub_23F12545C(&v36, v37);
    v35[1] = v35;
    MEMORY[0x24BDAC7A8](v34);
    v35[-6] = v39;
    v35[-5] = v28;
    v35[-4] = v31;
    v35[-3] = v32;
    v35[-2] = empty;
    sub_23F131B8C();
    sub_23F267EF8();
    sub_23F125D68(v19, type metadata accessor for SessionConfiguration);
    swift_bridgeObjectRelease();
    sub_23F15E76C();
    sub_23F16BDC0();
    sub_23F25A594();
    goto LABEL_17;
  }
  __break(1u);
}

void sub_23F253CA8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v12 = (void *)sub_23F268144();
  v13 = (void *)sub_23F267D00();
  v15[4] = a2;
  v15[5] = a3;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_23F264554;
  v15[3] = &unk_250FBC2A0;
  v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_startSessionWithId_configData_xpcData_with_, v12, v13, a8, v14);
  _Block_release(v14);

}

void sub_23F253D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v14;
  uint64_t v15;
  uint64_t (*v16)();
  _QWORD v17[3];
  uint64_t v18;

  sub_23F131874();
  v12 = *(void **)(v10 + 56);
  if (object_getClass(v12) != (Class)_TtCC16IntelligenceFlow13SessionClient13ReverseServer || v12 == 0)
    goto LABEL_14;
  swift_unknownObjectRetain();
  v16 = sub_23F253F4C();
  sub_23F253FDC();
  sub_23F25A384();
  if (*(_QWORD *)(v10 + 40))
    sub_23F25A588();
  else
    sub_23F25A49C();
  if (!v18)
  {
    __break(1u);
LABEL_14:
    sub_23F25A42C();
    __break(1u);
    return;
  }
  v14 = sub_23F12545C(v17, v18);
  v15 = MEMORY[0x24BDAC7A8](v14);
  sub_23F25A508(v15, (unint64_t *)&qword_256E091E0);
  sub_23F267EF8();
  if (v11)
  {
    sub_23F25A594();
    sub_23F253FDC();
    swift_willThrow();
    sub_23F14E290((uint64_t)v16);
    sub_23F16BDC0();
  }
  else
  {

    sub_23F14E290((uint64_t)v16);
    sub_23F16BDC0();
    sub_23F25A594();
  }
  sub_23F1313FC();
}

uint64_t (*sub_23F253F4C())()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  sub_23F1217E8(&qword_256E09128);
  sub_23F2683D8();
  if (!v2)
    return 0;
  v0 = sub_23F14F4D0();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 24) = v3;
  return sub_23F25A17C;
}

void sub_23F253FDC()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F25A600();
  v4 = (_QWORD *)sub_23F14F4D0();
  v4[2] = v0;
  v4[3] = v3;
  v4[4] = v2;
  v5 = sub_23F14F4D0();
  *(_QWORD *)(v5 + 16) = sub_23F25A1CC;
  *(_QWORD *)(v5 + 24) = v4;
  sub_23F25A57C((uint64_t)sub_23F2558A4, MEMORY[0x24BDAC760], 1107296256, v7, v8);
  sub_23F25A5F0();
  sub_23F14E280(v3);
  sub_23F1319F8();
  sub_23F25A630();
  sub_23F25A614(v1);
  sub_23F25A6C8();
  v6 = sub_23F25A570();
  sub_23F25A59C();
  swift_release();
  if ((v6 & 1) != 0)
    __break(1u);
  else
    sub_23F25A4C8();
}

void sub_23F2540CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  id v13;
  void *v14;
  _QWORD v15[6];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  if (a4)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a4;
    *(_QWORD *)(v11 + 24) = a5;
    v12 = sub_23F25A17C;
  }
  else
  {
    v12 = 0;
  }
  swift_retain();
  sub_23F14E280(a4);
  sub_23F14E290((uint64_t)v12);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a4 != 0);
  v15[4] = sub_23F25A324;
  v15[5] = v10;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_23F25C2D4;
  v15[3] = &unk_250FBC188;
  v14 = _Block_copy(v15);
  swift_release();
  objc_msgSend(a1, sel_updateTransactionHookAttachmentStatus_with_, v13, v14);
  _Block_release(v14);

}

void sub_23F254220()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  uint64_t v6;

  sub_23F25A384();
  if (*(_QWORD *)(v0 + 40))
    sub_23F25A6D0();
  else
    sub_23F25A6B4();
  if (v6)
  {
    v2 = sub_23F12545C(v5, v6);
    v3 = MEMORY[0x24BDAC7A8](v2);
    sub_23F25A508(v3, (unint64_t *)&qword_256E091E0);
    sub_23F25A55C();
    if (!v1)

    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v5);
    sub_23F1A93B4();
    sub_23F18AB98();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F254300(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v8 = (void *)sub_23F268270();
  v10[4] = sub_23F25A324;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23F25C2D4;
  v10[3] = &unk_250FBC138;
  v9 = _Block_copy(v10);
  swift_release();
  objc_msgSend(a1, sel_postTransactionWithSessionId_eventProtos_with_, v7, v8, v9);
  _Block_release(v9);

}

void sub_23F2543FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t v21;

  sub_23F131874();
  v5 = v4;
  v7 = v6;
  sub_23F1217E8(&qword_256E08A80);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v8);
  sub_23F15E660();
  v9 = (int *)type metadata accessor for SessionConfiguration(0);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v10);
  sub_23F15E50C();
  sub_23F258098(v5, v3, &qword_256E08A80);
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v3, 1, (uint64_t)v9) == 1)
  {
    *(_BYTE *)v2 = 4;
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_BYTE *)(v2 + 24) = 2;
    v11 = v2 + v9[8];
    v12 = type metadata accessor for LocaleSettings(0);
    sub_23F126158(v11, v13, v14, v12);
    *(_BYTE *)(v2 + v9[9]) = 2;
    v15 = v2 + v9[10];
    *(_BYTE *)(v15 + 2) = 0;
    *(_WORD *)v15 = 512;
    *(_QWORD *)(v2 + v9[11]) = 0;
    v16 = v2 + v9[12];
    *(_QWORD *)v16 = 0;
    *(_QWORD *)(v16 + 8) = 0;
    *(_DWORD *)(v16 + 16) = 0;
    sub_23F125E40(v3, &qword_256E08A80);
  }
  else
  {
    sub_23F2569C0(v3, v2);
  }
  sub_23F25A668(&qword_256E08A88, v17, (void (*)(uint64_t))type metadata accessor for SessionConfiguration);
  sub_23F267C58();
  if (v1)
  {
    sub_23F125D68(v2, type metadata accessor for SessionConfiguration);
LABEL_11:
    sub_23F1313FC();
    return;
  }
  xpc_dictionary_create_empty();
  sub_23F186B3C();
  sub_23F25A384();
  if (*(_QWORD *)(v0 + 40))
    sub_23F25A588();
  else
    sub_23F25A49C();
  v19[2] = v7;
  if (v21)
  {
    v18 = sub_23F12545C(&v20, v21);
    v19[1] = v19;
    MEMORY[0x24BDAC7A8](v18);
    sub_23F131B8C();
    sub_23F267EF8();
    sub_23F125D68(v2, type metadata accessor for SessionConfiguration);
    sub_23F15E76C();
    swift_unknownObjectRelease();
    sub_23F25A594();
    goto LABEL_11;
  }
  __break(1u);
}

void sub_23F254660(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v11 = (void *)sub_23F268270();
  v12 = (void *)sub_23F267D00();
  v14[4] = a2;
  v14[5] = a3;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_23F264554;
  v14[3] = &unk_250FBC0E8;
  v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_createSessionFromProtoEventsWithEventProtos_configData_xpcData_with_, v11, v12, a7, v13);
  _Block_release(v13);

}

void sub_23F254754()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;

  sub_23F25A384();
  if (*(_QWORD *)(v0 + 40))
  {
    sub_23F1328E8(v0 + 16, (uint64_t)&v6);
  }
  else
  {
    v2 = *(_OWORD *)(v0 + 32);
    v6 = *(_OWORD *)(v0 + 16);
    v7 = v2;
    v8 = *(_QWORD *)(v0 + 48);
  }
  if (*((_QWORD *)&v7 + 1))
  {
    v3 = sub_23F12545C(&v6, *((uint64_t *)&v7 + 1));
    v4 = MEMORY[0x24BDAC7A8](v3);
    sub_23F25A508(v4, (unint64_t *)&qword_256E091E0);
    sub_23F25A5B0();
    if (v1)
    {
      sub_23F25A5E8();
    }
    else
    {
      v5 = v9;
      sub_23F25A5E8();
      objc_msgSend(v5, sel_unsignedIntValue);

    }
    sub_23F1A93B4();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F254874(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v9[4] = sub_23F25A324;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F25C2D4;
  v9[3] = &unk_250FBC0C0;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_generateStatementIdWithId_with_, v7, v8);
  _Block_release(v8);

}

void sub_23F254950()
{
  sub_23F253848();
}

void sub_23F25496C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v9[4] = sub_23F25A324;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F25C2D4;
  v9[3] = &unk_250FBC070;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_endSessionWithId_with_, v7, v8);
  _Block_release(v8);

}

void sub_23F254A48()
{
  uint64_t v0;

  sub_23F254A74();
  if (!v0)
    swift_bridgeObjectRelease();
}

void sub_23F254A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  __int128 v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v2 = v0;
  type metadata accessor for SessionClientMessage(0);
  sub_23F25A668(&qword_256E08A90, v3, (void (*)(uint64_t))type metadata accessor for SessionClientMessage);
  sub_23F267C58();
  if (v1)
    goto LABEL_7;
  v4 = (__int128 *)(v0 + 16);
  sub_23F25A384();
  if (*(_QWORD *)(v2 + 40))
  {
    sub_23F1328E8(v2 + 16, (uint64_t)&v8);
  }
  else
  {
    v5 = *(_OWORD *)(v2 + 32);
    v8 = *v4;
    v9 = v5;
    v10 = *(_QWORD *)(v2 + 48);
  }
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = sub_23F12545C(&v8, *((uint64_t *)&v9 + 1));
    MEMORY[0x24BDAC7A8](v6);
    sub_23F267EF8();
    sub_23F25A5E8();
    sub_23F1217E8(&qword_256E08A98);
    sub_23F256A38();
    sub_23F267C34();
    sub_23F25A69C();
    sub_23F15EA4C(v7);
LABEL_7:
    sub_23F1A93B4();
    return;
  }
  __break(1u);
}

void sub_23F254C20(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D00();
  v9[4] = sub_23F15084C;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F264498;
  v9[3] = &unk_250FBC020;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_sendWithMessageData_with_, v7, v8);
  _Block_release(v8);

}

void sub_23F254D08()
{
  sub_23F254DEC((void (*)(_QWORD))type metadata accessor for EventsSubscription);
}

uint64_t sub_23F254D30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8[2];

  v3 = v1;
  sub_23F1328E8(a1, (uint64_t)v8);
  sub_23F254D08();
  if (v2)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v8);
  }
  else
  {
    v5 = v4;
    type metadata accessor for SessionDebuggerEventsSubscription();
    sub_23F14F4D0();
    sub_23F132770(v3, v8, v5);
    v2 = v6;
    swift_retain();
  }
  return v2;
}

void sub_23F254DC4()
{
  sub_23F254DEC((void (*)(_QWORD))type metadata accessor for ThrowingEventsSubscription);
}

void sub_23F254DEC(void (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v3 = v1;
  v4 = *(void **)(v1 + 56);
  if (object_getClass(v4) != (Class)_TtCC16IntelligenceFlow13SessionClient13ReverseServer || v4 == 0)
  {
    sub_23F25A42C();
    __break(1u);
  }
  else
  {
    swift_unknownObjectRetain();
    sub_23F254EA4(v3, a1);
    swift_unknownObjectRelease();
    sub_23F25A540();
  }
}

uint64_t sub_23F254EA4(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  a2(0);
  result = sub_23F2683D8();
  if (!v2)
    return v4;
  return result;
}

uint64_t _s16IntelligenceFlow13SessionClientC40xpcBidirectionalConnectionWasInvalidatedyyF_0()
{
  void *v0;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_23F25A57C((uint64_t)sub_23F25C2D4, MEMORY[0x24BDAC760], 1107296256, v2, v3);
  objc_msgSend((id)swift_unknownObjectRetain(), sel_connectionClosedWith_, v0);
  _Block_release(v0);
  return swift_unknownObjectRelease();
}

uint64_t sub_23F254F94()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_23F254FA0()
{
  type metadata accessor for SessionClient();
  return sub_23F267EEC();
}

uint64_t sub_23F254FE0(uint64_t a1)
{
  MEMORY[0x242667160](&unk_23F290EC8, a1);
  return sub_23F146C04();
}

void IntelligenceFlowClient.__allocating_init(localObject:configuration:)()
{
  sub_23F25A3D4();
  sub_23F25A450();
  IntelligenceFlowClient.init(localObject:configuration:)();
  sub_23F25A4E0();
}

void IntelligenceFlowClient.init(localObject:configuration:)()
{
  SessionClient.init(localObject:configuration:)();
  sub_23F25A688();
}

void IntelligenceFlowClient.__allocating_init<A>(localObject:connection:configuration:)()
{
  sub_23F14F4D0();
  sub_23F25A4EC();
  IntelligenceFlowClient.init<A>(localObject:connection:configuration:)();
  sub_23F131ABC();
}

void IntelligenceFlowClient.init<A>(localObject:connection:configuration:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F125F3C();
  v2 = *(_QWORD *)(v1 - 8);
  sub_23F25A5A4();
  MEMORY[0x24BDAC7A8](v3);
  sub_23F126058();
  (*(void (**)(uint64_t))(v2 + 16))(v0);
  v4 = sub_23F25A654();
  SessionClient.init<A>(localObject:connection:configuration:)(v4, v5, v6, v7, v8);
  sub_23F25A3C4();
  sub_23F125EFC();
}

uint64_t IntelligenceFlowClient.__deallocating_deinit()
{
  SessionClient.deinit();
  return swift_deallocClassInstance();
}

void sub_23F255168(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void *v5;

  sub_23F2551D0();
  sub_23F146B20(0, (unint64_t *)&qword_256E091E0);
  v5 = (void *)sub_23F26842C();
  ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, v5, 0);

  _Block_release(a4);
}

void sub_23F2551D0()
{
  uint64_t v0;
  NSObject *v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F25A600();
  v4 = (_QWORD *)sub_23F14F4D0();
  v4[2] = v0;
  v4[3] = v3;
  v4[4] = v2;
  v5 = sub_23F14F4D0();
  *(_QWORD *)(v5 + 16) = sub_23F25813C;
  *(_QWORD *)(v5 + 24) = v4;
  sub_23F25A57C((uint64_t)sub_23F2558A4, MEMORY[0x24BDAC760], 1107296256, v7, v8);
  sub_23F25A5F0();
  sub_23F131170(v3, v2);
  sub_23F1319F8();
  sub_23F25A630();
  sub_23F25A614(v1);
  sub_23F25A6C8();
  v6 = sub_23F25A570();
  sub_23F25A59C();
  swift_release();
  if ((v6 & 1) != 0)
    __break(1u);
  else
    sub_23F25A4C8();
}

void sub_23F255354(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  os_unfair_lock_s *v20;
  os_unfair_lock_s *v21;
  os_unfair_lock_s *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v37 = a2;
  v38 = a3;
  v4 = sub_23F267FDC();
  v5 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  v36 = (char *)v5;
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_23F1217E8(&qword_256E090F8);
  v39 = *(_QWORD *)(v6 - 8);
  v40 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v34 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_23F1217E8(&qword_256E01198);
  v8 = *(_QWORD *)(v41 - 8);
  v9 = MEMORY[0x24BDAC7A8](v41);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v34 - v12;
  v14 = type metadata accessor for SessionServerMessage(0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v34 - v18;
  v20 = *(os_unfair_lock_s **)(a1 + 32);
  v21 = v20 + 4;
  v22 = v20 + 6;
  os_unfair_lock_lock(v20 + 6);
  sub_23F2557BC(v21, a1);
  os_unfair_lock_unlock(v22);
  sub_23F25697C(&qword_256E09100, 255, (void (*)(uint64_t))type metadata accessor for SessionServerMessage);
  sub_23F267C34();
  v23 = v8;
  v36 = v19;
  v24 = v41;
  v25 = v34;
  swift_beginAccess();
  v26 = *(_QWORD *)(a1 + 24);
  v27 = *(_QWORD *)(v26 + 16);
  if (v27)
  {
    v38 = &v13[*(int *)(v24 + 48)];
    v28 = v26 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v37 = *(_QWORD *)(v23 + 72);
    v35 = v26;
    swift_bridgeObjectRetain();
    v29 = v25;
    v30 = (uint64_t)v36;
    do
    {
      sub_23F258098(v28, (uint64_t)v13, &qword_256E01198);
      v31 = &v11[*(int *)(v41 + 48)];
      v32 = sub_23F267D84();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v11, v13, v32);
      v33 = sub_23F1217E8(&qword_256E08A48);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v38, v33);
      sub_23F258554(v30, (uint64_t)v17);
      sub_23F2682F4();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v40);
      sub_23F125E40((uint64_t)v11, &qword_256E01198);
      v28 += v37;
      --v27;
    }
    while (v27);
    swift_bridgeObjectRelease();
  }
  sub_23F125D68((uint64_t)v36, type metadata accessor for SessionServerMessage);
}

void sub_23F2557BC(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];

  v7[2] = a1;
  v4 = (uint64_t *)(a2 + 24);
  swift_beginAccess();
  sub_23F259B90(v4, (uint64_t (*)(unint64_t, unint64_t))sub_23F258598, (uint64_t)v7);
  v6 = *(_QWORD *)(*(_QWORD *)(a2 + 24) + 16);
  if (v6 < v5)
  {
    __break(1u);
  }
  else
  {
    sub_23F259E7C(v5, v6);
    swift_endAccess();
    swift_bridgeObjectRelease();
    *a1 = MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_23F255860(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = *a3;
  swift_bridgeObjectRetain();
  LOBYTE(a1) = sub_23F252660(a1, v4);
  swift_bridgeObjectRelease();
  return a1 & 1;
}

uint64_t sub_23F2558A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_23F2558C4(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = *(NSObject **)(a1 + 16);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_23F25808C;
  *(_QWORD *)(v5 + 24) = a1;
  v8[4] = sub_23F25A24C;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_23F2558A4;
  v8[3] = &unk_250FBBE68;
  v6 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v6);
  _Block_release(v6);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_23F146B20(0, (unint64_t *)&qword_256E091E0);
    v7 = (void *)sub_23F268438();
    ((void (**)(_QWORD, void *, _QWORD))a2)[2](a2, v7, 0);
    swift_release();

    _Block_release(a2);
  }
}

uint64_t sub_23F255A1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v2 = sub_23F1217E8(&qword_256E01198);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - v7;
  *(_BYTE *)(a1 + 40) = 1;
  v9 = (_QWORD *)(a1 + 24);
  swift_beginAccess();
  v10 = *(_QWORD *)(a1 + 24);
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v19 = *(_QWORD *)(a1 + 24);
    v20 = (_QWORD *)(a1 + 24);
    v12 = &v8[*(int *)(v2 + 48)];
    v13 = v10 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v14 = *(_QWORD *)(v3 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_23F258098(v13, (uint64_t)v8, &qword_256E01198);
      v15 = &v6[*(int *)(v2 + 48)];
      v16 = sub_23F267D84();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v6, v8, v16);
      v17 = sub_23F1217E8(&qword_256E08A48);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v12, v17);
      sub_23F2580D8();
      v21 = swift_allocError();
      sub_23F268300();
      sub_23F125E40((uint64_t)v6, &qword_256E01198);
      v13 += v14;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    v9 = v20;
  }
  *v9 = MEMORY[0x24BEE4AF8];
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F255C1C()
{
  uint64_t v0;
  uint64_t v1;
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
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[16];
  uint64_t v23;
  uint64_t v24;

  sub_23F125F3C();
  v23 = v1;
  v24 = v2;
  v3 = v0;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = sub_23F131B8C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v21 = *(NSObject **)(v3 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v11, v12);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v3;
  *(_QWORD *)(v16 + 24) = v9;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v16 + v15, (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
  v17 = (_QWORD *)(v16 + ((v14 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v17 = v7;
  v17[1] = v5;
  v18 = sub_23F14F4D0();
  *(_QWORD *)(v18 + 16) = sub_23F258010;
  *(_QWORD *)(v18 + 24) = v16;
  v22[4] = sub_23F258058;
  v22[5] = v18;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 1107296256;
  v22[2] = sub_23F2558A4;
  v22[3] = &unk_250FBBE18;
  _Block_copy(v22);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23F131C14();
  swift_retain();
  sub_23F25A630();
  sub_23F25A614(v21);
  sub_23F25A6C8();
  LOBYTE(v5) = sub_23F25A570();
  swift_release();
  result = swift_release();
  if ((v5 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_23F255DD0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t, uint64_t *);
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v17;
  uint64_t v18;

  v8 = sub_23F267FDC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(uint64_t, uint64_t *))(a1 + 56);
  if (v12)
  {
    v18 = a2;
    sub_23F14E280((uint64_t)v12);
    swift_bridgeObjectRetain();
    v12(a3, &v18);
    a4(v18, 0);
    sub_23F14E290((uint64_t)v12);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_23F267E20();
    v13 = sub_23F267FD0();
    v14 = sub_23F26839C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23F11F000, v13, v14, "Unexpected execution of transaction hook from Server. This should not happen and may have performance impact. Responding with no changes to the transaction.", v15, 2u);
      MEMORY[0x242667238](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return ((uint64_t (*)(uint64_t, _QWORD))a4)(a2, 0);
  }
}

void sub_23F2560BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  if (!a1)
  {
    v5 = 0;
    if (a2)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = (void *)sub_23F268270();
  if (!a2)
    goto LABEL_5;
LABEL_3:
  v6 = sub_23F267CA0();
LABEL_6:
  v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

uint64_t sub_23F25613C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 64) = a3;
  sub_23F14E280(a2);
  return sub_23F14E290(v3);
}

uint64_t sub_23F256170@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_23F25A250;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_23F14E280(v3);
}

void sub_23F2561E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(_QWORD);
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;

  sub_23F131874();
  v54 = v3;
  v51 = v4;
  v52 = v5;
  v7 = v6;
  v60 = v8;
  v61 = v0;
  v57 = v9;
  v11 = v10;
  v53 = sub_23F1217E8(&qword_256E01198);
  v59 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  sub_23F125F70();
  v58 = v12;
  v13 = sub_23F1217E8(&qword_256E09118);
  v14 = *(_QWORD *)(v13 - 8);
  sub_23F25A5A4();
  MEMORY[0x24BDAC7A8](v15);
  sub_23F15E660();
  v63 = sub_23F1217E8(&qword_256E08A48);
  v56 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  sub_23F125F70();
  v65 = v16;
  v55 = sub_23F1217E8(qword_256DFEB78);
  v62 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  sub_23F25A510();
  MEMORY[0x24BDAC7A8](v17);
  v64 = (char *)&v45 - v18;
  v19 = sub_23F131B8C();
  v20 = *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  if ((*(_BYTE *)(v11 + 40) & 1) != 0)
  {
    sub_23F2580D8();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    v49 = v23;
    v45 = v7;
    v26 = v25;
    v46 = v1;
    v27 = (char *)&v45 - v24;
    v50 = (char *)&v45 - v24;
    sub_23F267D78();
    type metadata accessor for SessionServerMessage(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v2, *MEMORY[0x24BEE6CA0], v13);
    sub_23F2682DC();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v2, v13);
    v28 = *(_QWORD *)(v11 + 32);
    v47 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
    v29 = v27;
    v30 = v49;
    v47(v22, v29, v49);
    v31 = *(unsigned __int8 *)(v26 + 80);
    v48 = v26;
    v32 = (v31 + 24) & ~v31;
    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = v28;
    v34 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v33 + v32, v22, v30);
    sub_23F1319F8();
    sub_23F2682E8();
    v35 = v62;
    v36 = v46;
    v37 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(v62 + 16))(v46, v64, v55);
    v52(0);
    v38 = sub_23F150918();
    *(_QWORD *)(v38 + 16) = v57;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v38 + *v54, v36, v37);
    v39 = v58;
    v40 = v58 + *(int *)(v53 + 48);
    v47((char *)v58, v50, v34);
    v41 = v56;
    v42 = v63;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16))(v40, v65, v63);
    sub_23F25A690();
    swift_retain();
    sub_23F258158((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23F186FCC);
    v43 = *(_QWORD *)(*(_QWORD *)(v11 + 24) + 16);
    sub_23F2581B0(v43, (uint64_t (*)(BOOL))sub_23F186FCC);
    v44 = *(_QWORD *)(v11 + 24);
    *(_QWORD *)(v44 + 16) = v43 + 1;
    sub_23F25A05C(v39, v44+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(_QWORD *)(v59 + 72) * v43);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v65, v42);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v37);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v49);
    *v60 = v38;
  }
  sub_23F1313FC();
}

void sub_23F2565D4(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  uint64_t v4;
  os_unfair_lock_s *v5;

  v4 = (uint64_t)&a2[4];
  v5 = a2 + 6;
  os_unfair_lock_lock(a2 + 6);
  sub_23F256624(v4, a3);
  os_unfair_lock_unlock(v5);
}

void sub_23F256624(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = sub_23F131B8C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  sub_23F25A510();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v9 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v2, a2, v4);
  sub_23F258CA0((uint64_t)v8, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_23F1A93B4();
}

uint64_t sub_23F2566D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_23F14E290(*(_QWORD *)(v0 + 56));
  return v0;
}

uint64_t sub_23F256710()
{
  sub_23F2566D4();
  return swift_deallocClassInstance();
}

void sub_23F256730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_23F125F3C();
  v1 = sub_23F2683CC();
  v2 = *(_QWORD *)(v1 - 8);
  sub_23F25A5A4();
  MEMORY[0x24BDAC7A8](v3);
  sub_23F1262C8();
  v6 = v5 - v4;
  sub_23F2683C0();
  v7 = (void (*)(uint64_t))MEMORY[0x24BEE5688];
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v8);
  sub_23F15E50C();
  sub_23F2680F0();
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v9);
  sub_23F126058();
  sub_23F146B20(0, &qword_256E09130);
  sub_23F2680E4();
  sub_23F25697C(&qword_256E09138, 255, v7);
  sub_23F1217E8(&qword_256E09140);
  sub_23F25A218(&qword_256E09148, &qword_256E09140);
  sub_23F268498();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v6, *MEMORY[0x24BEE5750], v1);
  *(_QWORD *)(v0 + 16) = sub_23F2683E4();
  *(_QWORD *)(v0 + 24) = MEMORY[0x24BEE4AF8];
  sub_23F1217E8(&qword_256E09150);
  v10 = sub_23F14F4D0();
  *(_DWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v0 + 32) = v10;
  *(_BYTE *)(v0 + 40) = 0;
  sub_23F267C4C();
  sub_23F150918();
  v11 = sub_23F267C40();
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 48) = v11;
  sub_23F125EFC();
}

uint64_t type metadata accessor for SessionClient()
{
  return objc_opt_self();
}

unint64_t sub_23F256928()
{
  unint64_t result;

  result = qword_256E08A78;
  if (!qword_256E08A78)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for SessionClientConfiguration, &type metadata for SessionClientConfiguration);
    atomic_store(result, (unint64_t *)&qword_256E08A78);
  }
  return result;
}

void sub_23F256964(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F25312C(a1, a2, a3);
}

void sub_23F25696C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F253750(a1, a2, a3);
}

void sub_23F256974(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F253924(a1, a2, a3);
}

void sub_23F25697C(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t))
{
  if (!*a1)
  {
    a3(a2);
    sub_23F18AD90();
  }
  sub_23F126078();
}

void sub_23F2569B0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  sub_23F253CA8(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_23F2569C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SessionConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23F256A04(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F2540CC(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

void sub_23F256A0C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F254300(a1, a2, a3);
}

void sub_23F256A14(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  sub_23F254660(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

void sub_23F256A20(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F254874(a1, a2, a3);
}

void sub_23F256A28(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F25496C(a1, a2, a3);
}

void sub_23F256A30(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F254C20(a1, a2, a3);
}

unint64_t sub_23F256A38()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256E08AA0;
  if (!qword_256E08AA0)
  {
    v1 = sub_23F125540(&qword_256E08A98);
    sub_23F25697C(&qword_256DFEF20, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    v3 = v2;
    result = MEMORY[0x242667160](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256E08AA0);
  }
  return result;
}

uint64_t static SessionClientError.== infix(_:_:)()
{
  return 1;
}

void SessionClientError.hash(into:)()
{
  sub_23F268840();
  sub_23F126078();
}

uint64_t SessionClientError.hashValue.getter()
{
  sub_23F268834();
  sub_23F268840();
  return sub_23F268864();
}

uint64_t sub_23F256B20()
{
  return SessionClientError.hashValue.getter();
}

void sub_23F256B34()
{
  SessionClientError.hash(into:)();
}

Swift::String __swiftcall String.escapedForIntelligenceFlowPrescribedPlanStringLiteral()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  sub_23F256C04();
  sub_23F25A410();
  v0 = sub_23F25A410();
  v2 = v1;
  swift_bridgeObjectRelease();
  v3 = v0;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

unint64_t sub_23F256C04()
{
  unint64_t result;

  result = qword_2543444C8;
  if (!qword_2543444C8)
  {
    result = MEMORY[0x242667160](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2543444C8);
  }
  return result;
}

void *sub_23F256C40()
{
  qword_256E08A18 = (uint64_t)&unk_256E63108;
  return &unk_256E63108;
}

id static SessionXPCClientService.interface.getter()
{
  return sub_23F256C70(&qword_256DFE4F0, (id *)&qword_256E08A18);
}

id sub_23F256C70(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    sub_23F25A638();
  return *a2;
}

unint64_t static SessionXPCClientService.serviceName.getter()
{
  return sub_23F25A52C();
}

void sub_23F256CB0()
{
  qword_256E08A20 = MEMORY[0x24BEE4AF8];
}

uint64_t static SessionXPCClientService.selectorClasses.getter()
{
  return sub_23F256CE0(&qword_256DFE4F8);
}

uint64_t sub_23F256CE0(_QWORD *a1)
{
  if (*a1 != -1)
    sub_23F25A638();
  return swift_bridgeObjectRetain();
}

void sub_23F256D14(uint64_t a1)
{
  sub_23F256D20(a1, qword_256E08A28);
}

void sub_23F256D20(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23F267FDC();
  sub_23F1470EC(v3, a2);
  sub_23F146E30(v3, (uint64_t)a2);
  sub_23F267E20();
  sub_23F126078();
}

uint64_t static SessionXPCClientService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23F256D7C(&qword_256DFE500, (uint64_t)qword_256E08A28, a1);
}

uint64_t sub_23F256D7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    sub_23F25A638();
  v5 = sub_23F267FDC();
  v6 = sub_23F146E30(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

unint64_t sub_23F256DE4()
{
  static SessionXPCClientService.serviceName.getter();
  return 0xD000000000000027;
}

void SessionReverseClient.__allocating_init(existingConnection:localObject:)()
{
  sub_23F14F4D0();
  sub_23F25A450();
  SessionReverseClient.init(existingConnection:localObject:)();
  sub_23F25A4E0();
}

uint64_t SessionReverseClient.init(existingConnection:localObject:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F267C70();
  sub_23F150918();
  *(_QWORD *)(v0 + 16) = sub_23F267C64();
  *(_QWORD *)(v0 + 24) = 0;
  sub_23F25697C(&qword_256E08AA8, v2, (void (*)(uint64_t))type metadata accessor for SessionReverseClient);
  sub_23F1217E8((uint64_t *)&unk_256E08AB0);
  sub_23F150918();
  sub_23F131C14();
  v3 = sub_23F267F04();
  if (!v1)
    *(_QWORD *)(v0 + 24) = v3;
  swift_release();
  return v0;
}

uint64_t type metadata accessor for SessionReverseClient()
{
  return objc_opt_self();
}

uint64_t sub_23F256F30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return sub_23F14F4C4();
}

uint64_t sub_23F256F40()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  type metadata accessor for SessionServerMessage(0);
  sub_23F25697C(qword_256E08AC0, 255, (void (*)(uint64_t))type metadata accessor for SessionServerMessage);
  result = sub_23F267C58();
  v0[5] = result;
  v0[6] = v2;
  v3 = *(_QWORD *)(v0[4] + 24);
  v0[7] = v3;
  if (v3)
  {
    v4 = result;
    v5 = v2;
    v6 = swift_task_alloc();
    v0[8] = v6;
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    sub_23F1319F8();
    v7 = (_QWORD *)swift_task_alloc();
    v0[9] = v7;
    sub_23F146B20(0, (unint64_t *)&qword_256E091E0);
    *v7 = v0;
    v7[1] = sub_23F257074;
    return sub_23F267F1C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23F257074()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {

    sub_23F25A59C();
    sub_23F131780();
  }
  return swift_task_switch();
}

uint64_t sub_23F2570F4()
{
  uint64_t v0;

  sub_23F1311B4(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return sub_23F13182C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23F257120()
{
  uint64_t v0;

  sub_23F1311B4(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  sub_23F25A59C();
  sub_23F131780();
  return sub_23F25A378(*(uint64_t (**)(void))(v0 + 8));
}

void sub_23F257158(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D00();
  v9[4] = sub_23F25A014;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F25C2D4;
  v9[3] = &unk_250FBBF80;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_sendWithMessageData_with_, v7, v8);
  _Block_release(v8);

}

void sub_23F257240(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F257158(a1, a2, a3);
}

uint64_t sub_23F257248(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return sub_23F14F4C4();
}

void sub_23F25725C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 24);
  *(_QWORD *)(v0 + 48) = v1;
  if (v1)
  {
    v2 = swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v2;
    *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
    sub_23F1319F8();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v3;
    sub_23F1217E8(&qword_256E018C8);
    *v3 = v0;
    v3[1] = sub_23F257308;
    sub_23F267F1C();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23F257308()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    sub_23F131780();
  }
  return sub_23F131838();
}

uint64_t sub_23F257370()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23F25737C()
{
  uint64_t v0;

  swift_release();
  sub_23F131780();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23F2573B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v8 = (void *)sub_23F268270();
  v10[4] = sub_23F259FE4;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23F2574B8;
  v10[3] = &unk_250FBBF30;
  v9 = _Block_copy(v10);
  swift_release();
  objc_msgSend(a1, sel_runTransactionHookWithSessionId_transaction_with_, v7, v8, v9);
  _Block_release(v9);

}

void sub_23F2574B0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F2573B4(a1, a2, a3);
}

uint64_t sub_23F2574B8(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_23F26827C();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t SessionReverseClient.deinit()
{
  uint64_t v0;

  sub_23F25A448();
  swift_release();
  return v0;
}

uint64_t SessionReverseClient.__deallocating_deinit()
{
  SessionReverseClient.deinit();
  return swift_deallocClassInstance();
}

void sub_23F257578(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  SessionReverseClient.__allocating_init(existingConnection:localObject:)();
  if (!v1)
    *a1 = v3;
}

uint64_t sub_23F2575A0()
{
  type metadata accessor for SessionReverseClient();
  return sub_23F267EEC();
}

uint64_t sub_23F2575E0()
{
  return sub_23F267F34();
}

uint64_t static SessionXPCDictionaryKeys.identityTokenKey.getter()
{
  return 0x797469746E656469;
}

void sub_23F25761C()
{
  sub_23F25697C(&qword_256E08AE0, 255, (void (*)(uint64_t))type metadata accessor for EventsSubscription.Iterator);
}

uint64_t type metadata accessor for EventsSubscription.Iterator(uint64_t a1)
{
  return sub_23F12EDBC(a1, qword_256E08C28);
}

void sub_23F257660()
{
  sub_23F25A218(&qword_256E08AE8, &qword_256DFEB68);
}

void sub_23F25768C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_23F25697C(&qword_256E08A60, a2, (void (*)(uint64_t))type metadata accessor for SessionClient);
  *(_QWORD *)(a1 + 8) = v3;
}

void sub_23F2576C8()
{
  sub_23F25697C(&qword_256DFF148, 255, MEMORY[0x24BE797D0]);
}

unint64_t sub_23F2576FC()
{
  unint64_t result;

  result = qword_256E08AF0;
  if (!qword_256E08AF0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for SessionClientError, &type metadata for SessionClientError);
    atomic_store(result, (unint64_t *)&qword_256E08AF0);
  }
  return result;
}

unint64_t sub_23F25773C()
{
  unint64_t result;

  result = qword_254344338[0];
  if (!qword_254344338[0])
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for SessionXPCServerService, &type metadata for SessionXPCServerService);
    atomic_store(result, qword_254344338);
  }
  return result;
}

void type metadata accessor for SessionXPCServerService()
{
  sub_23F131844();
}

uint64_t sub_23F257784()
{
  return type metadata accessor for EventsSubscription(0);
}

uint64_t type metadata accessor for EventsSubscription(uint64_t a1)
{
  return sub_23F12EDBC(a1, (uint64_t *)&unk_256E08B20);
}

uint64_t method lookup function for EventsSubscription()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EventsSubscription.__allocating_init(continuation:stream:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of EventsSubscription.__allocating_init(stream:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of EventsSubscription.makeAsyncIterator()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t initializeBufferWithCopyOfBuffer for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256DFEB68);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for EventsSubscription.Iterator(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23F1217E8(&qword_256DFEB68);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256DFEB68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256DFEB68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256DFEB68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256DFEB68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EventsSubscription.Iterator()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F257970(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256DFEB68);
  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for EventsSubscription.Iterator()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F2579B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256DFEB68);
  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(a1, a2, a2, v4);
}

void sub_23F2579F0()
{
  unint64_t v0;

  sub_23F257A68(319, qword_256DFEEC8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE6D08]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23F257A68(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = type metadata accessor for SessionServerMessage(255);
    v7 = sub_23F125540(&qword_256DFEB10);
    v8 = a3(a1, v6, v7, MEMORY[0x24BEE3F20]);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_23F257ADC()
{
  return type metadata accessor for ThrowingEventsSubscription(0);
}

uint64_t type metadata accessor for ThrowingEventsSubscription(uint64_t a1)
{
  return sub_23F12EDBC(a1, qword_256E08C88);
}

void sub_23F257AF8()
{
  unint64_t v0;

  sub_23F257A68(319, qword_256E08B30, MEMORY[0x24BEE6D28]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ThrowingEventsSubscription()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ThrowingEventsSubscription.__allocating_init(stream:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ThrowingEventsSubscription.makeAsyncIterator()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t method lookup function for SessionClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SessionClient.__allocating_init(localObject:configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of SessionClient.__allocating_init<A>(localObject:connection:configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SessionClient.fetchSessionClientId()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SessionClient.attachAsObserver(sessionClientId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SessionClient.detachObservation(sessionClientId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SessionClient.startSession(id:config:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SessionClient.setTransactionPostingHook(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SessionClient.postTransaction(sessionId:events:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of SessionClient.createSessionFromProtos(eventProtos:config:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of SessionClient.generateStatementId(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SessionClient.endSession(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SessionClient.send(message:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of SessionClient.subscribe()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of SessionClient.subscribeWithDebugger(breakpointPredicate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of SessionClient.trySubscribe()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of SessionClient.leakInternallyRetainedReverseServer()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t type metadata accessor for IntelligenceFlowClient()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for SessionClientError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_23F257DC0 + 4 * byte_23F290D80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23F257DE0 + 4 * byte_23F290D85[v4]))();
}

_BYTE *sub_23F257DC0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23F257DE0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F257DE8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F257DF0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23F257DF8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23F257E00(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for SessionClientError()
{
  sub_23F131844();
}

void type metadata accessor for SessionXPCClientService()
{
  sub_23F131844();
}

uint64_t method lookup function for SessionReverseClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SessionReverseClient.__allocating_init(existingConnection:localObject:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SessionReverseClient.send(message:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 128) + *(_QWORD *)(*(_QWORD *)v1 + 128));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23F12EE90;
  return v6(a1);
}

uint64_t dispatch thunk of SessionReverseClient.runTransactionHook(sessionId:transaction:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 136) + *(_QWORD *)(*(_QWORD *)v2 + 136));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23F257F1C;
  return v8(a1, a2);
}

uint64_t sub_23F257F1C(uint64_t a1)
{
  uint64_t v1;

  sub_23F131724();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

void type metadata accessor for SessionXPCDictionaryKeys()
{
  sub_23F131844();
}

uint64_t sub_23F257F5C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23F257F80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23F2560BC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_23F257F88()
{
  sub_23F131B8C();
  sub_23F25A448();
  swift_bridgeObjectRelease();
  sub_23F25A5D8();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23F258010()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_23F131B8C() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_23F255DD0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + v2, *(void (**)(uint64_t, _QWORD))(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_23F258058()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  sub_23F126078();
}

uint64_t sub_23F258074(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23F258084()
{
  return swift_release();
}

uint64_t sub_23F25808C()
{
  uint64_t v0;

  return sub_23F255A1C(v0);
}

void sub_23F258098(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_23F1217E8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  sub_23F126078();
}

unint64_t sub_23F2580D8()
{
  unint64_t result;

  result = qword_256E090F0;
  if (!qword_256E090F0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for SessionClientError, &type metadata for SessionClientError);
    atomic_store(result, (unint64_t *)&qword_256E090F0);
  }
  return result;
}

uint64_t sub_23F258114()
{
  uint64_t v0;

  sub_23F25A448();
  sub_23F1311B4(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return swift_deallocObject();
}

void sub_23F25813C()
{
  uint64_t v0;

  sub_23F255354(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(char **)(v0 + 32));
}

void sub_23F25814C()
{
  sub_23F258158((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23F186C94);
}

void sub_23F258158(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t isUniquelyReferenced_nonNull_native;

  v3 = *v1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native)
    *v1 = a1(isUniquelyReferenced_nonNull_native, *(_QWORD *)(v3 + 16) + 1, 1, v3);
  sub_23F12612C();
}

uint64_t sub_23F2581A4(uint64_t a1)
{
  return sub_23F2581B0(a1, (uint64_t (*)(BOOL))sub_23F186C94);
}

uint64_t sub_23F2581B0(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

void sub_23F2581F0(uint64_t a1, uint64_t a2)
{
  sub_23F25847C(a1, a2);
}

char *sub_23F2581FC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_23F25A340();
    result = (char *)sub_23F25A328();
    __break(1u);
  }
  else if (a3 != result || &result[88 * a2] <= a3)
  {
    return (char *)sub_23F25A554(a3, result, 88 * a2);
  }
  return result;
}

char *sub_23F25825C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_23F25A340();
    result = (char *)sub_23F25A328();
    __break(1u);
  }
  else if (a3 != result || &result[120 * a2] <= a3)
  {
    return (char *)sub_23F25A368(a3, result);
  }
  return result;
}

void sub_23F2582B8(uint64_t a1, uint64_t a2)
{
  sub_23F2582DC(a1, a2);
}

void sub_23F2582C4(uint64_t a1, uint64_t a2)
{
  sub_23F25847C(a1, a2);
}

void sub_23F2582D0(uint64_t a1, uint64_t a2)
{
  sub_23F2582DC(a1, a2);
}

void sub_23F2582DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD);
  char v5;
  char v6;

  if (a2 < 0)
  {
    sub_23F25A340();
    sub_23F25A328();
    __break(1u);
  }
  else
  {
    sub_23F25A5C0();
    if (v5 && (v4(0), sub_23F25A61C(), !v6 & v5))
    {
      if (v3 == v2)
      {
        sub_23F250454();
      }
      else
      {
        sub_23F25A390();
        sub_23F25A400();
      }
    }
    else
    {
      v4(0);
      sub_23F25A390();
      sub_23F25A3F0();
    }
  }
}

char *sub_23F258360(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_23F25A340();
    result = (char *)sub_23F25A328();
    __break(1u);
  }
  else if (a3 != result || &result[80 * a2] <= a3)
  {
    return (char *)sub_23F25A368(a3, result);
  }
  return result;
}

char *sub_23F2583B8(char *result, size_t a2, char *a3)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    sub_23F25A340();
    result = (char *)sub_23F25A328();
    __break(1u);
  }
  else if (a3 != result || &result[a2] <= a3)
  {
    return (char *)sub_23F25A554(a3, result, a2);
  }
  return result;
}

char *sub_23F258410(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_23F25A340();
    result = (char *)sub_23F25A328();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)sub_23F25A368(a3, result);
  }
  return result;
}

void sub_23F258470(uint64_t a1, uint64_t a2)
{
  sub_23F25847C(a1, a2);
}

void sub_23F25847C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  char v6;

  if (a2 < 0)
  {
    sub_23F25A340();
    sub_23F25A328();
    __break(1u);
  }
  else
  {
    sub_23F25A5C0();
    if (v5 && (sub_23F1217E8(v4), sub_23F25A61C(), !v6 & v5))
    {
      if (v3 == v2)
      {
        sub_23F250454();
      }
      else
      {
        sub_23F25A390();
        sub_23F25A400();
      }
    }
    else
    {
      sub_23F1217E8(v4);
      sub_23F25A390();
      sub_23F25A3F0();
    }
  }
}

char *sub_23F258500(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_23F25A340();
    result = (char *)sub_23F25A328();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_23F25A368(a3, result);
  }
  return result;
}

uint64_t sub_23F258554(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SessionServerMessage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23F258598(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23F255860(a1, a2, *(uint64_t **)(v2 + 16));
}

uint64_t sub_23F2585A0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_23F1217E8(&qword_256E09158);
  result = sub_23F2684F8();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v7 = (uint64_t *)(v2 + 56);
    v6 = *(_QWORD *)(v2 + 56);
    v8 = 1 << *(_BYTE *)(v2 + 32);
    v27 = -1 << v8;
    v28 = v1;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & v6;
    v29 = 1 << *(_BYTE *)(v2 + 32);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = result + 56;
    if ((v9 & v6) == 0)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v13 | (v5 << 6); ; i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_23F268828();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v15 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v15 >= v11)
        goto LABEL_32;
      v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        v5 = v15 + 1;
        if (v15 + 1 >= v11)
          goto LABEL_32;
        v16 = v7[v5];
        if (!v16)
        {
          v5 = v15 + 2;
          if (v15 + 2 >= v11)
            goto LABEL_32;
          v16 = v7[v5];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63)
                sub_23F258B8C(0, v11, (_QWORD *)(v2 + 56));
              else
                *v7 = v27;
              v1 = v28;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                v5 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v5 >= v11)
                  goto LABEL_32;
                v16 = v7[v5];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v5 = v17;
          }
        }
      }
LABEL_20:
      v10 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23F258820()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23F267D84();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  sub_23F1217E8(&qword_256E09120);
  v6 = sub_23F2684F8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      v20 = v5;
      v21 = *(_QWORD *)(v5 + 48);
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v23(v4, v21 + v22 * i, v2);
      sub_23F25697C(&qword_256DFEAF0, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      result = sub_23F268120();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          v30 = v26 == v29;
          if (v26 == v29)
            v26 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v26);
          if (v31 != -1)
          {
            v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(*(_QWORD *)(v7 + 48) + v27 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v20;
      if (v11)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_38;
      if (v17 >= v34)
        goto LABEL_32;
      v18 = v35[v17];
      ++v14;
      if (!v18)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v34)
          goto LABEL_32;
        v18 = v35[v14];
        if (!v18)
        {
          v14 = v17 + 2;
          if (v17 + 2 >= v34)
            goto LABEL_32;
          v18 = v35[v14];
          if (!v18)
          {
            v19 = v17 + 3;
            if (v19 >= v34)
            {
LABEL_32:
              swift_release();
              v1 = v33;
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 > 63)
                sub_23F258B8C(0, (unint64_t)(v32 + 63) >> 6, v35);
              else
                *v35 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                v14 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_39;
                if (v14 >= v34)
                  goto LABEL_32;
                v18 = v35[v14];
                ++v19;
                if (v18)
                  goto LABEL_20;
              }
            }
            v14 = v19;
          }
        }
      }
LABEL_20:
      v11 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23F258B8C(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_23F258BA8(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_23F268828();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_23F258F04(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_23F258CA0(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_23F267D84();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23F25697C(&qword_256DFEAF0, 255, v11);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_23F268120();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_23F25697C(&qword_256DFEAF8, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      v21 = sub_23F268138();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_23F259024((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

void sub_23F258F04(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23F2585A0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_23F259230();
      goto LABEL_14;
    }
    sub_23F2595E4();
  }
  v8 = *v3;
  v9 = sub_23F268828();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v11 + 8 * a2) == a1)
    {
LABEL_13:
      sub_23F2687C8();
      __break(1u);
    }
    else
    {
      v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v11 + 8 * a2) == a1)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v13 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * a2) = a1;
  v14 = *(_QWORD *)(v13 + 16);
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    *(_QWORD *)(v13 + 16) = v16;
}

uint64_t sub_23F259024(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23F267D84();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23F258820();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23F2593BC();
      goto LABEL_12;
    }
    sub_23F259840();
  }
  v12 = *v3;
  sub_23F25697C(&qword_256DFEAF0, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  v13 = sub_23F268120();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_23F25697C(&qword_256DFEAF8, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
      v18 = sub_23F268138();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23F2687C8();
  __break(1u);
  return result;
}

void sub_23F259230()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  sub_23F1217E8(&qword_256E09158);
  v2 = *v0;
  v3 = sub_23F2684EC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    swift_release();
    *v1 = v4;
    sub_23F12612C();
    return;
  }
  v5 = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
    memmove(v5, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    if (v12)
      goto LABEL_11;
LABEL_12:
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
}

void *sub_23F2593BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = sub_23F267D84();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F1217E8(&qword_256E09120);
  v6 = *v0;
  v7 = sub_23F2684EC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = *(_QWORD *)(v6 + 56);
  v16 = -1;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  v17 = v16 & v15;
  v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0)
    goto LABEL_12;
LABEL_11:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v13 << 6); ; i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    v24 = *(_QWORD *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v24, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v24, v5, v2);
    if (v17)
      goto LABEL_11;
LABEL_12:
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 3;
  if (v23 >= v18)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23F2595E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  sub_23F1217E8(&qword_256E09158);
  result = sub_23F2684F8();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  if (!v9)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_23F268828();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v21) = v17;
    ++*(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_6;
LABEL_7:
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_36;
    if (v14 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    result = swift_release();
    v1 = v26;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23F259840()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23F267D84();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  sub_23F1217E8(&qword_256E09120);
  v7 = sub_23F2684F8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  if (!v12)
    goto LABEL_7;
LABEL_6:
  v16 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v21 * i, v2);
    sub_23F25697C(&qword_256DFEAF0, 255, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
    result = sub_23F268120();
    v22 = -1 << *(_BYTE *)(v8 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v13 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v25 * v21, v5, v2);
    ++*(_QWORD *)(v8 + 16);
    if (v12)
      goto LABEL_6;
LABEL_7:
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_36;
    if (v18 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v33)
        goto LABEL_32;
      v19 = *(_QWORD *)(v32 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v33)
          goto LABEL_32;
        v19 = *(_QWORD *)(v32 + 8 * v15);
        if (!v19)
          break;
      }
    }
LABEL_20:
    v12 = (v19 - 1) & v19;
  }
  v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_34;
  }
  v19 = *(_QWORD *)(v32 + 8 * v20);
  if (v19)
  {
    v15 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v15 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v15);
    ++v20;
    if (v19)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_23F259B68(uint64_t a1)
{
  sub_23F186E10(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_23F259B7C(uint64_t a1)
{
  return sub_23F186FCC(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_23F259B90(uint64_t *a1, uint64_t (*a2)(unint64_t, unint64_t), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  uint64_t (*v28)(unint64_t, unint64_t);
  unint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = a3;
  v34 = sub_23F1217E8(&qword_256E01198);
  v5 = MEMORY[0x24BDAC7A8](v34);
  v31 = (uint64_t)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v32 = (uint64_t)&v28 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v28 - v10;
  v12 = *a1;
  v13 = *(_QWORD *)(*a1 + 16);
  if (v13)
  {
    v30 = a1;
    v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v15 = *(_QWORD *)(v9 + 72);
    swift_bridgeObjectRetain();
    v16 = 0;
    v29 = v14;
    while ((a2(v12 + v14, v12 + v14 + *(int *)(v34 + 48)) & 1) == 0)
    {
      ++v16;
      v14 += v15;
      if (v13 == v16)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
    if (!__OFADD__(v16, 1))
    {
      v17 = *(_QWORD *)(v12 + 16);
      if (v16 + 1 == v17)
        return;
      v18 = v15 + v14;
      v19 = v16 + 1;
      v20 = v30;
      v28 = a2;
      v33 = v15;
      while (v19 < v17)
      {
        sub_23F258098(v12 + v18, (uint64_t)v11, &qword_256E01198);
        v21 = a2((unint64_t)v11, (unint64_t)&v11[*(int *)(v34 + 48)]);
        sub_23F125E40((uint64_t)v11, &qword_256E01198);
        if ((v21 & 1) == 0)
        {
          if (v19 != v16)
          {
            if ((v16 & 0x8000000000000000) != 0)
              goto LABEL_28;
            v22 = *v20;
            v23 = *(_QWORD *)(*v20 + 16);
            if (v16 >= v23)
              goto LABEL_29;
            v24 = v16 * v33;
            sub_23F258098(v22 + v29 + v16 * v33, v32, &qword_256E01198);
            if (v19 >= v23)
              goto LABEL_30;
            sub_23F258098(v22 + v18, v31, &qword_256E01198);
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *v30 = v22;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v22 = sub_23F259B7C(v22);
              *v30 = v22;
            }
            a2 = v28;
            if (v16 >= *(_QWORD *)(v22 + 16))
              goto LABEL_31;
            sub_23F259F9C(v31, v22 + v29 + v24);
            v20 = v30;
            if (v19 >= *(_QWORD *)(*v30 + 16))
              goto LABEL_32;
            sub_23F259F9C(v32, *v30 + v18);
          }
          if (__OFADD__(v16++, 1))
            goto LABEL_27;
        }
        v27 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_26;
        v12 = *v20;
        v17 = *(_QWORD *)(*v20 + 16);
        ++v19;
        v18 += v33;
        if (v27 == v17)
          return;
      }
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
    }
    __break(1u);
  }
}

void sub_23F259E7C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v7 = a1 - a2;
  if (__OFSUB__(0, v6))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v8 = v5 - v6;
  if (__OFADD__(v5, v7))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v8 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v8)
      v10 = v5 + v7;
    else
      v10 = v5;
    v4 = sub_23F186FCC(isUniquelyReferenced_nonNull_native, v10, 1, v4);
  }
  v11 = *(_QWORD *)(sub_23F1217E8(&qword_256E01198) - 8);
  v12 = v4 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v13 = *(_QWORD *)(v11 + 72);
  swift_arrayDestroy();
  if (!v6)
    goto LABEL_16;
  v14 = *(_QWORD *)(v4 + 16);
  if (__OFSUB__(v14, a2))
    goto LABEL_22;
  sub_23F25847C(v12 + v13 * a2, v14 - a2);
  v15 = *(_QWORD *)(v4 + 16);
  v16 = __OFADD__(v15, v7);
  v17 = v15 - v6;
  if (!v16)
  {
    *(_QWORD *)(v4 + 16) = v17;
LABEL_16:
    *v2 = v4;
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_23F259F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256E01198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23F259FE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

void sub_23F25A014(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23F26452C(a1, a2, *(void (**)(uint64_t *))(v2 + 16));
}

void sub_23F25A01C()
{
  sub_23F2561E0();
}

uint64_t sub_23F25A05C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256E01198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23F25A0A4()
{
  sub_23F2561E0();
}

uint64_t sub_23F25A0E0()
{
  sub_23F131B8C();
  sub_23F25A448();
  sub_23F25A5D8();
  return swift_deallocObject();
}

void sub_23F25A140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_23F131B8C() - 8) + 80);
  sub_23F2565D4(a1, *(os_unfair_lock_s **)(v1 + 16), v1 + ((v3 + 24) & ~v3));
  sub_23F126078();
}

uint64_t sub_23F25A17C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23F25A19C()
{
  uint64_t v0;

  sub_23F25A448();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_23F25A1CC()
{
  uint64_t *v0;

  return sub_23F25613C(v0[2], v0[3], v0[4]);
}

uint64_t sub_23F25A1DC@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v1;

  return sub_23F256170(v1, a1);
}

uint64_t sub_23F25A1F4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23F25A218(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    sub_23F125540(a2);
    sub_23F18AD90();
  }
  sub_23F126078();
}

uint64_t sub_23F25A250()
{
  return sub_23F25A17C();
}

uint64_t sub_23F25A328()
{
  return sub_23F268624();
}

uint64_t sub_23F25A358()
{
  return swift_deallocObject();
}

void *sub_23F25A368@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t sub_23F25A378(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23F25A384()
{
  return swift_beginAccess();
}

uint64_t sub_23F25A390()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25A3A4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  return swift_task_dealloc();
}

uint64_t sub_23F25A3C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F25A3D4()
{
  return swift_allocObject();
}

uint64_t sub_23F25A3F0()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t sub_23F25A400()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t sub_23F25A410()
{
  return sub_23F268480();
}

uint64_t sub_23F25A42C()
{
  return sub_23F2685E8();
}

uint64_t sub_23F25A448()
{
  return swift_release();
}

uint64_t sub_23F25A450()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25A464()
{
  return swift_allocObject();
}

char *sub_23F25A47C@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

__n128 sub_23F25A49C()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v0;
  v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 128) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 112) = v3;
  *(_QWORD *)(v1 - 96) = *(_QWORD *)(v0 + 32);
  return result;
}

uint64_t sub_23F25A4B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

uint64_t sub_23F25A4EC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25A508(uint64_t a1, unint64_t *a2)
{
  return sub_23F146B20(0, a2);
}

unint64_t sub_23F25A52C()
{
  return 0xD000000000000027;
}

void *sub_23F25A554@<X0>(void *a1@<X0>, const void *a2@<X1>, size_t a3@<X8>)
{
  return memmove(a1, a2, a3);
}

uint64_t sub_23F25A55C()
{
  return sub_23F267EF8();
}

uint64_t sub_23F25A570()
{
  return swift_isEscapingClosureAtFileLocation();
}

void *sub_23F25A57C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

void sub_23F25A588()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F1328E8(v0, v1 - 128);
}

uint64_t sub_23F25A594()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0 - 128);
}

uint64_t sub_23F25A59C()
{
  return swift_release();
}

uint64_t sub_23F25A5B0()
{
  return sub_23F267EF8();
}

uint64_t sub_23F25A5D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

uint64_t sub_23F25A5E8()
{
  uint64_t v0;

  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0 - 112);
}

uint64_t sub_23F25A5F0()
{
  return swift_retain();
}

void sub_23F25A614(NSObject *a1)
{
  void *v1;

  dispatch_sync(a1, v1);
}

uint64_t sub_23F25A630()
{
  return swift_release();
}

uint64_t sub_23F25A638()
{
  return swift_once();
}

uint64_t sub_23F25A640()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25A654()
{
  uint64_t v0;

  return v0;
}

void sub_23F25A668(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t))
{
  sub_23F25697C(a1, 255, a3);
}

uint64_t sub_23F25A670()
{
  return swift_getObjectType();
}

uint64_t sub_23F25A67C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
  return swift_unknownObjectRelease();
}

uint64_t sub_23F25A690()
{
  return swift_beginAccess();
}

uint64_t sub_23F25A69C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F1311B4(v1, v0);
}

void sub_23F25A6A8()
{
  sub_23F256730();
}

__n128 sub_23F25A6B4()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v0;
  v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 112) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 96) = v3;
  *(_QWORD *)(v1 - 80) = *(_QWORD *)(v0 + 32);
  return result;
}

void sub_23F25A6C8()
{
  const void *v0;

  _Block_release(v0);
}

void sub_23F25A6D0()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F1328E8(v0, v1 - 112);
}

void StatementOutcome.asActionOutcome.getter()
{
  sub_23F25A734(type metadata accessor for StatementOutcome);
}

uint64_t sub_23F25A6F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  v4 = sub_23F1261F8(a1, a2, a3);
  sub_23F143964(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  return v3;
}

void ActionOutcome.asStatementOutcome.getter()
{
  sub_23F25A734(type metadata accessor for ActionOutcome);
}

void sub_23F25A734(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = a1(0);
  MEMORY[0x24BDAC7A8](v3);
  sub_23F25A948(v1, (uint64_t)&v6 - v4, a1);
  v5 = (char *)sub_23F25A7C4 + 4 * byte_23F2912CC[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23F25A7C4(uint64_t a1, uint64_t a2)
{
  sub_23F25A98C(a1, a2, type metadata accessor for ActionSuccess);
  sub_23F25A978();
  sub_23F25A980();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23F25A948(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  v4 = sub_23F1261F8(a1, a2, a3);
  sub_23F143964(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  return v3;
}

uint64_t sub_23F25A978()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t sub_23F25A980()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F25A98C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  return sub_23F25A6F0(v4, v3, a3);
}

uint64_t _s16IntelligenceFlow15StructBuildablePAAE6create_23furtherInitializingWithxxn_yxzqd__YKXEtqd__YKs5ErrorRd__lFZ@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(uint64_t, char *);
  uint64_t v16;
  uint64_t v18;

  v11 = *(_QWORD *)(a3 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15(v12, v14);
  v16 = *(_QWORD *)(a2 - 8);
  if (!v5)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(a5, a1, a2);
  sub_23F25AB3C(v16);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a4, v14, a3);
}

uint64_t _s16IntelligenceFlow20EmptyStructBuildablePAAEyxyxzqd__YKXEqd__YKcs5ErrorRd__lufC@<X0>(uint64_t (*a1)(uint64_t, char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;

  v17 = a4;
  v10 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v14, v13);
  result = a1(a5, v12);
  if (v5)
  {
    sub_23F25AB3C(*(_QWORD *)(a2 - 8));
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(v17, v12, a3);
  }
  return result;
}

uint64_t dispatch thunk of EmptyStructBuildable.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_23F25AB3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

void *sub_23F25AB4C()
{
  qword_256E09160 = (uint64_t)&unk_256E63D68;
  return &unk_256E63D68;
}

id static ToolboxXPCService.interface.getter()
{
  if (qword_256DFE508 != -1)
    swift_once();
  return (id)qword_256E09160;
}

unint64_t static ToolboxXPCService.serviceName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_23F25ABBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;

  sub_23F1217E8(&qword_256E093F8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23F291320;
  *(_QWORD *)(v0 + 32) = sel_queryWithPlannerType_query_k_clientIdentifier_availableClientActions_with_;
  *(_QWORD *)(v0 + 40) = 0;
  sub_23F1217E8(&qword_256E09400);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_23F291330;
  v2 = type metadata accessor for ToolboxSearchResult();
  v3 = sub_23F1217E8(&qword_256E09408);
  *(_QWORD *)(v1 + 56) = v3;
  v4 = v3;
  *(_QWORD *)(v1 + 32) = v2;
  sub_23F15AE30(0, &qword_256E09410);
  v6 = v5;
  v22 = v5;
  v7 = sub_23F1217E8(&qword_256E09418);
  *(_QWORD *)(v1 + 88) = v7;
  v8 = v7;
  v21 = v7;
  *(_QWORD *)(v1 + 64) = v6;
  sub_23F15AE30(0, (unint64_t *)&unk_256E09420);
  v9 = (void *)MEMORY[0x2426667F4](v1);
  sub_23F15AE30(0, (unint64_t *)&qword_256DFEAE0);
  sub_23F25DF20();
  v10 = sub_23F26833C();

  v11 = sub_23F25AE18(v10);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 48) = v11;
  *(_QWORD *)(v0 + 56) = sel_queryWithPlannerType_query_bundleIDs_with_;
  *(_QWORD *)(v0 + 64) = 0;
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23F291330;
  *(_QWORD *)(v12 + 32) = v2;
  *(_QWORD *)(v12 + 88) = v8;
  *(_QWORD *)(v12 + 56) = v4;
  *(_QWORD *)(v12 + 64) = v22;
  v13 = (void *)MEMORY[0x2426667F4]();
  v14 = sub_23F26833C();

  v15 = sub_23F25AE18(v14);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 72) = v15;
  *(_QWORD *)(v0 + 80) = sel_queryWithPlannerType_query_toolIDs_with_;
  *(_QWORD *)(v0 + 88) = 0;
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_23F291330;
  *(_QWORD *)(v16 + 32) = v2;
  *(_QWORD *)(v16 + 88) = v21;
  *(_QWORD *)(v16 + 56) = v4;
  *(_QWORD *)(v16 + 64) = v22;
  v17 = (void *)MEMORY[0x2426667F4]();
  v18 = sub_23F26833C();

  v19 = sub_23F25AE18(v18);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 96) = v19;
  qword_256E09168 = v0;
  return result;
}

uint64_t sub_23F25AE18(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  v1 = a1;
  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_23F2684C8())
      goto LABEL_3;
LABEL_6:
    v3 = MEMORY[0x24BEE4B08];
    if (v2)
      goto LABEL_4;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
LABEL_3:
  sub_23F1217E8(&qword_256E09438);
  v3 = sub_23F268504();
  if (v2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    swift_retain();
    sub_23F2684BC();
    sub_23F15AE30(0, (unint64_t *)&qword_256DFEAE0);
    sub_23F25DF20();
    result = sub_23F268378();
    v1 = v34;
    v30 = v35;
    v5 = v36;
    v6 = v37;
    v7 = v38;
    goto LABEL_11;
  }
LABEL_7:
  v8 = -1 << *(_BYTE *)(v1 + 32);
  v30 = v1 + 56;
  v5 = ~v8;
  v9 = -v8;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v7 = v10 & *(_QWORD *)(v1 + 56);
  swift_bridgeObjectRetain();
  result = swift_retain();
  v6 = 0;
LABEL_11:
  v29 = (unint64_t)(v5 + 64) >> 6;
  v11 = v3 + 56;
  if (v1 < 0)
    goto LABEL_14;
LABEL_12:
  if (v7)
  {
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v13 = v12 | (v6 << 6);
    goto LABEL_32;
  }
  v15 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v15 < v29)
    {
      v16 = *(_QWORD *)(v30 + 8 * v15);
      v17 = v6 + 1;
      if (v16)
        goto LABEL_31;
      v17 = v6 + 2;
      if (v6 + 2 < v29)
      {
        v16 = *(_QWORD *)(v30 + 8 * v17);
        if (v16)
          goto LABEL_31;
        v17 = v6 + 3;
        if (v6 + 3 < v29)
        {
          v16 = *(_QWORD *)(v30 + 8 * v17);
          if (v16)
            goto LABEL_31;
          v17 = v6 + 4;
          if (v6 + 4 < v29)
          {
            v16 = *(_QWORD *)(v30 + 8 * v17);
            if (v16)
              goto LABEL_31;
            v17 = v6 + 5;
            if (v6 + 5 < v29)
            {
              v16 = *(_QWORD *)(v30 + 8 * v17);
              if (!v16)
              {
                v18 = v6 + 6;
                while (v18 < v29)
                {
                  v16 = *(_QWORD *)(v30 + 8 * v18++);
                  if (v16)
                  {
                    v17 = v18 - 1;
                    goto LABEL_31;
                  }
                }
                goto LABEL_44;
              }
LABEL_31:
              v7 = (v16 - 1) & v16;
              v13 = __clz(__rbit64(v16)) + (v17 << 6);
              v6 = v17;
LABEL_32:
              v19 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v13);
              while (1)
              {
                sub_23F15AE30(0, (unint64_t *)&qword_256DFEAE0);
                swift_dynamicCast();
                result = sub_23F2684E0();
                v20 = -1 << *(_BYTE *)(v3 + 32);
                v21 = result & ~v20;
                v22 = v21 >> 6;
                if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) == 0)
                  break;
                v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_42:
                *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
                v28 = *(_QWORD *)(v3 + 48) + 40 * v23;
                *(_OWORD *)v28 = v31;
                *(_OWORD *)(v28 + 16) = v32;
                *(_QWORD *)(v28 + 32) = v33;
                ++*(_QWORD *)(v3 + 16);
                if ((v1 & 0x8000000000000000) == 0)
                  goto LABEL_12;
LABEL_14:
                v14 = sub_23F2684D4();
                if (!v14)
                  goto LABEL_44;
                *(_QWORD *)&v31 = v14;
                sub_23F15AE30(0, (unint64_t *)&qword_256DFEAE0);
                swift_dynamicCast();
              }
              v24 = 0;
              v25 = (unint64_t)(63 - v20) >> 6;
              while (++v22 != v25 || (v24 & 1) == 0)
              {
                v26 = v22 == v25;
                if (v22 == v25)
                  v22 = 0;
                v24 |= v26;
                v27 = *(_QWORD *)(v11 + 8 * v22);
                if (v27 != -1)
                {
                  v23 = __clz(__rbit64(~v27)) + (v22 << 6);
                  goto LABEL_42;
                }
              }
              __break(1u);
              goto LABEL_46;
            }
          }
        }
      }
    }
LABEL_44:
    swift_release();
    sub_23F125E20();
    return v3;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t static ToolboxXPCService.selectorClasses.getter()
{
  if (qword_256DFE510 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F25B278()
{
  uint64_t v0;

  v0 = sub_23F267FDC();
  sub_23F1470EC(v0, qword_256E09170);
  sub_23F146E30(v0, (uint64_t)qword_256E09170);
  return sub_23F267E20();
}

uint64_t static ToolboxXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256DFE518 != -1)
    swift_once();
  v2 = sub_23F267FDC();
  v3 = sub_23F146E30(v2, (uint64_t)qword_256E09170);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_23F25B334()
{
  static ToolboxXPCService.serviceName.getter();
  return 0xD000000000000022;
}

id Readiness.toolKitTools.getter()
{
  return sub_23F25E0C4(OBJC_IVAR____TtC16IntelligenceFlow9Readiness_toolKitTools);
}

id Readiness.assistantSchemas.getter()
{
  return sub_23F25E0C4(OBJC_IVAR____TtC16IntelligenceFlow9Readiness_assistantSchemas);
}

uint64_t Readiness.totalEmbeddings.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow9Readiness_totalEmbeddings);
}

void Readiness.__allocating_init(toolKitTools:assistantSchemas:totalEmbeddings:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23F25E070();
  Readiness.init(toolKitTools:assistantSchemas:totalEmbeddings:)(a1, a2, a3);
  sub_23F12612C();
}

void Readiness.init(toolKitTools:assistantSchemas:totalEmbeddings:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v7 = (objc_class *)sub_23F25E09C();
  *(_QWORD *)&v3[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_toolKitTools] = a1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_assistantSchemas] = a2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_totalEmbeddings] = a3;
  v14.receiver = v3;
  v14.super_class = v7;
  sub_23F25E094((uint64_t)v7, sel_init, v8, v9, v10, v11, v12, v13, v14);
  sub_23F131634();
}

void static Readiness.supportsSecureCoding.getter()
{
  sub_23F126DC0();
  sub_23F250B00();
}

void static Readiness.supportsSecureCoding.setter(char a1)
{
  sub_23F126DC0();
  byte_256E09188 = a1;
  sub_23F250B00();
}

void static Readiness.supportsSecureCoding.modify()
{
  sub_23F126DC0();
  sub_23F126078();
}

Swift::Void __swiftcall Readiness.encode(with:)(NSCoder with)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)sub_23F268144();
  sub_23F25E0A4();

  v2 = (void *)sub_23F268144();
  sub_23F25E0A4();

  v3 = (void *)sub_23F25E040();
  sub_23F25E0E8((uint64_t)v3, sel_encodeInteger_forKey_);
  sub_23F25E108(v3);
}

void Readiness.__allocating_init(coder:)()
{
  sub_23F25E070();
  Readiness.init(coder:)();
  sub_23F126078();
}

void Readiness.init(coder:)()
{
  void *v0;
  void *v1;
  objc_class *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v2 = (objc_class *)sub_23F25E128();
  type metadata accessor for ToolBoxIndexedSource();
  v3 = v1;
  v4 = sub_23F25E138();
  if (v4)
  {
    *(_QWORD *)&v3[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_toolKitTools] = v4;
    v5 = sub_23F25E138();
    if (v5)
    {
      *(_QWORD *)&v3[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_assistantSchemas] = v5;
      v6 = (void *)sub_23F25E040();
      v7 = objc_msgSend(v0, sel_decodeIntegerForKey_, v6);

      *(_QWORD *)&v3[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_totalEmbeddings] = v7;
      v15.receiver = v3;
      v15.super_class = v2;
      sub_23F25E094(v8, sel_init, v9, v10, v11, v12, v13, v14, v15);

      sub_23F14C28C();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t type metadata accessor for ToolBoxIndexedSource()
{
  return objc_opt_self();
}

void Readiness.init()()
{
  sub_23F25E0B8();
  __break(1u);
}

uint64_t ToolBoxIndexedSource.upToDateWithSource.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource);
}

uint64_t ToolBoxIndexedSource.eligibleTools.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_eligibleTools);
}

void ToolBoxIndexedSource.__allocating_init(upToDateWithSource:eligibleTools:)(char a1, uint64_t a2)
{
  sub_23F25E070();
  ToolBoxIndexedSource.init(upToDateWithSource:eligibleTools:)(a1, a2);
  sub_23F12612C();
}

void ToolBoxIndexedSource.init(upToDateWithSource:eligibleTools:)(char a1, uint64_t a2)
{
  _BYTE *v2;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v5 = (objc_class *)sub_23F25E09C();
  v2[OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource] = a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_eligibleTools] = a2;
  v12.receiver = v2;
  v12.super_class = v5;
  sub_23F25E094((uint64_t)v5, sel_init, v6, v7, v8, v9, v10, v11, v12);
  sub_23F131634();
}

void static ToolBoxIndexedSource.supportsSecureCoding.getter()
{
  sub_23F126DC0();
  sub_23F250B00();
}

void static ToolBoxIndexedSource.supportsSecureCoding.setter(char a1)
{
  sub_23F126DC0();
  byte_256E09189 = a1;
  sub_23F250B00();
}

void static ToolBoxIndexedSource.supportsSecureCoding.modify()
{
  sub_23F126DC0();
  sub_23F126078();
}

Swift::Void __swiftcall ToolBoxIndexedSource.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource);
  v4 = (void *)sub_23F25E0F4();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v3, v4);

  v5 = (id)sub_23F25E008();
  sub_23F25E0E8((uint64_t)v5, sel_encodeInteger_forKey_);

}

void ToolBoxIndexedSource.__allocating_init(coder:)(void *a1)
{
  sub_23F25E070();
  ToolBoxIndexedSource.init(coder:)(a1);
  sub_23F126078();
}

void ToolBoxIndexedSource.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  objc_class *v4;
  _BYTE *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v2 = v1;
  v4 = (objc_class *)sub_23F25E09C();
  v5 = v2;
  v6 = (void *)sub_23F25E0F4();
  v7 = objc_msgSend(a1, sel_decodeBoolForKey_, v6);

  v5[OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource] = v7;
  v8 = (void *)sub_23F25E008();
  v9 = objc_msgSend(a1, sel_decodeIntegerForKey_, v8);

  *(_QWORD *)&v5[OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_eligibleTools] = v9;
  v17.receiver = v5;
  v17.super_class = v4;
  sub_23F25E094(v10, sel_init, v11, v12, v13, v14, v15, v16, v17);

  sub_23F14C28C();
}

void ToolBoxIndexedSource.init()()
{
  sub_23F25E0B8();
  __break(1u);
}

float ToolboxSearchResult.similarity.getter()
{
  uint64_t v0;

  return *(float *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_similarity);
}

void ToolboxSearchResult.toolEmbeddingSnippet.getter()
{
  swift_bridgeObjectRetain();
  sub_23F126078();
}

id ToolboxSearchResult.__allocating_init(similarity:toolEmbeddingSnippet:)(uint64_t a1, uint64_t a2, float a3)
{
  sub_23F25E070();
  return ToolboxSearchResult.init(similarity:toolEmbeddingSnippet:)(a1, a2, a3);
}

id ToolboxSearchResult.init(similarity:toolEmbeddingSnippet:)(uint64_t a1, uint64_t a2, float a3)
{
  char *v3;
  objc_class *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v7 = (objc_class *)sub_23F25E09C();
  *(float *)&v3[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_similarity] = a3;
  v8 = &v3[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_toolEmbeddingSnippet];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  v16.receiver = v3;
  v16.super_class = v7;
  return sub_23F25E094((uint64_t)v7, sel_init, v9, v10, v11, v12, v13, v14, v16);
}

void static ToolboxSearchResult.supportsSecureCoding.getter()
{
  sub_23F126DC0();
  sub_23F250B00();
}

void static ToolboxSearchResult.supportsSecureCoding.setter(char a1)
{
  sub_23F126DC0();
  byte_256E0918A = a1;
  sub_23F250B00();
}

void static ToolboxSearchResult.supportsSecureCoding.modify()
{
  sub_23F126DC0();
  sub_23F126078();
}

Swift::Void __swiftcall ToolboxSearchResult.encode(with:)(NSCoder with)
{
  uint64_t v1;
  int v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  v3 = *(_DWORD *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_similarity);
  v4 = (void *)sub_23F25E078();
  LODWORD(v5) = v3;
  -[objc_class encodeFloat:forKey:](with.super.isa, sel_encodeFloat_forKey_, v4, v5);

  v6 = (void *)sub_23F268144();
  v7 = (void *)sub_23F268144();
  sub_23F25E0E8((uint64_t)v7, sel_encodeObject_forKey_);

  sub_23F25E108(v7);
}

void ToolboxSearchResult.__allocating_init(coder:)()
{
  sub_23F25E070();
  ToolboxSearchResult.init(coder:)();
  sub_23F126078();
}

uint64_t ToolboxSearchResult.init(coder:)()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  sub_23F25E128();
  sub_23F15AE30(0, &qword_256E091C8);
  v2 = v1;
  v3 = sub_23F25E138();
  if (v3)
  {
    v4 = (void *)v3;
    sub_23F268150();

  }
  swift_deallocPartialClassInstance();
  return 0;
}

id ToolboxSearchResult.__allocating_init()()
{
  return objc_msgSend(sub_23F25E070(), sel_init);
}

void ToolboxSearchResult.init()()
{
  sub_23F25E0B8();
  __break(1u);
}

id _s16IntelligenceFlow9ReadinessCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)sub_23F25E09C();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void ToolboxClient.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  ToolboxClient.init()(v0, v1);
  sub_23F126078();
}

void ToolboxClient.init()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = 0;
  sub_23F25DBD8(&qword_256E091D0, a2, (uint64_t (*)(uint64_t))type metadata accessor for ToolboxClient, (uint64_t)&protocol conformance descriptor for ToolboxClient);
  sub_23F1217E8(&qword_256E091D8);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v2 + 16) = sub_23F267ED4();
  swift_release();
  sub_23F12612C();
}

uint64_t type metadata accessor for ToolboxClient()
{
  return objc_opt_self();
}

void sub_23F25C12C()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 16))
  {
    sub_23F25E154();
    MEMORY[0x24BDAC7A8](v1);
    sub_23F25E140();
    type metadata accessor for Readiness();
    sub_23F1319F8();
    sub_23F25E02C();
    sub_23F25DFEC();
    sub_23F25E064();
    sub_23F25A4E0();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25C198(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25C208()
{
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25C7D4();
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25C2AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25C198(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t type metadata accessor for Readiness()
{
  return objc_opt_self();
}

void sub_23F25C2D4(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_23F25C348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(v1 + 16))
  {
    sub_23F25E154();
    MEMORY[0x24BDAC7A8](v2);
    sub_23F25E140();
    sub_23F15AE30(0, (unint64_t *)&qword_256E091E0);
    sub_23F1319F8();
    sub_23F25E02C();
    sub_23F25DFEC();
    if (!v0)
    {
      objc_msgSend(v3, sel_integerValue);

    }
    sub_23F25E064();
    sub_23F25A4E0();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25C3E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25C454()
{
  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25C7D4();
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25C4F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25C3E4(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_23F25C500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v20 = a1;
  v23 = sub_23F267CC4();
  v19 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23F267CF4();
  v18 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v17 - v10;
  if (*(_QWORD *)(v1 + 16))
  {
    MEMORY[0x24BDAC7A8](result);
    *((_BYTE *)&v17 - 16) = v12;
    swift_retain();
    sub_23F267EBC();
    result = swift_release();
    if (!v2)
    {
      sub_23F267DFC();
      v21 = sub_23F267CDC();
      v22 = v13;
      v14 = v19;
      v15 = v23;
      (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v4, *MEMORY[0x24BDCD7A0], v23);
      sub_23F256C04();
      sub_23F267CE8();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v15);
      swift_bridgeObjectRelease();
      v16 = *(void (**)(char *, uint64_t))(v18 + 8);
      v16(v8, v5);
      return ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23F25C6EC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __asm { BR              X10 }
}

uint64_t sub_23F25C73C()
{
  swift_unknownObjectRetain();
  sub_23F25C7D4();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25C7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25C6EC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

void sub_23F25C7D4()
{
  SEL *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  sub_23F25E0CC();
  v2 = (void *)sub_23F268144();
  v10 = sub_23F25E190((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9, MEMORY[0x24BDAC760]);
  swift_retain();
  swift_release();
  objc_msgSend(v1, *v0, v2, v10);
  _Block_release(v10);

}

uint64_t sub_23F25C874(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, void *);
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v6 = sub_23F1217E8(&qword_2543444B0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_23F267CD0();
    v10 = sub_23F267CF4();
    v11 = 0;
  }
  else
  {
    v10 = sub_23F267CF4();
    v11 = 1;
  }
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v8, v11, 1, v10);
  swift_retain();
  v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_23F25DEB8((uint64_t)v8);
}

void sub_23F25C958(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + 16))
  {
    MEMORY[0x24BDAC7A8](a1);
    sub_23F1319F8();
    sub_23F1217E8(&qword_256E091F0);
    sub_23F25DFF8();
    sub_23F25DFEC();
    sub_23F25E064();
    sub_23F25A4E0();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25C9F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25CA7C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25CB58(0x796D6D7564, 0xE500000000000000, v2, v1, v7, v8, v4, v3, (uint64_t)sub_23F25DFE8, v5, v0);
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25CB28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25C9F0(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

void sub_23F25CB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v13 = (void *)sub_23F268144();
  v14 = (void *)sub_23F268144();
  if (a7)
    a7 = (void *)sub_23F268144();
  v15 = (void *)sub_23F268330();
  v17[4] = a9;
  v17[5] = a10;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_23F25CC90;
  v17[3] = &unk_250FBC860;
  v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(a11, sel_queryWithPlannerType_query_k_clientIdentifier_availableClientActions_with_, v13, v14, a5, a7, v15, v16);
  _Block_release(v16);

}

uint64_t sub_23F25CC90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for ToolboxSearchResult();
    v4 = sub_23F26827C();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_23F25CD08()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 16))
  {
    sub_23F25E17C();
    MEMORY[0x24BDAC7A8](v1);
    sub_23F1319F8();
    sub_23F1217E8(&qword_256E091F0);
    sub_23F25DFF8();
    sub_23F25DFEC();
    sub_23F25E064();
    sub_23F25A4E0();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25CD90(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25CE18()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25D0B8(0x796D6D7564, 0xE500000000000000, v3, v2, v1, (uint64_t)sub_23F25DFE8, v4, v0, (uint64_t)&unk_250FBC810, (SEL *)&selRef_queryWithPlannerType_query_bundleIDs_with_);
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25CED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25CD90(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

void sub_23F25CEE0()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 16))
  {
    sub_23F25E17C();
    MEMORY[0x24BDAC7A8](v1);
    sub_23F1319F8();
    sub_23F1217E8(&qword_256E091F0);
    sub_23F25DFF8();
    sub_23F25DFEC();
    sub_23F25E064();
    sub_23F25A4E0();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25CF68(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25CFF0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25D0B8(0x796D6D7564, 0xE500000000000000, v3, v2, v1, (uint64_t)sub_23F25DFE8, v4, v0, (uint64_t)&unk_250FBC7C0, (SEL *)&selRef_queryWithPlannerType_query_toolIDs_with_);
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25D0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25CF68(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

void sub_23F25D0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, SEL *a10)
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v11 = (void *)sub_23F268144();
  v12 = (void *)sub_23F268144();
  v13 = (void *)sub_23F268270();
  v21 = sub_23F25E190((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20, MEMORY[0x24BDAC760]);
  swift_retain();
  swift_release();
  objc_msgSend(a8, *a10, v11, v12, v13, v21);
  _Block_release(v21);

  sub_23F250234();
}

void sub_23F25D19C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(v1 + 16))
  {
    MEMORY[0x24BDAC7A8](a1);
    sub_23F1319F8();
    sub_23F1217E8(&qword_256E091F8);
    sub_23F25DFF8();
    sub_23F25DFEC();
    if (v2)
    {
LABEL_5:
      sub_23F25E064();
      sub_23F25A4E0();
      return;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    __break(1u);
  }
  __break(1u);
}

void sub_23F25D244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v9;

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25D2C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25DA00(v2, v1, 0x796D6D7564, 0xE500000000000000, (uint64_t)sub_23F25DFE8, v3, v0, (uint64_t)sub_23F25D388, (uint64_t)&unk_250FBC770, (SEL *)&selRef_sandboxWithInjectionId_plannerType_with_);
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25D37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25D244(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32));
}

uint64_t sub_23F25D388(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_23F26827C();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_23F25D408()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(v1 + 16))
  {
    sub_23F25E168();
    MEMORY[0x24BDAC7A8](v2);
    sub_23F25E110();
    sub_23F15AE30(0, (unint64_t *)&qword_256E091E0);
    sub_23F1319F8();
    sub_23F25E02C();
    sub_23F25DFEC();
    if (!v0)
    {
      objc_msgSend(v3, sel_integerValue);

    }
    sub_23F25E064();
    sub_23F25A4E0();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25D4A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25D524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25DA00(0x796D6D7564, 0xE500000000000000, v2, v1, (uint64_t)sub_23F25A014, v3, v0, (uint64_t)sub_23F25C2D4, (uint64_t)&unk_250FBC720, (SEL *)&selRef_countWithPlannerType_toolType_with_);
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25D5DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25D4A4(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

void sub_23F25D5E8()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 16))
  {
    sub_23F25E168();
    MEMORY[0x24BDAC7A8](v1);
    sub_23F25E110();
    sub_23F1319F8();
    sub_23F1217E8((uint64_t *)&unk_256E09200);
    sub_23F25DFF8();
    sub_23F25DFEC();
    sub_23F25E064();
    sub_23F25A4E0();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25D65C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25D6DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25DA00(0x796D6D7564, 0xE500000000000000, v2, v1, (uint64_t)sub_23F25DFE8, v3, v0, (uint64_t)sub_23F25D7A0, (uint64_t)&unk_250FBC6D0, (SEL *)&selRef_listToolsWithPlannerType_toolType_with_);
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25D794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25D65C(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_23F25D7A0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_23F26833C();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_23F25D828(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v1 + 16))
  {
    MEMORY[0x24BDAC7A8](a1);
    v5 = v2;
    v6 = v3;
    v7 = v4;
    sub_23F1319F8();
    sub_23F267EBC();
    sub_23F25DFEC();
    sub_23F25E064();
  }
  else
  {
    __break(1u);
  }
}

void sub_23F25D8BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __asm { BR              X10 }
}

uint64_t sub_23F25D93C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_retain();
  swift_unknownObjectRetain();
  sub_23F25DA00(0x796D6D7564, 0xE500000000000000, v2, v1, (uint64_t)sub_23F25DE74, v3, v0, (uint64_t)sub_23F25DAAC, (uint64_t)&unk_250FBC680, (SEL *)&selRef_toolMappingWithPlannerType_customKey_with_);
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23F25D9F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_23F25D8BC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

void sub_23F25DA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  sub_23F25E0CC();
  v11 = (void *)sub_23F268144();
  v12 = (void *)sub_23F268144();
  v20 = sub_23F25E190((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, MEMORY[0x24BDAC760]);
  swift_retain();
  swift_release();
  objc_msgSend(v10, *a10, v11, v12, v20);
  _Block_release(v20);

  sub_23F250234();
}

uint64_t sub_23F25DAAC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, uint64_t, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    v5 = sub_23F26815C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_retain();
  v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t ToolboxClient.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t ToolboxClient.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

void sub_23F25DB6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_23F25DBD8(&qword_256E091D0, a2, (uint64_t (*)(uint64_t))type metadata accessor for ToolboxClient, (uint64_t)&protocol conformance descriptor for ToolboxClient);
  *(_QWORD *)(a1 + 8) = v3;
}

void sub_23F25DBA8()
{
  sub_23F25DBD8(&qword_256DFF148, 255, MEMORY[0x24BE797D0], MEMORY[0x24BE797E0]);
}

void sub_23F25DBD8(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(MEMORY[0x242667160](a4, v6), a1);
  }
  sub_23F126078();
}

uint64_t sub_23F25DC14()
{
  type metadata accessor for ToolboxClient();
  return sub_23F267EEC();
}

uint64_t sub_23F25DC54(uint64_t a1)
{
  MEMORY[0x242667160](&unk_23F291408, a1);
  return sub_23F146C04();
}

ValueMetadata *type metadata accessor for ToolboxXPCService()
{
  return &type metadata for ToolboxXPCService;
}

uint64_t method lookup function for Readiness()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Readiness.__allocating_init(toolKitTools:assistantSchemas:totalEmbeddings:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of Readiness.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for ToolBoxIndexedSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ToolBoxIndexedSource.__allocating_init(upToDateWithSource:eligibleTools:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t type metadata accessor for ToolboxSearchResult()
{
  return objc_opt_self();
}

uint64_t method lookup function for ToolboxSearchResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ToolboxSearchResult.__allocating_init(similarity:toolEmbeddingSnippet:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ToolboxSearchResult.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for ToolboxClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ToolboxClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ToolboxClient.readiness(plannerType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ToolboxClient.populate(plannerType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ToolboxClient.baseURL(plannerType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ToolboxClient.query(plannerType:query:k:clientIdentifier:availableClientActions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ToolboxClient.query(plannerType:query:bundleIDs:clientIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ToolboxClient.query(plannerType:query:toolIDs:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ToolboxClient.sandbox(injectionId:plannerType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ToolboxClient.count(plannerType:toolType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ToolboxClient.listTools(plannerType:toolType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ToolboxClient.toolMapping(plannerType:customKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

ValueMetadata *type metadata accessor for ToolboxClient.ToolboxClientError()
{
  return &type metadata for ToolboxClient.ToolboxClientError;
}

uint64_t sub_23F25DE50()
{
  swift_release();
  return swift_deallocObject();
}

void sub_23F25DE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v4)(_QWORD *, uint64_t);
  _QWORD v5[2];

  v4 = *(void (**)(_QWORD *, uint64_t))(v3 + 16);
  v5[0] = a1;
  v5[1] = a2;
  v4(v5, a3);
  sub_23F1A9BE8();
}

uint64_t sub_23F25DEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23F25DEB0()
{
  return swift_release();
}

uint64_t sub_23F25DEB8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23F1217E8(&qword_2543444B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23F25DEF8(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *);
  uint64_t v3;

  v2 = *(void (**)(uint64_t *))(v1 + 16);
  v3 = a1;
  v2(&v3);
  sub_23F1A9BE8();
}

unint64_t sub_23F25DF20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256E09430;
  if (!qword_256E09430)
  {
    sub_23F15AE30(255, (unint64_t *)&qword_256DFEAE0);
    result = MEMORY[0x242667160](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256E09430);
  }
  return result;
}

uint64_t sub_23F25DFEC()
{
  return swift_release();
}

uint64_t sub_23F25DFF8()
{
  return sub_23F267EBC();
}

uint64_t sub_23F25E008()
{
  return sub_23F268144();
}

uint64_t sub_23F25E02C()
{
  return sub_23F267EBC();
}

uint64_t sub_23F25E040()
{
  return sub_23F268144();
}

id sub_23F25E070()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t sub_23F25E078()
{
  return sub_23F268144();
}

id sub_23F25E094(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t sub_23F25E09C()
{
  return swift_getObjectType();
}

id sub_23F25E0A4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(v0, (SEL)(v3 + 328), v1, v2);
}

uint64_t sub_23F25E0B8()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

id sub_23F25E0C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

id sub_23F25E0E8(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_23F25E0F4()
{
  return sub_23F268144();
}

void sub_23F25E108(id a1)
{

}

uint64_t sub_23F25E128()
{
  return swift_getObjectType();
}

uint64_t sub_23F25E138()
{
  return sub_23F268414();
}

void *sub_23F25E190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _Block_copy(&a9);
}

void sub_23F25E198(uint64_t a1)
{
  sub_23F25E220(a1, (void (*)(_BYTE *, uint64_t))sub_23F156384);
}

void sub_23F25E1A4()
{
  sub_23F156668();
}

void sub_23F25E1B0(uint64_t a1)
{
  sub_23F25E220(a1, (void (*)(_BYTE *, uint64_t))sub_23F1562DC);
}

void sub_23F25E1BC()
{
  sub_23F1317B8();
  sub_23F268858();
  sub_23F1318A0();
  sub_23F1318E4();
}

void sub_23F25E1EC()
{
  sub_23F1317B8();
  sub_23F264440();
  sub_23F1318A0();
  sub_23F1318E4();
}

void sub_23F25E214()
{
  sub_23F156564();
}

void sub_23F25E220(uint64_t a1, void (*a2)(_BYTE *, uint64_t))
{
  _BYTE v4[72];

  sub_23F1317B8();
  a2(v4, a1);
  sub_23F1318A0();
  sub_23F1318E4();
}

void ToolDefinition.effect.getter(_BYTE *a1@<X8>)
{
  char v2;

  sub_23F268000();
  v2 = sub_23F2681EC();
  swift_bridgeObjectRelease();
  *a1 = v2 & 1;
  sub_23F12612C();
}

{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 80);
}

IntelligenceFlow::ToolEffect_optional __swiftcall ToolEffect.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  char v4;
  IntelligenceFlow::ToolEffect_optional result;

  v2 = v1;
  v3 = sub_23F268630();
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v3)
    v4 = 0;
  *v2 = v4;
  sub_23F12612C();
  return result;
}

uint64_t ToolEffect.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x7972657571;
  else
    return 0x6E6F69746361;
}

void sub_23F25E334(char *a1, char *a2)
{
  sub_23F1561EC(*a1, *a2);
}

void sub_23F25E340()
{
  sub_23F25E214();
}

uint64_t sub_23F25E348()
{
  return sub_23F1564FC();
}

void sub_23F25E350()
{
  sub_23F156564();
}

IntelligenceFlow::ToolEffect_optional sub_23F25E358(Swift::String *a1)
{
  return ToolEffect.init(rawValue:)(*a1);
}

void sub_23F25E364(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = ToolEffect.rawValue.getter();
  a1[1] = v2;
  sub_23F126078();
}

uint64_t sub_23F25E384()
{
  sub_23F2641AC();
  return sub_23F26824C();
}

uint64_t sub_23F25E3E0()
{
  sub_23F2641AC();
  return sub_23F268228();
}

void ToolDefinition.id.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ToolDefinition.id.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F15EB9C();
  *v1 = v2;
  v1[1] = v0;
  sub_23F12612C();
}

uint64_t (*ToolDefinition.id.modify())()
{
  return nullsub_1;
}

void ToolDefinition.bundleId.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ToolDefinition.bundleId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F250604();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F12612C();
}

uint64_t (*ToolDefinition.bundleId.modify())()
{
  return nullsub_1;
}

void ToolDefinition.displayName.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ToolDefinition.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23F251C94();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  sub_23F12612C();
}

uint64_t (*ToolDefinition.displayName.modify())()
{
  return nullsub_1;
}

void ToolDefinition.explanation.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ToolDefinition.explanation.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  sub_23F12612C();
}

uint64_t (*ToolDefinition.explanation.modify())()
{
  return nullsub_1;
}

unint64_t ToolDefinition.returnType.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  sub_23F12D304(v1);
  return v1;
}

void ToolDefinition.returnType.setter(uint64_t a1)
{
  uint64_t v1;

  sub_23F12E3A8(*(_QWORD *)(v1 + 64));
  *(_QWORD *)(v1 + 64) = a1;
  sub_23F126078();
}

uint64_t (*ToolDefinition.returnType.modify())()
{
  return nullsub_1;
}

uint64_t ToolDefinition.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

void ToolDefinition.parameters.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 72) = a1;
  sub_23F126078();
}

uint64_t (*ToolDefinition.parameters.modify())()
{
  return nullsub_1;
}

_BYTE *ToolDefinition.effect.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = *result;
  return result;
}

uint64_t (*ToolDefinition.effect.modify())()
{
  return nullsub_1;
}

uint64_t ToolDefinition.init(id:bundleId:displayName:explanation:returnType:parameters:effect:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char *a12)
{
  char v12;

  v12 = *a12;
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_QWORD *)(a9 + 64) = a10;
  *(_QWORD *)(a9 + 72) = a11;
  *(_BYTE *)(a9 + 80) = v12;
  return result;
}

void static ToolDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1;
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
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  unint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = sub_23F264398(a1);
  v4 = *(_QWORD *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  v7 = *(_QWORD *)(v3 + 40);
  v8 = *(_QWORD *)(v3 + 56);
  v26 = *(_QWORD *)(v3 + 64);
  v22 = *(_BYTE *)(v3 + 80);
  v9 = *(_QWORD *)(v2 + 16);
  v10 = *(_QWORD *)(v2 + 24);
  v11 = *(_QWORD *)(v2 + 32);
  v12 = *(_QWORD *)(v2 + 40);
  v13 = *(_QWORD *)(v2 + 56);
  v27 = *(_QWORD *)(v2 + 48);
  v28 = *(_QWORD *)(v3 + 48);
  v24 = *(_QWORD *)(v3 + 72);
  v25 = *(_QWORD *)(v2 + 64);
  v23 = *(_QWORD *)(v2 + 72);
  v14 = v1 == *(_QWORD *)v2 && *(_QWORD *)(v3 + 8) == *(_QWORD *)(v2 + 8);
  v21 = *(_BYTE *)(v2 + 80);
  if (v14 || (sub_23F126148() & 1) != 0)
  {
    v15 = v4 == v9 && v6 == v10;
    if (v15 || (sub_23F126148() & 1) != 0)
    {
      v16 = v5 == v11 && v7 == v12;
      if (v16 || (sub_23F126148() & 1) != 0)
      {
        if (v8)
        {
          if (!v13)
            return;
          v17 = v28 == v27 && v8 == v13;
          if (!v17 && (sub_23F126148() & 1) == 0)
            return;
        }
        else if (v13)
        {
          return;
        }
        v18 = v25 & 0xF000000000000007;
        if ((~v26 & 0xF000000000000007) != 0)
        {
          if (v18 == 0xF000000000000007)
            return;
          sub_23F12D304(v25);
          sub_23F12D304(v26);
          static TypeDefinition.== infix(_:_:)(v26);
          v20 = v19;
          sub_23F12E3A8(v25);
          sub_23F12E3A8(v26);
          if ((v20 & 1) == 0)
            return;
        }
        else if (v18 != 0xF000000000000007)
        {
          return;
        }
        if ((sub_23F129B10(v24, v23) & 1) != 0)
          sub_23F1561EC(v22, v21);
      }
    }
  }
}

uint64_t sub_23F25E820(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v12;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_23F268798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_23F268798() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
      if (v7 || (sub_23F268798() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69;
        if (v8 || (sub_23F268798() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x79546E7275746572 && a2 == 0xEA00000000006570;
          if (v9 || (sub_23F268798() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372;
            if (v10 || (sub_23F268798() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0x746365666665 && a2 == 0xE600000000000000)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              v12 = sub_23F268798();
              swift_bridgeObjectRelease();
              if ((v12 & 1) != 0)
                return 6;
              else
                return 7;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_23F25EB0C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F25EB34 + 4 * byte_23F291548[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_23F25EB34()
{
  return 0x6449656C646E7562;
}

uint64_t sub_23F25EB4C()
{
  return 0x4E79616C70736964;
}

uint64_t sub_23F25EB6C()
{
  return 0x74616E616C707865;
}

uint64_t sub_23F25EB8C()
{
  return 0x79546E7275746572;
}

uint64_t sub_23F25EBA8()
{
  return 0x6574656D61726170;
}

uint64_t sub_23F25EBC8()
{
  return 0x746365666665;
}

uint64_t sub_23F25EBDC()
{
  unsigned __int8 *v0;

  return sub_23F25EB0C(*v0);
}

uint64_t sub_23F25EBE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F25E820(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F25EC08()
{
  sub_23F25F63C();
  return sub_23F2688B8();
}

uint64_t sub_23F25EC30()
{
  sub_23F25F63C();
  return sub_23F2688C4();
}

void ToolDefinition.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_23F131874();
  v3 = v2;
  v4 = sub_23F1217E8(&qword_256E094A0);
  sub_23F15E850();
  MEMORY[0x24BDAC7A8](v5);
  sub_23F1262C8();
  v8 = v7 - v6;
  sub_23F12545C(v3, v3[3]);
  sub_23F25F63C();
  sub_23F2688A0();
  sub_23F268720();
  if (!v1)
  {
    sub_23F2643CC();
    sub_23F264460();
    sub_23F264460();
    sub_23F2686F0();
    sub_23F264428();
    sub_23F25F678();
    sub_23F264414();
    sub_23F268714();
    sub_23F1217E8(&qword_256E094B8);
    sub_23F262A3C(&qword_256E094C0, &qword_256E094B8, (uint64_t (*)(void))sub_23F25F6B4, MEMORY[0x24BEE12A0]);
    sub_23F268750();
    sub_23F25F6F0();
    sub_23F264414();
    sub_23F268750();
  }
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v8, v4);
  sub_23F15E830();
  sub_23F1313FC();
}

void ToolDefinition.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;
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
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  sub_23F131874();
  v12 = v11;
  v14 = v13;
  v15 = sub_23F1217E8(&qword_256E094D8);
  MEMORY[0x24BDAC7A8](v15);
  sub_23F1319B0();
  sub_23F12545C(v12, v12[3]);
  sub_23F25F63C();
  sub_23F268888();
  if (v10)
  {
    sub_23F1A9C1C();
    v16 = 0;
    v17 = 0xF000000000000007;
  }
  else
  {
    v18 = sub_23F2642D4();
    v20 = v19;
    sub_23F130928();
    v33 = sub_23F2642D4();
    v34 = v18;
    v22 = v21;
    sub_23F130928();
    v36 = v22;
    v31 = sub_23F2642D4();
    v32 = v14;
    LOBYTE(a10) = 3;
    v24 = v23;
    sub_23F130928();
    v35 = v24;
    v25 = sub_23F264340();
    v27 = v26;
    v30 = v25;
    sub_23F264428();
    v28 = sub_23F25F72C();
    sub_23F13174C();
    sub_23F2642FC();
    sub_23F268678();
    if (v28)
    {
      sub_23F264210();
      sub_23F13190C();
      sub_23F26429C();
      sub_23F1A9C00();
      sub_23F131790();
      v16 = 0;
      v17 = 0xF000000000000007;
    }
    else
    {
      v17 = a10;
      sub_23F1217E8(&qword_256E094B8);
      sub_23F12D304(a10);
      sub_23F262A3C(&qword_256E094E8, &qword_256E094B8, (uint64_t (*)(void))sub_23F25F768, MEMORY[0x24BEE12D0]);
      sub_23F264334();
      v29 = sub_23F25F7A4();
      sub_23F1315C4();
      sub_23F2642FC();
      sub_23F2686B4();
      if (!v29)
      {
        sub_23F264210();
        sub_23F126364();
        sub_23F126140();
        sub_23F13184C();
        sub_23F13174C();
        sub_23F12D304(a10);
        sub_23F12E3A8(a10);
        sub_23F13190C();
        sub_23F1318DC();
        sub_23F131930();
        sub_23F131790();
        *(_QWORD *)v32 = v34;
        *(_QWORD *)(v32 + 8) = v20;
        *(_QWORD *)(v32 + 16) = v33;
        *(_QWORD *)(v32 + 24) = v36;
        *(_QWORD *)(v32 + 32) = v31;
        *(_QWORD *)(v32 + 40) = v35;
        *(_QWORD *)(v32 + 48) = v30;
        *(_QWORD *)(v32 + 56) = v27;
        *(_QWORD *)(v32 + 64) = a10;
        *(_QWORD *)(v32 + 72) = a10;
        *(_BYTE *)(v32 + 80) = 3;
        sub_23F1A9C1C();
        sub_23F131790();
        sub_23F131930();
        sub_23F1318DC();
        sub_23F13190C();
        sub_23F12E3A8(a10);
        goto LABEL_5;
      }
      sub_23F264210();
      sub_23F131930();
      sub_23F12E3A8(a10);
      sub_23F13190C();
      sub_23F26429C();
      sub_23F1A9C00();
      sub_23F131790();
      v16 = 1;
    }
    sub_23F1A9C1C();
    sub_23F13190C();
    sub_23F26429C();
    sub_23F1A9C00();
  }
  sub_23F131790();
  sub_23F12E3A8(v17);
  if (v16)
LABEL_5:
    swift_bridgeObjectRelease();
  sub_23F1313FC();
}

void sub_23F25F228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  unint64_t vars8;

  ToolDefinition.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_23F25F23C()
{
  ToolDefinition.encode(to:)();
}

uint64_t (*ParameterDefinition.id.modify())()
{
  return nullsub_1;
}

uint64_t (*ParameterDefinition.displayName.modify())()
{
  return nullsub_1;
}

unint64_t ParameterDefinition.type.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_23F12D318(v1);
  return v1;
}

void ParameterDefinition.type.setter(uint64_t a1)
{
  uint64_t v1;

  sub_23F12E3BC(*(_QWORD *)(v1 + 32));
  *(_QWORD *)(v1 + 32) = a1;
  sub_23F126078();
}

uint64_t (*ParameterDefinition.type.modify())()
{
  return nullsub_1;
}

void ParameterDefinition.explanation.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ParameterDefinition.explanation.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23F264360();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  sub_23F12612C();
}

uint64_t (*ParameterDefinition.explanation.modify())()
{
  return nullsub_1;
}

uint64_t ParameterDefinition.init(id:displayName:type:explanation:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v12;

  v12 = result;
  if (!a4)
  {
    result = sub_23F126140();
    a3 = v12;
    a4 = a2;
  }
  *a8 = v12;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  a8[6] = a7;
  return result;
}

void static ParameterDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  BOOL v16;
  char v17;
  char v18;

  v2 = sub_23F26444C(a1);
  v7 = v5[3];
  v6 = v5[4];
  v9 = v5[5];
  v8 = v5[6];
  v10 = v4[2];
  v11 = v4[3];
  v12 = v4[5];
  v13 = v4[6];
  v14 = v2 == *v4 && v3 == v4[1];
  if (v14 || (sub_23F126148(), sub_23F15E5CC(), (v15 & 1) != 0))
  {
    v16 = v1 == v10 && v7 == v11;
    if (v16 || (sub_23F126148(), sub_23F15E5CC(), (v17 & 1) != 0))
    {
      static TypeDefinition.== infix(_:_:)(v6);
      if ((v18 & 1) != 0 && v8 && v13 && (v9 != v12 || v8 != v13))
        sub_23F126148();
    }
  }
  sub_23F125EFC();
}

void static TypeDefinition.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23F25F484(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;

  if (a2 >> 61)
    return 0;
  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a2 + 16);
  sub_23F12D318(v2);
  sub_23F12D318(v3);
  v4 = sub_23F1317E0();
  v5 = ((uint64_t (*)(uint64_t))static TypeDefinition.== infix(_:_:))(v4);
  sub_23F12E3BC(v3);
  sub_23F12E3BC(v2);
  return v5 & 1;
}

unint64_t sub_23F25F63C()
{
  unint64_t result;

  result = qword_256E094A8;
  if (!qword_256E094A8)
  {
    result = MEMORY[0x242667160](&unk_23F2920A0, &type metadata for ToolDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E094A8);
  }
  return result;
}

unint64_t sub_23F25F678()
{
  unint64_t result;

  result = qword_256E094B0;
  if (!qword_256E094B0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for TypeDefinition, &type metadata for TypeDefinition);
    atomic_store(result, (unint64_t *)&qword_256E094B0);
  }
  return result;
}

unint64_t sub_23F25F6B4()
{
  unint64_t result;

  result = qword_256E094C8;
  if (!qword_256E094C8)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ParameterDefinition, &type metadata for ParameterDefinition);
    atomic_store(result, (unint64_t *)&qword_256E094C8);
  }
  return result;
}

unint64_t sub_23F25F6F0()
{
  unint64_t result;

  result = qword_256E094D0;
  if (!qword_256E094D0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ToolEffect, &type metadata for ToolEffect);
    atomic_store(result, (unint64_t *)&qword_256E094D0);
  }
  return result;
}

unint64_t sub_23F25F72C()
{
  unint64_t result;

  result = qword_256E094E0;
  if (!qword_256E094E0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for TypeDefinition, &type metadata for TypeDefinition);
    atomic_store(result, (unint64_t *)&qword_256E094E0);
  }
  return result;
}

unint64_t sub_23F25F768()
{
  unint64_t result;

  result = qword_256E094F0;
  if (!qword_256E094F0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ParameterDefinition, &type metadata for ParameterDefinition);
    atomic_store(result, (unint64_t *)&qword_256E094F0);
  }
  return result;
}

unint64_t sub_23F25F7A4()
{
  unint64_t result;

  result = qword_256E094F8;
  if (!qword_256E094F8)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ToolEffect, &type metadata for ToolEffect);
    atomic_store(result, (unint64_t *)&qword_256E094F8);
  }
  return result;
}

uint64_t sub_23F25F7E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_23F268798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
    if (v6 || (sub_23F268798() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 1701869940 && a2 == 0xE400000000000000;
      if (v7 || (sub_23F268798() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_23F268798();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_23F25F994(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F25F9BC + 4 * byte_23F29155D[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_23F25F9BC()
{
  return 0x4E79616C70736964;
}

uint64_t sub_23F25F9DC()
{
  return 1701869940;
}

uint64_t sub_23F25F9EC()
{
  return 0x74616E616C707865;
}

uint64_t sub_23F25FA0C()
{
  unsigned __int8 *v0;

  return sub_23F25F994(*v0);
}

uint64_t sub_23F25FA14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F25F7E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F25FA38()
{
  sub_23F260D50();
  return sub_23F2688B8();
}

uint64_t sub_23F25FA60()
{
  sub_23F260D50();
  return sub_23F2688C4();
}

void ParameterDefinition.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F131874();
  sub_23F1217E8(&qword_256E09500);
  sub_23F15E850();
  MEMORY[0x24BDAC7A8](v1);
  sub_23F1319C8();
  sub_23F2642B4();
  sub_23F260D50();
  sub_23F2642E8();
  sub_23F24FE44();
  if (!v0)
  {
    sub_23F2643E0();
    sub_23F1A931C();
    sub_23F180274();
    sub_23F25F678();
    sub_23F1315CC();
    sub_23F264434();
    sub_23F15E4D8();
  }
  sub_23F264388();
  sub_23F15E830();
  sub_23F1313FC();
}

void ParameterDefinition.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  sub_23F131874();
  v3 = v2;
  v5 = v4;
  v6 = sub_23F1217E8(&qword_256E09510);
  sub_23F15E53C();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F12545C(v3, v3[3]);
  sub_23F260D50();
  sub_23F26431C();
  if (v0)
  {
    sub_23F131BF4();
  }
  else
  {
    v10 = sub_23F2642A4();
    v12 = v11;
    v24 = v10;
    sub_23F130928();
    v13 = sub_23F2642A4();
    v25 = v14;
    v23 = v13;
    sub_23F180274();
    sub_23F25F72C();
    sub_23F1315C4();
    sub_23F2686B4();
    sub_23F264434();
    v22 = v15;
    sub_23F12D318(v15);
    v16 = sub_23F268654();
    v17 = *(void (**)(char *, uint64_t))(v1 + 8);
    v18 = v16;
    v17(v9, v6);
    sub_23F1315C4();
    sub_23F14C66C();
    sub_23F126140();
    v19 = v25;
    sub_23F126364();
    v20 = v22;
    sub_23F12D318(v22);
    sub_23F12E3BC(v20);
    sub_23F1318DC();
    sub_23F13190C();
    *v5 = v24;
    v5[1] = v12;
    v5[2] = v23;
    v5[3] = v19;
    v5[4] = v20;
    v5[5] = v18;
    sub_23F2643C0();
    sub_23F13190C();
    sub_23F1318DC();
    sub_23F12E3BC(v20);
  }
  swift_bridgeObjectRelease();
  sub_23F15E910();
  sub_23F1313FC();
}

void sub_23F25FDD4()
{
  ParameterDefinition.init(from:)();
}

void sub_23F25FDE8()
{
  ParameterDefinition.encode(to:)();
}

void TypeDefinition.nestedDefinitions.getter(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23F25FE40()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23F12D318(v1);
  TypeDefinition.nestedDefinitions.getter(v1);
  v3 = v2;
  sub_23F12E3BC(v1);
  return v3;
}

void TypeDefinition.encode(to:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

unint64_t sub_23F2600D0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t inited;

  v2 = *(_QWORD *)(a2 + 16);
  sub_23F1217E8(&qword_256E09528);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F269B40;
  *(_QWORD *)(inited + 32) = 0x7961727261;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_QWORD *)(inited + 48) = v2;
  sub_23F12D318(v2);
  sub_23F12D318(v2);
  sub_23F268108();
  sub_23F25F678();
  sub_23F268114();
  sub_23F1318DC();
  return sub_23F12E3BC(v2);
}

void TypeDefinition.init(from:)()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
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
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  sub_23F131874();
  v3 = v2;
  v4 = sub_23F1217E8(&qword_256E09540);
  MEMORY[0x24BDAC7A8](v4);
  sub_23F1262C8();
  v7 = v6 - v5;
  v8 = sub_23F1217E8(&qword_256E09548);
  sub_23F15E850();
  MEMORY[0x24BDAC7A8](v9);
  sub_23F1262C8();
  v12 = v11 - v10;
  sub_23F2642B4();
  sub_23F262800();
  sub_23F268888();
  if (v1)
  {

    sub_23F16BD38(v7, 1);
    sub_23F26283C(v7);
    sub_23F26287C((uint64_t)v3, (uint64_t)&v34);
    v14 = sub_23F268198();
    v15 = v13;
    v16 = v14 == 7958113 && v13 == 0xE300000000000000;
    if (v16
      || (sub_23F26423C() & 1) != 0
      || (v14 == 1819242338 ? (v21 = v15 == 0xE400000000000000) : (v21 = 0), v21 || (sub_23F26423C() & 1) != 0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = v14 == 7630441 && v15 == 0xE300000000000000;
      if (!v22 && (sub_23F26423C() & 1) == 0)
      {
        v23 = v14 == 0x656C62756F64 && v15 == 0xE600000000000000;
        if (!v23 && (sub_23F26423C() & 1) == 0)
        {
          v24 = v14 == 0x676E69727473 && v15 == 0xE600000000000000;
          if (!v24 && (sub_23F26423C() & 1) == 0)
          {
            v25 = v14 == 7107189 && v15 == 0xE300000000000000;
            if (!v25 && (sub_23F26423C() & 1) == 0)
            {
              v26 = v14 == 1702125924 && v15 == 0xE400000000000000;
              if (!v26 && (sub_23F126148() & 1) == 0)
              {
                v27 = v14 == 0x706D6F4365746164 && v15 == 0xEE0073746E656E6FLL;
                if (!v27 && (sub_23F126148() & 1) == 0)
                {
                  if (v14 == 0x72616D6563616C70 && v15 == 0xE90000000000006BLL)
                  {
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    v29 = sub_23F126148();
                    sub_23F1318DC();
                    if ((v29 & 1) == 0)
                    {
                      v30 = sub_23F268594();
                      sub_23F131B30();
                      v32 = v31;
                      sub_23F12545C(v3, v3[3]);
                      sub_23F268870();
                      sub_23F268588();
                      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, *MEMORY[0x24BEE26D8], v30);
                      swift_willThrow();
                      goto LABEL_18;
                    }
                  }
                  sub_23F26425C();
                  goto LABEL_18;
                }
              }
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      sub_23F26425C();
    }
  }
  else
  {
    sub_23F16BD38(v7, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v12, v7, v8);
    v17 = sub_23F2686D8();
    if (*(_QWORD *)(v17 + 16))
    {
      v18 = *(unsigned __int8 *)(v17 + 32);
      swift_bridgeObjectRelease();
      __asm { BR              X9 }
    }
    swift_bridgeObjectRelease();
    v19 = sub_23F268594();
    sub_23F131B30();
    v33 = v20;
    sub_23F12545C(v3, v3[3]);
    sub_23F268870();
    sub_23F268588();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v33, *MEMORY[0x24BEE26D8], v19);
    swift_willThrow();
    sub_23F17FF08(v12, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  }
LABEL_18:
  _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v3);
  sub_23F15E910();
}

uint64_t static ObjectDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
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
  BOOL v15;
  uint64_t v16;
  uint64_t result;
  char v18;
  BOOL v19;
  char v20;
  char v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  v1 = sub_23F264398(a1);
  v4 = v3[1];
  v5 = v3[2];
  v7 = v3[3];
  v6 = v3[4];
  v8 = v3[5];
  v9 = v3[6];
  v10 = v3[7];
  v12 = v2[2];
  v11 = v2[3];
  v14 = v2[4];
  v13 = v2[5];
  v15 = v1 == *v2 && v4 == v2[1];
  v16 = v2[6];
  v26 = v10;
  v27 = v2[7];
  if (!v15)
  {
    sub_23F126148();
    result = sub_23F15E5CC();
    if ((v18 & 1) == 0)
      return result;
  }
  if (!v7)
  {
    if (v11)
      return 0;
    goto LABEL_15;
  }
  if (!v11)
    return 0;
  v19 = v5 == v12 && v7 == v11;
  if (v19 || (sub_23F126148(), result = sub_23F15E5CC(), (v20 & 1) != 0))
  {
LABEL_15:
    if ((sub_23F129B10(v6, v14) & 1) != 0)
    {
      if (v9)
      {
        if (!v16)
          return 0;
        if (v8 != v13 || v9 != v16)
        {
          sub_23F126148();
          result = sub_23F15E5CC();
          if ((v22 & 1) == 0)
            return result;
        }
      }
      else if (v16)
      {
        return 0;
      }
      if (v26)
      {
        if (v27)
        {
          swift_bridgeObjectRetain();
          v23 = sub_23F1315C4();
          sub_23F129CFC(v23, v27);
          v25 = v24;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v25 & 1) != 0)
            return 1;
        }
      }
      else if (!v27)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

void static EnumDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v11;

  v1 = sub_23F264398(a1);
  v4 = v3[2];
  v5 = v3[3];
  v7 = v2[2];
  v6 = v2[3];
  v8 = v1 == *v2 && v3[1] == v2[1];
  if (v8 || (sub_23F126148() & 1) != 0)
  {
    if (v5)
    {
      if (v6)
      {
        v9 = v4 == v7 && v5 == v6;
        if (v9 || (sub_23F126148() & 1) != 0)
          goto LABEL_13;
      }
    }
    else if (!v6)
    {
LABEL_13:
      v10 = (_QWORD *)sub_23F1317E0();
      sub_23F129820(v10, v11);
    }
  }
}

unint64_t sub_23F260D50()
{
  unint64_t result;

  result = qword_256E09508;
  if (!qword_256E09508)
  {
    result = MEMORY[0x242667160](&unk_23F292050, &type metadata for ParameterDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09508);
  }
  return result;
}

void sub_23F260D8C(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  TypeDefinition.init(from:)();
  if (!v1)
    *a1 = v3;
}

void sub_23F260DB4(uint64_t a1)
{
  uint64_t *v1;

  TypeDefinition.encode(to:)(a1, *v1);
}

void sub_23F260DCC(uint64_t *a1)
{
  static TypeDefinition.== infix(_:_:)(*a1);
}

void ObjectDefinition.id.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ObjectDefinition.id.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F15EB9C();
  *v1 = v2;
  v1[1] = v0;
  sub_23F12612C();
}

uint64_t (*ObjectDefinition.id.modify())()
{
  return nullsub_1;
}

void ObjectDefinition.bundleId.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ObjectDefinition.bundleId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F250604();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F12612C();
}

uint64_t (*ObjectDefinition.bundleId.modify())()
{
  return nullsub_1;
}

void ObjectDefinition.properties.setter()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F2643A8();
  *(_QWORD *)(v1 + 32) = v0;
  sub_23F126078();
}

uint64_t (*ObjectDefinition.properties.modify())()
{
  return nullsub_1;
}

void ObjectDefinition.explanation.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void ObjectDefinition.explanation.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23F264360();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  sub_23F12612C();
}

uint64_t (*ObjectDefinition.explanation.modify())()
{
  return nullsub_1;
}

uint64_t ObjectDefinition.queries.getter()
{
  return swift_bridgeObjectRetain();
}

void ObjectDefinition.queries.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 56) = a1;
  sub_23F126078();
}

uint64_t (*ObjectDefinition.queries.modify())()
{
  return nullsub_1;
}

uint64_t ObjectDefinition.init(id:bundleId:properties:explanation:queries:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t sub_23F260F50(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_23F268798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_23F268798() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x69747265706F7270 && a2 == 0xEA00000000007365;
      if (v7 || (sub_23F268798() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69;
        if (v8 || (sub_23F268798() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x73656972657571 && a2 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_23F268798();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_23F261168(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F261190 + 4 * byte_23F291573[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_23F261190()
{
  return 0x6449656C646E7562;
}

uint64_t sub_23F2611A8()
{
  return 0x69747265706F7270;
}

uint64_t sub_23F2611C4()
{
  return 0x74616E616C707865;
}

uint64_t sub_23F2611E4()
{
  return 0x73656972657571;
}

uint64_t sub_23F2611FC()
{
  unsigned __int8 *v0;

  return sub_23F261168(*v0);
}

uint64_t sub_23F261204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F260F50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F261228()
{
  sub_23F2629C4();
  return sub_23F2688B8();
}

uint64_t sub_23F261250()
{
  sub_23F2629C4();
  return sub_23F2688C4();
}

void ObjectDefinition.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23F131874();
  v2 = sub_23F1217E8(&qword_256E09568);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  sub_23F264268();
  sub_23F2642B4();
  sub_23F2629C4();
  sub_23F2642E8();
  sub_23F24FE44();
  if (!v0)
  {
    sub_23F2643CC();
    sub_23F15E4D8();
    sub_23F12636C();
    sub_23F264368(&qword_256E094C0, v4, (uint64_t (*)(void))sub_23F25F6B4, MEMORY[0x24BEE12A0]);
    sub_23F1315CC();
    sub_23F15E4D8();
    sub_23F264428();
    sub_23F12636C();
    sub_23F264368(&qword_256E09580, v5, (uint64_t (*)(void))sub_23F262A00, MEMORY[0x24BEE12A0]);
    sub_23F268714();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_23F15E830();
  sub_23F1313FC();
}

void ObjectDefinition.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t *v14;
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
  uint64_t *v32;
  uint64_t v33;

  sub_23F131874();
  v12 = v11;
  v14 = v13;
  v15 = sub_23F1217E8(&qword_256E09590);
  MEMORY[0x24BDAC7A8](v15);
  sub_23F1319B0();
  sub_23F12545C(v12, v12[3]);
  sub_23F2629C4();
  sub_23F268888();
  if (v10)
  {
    sub_23F1A9C1C();
  }
  else
  {
    v16 = sub_23F268684();
    v18 = v17;
    v33 = v16;
    LOBYTE(a10) = 1;
    sub_23F130928();
    v19 = sub_23F264340();
    v21 = v20;
    v31 = v19;
    v32 = v14;
    sub_23F12636C();
    sub_23F264368(&qword_256E094E8, v22, (uint64_t (*)(void))sub_23F25F768, MEMORY[0x24BEE12D0]);
    v24 = v23;
    sub_23F126364();
    sub_23F264334();
    if (!v24)
    {
      v25 = a10;
      LOBYTE(a10) = 3;
      v30 = v25;
      swift_bridgeObjectRetain();
      v26 = sub_23F264340();
      v28 = v27;
      v29 = v26;
      sub_23F1217E8(&qword_256E09578);
      sub_23F264428();
      sub_23F262A3C(&qword_256E09598, &qword_256E09578, (uint64_t (*)(void))sub_23F262A94, MEMORY[0x24BEE12D0]);
      sub_23F2643F4();
      sub_23F264400();
      sub_23F268678();
      sub_23F26424C();
      sub_23F1315C4();
      sub_23F14C66C();
      *v32 = v33;
      v32[1] = v18;
      v32[2] = v31;
      v32[3] = v21;
      v32[4] = v30;
      v32[5] = v29;
      v32[6] = v28;
      v32[7] = a10;
      sub_23F1A9C1C();
      sub_23F1317F8();
      sub_23F13186C();
      sub_23F131930();
      sub_23F13190C();
      goto LABEL_5;
    }
    sub_23F26424C();
    sub_23F1318DC();
    sub_23F13190C();
    sub_23F1A9C1C();
    sub_23F1318DC();
  }
  sub_23F13190C();
  sub_23F14C66C();
LABEL_5:
  swift_bridgeObjectRelease();
  sub_23F1313FC();
}

void sub_23F2616D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  ObjectDefinition.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_23F2616E8()
{
  ObjectDefinition.encode(to:)();
}

void EnumDefinition.id.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void EnumDefinition.id.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F15EB9C();
  *v1 = v2;
  v1[1] = v0;
  sub_23F12612C();
}

uint64_t (*EnumDefinition.id.modify())()
{
  return nullsub_1;
}

void EnumDefinition.bundleId.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void EnumDefinition.bundleId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F250604();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F12612C();
}

uint64_t (*EnumDefinition.bundleId.modify())()
{
  return nullsub_1;
}

void EnumDefinition.cases.setter()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F2643A8();
  *(_QWORD *)(v1 + 32) = v0;
  sub_23F126078();
}

uint64_t (*EnumDefinition.cases.modify())()
{
  return nullsub_1;
}

void __swiftcall EnumDefinition.init(id:bundleId:cases:)(IntelligenceFlow::EnumDefinition *__return_ptr retstr, Swift::String id, Swift::String_optional bundleId, Swift::OpaquePointer cases)
{
  retstr->id = id;
  retstr->bundleId = bundleId;
  retstr->cases = cases;
}

uint64_t sub_23F2617E0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_23F268798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_23F268798() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x7365736163 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_23F268798();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_23F26190C(char a1)
{
  if (!a1)
    return 25705;
  if (a1 == 1)
    return 0x6449656C646E7562;
  return 0x7365736163;
}

void sub_23F261954()
{
  sub_23F25E1EC();
}

uint64_t sub_23F26196C()
{
  char *v0;

  return sub_23F26190C(*v0);
}

uint64_t sub_23F261974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2617E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F261998()
{
  sub_23F262AD0();
  return sub_23F2688B8();
}

uint64_t sub_23F2619C0()
{
  sub_23F262AD0();
  return sub_23F2688C4();
}

void EnumDefinition.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_23F131874();
  v2 = v1;
  sub_23F1217E8(&qword_256E095A8);
  sub_23F15E850();
  MEMORY[0x24BDAC7A8](v3);
  sub_23F1319C8();
  sub_23F12545C(v2, v2[3]);
  sub_23F262AD0();
  sub_23F2688A0();
  sub_23F24FE44();
  if (!v0)
  {
    sub_23F15E4D8();
    sub_23F180274();
    sub_23F1217E8(&qword_256DFE7C8);
    sub_23F262B0C(&qword_256DFE7D0, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23F1315CC();
  }
  sub_23F264388();
  sub_23F15E830();
  sub_23F1313FC();
}

void EnumDefinition.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
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

  sub_23F131874();
  v3 = v2;
  v5 = v4;
  sub_23F1217E8(&qword_256E095B8);
  sub_23F15E53C();
  MEMORY[0x24BDAC7A8](v6);
  sub_23F1262C8();
  v9 = v8 - v7;
  sub_23F12545C(v3, v3[3]);
  sub_23F262AD0();
  sub_23F268888();
  if (v0)
  {
    sub_23F131BF4();
  }
  else
  {
    v10 = sub_23F268684();
    v12 = v11;
    v17 = v10;
    sub_23F130928();
    v13 = sub_23F268654();
    v15 = v14;
    v16 = v13;
    sub_23F1217E8(&qword_256DFE7C8);
    sub_23F180274();
    sub_23F262B0C(&qword_256DFE7E0, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_23F2643F4();
    sub_23F264400();
    sub_23F2686B4();
    sub_23F15E7D4(v9, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    sub_23F126364();
    sub_23F1315C4();
    sub_23F13190C();
    *v5 = v17;
    v5[1] = v12;
    v5[2] = v16;
    v5[3] = v15;
    v5[4] = v18;
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v3);
    sub_23F1317F8();
    sub_23F13186C();
  }
  swift_bridgeObjectRelease();
  sub_23F15E910();
  sub_23F1313FC();
}

void sub_23F261D10()
{
  EnumDefinition.init(from:)();
}

void sub_23F261D24()
{
  EnumDefinition.encode(to:)();
}

void QueryDefinition.id.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void QueryDefinition.id.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F15EB9C();
  *v1 = v2;
  v1[1] = v0;
  sub_23F12612C();
}

uint64_t (*QueryDefinition.id.modify())()
{
  return nullsub_1;
}

void QueryDefinition.entityId.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void QueryDefinition.entityId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F250604();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F12612C();
}

uint64_t (*QueryDefinition.entityId.modify())()
{
  return nullsub_1;
}

void QueryDefinition.bundleId.getter()
{
  sub_23F1315C4();
  sub_23F1317E0();
  sub_23F126078();
}

void QueryDefinition.bundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23F251C94();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  sub_23F12612C();
}

uint64_t (*QueryDefinition.bundleId.modify())()
{
  return nullsub_1;
}

uint64_t QueryDefinition.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

void QueryDefinition.parameters.setter(uint64_t a1)
{
  uint64_t v1;

  sub_23F264360();
  *(_QWORD *)(v1 + 48) = a1;
  sub_23F126078();
}

uint64_t (*QueryDefinition.parameters.modify())()
{
  return nullsub_1;
}

void __swiftcall QueryDefinition.init(id:entityId:bundleId:parameters:)(IntelligenceFlow::QueryDefinition *__return_ptr retstr, Swift::String id, Swift::String entityId, Swift::String bundleId, Swift::OpaquePointer parameters)
{
  retstr->id = id;
  retstr->entityId = entityId;
  retstr->bundleId = bundleId;
  retstr->parameters = parameters;
}

void static QueryDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v2 = sub_23F26444C(a1);
  v7 = v5[3];
  v6 = v5[4];
  v8 = v5[5];
  v9 = v4[2];
  v10 = v4[3];
  v11 = v4[4];
  v12 = v4[5];
  v13 = v2 == *v4 && v3 == v4[1];
  if ((v13 || (sub_23F126148() & 1) != 0)
    && (v1 == v9 ? (v14 = v7 == v10) : (v14 = 0),
        (v14 || (sub_23F126148() & 1) != 0)
     && (v6 == v11 ? (v15 = v8 == v12) : (v15 = 0), v15 || (sub_23F126148() & 1) != 0)))
  {
    v16 = sub_23F1317E0();
    sub_23F129B10(v16, v17);
  }
  else
  {
    sub_23F125EFC();
  }
}

uint64_t sub_23F261F40(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_23F268798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
    if (v6 || (sub_23F268798() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
      if (v7 || (sub_23F268798() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_23F268798();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_23F2620E8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F262110 + 4 * byte_23F291578[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_23F262110()
{
  return 0x6449797469746E65;
}

uint64_t sub_23F26213C()
{
  return 0x6574656D61726170;
}

uint64_t sub_23F262158()
{
  unsigned __int8 *v0;

  return sub_23F2620E8(*v0);
}

uint64_t sub_23F262160@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F261F40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F262184()
{
  sub_23F262B60();
  return sub_23F2688B8();
}

uint64_t sub_23F2621AC()
{
  sub_23F262B60();
  return sub_23F2688C4();
}

void QueryDefinition.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23F131874();
  sub_23F1217E8(&qword_256E095C0);
  sub_23F15E850();
  MEMORY[0x24BDAC7A8](v3);
  sub_23F264268();
  sub_23F2642B4();
  sub_23F262B60();
  sub_23F2642E8();
  sub_23F24FE44();
  if (!v1)
  {
    sub_23F2643E0();
    sub_23F1A931C();
    sub_23F180274();
    sub_23F1A931C();
    sub_23F264434();
    sub_23F12636C();
    sub_23F264368(&qword_256E094C0, v4, (uint64_t (*)(void))sub_23F25F6B4, MEMORY[0x24BEE12A0]);
    sub_23F1315CC();
  }
  sub_23F15E7D4(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_23F15E830();
  sub_23F1313FC();
}

void QueryDefinition.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
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

  sub_23F131874();
  v2 = v1;
  v4 = v3;
  sub_23F1217E8(&qword_256E095D0);
  sub_23F15E53C();
  MEMORY[0x24BDAC7A8](v5);
  sub_23F12545C(v2, v2[3]);
  sub_23F262B60();
  sub_23F26431C();
  if (v0)
  {
    sub_23F131BF4();
  }
  else
  {
    v6 = sub_23F2642A4();
    v8 = v7;
    sub_23F130928();
    v9 = sub_23F2642A4();
    v16 = v10;
    v14 = v9;
    v15 = v6;
    sub_23F180274();
    sub_23F130928();
    v13 = sub_23F268684();
    v12 = v11;
    sub_23F1217E8(&qword_256E094B8);
    sub_23F264434();
    sub_23F262A3C(&qword_256E094E8, &qword_256E094B8, (uint64_t (*)(void))sub_23F25F768, MEMORY[0x24BEE12D0]);
    sub_23F126364();
    sub_23F2686B4();
    sub_23F264200();
    sub_23F126140();
    sub_23F126364();
    sub_23F1315C4();
    sub_23F1318DC();
    sub_23F13190C();
    *v4 = v15;
    v4[1] = v8;
    v4[2] = v14;
    v4[3] = v16;
    v4[4] = v13;
    v4[5] = v12;
    sub_23F2643C0();
    sub_23F1317F8();
    sub_23F131790();
    sub_23F13190C();
    swift_bridgeObjectRelease();
  }
  sub_23F15E910();
  sub_23F1313FC();
}

uint64_t sub_23F262530()
{
  unint64_t v0;

  v0 = sub_23F268630();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_23F26257C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F2625AC + 4 * byte_23F29157C[a1]))(0x7961727261, 0xE500000000000000);
}

uint64_t sub_23F2625AC()
{
  return 0x6C616E6F6974706FLL;
}

uint64_t sub_23F2625C4()
{
  return 0x7463656A626FLL;
}

uint64_t sub_23F2625D8()
{
  return 1836412517;
}

uint64_t sub_23F2625E8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23F262618 + 4 * byte_23F291580[a1]))(0x7961727261, 0xE500000000000000);
}

uint64_t sub_23F262618()
{
  return 0x6C616E6F6974706FLL;
}

uint64_t sub_23F262630()
{
  return 0x7463656A626FLL;
}

uint64_t sub_23F262644()
{
  return 1836412517;
}

void sub_23F262654()
{
  QueryDefinition.init(from:)();
}

void sub_23F262668()
{
  QueryDefinition.encode(to:)();
}

void sub_23F262680(char *a1)
{
  sub_23F1560DC(*a1);
}

void sub_23F26268C()
{
  unsigned __int8 *v0;

  sub_23F25E220(*v0, (void (*)(_BYTE *, uint64_t))sub_23F156458);
}

void sub_23F2626AC(uint64_t a1)
{
  char *v1;

  sub_23F156458(a1, *v1);
}

void sub_23F2626B4(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_23F1565F0(a1, *v1);
}

uint64_t sub_23F2626BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F262530();
  *a1 = result;
  return result;
}

void sub_23F2626E8(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_23F26257C(*v1);
  a1[1] = v3;
  sub_23F126078();
}

uint64_t sub_23F26270C()
{
  unsigned __int8 *v0;

  return sub_23F2625E8(*v0);
}

uint64_t sub_23F262714@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F262578();
  *a1 = result;
  return result;
}

uint64_t sub_23F262738()
{
  sub_23F262800();
  return sub_23F2688B8();
}

uint64_t sub_23F262760()
{
  sub_23F262800();
  return sub_23F2688C4();
}

unint64_t sub_23F262788()
{
  unint64_t result;

  result = qword_256E09520;
  if (!qword_256E09520)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for EnumDefinition, &type metadata for EnumDefinition);
    atomic_store(result, (unint64_t *)&qword_256E09520);
  }
  return result;
}

unint64_t sub_23F2627C4()
{
  unint64_t result;

  result = qword_256E09538;
  if (!qword_256E09538)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ObjectDefinition, &type metadata for ObjectDefinition);
    atomic_store(result, (unint64_t *)&qword_256E09538);
  }
  return result;
}

unint64_t sub_23F262800()
{
  unint64_t result;

  result = qword_256E09550;
  if (!qword_256E09550)
  {
    result = MEMORY[0x242667160](&unk_23F292000, &type metadata for TypeDefinition.ComplexKey);
    atomic_store(result, (unint64_t *)&qword_256E09550);
  }
  return result;
}

uint64_t sub_23F26283C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23F1217E8(&qword_256E09540);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23F26287C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23F2628C0()
{
  unint64_t result;

  result = qword_256E09558;
  if (!qword_256E09558)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for EnumDefinition, &type metadata for EnumDefinition);
    atomic_store(result, (unint64_t *)&qword_256E09558);
  }
  return result;
}

uint64_t sub_23F2628FC()
{
  swift_bridgeObjectRelease();
  sub_23F251C94();
  sub_23F264360();
  return swift_deallocObject();
}

unint64_t sub_23F262928()
{
  unint64_t result;

  result = qword_256E09560;
  if (!qword_256E09560)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ObjectDefinition, &type metadata for ObjectDefinition);
    atomic_store(result, (unint64_t *)&qword_256E09560);
  }
  return result;
}

uint64_t sub_23F262964()
{
  swift_bridgeObjectRelease();
  sub_23F251C94();
  sub_23F264360();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23F2629A0()
{
  uint64_t v0;

  sub_23F12E3BC(*(_QWORD *)(v0 + 16));
  return swift_deallocObject();
}

unint64_t sub_23F2629C4()
{
  unint64_t result;

  result = qword_256E09570;
  if (!qword_256E09570)
  {
    result = MEMORY[0x242667160](&unk_23F291FB0, &type metadata for ObjectDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09570);
  }
  return result;
}

unint64_t sub_23F262A00()
{
  unint64_t result;

  result = qword_256E09588;
  if (!qword_256E09588)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for QueryDefinition, &type metadata for QueryDefinition);
    atomic_store(result, (unint64_t *)&qword_256E09588);
  }
  return result;
}

void sub_23F262A3C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;

  if (!*a1)
  {
    v7 = sub_23F125540(a2);
    v8 = a3();
    atomic_store(MEMORY[0x242667160](a4, v7, &v8), a1);
  }
  sub_23F131634();
}

unint64_t sub_23F262A94()
{
  unint64_t result;

  result = qword_256E095A0;
  if (!qword_256E095A0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for QueryDefinition, &type metadata for QueryDefinition);
    atomic_store(result, (unint64_t *)&qword_256E095A0);
  }
  return result;
}

unint64_t sub_23F262AD0()
{
  unint64_t result;

  result = qword_256E095B0;
  if (!qword_256E095B0)
  {
    result = MEMORY[0x242667160](&unk_23F291F60, &type metadata for EnumDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E095B0);
  }
  return result;
}

void sub_23F262B0C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = sub_23F125540(&qword_256DFE7C8);
    v7 = a2;
    atomic_store(MEMORY[0x242667160](a3, v6, &v7), a1);
  }
  sub_23F131634();
}

unint64_t sub_23F262B60()
{
  unint64_t result;

  result = qword_256E095C8;
  if (!qword_256E095C8)
  {
    result = MEMORY[0x242667160](&unk_23F291F10, &type metadata for QueryDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E095C8);
  }
  return result;
}

unint64_t sub_23F262BA0()
{
  unint64_t result;

  result = qword_256E095D8;
  if (!qword_256E095D8)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ToolEffect, &type metadata for ToolEffect);
    atomic_store(result, (unint64_t *)&qword_256E095D8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ToolEffect(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23F262C28 + 4 * byte_23F291589[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23F262C5C + 4 * byte_23F291584[v4]))();
}

uint64_t sub_23F262C5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F262C64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F262C6CLL);
  return result;
}

uint64_t sub_23F262C78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F262C80);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23F262C84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F262C8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ToolEffect()
{
  sub_23F131844();
}

uint64_t destroy for ToolDefinition(uint64_t a1)
{
  unint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(a1 + 64);
  if ((~v2 & 0xF000000000000007) != 0)
    sub_23F12E3BC(v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ToolDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((~v8 & 0xF000000000000007) != 0)
    sub_23F12D318(v8);
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v9;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ToolDefinition(uint64_t a1, uint64_t a2)
{
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (unint64_t *)(a1 + 64);
  v5 = *(_QWORD *)(a2 + 64);
  v6 = v5 & 0xF000000000000007;
  if ((~*(_QWORD *)(a1 + 64) & 0xF000000000000007) != 0)
  {
    if (v6 == 0xF000000000000007)
    {
      sub_23F12F43C((unint64_t *)(a1 + 64));
      *v4 = *(_QWORD *)(a2 + 64);
    }
    else
    {
      sub_23F12D318(*(_QWORD *)(a2 + 64));
      v7 = *v4;
      *v4 = v5;
      sub_23F12E3BC(v7);
    }
  }
  else
  {
    if (v6 != 0xF000000000000007)
      sub_23F12D318(*(_QWORD *)(a2 + 64));
    *v4 = v5;
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

void *initializeWithTake for ToolDefinition(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

uint64_t assignWithTake for ToolDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v9 = (_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a2 + 64);
  if ((~v8 & 0xF000000000000007) != 0)
  {
    if ((~v10 & 0xF000000000000007) != 0)
    {
      *v9 = v10;
      sub_23F12E3BC(v8);
      goto LABEL_6;
    }
    sub_23F12F43C((unint64_t *)(a1 + 64));
  }
  *v9 = v10;
LABEL_6:
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolDefinition(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 81))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolDefinition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 81) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for ToolDefinition()
{
  sub_23F131844();
}

uint64_t destroy for ParameterDefinition(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23F12E3BC(*(_QWORD *)(a1 + 32));
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ParameterDefinition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23F12D318(v6);
  v8 = a2[5];
  v7 = a2[6];
  a1[4] = v6;
  a1[5] = v8;
  a1[6] = v7;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ParameterDefinition(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[4];
  sub_23F12D318(v4);
  v5 = a1[4];
  a1[4] = v4;
  sub_23F12E3BC(v5);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for ParameterDefinition(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for ParameterDefinition(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  sub_23F12E3BC(a1[4]);
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  a1[6] = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for ParameterDefinition()
{
  sub_23F131844();
}

unint64_t *initializeBufferWithCopyOfBuffer for TypeDefinition(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_23F12D318(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for TypeDefinition(unint64_t *a1)
{
  return sub_23F12E3BC(*a1);
}

unint64_t *assignWithCopy for TypeDefinition(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_23F12D318(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_23F12E3BC(v4);
  return a1;
}

_QWORD *initializeWithTake for TypeDefinition(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for TypeDefinition(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_23F12E3BC(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for TypeDefinition(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7C && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 123;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 4) | (8 * ((*(_QWORD *)a1 >> 57) & 8 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7B)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TypeDefinition(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7B)
  {
    *(_QWORD *)result = a2 - 124;
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7C)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_23F263358(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 61;
  if (v1 <= 3)
    return v1;
  else
    return (*a1 >> 3) + 4;
}

_QWORD *sub_23F263374(_QWORD *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_23F263384(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 4)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 61;
  }
  else
  {
    v2 = 8 * (a2 - 4);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

void type metadata accessor for TypeDefinition()
{
  sub_23F131844();
}

uint64_t destroy for ObjectDefinition()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ObjectDefinition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ObjectDefinition(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ObjectDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for ObjectDefinition()
{
  sub_23F131844();
}

uint64_t destroy for EnumDefinition()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for EnumDefinition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for EnumDefinition(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for EnumDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EnumDefinition(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EnumDefinition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for EnumDefinition()
{
  sub_23F131844();
}

uint64_t destroy for QueryDefinition()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for QueryDefinition(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for QueryDefinition(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for QueryDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16IntelligenceFlow19ParameterDefinitionVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23F263980(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for QueryDefinition()
{
  sub_23F131844();
}

ValueMetadata *type metadata accessor for QueryDefinition.CodingKeys()
{
  return &type metadata for QueryDefinition.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for EnumDefinition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F263A38 + 4 * byte_23F291593[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23F263A6C + 4 * byte_23F29158E[v4]))();
}

uint64_t sub_23F263A6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263A74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F263A7CLL);
  return result;
}

uint64_t sub_23F263A88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F263A90);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23F263A94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263A9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EnumDefinition.CodingKeys()
{
  return &type metadata for EnumDefinition.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ObjectDefinition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23F263B04 + 4 * byte_23F29159D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23F263B38 + 4 * byte_23F291598[v4]))();
}

uint64_t sub_23F263B38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263B40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F263B48);
  return result;
}

uint64_t sub_23F263B54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F263B5CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23F263B60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263B68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ObjectDefinition.CodingKeys()
{
  return &type metadata for ObjectDefinition.CodingKeys;
}

ValueMetadata *type metadata accessor for TypeDefinition.ComplexKey()
{
  return &type metadata for TypeDefinition.ComplexKey;
}

uint64_t _s16IntelligenceFlow15QueryDefinitionV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F263BE0 + 4 * byte_23F2915A7[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23F263C14 + 4 * byte_23F2915A2[v4]))();
}

uint64_t sub_23F263C14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263C1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F263C24);
  return result;
}

uint64_t sub_23F263C30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F263C38);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23F263C3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263C44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ParameterDefinition.CodingKeys()
{
  return &type metadata for ParameterDefinition.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ToolDefinition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_23F263CAC + 4 * byte_23F2915B1[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23F263CE0 + 4 * byte_23F2915AC[v4]))();
}

uint64_t sub_23F263CE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263CE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F263CF0);
  return result;
}

uint64_t sub_23F263CFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F263D04);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23F263D08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F263D10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ToolDefinition.CodingKeys()
{
  return &type metadata for ToolDefinition.CodingKeys;
}

unint64_t sub_23F263D30()
{
  unint64_t result;

  result = qword_256E095E0;
  if (!qword_256E095E0)
  {
    result = MEMORY[0x242667160](&unk_23F291B18, &type metadata for ToolDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E095E0);
  }
  return result;
}

unint64_t sub_23F263D70()
{
  unint64_t result;

  result = qword_256E095E8;
  if (!qword_256E095E8)
  {
    result = MEMORY[0x242667160](&unk_23F291BD0, &type metadata for ParameterDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E095E8);
  }
  return result;
}

unint64_t sub_23F263DB0()
{
  unint64_t result;

  result = qword_256E095F0;
  if (!qword_256E095F0)
  {
    result = MEMORY[0x242667160](&unk_23F291CC0, &type metadata for TypeDefinition.ComplexKey);
    atomic_store(result, (unint64_t *)&qword_256E095F0);
  }
  return result;
}

unint64_t sub_23F263DF0()
{
  unint64_t result;

  result = qword_256E095F8;
  if (!qword_256E095F8)
  {
    result = MEMORY[0x242667160](&unk_23F291D78, &type metadata for ObjectDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E095F8);
  }
  return result;
}

unint64_t sub_23F263E30()
{
  unint64_t result;

  result = qword_256E09600;
  if (!qword_256E09600)
  {
    result = MEMORY[0x242667160](&unk_23F291E30, &type metadata for EnumDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09600);
  }
  return result;
}

unint64_t sub_23F263E70()
{
  unint64_t result;

  result = qword_256E09608;
  if (!qword_256E09608)
  {
    result = MEMORY[0x242667160](&unk_23F291EE8, &type metadata for QueryDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09608);
  }
  return result;
}

unint64_t sub_23F263EB0()
{
  unint64_t result;

  result = qword_256E09610;
  if (!qword_256E09610)
  {
    result = MEMORY[0x242667160](&unk_23F291E58, &type metadata for QueryDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09610);
  }
  return result;
}

unint64_t sub_23F263EF0()
{
  unint64_t result;

  result = qword_256E09618;
  if (!qword_256E09618)
  {
    result = MEMORY[0x242667160](&unk_23F291E80, &type metadata for QueryDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09618);
  }
  return result;
}

unint64_t sub_23F263F30()
{
  unint64_t result;

  result = qword_256E09620;
  if (!qword_256E09620)
  {
    result = MEMORY[0x242667160](&unk_23F291DA0, &type metadata for EnumDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09620);
  }
  return result;
}

unint64_t sub_23F263F70()
{
  unint64_t result;

  result = qword_256E09628;
  if (!qword_256E09628)
  {
    result = MEMORY[0x242667160](&unk_23F291DC8, &type metadata for EnumDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09628);
  }
  return result;
}

unint64_t sub_23F263FB0()
{
  unint64_t result;

  result = qword_256E09630;
  if (!qword_256E09630)
  {
    result = MEMORY[0x242667160](&unk_23F291CE8, &type metadata for ObjectDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09630);
  }
  return result;
}

unint64_t sub_23F263FF0()
{
  unint64_t result;

  result = qword_256E09638;
  if (!qword_256E09638)
  {
    result = MEMORY[0x242667160](&unk_23F291D10, &type metadata for ObjectDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09638);
  }
  return result;
}

unint64_t sub_23F264030()
{
  unint64_t result;

  result = qword_256E09640;
  if (!qword_256E09640)
  {
    result = MEMORY[0x242667160](&unk_23F291BF8, &type metadata for TypeDefinition.ComplexKey);
    atomic_store(result, (unint64_t *)&qword_256E09640);
  }
  return result;
}

unint64_t sub_23F264070()
{
  unint64_t result;

  result = qword_256E09648;
  if (!qword_256E09648)
  {
    result = MEMORY[0x242667160](&unk_23F291C20, &type metadata for TypeDefinition.ComplexKey);
    atomic_store(result, (unint64_t *)&qword_256E09648);
  }
  return result;
}

unint64_t sub_23F2640B0()
{
  unint64_t result;

  result = qword_256E09650;
  if (!qword_256E09650)
  {
    result = MEMORY[0x242667160](&unk_23F291B40, &type metadata for ParameterDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09650);
  }
  return result;
}

unint64_t sub_23F2640F0()
{
  unint64_t result;

  result = qword_256E09658;
  if (!qword_256E09658)
  {
    result = MEMORY[0x242667160](&unk_23F291B68, &type metadata for ParameterDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09658);
  }
  return result;
}

unint64_t sub_23F264130()
{
  unint64_t result;

  result = qword_256E09660;
  if (!qword_256E09660)
  {
    result = MEMORY[0x242667160](&unk_23F291A88, &type metadata for ToolDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09660);
  }
  return result;
}

unint64_t sub_23F264170()
{
  unint64_t result;

  result = qword_256E09668;
  if (!qword_256E09668)
  {
    result = MEMORY[0x242667160](&unk_23F291AB0, &type metadata for ToolDefinition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09668);
  }
  return result;
}

unint64_t sub_23F2641AC()
{
  unint64_t result;

  result = qword_256E09670;
  if (!qword_256E09670)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for ToolEffect, &type metadata for ToolEffect);
    atomic_store(result, (unint64_t *)&qword_256E09670);
  }
  return result;
}

uint64_t sub_23F264200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F264210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_23F264220()
{
  return sub_23F2686B4();
}

uint64_t sub_23F26423C()
{
  return sub_23F268798();
}

uint64_t sub_23F26424C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

void sub_23F264268()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[2];
  *(_QWORD *)(v1 - 112) = v0[3];
  *(_QWORD *)(v1 - 104) = v2;
  v3 = v0[4];
  *(_QWORD *)(v1 - 128) = v0[5];
  *(_QWORD *)(v1 - 120) = v3;
}

uint64_t sub_23F26429C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2642A4()
{
  return sub_23F268684();
}

_QWORD *sub_23F2642B4()
{
  _QWORD *v0;

  return sub_23F12545C(v0, v0[3]);
}

uint64_t sub_23F2642D4()
{
  return sub_23F268684();
}

uint64_t sub_23F2642E8()
{
  return sub_23F2688A0();
}

uint64_t sub_23F26431C()
{
  return sub_23F268888();
}

uint64_t sub_23F264334()
{
  return sub_23F2686B4();
}

uint64_t sub_23F264340()
{
  return sub_23F268654();
}

uint64_t sub_23F26434C()
{
  return sub_23F268108();
}

uint64_t sub_23F264360()
{
  return swift_bridgeObjectRelease();
}

void sub_23F264368(unint64_t *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t *v4;

  sub_23F262A3C(a1, v4, a3, a4);
}

uint64_t sub_23F264370()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F264388()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_23F264398(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_23F2643A8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F2643B4()
{
  return swift_allocObject();
}

uint64_t sub_23F2643C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = v1;
  return _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0);
}

uint64_t sub_23F2643CC()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return *(_QWORD *)(v0 - 104);
}

uint64_t sub_23F2643E0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return *(_QWORD *)(v0 - 104);
}

uint64_t sub_23F2643F4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F264400()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F264414()
{
  uint64_t v0;

  return v0 - 72;
}

void sub_23F264428()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 81) = 4;
}

void sub_23F264434()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 3;
}

uint64_t sub_23F264440()
{
  return sub_23F268840();
}

uint64_t sub_23F26444C(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_23F264460()
{
  return sub_23F268720();
}

void sub_23F26446C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD *, uint64_t))
{
  _QWORD v4[2];

  v4[0] = a1;
  v4[1] = a2;
  a4(v4, a3);
  sub_23F1A9BE8();
}

uint64_t sub_23F264498(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_23F267D18();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_23F159FD0((uint64_t)v4, v8);
  return swift_release();
}

void sub_23F26452C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *))
{
  uint64_t v3;

  v3 = a1;
  a3(&v3);
  sub_23F1A9BE8();
}

void sub_23F264554(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  uint64_t v9;
  uint64_t v10;
  id v11;

  sub_23F1217E8(&qword_256DFEB98);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v7);
  sub_23F2674F8();
  v8 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_23F267D54();
    v9 = sub_23F131B8C();
    v10 = 0;
  }
  else
  {
    v9 = sub_23F131B8C();
    v10 = 1;
  }
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v3, v10, 1, v9);
  swift_retain();
  v11 = a3;
  v8(v3, a3);
  swift_release();

  sub_23F125E40(v3, &qword_256DFEB98);
}

void *sub_23F264620()
{
  qword_256E09678 = (uint64_t)&unk_256E63DC8;
  return &unk_256E63DC8;
}

id static TranscriptEntityQueryingXPCServerService.interface.getter()
{
  return sub_23F256C70(&qword_256DFE520, (id *)&qword_256E09678);
}

unint64_t static TranscriptEntityQueryingXPCServerService.serviceName.getter()
{
  return sub_23F2674B4();
}

void sub_23F26465C()
{
  qword_256E09680 = MEMORY[0x24BEE4AF8];
}

uint64_t static TranscriptEntityQueryingXPCServerService.selectorClasses.getter()
{
  return sub_23F256CE0(&qword_256DFE528);
}

uint64_t sub_23F26468C(uint64_t a1)
{
  return sub_23F266208(a1, qword_256E09688);
}

uint64_t static TranscriptEntityQueryingXPCServerService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23F266268(&qword_256DFE530, (uint64_t)qword_256E09688, a1);
}

uint64_t TranscriptEntityQueryingClient.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  TranscriptEntityQueryingClient.init()();
  return v0;
}

uint64_t TranscriptEntityQueryingClient.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;

  sub_23F267C70();
  *(_OWORD *)(v0 + 16) = 0u;
  v2 = v0 + 16;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  sub_23F150918();
  *(_QWORD *)(v0 + 64) = sub_23F267C64();
  sub_23F267C4C();
  sub_23F150918();
  *(_QWORD *)(v0 + 72) = sub_23F267C40();
  type metadata accessor for TranscriptEntityQueryingClient.ReverseServer();
  *(_QWORD *)(v0 + 56) = swift_allocObject();
  sub_23F25DBD8(&qword_256E096C8, v3, (uint64_t (*)(uint64_t))type metadata accessor for TranscriptEntityQueryingClient, (uint64_t)&protocol conformance descriptor for TranscriptEntityQueryingClient);
  v4 = sub_23F1217E8(&qword_256E096D0);
  sub_23F150918();
  swift_retain_n();
  swift_retain();
  v5 = sub_23F267F10();
  if (v1)
  {
    swift_release();
    swift_release();
  }
  else
  {
    v6 = v5;
    v9 = v4;
    v10 = sub_23F2648AC();
    swift_release();
    *(_QWORD *)&v8 = v6;
    swift_beginAccess();
    if (*(_QWORD *)(v0 + 40))
      _s16IntelligenceFlow17AnySessionMessageVwxx_0(v2);
    sub_23F14387C(&v8, v2);
    swift_endAccess();
  }
  return v0;
}

uint64_t type metadata accessor for TranscriptEntityQueryingClient.ReverseServer()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TranscriptEntityQueryingClient()
{
  return objc_opt_self();
}

unint64_t sub_23F2648AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256E096D8;
  if (!qword_256E096D8)
  {
    v1 = sub_23F125540(&qword_256E096D0);
    result = MEMORY[0x242667160](MEMORY[0x24BE79958], v1);
    atomic_store(result, (unint64_t *)&qword_256E096D8);
  }
  return result;
}

void sub_23F2648F0(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;

  v6 = v3;
  v27 = a3;
  v8 = sub_23F131B8C();
  sub_23F126298();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F267560();
  sub_23F2674AC(&qword_256E096E0, v12, type metadata accessor for TranscriptEntityEnumerationParameters, (uint64_t)&protocol conformance descriptor for TranscriptEntityEnumerationParameters);
  swift_retain();
  v13 = sub_23F267C58();
  v15 = v14;
  swift_release();
  if (v4)
  {
LABEL_14:
    sub_23F1313FC();
  }
  else
  {
    v28 = a2;
    swift_beginAccess();
    v29 = v6;
    if (*(_QWORD *)(v6 + 40))
      sub_23F267548();
    else
      sub_23F267534();
    v24 = v11;
    v25 = v13;
    v23 = v5;
    v26 = v8;
    if (v33)
    {
      v16 = sub_23F12545C(v32, v33);
      MEMORY[0x24BDAC7A8](v16);
      v17 = v24;
      *(&v21 - 2) = v25;
      *(&v21 - 1) = v15;
      sub_23F2674C8();
      v22 = v15;
      sub_23F25A594();
      while (1)
      {
        if (*(_QWORD *)(v29 + 40))
          sub_23F267548();
        else
          sub_23F267534();
        if (!v33)
          break;
        v18 = sub_23F12545C(v32, v33);
        MEMORY[0x24BDAC7A8](v18);
        *(&v21 - 2) = (uint64_t)v17;
        sub_23F2674C8();
        v19 = v30;
        v20 = v31;
        sub_23F25A594();
        sub_23F1217E8(&qword_256E096E8);
        sub_23F265094();
        swift_retain();
        sub_23F267C34();
        swift_release();
        if (!*(_QWORD *)(v34 + 16))
        {
          sub_23F13186C();
          sub_23F267554();
          sub_23F264CF0(v29, v17);
          sub_23F1311B4(v25, v22);
          (*(void (**)(void *, uint64_t))(v23 + 8))(v17, v26);
          goto LABEL_14;
        }
        v28(v34);
        sub_23F1311B4(v19, v20);
        sub_23F13186C();
      }
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t type metadata accessor for TranscriptEntityEnumerationParameters(uint64_t a1)
{
  return sub_23F12EDBC(a1, (uint64_t *)&unk_256E098D8);
}

void sub_23F264C28(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _QWORD v8[6];

  v6 = (void *)sub_23F267D00();
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_23F264554;
  v8[3] = &unk_250FBD508;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_getTranscriptEntitiesWithParameters_reply_, v6, v7);
  _Block_release(v7);

}

void sub_23F264CE8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F264C28(a1, a2, a3);
}

uint64_t sub_23F264CF0(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  __int128 v6;
  _QWORD *v7;
  id v8[5];
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v4 = sub_23F267FDC();
  MEMORY[0x24BDAC7A8](v4);
  result = swift_beginAccess();
  if (*(_QWORD *)(a1 + 40))
  {
    result = sub_23F26287C(a1 + 16, (uint64_t)&v9);
  }
  else
  {
    v6 = *(_OWORD *)(a1 + 32);
    v9 = *(_OWORD *)(a1 + 16);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 48);
  }
  if (*((_QWORD *)&v10 + 1))
  {
    v7 = sub_23F12545C(&v9, *((uint64_t *)&v10 + 1));
    MEMORY[0x24BDAC7A8](v7);
    v8[-2] = a2;
    sub_23F267414();
    sub_23F267EF8();

    return _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v9);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23F264FB0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v9[4] = sub_23F25DE74;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F264498;
  v9[3] = &unk_250FBD4E0;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_getTranscriptEntitiesBatchWithId_reply_, v7, v8);
  _Block_release(v8);

}

void sub_23F26508C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F264FB0(a1, a2, a3);
}

unint64_t sub_23F265094()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_256E096F0;
  if (!qword_256E096F0)
  {
    v1 = sub_23F125540(&qword_256E096E8);
    sub_23F25DBD8(&qword_256E096F8, 255, type metadata accessor for TranscriptEntityItem, (uint64_t)&protocol conformance descriptor for TranscriptEntityItem);
    v3 = v2;
    result = MEMORY[0x242667160](MEMORY[0x24BEE12D0], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_256E096F0);
  }
  return result;
}

uint64_t type metadata accessor for TranscriptEntityItem(uint64_t a1)
{
  return sub_23F12EDBC(a1, qword_256E09970);
}

uint64_t TranscriptEntityQueryingClient.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t TranscriptEntityQueryingClient.__deallocating_deinit()
{
  TranscriptEntityQueryingClient.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23F265184()
{
  type metadata accessor for TranscriptEntityQueryingClient();
  return sub_23F267EEC();
}

uint64_t TranscriptEntityEnumerationParameters.tolerantMode.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t TranscriptEntityEnumerationParameters.tolerantMode.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*TranscriptEntityEnumerationParameters.tolerantMode.modify())()
{
  return nullsub_1;
}

uint64_t TranscriptEntityEnumerationParameters.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TranscriptEntityEnumerationParameters(0) + 20);
  return sub_23F265214(v3, a1);
}

uint64_t sub_23F265214(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256E09700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void TranscriptEntityEnumerationParameters.init()(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = (uint64_t)&a1[*(int *)(type metadata accessor for TranscriptEntityEnumerationParameters(0) + 20)];
  v3 = sub_23F267D24();
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v2, 1, 1, v3);
  *a1 = 1;
  sub_23F12612C();
}

uint64_t TranscriptEntityEnumerationParameters.init(startDate:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;

  *a2 = 1;
  v3 = (uint64_t)&a2[*(int *)(type metadata accessor for TranscriptEntityEnumerationParameters(0) + 20)];
  return sub_23F2652E8(a1, v3);
}

uint64_t sub_23F2652E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23F1217E8(&qword_256E09700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL static TranscriptEntityEnumerationParameters.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;

  v5 = sub_23F267D24();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  sub_23F2674F8();
  v7 = sub_23F1217E8(&qword_256E09708);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v8);
  sub_23F1262C8();
  v11 = v10 - v9;
  sub_23F1217E8(&qword_256E09700);
  sub_23F125EEC();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v28 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v28 - v19;
  if (*a1 != *a2)
    return 0;
  v29 = v6;
  v21 = type metadata accessor for TranscriptEntityEnumerationParameters(0);
  sub_23F265214((uint64_t)&a1[*(int *)(v21 + 20)], (uint64_t)v20);
  sub_23F265214((uint64_t)&a2[*(int *)(v21 + 20)], (uint64_t)v18);
  v22 = v11 + *(int *)(v7 + 48);
  sub_23F265214((uint64_t)v20, v11);
  sub_23F265214((uint64_t)v18, v22);
  sub_23F1A92D8(v11);
  if (v23)
  {
    sub_23F24FC2C((uint64_t)v18);
    sub_23F24FC2C((uint64_t)v20);
    sub_23F1A92D8(v22);
    if (v23)
    {
      sub_23F125E40(v11, &qword_256E09700);
      return 1;
    }
    goto LABEL_10;
  }
  sub_23F265214(v11, (uint64_t)v15);
  sub_23F1A92D8(v22);
  if (v23)
  {
    sub_23F24FC2C((uint64_t)v18);
    sub_23F24FC2C((uint64_t)v20);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v5);
LABEL_10:
    sub_23F125E40(v11, &qword_256E09708);
    return 0;
  }
  v24 = v29;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v2, v22, v5);
  sub_23F25DBD8(&qword_256E09710, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v25 = sub_23F268138();
  v26 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  v26(v2, v5);
  sub_23F24FC2C((uint64_t)v18);
  sub_23F24FC2C((uint64_t)v20);
  v26((uint64_t)v15, v5);
  sub_23F24FC2C(v11);
  return (v25 & 1) != 0;
}

uint64_t sub_23F2655CC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x746E6172656C6F74 && a2 == 0xEC00000065646F4DLL;
  if (v2 || (sub_23F268798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23F268798();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23F2656DC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7461447472617473;
  else
    return 0x746E6172656C6F74;
}

uint64_t sub_23F265720()
{
  char *v0;

  return sub_23F2656DC(*v0);
}

uint64_t sub_23F265728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F2655CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F26574C()
{
  sub_23F2658AC();
  return sub_23F2688B8();
}

uint64_t sub_23F265774()
{
  sub_23F2658AC();
  return sub_23F2688C4();
}

void TranscriptEntityEnumerationParameters.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_23F1217E8(&qword_256E09718);
  sub_23F126298();
  MEMORY[0x24BDAC7A8](v3);
  sub_23F12545C(a1, a1[3]);
  sub_23F2658AC();
  sub_23F131994();
  sub_23F26872C();
  if (!v1)
  {
    sub_23F267560();
    sub_23F267D24();
    sub_23F2674AC(&qword_256E03250, v4, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23F267520();
    sub_23F268714();
  }
  sub_23F267510();
  sub_23F18AB98();
}

unint64_t sub_23F2658AC()
{
  unint64_t result;

  result = qword_256E09720;
  if (!qword_256E09720)
  {
    result = MEMORY[0x242667160](&unk_23F2927EC, &type metadata for TranscriptEntityEnumerationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09720);
  }
  return result;
}

void TranscriptEntityEnumerationParameters.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  sub_23F1217E8(&qword_256E09700);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v5);
  sub_23F125F70();
  v11 = v6;
  v12 = sub_23F1217E8(&qword_256E09728);
  MEMORY[0x24BDAC7A8](v12);
  sub_23F1262C8();
  v7 = sub_23F267560();
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v8);
  sub_23F1319B0();
  sub_23F12545C(a1, a1[3]);
  sub_23F2658AC();
  sub_23F268888();
  if (v2)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
  }
  else
  {
    *v3 = sub_23F268690() & 1;
    sub_23F267D24();
    sub_23F2674AC(&qword_256E03260, v9, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_23F268678();
    sub_23F2674D8();
    sub_23F2652E8(v11, (uint64_t)&v3[*(int *)(v7 + 20)]);
    sub_23F18782C((uint64_t)v3, a2, type metadata accessor for TranscriptEntityEnumerationParameters);
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
    sub_23F125D68((uint64_t)v3, type metadata accessor for TranscriptEntityEnumerationParameters);
  }
  sub_23F1313FC();
}

void sub_23F265AC8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TranscriptEntityEnumerationParameters.init(from:)(a1, a2);
}

void sub_23F265ADC(_QWORD *a1)
{
  TranscriptEntityEnumerationParameters.encode(to:)(a1);
}

uint64_t TranscriptEntityItem.eventId.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  sub_23F131B8C();
  v0 = sub_23F17FA04();
  return sub_23F126180(v0, v1, v2, v3);
}

uint64_t TranscriptEntityItem.entity.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  type metadata accessor for TranscriptEntityItem(0);
  sub_23F125F84();
  v0 = sub_23F17FA04();
  return sub_23F126180(v0, v1, v2, v3);
}

uint64_t TranscriptEntityItem.init(eventId:entity:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23F131B8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = a3 + *(int *)(type metadata accessor for TranscriptEntityItem(0) + 20);
  v8 = sub_23F125F84();
  return sub_23F24EEBC(v7, a2, v8, *(uint64_t (**)(void))(*(_QWORD *)(v8 - 8) + 32));
}

uint64_t static TranscriptEntityItem.== infix(_:_:)()
{
  if ((_s16IntelligenceFlow7EventIDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
    return 0;
  type metadata accessor for TranscriptEntityItem(0);
  return _s16IntelligenceFlow14MessagePayloadO17ActionWillExecuteV18ToolParameterValueO0J0V2eeoiySbAI_AItFZ_0();
}

uint64_t sub_23F265BF4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x6449746E657665 && a2 == 0xE700000000000000;
  if (v2 || (sub_23F268798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x797469746E65 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_23F268798();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23F265CD8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x797469746E65;
  else
    return 0x6449746E657665;
}

uint64_t sub_23F265D0C()
{
  char *v0;

  return sub_23F265CD8(*v0);
}

uint64_t sub_23F265D14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F265BF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F265D38()
{
  sub_23F265EB8();
  return sub_23F2688B8();
}

uint64_t sub_23F265D60()
{
  sub_23F265EB8();
  return sub_23F2688C4();
}

void TranscriptEntityItem.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23F1217E8(&qword_256E09730);
  sub_23F126298();
  MEMORY[0x24BDAC7A8](v3);
  sub_23F12545C(a1, a1[3]);
  sub_23F265EB8();
  sub_23F131994();
  sub_23F131B8C();
  sub_23F2674AC(&qword_256DFEF10, v4, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23F17F99C();
  if (!v1)
  {
    type metadata accessor for TranscriptEntityItem(0);
    sub_23F268078();
    sub_23F2674AC(&qword_256DFE598, v5, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
    sub_23F267520();
    sub_23F17F99C();
  }
  sub_23F267510();
  sub_23F18AB98();
}

unint64_t sub_23F265EB8()
{
  unint64_t result;

  result = qword_256E09738;
  if (!qword_256E09738)
  {
    result = MEMORY[0x242667160](&unk_23F29279C, &type metadata for TranscriptEntityItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09738);
  }
  return result;
}

void TranscriptEntityItem.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v14 = sub_23F268078();
  v11 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  sub_23F125F70();
  v13 = v4;
  v16 = sub_23F131B8C();
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  sub_23F125F70();
  v15 = v6;
  v17 = sub_23F1217E8(&qword_256E09740);
  MEMORY[0x24BDAC7A8](v17);
  sub_23F1262C8();
  v7 = type metadata accessor for TranscriptEntityItem(0);
  sub_23F125EEC();
  MEMORY[0x24BDAC7A8](v8);
  sub_23F1319B0();
  sub_23F12545C(a1, a1[3]);
  sub_23F265EB8();
  sub_23F268888();
  if (v18)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
  }
  else
  {
    sub_23F2674AC(&qword_256DFEF20, v9, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_23F2686B4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v15, v16);
    sub_23F2674AC(&qword_256DFE5B8, v10, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    sub_23F2686B4();
    sub_23F26749C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v2 + *(int *)(v7 + 20), v13, v14);
    sub_23F18782C(v2, a2, type metadata accessor for TranscriptEntityItem);
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
    sub_23F125D68(v2, type metadata accessor for TranscriptEntityItem);
  }
  sub_23F1313FC();
}

void sub_23F266168(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TranscriptEntityItem.init(from:)(a1, a2);
}

void sub_23F26617C(_QWORD *a1)
{
  TranscriptEntityItem.encode(to:)(a1);
}

void *sub_23F266190()
{
  qword_256E096A0 = (uint64_t)&unk_256E634C8;
  return &unk_256E634C8;
}

id static TranscriptEntityQueryingXPCClientService.interface.getter()
{
  return sub_23F256C70(&qword_256DFE538, (id *)&qword_256E096A0);
}

unint64_t static TranscriptEntityQueryingXPCClientService.serviceName.getter()
{
  return sub_23F2674B4();
}

void sub_23F2661CC()
{
  qword_256E096A8 = MEMORY[0x24BEE4AF8];
}

uint64_t static TranscriptEntityQueryingXPCClientService.selectorClasses.getter()
{
  return sub_23F256CE0(&qword_256DFE540);
}

uint64_t sub_23F2661FC(uint64_t a1)
{
  return sub_23F266208(a1, qword_256E096B0);
}

uint64_t sub_23F266208(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23F267FDC();
  sub_23F1470EC(v3, a2);
  sub_23F146E30(v3, (uint64_t)a2);
  return sub_23F267E20();
}

uint64_t static TranscriptEntityQueryingXPCClientService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23F266268(&qword_256DFE548, (uint64_t)qword_256E096B0, a1);
}

uint64_t sub_23F266268@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    sub_23F25A638();
  v5 = sub_23F267FDC();
  v6 = sub_23F146E30(v5, a2);
  return sub_23F24EEBC(a3, v6, v5, *(uint64_t (**)(void))(*(_QWORD *)(v5 - 8) + 16));
}

unint64_t sub_23F2662C8()
{
  static TranscriptEntityQueryingXPCClientService.serviceName.getter();
  return 0xD000000000000035;
}

uint64_t sub_23F2662EC()
{
  return swift_deallocClassInstance();
}

uint64_t TranscriptEntityQueryingReverseClient.__allocating_init(existingConnection:localObject:)()
{
  uint64_t v0;

  sub_23F2674E8();
  v0 = swift_allocObject();
  TranscriptEntityQueryingReverseClient.init(existingConnection:localObject:)();
  return v0;
}

uint64_t TranscriptEntityQueryingReverseClient.init(existingConnection:localObject:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23F267C70();
  sub_23F150918();
  *(_QWORD *)(v0 + 16) = sub_23F267C64();
  *(_QWORD *)(v0 + 24) = 0;
  sub_23F25DBD8(&qword_256E09748, v2, (uint64_t (*)(uint64_t))type metadata accessor for TranscriptEntityQueryingReverseClient, (uint64_t)&protocol conformance descriptor for TranscriptEntityQueryingReverseClient);
  sub_23F1217E8(&qword_256E09750);
  sub_23F150918();
  swift_retain();
  v3 = sub_23F267F04();
  if (!v1)
    *(_QWORD *)(v0 + 24) = v3;
  swift_release();
  return v0;
}

uint64_t type metadata accessor for TranscriptEntityQueryingReverseClient()
{
  return objc_opt_self();
}

uint64_t TranscriptEntityQueryingReverseClient.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t TranscriptEntityQueryingReverseClient.__deallocating_deinit()
{
  TranscriptEntityQueryingReverseClient.deinit();
  sub_23F2674E8();
  return swift_deallocClassInstance();
}

uint64_t sub_23F266474@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = TranscriptEntityQueryingReverseClient.__allocating_init(existingConnection:localObject:)();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_23F26649C()
{
  type metadata accessor for TranscriptEntityQueryingReverseClient();
  return sub_23F267EEC();
}

BOOL static TranscriptEntityQueryingServiceError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TranscriptEntityQueryingServiceError.hash(into:)()
{
  return sub_23F268840();
}

void TranscriptEntityQueryingServiceError.hashValue.getter()
{
  sub_23F1317B8();
  sub_23F15EA08();
  sub_23F1318A0();
  sub_23F1318E4();
}

unint64_t sub_23F266554()
{
  unint64_t result;

  result = qword_2543444C0;
  if (!qword_2543444C0)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for TranscriptEntityQueryingXPCServerService, &type metadata for TranscriptEntityQueryingXPCServerService);
    atomic_store(result, (unint64_t *)&qword_2543444C0);
  }
  return result;
}

unint64_t sub_23F266594()
{
  unint64_t result;

  result = qword_256E09758;
  if (!qword_256E09758)
  {
    result = MEMORY[0x242667160](&protocol conformance descriptor for TranscriptEntityQueryingServiceError, &type metadata for TranscriptEntityQueryingServiceError);
    atomic_store(result, (unint64_t *)&qword_256E09758);
  }
  return result;
}

void type metadata accessor for TranscriptEntityQueryingXPCServerService()
{
  sub_23F131844();
}

uint64_t method lookup function for TranscriptEntityQueryingClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TranscriptEntityQueryingClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of TranscriptEntityQueryingClient.enumerateTranscriptEntities(parameters:body:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t *initializeBufferWithCopyOfBuffer for TranscriptEntityEnumerationParameters(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_23F267D24();
    if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v7, 1, v8))
    {
      v9 = sub_23F1217E8(&qword_256E09700);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
      _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for TranscriptEntityEnumerationParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_23F267D24();
  result = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return result;
}

_BYTE *initializeWithCopy for TranscriptEntityEnumerationParameters(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_23F267D24();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7))
  {
    v8 = sub_23F1217E8(&qword_256E09700);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *assignWithCopy for TranscriptEntityEnumerationParameters(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_23F267D24();
  v8 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v5, 1, v7);
  v9 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7);
  if (!v8)
  {
    v10 = *(_QWORD *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    v11 = sub_23F1217E8(&qword_256E09700);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  return a1;
}

_BYTE *initializeWithTake for TranscriptEntityEnumerationParameters(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_23F267D24();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7))
  {
    v8 = sub_23F1217E8(&qword_256E09700);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *assignWithTake for TranscriptEntityEnumerationParameters(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_23F267D24();
  v8 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v5, 1, v7);
  v9 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7);
  if (!v8)
  {
    v10 = *(_QWORD *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    v11 = sub_23F1217E8(&qword_256E09700);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptEntityEnumerationParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F266AAC(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v10;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    v5 = v4 >= 2;
    v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5)
      return (v6 + 1);
    else
      return 0;
  }
  else
  {
    v10 = sub_23F1217E8(&qword_256E09700);
    return sub_23F1315B8((uint64_t)&a1[*(int *)(a3 + 20)], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TranscriptEntityEnumerationParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23F266B28(_BYTE *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 254)
  {
    *a1 = a2 + 1;
    sub_23F12612C();
  }
  else
  {
    v7 = sub_23F1217E8(&qword_256E09700);
    sub_23F126098((uint64_t)&a1[*(int *)(a4 + 20)], a2, a2, v7);
  }
}

void sub_23F266B84()
{
  unint64_t v0;

  sub_23F266BF8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23F266BF8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256E098E8[0])
  {
    sub_23F267D24();
    v0 = sub_23F26845C();
    if (!v1)
      atomic_store(v0, qword_256E098E8);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TranscriptEntityItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23F267D84();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23F268078();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for TranscriptEntityItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23F268078();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23F268078();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptEntityItem()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F266F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23F131B8C();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = sub_23F125F84();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return sub_23F1315B8(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for TranscriptEntityItem()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23F266FB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_23F131B8C();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = sub_23F125F84();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return sub_23F126098(v10, a2, a2, v9);
}

uint64_t sub_23F267010()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23F267D84();
  if (v1 <= 0x3F)
  {
    result = sub_23F268078();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void type metadata accessor for TranscriptEntityQueryingXPCClientService()
{
  sub_23F131844();
}

uint64_t method lookup function for TranscriptEntityQueryingReverseClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TranscriptEntityQueryingReverseClient.__allocating_init(existingConnection:localObject:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

void type metadata accessor for TranscriptEntityQueryingServiceError()
{
  sub_23F131844();
}

ValueMetadata *type metadata accessor for TranscriptEntityItem.CodingKeys()
{
  return &type metadata for TranscriptEntityItem.CodingKeys;
}

uint64_t _s16IntelligenceFlow36TranscriptEntityQueryingServiceErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23F267130 + 4 * byte_23F2920F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23F267164 + 4 * byte_23F2920F0[v4]))();
}

uint64_t sub_23F267164(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F26716C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F267174);
  return result;
}

uint64_t sub_23F267180(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F267188);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23F26718C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F267194(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TranscriptEntityEnumerationParameters.CodingKeys()
{
  return &type metadata for TranscriptEntityEnumerationParameters.CodingKeys;
}

unint64_t sub_23F2671B4()
{
  unint64_t result;

  result = qword_256E09A40;
  if (!qword_256E09A40)
  {
    result = MEMORY[0x242667160](&unk_23F2926BC, &type metadata for TranscriptEntityEnumerationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09A40);
  }
  return result;
}

unint64_t sub_23F2671F4()
{
  unint64_t result;

  result = qword_256E09A48;
  if (!qword_256E09A48)
  {
    result = MEMORY[0x242667160](&unk_23F292774, &type metadata for TranscriptEntityItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09A48);
  }
  return result;
}

unint64_t sub_23F267234()
{
  unint64_t result;

  result = qword_256E09A50;
  if (!qword_256E09A50)
  {
    result = MEMORY[0x242667160](&unk_23F2926E4, &type metadata for TranscriptEntityItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09A50);
  }
  return result;
}

unint64_t sub_23F267274()
{
  unint64_t result;

  result = qword_256E09A58;
  if (!qword_256E09A58)
  {
    result = MEMORY[0x242667160](&unk_23F29270C, &type metadata for TranscriptEntityItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09A58);
  }
  return result;
}

unint64_t sub_23F2672B4()
{
  unint64_t result;

  result = qword_256E09A60;
  if (!qword_256E09A60)
  {
    result = MEMORY[0x242667160](&unk_23F29262C, &type metadata for TranscriptEntityEnumerationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E09A60);
  }
  return result;
}

unint64_t sub_23F2672F4()
{
  unint64_t result;

  result = qword_256E09A68[0];
  if (!qword_256E09A68[0])
  {
    result = MEMORY[0x242667160](&unk_23F292654, &type metadata for TranscriptEntityEnumerationParameters.CodingKeys);
    atomic_store(result, qword_256E09A68);
  }
  return result;
}

void sub_23F267330(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_retain();
  v7 = (void *)sub_23F267D3C();
  v9[4] = sub_23F25DEF8;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23F25C2D4;
  v9[3] = &unk_250FBD490;
  v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_stopTranscriptEntitiesEnumerationWithId_reply_, v7, v8);
  _Block_release(v8);

}

void sub_23F26740C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_23F267330(a1, a2, a3);
}

unint64_t sub_23F267414()
{
  unint64_t result;

  result = qword_256E091E0;
  if (!qword_256E091E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256E091E0);
  }
  return result;
}

uint64_t sub_23F267450()
{
  swift_release();
  sub_23F2674E8();
  return swift_deallocObject();
}

uint64_t sub_23F26746C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23F26747C()
{
  return swift_release();
}

uint64_t sub_23F26749C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 96));
}

void sub_23F2674AC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  sub_23F25DBD8(a1, 255, a3, a4);
}

unint64_t sub_23F2674B4()
{
  return 0xD000000000000035;
}

uint64_t sub_23F2674C8()
{
  return sub_23F267EF8();
}

uint64_t sub_23F2674D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_23F2674E8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F267510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_23F267520()
{
  uint64_t v0;

  return v0;
}

__n128 sub_23F267534()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v0;
  v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 128) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 112) = v3;
  *(_QWORD *)(v1 - 96) = *(_QWORD *)(v0 + 32);
  return result;
}

uint64_t sub_23F267548()
{
  uint64_t v0;
  uint64_t v1;

  return sub_23F26287C(v0, v1 - 128);
}

uint64_t sub_23F267554()
{
  uint64_t v0;
  unint64_t v1;

  return sub_23F1311B4(v0, v1);
}

uint64_t sub_23F267560()
{
  return type metadata accessor for TranscriptEntityEnumerationParameters(0);
}

uint64_t sub_23F267568(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  CC_SHA1_CTX c;
  uint64_t v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_23F26818C();
  swift_bridgeObjectRelease();
  v3 = sub_23F2682A0();
  *(_QWORD *)(v3 + 16) = 20;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_DWORD *)(v3 + 48) = 0;
  v12[0] = v3;
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  v4 = sub_23F267D6C();
  sub_23F26796C(v4, v5, v2, v12, &c);
  v6 = v12[0];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_23F259B68(v6);
    v6 = v10;
  }
  v7 = *(_QWORD *)(v6 + 16);
  if (v7 < 7)
  {
    __break(1u);
    goto LABEL_14;
  }
  *(_BYTE *)(v6 + 38) = *(_BYTE *)(v6 + 38) & 0xF | 0x50;
  if (v7 < 9)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(_BYTE *)(v6 + 40) = *(_BYTE *)(v6 + 40) & 0x3F | 0x80;
  v12[0] = v6;
  if (v7 == 9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v7 == 10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v7 < 0xC)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v7 == 12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v7 < 0xE)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v7 == 14)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  if (v7 < 0x10)
    goto LABEL_21;
  sub_23F267D60();
  v8 = sub_23F267D84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F267760(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, CC_SHA1_CTX *a5)
{
  return sub_23F267794((const void *)(a3 + 32), a3 + 32 + *(_QWORD *)(a3 + 16), a4, a5, a1, a2);
}

uint64_t sub_23F267794(const void *a1, uint64_t a2, uint64_t *a3, CC_SHA1_CTX *a4, void *a5, uint64_t a6)
{
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v15;

  v12 = *a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_23F259B68(v12);
    v12 = v15;
    *a3 = v15;
  }
  result = sub_23F267840((unsigned __int8 *)(v12 + 32), *(_QWORD *)(v12 + 16), a4, a5, a6, a1, a2);
  *a3 = v12;
  return result;
}

uint64_t sub_23F267840(unsigned __int8 *a1, int a2, CC_SHA1_CTX *c, void *data, uint64_t a5, const void *a6, uint64_t a7)
{
  unint64_t v8;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;

  if (data)
    v8 = a5 - (_QWORD)data;
  else
    v8 = 0;
  if ((v8 & 0x8000000000000000) == 0 && !HIDWORD(v8))
  {
    CC_SHA1_Update(c, data, v8);
    v12 = a7 - (_QWORD)a6;
    if (!a6)
      v12 = 0;
    v13 = v12 - 1;
    if (__OFSUB__(v12, 1))
    {
      __break(1u);
    }
    else if ((v13 & 0x8000000000000000) == 0 && !HIDWORD(v13))
    {
      CC_SHA1_Update(c, a6, v13);
      return CC_SHA1_Final(a1, c);
    }
  }
  result = sub_23F2685DC();
  __break(1u);
  return result;
}

uint64_t sub_23F26796C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, CC_SHA1_CTX *a5)
{
  _QWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6[0] = a1;
  v6[1] = a2;
  sub_23F267760(v6, (uint64_t)&v7, a3, a4, a5);
  return swift_release();
}

uint64_t FixedVariableContextRetriever.init(variables:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t FixedVariableContextRetriever.retrieveVariables()()
{
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of VariableContextRetriever.retrieveVariables()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for FixedVariableContextRetriever()
{
  return &type metadata for FixedVariableContextRetriever;
}

uint64_t sub_23F267A8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[8];

  v7 = type metadata accessor for WeakValue(0, *(_QWORD *)(a3 + a2 - 8), a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v9 = MEMORY[0x2426672E0](v11);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  *a5 = v9;
  return result;
}

void WeakValue.value.getter()
{
  JUMPOUT(0x2426672E0);
}

uint64_t WeakValue.value.setter()
{
  swift_unknownObjectWeakAssign();
  return sub_23F267C2C();
}

uint64_t (*WeakValue.value.modify(_QWORD *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = MEMORY[0x2426672E0](v1);
  return sub_23F267B70;
}

uint64_t sub_23F267B70()
{
  swift_unknownObjectWeakAssign();
  return sub_23F267C2C();
}

uint64_t sub_23F267B9C()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_23F267BAC()
{
  return 8;
}

_QWORD *sub_23F267BB8(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23F267BD8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23F267BF8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 8) = v3;
  return result;
}

uint64_t type metadata accessor for WeakValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23F126D88(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakValue);
}

uint64_t sub_23F267C2C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_23F267C34()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23F267C40()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23F267C4C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23F267C58()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23F267C64()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23F267C70()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23F267C7C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23F267C88()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23F267C94()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23F267CA0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23F267CAC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23F267CB8()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_23F267CC4()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23F267CD0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23F267CDC()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23F267CE8()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_23F267CF4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23F267D00()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23F267D0C()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_23F267D18()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23F267D24()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23F267D30()
{
  return MEMORY[0x24BDCE9B8]();
}

uint64_t sub_23F267D3C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t _s16IntelligenceFlow7EventIDV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23F267D54()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23F267D60()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_23F267D6C()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_23F267D78()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23F267D84()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23F267D90()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_23F267D9C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23F267DA8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23F267DB4()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_23F267DC0()
{
  return MEMORY[0x24BEAA5E0]();
}

uint64_t sub_23F267DCC()
{
  return MEMORY[0x24BE573E8]();
}

uint64_t sub_23F267DD8()
{
  return MEMORY[0x24BE574A8]();
}

uint64_t sub_23F267DE4()
{
  return MEMORY[0x24BE57BD8]();
}

uint64_t sub_23F267DF0()
{
  return MEMORY[0x24BE57CD8]();
}

uint64_t sub_23F267DFC()
{
  return MEMORY[0x24BE57E50]();
}

uint64_t sub_23F267E08()
{
  return MEMORY[0x24BE57EC0]();
}

uint64_t sub_23F267E14()
{
  return MEMORY[0x24BE57EF0]();
}

uint64_t sub_23F267E20()
{
  return MEMORY[0x24BE57F38]();
}

uint64_t sub_23F267E2C()
{
  return MEMORY[0x24BE79728]();
}

uint64_t sub_23F267E38()
{
  return MEMORY[0x24BE79738]();
}

uint64_t sub_23F267E44()
{
  return MEMORY[0x24BE79740]();
}

uint64_t sub_23F267E50()
{
  return MEMORY[0x24BE79768]();
}

uint64_t sub_23F267E5C()
{
  return MEMORY[0x24BE797A0]();
}

uint64_t sub_23F267E68()
{
  return MEMORY[0x24BE797A8]();
}

uint64_t sub_23F267E74()
{
  return MEMORY[0x24BE797F0]();
}

uint64_t sub_23F267E80()
{
  return MEMORY[0x24BE79808]();
}

uint64_t sub_23F267E8C()
{
  return MEMORY[0x24BE79810]();
}

uint64_t sub_23F267E98()
{
  return MEMORY[0x24BE79818]();
}

uint64_t sub_23F267EA4()
{
  return MEMORY[0x24BE79820]();
}

uint64_t sub_23F267EB0()
{
  return MEMORY[0x24BE79888]();
}

uint64_t sub_23F267EBC()
{
  return MEMORY[0x24BE79890]();
}

uint64_t sub_23F267EC8()
{
  return MEMORY[0x24BE79898]();
}

uint64_t sub_23F267ED4()
{
  return MEMORY[0x24BE798A8]();
}

uint64_t sub_23F267EE0()
{
  return MEMORY[0x24BE798D0]();
}

uint64_t sub_23F267EEC()
{
  return MEMORY[0x24BE798E0]();
}

uint64_t sub_23F267EF8()
{
  return MEMORY[0x24BE79928]();
}

uint64_t sub_23F267F04()
{
  return MEMORY[0x24BE79930]();
}

uint64_t sub_23F267F10()
{
  return MEMORY[0x24BE79938]();
}

uint64_t sub_23F267F1C()
{
  return MEMORY[0x24BE79940]();
}

uint64_t sub_23F267F28()
{
  return MEMORY[0x24BE79960]();
}

uint64_t sub_23F267F34()
{
  return MEMORY[0x24BE79968]();
}

uint64_t sub_23F267F40()
{
  return MEMORY[0x24BE79970]();
}

uint64_t sub_23F267F4C()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_23F267F58()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_23F267F64()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23F267F70()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_23F267F7C()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_23F267F88()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_23F267F94()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_23F267FA0()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_23F267FAC()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_23F267FB8()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_23F267FC4()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_23F267FD0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23F267FDC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23F267FE8()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV4ToolV10DefinitionO0fG0V2eeoiySbAI_AItFZ_0()
{
  return MEMORY[0x24BEB8FA0]();
}

uint64_t sub_23F268000()
{
  return MEMORY[0x24BEB8FB8]();
}

uint64_t sub_23F26800C()
{
  return MEMORY[0x24BEB8FE0]();
}

uint64_t sub_23F268018()
{
  return MEMORY[0x24BEB9708]();
}

uint64_t sub_23F268024()
{
  return MEMORY[0x24BEB9710]();
}

uint64_t sub_23F268030()
{
  return MEMORY[0x24BEB97A8]();
}

uint64_t sub_23F26803C()
{
  return MEMORY[0x24BEB97D0]();
}

uint64_t sub_23F268048()
{
  return MEMORY[0x24BEB97D8]();
}

uint64_t sub_23F268054()
{
  return MEMORY[0x24BEB9970]();
}

uint64_t sub_23F268060()
{
  return MEMORY[0x24BEB99A8]();
}

uint64_t _s16IntelligenceFlow14MessagePayloadO17ActionWillExecuteV18ToolParameterValueO0J0V2eeoiySbAI_AItFZ_0()
{
  return MEMORY[0x24BEB99D0]();
}

uint64_t sub_23F268078()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_23F268084()
{
  return MEMORY[0x24BEB9A80]();
}

uint64_t sub_23F268090()
{
  return MEMORY[0x24BEB9AB8]();
}

uint64_t sub_23F26809C()
{
  return MEMORY[0x24BEB9CF0]();
}

uint64_t sub_23F2680A8()
{
  return MEMORY[0x24BEB9D20]();
}

uint64_t sub_23F2680B4()
{
  return MEMORY[0x24BEB9E18]();
}

uint64_t sub_23F2680C0()
{
  return MEMORY[0x24BEBA448]();
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV4ToolV10DefinitionO15AssistantSchemaV2eeoiySbAI_AItFZ_0()
{
  return MEMORY[0x24BEBA5B0]();
}

uint64_t sub_23F2680D8()
{
  return MEMORY[0x24BEBA5E0]();
}

uint64_t sub_23F2680E4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23F2680F0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23F2680FC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23F268108()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23F268114()
{
  return MEMORY[0x24BEE0478]();
}

uint64_t sub_23F268120()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23F26812C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23F268138()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23F268144()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23F268150()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23F26815C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23F268168()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23F268174()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23F268180()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23F26818C()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23F268198()
{
  return MEMORY[0x24BEE0B18]();
}

uint64_t sub_23F2681A4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23F2681B0()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_23F2681BC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23F2681C8()
{
  return MEMORY[0x24BEE0BC8]();
}

uint64_t sub_23F2681D4()
{
  return MEMORY[0x24BEE0BE0]();
}

uint64_t sub_23F2681E0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23F2681EC()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23F2681F8()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_23F268204()
{
  return MEMORY[0x24BEE0E60]();
}

uint64_t sub_23F268210()
{
  return MEMORY[0x24BEE0E68]();
}

uint64_t sub_23F26821C()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_23F268228()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23F268234()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23F268240()
{
  return MEMORY[0x24BEE1038]();
}

uint64_t sub_23F26824C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23F268258()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23F268264()
{
  return MEMORY[0x24BEE10B8]();
}

uint64_t sub_23F268270()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23F26827C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23F268288()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_23F268294()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23F2682A0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23F2682AC()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_23F2682B8()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_23F2682C4()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_23F2682D0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23F2682DC()
{
  return MEMORY[0x24BEE6C50]();
}

uint64_t sub_23F2682E8()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_23F2682F4()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_23F268300()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_23F26830C()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_23F268318()
{
  return MEMORY[0x24BEE6CF8]();
}

uint64_t sub_23F268324()
{
  return MEMORY[0x24BEE6D08]();
}

uint64_t sub_23F268330()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23F26833C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23F268348()
{
  return MEMORY[0x24BEE15C0]();
}

uint64_t sub_23F268354()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_23F268360()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_23F26836C()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_23F268378()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_23F268384()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_23F268390()
{
  return MEMORY[0x24BEE18F8]();
}

uint64_t sub_23F26839C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23F2683A8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23F2683B4()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_23F2683C0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23F2683CC()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23F2683D8()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_23F2683E4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23F2683F0()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_23F2683FC()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_23F268408()
{
  return MEMORY[0x24BDD00E8]();
}

uint64_t sub_23F268414()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_23F268420()
{
  return MEMORY[0x24BE799A8]();
}

uint64_t sub_23F26842C()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_23F268438()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23F268444()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23F268450()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_23F26845C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23F268468()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23F268474()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23F268480()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_23F26848C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23F268498()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23F2684A4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23F2684B0()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_23F2684BC()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23F2684C8()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23F2684D4()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23F2684E0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23F2684EC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23F2684F8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23F268504()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23F268510()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23F26851C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23F268528()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23F268534()
{
  return MEMORY[0x24BEE2528]();
}

uint64_t sub_23F268540()
{
  return MEMORY[0x24BEE25F0]();
}

uint64_t sub_23F26854C()
{
  return MEMORY[0x24BEE25F8]();
}

uint64_t sub_23F268558()
{
  return MEMORY[0x24BEE2600]();
}

uint64_t sub_23F268564()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t sub_23F268570()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_23F26857C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23F268588()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23F268594()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23F2685A0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23F2685AC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23F2685B8()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_23F2685C4()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_23F2685D0()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_23F2685DC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23F2685E8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23F2685F4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23F268600()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23F26860C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23F268618()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23F268624()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23F268630()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23F26863C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23F268648()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23F268654()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23F268660()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_23F26866C()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_23F268678()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23F268684()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23F268690()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23F26869C()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_23F2686A8()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23F2686B4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23F2686C0()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_23F2686CC()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_23F2686D8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23F2686E4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23F2686F0()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23F2686FC()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_23F268708()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_23F268714()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23F268720()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23F26872C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23F268738()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_23F268744()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23F268750()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23F26875C()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_23F268768()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_23F268774()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23F268780()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23F26878C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23F268798()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23F2687A4()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_23F2687B0()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_23F2687BC()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t sub_23F2687C8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23F2687D4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23F2687E0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23F2687EC()
{
  return MEMORY[0x24BE799B0]();
}

uint64_t sub_23F2687F8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23F268804()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23F268810()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23F26881C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23F268828()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23F268834()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23F268840()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23F26884C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23F268858()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23F268864()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23F268870()
{
  return MEMORY[0x24BEE45E8]();
}

uint64_t sub_23F26887C()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_23F268888()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23F268894()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_23F2688A0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23F2688AC()
{
  return MEMORY[0x24BEE4698]();
}

uint64_t sub_23F2688B8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23F2688C4()
{
  return MEMORY[0x24BEE4A10]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x24BE4F9A8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x24BED8588]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

