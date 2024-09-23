BOOL static EntropyError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EntropyError.hash(into:)()
{
  return sub_2422AE138();
}

uint64_t EntropyError.hashValue.getter()
{
  sub_2422AE12C();
  sub_2422AE138();
  return sub_2422AE144();
}

BOOL sub_2422AA0C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2422AA0DC()
{
  sub_2422AE12C();
  sub_2422AE138();
  return sub_2422AE144();
}

uint64_t sub_2422AA120()
{
  return sub_2422AE138();
}

uint64_t sub_2422AA148()
{
  sub_2422AE12C();
  sub_2422AE138();
  return sub_2422AE144();
}

uint64_t sub_2422AA198()
{
  uint64_t v0;

  v0 = sub_2422ADFC4();
  __swift_allocate_value_buffer(v0, qword_2571FAC10);
  __swift_project_value_buffer(v0, (uint64_t)qword_2571FAC10);
  return sub_2422ADFB8();
}

uint64_t ModelMonitoringLighthouseWorker.doWork(context:durationThreshold:)(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(double *)(v2 + 104) = a2;
  *(_QWORD *)(v2 + 96) = a1;
  v3 = sub_2422AE078();
  *(_QWORD *)(v2 + 112) = v3;
  *(_QWORD *)(v2 + 120) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 128) = swift_task_alloc();
  *(_QWORD *)(v2 + 136) = swift_task_alloc();
  v4 = sub_2422AE090();
  *(_QWORD *)(v2 + 144) = v4;
  *(_QWORD *)(v2 + 152) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 160) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2422AA2B8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[2];

  if ((sub_2422AE018() & 1) != 0)
  {
    if (qword_2571FAA80 != -1)
      swift_once();
    v1 = *(void **)(v0 + 96);
    v2 = sub_2422ADFC4();
    __swift_project_value_buffer(v2, (uint64_t)qword_2571FAC10);
    v3 = v1;
    v4 = sub_2422ADFAC();
    v5 = sub_2422AE024();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(void **)(v0 + 96);
    if (v6)
    {
      v8 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      v33[0] = v31;
      *(_DWORD *)v8 = 136315394;
      v9 = sub_2422ADF94();
      *(_QWORD *)(v0 + 80) = sub_2422ABDD0(v9, v10, v33);
      sub_2422AE03C();
      swift_bridgeObjectRelease();

      *(_WORD *)(v8 + 12) = 2080;
      v11 = sub_2422ADFA0();
      *(_QWORD *)(v0 + 88) = sub_2422ABDD0(v11, v12, v33);
      sub_2422AE03C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2422A8000, v4, v5, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2426A684C](v31, -1, -1);
      MEMORY[0x2426A684C](v8, -1, -1);
    }
    else
    {

    }
    sub_2422AE00C();
    sub_2422AC410(&qword_2571FAA48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], MEMORY[0x24BEE6848]);
    swift_allocError();
    sub_2422ADFD0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else if ((sub_2422AE018() & 1) != 0)
  {
    if (qword_2571FAA80 != -1)
      swift_once();
    v13 = *(void **)(v0 + 96);
    v14 = sub_2422ADFC4();
    __swift_project_value_buffer(v14, (uint64_t)qword_2571FAC10);
    v15 = v13;
    v16 = sub_2422ADFAC();
    v17 = sub_2422AE024();
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(void **)(v0 + 96);
    if (v18)
    {
      v20 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      v33[0] = v32;
      *(_DWORD *)v20 = 136315650;
      v21 = sub_2422ADF94();
      *(_QWORD *)(v0 + 56) = sub_2422ABDD0(v21, v22, v33);
      sub_2422AE03C();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 12) = 2080;
      v23 = sub_2422ADFA0();
      *(_QWORD *)(v0 + 64) = sub_2422ABDD0(v23, v24, v33);
      sub_2422AE03C();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 22) = 2048;
      *(_QWORD *)(v0 + 72) = 0;
      sub_2422AE03C();
      _os_log_impl(&dword_2422A8000, v16, v17, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2426A684C](v32, -1, -1);
      MEMORY[0x2426A684C](v20, -1, -1);
    }
    else
    {

    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    *(_QWORD *)(v0 + 168) = 0;
    v27 = *(_QWORD *)(v0 + 120);
    v26 = *(_QWORD *)(v0 + 128);
    v28 = *(_QWORD *)(v0 + 112);
    sub_2422AE084();
    *(_OWORD *)(v0 + 40) = xmmword_2422AE410;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_2422AC410(&qword_2571FAA38, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_2422AE0E4();
    sub_2422AC410(&qword_2571FAA40, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_2422AE09C();
    v29 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    *(_QWORD *)(v0 + 176) = v29;
    v29(v26, v28);
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v30;
    *v30 = v0;
    v30[1] = sub_2422AA838;
    return sub_2422AE0F0();
  }
}

uint64_t sub_2422AA838()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 176))(*(_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 112));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 152);
    v3 = *(_QWORD *)(v2 + 160);
    v5 = *(_QWORD *)(v2 + 144);
    (*(void (**)(_QWORD, _QWORD))(v2 + 176))(*(_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 112));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_2422AA8D8()
{
  uint64_t v0;
  double v1;
  double v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  _QWORD *v21;
  uint64_t v22;

  v1 = *(double *)(v0 + 104);
  v2 = *(double *)(v0 + 168) + 0.25;
  if (v2 >= v1 || (sub_2422AE018() & 1) != 0)
  {
    if (qword_2571FAA80 != -1)
      swift_once();
    v3 = *(void **)(v0 + 96);
    v4 = sub_2422ADFC4();
    __swift_project_value_buffer(v4, (uint64_t)qword_2571FAC10);
    v5 = v3;
    v6 = sub_2422ADFAC();
    v7 = sub_2422AE024();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(void **)(v0 + 96);
    if (v8)
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v22 = v11;
      *(_DWORD *)v10 = 136315650;
      v12 = sub_2422ADF94();
      *(_QWORD *)(v0 + 56) = sub_2422ABDD0(v12, v13, &v22);
      sub_2422AE03C();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 12) = 2080;
      v14 = sub_2422ADFA0();
      *(_QWORD *)(v0 + 64) = sub_2422ABDD0(v14, v15, &v22);
      sub_2422AE03C();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 22) = 2048;
      *(double *)(v0 + 72) = v2;
      sub_2422AE03C();
      _os_log_impl(&dword_2422A8000, v6, v7, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2426A684C](v11, -1, -1);
      MEMORY[0x2426A684C](v10, -1, -1);
    }
    else
    {

    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(BOOL))(v0 + 8))(v2 >= v1);
  }
  else
  {
    *(double *)(v0 + 168) = v2;
    v18 = *(_QWORD *)(v0 + 120);
    v17 = *(_QWORD *)(v0 + 128);
    v19 = *(_QWORD *)(v0 + 112);
    sub_2422AE084();
    *(_OWORD *)(v0 + 40) = xmmword_2422AE410;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_2422AC410(&qword_2571FAA38, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_2422AE0E4();
    sub_2422AC410(&qword_2571FAA40, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_2422AE09C();
    v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    *(_QWORD *)(v0 + 176) = v20;
    v20(v17, v19);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v21;
    *v21 = v0;
    v21[1] = sub_2422AA838;
    return sub_2422AE0F0();
  }
}

uint64_t sub_2422AAC58()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  if (qword_2571FAA80 != -1)
    swift_once();
  v1 = sub_2422ADFC4();
  __swift_project_value_buffer(v1, (uint64_t)qword_2571FAC10);
  v2 = sub_2422ADFAC();
  v3 = sub_2422AE030();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2422A8000, v2, v3, "Task interruped while sleeping.", v4, 2u);
    MEMORY[0x2426A684C](v4, -1, -1);
  }

  v5 = *(_QWORD *)(v0 + 168);
  if (qword_2571FAA80 != -1)
    swift_once();
  v6 = *(void **)(v0 + 96);
  __swift_project_value_buffer(v1, (uint64_t)qword_2571FAC10);
  v7 = v6;
  v8 = sub_2422ADFAC();
  v9 = sub_2422AE024();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 96);
  if (v10)
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v19 = v13;
    *(_DWORD *)v12 = 136315650;
    v14 = sub_2422ADF94();
    *(_QWORD *)(v0 + 56) = sub_2422ABDD0(v14, v15, &v19);
    sub_2422AE03C();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2080;
    v16 = sub_2422ADFA0();
    *(_QWORD *)(v0 + 64) = sub_2422ABDD0(v16, v17, &v19);
    sub_2422AE03C();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 22) = 2048;
    *(_QWORD *)(v0 + 72) = v5;
    sub_2422AE03C();
    _os_log_impl(&dword_2422A8000, v8, v9, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2426A684C](v13, -1, -1);
    MEMORY[0x2426A684C](v12, -1, -1);
  }
  else
  {

  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

Swift::Double __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ModelMonitoringLighthouseWorker.xLogx(x:)(Swift::Double x)
{
  BOOL v1;
  _BYTE *v2;
  Swift::Double result;

  v1 = x == 0.0;
  if (x >= 0.0)
  {
    result = 0.0;
    if (!v1)
      return log(x) * x;
  }
  else
  {
    sub_2422AC450();
    swift_allocError();
    *v2 = 0;
    swift_willThrow();
  }
  return result;
}

Swift::Double __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ModelMonitoringLighthouseWorker.entropy(nums:)(Swift::OpaquePointer nums)
{
  double v1;
  unint64_t v2;
  _BYTE *v3;
  double *v4;
  _BYTE *v5;
  Swift::Double result;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  double *v12;
  double v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  long double v18;
  uint64_t v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;

  v2 = *((_QWORD *)nums._rawValue + 2);
  if (v2 > 1)
  {
    v4 = (double *)((char *)nums._rawValue + 32);
    if (*((double *)nums._rawValue + 4) >= 0.0)
    {
      v7 = 0;
      while (*((double *)nums._rawValue + v7 + 5) >= 0.0)
      {
        if (v2 - 1 == ++v7)
        {
          v8 = v2 & 0x7FFFFFFFFFFFFFFELL;
          v9 = (double *)((char *)nums._rawValue + 40);
          v1 = 0.0;
          v10 = v2 & 0x7FFFFFFFFFFFFFFELL;
          do
          {
            v1 = v1 + *(v9 - 1) + *v9;
            v9 += 2;
            v10 -= 2;
          }
          while (v10);
          if (v2 != v8)
          {
            v11 = v2 - v8;
            v12 = (double *)((char *)nums._rawValue + 8 * v8 + 32);
            do
            {
              v13 = *v12++;
              v1 = v1 + v13;
              --v11;
            }
            while (v11);
          }
          v22 = MEMORY[0x24BEE4AF8];
          sub_2422AC494(0, v2, 0);
          v14 = *(_QWORD *)(v22 + 16);
          do
          {
            v15 = *v4;
            v16 = *(_QWORD *)(v22 + 24);
            v17 = v14 + 1;
            if (v14 >= v16 >> 1)
              sub_2422AC494(v16 > 1, v14 + 1, 1);
            result = v15 / v1;
            *(_QWORD *)(v22 + 16) = v17;
            *(double *)(v22 + 8 * v14 + 32) = v15 / v1;
            ++v4;
            ++v14;
            --v2;
          }
          while (v2);
          v18 = *(double *)(v22 + 32);
          if (v18 < 0.0)
          {
LABEL_27:
            sub_2422AC450();
            swift_allocError();
            *v21 = 0;
            swift_willThrow();
            swift_bridgeObjectRelease();
            return v1;
          }
          v19 = 0;
          v20 = v17 - 1;
          v1 = 0.0;
          while (1)
          {
            if (v18 != 0.0)
            {
              result = v18 * log(v18);
              v1 = v1 - result;
            }
            if (v20 == v19)
            {
              swift_bridgeObjectRelease();
              return v1;
            }
            if (v19 + 1 > v20)
              break;
            if (__OFADD__(v19 + 1, 1))
              goto LABEL_30;
            v18 = *(double *)(v22 + 8 * v19++ + 40);
            if (v18 < 0.0)
              goto LABEL_27;
          }
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
      }
    }
    sub_2422AC450();
    swift_allocError();
    *v5 = 0;
  }
  else
  {
    sub_2422AC450();
    swift_allocError();
    *v3 = 1;
  }
  swift_willThrow();
  return v1;
}

Swift::tuple_peopleSuggestionsSize_Int_numNoScore_Int_numMeanDeviations_Int_numEntropyDeviations_Int __swiftcall ModelMonitoringLighthouseWorker.monitorScores(mean:std:entropyMean:entropySd:)(Swift::Double mean, Swift::Double std, Swift::Double entropyMean, Swift::Double entropySd)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  Swift::Int v35;
  Swift::Int v36;
  Swift::Int v37;
  Swift::Int v38;
  Swift::Int v39;
  Swift::Int v40;
  Swift::Int v41;
  Swift::Int v42;
  uint64_t aBlock;
  uint64_t v44;
  uint64_t (*v45)();
  void *v46;
  void (*v47)(void *);
  uint64_t v48;
  Swift::tuple_peopleSuggestionsSize_Int_numNoScore_Int_numMeanDeviations_Int_numEntropyDeviations_Int result;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 0;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  v12 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v13 = objc_msgSend(v12, sel_ShareSheet);
  swift_unknownObjectRelease();
  v14 = objc_msgSend(v13, sel_Inference);
  swift_unknownObjectRelease();
  v15 = objc_msgSend(v14, sel_PeopleSuggestions);
  swift_unknownObjectRelease();
  v16 = objc_msgSend(v15, sel_publisher);

  v47 = (void (*)(void *))nullsub_1;
  v48 = 0;
  v17 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v44 = 1107296256;
  v45 = sub_2422AB934;
  v46 = &block_descriptor;
  v18 = _Block_copy(&aBlock);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v9;
  *(Swift::Double *)(v19 + 24) = mean;
  *(Swift::Double *)(v19 + 32) = std;
  *(_QWORD *)(v19 + 40) = v10;
  *(Swift::Double *)(v19 + 48) = entropyMean;
  *(Swift::Double *)(v19 + 56) = entropySd;
  *(_QWORD *)(v19 + 64) = v11;
  *(_QWORD *)(v19 + 72) = v8;
  v47 = sub_2422AC514;
  v48 = v19;
  aBlock = v17;
  v44 = 1107296256;
  v45 = sub_2422AB934;
  v46 = &block_descriptor_11;
  v20 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  v21 = objc_msgSend(v16, sel_sinkWithCompletion_receiveInput_, v18, v20);
  _Block_release(v20);
  _Block_release(v18);

  if (qword_2571FAA80 != -1)
    swift_once();
  v22 = sub_2422ADFC4();
  __swift_project_value_buffer(v22, (uint64_t)qword_2571FAC10);
  swift_retain();
  v23 = sub_2422ADFAC();
  v24 = sub_2422AE024();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v25 = 134217984;
    swift_beginAccess();
    aBlock = *(_QWORD *)(v8 + 16);
    sub_2422AE03C();
    swift_release();
    _os_log_impl(&dword_2422A8000, v23, v24, "mm plugin: peopleSuggestionsSize is %ld.", v25, 0xCu);
    MEMORY[0x2426A684C](v25, -1, -1);

  }
  else
  {

    swift_release();
  }
  swift_retain();
  v26 = sub_2422ADFAC();
  v27 = sub_2422AE024();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v28 = 134217984;
    swift_beginAccess();
    aBlock = *(_QWORD *)(v9 + 16);
    sub_2422AE03C();
    swift_release();
    _os_log_impl(&dword_2422A8000, v26, v27, "mm plugin: numNoScore is %ld.", v28, 0xCu);
    MEMORY[0x2426A684C](v28, -1, -1);

  }
  else
  {

    swift_release();
  }
  swift_retain();
  v29 = sub_2422ADFAC();
  v30 = sub_2422AE024();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v31 = 134217984;
    swift_beginAccess();
    aBlock = *(_QWORD *)(v10 + 16);
    sub_2422AE03C();
    swift_release();
    _os_log_impl(&dword_2422A8000, v29, v30, "mm plugin: numMeanDeviations is %ld.", v31, 0xCu);
    MEMORY[0x2426A684C](v31, -1, -1);

  }
  else
  {

    swift_release();
  }
  swift_retain();
  v32 = sub_2422ADFAC();
  v33 = sub_2422AE024();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v34 = 134217984;
    swift_beginAccess();
    aBlock = *(_QWORD *)(v11 + 16);
    sub_2422AE03C();
    swift_release();
    _os_log_impl(&dword_2422A8000, v32, v33, "mm plugin: numEntropyDeviations is %ld.", v34, 0xCu);
    MEMORY[0x2426A684C](v34, -1, -1);

  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  v35 = *(_QWORD *)(v8 + 16);
  swift_beginAccess();
  v36 = *(_QWORD *)(v9 + 16);
  swift_beginAccess();
  v37 = *(_QWORD *)(v10 + 16);
  swift_beginAccess();
  v38 = *(_QWORD *)(v11 + 16);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v39 = v35;
  v40 = v36;
  v41 = v37;
  v42 = v38;
  result.numEntropyDeviations = v42;
  result.numMeanDeviations = v41;
  result.numNoScore = v40;
  result.peopleSuggestionsSize = v39;
  return result;
}

int64_t sub_2422AB938(int64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= result)
      v3 = result;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (!result)
      v3 = 0;
    if (v2 >= v3)
      return a2;
  }
  __break(1u);
  return result;
}

Swift::Int __swiftcall ModelMonitoringLighthouseWorker.monitorVirtualFeatureStore()()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  Swift::Int v13;
  uint64_t aBlock;
  uint64_t v16;
  uint64_t (*v17)();
  void *v18;
  uint64_t (*v19)();
  uint64_t v20;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  v1 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v2 = objc_msgSend(v1, sel_ShareSheet);
  swift_unknownObjectRelease();
  v3 = objc_msgSend(v2, sel_VirtualFeatureStore);
  swift_unknownObjectRelease();
  v4 = objc_msgSend(v3, sel_publisher);

  v19 = nullsub_1;
  v20 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v16 = 1107296256;
  v17 = sub_2422AB934;
  v18 = &block_descriptor_15;
  v6 = _Block_copy(&aBlock);
  v19 = sub_2422ACD64;
  v20 = v0;
  aBlock = v5;
  v16 = 1107296256;
  v17 = sub_2422AB934;
  v18 = &block_descriptor_18;
  v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v8 = objc_msgSend(v4, sel_sinkWithCompletion_receiveInput_, v6, v7);
  _Block_release(v7);
  _Block_release(v6);

  if (qword_2571FAA80 != -1)
    swift_once();
  v9 = sub_2422ADFC4();
  __swift_project_value_buffer(v9, (uint64_t)qword_2571FAC10);
  swift_retain();
  v10 = sub_2422ADFAC();
  v11 = sub_2422AE024();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v12 = 134217984;
    swift_beginAccess();
    aBlock = *(_QWORD *)(v0 + 16);
    sub_2422AE03C();
    swift_release();
    _os_log_impl(&dword_2422A8000, v10, v11, "mm plugin: featureStoreSize is %ld.", v12, 0xCu);
    MEMORY[0x2426A684C](v12, -1, -1);

  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  v13 = *(_QWORD *)(v0 + 16);
  swift_release();
  return v13;
}

void sub_2422ABC74(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

_QWORD *sub_2422ABCC4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2571FAA68);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2422ADDF8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2422ABDD0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2422ABEA0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2422ADF00((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2422ADF00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2422ABEA0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2422AE048();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2422AC058(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2422AE06C();
  if (!v8)
  {
    sub_2422AE0A8();
    __break(1u);
LABEL_17:
    result = sub_2422AE0C0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2422AC058(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2422AC0EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2422AC2C4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2422AC2C4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2422AC0EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2422AC260(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2422AE054();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2422AE0A8();
      __break(1u);
LABEL_10:
      v2 = sub_2422ADFDC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2422AE0C0();
    __break(1u);
LABEL_14:
    result = sub_2422AE0A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2422AC260(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2571FAA78);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2422AC2C4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2571FAA78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2422AE0C0();
  __break(1u);
  return result;
}

uint64_t sub_2422AC410(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426A6804](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2422AC450()
{
  unint64_t result;

  result = qword_2571FAA50;
  if (!qword_2571FAA50)
  {
    result = MEMORY[0x2426A6804](&protocol conformance descriptor for EntropyError, &type metadata for EntropyError);
    atomic_store(result, (unint64_t *)&qword_2571FAA50);
  }
  return result;
}

uint64_t sub_2422AC494(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2422ACFC4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2422AC4B0()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2422AC4D8()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2422AC514(void *a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  os_log_t v9;
  uint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  double v43;
  double v44;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  int64_t v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  double v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  os_log_t v62;
  uint64_t v63;
  void *v64;
  os_log_t oslog;
  NSObject *osloga;
  double v67[4];
  void *v68;
  uint64_t v69;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(double *)(v1 + 24);
  v6 = *(double *)(v1 + 32);
  v63 = *(_QWORD *)(v1 + 40);
  v7 = *(double *)(v1 + 48);
  v8 = *(double *)(v1 + 56);
  v9 = *(os_log_t *)(v1 + 64);
  v10 = *(_QWORD *)(v1 + 72);
  v11 = objc_msgSend(a1, sel_eventBody);
  if (!v11)
  {
    if (qword_2571FAA80 != -1)
LABEL_79:
      swift_once();
    v21 = sub_2422ADFC4();
    __swift_project_value_buffer(v21, (uint64_t)qword_2571FAC10);
    osloga = sub_2422ADFAC();
    v22 = sub_2422AE030();
    if (os_log_type_enabled(osloga, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2422A8000, osloga, v22, "incorrect item in stream", v23, 2u);
      MEMORY[0x2426A684C](v23, -1, -1);
    }

    return;
  }
  v64 = v11;
  v12 = objc_msgSend(v11, sel_peopleSuggestions);
  sub_2422ACF88();
  v13 = sub_2422ADFE8();

  v69 = MEMORY[0x24BEE4AF8];
  if (v13 >> 62)
    goto LABEL_75;
  v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v62 = v9;
    oslog = (os_log_t)v4;
    if (v14)
    {
      if (v14 < 1)
        goto LABEL_78;
      v4 = 0;
      v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        if ((v13 & 0xC000000000000001) != 0)
          v16 = (id)MEMORY[0x2426A654C](v4, v13);
        else
          v16 = *(id *)(v13 + 8 * v4 + 32);
        v2 = v16;
        objc_msgSend(v16, sel_score);
        v18 = v17;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v15 = sub_2422ABCC4(0, v15[2] + 1, 1, v15);
        v20 = v15[2];
        v19 = v15[3];
        v3 = v20 + 1;
        if (v20 >= v19 >> 1)
          v15 = sub_2422ABCC4((_QWORD *)(v19 > 1), v20 + 1, 1, v15);
        ++v4;
        v15[2] = v3;
        v15[v20 + 4] = v18;

      }
      while (v14 != v4);
      swift_bridgeObjectRelease();
      v69 = (uint64_t)v15;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (qword_2571FAA80 != -1)
      swift_once();
    v24 = sub_2422ADFC4();
    v13 = __swift_project_value_buffer(v24, (uint64_t)qword_2571FAC10);
    v25 = sub_2422ADFAC();
    v26 = sub_2422AE024();
    v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      v4 = swift_slowAlloc();
      v2 = (void *)swift_slowAlloc();
      v68 = v2;
      *(_DWORD *)v4 = 136315138;
      v3 = v4 + 12;
      swift_beginAccess();
      v28 = swift_bridgeObjectRetain();
      v29 = v10;
      v30 = MEMORY[0x2426A64E0](v28, MEMORY[0x24BEE13C8]);
      v32 = v31;
      swift_bridgeObjectRelease();
      v33 = v30;
      v10 = v29;
      v67[0] = COERCE_DOUBLE(sub_2422ABDD0(v33, v32, (uint64_t *)&v68));
      sub_2422AE03C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2422A8000, v25, (os_log_type_t)v27, "mm plugin: scores are %s", (uint8_t *)v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426A684C](v2, -1, -1);
      MEMORY[0x2426A684C](v4, -1, -1);
    }

    v9 = oslog;
    swift_beginAccess();
    v34 = *(_QWORD *)(v69 + 16);
    if (!v34)
    {
LABEL_32:

      swift_beginAccess();
      if (!__OFADD__(oslog[2].isa, 1))
      {
        ++oslog[2].isa;
        goto LABEL_72;
      }
      goto LABEL_77;
    }
    if (*(double *)(v69 + 32) != -1.0)
      break;
    if (v34 == 1)
      goto LABEL_32;
    v35 = 5;
    while (1)
    {
      v36 = v35 - 3;
      if (__OFADD__(v35 - 4, 1))
        break;
      if (*(double *)(v69 + 8 * v35) != -1.0)
        goto LABEL_34;
      ++v35;
      if (v36 == v34)
        goto LABEL_32;
    }
    __break(1u);
LABEL_75:
    swift_bridgeObjectRetain();
    v14 = sub_2422AE0B4();
    swift_bridgeObjectRelease();
  }
LABEL_34:
  if ((unint64_t)v34 < 2)
  {
    v37 = 0;
    v38 = 0.0;
    goto LABEL_39;
  }
  v37 = v34 & 0x7FFFFFFFFFFFFFFELL;
  v39 = (double *)(v69 + 40);
  v38 = 0.0;
  v40 = v34 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    v38 = v38 + *(v39 - 1) + *v39;
    v39 += 2;
    v40 -= 2;
  }
  while (v40);
  if (v34 != v37)
  {
LABEL_39:
    v41 = v34 - v37;
    v42 = (double *)(v69 + 8 * v37 + 32);
    do
    {
      v43 = *v42++;
      v38 = v38 + v43;
      --v41;
    }
    while (v41);
  }
  v44 = v38 / (double)v34;
  if (v5 + v6 + v6 < v44 || v44 < v5 - (v6 + v6))
  {
    swift_beginAccess();
    if (!__OFADD__(*(_QWORD *)(v63 + 16), 1))
    {
      ++*(_QWORD *)(v63 + 16);
      goto LABEL_48;
    }
    __break(1u);
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
LABEL_48:
  v46 = sub_2422ADFAC();
  v47 = sub_2422AE024();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v48 = 134217984;
    v67[0] = v44;
    sub_2422AE03C();
    _os_log_impl(&dword_2422A8000, v46, v47, "mm plugin: mean score is %f.", v48, 0xCu);
    MEMORY[0x2426A684C](v48, -1, -1);
  }

  v67[0] = *(double *)&v69;
  swift_bridgeObjectRetain_n();
  sub_2422AD120((uint64_t *)v67);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(*(_QWORD *)&v67[0] + 16) >= 5uLL)
    v49 = 5;
  else
    v49 = *(_QWORD *)(*(_QWORD *)&v67[0] + 16);
  v4 = sub_2422AB938(v49, *(uint64_t *)&v67[0]);
  v27 = v50;
  v2 = v51;
  v3 = v52;
  if ((v52 & 1) == 0)
  {
LABEL_54:
    v53 = sub_2422AD188(v4, v27, (uint64_t)v2, v3);
    goto LABEL_61;
  }
  sub_2422AE0D8();
  swift_unknownObjectRetain_n();
  v54 = swift_dynamicCastClass();
  if (!v54)
  {
    swift_unknownObjectRelease();
    v54 = MEMORY[0x24BEE4AF8];
  }
  v55 = *(_QWORD *)(v54 + 16);
  swift_release();
  if (__OFSUB__(v3 >> 1, v2))
    goto LABEL_81;
  if (v55 != (v3 >> 1) - (_QWORD)v2)
  {
LABEL_82:
    swift_unknownObjectRelease();
    goto LABEL_54;
  }
  v53 = swift_dynamicCastClass();
  if (!v53)
  {
    swift_unknownObjectRelease();
    v53 = MEMORY[0x24BEE4AF8];
  }
LABEL_61:
  swift_unknownObjectRelease();
  v57 = ModelMonitoringLighthouseWorker.entropy(nums:)((Swift::OpaquePointer)v53);
  swift_release();
  if (v56)
  {
    v58 = sub_2422ADFAC();
    v59 = sub_2422AE030();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v60 = 0;
      _os_log_impl(&dword_2422A8000, v58, v59, "mm plugin: Not able to compute the entropy.", v60, 2u);
      MEMORY[0x2426A684C](v60, -1, -1);
    }

LABEL_72:
    swift_beginAccess();
    if (!__OFADD__(*(_QWORD *)(v10 + 16), 1))
    {
      ++*(_QWORD *)(v10 + 16);
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }

  if (v7 + v8 >= v57 && v57 >= v7 - v8)
    goto LABEL_72;
  swift_beginAccess();
  if (!__OFADD__(v62[2].isa, 1))
  {
    ++v62[2].isa;
    goto LABEL_72;
  }
  __break(1u);
  swift_release();
  __break(1u);
}

uint64_t sub_2422ACD64()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  result = swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 16);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
    __break(1u);
  else
    *(_QWORD *)(v0 + 16) = v4;
  return result;
}

unint64_t sub_2422ACDB4()
{
  unint64_t result;

  result = qword_2571FAA58;
  if (!qword_2571FAA58)
  {
    result = MEMORY[0x2426A6804](&protocol conformance descriptor for EntropyError, &type metadata for EntropyError);
    atomic_store(result, (unint64_t *)&qword_2571FAA58);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EntropyError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EntropyError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2422ACEE4 + 4 * byte_2422AE455[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2422ACF18 + 4 * byte_2422AE450[v4]))();
}

uint64_t sub_2422ACF18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422ACF20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2422ACF28);
  return result;
}

uint64_t sub_2422ACF34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2422ACF3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2422ACF40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422ACF48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2422ACF54(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2422ACF5C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EntropyError()
{
  return &type metadata for EntropyError;
}

ValueMetadata *type metadata accessor for ModelMonitoringLighthouseWorker()
{
  return &type metadata for ModelMonitoringLighthouseWorker;
}

unint64_t sub_2422ACF88()
{
  unint64_t result;

  result = qword_2571FAA60;
  if (!qword_2571FAA60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2571FAA60);
  }
  return result;
}

uint64_t sub_2422ACFC4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2571FAA68);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2422AE0C0();
  __break(1u);
  return result;
}

uint64_t sub_2422AD120(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2422ADDE4(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_2422AD334(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2422AD188(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x24BEE4AF8];
    v8 = 8 * v5;
    if (v5 <= 0)
    {
      v9 = (char *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = v9 + 32;
        v13 = (char *)(a2 + 8 * a3);
        if (v13 < &v9[v8 + 32] && v12 < &v13[v8])
          goto LABEL_19;
        memcpy(v12, v13, 8 * v5);
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2571FAA68);
      v9 = (char *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      *((_QWORD *)v9 + 2) = v5;
      *((_QWORD *)v9 + 3) = 2 * (v11 >> 3);
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_2422AE0C0();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A67F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2422AD334(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  double v25;
  uint64_t v26;
  double *v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  char v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t i;
  double v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  unint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double *__dst;

  v2 = a1;
  v3 = a1[1];
  result = sub_2422AE0CC();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v80 = 0;
      v81 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v83 = *(double *)(v81 + 8 * i);
        v84 = v80;
        do
        {
          v85 = v81 + 8 * v84;
          if (*(double *)v85 >= v83)
            break;
          if (!v81)
            goto LABEL_140;
          *(_QWORD *)(v85 + 8) = *(_QWORD *)v85;
          *(double *)(v81 + 8 * v84--) = v83;
        }
        while (v84 != -1);
        ++v80;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_145;
  v97 = result;
  v98 = v3;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v96 = v8;
      if (v12 >= 2)
      {
        v86 = *v2;
        do
        {
          v87 = v12 - 2;
          if (v12 < 2)
            goto LABEL_131;
          if (!v86)
            goto LABEL_144;
          v88 = v11;
          v89 = v11 + 32;
          v90 = *(_QWORD *)&v11[16 * v87 + 32];
          v91 = *(_QWORD *)&v11[16 * v12 + 24];
          sub_2422AD9C4((double *)(v86 + 8 * v90), (double *)(v86 + 8 * *(_QWORD *)&v89[16 * v12 - 16]), v86 + 8 * v91, __dst);
          if (v1)
            break;
          if (v91 < v90)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v88 = sub_2422ADDD0((uint64_t)v88);
          if (v87 >= *((_QWORD *)v88 + 2))
            goto LABEL_133;
          v92 = &v88[16 * v87 + 32];
          *(_QWORD *)v92 = v90;
          *((_QWORD *)v92 + 1) = v91;
          v93 = *((_QWORD *)v88 + 2);
          if (v12 > v93)
            goto LABEL_134;
          memmove(&v88[16 * v12 + 16], &v88[16 * v12 + 32], 16 * (v93 - v12));
          v11 = v88;
          *((_QWORD *)v88 + 2) = v93 - 1;
          v12 = v93 - 1;
        }
        while (v93 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v96 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v96 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_2422AE000();
    *(_QWORD *)(v7 + 16) = v6;
    v3 = v98;
    v96 = v7;
    __dst = (double *)(v7 + 32);
  }
  v9 = 0;
  v10 = *v2;
  v94 = v2;
  v95 = *v2 - 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v99 = *v2;
  while (1)
  {
    v13 = v9++;
    if (v9 < v3)
    {
      v14 = *(double *)(v10 + 8 * v9);
      v15 = *(double *)(v10 + 8 * v13);
      v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        v16 = v14;
        while (1)
        {
          v17 = v16;
          v16 = *(double *)(v10 + 8 * v9);
          if (v15 < v14 == v17 >= v16)
            break;
          if (v3 == ++v9)
          {
            v9 = v3;
            break;
          }
        }
      }
      if (v15 < v14)
      {
        if (v9 < v13)
          goto LABEL_137;
        if (v13 < v9)
        {
          v18 = (uint64_t *)(v95 + 8 * v9);
          v19 = v9;
          v20 = v13;
          v21 = (uint64_t *)(v10 + 8 * v13);
          do
          {
            if (v20 != --v19)
            {
              if (!v10)
                goto LABEL_143;
              v22 = *v21;
              *v21 = *v18;
              *v18 = v22;
            }
            ++v20;
            --v18;
            ++v21;
          }
          while (v20 < v19);
        }
      }
    }
    if (v9 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v9, v13))
      goto LABEL_135;
    if (v9 - v13 >= v97)
      goto LABEL_46;
    v23 = v13 + v97;
    if (__OFADD__(v13, v97))
      goto LABEL_138;
    if (v23 >= v3)
      v23 = v3;
    if (v23 < v13)
      break;
    if (v9 != v23)
    {
      v24 = (double *)(v95 + 8 * v9);
      do
      {
        v25 = *(double *)(v10 + 8 * v9);
        v26 = v13;
        v27 = v24;
        do
        {
          v28 = *v27;
          if (*v27 >= v25)
            break;
          if (!v10)
            goto LABEL_141;
          *v27 = v25;
          v27[1] = v28;
          --v27;
          ++v26;
        }
        while (v9 != v26);
        ++v9;
        ++v24;
      }
      while (v9 != v23);
      v9 = v23;
    }
LABEL_46:
    if (v9 < v13)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_2422ADC30(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v30 = *((_QWORD *)v11 + 2);
    v29 = *((_QWORD *)v11 + 3);
    v12 = v30 + 1;
    v10 = v99;
    if (v30 >= v29 >> 1)
    {
      v79 = sub_2422ADC30((char *)(v29 > 1), v30 + 1, 1, v11);
      v10 = v99;
      v11 = v79;
    }
    *((_QWORD *)v11 + 2) = v12;
    v31 = v11 + 32;
    v32 = &v11[16 * v30 + 32];
    *(_QWORD *)v32 = v13;
    *((_QWORD *)v32 + 1) = v9;
    if (v30)
    {
      while (1)
      {
        v33 = v12 - 1;
        if (v12 >= 4)
        {
          v38 = &v31[16 * v12];
          v39 = *((_QWORD *)v38 - 8);
          v40 = *((_QWORD *)v38 - 7);
          v44 = __OFSUB__(v40, v39);
          v41 = v40 - v39;
          if (v44)
            goto LABEL_119;
          v43 = *((_QWORD *)v38 - 6);
          v42 = *((_QWORD *)v38 - 5);
          v44 = __OFSUB__(v42, v43);
          v36 = v42 - v43;
          v37 = v44;
          if (v44)
            goto LABEL_120;
          v45 = v12 - 2;
          v46 = &v31[16 * v12 - 32];
          v48 = *(_QWORD *)v46;
          v47 = *((_QWORD *)v46 + 1);
          v44 = __OFSUB__(v47, v48);
          v49 = v47 - v48;
          if (v44)
            goto LABEL_122;
          v44 = __OFADD__(v36, v49);
          v50 = v36 + v49;
          if (v44)
            goto LABEL_125;
          if (v50 >= v41)
          {
            v68 = &v31[16 * v33];
            v70 = *(_QWORD *)v68;
            v69 = *((_QWORD *)v68 + 1);
            v44 = __OFSUB__(v69, v70);
            v71 = v69 - v70;
            if (v44)
              goto LABEL_129;
            v61 = v36 < v71;
            goto LABEL_83;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v62 = *((_QWORD *)v11 + 4);
            v63 = *((_QWORD *)v11 + 5);
            v44 = __OFSUB__(v63, v62);
            v55 = v63 - v62;
            v56 = v44;
            goto LABEL_77;
          }
          v35 = *((_QWORD *)v11 + 4);
          v34 = *((_QWORD *)v11 + 5);
          v44 = __OFSUB__(v34, v35);
          v36 = v34 - v35;
          v37 = v44;
        }
        if ((v37 & 1) != 0)
          goto LABEL_121;
        v45 = v12 - 2;
        v51 = &v31[16 * v12 - 32];
        v53 = *(_QWORD *)v51;
        v52 = *((_QWORD *)v51 + 1);
        v54 = __OFSUB__(v52, v53);
        v55 = v52 - v53;
        v56 = v54;
        if (v54)
          goto LABEL_124;
        v57 = &v31[16 * v33];
        v59 = *(_QWORD *)v57;
        v58 = *((_QWORD *)v57 + 1);
        v44 = __OFSUB__(v58, v59);
        v60 = v58 - v59;
        if (v44)
          goto LABEL_127;
        if (__OFADD__(v55, v60))
          goto LABEL_128;
        if (v55 + v60 >= v36)
        {
          v61 = v36 < v60;
LABEL_83:
          if (v61)
            v33 = v45;
          goto LABEL_85;
        }
LABEL_77:
        if ((v56 & 1) != 0)
          goto LABEL_123;
        v64 = &v31[16 * v33];
        v66 = *(_QWORD *)v64;
        v65 = *((_QWORD *)v64 + 1);
        v44 = __OFSUB__(v65, v66);
        v67 = v65 - v66;
        if (v44)
          goto LABEL_126;
        if (v67 < v55)
          goto LABEL_15;
LABEL_85:
        v72 = v33 - 1;
        if (v33 - 1 >= v12)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v10)
          goto LABEL_142;
        v73 = &v31[16 * v72];
        v74 = *(_QWORD *)v73;
        v75 = v31;
        v76 = &v31[16 * v33];
        v77 = *((_QWORD *)v76 + 1);
        sub_2422AD9C4((double *)(v10 + 8 * *(_QWORD *)v73), (double *)(v10 + 8 * *(_QWORD *)v76), v10 + 8 * v77, __dst);
        if (v1)
          goto LABEL_113;
        if (v77 < v74)
          goto LABEL_116;
        if (v33 > *((_QWORD *)v11 + 2))
          goto LABEL_117;
        *(_QWORD *)v73 = v74;
        *(_QWORD *)&v75[16 * v72 + 8] = v77;
        v78 = *((_QWORD *)v11 + 2);
        if (v33 >= v78)
          goto LABEL_118;
        v12 = v78 - 1;
        memmove(v76, v76 + 16, 16 * (v78 - 1 - v33));
        v31 = v75;
        *((_QWORD *)v11 + 2) = v78 - 1;
        v10 = v99;
        if (v78 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v98;
    if (v9 >= v98)
    {
      v8 = v96;
      v2 = v94;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  result = sub_2422AE0A8();
  __break(1u);
  return result;
}

uint64_t sub_2422AD9C4(double *__src, double *a2, unint64_t a3, double *__dst)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  uint64_t result;
  double *v22;
  double *v23;
  double *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v9 = (char *)a2 - (char *)__src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[v13] <= __dst)
        memmove(__dst, a2, 8 * v13);
      v16 = &v4[v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        v17 = (double *)(a3 - 8);
        while (1)
        {
          v18 = v17 + 1;
          v19 = v6 - 1;
          v20 = *(v6 - 1);
          if (v20 >= *(v16 - 1))
          {
            v22 = v16 - 1;
            if (v18 < v16 || v17 >= v16 || v18 != v16)
              *v17 = *(v16 - 1);
            --v16;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v18 != v6 || v17 >= v6)
              *v17 = v20;
            v24 = --v6;
            if (v19 <= v7)
              goto LABEL_42;
          }
          --v17;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v14 = &v4[v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*v4 >= *v6)
        {
          if (v7 != v4)
            *v7 = *v4;
          v23 = ++v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 1;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *v7 = *v6;
        }
        ++v7;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_2422ADD28((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_2422AE0C0();
  __break(1u);
  return result;
}

char *sub_2422ADC30(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2571FAA70);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2422ADD28(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_2422AE0C0();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_2422ADDD0(uint64_t a1)
{
  return sub_2422ADC30(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2422ADDE4(uint64_t a1)
{
  return sub_2422ACFC4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_2422ADDF8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_2422AE0C0();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2422ADF00(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
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

uint64_t sub_2422ADF94()
{
  return MEMORY[0x24BE5F6D8]();
}

uint64_t sub_2422ADFA0()
{
  return MEMORY[0x24BE5F6E0]();
}

uint64_t sub_2422ADFAC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2422ADFB8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2422ADFC4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2422ADFD0()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_2422ADFDC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2422ADFE8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2422ADFF4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2422AE000()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2422AE00C()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_2422AE018()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_2422AE024()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2422AE030()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2422AE03C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2422AE048()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2422AE054()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2422AE060()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2422AE06C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2422AE078()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_2422AE084()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_2422AE090()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_2422AE09C()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2422AE0A8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2422AE0B4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2422AE0C0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2422AE0CC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2422AE0D8()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_2422AE0E4()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_2422AE0F0()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_2422AE0FC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2422AE108()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2422AE114()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2422AE120()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2422AE12C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2422AE138()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2422AE144()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
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

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

