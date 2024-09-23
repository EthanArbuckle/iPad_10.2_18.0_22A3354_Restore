void sub_23A378D34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542D1640)
  {
    sub_23A3A7FC4();
    v0 = sub_23A3A8498();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542D1640);
  }
}

id DepthFormatter.init(configuration:)(__int128 *a1)
{
  char *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  char *v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  char *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id result;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v2 = a1[7];
  v53 = a1[6];
  v54 = v2;
  v3 = a1[9];
  v55 = a1[8];
  v56 = v3;
  v4 = a1[3];
  v49 = a1[2];
  v50 = v4;
  v5 = a1[5];
  v51 = a1[4];
  v52 = v5;
  v6 = a1[1];
  v7 = &v1[OBJC_IVAR___DKDepthFormatter____lazy_storage___decimalDigitsAndPunctuationSet];
  v47 = *a1;
  v48 = v6;
  v8 = sub_23A3A7FC4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = &v1[OBJC_IVAR___DKDepthFormatter_configuration];
  v10 = v54;
  *((_OWORD *)v9 + 6) = v53;
  *((_OWORD *)v9 + 7) = v10;
  v11 = v56;
  *((_OWORD *)v9 + 8) = v55;
  *((_OWORD *)v9 + 9) = v11;
  v12 = v50;
  *((_OWORD *)v9 + 2) = v49;
  *((_OWORD *)v9 + 3) = v12;
  v13 = v52;
  *((_OWORD *)v9 + 4) = v51;
  *((_OWORD *)v9 + 5) = v13;
  v14 = v48;
  *(_OWORD *)v9 = v47;
  *((_OWORD *)v9 + 1) = v14;
  v15 = objc_allocWithZone(MEMORY[0x24BDD16F0]);
  v16 = v1;
  sub_23A379404((uint64_t)&v47, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_23A3795F0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23A379478);
  v17 = objc_msgSend(v15, sel_init);
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_depthNumberFormatter] = v17;
  v18 = BYTE10(v55);
  objc_msgSend(v17, sel_setMaximumFractionDigits_, BYTE10(v55));
  objc_msgSend(v17, sel_setMinimumFractionDigits_, v18);
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1668]), sel_init);
  v20 = OBJC_IVAR___DKDepthFormatter_depthMeasurementFormatter;
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_depthMeasurementFormatter] = v19;
  objc_msgSend(v19, sel_setUnitStyle_, 2);
  objc_msgSend(v19, sel_setUnitOptions_, 1);
  result = objc_msgSend(v19, sel_numberFormatter);
  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  v22 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, v18);

  result = objc_msgSend(*(id *)&v16[v20], sel_numberFormatter);
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v23 = result;
  objc_msgSend(result, sel_setMinimumFractionDigits_, v18);
  sub_23A379404((uint64_t)&v47, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_23A379608, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23A379490);

  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter] = v24;
  objc_msgSend(v24, sel_setMaximumFractionDigits_, 0);
  objc_msgSend(v24, sel_setMinimumFractionDigits_, 0);
  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1668]), sel_init);
  v26 = OBJC_IVAR___DKDepthFormatter_depthIntegerMeasurementFormatter;
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_depthIntegerMeasurementFormatter] = v25;
  objc_msgSend(v25, sel_setUnitStyle_, 2);
  objc_msgSend(v25, sel_setUnitOptions_, 1);
  result = objc_msgSend(v25, sel_numberFormatter);
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v27 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

  result = objc_msgSend(*(id *)&v16[v26], sel_numberFormatter);
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v28 = result;
  objc_msgSend(result, sel_setMinimumFractionDigits_, 0);

  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14F8]), sel_init);
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_longUnderwaterTimeFormatter] = v29;
  objc_msgSend(v29, sel_setZeroFormattingBehavior_, 2);
  objc_msgSend(v29, sel_setAllowedUnits_, 224);
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14F8]), sel_init);
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_shortUnderwaterTimeFormatter] = v30;
  objc_msgSend(v30, sel_setZeroFormattingBehavior_, 0x10000);
  objc_msgSend(v30, sel_setAllowedUnits_, 192);
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14F8]), sel_init);
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_secondsOnlyShortUnderwaterTimeFormatter] = v31;
  objc_msgSend(v31, sel_setZeroFormattingBehavior_, 0x10000);
  objc_msgSend(v31, sel_setAllowedUnits_, 128);
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14F8]), sel_init);
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_diveHistoryDiveDurationFormatter] = v32;
  objc_msgSend(v32, sel_setAllowedUnits_, 224);
  objc_msgSend(v32, sel_setUnitsStyle_, 2);
  objc_msgSend(v32, sel_setZeroFormattingBehavior_, 14);
  v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1668]), sel_init);
  v34 = OBJC_IVAR___DKDepthFormatter_temperatureFormatter;
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_temperatureFormatter] = v33;
  objc_msgSend(v33, sel_setUnitStyle_, 2);
  result = objc_msgSend(v33, sel_numberFormatter);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v35 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

  result = objc_msgSend(*(id *)&v16[v34], sel_numberFormatter);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v36 = result;
  objc_msgSend(result, sel_setMinimumFractionDigits_, 0);

  objc_msgSend(*(id *)&v16[v34], sel_setUnitOptions_, 1);
  v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1668]), sel_init);
  v38 = OBJC_IVAR___DKDepthFormatter_temperatureUnitlessFormatter;
  *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_temperatureUnitlessFormatter] = v37;
  objc_msgSend(v37, sel_setUnitStyle_, 1);
  objc_msgSend(v37, sel_setUnitOptions_, 5);
  result = objc_msgSend(v37, sel_numberFormatter);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v39 = result;
  objc_msgSend(result, sel_setMaximumFractionDigits_, 0);

  result = objc_msgSend(*(id *)&v16[v38], sel_numberFormatter);
  if (result)
  {
    v40 = result;
    objc_msgSend(result, sel_setMinimumFractionDigits_, 0);

    v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_startDateFormatter] = v41;
    objc_msgSend(v41, sel_setDoesRelativeDateFormatting_, 1);
    objc_msgSend(v41, sel_setDateStyle_, 1);
    objc_msgSend(v41, sel_setTimeStyle_, 1);
    v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_endDateFormatter] = v42;
    objc_msgSend(v42, sel_setDateStyle_, 0);
    objc_msgSend(v42, sel_setTimeStyle_, 1);
    v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
    *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_voiceoverDateFormatter] = v43;
    objc_msgSend(v43, sel_setDateStyle_, 3);
    objc_msgSend(v43, sel_setTimeStyle_, 3);
    v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
    *(_QWORD *)&v16[OBJC_IVAR___DKDepthFormatter_batteryLevelFormatter] = v44;
    objc_msgSend(v44, sel_setMaximumFractionDigits_, 0);
    v45 = v44;
    objc_msgSend(v45, sel_setNumberStyle_, 3);

    v46.receiver = v16;
    v46.super_class = (Class)type metadata accessor for DepthFormatter();
    return objc_msgSendSuper2(&v46, sel_init);
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_23A379404(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 112);
  v7 = *(_QWORD *)(a1 + 120);
  v8 = *(_QWORD *)(a1 + 128);
  v9 = *(unsigned __int8 *)(a1 + 136);
  a2(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 96));
  a3(v5, v6, v7, v8, v9);
  return a1;
}

uint64_t sub_23A379478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 0x3Fu)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23A379490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 <= 0x3Fu)
    return swift_bridgeObjectRelease();
  return result;
}

double DiveConfiguration.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a1 + 8) = _Q0;
  *(_OWORD *)(a1 + 24) = xmmword_23A3AA760;
  *(_OWORD *)(a1 + 40) = xmmword_23A3AA770;
  *(_OWORD *)(a1 + 56) = xmmword_23A3AA780;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 96) = 0x80;
  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_DWORD *)(a1 + 136) = 16777344;
  *(_BYTE *)(a1 + 140) = 1;
  result = 120.0;
  *(_OWORD *)(a1 + 144) = xmmword_23A3ACCD0;
  return result;
}

void sub_23A379518()
{
  unint64_t v0;

  sub_23A378D34();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t type metadata accessor for DepthFormatter()
{
  uint64_t result;

  result = qword_2542D1608;
  if (!qword_2542D1608)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A3795F0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result;

  if (a4 <= 0x3Fu)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_23A379608(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t result;

  if (a4 <= 0x3Fu)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t static DiveMetricError.== infix(_:_:)()
{
  return 1;
}

uint64_t DiveMetricError.hash(into:)()
{
  return sub_23A3A86F0();
}

uint64_t DiveMetricError.hashValue.getter()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

uint64_t sub_23A37968C()
{
  return 1;
}

uint64_t sub_23A379694()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

uint64_t sub_23A3796D4()
{
  return sub_23A3A86F0();
}

uint64_t sub_23A3796F8()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

void static DepthMetricUtilities.numberOfDescents(from:)(void *a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(a1, sel_workoutActivityType) != (id)84)
  {
    sub_23A379D20();
    swift_allocError();
    swift_willThrow();
    return;
  }
  v2 = objc_msgSend(a1, sel_workoutEvents);
  if (v2)
  {
    v3 = v2;
    sub_23A379D64(0, &qword_25696F218);
    v4 = sub_23A3A8354();

    v11 = MEMORY[0x24BEE4AF8];
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v5 = sub_23A3A8570();
      swift_bridgeObjectRelease();
      if (v5)
      {
LABEL_5:
        if (v5 < 1)
          goto LABEL_26;
        for (i = 0; i != v5; ++i)
        {
          if ((v4 & 0xC000000000000001) != 0)
            v7 = (id)MEMORY[0x23B84A76C](i, v4);
          else
            v7 = *(id *)(v4 + 8 * i + 32);
          v8 = v7;
          if (objc_msgSend(v7, sel_type) == (id)2)
          {
            sub_23A3A8534();
            sub_23A3A854C();
            sub_23A3A8558();
            sub_23A3A8540();
          }
          else
          {

          }
        }
        swift_bridgeObjectRelease();
        v9 = v11;
        if (v11 < 0)
          goto LABEL_24;
LABEL_20:
        if ((v9 & 0x4000000000000000) == 0)
        {
          v10 = *(_QWORD *)(v9 + 16);
LABEL_22:
          swift_release();
          if (!__OFADD__(v10, 1))
            return;
          __break(1u);
LABEL_26:
          __break(1u);
          return;
        }
LABEL_24:
        swift_bridgeObjectRetain();
        v10 = sub_23A3A8570();
        swift_release();
        goto LABEL_22;
      }
    }
    else
    {
      v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v5)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_24;
    goto LABEL_20;
  }
}

id static DepthMetricUtilities.maxDepth(from:)(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  if (objc_msgSend(a1, sel_workoutActivityType) == (id)84)
  {
    sub_23A379D64(0, (unint64_t *)&qword_25696F220);
    v2 = (void *)MEMORY[0x23B84A6A0]((id)*MEMORY[0x24BDD3698]);
    v3 = objc_msgSend(v1, sel_statisticsForType_, v2);

    if (v3)
    {
      v1 = objc_msgSend(v3, sel_maximumQuantity);

    }
    else
    {
      return 0;
    }
  }
  else
  {
    sub_23A379D20();
    swift_allocError();
    swift_willThrow();
  }
  return v1;
}

id static DepthMetricUtilities.underwaterTime(from:)(void *a1)
{
  if (objc_msgSend(a1, sel_workoutActivityType) == (id)84)
    return objc_msgSend(a1, sel_duration);
  sub_23A379D20();
  swift_allocError();
  return (id)swift_willThrow();
}

void static DepthMetricUtilities.waterTemperatureRange(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  id v6;
  double v7;
  id v8;
  double v9;
  double v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  char v19;
  double v20;

  if (objc_msgSend(a1, sel_workoutActivityType) != (id)84)
  {
    sub_23A379D20();
    swift_allocError();
    swift_willThrow();
    return;
  }
  sub_23A379D64(0, (unint64_t *)&qword_25696F220);
  v4 = (id)*MEMORY[0x24BDD36D8];
  v5 = (void *)MEMORY[0x23B84A6A0]();
  v6 = objc_msgSend(a1, sel_statisticsForType_, v5);

  if (!v6)
  {
    v7 = 0.0;
    goto LABEL_7;
  }
  v7 = COERCE_DOUBLE(objc_msgSend(v6, sel_minimumQuantity));

  if (v7 == 0.0)
  {
LABEL_7:
    v11 = 1;
    goto LABEL_8;
  }
  v8 = objc_msgSend((id)objc_opt_self(), sel_degreeCelsiusUnit);
  objc_msgSend(*(id *)&v7, sel_doubleValueForUnit_, v8);
  v10 = v9;

  v11 = 0;
  v7 = v10;
LABEL_8:
  v12 = (void *)MEMORY[0x23B84A6A0](v4);
  v13 = objc_msgSend(a1, sel_statisticsForType_, v12);

  if (v13 && (v14 = objc_msgSend(v13, sel_maximumQuantity), v13, v14))
  {
    v15 = objc_msgSend((id)objc_opt_self(), sel_degreeCelsiusUnit);
    objc_msgSend(v14, sel_doubleValueForUnit_, v15);
    v17 = v16;

    v18 = v17;
    if ((v11 & 1) == 0)
    {
      if (v17 <= v7)
        v20 = v17;
      else
        v20 = v7;
      if (v17 <= v7)
        v18 = v7;
      v19 = 1;
      v7 = v20;
      goto LABEL_22;
    }
    v19 = 0;
  }
  else
  {
    v18 = 0.0;
    if ((v11 & 1) == 0)
    {
      v19 = 0;
      goto LABEL_22;
    }
    v19 = 2;
  }
  v7 = v18;
  v18 = 0.0;
LABEL_22:
  *(double *)a2 = v7;
  *(double *)(a2 + 8) = v18;
  *(_BYTE *)(a2 + 16) = v19;
}

void sub_23A379D14(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_23A379D20()
{
  unint64_t result;

  result = qword_25696F210;
  if (!qword_25696F210)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DiveMetricError, &type metadata for DiveMetricError);
    atomic_store(result, (unint64_t *)&qword_25696F210);
  }
  return result;
}

uint64_t sub_23A379D64(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_23A379DA0()
{
  unint64_t result;

  result = qword_25696F228;
  if (!qword_25696F228)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DiveMetricError, &type metadata for DiveMetricError);
    atomic_store(result, (unint64_t *)&qword_25696F228);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DiveMetricError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for DiveMetricError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A379E7C + 4 * byte_23A3A8C60[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A379E9C + 4 * byte_23A3A8C65[v4]))();
}

_BYTE *sub_23A379E7C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A379E9C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A379EA4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A379EAC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A379EB4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A379EBC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23A379EC8()
{
  return 0;
}

ValueMetadata *type metadata accessor for DiveMetricError()
{
  return &type metadata for DiveMetricError;
}

ValueMetadata *type metadata accessor for DepthMetricUtilities()
{
  return &type metadata for DepthMetricUtilities;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_23A37A334(a1, &qword_25696F230);
}

void sub_23A379F08(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23A379F10@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_23A379F24(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_23A379F54(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23A379F68(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_23A379F80(uint64_t a1, uint64_t a2)
{
  return sub_23A37A1AC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_23A379F8C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_23A3A82C4();
  *a2 = 0;
  return result;
}

uint64_t sub_23A37A000(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_23A3A82D0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23A37A07C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_23A3A82DC();
  v2 = sub_23A3A82AC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_QWORD *sub_23A37A0BC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23A37A0C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23A3A82AC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23A37A10C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23A3A82DC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A37A134()
{
  sub_23A37A3C0(&qword_25696F258, (uint64_t)&unk_23A3A8E70);
  sub_23A37A3C0((unint64_t *)&unk_25696F260, (uint64_t)&unk_23A3A8E10);
  return sub_23A3A85AC();
}

uint64_t sub_23A37A1A0(uint64_t a1, uint64_t a2)
{
  return sub_23A37A1AC(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_23A37A1AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23A3A82DC();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23A37A1E8()
{
  sub_23A3A82DC();
  sub_23A3A830C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A37A228()
{
  uint64_t v0;

  sub_23A3A82DC();
  sub_23A3A86E4();
  sub_23A3A830C();
  v0 = sub_23A3A86FC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A37A298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_23A3A82DC();
  v2 = v1;
  if (v0 == sub_23A3A82DC() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_23A3A8690();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for Name(uint64_t a1)
{
  sub_23A37A334(a1, &qword_25696F238);
}

void sub_23A37A334(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_23A37A378()
{
  return sub_23A37A3C0(&qword_25696F240, (uint64_t)&unk_23A3A8DD4);
}

uint64_t sub_23A37A39C()
{
  return sub_23A37A3C0(&qword_25696F248, (uint64_t)&unk_23A3A8DA8);
}

uint64_t sub_23A37A3C0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Name(255);
    result = MEMORY[0x23B84AD3C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A37A400()
{
  return sub_23A37A3C0(&qword_25696F250, (uint64_t)&unk_23A3A8E44);
}

uint64_t sub_23A37A43C(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aZero_2[8 * a1] == *(_QWORD *)&aZero_2[8 * a2]
    && *(_QWORD *)&aTentativcomple[8 * a1 + 16] == *(_QWORD *)&aTentativcomple[8 * a2 + 16])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_23A3A8690();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23A37A4C0(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23A37A50C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23A37A5A8 + 4 * byte_23A3A8F0E[a2]))(0x6E776F6E6B6E75);
}

uint64_t sub_23A37A5A8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6E776F6E6B6E75 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_23A3A8690();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

unint64_t static PrivateMetadata.numberOfDescentsKey.getter()
{
  return 0xD000000000000025;
}

unint64_t static PrivateMetadata.underwaterTimeKey.getter()
{
  return 0xD000000000000023;
}

unint64_t static PrivateMetadata.maxDepthKey.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t static PrivateMetadata.maxDepthCategoryKey.getter()
{
  return 0xD000000000000025;
}

unint64_t static PrivateMetadata.minTempKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.maxTempKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.diveIDStringKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.currentDepthKey.getter()
{
  return 0xD000000000000021;
}

unint64_t static PrivateMetadata.currentDepthCategoryKey.getter()
{
  return 0xD000000000000029;
}

unint64_t static PrivateMetadata.underwaterTimeCategoryKey.getter()
{
  return 0xD00000000000002BLL;
}

unint64_t static PrivateMetadata.underwaterTimeStartDateKey.getter()
{
  return 0xD000000000000029;
}

unint64_t static PrivateMetadata.underwaterTimeEndDateKey.getter()
{
  return 0xD000000000000027;
}

uint64_t UnderwaterTime.Category.stringValue.getter()
{
  char *v0;

  return *(_QWORD *)&aZero_2[8 * *v0];
}

uint64_t UnderwaterTime.Category.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aZero_2[8 * *v0];
}

uint64_t static UnderwaterTime.Category.fromString(_:)@<X0>(char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  return UnderwaterTime.Category.init(rawValue:)(a1);
}

uint64_t UnderwaterTime.Category.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23A3A85B8();
  result = swift_bridgeObjectRelease();
  v4 = 4;
  if (v2 < 4)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t sub_23A37A8C4(char *a1, char *a2)
{
  return sub_23A37A43C(*a1, *a2);
}

uint64_t sub_23A37A8D0()
{
  return sub_23A37A8D8();
}

uint64_t sub_23A37A8D8()
{
  sub_23A3A86E4();
  sub_23A3A830C();
  swift_bridgeObjectRelease();
  return sub_23A3A86FC();
}

void sub_23A37A940(char a1)
{
  sub_23A3A86E4();
  __asm { BR              X10 }
}

uint64_t sub_23A37A998()
{
  sub_23A3A830C();
  swift_bridgeObjectRelease();
  return sub_23A3A86FC();
}

uint64_t sub_23A37AA48()
{
  return sub_23A37AA50();
}

uint64_t sub_23A37AA50()
{
  sub_23A3A830C();
  return swift_bridgeObjectRelease();
}

void sub_23A37AA90(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23A37AAD4()
{
  sub_23A3A830C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A37AB68()
{
  return sub_23A37AC74();
}

void sub_23A37AB70(uint64_t a1, char a2)
{
  sub_23A3A86E4();
  __asm { BR              X10 }
}

uint64_t sub_23A37ABC4()
{
  sub_23A3A830C();
  swift_bridgeObjectRelease();
  return sub_23A3A86FC();
}

uint64_t sub_23A37AC74()
{
  sub_23A3A86E4();
  sub_23A3A830C();
  swift_bridgeObjectRelease();
  return sub_23A3A86FC();
}

uint64_t sub_23A37ACD8@<X0>(char *a1@<X8>)
{
  return UnderwaterTime.Category.init(rawValue:)(a1);
}

uint64_t sub_23A37ACE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = UnderwaterTime.Category.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void UnderwaterTime.category.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;

  type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8]();
  sub_23A37AE34(v0, (uint64_t)&v3 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v2 = (char *)sub_23A37AD8C + 4 * byte_23A3A8F26[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A37AD8C()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;

  *v1 = 1;
  v2 = sub_23A3A809C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0, v2);
}

uint64_t sub_23A37AE34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84AD24]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void UnderwaterTime.asComplicationMetadata.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v9[4];

  sub_23A3A809C();
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9[1] = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v9[2] = (char *)v9 - v4;
  MEMORY[0x24BDAC7A8](v3);
  v5 = type metadata accessor for UnderwaterTime();
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  sub_23A37AE34(v0, (uint64_t)v9 - v7);
  v8 = (char *)sub_23A37AFE8 + 4 * byte_23A3A8F2A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A37AFE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  int EnumCaseMultiPayload;

  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  v6 = sub_23A3A82AC();
  swift_bridgeObjectRelease();
  v7 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 - 88) = v7;
  sub_23A37CFE0(v6, 0xD00000000000002BLL, 0x800000023A3ACF60, isUniquelyReferenced_nonNull_native, (_QWORD *)(v5 - 88));
  swift_bridgeObjectRelease();
  sub_23A37AE34(v2, v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  return ((uint64_t (*)())((char *)sub_23A37B11C + 4 * byte_23A3A8F2E[EnumCaseMultiPayload]))();
}

uint64_t sub_23A37B11C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v6 = v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32);
  v7(v2, v3, v0);
  v8 = *(_QWORD *)(v5 - 96);
  v7(v8, v6, v0);
  v9 = sub_23A3A8060();
  v10 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v10(v2, v0);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 - 88) = v4;
  sub_23A37CFE0(v9, 0xD000000000000029, 0x800000023A3ACF90, isUniquelyReferenced_nonNull_native, (_QWORD *)(v5 - 88));
  v12 = *(_QWORD *)(v5 - 88);
  swift_bridgeObjectRelease();
  v13 = sub_23A3A8060();
  v10(v8, v0);
  v14 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 - 88) = v12;
  sub_23A37CFE0(v13, 0xD000000000000027, 0x800000023A3ACFC0, v14, (_QWORD *)(v5 - 88));
  v15 = *(_QWORD *)(v5 - 88);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_23A37B2A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  uint64_t v23;
  char *v24;
  char v25[8];

  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  v8 = MEMORY[0x24BDAC7A8](v23);
  v22[4] = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v24 = (char *)v22 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3C8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (unsigned __int8 *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v22[5] = a1;
  UnderwaterTime.Category.init(rawValue:)(v25);
  v17 = v25[0];
  if (v25[0] != 4)
  {
    v22[3] = a4;
    v20 = (uint64_t)&v16[*(int *)(v14 + 48)];
    v21 = (uint64_t)&v16[*(int *)(v14 + 64)];
    *v16 = v25[0];
    sub_23A37D528(a2, v20);
    v22[2] = v21;
    sub_23A37D528(a3, v21);
    __asm { BR              X9 }
  }
  v18 = type metadata accessor for UnderwaterTime();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a4, 1, 1, v18);
}

uint64_t sub_23A37B480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for UnderwaterTime();
  v3 = *(_QWORD *)(v1 - 136);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v3, 0, 1, v2);
  sub_23A37D570(*(_QWORD *)(v1 - 144), &qword_25696F2D8);
  return sub_23A37D570(v0, &qword_25696F2D8);
}

uint64_t static UnderwaterTime.underwaterTime(fromComplicationMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = 0x63676E697373696DLL;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v24 - v9;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_8;
  v11 = sub_23A37CD84(0xD00000000000002BLL, 0x800000023A3ACF60);
  if ((v12 & 1) != 0)
  {
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3A0);
    if (swift_dynamicCast())
      v4 = v25;
  }
  if (*(_QWORD *)(a1 + 16) && (v13 = sub_23A37CD84(0xD000000000000029, 0x800000023A3ACF90), (v14 & 1) != 0))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v13);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3A0);
    v15 = sub_23A3A809C();
    v16 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, v16 ^ 1u, 1, v15);
  }
  else
  {
LABEL_8:
    v17 = sub_23A3A809C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v10, 1, 1, v17);
  }
  if (*(_QWORD *)(a1 + 16) && (v18 = sub_23A37CD84(0xD000000000000027, 0x800000023A3ACFC0), (v19 & 1) != 0))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v18);
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3A0);
    v20 = sub_23A3A809C();
    v21 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v8, v21 ^ 1u, 1, v20);
  }
  else
  {
    v22 = sub_23A3A809C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 1, 1, v22);
  }
  sub_23A37B2A8(v4, (uint64_t)v10, (uint64_t)v8, a2);
  swift_bridgeObjectRelease();
  sub_23A37D570((uint64_t)v8, &qword_25696F2D8);
  return sub_23A37D570((uint64_t)v10, &qword_25696F2D8);
}

uint64_t WaterDepth.Category.stringValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A37BCAC + 4 * byte_23A3A8F36[*v0]))(0xD000000000000011, 0x800000023A3ACD80);
}

uint64_t sub_23A37BCAC()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_23A37BCC4()
{
  return 0x656D627553746F6ELL;
}

uint64_t sub_23A37BCE4()
{
  return 0x776F6C6C616873;
}

uint64_t sub_23A37BCFC()
{
  return 0x6C616E696D6F6ELL;
}

uint64_t sub_23A37BD14(uint64_t a1)
{
  return a1 + 3;
}

uint64_t WaterDepth.Category.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A37BD60 + 4 * byte_23A3A8F3C[*v0]))(0xD000000000000011, 0x800000023A3ACD80);
}

uint64_t sub_23A37BD60()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_23A37BD78()
{
  return 0x656D627553746F6ELL;
}

uint64_t sub_23A37BD98()
{
  return 0x776F6C6C616873;
}

uint64_t sub_23A37BDB0()
{
  return 0x6C616E696D6F6ELL;
}

uint64_t sub_23A37BDC8(uint64_t a1)
{
  return a1 + 3;
}

uint64_t static WaterDepth.Category.fromString(_:)@<X0>(char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  return WaterDepth.Category.init(rawValue:)(a1);
}

uint64_t WaterDepth.Category.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_23A3A85B8();
  result = swift_bridgeObjectRelease();
  v4 = 6;
  if (v2 < 6)
    v4 = v2;
  *a1 = v4;
  return result;
}

void sub_23A37BE78(char *a1)
{
  sub_23A37A4C0(*a1);
}

void sub_23A37BE84()
{
  char *v0;

  sub_23A37A940(*v0);
}

void sub_23A37BE8C(uint64_t a1)
{
  char *v1;

  sub_23A37AA90(a1, *v1);
}

void sub_23A37BE94(uint64_t a1)
{
  char *v1;

  sub_23A37AB70(a1, *v1);
}

uint64_t sub_23A37BE9C@<X0>(char *a1@<X8>)
{
  return WaterDepth.Category.init(rawValue:)(a1);
}

uint64_t sub_23A37BEA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = WaterDepth.Category.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t WaterDepth.category.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)sub_23A37BEEC + 4 * byte_23A3A8F42[*(unsigned __int8 *)(v0 + 8)]))();
}

void sub_23A37BEEC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void sub_23A37BEF8(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void sub_23A37BF04(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = 0x50100u >> (8 * *v1);
}

void static WaterDepth.depth(fromDepthValue:categoryString:)()
{
  char v0[24];

  swift_bridgeObjectRetain();
  WaterDepth.Category.init(rawValue:)(v0);
  __asm { BR              X11 }
}

void sub_23A37BF8C(char a1@<W8>)
{
  uint64_t v1;

  *(_QWORD *)v1 = 1;
  *(_BYTE *)(v1 + 8) = a1;
}

uint64_t static WaterDepth.maxDepth(fromMetadata:)(uint64_t a1)
{
  return static WaterDepth.depth(fromMetadata:valueKey:categoryKey:)(a1, 0xD00000000000001DLL, 0x800000023A3ACE20, 0xD000000000000025, 0x800000023A3ACE40);
}

uint64_t static WaterDepth.depth(fromMetadata:valueKey:categoryKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v10;
  char v11;

  if (*(_QWORD *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    sub_23A37CD84(a2, a3);
    if ((v10 & 1) != 0)
    {
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3A0);
      swift_dynamicCast();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (*(_QWORD *)(a1 + 16))
    {
      swift_bridgeObjectRetain();
      sub_23A37CD84(a4, a5);
      if ((v11 & 1) != 0)
      {
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3A0);
        swift_dynamicCast();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  static WaterDepth.depth(fromDepthValue:categoryString:)();
  return swift_bridgeObjectRelease();
}

uint64_t static WaterDepth.currentDepth(fromMetadata:)(uint64_t a1)
{
  return static WaterDepth.depth(fromMetadata:valueKey:categoryKey:)(a1, 0xD000000000000021, 0x800000023A3ACF00, 0xD000000000000029, 0x800000023A3ACF30);
}

unint64_t WaterDepth.asMaxDepthMetadata.getter()
{
  return sub_23A37C628(0xD00000000000001DLL, 0x800000023A3ACE20, 0xD000000000000025, 0x800000023A3ACE40);
}

unint64_t sub_23A37C3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  double v9;
  unsigned int v10;
  unint64_t v11;
  id v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v19;

  v9 = *(double *)v4;
  v10 = *(unsigned __int8 *)(v4 + 8);
  v11 = sub_23A38456C(MEMORY[0x24BEE4AF8]);
  if (v10 < 3)
  {
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v9);
    swift_bridgeObjectRetain();
    v13 = v12;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = v11;
    sub_23A37CFE0((uint64_t)v13, a1, a2, isUniquelyReferenced_nonNull_native, &v19);
    v11 = v19;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v15 = sub_23A3A82AC();
  swift_bridgeObjectRelease();
  v16 = swift_isUniquelyReferenced_nonNull_native();
  v19 = v11;
  sub_23A37CFE0(v15, a3, a4, v16, &v19);
  v17 = v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

unint64_t WaterDepth.asCurrentDepthMetadata.getter()
{
  return sub_23A37C628(0xD000000000000021, 0x800000023A3ACF00, 0xD000000000000029, 0x800000023A3ACF30);
}

unint64_t sub_23A37C628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A37C3F4(a1, a2, a3, a4);
}

uint64_t sub_23A37C660(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23A37C670(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23A37C6A4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23A37C6C4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23A37C734(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23A3A84A4();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23A37C734(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A37C804(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A37D4E8((uint64_t)v12, *a3);
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
      sub_23A37D4E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23A37C804(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A3A84B0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A37C9BC(a5, a6);
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
  v8 = sub_23A3A851C();
  if (!v8)
  {
    sub_23A3A8564();
    __break(1u);
LABEL_17:
    result = sub_23A3A85A0();
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

uint64_t sub_23A37C9BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A37CA50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A37CC28(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A37CC28(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A37CA50(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A37CBC4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A3A84E0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A3A8564();
      __break(1u);
LABEL_10:
      v2 = sub_23A3A8324();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A3A85A0();
    __break(1u);
LABEL_14:
    result = sub_23A3A8564();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A37CBC4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A37CC28(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F3C0);
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
  result = sub_23A3A85A0();
  __break(1u);
  return result;
}

_BYTE **sub_23A37CD74(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_23A37CD84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A3A86E4();
  sub_23A3A830C();
  v4 = sub_23A3A86FC();
  return sub_23A37CE44(a1, a2, v4);
}

unint64_t sub_23A37CDE8(char a1)
{
  char v1;
  uint64_t v2;

  v1 = a1 & 1;
  sub_23A3A86E4();
  sub_23A3A86F0();
  v2 = sub_23A3A86FC();
  return sub_23A37CF24(v1, v2);
}

unint64_t sub_23A37CE44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23A3A8690() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23A3A8690() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23A37CF24(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_23A37CFE0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v10 = (_QWORD *)*a5;
  v12 = sub_23A37CD84(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_23A3855B8();
LABEL_7:
    v18 = (_QWORD *)*a5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23A384CD4(v15, a4 & 1);
  v21 = sub_23A37CD84(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*a5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A3A869C();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23A37D158()
{
  unint64_t result;

  result = qword_25696F3B0;
  if (!qword_25696F3B0)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for UnderwaterTime.Category, &type metadata for UnderwaterTime.Category);
    atomic_store(result, (unint64_t *)&qword_25696F3B0);
  }
  return result;
}

unint64_t sub_23A37D1A0()
{
  unint64_t result;

  result = qword_25696F3B8;
  if (!qword_25696F3B8)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for WaterDepth.Category, &type metadata for WaterDepth.Category);
    atomic_store(result, (unint64_t *)&qword_25696F3B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivateMetadata()
{
  return &type metadata for PrivateMetadata;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s8CategoryOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s8CategoryOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A37D2DC + 4 * byte_23A3A8F52[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A37D310 + 4 * byte_23A3A8F4D[v4]))();
}

uint64_t sub_23A37D310(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A37D318(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A37D320);
  return result;
}

uint64_t sub_23A37D32C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A37D334);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A37D338(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A37D340(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnderwaterTime.Category()
{
  return &type metadata for UnderwaterTime.Category;
}

uint64_t _s8CategoryOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s8CategoryOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A37D438 + 4 * byte_23A3A8F5C[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23A37D46C + 4 * byte_23A3A8F57[v4]))();
}

uint64_t sub_23A37D46C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A37D474(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A37D47CLL);
  return result;
}

uint64_t sub_23A37D488(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A37D490);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23A37D494(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A37D49C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A37D4A8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A37D4B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WaterDepth.Category()
{
  return &type metadata for WaterDepth.Category;
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

uint64_t sub_23A37D4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A37D528(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A37D570(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_23A37D5B4()
{
  id *v0;

  return objc_msgSend(*v0, sel_invalidate);
}

uint64_t dispatch thunk of SurfaceTimer.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t DepthFormattedStringPair.formattedString.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DepthFormattedStringPair.valueString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DepthFormattedStringPair.unitString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A37D650@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t);
  _BYTE v19[24];

  v3 = sub_23A3A7FC4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v19[-v8];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F468);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = &v19[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v19[-v14];
  v16 = v1 + OBJC_IVAR___DKDepthFormatter____lazy_storage___decimalDigitsAndPunctuationSet;
  swift_beginAccess();
  sub_23A37F898(v16, (uint64_t)v15);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v4 + 32))(a1, v15, v3);
  sub_23A37F8E0((uint64_t)v15);
  sub_23A3A7F94();
  sub_23A3A7FA0();
  sub_23A3A7FAC();
  v17 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v17(v7, v3);
  v17(v9, v3);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v13, a1, v3);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
  swift_beginAccess();
  sub_23A37F920((uint64_t)v13, v16);
  return swift_endAccess();
}

id DepthFormatter.__allocating_init(configuration:)(__int128 *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DepthFormatter.init(configuration:)(a1);
}

void sub_23A37D864(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23A37D890@<X0>(char a1@<W1>, char a2@<W2>, char a3@<W3>, double a4@<X8>)
{
  double v5;

  v5 = a4;
  return sub_23A37D8E0(&v5, a1 & 1, a2 & 1, a3 & 1);
}

uint64_t sub_23A37D8E0(double *a1, char a2, char a3, char a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  double v16;
  char **v17;
  id v18;
  uint64_t *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  uint64_t *v31;
  id v32;
  void *v33;
  char *v35;
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
  unint64_t v46;

  v42 = sub_23A3A7FC4();
  v9 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F448);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v4 + OBJC_IVAR___DKDepthFormatter_configuration + 138) & 1) != 0)
  {
    v16 = 1.0;
    if ((a2 & 1) != 0)
    {
      v17 = &selRef_meters;
      goto LABEL_6;
    }
LABEL_24:
    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *a1 * v16);
    v31 = &OBJC_IVAR___DKDepthFormatter_depthNumberFormatter;
    if ((a4 & 1) == 0)
      v31 = &OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter;
    v20 = *(id *)(v4 + *v31);
    v32 = objc_msgSend(v20, sel_stringFromNumber_, v30);
    if (v32)
    {
      v33 = v32;
      v22 = sub_23A3A82DC();

      return v22;
    }
    v22 = sub_23A380E80();

LABEL_31:
    return v22;
  }
  v16 = 3.2808399;
  if ((a2 & 1) == 0)
    goto LABEL_24;
  v17 = &selRef_feet;
LABEL_6:
  v18 = objc_msgSend((id)objc_opt_self(), *v17);
  sub_23A379D64(0, &qword_25696F450);
  sub_23A3A7F7C();
  v19 = &OBJC_IVAR___DKDepthFormatter_depthMeasurementFormatter;
  if ((a4 & 1) == 0)
    v19 = &OBJC_IVAR___DKDepthFormatter_depthIntegerMeasurementFormatter;
  v20 = *(id *)(v4 + *v19);
  v22 = sub_23A3A8468();
  v23 = v21;
  if ((a3 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_31;
  }
  v35 = v15;
  v36 = v13;
  v37 = v12;
  v45 = 0;
  v46 = 0xE000000000000000;
  v40 = v22 & 0xFFFFFFFFFFFFLL;
  v41 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) != 0)
    v24 = HIBYTE(v21) & 0xF;
  else
    v24 = v22 & 0xFFFFFFFFFFFFLL;
  if (v24)
  {
    v25 = 0;
    v38 = (v21 & 0xFFFFFFFFFFFFFFFLL) + 32;
    v39 = v21 & 0xFFFFFFFFFFFFFFLL;
    v26 = v20;
    do
    {
      if ((v23 & 0x1000000000000000) != 0)
      {
        sub_23A3A84C8();
      }
      else
      {
        if ((v23 & 0x2000000000000000) != 0)
        {
          v43 = v22;
          v44 = v39;
        }
        else if ((v22 & 0x1000000000000000) == 0)
        {
          sub_23A3A851C();
        }
        sub_23A3A8528();
      }
      v28 = v27;
      sub_23A3A7F88();
      v29 = sub_23A3A7FB8();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v42);
      if ((v29 & 1) == 0)
        sub_23A3A8300();
      v25 += v28;
      v20 = v26;
    }
    while (v25 < v24);
  }

  swift_bridgeObjectRelease();
  v22 = v45;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
  return v22;
}

uint64_t sub_23A37DC68(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  double v7;
  uint64_t *v8;
  uint64_t *v9;
  double v10;

  v2 = *(unsigned __int8 *)(result + 8);
  if (v2 < 2)
  {
    v3 = *(void **)(v1 + OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter);
    v4 = (void *)sub_23A3A83D8();
    v5 = objc_msgSend(v3, sel_stringFromNumber_, v4);

    if (v5)
    {
      v6 = sub_23A3A82DC();

      return v6;
    }
    return sub_23A380E80();
  }
  if (v2 != 2 && *(_QWORD *)result < 2uLL)
    return 11565;
  v7 = 3.2808399;
  if (*(_BYTE *)(v1 + OBJC_IVAR___DKDepthFormatter_configuration + 138))
    v7 = 1.0;
  v8 = &qword_25696FD08;
  if (!*(_BYTE *)(v1 + OBJC_IVAR___DKDepthFormatter_configuration + 138))
    v8 = &qword_25696FD00;
  v9 = &qword_25696FCF0;
  if (*(_BYTE *)(v1 + OBJC_IVAR___DKDepthFormatter_configuration + 138))
    v9 = &qword_25696FCF8;
  if (*(_BYTE *)(v1 + OBJC_IVAR___DKDepthFormatter_configuration))
    v8 = v9;
  v10 = round(v7 * *(double *)v8);
  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v10 < 9.22337204e18)
    return sub_23A37DE04();
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_23A37DE04()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void **)(v0 + OBJC_IVAR___DKDepthFormatter_depthIntegerNumberFormatter);
  v2 = (void *)sub_23A3A83FC();
  v3 = objc_msgSend(v1, sel_stringFromNumber_, v2);

  if (v3)
  {
    v4 = sub_23A3A82DC();
    v6 = v5;

  }
  else
  {
    v4 = sub_23A380E80();
    v6 = v7;
  }
  sub_23A380E80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_23A3A9210;
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 64) = sub_23A37F34C();
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 40) = v6;
  v9 = sub_23A3A82E8();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_23A37DF38(char a1)
{
  if ((a1 & 1) != 0)
    sub_23A380E80();
  sub_23A3A8318();
  swift_bridgeObjectRelease();
  return 48;
}

uint64_t sub_23A37DFEC()
{
  return sub_23A380E80();
}

uint64_t sub_23A37E038()
{
  return sub_23A37E4CC();
}

uint64_t sub_23A37E070()
{
  return sub_23A37E4CC();
}

uint64_t sub_23A37E0A8()
{
  return sub_23A380E80();
}

uint64_t sub_23A37E0FC(uint64_t a1, char a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v2 = *(_BYTE *)(a1 + 8);
  v5 = *(_QWORD *)a1;
  v6 = v2;
  sub_23A37E160(&v5, a2, &v7);
  v3 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23A37E160@<X0>(uint64_t *a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = *a1;
  v7 = *((unsigned __int8 *)a1 + 8);
  sub_23A380E80();
  if (v7 >= 2)
  {
    if (v7 != 2)
    {
      if (!v6)
      {
        result = swift_bridgeObjectRelease();
        v13 = 11565;
        v14 = 0xE200000000000000;
        goto LABEL_12;
      }
      if (v6 == 1)
      {
        result = swift_bridgeObjectRelease();
        v13 = 48;
        v14 = 0xE100000000000000;
LABEL_12:
        *a3 = v13;
        a3[1] = v14;
        a3[2] = v13;
        a3[3] = v14;
        a3[4] = 0;
        a3[5] = 0;
        return result;
      }
    }
    if ((a2 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      v20 = sub_23A37E404();
      v22 = v21;
      result = sub_23A37E404();
      *a3 = v20;
      a3[1] = v22;
      a3[2] = result;
      a3[3] = v23;
      a3[4] = 0;
      a3[5] = 0;
      return result;
    }
    v15 = (unsigned __int8 *)(v3 + OBJC_IVAR___DKDepthFormatter_configuration);
    if ((*(_BYTE *)(v3 + OBJC_IVAR___DKDepthFormatter_configuration + 138) & 1) != 0)
    {
      v8 = sub_23A380E80();
      v10 = v16;
      v17 = *v15;
      v18 = &qword_25696FD08;
      v19 = &qword_25696FCF8;
    }
    else
    {
      v8 = sub_23A380E80();
      v10 = v24;
      v17 = *v15;
      v18 = &qword_25696FD00;
      v19 = &qword_25696FCF0;
    }
    if (v17)
      v25 = v19;
    else
      v25 = v18;
    v35 = *v25;
    v11 = 0;
    goto LABEL_18;
  }
  v8 = sub_23A380E80();
  v10 = v9;
  v35 = v6;
  v11 = 1;
LABEL_18:
  v26 = sub_23A37D8E0((double *)&v35, 0, 0, v11);
  v28 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_23A3A9220;
  v30 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v29 + 56) = MEMORY[0x24BEE0D00];
  v31 = sub_23A37F34C();
  *(_QWORD *)(v29 + 32) = v26;
  *(_QWORD *)(v29 + 40) = v28;
  *(_QWORD *)(v29 + 96) = v30;
  *(_QWORD *)(v29 + 104) = v31;
  *(_QWORD *)(v29 + 64) = v31;
  *(_QWORD *)(v29 + 72) = v8;
  *(_QWORD *)(v29 + 80) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v32 = sub_23A3A82E8();
  v34 = v33;
  result = swift_bridgeObjectRelease();
  *a3 = v32;
  a3[1] = v34;
  a3[2] = v26;
  a3[3] = v28;
  a3[4] = v8;
  a3[5] = v10;
  return result;
}

uint64_t sub_23A37E404()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + OBJC_IVAR___DKDepthFormatter_configuration) & 1) != 0)
    return sub_23A380E80();
  else
    return sub_23A380E9C();
}

uint64_t sub_23A37E494()
{
  return sub_23A37E4CC();
}

uint64_t sub_23A37E4CC()
{
  return sub_23A380E80();
}

uint64_t sub_23A37E4F0(double a1)
{
  uint64_t v1;
  uint64_t *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v3 = &OBJC_IVAR___DKDepthFormatter_shortUnderwaterTimeFormatter;
  if (a1 >= 3600.0)
    v3 = &OBJC_IVAR___DKDepthFormatter_longUnderwaterTimeFormatter;
  v4 = *(id *)(v1 + *v3);
  v5 = objc_msgSend(v4, sel_stringFromTimeInterval_, a1);
  if (v5)
  {
    v6 = v5;
    v7 = sub_23A3A82DC();

    v4 = v6;
  }
  else
  {
    v7 = sub_23A380E80();
  }

  return v7;
}

uint64_t sub_23A37E5BC()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___DKDepthFormatter_diveHistoryDiveDurationFormatter), sel_stringFromTimeInterval_);
  if (!v1)
    return sub_23A380E80();
  v2 = v1;
  v3 = sub_23A3A82DC();

  return v3;
}

uint64_t sub_23A37E648(double a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  if (a1 >= 60.0)
  {
    v2 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___DKDepthFormatter_shortUnderwaterTimeFormatter), sel_stringFromTimeInterval_);
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___DKDepthFormatter_secondsOnlyShortUnderwaterTimeFormatter), sel_stringFromTimeInterval_);
    if (v2)
    {
LABEL_3:
      v3 = v2;
      v4 = sub_23A3A82DC();

      return v4;
    }
  }
  return sub_23A380E80();
}

uint64_t sub_23A37E700()
{
  uint64_t v0;

  sub_23A3A8318();
  swift_bridgeObjectRelease();
  v0 = sub_23A380E80();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A37E7AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23A380E80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
  v2 = swift_allocObject();
  v3 = MEMORY[0x24BEE1768];
  *(_OWORD *)(v2 + 16) = xmmword_23A3A9210;
  v4 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v2 + 56) = v3;
  *(_QWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 32) = a1;
  v5 = sub_23A3A82E8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_23A37E858(uint64_t *a1, char a2, char a3)
{
  uint64_t v4;

  if ((a1[1] & 1) != 0)
    return 11565;
  v4 = *a1;
  return sub_23A37E89C((uint64_t)&v4, a2 & 1, a3 & 1);
}

uint64_t sub_23A37E89C(uint64_t a1, uint64_t a2, char a3)
{
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char **v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F470);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3[OBJC_IVAR___DKDepthFormatter_configuration + 139] == 1)
    v9 = &selRef_fahrenheit;
  else
    v9 = &selRef_celsius;
  v10 = objc_msgSend((id)objc_opt_self(), *v9);
  sub_23A379D64(0, &qword_25696F478);
  sub_23A3A7F7C();
  v11 = sub_23A3A8468();
  v19 = v11;
  v20 = v12;
  if ((a3 & 1) == 0)
  {
    v17 = v11;
    v18 = v12;
    v13 = v3;
    sub_23A37F968(&v17, (uint64_t)v13);

    v19 = v17;
    v20 = v18;
  }
  swift_bridgeObjectRetain();
  v14 = sub_23A3A8330();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
  {
    v17 = 45;
    v18 = 0xE100000000000000;
    sub_23A37FB1C();
    sub_23A3A8408();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v19;
}

uint64_t sub_23A37EAA0(uint64_t a1, char a2)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v15;

  v3 = *(double *)a1;
  if (*(_BYTE *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 16) != 1)
      return 11565;
    v4 = *(double *)(a1 + 8);
    if (vabdd_f64(v3, v4) >= 1.0)
    {
      sub_23A380E80();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_23A3A9220;
      v15 = v3;
      v7 = sub_23A37E89C((uint64_t)&v15, 0, 0);
      v9 = v8;
      v10 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
      v11 = sub_23A37F34C();
      *(_QWORD *)(v6 + 64) = v11;
      *(_QWORD *)(v6 + 32) = v7;
      *(_QWORD *)(v6 + 40) = v9;
      v15 = v4;
      v12 = sub_23A37E89C((uint64_t)&v15, 0, a2 & 1);
      *(_QWORD *)(v6 + 96) = v10;
      *(_QWORD *)(v6 + 104) = v11;
      *(_QWORD *)(v6 + 72) = v12;
      *(_QWORD *)(v6 + 80) = v13;
      v5 = sub_23A3A82B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5;
    }
    v15 = (v4 + v3) * 0.5;
  }
  else
  {
    v15 = *(double *)a1;
  }
  return sub_23A37E89C((uint64_t)&v15, 0, a2 & 1);
}

uint64_t sub_23A37EC2C(__int128 *a1)
{
  char v1;
  uint64_t v2;
  __int128 v4;
  char v5;

  v1 = *((_BYTE *)a1 + 16);
  v4 = *a1;
  v5 = v1;
  v2 = sub_23A37EAA0((uint64_t)&v4, 0);
  sub_23A380E80();
  return v2;
}

uint64_t sub_23A37ECDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (*v16)(char *, uint64_t);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];

  v1 = v0;
  v2 = sub_23A3A809C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A3A8000();
  if (v6 >= 60.0)
  {
    v11 = sub_23A380E80();
    v30[0] = v12;
    v30[1] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_23A3A9220;
    v14 = *(void **)(v0 + OBJC_IVAR___DKDepthFormatter_startDateFormatter);
    sub_23A3A7FF4();
    v15 = (void *)sub_23A3A8060();
    v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v5, v2);
    v17 = objc_msgSend(v14, sel_stringFromDate_, v15);

    v18 = sub_23A3A82DC();
    v20 = v19;

    v21 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
    v22 = sub_23A37F34C();
    *(_QWORD *)(v13 + 64) = v22;
    *(_QWORD *)(v13 + 32) = v18;
    *(_QWORD *)(v13 + 40) = v20;
    v23 = *(void **)(v1 + OBJC_IVAR___DKDepthFormatter_endDateFormatter);
    sub_23A3A7FDC();
    v24 = (void *)sub_23A3A8060();
    v16(v5, v2);
    v25 = objc_msgSend(v23, sel_stringFromDate_, v24);

    v26 = sub_23A3A82DC();
    v28 = v27;

    *(_QWORD *)(v13 + 96) = v21;
    *(_QWORD *)(v13 + 104) = v22;
    *(_QWORD *)(v13 + 72) = v26;
    *(_QWORD *)(v13 + 80) = v28;
    v10 = sub_23A3A82B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(void **)(v0 + OBJC_IVAR___DKDepthFormatter_startDateFormatter);
    sub_23A3A7FF4();
    v8 = (void *)sub_23A3A8060();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v9 = objc_msgSend(v7, sel_stringFromDate_, v8);

    v10 = sub_23A3A82DC();
  }
  return v10;
}

uint64_t sub_23A37EF58(uint64_t a1)
{
  return sub_23A37EF70(a1, &OBJC_IVAR___DKDepthFormatter_startDateFormatter);
}

uint64_t sub_23A37EF64(uint64_t a1)
{
  return sub_23A37EF70(a1, &OBJC_IVAR___DKDepthFormatter_voiceoverDateFormatter);
}

uint64_t sub_23A37EF70(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = *(void **)(v2 + *a2);
  v4 = (void *)sub_23A3A8060();
  v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  v6 = sub_23A3A82DC();
  return v6;
}

uint64_t sub_23A37EFE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if (*(unsigned __int8 *)(a1 + 4) >= 2u)
    return 11565;
  sub_23A380E80();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_23A3A9210;
  v3 = *(void **)(v1 + OBJC_IVAR___DKDepthFormatter_batteryLevelFormatter);
  v4 = (void *)sub_23A3A83F0();
  v5 = objc_msgSend(v3, sel_stringFromNumber_, v4);

  if (v5)
  {
    v6 = sub_23A3A82DC();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 64) = sub_23A37F34C();
  v10 = 11565;
  if (v8)
    v10 = v6;
  v11 = 0xE200000000000000;
  if (v8)
    v11 = v8;
  *(_QWORD *)(v2 + 32) = v10;
  *(_QWORD *)(v2 + 40) = v11;
  v9 = sub_23A3A82B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id DepthFormatter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DepthFormatter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DepthFormatter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthFormatter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_23A37F34C()
{
  unint64_t result;

  result = qword_25696F460;
  if (!qword_25696F460)
  {
    result = MEMORY[0x23B84AD3C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25696F460);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DepthFormattedStringPair(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DepthFormattedStringPair()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for DepthFormattedStringPair(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DepthFormattedStringPair(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for DepthFormattedStringPair(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthFormattedStringPair(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthFormattedStringPair(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthFormattedStringPair()
{
  return &type metadata for DepthFormattedStringPair;
}

uint64_t sub_23A37F5DC()
{
  return type metadata accessor for DepthFormatter();
}

uint64_t method lookup function for DepthFormatter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DepthFormatter.__allocating_init(configuration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of DepthFormatter.formatDepth(_:withUnits:strippingWhitespace:allowFractional:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of DepthFormatter.formatDepthValueForComplicationsOnly(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of DepthFormatter.formatNotSubmerged(withUnits:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of DepthFormatter.depthUnitString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of DepthFormatter.complicationMaxDepthUnitString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of DepthFormatter.depthUnitPlusString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of DepthFormatter.temperatureUnitWithDegreeSignString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of DepthFormatter.formatMaxDepth(_:compact:includeSpace:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of DepthFormatter.pairedFormatMaxDepth(_:compact:includeSpace:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of DepthFormatter.beyondMaxDepthString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of DepthFormatter.submergeToContinueString.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of DepthFormatter.formatUnderwaterTime(withTimeInterval:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of DepthFormatter.formatDiveHistoryDiveDuration(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of DepthFormatter.formatComplicationDiveDuration(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of DepthFormatter.complicationDurationUnitString(forDuration:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of DepthFormatter.complicationFormatNumberOfDives(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of DepthFormatter.formatTemperature(_:withUnits:withDegreeSymbol:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of DepthFormatter.formatTemperatureRange(_:withDegreeSymbol:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of DepthFormatter.formatTemperatureRangeAndUnit(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of DepthFormatter.formatUnderwaterDateInterval(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of DepthFormatter.formatDiveStartDate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of DepthFormatter.formatVoiceoverDiveStartDate(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of DepthFormatter.formatBatteryLevel(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t sub_23A37F898(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A37F8E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F468);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A37F920(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F468);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A37F968(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v28 = a2;
  v23 = sub_23A3A7FC4();
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v6 = a1[1];
  v18 = a1;
  v26 = 0;
  v27 = 0xE000000000000000;
  v21 = v7 & 0xFFFFFFFFFFFFLL;
  v22 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) != 0)
    v8 = HIBYTE(v6) & 0xF;
  else
    v8 = v7 & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    v19 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    v20 = v6 & 0xFFFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    for (i = 0; i < v8; i += v11)
    {
      if ((v6 & 0x1000000000000000) != 0)
      {
        sub_23A3A84C8();
      }
      else
      {
        if ((v6 & 0x2000000000000000) != 0)
        {
          v24 = v7;
          v25 = v20;
        }
        else if ((v7 & 0x1000000000000000) == 0)
        {
          sub_23A3A851C();
        }
        sub_23A3A8528();
      }
      v11 = v10;
      sub_23A37D650((uint64_t)v5);
      v12 = sub_23A3A7FB8();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v23);
      if ((v12 & 1) != 0)
        sub_23A3A8300();
    }
    v13 = v18;
    v14 = v26;
    v15 = v27;
  }
  else
  {
    swift_bridgeObjectRetain();
    v14 = 0;
    v15 = 0xE000000000000000;
    v13 = v18;
  }
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *v13 = v14;
  v13[1] = v15;
  return result;
}

unint64_t sub_23A37FB1C()
{
  unint64_t result;

  result = qword_25696F480;
  if (!qword_25696F480)
  {
    result = MEMORY[0x23B84AD3C](MEMORY[0x24BEE0D48], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25696F480);
  }
  return result;
}

void sub_23A37FB60()
{
  qword_25696F4A0 = (uint64_t)&type metadata for DepthLimits.Ultra;
  *(_QWORD *)algn_25696F4A8 = &off_250B515F8;
}

void sub_23A37FB80()
{
  qword_25696F4C8 = (uint64_t)&type metadata for DepthLimits.Sundrift;
  unk_25696F4D0 = &off_250B515D0;
}

_QWORD *sub_23A37FBA0(unsigned __int8 *a1, char a2)
{
  _QWORD *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13[2];

  v4 = *a1;
  v6 = v2[3];
  v5 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  if ((a2 & 1) != 0)
  {
    if (v4)
    {
      result = (*(_QWORD *(**)(double *__return_ptr, uint64_t, uint64_t))(v5 + 32))(v13, v6, v5);
      v8 = v13[0];
    }
    else
    {
      result = (*(_QWORD *(**)(double *__return_ptr, uint64_t, uint64_t))(v5 + 24))(v13, v6, v5);
      v8 = v13[0] * 3.2808399;
    }
    v11 = round(v8);
    if ((~*(_QWORD *)&v11 & 0x7FF0000000000000) != 0)
    {
      if (v11 > -9.22337204e18)
      {
        if (v11 < 9.22337204e18)
        {
          *(_QWORD *)&v13[0] = (uint64_t)v11;
          return (_QWORD *)sub_23A3A8684();
        }
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_15:
    __break(1u);
    return result;
  }
  (*(void (**)(double *__return_ptr, uint64_t, uint64_t))(v5 + 32))(v13, v6, v5);
  v9 = vabdd_f64(v13[0], *(double *)&qword_25696FD08);
  v13[0] = 0.0;
  v13[1] = -2.68156159e154;
  if (v9 <= 0.0001)
  {
    sub_23A3A84D4();
    swift_bridgeObjectRelease();
    strcpy((char *)v13, "CHARON_BEYOND_");
    HIBYTE(v13[1]) = -18;
    sub_23A3A8318();
    swift_bridgeObjectRelease();
    sub_23A3A8318();
    v10 = sub_23A380E9C();
  }
  else
  {
    sub_23A3A84D4();
    swift_bridgeObjectRelease();
    strcpy((char *)v13, "CHARON_BEYOND_");
    HIBYTE(v13[1]) = -18;
    sub_23A3A8318();
    swift_bridgeObjectRelease();
    v10 = sub_23A380E80();
  }
  v12 = v10;
  swift_bridgeObjectRelease();
  return (_QWORD *)v12;
}

void *sub_23A37FDD4()
{
  uint64_t inited;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F4F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A3A9240;
  *(_QWORD *)(inited + 32) = 0x312C366863746157;
  *(_QWORD *)(inited + 40) = 0xE900000000000038;
  if (qword_25696F150 != -1)
    swift_once();
  sub_23A380E40((uint64_t)&unk_25696F488, inited + 48);
  *(_QWORD *)(inited + 88) = 0x352C376863746157;
  *(_QWORD *)(inited + 96) = 0xE800000000000000;
  sub_23A380E40((uint64_t)&unk_25696F488, inited + 104);
  *(_QWORD *)(inited + 144) = 0x382C376863746157;
  *(_QWORD *)(inited + 152) = 0xE800000000000000;
  if (qword_25696F158 != -1)
    swift_once();
  sub_23A380E40((uint64_t)&unk_25696F4B0, inited + 160);
  *(_QWORD *)(inited + 200) = 0x392C376863746157;
  *(_QWORD *)(inited + 208) = 0xE800000000000000;
  sub_23A380E40((uint64_t)&unk_25696F4B0, inited + 216);
  *(_QWORD *)(inited + 256) = 0x312C376863746157;
  *(_QWORD *)(inited + 264) = 0xE900000000000030;
  sub_23A380E40((uint64_t)&unk_25696F4B0, inited + 272);
  *(_QWORD *)(inited + 312) = 0x312C376863746157;
  *(_QWORD *)(inited + 320) = 0xE900000000000031;
  sub_23A380E40((uint64_t)&unk_25696F4B0, inited + 328);
  result = (void *)sub_23A384684(inited);
  off_25696F4D8 = result;
  return result;
}

void sub_23A37FF60(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  char v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v4 = sub_23A3A8180();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v41 = 0;
    v39 = 0u;
    v40 = 0u;
    v8 = a1;
    v9 = objc_msgSend(v8, sel_hardwareVersion);
    if (v9)
    {
      v10 = v9;
      v11 = sub_23A3A82DC();
      v13 = v12;

      if (qword_25696F160 != -1)
        swift_once();
      swift_beginAccess();
      v14 = off_25696F4D8;
      if (*((_QWORD *)off_25696F4D8 + 2))
      {
        swift_bridgeObjectRetain();
        v15 = sub_23A37CD84(v11, v13);
        if ((v16 & 1) != 0)
        {
          sub_23A380E40(v14[7] + 40 * v15, (uint64_t)&v33);
        }
        else
        {
          v35 = 0;
          v33 = 0u;
          v34 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v34 + 1))
        {
          v36 = v33;
          v37 = v34;
          v38 = v35;
          swift_endAccess();

          swift_bridgeObjectRelease();
          sub_23A380ABC((uint64_t)&v39);
          v39 = v36;
          v40 = v37;
          v41 = v38;
LABEL_26:
          sub_23A380DF8((uint64_t)&v39, a2);
          return;
        }
      }
      else
      {
        v35 = 0;
        v33 = 0u;
        v34 = 0u;
      }
      sub_23A380ABC((uint64_t)&v33);
      swift_endAccess();
      swift_bridgeObjectRelease();
    }
    if (qword_25696F1C0 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v4, (uint64_t)qword_2569709A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v20, v4);
    v21 = v8;
    v22 = sub_23A3A8168();
    v23 = sub_23A3A8414();
    if (os_log_type_enabled(v22, v23))
    {
      v32 = a2;
      v24 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      *(_QWORD *)&v36 = v31;
      *(_DWORD *)v24 = 136315138;
      v25 = objc_msgSend(v21, sel_hardwareVersion);
      if (v25)
      {
        v26 = v25;
        v27 = sub_23A3A82DC();
        v29 = v28;

      }
      else
      {
        v29 = 0xE100000000000000;
        v27 = 63;
      }
      *(_QWORD *)&v33 = sub_23A37C734(v27, v29, (uint64_t *)&v36);
      sub_23A3A84A4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A377000, v22, v23, "DepthFormatter: Max depth cache miss for: %s", v24, 0xCu);
      v30 = v31;
      swift_arrayDestroy();
      MEMORY[0x23B84ADCC](v30, -1, -1);
      MEMORY[0x23B84ADCC](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      a2 = v32;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    goto LABEL_26;
  }
  if (qword_25696F1C0 != -1)
    swift_once();
  __swift_project_value_buffer(v4, (uint64_t)qword_2569709A8);
  v17 = sub_23A3A8168();
  v18 = sub_23A3A8414();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_23A377000, v17, v18, "DepthFormatter: Nil device queried", v19, 2u);
    MEMORY[0x23B84ADCC](v19, -1, -1);
  }

  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
}

void __swiftcall DepthFormatter.formatMaxDepth(workout:healthStore:)(DepthCore::DepthFormattedStringPair *__return_ptr retstr, HKWorkout workout, HKHealthStore healthStore)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  DepthCore::DepthFormattedStringPair *v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v4 = v3;
  v7 = sub_23A3A80F0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A380A38();
  v11 = (void *)MEMORY[0x23B84A6A0]((id)*MEMORY[0x24BDD3698]);
  v12 = -[objc_class statisticsForType:](workout.super.super.super.isa, sel_statisticsForType_, v11);

  if (v12 && (v13 = objc_msgSend(v12, sel_maximumQuantity), v12, v13))
  {
    v14 = -[objc_class device](workout.super.super.super.isa, sel_device);
    sub_23A37FF60(v14, (uint64_t)&v62);

    if (!*((_QWORD *)&v63 + 1))
    {
      sub_23A380ABC((uint64_t)&v62);
      goto LABEL_13;
    }
    v65 = v62;
    v66 = v63;
    v67 = v64;
    objc_msgSend(v13, sel__value);
    v16 = v15;
    v17 = *((_QWORD *)&v66 + 1);
    v18 = v67;
    __swift_project_boxed_opaque_existential_1(&v65, *((uint64_t *)&v66 + 1));
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v18 + 32))(&v62, v17, v18);
    if (*(double *)&v62 > v16)
    {
      sub_23A380B20((uint64_t)&v65);
LABEL_13:
      objc_msgSend(v13, sel__value);
      *(_QWORD *)&v65 = v31;
      v32 = sub_23A37D8E0((double *)&v65, 0, 1, 1);
      v34 = v33;
      sub_23A380E80();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
      v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_23A3A9220;
      v36 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
      v37 = sub_23A37F34C();
      *(_QWORD *)(v35 + 64) = v37;
      *(_QWORD *)(v35 + 32) = v32;
      *(_QWORD *)(v35 + 40) = v34;
      swift_bridgeObjectRetain();
      v38 = sub_23A380E80();
      *(_QWORD *)(v35 + 96) = v36;
      *(_QWORD *)(v35 + 104) = v37;
      *(_QWORD *)(v35 + 72) = v38;
      *(_QWORD *)(v35 + 80) = v39;
      v40 = sub_23A3A82E8();
      v42 = v41;
      swift_bridgeObjectRelease();
      v43 = sub_23A380E80();
      v45 = v44;

      retstr->formattedString._countAndFlagsBits = v40;
      retstr->formattedString._object = v42;
      retstr->valueString._countAndFlagsBits = v32;
      retstr->valueString._object = v34;
      retstr->unitString.value._countAndFlagsBits = v43;
      retstr->unitString.value._object = v45;
      return;
    }
    LOBYTE(v62) = *(_BYTE *)(v4 + OBJC_IVAR___DKDepthFormatter_configuration + 138);
    v46 = sub_23A37FBA0((unsigned __int8 *)&v62, 1);
    v48 = v47;
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = 0xE000000000000000;
    sub_23A3A84D4();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v62 = 0xD000000000000011;
    *((_QWORD *)&v62 + 1) = 0x800000023A3AD740;
    sub_23A3A8318();
    swift_bridgeObjectRelease();
    v49 = sub_23A380E80();
    v51 = v50;
    swift_bridgeObjectRelease();
    sub_23A380E80();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F458);
    v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_23A3A9220;
    v53 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v52 + 56) = MEMORY[0x24BEE0D00];
    v54 = sub_23A37F34C();
    *(_QWORD *)(v52 + 32) = v46;
    *(_QWORD *)(v52 + 40) = v48;
    *(_QWORD *)(v52 + 96) = v53;
    *(_QWORD *)(v52 + 104) = v54;
    *(_QWORD *)(v52 + 64) = v54;
    *(_QWORD *)(v52 + 72) = v49;
    *(_QWORD *)(v52 + 80) = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v55 = sub_23A3A82E8();
    v57 = v56;
    swift_bridgeObjectRelease();

    sub_23A380B20((uint64_t)&v65);
    retstr->formattedString._countAndFlagsBits = v55;
    retstr->formattedString._object = v57;
    retstr->valueString._countAndFlagsBits = (uint64_t)v46;
    retstr->valueString._object = v48;
    retstr->unitString.value._countAndFlagsBits = v49;
    retstr->unitString.value._object = v51;
  }
  else
  {
    if (qword_25696F1C0 != -1)
      swift_once();
    v19 = sub_23A3A8180();
    __swift_project_value_buffer(v19, (uint64_t)qword_2569709A8);
    v20 = workout.super.super.super.isa;
    v21 = sub_23A3A8168();
    v22 = sub_23A3A8414();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v59 = swift_slowAlloc();
      *(_QWORD *)&v65 = v59;
      v60 = v4;
      *(_DWORD *)v23 = 136315138;
      v58[1] = v23 + 4;
      v24 = -[objc_class UUID](v20, sel_UUID);
      sub_23A3A80CC();

      sub_23A380A74();
      v25 = sub_23A3A8684();
      v61 = retstr;
      v27 = v26;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      *(_QWORD *)&v62 = sub_23A37C734(v25, v27, (uint64_t *)&v65);
      sub_23A3A84A4();

      retstr = v61;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A377000, v21, v22, "DepthFormatter: No workout stats for dive %s", v23, 0xCu);
      v28 = v59;
      swift_arrayDestroy();
      MEMORY[0x23B84ADCC](v28, -1, -1);
      MEMORY[0x23B84ADCC](v23, -1, -1);

    }
    else
    {

    }
    v29 = sub_23A380E80();
    retstr->formattedString._countAndFlagsBits = 11565;
    retstr->formattedString._object = (void *)0xE200000000000000;
    retstr->valueString._countAndFlagsBits = 11565;
    retstr->valueString._object = (void *)0xE200000000000000;
    retstr->unitString.value._countAndFlagsBits = v29;
    retstr->unitString.value._object = v30;
  }
}

unint64_t sub_23A380A38()
{
  unint64_t result;

  result = qword_25696F220;
  if (!qword_25696F220)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25696F220);
  }
  return result;
}

unint64_t sub_23A380A74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696F4E0;
  if (!qword_25696F4E0)
  {
    v1 = sub_23A3A80F0();
    result = MEMORY[0x23B84AD3C](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_25696F4E0);
  }
  return result;
}

uint64_t sub_23A380ABC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F4E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23A380B20(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t initializeWithCopy for DeviceMaxDepth(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for DeviceMaxDepth(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DeviceMaxDepth(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceMaxDepth(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceMaxDepth(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceMaxDepth()
{
  return &type metadata for DeviceMaxDepth;
}

uint64_t sub_23A380DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F4E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A380E40(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A380E80()
{
  return sub_23A380EB8();
}

uint64_t sub_23A380E9C()
{
  return sub_23A380EB8();
}

uint64_t sub_23A380EB8()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v0 = (void *)sub_23A3A82AC();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  if (!v1)
    return 11565;
  v2 = (void *)sub_23A3A82AC();
  v3 = (void *)sub_23A3A82AC();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_23A3A82DC();
  return v5;
}

uint64_t DiveMetrics.samples(for:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v1 = *v0;
  v2 = v0[1];
  v3 = sub_23A3A82DC();
  v5 = v4;
  if (v3 == sub_23A3A82DC() && v5 == v6)
    goto LABEL_13;
  v8 = sub_23A3A8690();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    return v1;
  }
  v9 = sub_23A3A82DC();
  v11 = v10;
  if (v9 == sub_23A3A82DC() && v11 == v12)
  {
    v1 = v2;
LABEL_13:
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  v14 = sub_23A3A8690();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v2;
  if ((v14 & 1) != 0)
    goto LABEL_14;
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23A3810D8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
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

  v3 = (os_unfair_lock_s *)(v1 + 120);
  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 120));
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 48);
  v7 = *(_QWORD *)(v1 + 56);
  v8 = *(_QWORD *)(v1 + 64);
  v9 = *(_QWORD *)(v1 + 72);
  v10 = *(_QWORD *)(v1 + 80);
  v11 = *(_QWORD *)(v1 + 88);
  v12 = *(_QWORD *)(v1 + 96);
  v13 = *(_QWORD *)(v1 + 104);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  a1[3] = v7;
  a1[4] = v8;
  a1[5] = v9;
  a1[6] = v10;
  a1[7] = v11;
  a1[8] = v12;
  a1[9] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
  return swift_endAccess();
}

void sub_23A381198()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = swift_allocObject();
  swift_weakInit();
  sub_23A379D64(0, (unint64_t *)&qword_25696F220);
  v1 = (void *)*MEMORY[0x24BDD36D8];
  swift_retain();
  v2 = (id)MEMORY[0x23B84A6A0](v1);
  sub_23A381948(v2, (uint64_t)sub_23A38224C, v0);
  swift_release_n();

}

void sub_23A381248(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v6 = (_QWORD *)swift_allocObject();
    v6[2] = a3;
    v6[3] = a2;
    v6[4] = a1;
    sub_23A379D64(0, (unint64_t *)&qword_25696F220);
    v7 = (void *)*MEMORY[0x24BDD3698];
    swift_retain();
    v8 = a2;
    swift_bridgeObjectRetain();
    v9 = (void *)MEMORY[0x23B84A6A0](v7);
    sub_23A381948(v9, (uint64_t)sub_23A3826F4, (uint64_t)v6);
    swift_release();
    swift_release();

  }
}

void sub_23A38134C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  os_log_type_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;
  unint64_t v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v9 = 0x296C696E28;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v11 = Strong;
    if (a4)
    {
      swift_release();
      goto LABEL_5;
    }
    if (a2)
    {
      swift_release();
      v14 = 0xE500000000000000;
      v12 = 0x296C696E28;
      goto LABEL_10;
    }
    swift_beginAccess();
    os_unfair_lock_lock((os_unfair_lock_t)(v11 + 120));
    swift_endAccess();
    v22 = objc_msgSend(*(id *)(v11 + 24), sel_metadata);
    if (!v22)
      goto LABEL_24;
    v23 = v22;
    v24 = sub_23A3A8288();

    if (*(_QWORD *)(v24 + 16))
    {
      v25 = sub_23A37CD84(0xD000000000000028, 0x800000023A3AD8F0);
      if ((v26 & 1) != 0)
      {
        sub_23A37D4E8(*(_QWORD *)(v24 + 56) + 32 * v25, (uint64_t)&v49);
        sub_23A379D64(0, (unint64_t *)&qword_25696F698);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v27 = (void *)v51;
          if (*(_QWORD *)(v24 + 16)
            && (v28 = sub_23A37CD84(0xD000000000000026, 0x800000023A3AD920), (v29 & 1) != 0))
          {
            sub_23A37D4E8(*(_QWORD *)(v24 + 56) + 32 * v28, (uint64_t)&v49);
          }
          else
          {
            v49 = 0u;
            v50 = 0u;
          }
          swift_bridgeObjectRelease();
          if (!*((_QWORD *)&v50 + 1))
          {

            sub_23A37D570((uint64_t)&v49, &qword_25696F6A0);
            goto LABEL_24;
          }
          if ((swift_dynamicCast() & 1) == 0)
          {

            goto LABEL_24;
          }
          v31 = (void *)v51;
          v32 = objc_msgSend(*(id *)(v11 + 128), sel_stringFromNumber_, v27);
          if (!v32)
          {

            goto LABEL_24;
          }
          v33 = v32;
          v34 = sub_23A3A82DC();
          v36 = v35;

          v37 = *(id *)(v11 + 136);
          objc_msgSend(v31, sel_doubleValue);
          v38 = objc_msgSend(v37, sel_stringFromTimeInterval_);

          if (v38)
          {
            v39 = sub_23A3A82DC();
            v47 = v40;
            v48 = v39;

            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v41 = sub_23A383A3C(a1);
            v46 = v31;
            v43 = v42;
            v44 = sub_23A384088(a5);
            *(_QWORD *)(v11 + 32) = a1;
            *(_QWORD *)(v11 + 40) = a5;
            *(_QWORD *)(v11 + 48) = v34;
            *(_QWORD *)(v11 + 56) = v36;
            *(_QWORD *)(v11 + 64) = v41;
            *(_QWORD *)(v11 + 72) = v43;
            *(_QWORD *)(v11 + 80) = v48;
            *(_QWORD *)(v11 + 88) = v47;
            *(_QWORD *)(v11 + 96) = v44;
            *(_QWORD *)(v11 + 104) = v45;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_25;
          }

        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_24:
    sub_23A3A8414();
    sub_23A379D64(0, (unint64_t *)&qword_25696F690);
    v30 = (void *)sub_23A3A8480();
    sub_23A3A815C();

LABEL_25:
    swift_beginAccess();
    os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 120));
    swift_endAccess();
    swift_release();
    return;
  }
  if (!a4)
  {
    v14 = 0xE500000000000000;
    v12 = 0x296C696E28;
    if (!a2)
      goto LABEL_6;
LABEL_10:
    swift_getErrorValue();
    v9 = sub_23A3A86A8();
    v15 = v16;
    goto LABEL_11;
  }
LABEL_5:
  swift_getErrorValue();
  v12 = sub_23A3A86A8();
  v14 = v13;
  if (a2)
    goto LABEL_10;
LABEL_6:
  v15 = 0xE500000000000000;
LABEL_11:
  v17 = sub_23A3A8414();
  sub_23A379D64(0, (unint64_t *)&qword_25696F690);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = sub_23A3A8480();
  v19 = v17;
  if (os_log_type_enabled(v18, v17))
  {
    v20 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    *(_QWORD *)&v49 = v21;
    *(_DWORD *)v20 = 136315394;
    swift_bridgeObjectRetain();
    v51 = sub_23A37C734(v12, v14, (uint64_t *)&v49);
    sub_23A3A84A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    v51 = sub_23A37C734(v9, v15, (uint64_t *)&v49);
    sub_23A3A84A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A377000, v18, v19, "DivingDataCalculator internal error: %s %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v21, -1, -1);
    MEMORY[0x23B84ADCC](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

}

void sub_23A381948(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = MEMORY[0x24BEE4AF8];
  v8 = *(_QWORD *)(v3 + 112);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = v7;
  v9[5] = a1;
  v10 = objc_allocWithZone(MEMORY[0x24BDD3E70]);
  v14[4] = sub_23A382638;
  v14[5] = v9;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_23A3820CC;
  v14[3] = &block_descriptor;
  v11 = _Block_copy(v14);
  v12 = a1;
  swift_retain();
  swift_retain();
  v13 = objc_msgSend(v10, sel_initWithQuantityType_predicate_quantityHandler_, v12, v8, v11);
  _Block_release(v11);
  swift_release();
  objc_msgSend(*(id *)(v3 + 16), sel_executeQuery_, v13);
  swift_release();

}

uint64_t sub_23A381A90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, void (*a7)(uint64_t, uint64_t), uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  int v40;

  v38 = a8;
  v39 = a7;
  v37 = a6;
  v40 = a5;
  v12 = sub_23A3A809C();
  v35 = *(_QWORD *)(v12 - 8);
  v36 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v34 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F688);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_23A3A800C();
  v22 = *(_QWORD *)(v21 - 8);
  result = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v34 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
LABEL_4:
    if ((v40 & 1) == 0)
      return result;
    goto LABEL_5;
  }
  sub_23A382678(a3, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    result = sub_23A37D570((uint64_t)v20, &qword_25696F688);
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v25, v20, v21);
  v27 = a2;
  v28 = a10;
  sub_23A3A7FF4();
  sub_23A3A7FDC();
  v29 = (void *)sub_23A3A8060();
  v30 = (void *)sub_23A3A8060();
  v34 = objc_msgSend((id)objc_opt_self(), sel_quantitySampleWithType_quantity_startDate_endDate_, v28, v27, v29, v30);

  v31 = v36;
  v32 = *(void (**)(char *, uint64_t))(v35 + 8);
  v32(v15, v36);
  v32(v17, v31);
  v33 = swift_beginAccess();
  MEMORY[0x23B84A5B0](v33);
  if (*(_QWORD *)((*(_QWORD *)(a9 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(a9 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_23A3A836C();
  sub_23A3A8384();
  sub_23A3A8360();
  swift_endAccess();

  result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  if ((v40 & 1) != 0)
  {
LABEL_5:
    swift_beginAccess();
    v26 = swift_bridgeObjectRetain();
    v39(v26, v37);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id *DepthDataCalculator.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t DepthDataCalculator.__deallocating_deinit()
{
  id *v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

BOOL static HKQuantitySample.< infix(_:_:)(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;

  v3 = objc_msgSend(a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  v5 = v4;

  v6 = objc_msgSend(a2, sel_quantity);
  objc_msgSend(v6, sel__value);
  v8 = v7;

  return v5 < v8;
}

BOOL static HKQuantitySample.> infix(_:_:)(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;

  v3 = objc_msgSend(a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  v5 = v4;

  v6 = objc_msgSend(a2, sel_quantity);
  objc_msgSend(v6, sel__value);
  v8 = v7;

  return v8 < v5;
}

BOOL sub_23A381FAC(id *a1, void **a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;

  v2 = *a2;
  v3 = objc_msgSend(*a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  v5 = v4;

  v6 = objc_msgSend(v2, sel_quantity);
  objc_msgSend(v6, sel__value);
  v8 = v7;

  return v5 < v8;
}

BOOL sub_23A382040(id *a1, void **a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;

  v2 = *a2;
  v3 = objc_msgSend(*a1, sel_quantity);
  objc_msgSend(v3, sel__value);
  v5 = v4;

  v6 = objc_msgSend(v2, sel_quantity);
  objc_msgSend(v6, sel__value);
  v8 = v7;

  return v8 < v5;
}

uint64_t sub_23A3820CC(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, unsigned int a6, void *a7)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(id, void *, char *, void *, _QWORD, void *);
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;
  unsigned int v25;

  v25 = a6;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F688);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void (**)(id, void *, char *, void *, _QWORD, void *))(a1 + 32);
  if (a4)
  {
    sub_23A3A7FD0();
    v17 = sub_23A3A800C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    v18 = sub_23A3A800C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  }
  swift_retain();
  v19 = a2;
  v20 = a3;
  v21 = a5;
  v22 = a7;
  v16(v19, a3, v15, a5, v25, a7);

  swift_release();
  return sub_23A37D570((uint64_t)v15, &qword_25696F688);
}

uint64_t sub_23A382228()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_23A38224C(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_23A381248(a1, a2, v2);
}

unint64_t sub_23A382258()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696F4F8;
  if (!qword_25696F4F8)
  {
    v1 = sub_23A379D64(255, &qword_25696F500);
    result = MEMORY[0x23B84AD3C](MEMORY[0x24BEE5BE0], v1);
    atomic_store(result, (unint64_t *)&qword_25696F4F8);
  }
  return result;
}

uint64_t destroy for DiveMetrics()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for DiveMetrics(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DiveMetrics(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for DiveMetrics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveMetrics(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DiveMetrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiveMetrics()
{
  return &type metadata for DiveMetrics;
}

uint64_t type metadata accessor for DepthDataCalculator()
{
  return objc_opt_self();
}

uint64_t method lookup function for DepthDataCalculator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DepthDataCalculator.metrics.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of DepthDataCalculator.reload()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t sub_23A3825E0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A382604()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23A382638(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;

  return sub_23A381A90(a1, a2, a3, a4, a5, a6, *(void (**)(uint64_t, uint64_t))(v6 + 16), *(_QWORD *)(v6 + 24), *(_QWORD *)(v6 + 32), *(void **)(v6 + 40));
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

uint64_t sub_23A382678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A3826C0()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_23A3826F4(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_23A38134C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

_QWORD *sub_23A382700(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696F6B0);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23A38372C((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_23A3A8570();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_23A3827F4(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_23A383A28();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_23A38286C(v6);
  return sub_23A3A8540();
}

void sub_23A38286C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  id *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  double v97;
  double v98;
  id v99;
  double v100;
  double v101;
  void *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void **v117;
  uint64_t v118;
  uint64_t v119;

  v3 = a1[1];
  v4 = sub_23A3A8678();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_132;
    if (v3)
      sub_23A383080(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_140;
  v6 = v4;
  v109 = a1;
  if (v3 < 2)
  {
    v9 = (char *)MEMORY[0x24BEE4AF8];
    v119 = MEMORY[0x24BEE4AF8];
    v117 = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_98:
      if (v11 >= 2)
      {
        v103 = *v109;
        do
        {
          v104 = v11 - 2;
          if (v11 < 2)
            goto LABEL_127;
          if (!v103)
            goto LABEL_139;
          v105 = *(_QWORD *)&v9[16 * v104 + 32];
          v106 = *(_QWORD *)&v9[16 * v11 + 24];
          sub_23A3831B0((id *)(v103 + 8 * v105), (id *)(v103 + 8 * *(_QWORD *)&v9[16 * v11 + 16]), v103 + 8 * v106, v117);
          if (v1)
            break;
          if (v106 < v105)
            goto LABEL_128;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v9 = sub_23A383718((uint64_t)v9);
          if (v104 >= *((_QWORD *)v9 + 2))
            goto LABEL_129;
          v107 = &v9[16 * v104 + 32];
          *(_QWORD *)v107 = v105;
          *((_QWORD *)v107 + 1) = v106;
          v108 = *((_QWORD *)v9 + 2);
          if (v11 > v108)
            goto LABEL_130;
          memmove(&v9[16 * v11 + 16], &v9[16 * v11 + 32], 16 * (v108 - v11));
          *((_QWORD *)v9 + 2) = v108 - 1;
          v11 = v108 - 1;
        }
        while (v108 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v119 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_23A3A8360();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v7 = v5 >> 1;
    sub_23A379D64(0, &qword_25696F500);
    v8 = sub_23A3A8378();
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v117 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v119 = v8;
  }
  v112 = v6;
  v10 = 0;
  v118 = *a1;
  v110 = *a1 - 8;
  v111 = *a1 + 16;
  v9 = (char *)MEMORY[0x24BEE4AF8];
  v115 = v3;
  while (1)
  {
    v12 = v10++;
    v114 = v12;
    if (v10 < v3)
    {
      v13 = *(void **)(v118 + 8 * v12);
      v14 = *(id *)(v118 + 8 * v10);
      v15 = v13;
      v16 = objc_msgSend(v14, sel_quantity);
      objc_msgSend(v16, sel__value);
      v18 = v17;

      v19 = objc_msgSend(v15, sel_quantity);
      objc_msgSend(v19, sel__value);
      v21 = v20;

      v3 = v115;
      v10 = v12 + 2;
      if (v12 + 2 < v115)
      {
        v22 = (id *)(v111 + 8 * v12);
        while (1)
        {
          v23 = *(v22 - 1);
          v24 = *v22;
          v25 = v23;
          v26 = objc_msgSend(v24, sel_quantity);
          objc_msgSend(v26, sel__value);
          v28 = v27;

          v29 = objc_msgSend(v25, sel_quantity);
          objc_msgSend(v29, sel__value);
          v31 = v30;

          if (v18 < v21 == v28 >= v31)
            break;
          ++v10;
          ++v22;
          v3 = v115;
          if (v115 == v10)
          {
            v10 = v115;
            goto LABEL_22;
          }
        }
        v3 = v115;
LABEL_22:
        v12 = v114;
      }
      if (v18 < v21)
      {
        if (v10 < v12)
          goto LABEL_133;
        if (v12 < v10)
        {
          v32 = (uint64_t *)(v110 + 8 * v10);
          v33 = v10;
          v34 = v12;
          v35 = (uint64_t *)(v118 + 8 * v12);
          do
          {
            if (v34 != --v33)
            {
              if (!v118)
                goto LABEL_138;
              v36 = *v35;
              *v35 = *v32;
              *v32 = v36;
            }
            ++v34;
            --v32;
            ++v35;
          }
          while (v34 < v33);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_40;
    if (__OFSUB__(v10, v12))
      goto LABEL_131;
    if (v10 - v12 >= v112)
      goto LABEL_40;
    if (__OFADD__(v12, v112))
      goto LABEL_134;
    v37 = v12 + v112 >= v3 ? v3 : v12 + v112;
    if (v37 < v12)
      break;
    if (v10 != v37)
    {
      v90 = v110 + 8 * v10;
      v38 = v118;
      v113 = v37;
      do
      {
        v91 = *(void **)(v118 + 8 * v10);
        v92 = v12;
        v116 = v90;
        do
        {
          v93 = *(void **)v90;
          v94 = v91;
          v95 = v93;
          v96 = objc_msgSend(v94, sel_quantity);
          objc_msgSend(v96, sel__value);
          v98 = v97;

          v99 = objc_msgSend(v95, sel_quantity);
          objc_msgSend(v99, sel__value);
          v101 = v100;

          if (v98 >= v101)
            break;
          if (!v118)
            goto LABEL_136;
          v102 = *(void **)v90;
          v91 = *(void **)(v90 + 8);
          *(_QWORD *)v90 = v91;
          *(_QWORD *)(v90 + 8) = v102;
          v90 -= 8;
          ++v92;
        }
        while (v10 != v92);
        ++v10;
        v90 = v116 + 8;
        v12 = v114;
      }
      while (v10 != v113);
      v10 = v113;
      if (v113 < v114)
        goto LABEL_126;
      goto LABEL_41;
    }
LABEL_40:
    v38 = v118;
    if (v10 < v12)
      goto LABEL_126;
LABEL_41:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_23A383578(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v40 = *((_QWORD *)v9 + 2);
    v39 = *((_QWORD *)v9 + 3);
    v11 = v40 + 1;
    if (v40 >= v39 >> 1)
      v9 = sub_23A383578((char *)(v39 > 1), v40 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v11;
    v41 = v9 + 32;
    v42 = &v9[16 * v40 + 32];
    *(_QWORD *)v42 = v12;
    *((_QWORD *)v42 + 1) = v10;
    if (v40)
    {
      while (1)
      {
        v43 = v11 - 1;
        if (v11 >= 4)
        {
          v48 = &v41[16 * v11];
          v49 = *((_QWORD *)v48 - 8);
          v50 = *((_QWORD *)v48 - 7);
          v54 = __OFSUB__(v50, v49);
          v51 = v50 - v49;
          if (v54)
            goto LABEL_115;
          v53 = *((_QWORD *)v48 - 6);
          v52 = *((_QWORD *)v48 - 5);
          v54 = __OFSUB__(v52, v53);
          v46 = v52 - v53;
          v47 = v54;
          if (v54)
            goto LABEL_116;
          v55 = v11 - 2;
          v56 = &v41[16 * v11 - 32];
          v58 = *(_QWORD *)v56;
          v57 = *((_QWORD *)v56 + 1);
          v54 = __OFSUB__(v57, v58);
          v59 = v57 - v58;
          if (v54)
            goto LABEL_118;
          v54 = __OFADD__(v46, v59);
          v60 = v46 + v59;
          if (v54)
            goto LABEL_121;
          if (v60 >= v51)
          {
            v78 = &v41[16 * v43];
            v80 = *(_QWORD *)v78;
            v79 = *((_QWORD *)v78 + 1);
            v54 = __OFSUB__(v79, v80);
            v81 = v79 - v80;
            if (v54)
              goto LABEL_125;
            v71 = v46 < v81;
            goto LABEL_77;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v72 = *((_QWORD *)v9 + 4);
            v73 = *((_QWORD *)v9 + 5);
            v54 = __OFSUB__(v73, v72);
            v65 = v73 - v72;
            v66 = v54;
            goto LABEL_71;
          }
          v45 = *((_QWORD *)v9 + 4);
          v44 = *((_QWORD *)v9 + 5);
          v54 = __OFSUB__(v44, v45);
          v46 = v44 - v45;
          v47 = v54;
        }
        if ((v47 & 1) != 0)
          goto LABEL_117;
        v55 = v11 - 2;
        v61 = &v41[16 * v11 - 32];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v64 = __OFSUB__(v62, v63);
        v65 = v62 - v63;
        v66 = v64;
        if (v64)
          goto LABEL_120;
        v67 = &v41[16 * v43];
        v69 = *(_QWORD *)v67;
        v68 = *((_QWORD *)v67 + 1);
        v54 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v54)
          goto LABEL_123;
        if (__OFADD__(v65, v70))
          goto LABEL_124;
        if (v65 + v70 >= v46)
        {
          v71 = v46 < v70;
LABEL_77:
          if (v71)
            v43 = v55;
          goto LABEL_79;
        }
LABEL_71:
        if ((v66 & 1) != 0)
          goto LABEL_119;
        v74 = &v41[16 * v43];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v54 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v54)
          goto LABEL_122;
        if (v77 < v65)
          goto LABEL_14;
LABEL_79:
        v82 = v43 - 1;
        if (v43 - 1 >= v11)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
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
          goto LABEL_135;
        }
        v83 = v38;
        if (!v38)
          goto LABEL_137;
        v84 = v9;
        v85 = &v41[16 * v82];
        v86 = *(_QWORD *)v85;
        v87 = &v41[16 * v43];
        v88 = *((_QWORD *)v87 + 1);
        sub_23A3831B0((id *)(v83 + 8 * *(_QWORD *)v85), (id *)(v83 + 8 * *(_QWORD *)v87), v83 + 8 * v88, v117);
        if (v1)
          goto LABEL_109;
        if (v88 < v86)
          goto LABEL_112;
        if (v43 > *((_QWORD *)v84 + 2))
          goto LABEL_113;
        *(_QWORD *)v85 = v86;
        *(_QWORD *)&v41[16 * v82 + 8] = v88;
        v89 = *((_QWORD *)v84 + 2);
        if (v43 >= v89)
          goto LABEL_114;
        v9 = v84;
        v11 = v89 - 1;
        memmove(&v41[16 * v43], v87 + 16, 16 * (v89 - 1 - v43));
        *((_QWORD *)v84 + 2) = v89 - 1;
        v38 = v118;
        if (v89 <= 2)
          goto LABEL_14;
      }
    }
    v11 = 1;
LABEL_14:
    v3 = v115;
    if (v10 >= v115)
      goto LABEL_98;
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  sub_23A3A8564();
  __break(1u);
}

void sub_23A383080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v21;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    v7 = *(void **)(v5 + 8 * v4);
    v8 = a1;
    v21 = v6;
    while (1)
    {
      v9 = *(void **)v6;
      v10 = v7;
      v11 = v9;
      v12 = objc_msgSend(v10, sel_quantity);
      objc_msgSend(v12, sel__value);
      v14 = v13;

      v15 = objc_msgSend(v11, sel_quantity);
      objc_msgSend(v15, sel__value);
      v17 = v16;

      if (v14 >= v17)
      {
LABEL_4:
        ++v4;
        v6 = v21 + 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v5)
        break;
      v18 = *(void **)v6;
      v7 = *(void **)(v6 + 8);
      *(_QWORD *)v6 = v7;
      *(_QWORD *)(v6 + 8) = v18;
      v6 -= 8;
      if (v4 == ++v8)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_23A3831B0(id *__src, id *a2, unint64_t a3, void **a4)
{
  id *v4;
  id *v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void **v13;
  void **v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  id *v24;
  void **v25;
  char *v26;
  id *v27;
  id *v28;
  char *v29;
  void *v30;
  unint64_t v31;
  id v32;
  id v33;
  id v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  uint64_t result;
  id *v41;
  id *v43;
  id *v45;
  char *v46;
  void **v47;
  id *v48;

  v4 = a2;
  v5 = __src;
  v6 = (char *)a2 - (char *)__src;
  v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v7 = (char *)a2 - (char *)__src;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)a2;
  v10 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v10 = a3 - (_QWORD)a2;
  v11 = v10 >> 3;
  v48 = __src;
  v47 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4)
        memmove(a4, a2, 8 * v11);
      v26 = (char *)&a4[v11];
      v46 = v26;
      v48 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        v27 = (id *)(a3 - 8);
        v28 = v4;
        v41 = v5;
        while (1)
        {
          v43 = v27 + 1;
          v45 = v4;
          v29 = v26 - 8;
          v30 = *--v28;
          v31 = (unint64_t)v26;
          v32 = *((id *)v26 - 1);
          v33 = v30;
          v34 = objc_msgSend(v32, sel_quantity);
          objc_msgSend(v34, sel__value);
          v36 = v35;

          v37 = objc_msgSend(v33, sel_quantity);
          objc_msgSend(v37, sel__value);
          v39 = v38;

          if (v36 >= v39)
          {
            v46 = v29;
            if ((unint64_t)v43 < v31 || (unint64_t)v27 >= v31)
            {
              *v27 = *(id *)v29;
              v28 = v45;
              v26 = v29;
              if (v45 <= v41)
                goto LABEL_45;
            }
            else
            {
              if (v43 != (id *)v31)
                *v27 = *(id *)v29;
              v28 = v45;
              v26 = v29;
              if (v45 <= v41)
                goto LABEL_45;
            }
          }
          else
          {
            if (v43 != v45 || v27 >= v45)
              *v27 = *v28;
            v48 = v28;
            v26 = (char *)v31;
            if (v28 <= v41)
              goto LABEL_45;
          }
          --v27;
          v4 = v28;
          if (v26 <= (char *)a4)
            goto LABEL_45;
        }
      }
      goto LABEL_45;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4)
      memmove(a4, __src, 8 * v8);
    v12 = (char *)&a4[v8];
    v46 = v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      v13 = a4;
      do
      {
        v14 = v5;
        v15 = *v13;
        v16 = *v4;
        v17 = v15;
        v18 = objc_msgSend(v16, sel_quantity);
        objc_msgSend(v18, sel__value);
        v20 = v19;

        v21 = objc_msgSend(v17, sel_quantity);
        objc_msgSend(v21, sel__value);
        v23 = v22;

        if (v20 >= v23)
        {
          v25 = v14;
          if (v14 != v13)
            *v14 = *v13;
          v47 = ++v13;
          v24 = v4;
        }
        else
        {
          v24 = v4 + 1;
          v25 = v14;
          if (v14 < v4 || v14 >= v24 || v14 != v4)
            *v14 = *v4;
        }
        v5 = v25 + 1;
        if (v13 >= (void **)v12)
          break;
        v4 = v24;
      }
      while ((unint64_t)v24 < a3);
      v48 = v5;
    }
LABEL_45:
    sub_23A383670((void **)&v48, (const void **)&v47, &v46);
    return 1;
  }
  result = sub_23A3A85A0();
  __break(1u);
  return result;
}

char *sub_23A383578(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F6C8);
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

char *sub_23A383670(void **a1, const void **a2, _QWORD *a3)
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
    result = (char *)sub_23A3A85A0();
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

char *sub_23A383718(uint64_t a1)
{
  return sub_23A383578(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A38372C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_23A3A8570();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_23A3A8570();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_23A3844DC();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25696F6B8);
          v12 = sub_23A383934(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_23A379D64(0, &qword_25696F500);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23A3A85A0();
  __break(1u);
  return result;
}

void (*sub_23A383934(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23A3839B4(v6, a2, a3);
  return sub_23A383988;
}

void sub_23A383988(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23A3839B4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B84A76C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_23A383A20;
  }
  __break(1u);
  return result;
}

void sub_23A383A20(id *a1)
{

}

void sub_23A383A28()
{
  JUMPOUT(0x23B84A8E0);
}

uint64_t sub_23A383A3C(unint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20[3];

  v3 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = (id)sub_23A3A8570();
    swift_bridgeObjectRelease();
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v4 = *(id *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
    {
LABEL_10:
      sub_23A3A8414();
      sub_23A379D64(0, (unint64_t *)&qword_25696F690);
      v9 = (void *)sub_23A3A8480();
      sub_23A3A815C();
LABEL_11:

      return 11565;
    }
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = (id)MEMORY[0x23B84A76C](0, a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_26;
    }
    v4 = *(id *)(a1 + 32);
  }
  sub_23A379D64(0, &qword_25696F6A8);
  v5 = objc_msgSend(v4, sel_quantityType);
  sub_23A379D64(0, (unint64_t *)&qword_25696F220);
  v6 = (void *)MEMORY[0x23B84A6A0]((id)*MEMORY[0x24BDD3698]);
  v7 = sub_23A3A8474();

  if ((v7 & 1) == 0)
  {

    goto LABEL_10;
  }
  if (v3)
  {
    v11 = swift_bridgeObjectRetain();
    v8 = (uint64_t)sub_23A382700(v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v20[0] = v8;
  sub_23A3827F4(v20);
  v1 = v20[0];
  if ((v20[0] & 0x8000000000000000) == 0 && (v20[0] & 0x4000000000000000) == 0)
  {
    v12 = *(_QWORD *)(v20[0] + 16);
    if (v12)
      goto LABEL_16;
    goto LABEL_27;
  }
LABEL_26:
  swift_bridgeObjectRetain();
  v12 = sub_23A3A8570();
  swift_release();
  if (!v12)
  {
LABEL_27:
    swift_release();
    sub_23A3A8414();
    sub_23A379D64(0, (unint64_t *)&qword_25696F690);
    v9 = (void *)sub_23A3A8480();
    sub_23A3A815C();

    goto LABEL_11;
  }
LABEL_16:
  v13 = v12 - 1;
  if (__OFSUB__(v12, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
LABEL_29:
    v14 = (id)MEMORY[0x23B84A76C](v13, v1);
    goto LABEL_21;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 < *(_QWORD *)(v1 + 16))
  {
    v14 = *(id *)(v1 + 8 * v13 + 32);
LABEL_21:
    v15 = v14;
    swift_release();
    v20[0] = 0;
    v20[1] = 0xE000000000000000;
    v16 = objc_msgSend(v15, sel_quantity);
    objc_msgSend(v16, sel__value);

    sub_23A3A83E4();
    v17 = objc_msgSend(v15, sel_quantity);
    v18 = objc_msgSend(v17, sel__unit);

    v19 = objc_msgSend((id)objc_opt_self(), sel_meterUnit);
    sub_23A3A8474();

    sub_23A3A8318();
    swift_bridgeObjectRelease();
    return v20[0];
  }
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

void sub_23A383E3C(double a1, uint64_t a2, char a3)
{
  id v4;

  if ((a3 & 1) == 0)
  {
    sub_23A379D64(0, &qword_25696F6A8);
    v4 = objc_msgSend((id)objc_opt_self(), sel_degreeCelsiusUnit);
    sub_23A3A8474();

    sub_23A3A8318();
    swift_bridgeObjectRelease();
  }
  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (a1 < 9.22337204e18)
  {
    sub_23A3A8684();
    sub_23A3A8318();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_23A383F8C(uint64_t a1, double a2, double a3)
{
  if (a2 == a3)
  {
    sub_23A383E3C(a2, a1, 0);
    return;
  }
  if ((~*(_QWORD *)&a2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (a2 < 9.22337204e18)
  {
    sub_23A3A8684();
    sub_23A3A8318();
    sub_23A3A8318();
    sub_23A383E3C(a3, a1, 0);
    sub_23A3A8318();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_23A384088(unint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  id v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v3 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = (id)sub_23A3A8570();
    swift_bridgeObjectRelease();
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v4 = *(id *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
    {
LABEL_10:
      sub_23A3A8414();
      sub_23A379D64(0, (unint64_t *)&qword_25696F690);
      v9 = (void *)sub_23A3A8480();
      sub_23A3A815C();
LABEL_11:

      return 11565;
    }
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = (id)MEMORY[0x23B84A76C](0, a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_31;
    }
    v4 = *(id *)(a1 + 32);
  }
  sub_23A379D64(0, &qword_25696F6A8);
  v5 = objc_msgSend(v4, sel_quantityType);
  sub_23A379D64(0, (unint64_t *)&qword_25696F220);
  v6 = (void *)MEMORY[0x23B84A6A0]((id)*MEMORY[0x24BDD36D8]);
  v7 = sub_23A3A8474();

  if ((v7 & 1) == 0)
  {

    goto LABEL_10;
  }
  if (v3)
  {
    v12 = swift_bridgeObjectRetain();
    v8 = (uint64_t)sub_23A382700(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v30 = v8;
  sub_23A3827F4(&v30);
  v1 = v30;
  if ((v30 & 0x8000000000000000) == 0 && (v30 & 0x4000000000000000) == 0)
  {
    v13 = *(_QWORD *)(v30 + 16);
    swift_retain();
    if (v13)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  swift_retain();
  v13 = sub_23A3A8570();
  if (!v13)
  {
LABEL_32:
    swift_release_n();
    sub_23A3A8414();
    sub_23A379D64(0, (unint64_t *)&qword_25696F690);
    v9 = (void *)sub_23A3A8480();
    sub_23A3A815C();

    goto LABEL_11;
  }
LABEL_17:
  if ((v1 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      v14 = *(id *)(v1 + 32);
      swift_release();
      v15 = v13 - 1;
      if (!__OFSUB__(v13, 1))
      {
        if ((v15 & 0x8000000000000000) == 0)
        {
          if (v15 < *(_QWORD *)(v1 + 16))
          {
            v16 = *(id *)(v1 + 32 + 8 * v15);
LABEL_23:
            v17 = v16;
            swift_release();
            v18 = objc_msgSend(v14, sel_quantity);
            objc_msgSend(v18, sel__value);
            v20 = v19;

            v21 = floor(v20);
            v22 = objc_msgSend(v17, sel_quantity);
            objc_msgSend(v22, sel__value);
            v24 = v23;

            v25 = ceil(v24);
            if (v21 == v25)
            {
              v26 = objc_msgSend(v14, sel_quantity);
              v27 = objc_msgSend(v26, sel__unit);

              sub_23A383E3C(v21, (uint64_t)v27, 0);
            }
            else
            {
              v29 = objc_msgSend(v17, sel_quantity);
              v27 = objc_msgSend(v29, sel__unit);

              sub_23A383F8C((uint64_t)v27, v21, v25);
            }
            v10 = v28;

            return v10;
          }
          goto LABEL_38;
        }
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_37;
  }
  v14 = (id)MEMORY[0x23B84A76C](0, v1);
  swift_release();
  if (!__OFSUB__(v13, 1))
  {
    v16 = (id)MEMORY[0x23B84A76C](v13 - 1, v1);
    goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_23A3844DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25696F6C0;
  if (!qword_25696F6C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25696F6B8);
    result = MEMORY[0x23B84AD3C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25696F6C0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84AD30](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23A38456C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7A8);
  v2 = (_QWORD *)sub_23A3A8594();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = sub_23A37CD84(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_23A384684(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F798);
  v2 = (_QWORD *)sub_23A3A8594();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23A385A0C(v4, (uint64_t)&v16);
    v5 = v16;
    v6 = v17;
    result = sub_23A37CD84(v16, v17);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = (uint64_t *)(v2[6] + 16 * result);
    *v9 = v5;
    v9[1] = v6;
    v10 = v2[7] + 40 * result;
    v11 = v18;
    v12 = v19;
    *(_QWORD *)(v10 + 32) = v20;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v2[2] = v15;
    v4 += 56;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t DepthFeatureKey.isEnabled.getter()
{
  char *v0;
  char v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;

  v1 = *v0;
  if (qword_25696F168 != -1)
    swift_once();
  v2 = off_25696F6D0;
  swift_beginAccess();
  v3 = v2[2];
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_23A37CDE8(v1), (v5 & 1) != 0))
    v6 = *(unsigned __int8 *)(*(_QWORD *)(v3 + 56) + v4);
  else
    v6 = 0;
  swift_endAccess();
  return v6;
}

Swift::Bool __swiftcall DepthFeatures.isEnabled(_:)(DepthCore::DepthFeatureKey a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  char v6;

  v2 = *(_BYTE *)a1;
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_23A37CDE8(v2), (v5 & 1) != 0))
    v6 = *(_BYTE *)(*(_QWORD *)(v3 + 56) + v4);
  else
    v6 = 0;
  swift_endAccess();
  return v6;
}

const char *DepthFeatureKey.domain.getter()
{
  return "Depth";
}

const char *DepthFeatureKey.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "Sundrift";
  else
    return "divingd";
}

BOOL static DepthFeatureKey.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DepthFeatureKey.hash(into:)()
{
  return sub_23A3A86F0();
}

uint64_t DepthFeatureKey.hashValue.getter()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

BOOL sub_23A384984(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A38499C()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

uint64_t sub_23A3849E0()
{
  return sub_23A3A86F0();
}

uint64_t sub_23A384A08()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

const char *sub_23A384A48()
{
  return "Depth";
}

const char *sub_23A384A5C()
{
  _BYTE *v0;

  if (*v0)
    return "Sundrift";
  else
    return "divingd";
}

void *sub_23A384A88()
{
  void *result;

  type metadata accessor for DepthFeatures();
  swift_allocObject();
  result = (void *)sub_23A384B00();
  off_25696F6D0 = result;
  return result;
}

uint64_t static DepthFeatures.shared.getter()
{
  if (qword_25696F168 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_23A384B00()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  char v3;
  unint64_t v4;
  _BYTE v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  *(_QWORD *)(v0 + 16) = sub_23A3858F4(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F788);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A3A9220;
  *(_BYTE *)(inited + 32) = 0;
  v7 = &type metadata for DepthFeatureKey;
  v2 = sub_23A3859C8();
  v8 = v2;
  v6[0] = 0;
  v3 = sub_23A3A8150();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  *(_BYTE *)(inited + 33) = v3 & 1;
  *(_BYTE *)(inited + 34) = 1;
  v7 = &type metadata for DepthFeatureKey;
  v8 = v2;
  v6[0] = 1;
  LOBYTE(v2) = sub_23A3A8150();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  *(_BYTE *)(inited + 35) = v2 & 1;
  v4 = sub_23A3858F4(inited);
  swift_setDeallocating();
  swift_beginAccess();
  *(_QWORD *)(v0 + 16) = v4;
  swift_bridgeObjectRelease();
  return v0;
}

Swift::Void __swiftcall DepthFeatures.override(feature:_:)(DepthCore::DepthFeatureKey feature, Swift::Bool _)
{
  uint64_t v2;
  char v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;

  v4 = *(_BYTE *)feature;
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v6 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0x8000000000000000;
  sub_23A3852AC(_, v4, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 16) = v6;
  swift_bridgeObjectRelease();
  swift_endAccess();
}

uint64_t DepthFeatures.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DepthFeatures.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A384CD4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7A8);
  v36 = a2;
  v6 = sub_23A3A8588();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_23A3A86E4();
    sub_23A3A830C();
    result = sub_23A3A86FC();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23A384FE8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F780);
  result = sub_23A3A8588();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v30 = a2;
    v8 = 0;
    v31 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v12)
          goto LABEL_31;
        v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_31;
          v18 = v31[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v29 = 1 << *(_BYTE *)(v5 + 32);
              if (v29 >= 64)
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v31 = -1 << v29;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_40;
                if (v8 >= v12)
                  goto LABEL_31;
                v18 = v31[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16);
      v21 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16);
      sub_23A3A86E4();
      sub_23A3A86F0();
      result = sub_23A3A86FC();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v14) = v20;
      *(_BYTE *)(*(_QWORD *)(v7 + 56) + v14) = v21;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_23A3852AC(char a1, char a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  char v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v4 = v3;
  v7 = a2 & 1;
  v8 = *v3;
  v10 = sub_23A37CDE8(a2 & 1);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_23A38576C();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v16[7] + v10) = a1 & 1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = v7;
    *(_BYTE *)(v16[7] + v10) = a1 & 1;
    v18 = v16[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_23A384FE8(result, a3 & 1);
  result = sub_23A37CDE8(v7);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A3A869C();
  __break(1u);
  return result;
}

unint64_t sub_23A3853E0()
{
  unint64_t result;

  result = qword_25696F6D8;
  if (!qword_25696F6D8)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthFeatureKey, &type metadata for DepthFeatureKey);
    atomic_store(result, (unint64_t *)&qword_25696F6D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DepthFeatureKey(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DepthFeatureKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A385500 + 4 * byte_23A3A935D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A385534 + 4 * byte_23A3A9358[v4]))();
}

uint64_t sub_23A385534(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A38553C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A385544);
  return result;
}

uint64_t sub_23A385550(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A385558);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A38555C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A385564(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A385570(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DepthFeatureKey()
{
  return &type metadata for DepthFeatureKey;
}

uint64_t type metadata accessor for DepthFeatures()
{
  return objc_opt_self();
}

uint64_t method lookup function for DepthFeatures()
{
  return swift_lookUpClassMethod();
}

void *sub_23A3855B8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7A8);
  v2 = *v0;
  v3 = sub_23A3A857C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_unknownObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23A38576C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F780);
  v2 = *v0;
  v3 = sub_23A3A857C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v20 = __clz(__rbit64(v18));
    v12 = (v18 - 1) & v18;
    v15 = v20 + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_23A3858F4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  char *i;
  char v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F780);
    v3 = (_QWORD *)sub_23A3A8594();
    for (i = (char *)(a1 + 33); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_23A37CDE8(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v3[6] + result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

unint64_t sub_23A3859C8()
{
  unint64_t result;

  result = qword_25696F790;
  if (!qword_25696F790)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthFeatureKey, &type metadata for DepthFeatureKey);
    atomic_store(result, (unint64_t *)&qword_25696F790);
  }
  return result;
}

uint64_t sub_23A385A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double *static TemperatureRange.orderedRange(t1:t2:)@<X0>(double *result@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  double v3;
  double v4;

  v3 = *result;
  if (*result >= *a2)
    v4 = *a2;
  else
    v4 = *result;
  if (*result < *a2)
    v3 = *a2;
  *(double *)a3 = v4;
  *(double *)(a3 + 8) = v3;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void TemperatureRange.temperatureSpan.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(unsigned __int8 *)(v1 + 16);
  if (*(_BYTE *)(v1 + 16))
  {
    if (v2 == 1)
    {
      *(double *)a1 = vabdd_f64(*(double *)v1, *(double *)(v1 + 8));
      *(_BYTE *)(a1 + 8) = 0;
    }
    else
    {
      *(_QWORD *)a1 = 0;
      *(_BYTE *)(a1 + 8) = 1;
    }
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 8) = v2;
  }
}

void TemperatureRange.average.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  double v2;
  int v3;

  v2 = *(double *)v1;
  v3 = *(unsigned __int8 *)(v1 + 16);
  if (*(_BYTE *)(v1 + 16))
  {
    if (v3 == 1)
    {
      *(double *)a1 = (*(double *)(v1 + 8) + v2) * 0.5;
      *(_BYTE *)(a1 + 8) = 0;
    }
    else
    {
      *(_QWORD *)a1 = 0;
      *(_BYTE *)(a1 + 8) = 1;
    }
  }
  else
  {
    *(double *)a1 = v2;
    *(_BYTE *)(a1 + 8) = v3;
  }
}

void TemperatureRange.minValue.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  BOOL v3;

  v2 = *v1;
  v3 = *((unsigned __int8 *)v1 + 16) > 1u;
  if (*((unsigned __int8 *)v1 + 16) > 1u)
    v2 = 0;
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
}

void TemperatureRange.maxValue.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)(v1 + 16);
  if (v2 == 1)
    v3 = *(_QWORD *)(v1 + 8);
  else
    v3 = 0;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v2 != 1;
}

uint64_t TemperatureRange.values.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *v0;
  if (*((_BYTE *)v0 + 16))
  {
    if (*((_BYTE *)v0 + 16) == 1)
    {
      v2 = v0[1];
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7B0);
      result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_23A3A9220;
      *(_QWORD *)(result + 32) = v1;
      *(_QWORD *)(result + 40) = v2;
    }
    else
    {
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7B0);
    result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_23A3A9210;
    *(_QWORD *)(result + 32) = v1;
  }
  return result;
}

double *TemperatureRange.updated(withTemperature:)@<X0>(double *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v3 = *result;
  v5 = *(double *)v2;
  v4 = *(double *)(v2 + 8);
  if (!*(_BYTE *)(v2 + 16))
  {
    if (v3 == v5)
    {
      *(double *)a2 = v5;
      *(double *)(a2 + 8) = v4;
      *(_BYTE *)(a2 + 16) = 0;
      return result;
    }
    if (v3 <= v5)
    {
      *(double *)a2 = v3;
      *(double *)(a2 + 8) = v5;
      goto LABEL_14;
    }
    *(double *)a2 = v5;
    goto LABEL_12;
  }
  if (*(_BYTE *)(v2 + 16) != 1)
  {
    *(double *)a2 = v3;
    *(_QWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 16) = 0;
    return result;
  }
  if (v3 >= v5)
  {
    *(double *)a2 = v5;
    if (v3 <= v4)
      goto LABEL_9;
LABEL_12:
    *(double *)(a2 + 8) = v3;
    goto LABEL_14;
  }
  *(double *)a2 = v3;
LABEL_9:
  *(double *)(a2 + 8) = v4;
LABEL_14:
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_23A385C84(char a1)
{
  return *(_QWORD *)&aUnknown_6[8 * a1];
}

BOOL sub_23A385CA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A385CB8()
{
  char *v0;

  return sub_23A385C84(*v0);
}

uint64_t sub_23A385CC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A3870B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A385CE4()
{
  return 0;
}

void sub_23A385CF0(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23A385CFC()
{
  sub_23A38684C();
  return sub_23A3A8720();
}

uint64_t sub_23A385D24()
{
  sub_23A38684C();
  return sub_23A3A872C();
}

uint64_t sub_23A385D4C(char a1)
{
  if ((a1 & 1) != 0)
    return 12639;
  else
    return 12383;
}

uint64_t sub_23A385D64()
{
  char *v0;

  return sub_23A385D4C(*v0);
}

uint64_t sub_23A385D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A3871EC(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A385D90(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23A385D9C()
{
  sub_23A386890();
  return sub_23A3A8720();
}

uint64_t sub_23A385DC4()
{
  sub_23A386890();
  return sub_23A3A872C();
}

uint64_t sub_23A385DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A3872A4(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_23A385E18(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23A385E24()
{
  sub_23A386918();
  return sub_23A3A8720();
}

uint64_t sub_23A385E4C()
{
  sub_23A386918();
  return sub_23A3A872C();
}

uint64_t sub_23A385E74()
{
  return 0;
}

uint64_t sub_23A385E80@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23A385EAC()
{
  sub_23A38695C();
  return sub_23A3A8720();
}

uint64_t sub_23A385ED4()
{
  sub_23A38695C();
  return sub_23A3A872C();
}

uint64_t TemperatureRange.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7B8);
  v28 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v27 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7C0);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7C8);
  v8 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F7D0);
  v31 = *(_QWORD *)(v11 - 8);
  v32 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = *v1;
  v14 = v1[1];
  v15 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38684C();
  sub_23A3A8714();
  if (v15)
  {
    if (v15 == 1)
    {
      LOBYTE(v35) = 2;
      sub_23A386890();
      v16 = v27;
      v17 = v32;
      sub_23A3A8624();
      v35 = v30;
      v34 = 0;
      sub_23A3868D4();
      v18 = v29;
      v19 = v33;
      sub_23A3A8660();
      if (!v19)
      {
        v35 = v14;
        v34 = 1;
        sub_23A3A8660();
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v18);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v17);
    }
    else
    {
      LOBYTE(v35) = 0;
      sub_23A38695C();
      v23 = v32;
      sub_23A3A8624();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v23);
    }
  }
  else
  {
    LOBYTE(v35) = 1;
    sub_23A386918();
    v21 = v32;
    sub_23A3A8624();
    v35 = v30;
    sub_23A3868D4();
    v22 = v26;
    sub_23A3A8660();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v21);
  }
}

uint64_t TemperatureRange.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char *v38;
  char *v39;
  _QWORD *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;

  v37 = a2;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F800);
  v36 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F808);
  v35 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F810);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F818);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23A38684C();
  v14 = v41;
  sub_23A3A8708();
  if (v14)
    goto LABEL_9;
  v32 = v5;
  v16 = v38;
  v15 = v39;
  v41 = v10;
  v17 = sub_23A3A8618();
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v22 = sub_23A3A8510();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F820);
    *v24 = &type metadata for TemperatureRange;
    sub_23A3A85D0();
    sub_23A3A8504();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26D0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
LABEL_9:
    v25 = (uint64_t)v40;
    return __swift_destroy_boxed_opaque_existential_0(v25);
  }
  if (*(_BYTE *)(v17 + 32))
  {
    if (*(_BYTE *)(v17 + 32) == 1)
    {
      LOBYTE(v44) = 1;
      sub_23A386918();
      sub_23A3A85C4();
      sub_23A3869A0();
      v18 = v33;
      sub_23A3A860C();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v18);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
      v19 = 0;
      v20 = 0;
      v21 = v44;
    }
    else
    {
      LOBYTE(v44) = 2;
      sub_23A386890();
      sub_23A3A85C4();
      v28 = v15;
      LOBYTE(v43) = 0;
      sub_23A3869A0();
      v29 = v34;
      sub_23A3A860C();
      v30 = v12;
      v21 = v44;
      v42 = 1;
      sub_23A3A860C();
      v31 = v41;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v30, v9);
      v19 = v43;
      v20 = 1;
    }
  }
  else
  {
    LOBYTE(v44) = 0;
    sub_23A38695C();
    sub_23A3A85C4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v9);
    v21 = 0;
    v19 = 0;
    v20 = 2;
  }
  v25 = (uint64_t)v40;
  v27 = v37;
  *v37 = v21;
  v27[1] = v19;
  *((_BYTE *)v27 + 16) = v20;
  return __swift_destroy_boxed_opaque_existential_0(v25);
}

uint64_t sub_23A3867A4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return TemperatureRange.init(from:)(a1, a2);
}

uint64_t sub_23A3867B8(_QWORD *a1)
{
  return TemperatureRange.encode(to:)(a1);
}

BOOL _s9DepthCore16TemperatureRangeO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  int v4;
  double v5;
  uint64_t v7;

  v2 = *(double *)a1;
  v3 = *(double *)a2;
  v4 = *(unsigned __int8 *)(a2 + 16);
  if (!*(_BYTE *)(a1 + 16))
    return !*(_BYTE *)(a2 + 16) && v2 == v3;
  v5 = *(double *)(a2 + 8);
  if (*(_BYTE *)(a1 + 16) == 1)
  {
    if (v4 == 1 && v2 == v3)
      return *(double *)(a1 + 8) == v5;
    return 0;
  }
  v7 = *(_QWORD *)&v5 | *(_QWORD *)&v3;
  return v4 == 2 && v7 == 0;
}

unint64_t sub_23A38684C()
{
  unint64_t result;

  result = qword_25696F7D8;
  if (!qword_25696F7D8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A98DC, &type metadata for TemperatureRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F7D8);
  }
  return result;
}

unint64_t sub_23A386890()
{
  unint64_t result;

  result = qword_25696F7E0;
  if (!qword_25696F7E0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A988C, &type metadata for TemperatureRange.RangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F7E0);
  }
  return result;
}

unint64_t sub_23A3868D4()
{
  unint64_t result;

  result = qword_25696F7E8;
  if (!qword_25696F7E8)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for TemperatureValue, &type metadata for TemperatureValue);
    atomic_store(result, (unint64_t *)&qword_25696F7E8);
  }
  return result;
}

unint64_t sub_23A386918()
{
  unint64_t result;

  result = qword_25696F7F0;
  if (!qword_25696F7F0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A983C, &type metadata for TemperatureRange.SingularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F7F0);
  }
  return result;
}

unint64_t sub_23A38695C()
{
  unint64_t result;

  result = qword_25696F7F8;
  if (!qword_25696F7F8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A97EC, &type metadata for TemperatureRange.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F7F8);
  }
  return result;
}

unint64_t sub_23A3869A0()
{
  unint64_t result;

  result = qword_25696F828;
  if (!qword_25696F828)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for TemperatureValue, &type metadata for TemperatureValue);
    atomic_store(result, (unint64_t *)&qword_25696F828);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TemperatureRange(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TemperatureRange(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23A386A84(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23A386A9C(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for TemperatureRange()
{
  return &type metadata for TemperatureRange;
}

uint64_t getEnumTagSinglePayload for TemperatureRange.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TemperatureRange.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A386BA0 + 4 * byte_23A3A9455[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A386BD4 + 4 * byte_23A3A9450[v4]))();
}

uint64_t sub_23A386BD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A386BDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A386BE4);
  return result;
}

uint64_t sub_23A386BF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A386BF8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A386BFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A386C04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TemperatureRange.CodingKeys()
{
  return &type metadata for TemperatureRange.CodingKeys;
}

ValueMetadata *type metadata accessor for TemperatureRange.UnknownCodingKeys()
{
  return &type metadata for TemperatureRange.UnknownCodingKeys;
}

uint64_t storeEnumTagSinglePayload for TemperatureRange.SingularCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A386C70 + 4 * byte_23A3A945A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A386C90 + 4 * byte_23A3A945F[v4]))();
}

_BYTE *sub_23A386C70(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A386C90(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A386C98(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A386CA0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A386CA8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A386CB0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TemperatureRange.SingularCodingKeys()
{
  return &type metadata for TemperatureRange.SingularCodingKeys;
}

uint64_t storeEnumTagSinglePayload for TemperatureRange.RangeCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A386D18 + 4 * byte_23A3A9469[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A386D4C + 4 * byte_23A3A9464[v4]))();
}

uint64_t sub_23A386D4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A386D54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A386D5CLL);
  return result;
}

uint64_t sub_23A386D68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A386D70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A386D74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A386D7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TemperatureRange.RangeCodingKeys()
{
  return &type metadata for TemperatureRange.RangeCodingKeys;
}

unint64_t sub_23A386D9C()
{
  unint64_t result;

  result = qword_25696F830;
  if (!qword_25696F830)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9604, &type metadata for TemperatureRange.RangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F830);
  }
  return result;
}

unint64_t sub_23A386DE4()
{
  unint64_t result;

  result = qword_25696F838;
  if (!qword_25696F838)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A96BC, &type metadata for TemperatureRange.SingularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F838);
  }
  return result;
}

unint64_t sub_23A386E2C()
{
  unint64_t result;

  result = qword_25696F840;
  if (!qword_25696F840)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A97C4, &type metadata for TemperatureRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F840);
  }
  return result;
}

unint64_t sub_23A386E74()
{
  unint64_t result;

  result = qword_25696F848;
  if (!qword_25696F848)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A96E4, &type metadata for TemperatureRange.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F848);
  }
  return result;
}

unint64_t sub_23A386EBC()
{
  unint64_t result;

  result = qword_25696F850;
  if (!qword_25696F850)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A970C, &type metadata for TemperatureRange.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F850);
  }
  return result;
}

unint64_t sub_23A386F04()
{
  unint64_t result;

  result = qword_25696F858;
  if (!qword_25696F858)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A962C, &type metadata for TemperatureRange.SingularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F858);
  }
  return result;
}

unint64_t sub_23A386F4C()
{
  unint64_t result;

  result = qword_25696F860;
  if (!qword_25696F860)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9654, &type metadata for TemperatureRange.SingularCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F860);
  }
  return result;
}

unint64_t sub_23A386F94()
{
  unint64_t result;

  result = qword_25696F868;
  if (!qword_25696F868)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9574, &type metadata for TemperatureRange.RangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F868);
  }
  return result;
}

unint64_t sub_23A386FDC()
{
  unint64_t result;

  result = qword_25696F870;
  if (!qword_25696F870)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A959C, &type metadata for TemperatureRange.RangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F870);
  }
  return result;
}

unint64_t sub_23A387024()
{
  unint64_t result;

  result = qword_25696F878;
  if (!qword_25696F878)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9734, &type metadata for TemperatureRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F878);
  }
  return result;
}

unint64_t sub_23A38706C()
{
  unint64_t result;

  result = qword_25696F880;
  if (!qword_25696F880)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A975C, &type metadata for TemperatureRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F880);
  }
  return result;
}

uint64_t sub_23A3870B0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72616C75676E6973 && a2 == 0xE800000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65676E6172 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A3871EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A3872A4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23A387310()
{
  return 12383;
}

BOOL static LocationTimerPurpose.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LocationTimerPurpose.hash(into:)()
{
  return sub_23A3A86F0();
}

uint64_t LocationTimerPurpose.hashValue.getter()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

double LocationSettings.locationUpdateTimeout.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void LocationSettings.locationUpdateTimeout.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*LocationSettings.locationUpdateTimeout.modify())()
{
  return nullsub_1;
}

double LocationSettings.locationRetryInterval.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void LocationSettings.locationRetryInterval.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*LocationSettings.locationRetryInterval.modify())()
{
  return nullsub_1;
}

Swift::Double __swiftcall LocationSettings.timeout(forPurpose:)(DepthCore::LocationTimerPurpose forPurpose)
{
  Swift::Double *v1;
  Swift::Double *v2;

  if (*(_BYTE *)forPurpose)
    v2 = v1 + 1;
  else
    v2 = v1;
  return *v2;
}

unint64_t sub_23A3873FC()
{
  unint64_t result;

  result = qword_25696F888;
  if (!qword_25696F888)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for LocationTimerPurpose, &type metadata for LocationTimerPurpose);
    atomic_store(result, (unint64_t *)&qword_25696F888);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LocationTimerPurpose(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A38748C + 4 * byte_23A3A9965[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A3874C0 + 4 * byte_23A3A9960[v4]))();
}

uint64_t sub_23A3874C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3874C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A3874D0);
  return result;
}

uint64_t sub_23A3874DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A3874E4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A3874E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3874F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationTimerPurpose()
{
  return &type metadata for LocationTimerPurpose;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocationSettings(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LocationSettings(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LocationSettings()
{
  return &type metadata for LocationSettings;
}

double DepthValueRange.min.getter@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

double DepthValueRange.min.setter(double *a1)
{
  _QWORD *v1;
  double result;

  result = *a1;
  *v1 = *(_QWORD *)a1;
  return result;
}

uint64_t (*DepthValueRange.min.modify())()
{
  return nullsub_1;
}

double DepthValueRange.max.getter@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 8);
  *a1 = result;
  return result;
}

double DepthValueRange.max.setter(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 8) = *a1;
  return result;
}

uint64_t (*DepthValueRange.max.modify())()
{
  return nullsub_1;
}

double DepthValueRange.range.getter@<D0>(double *a1@<X8>)
{
  double *v1;
  double result;

  result = v1[1] - *v1;
  *a1 = result;
  return result;
}

DepthCore::DepthValueRange __swiftcall DepthValueRange.init(min:max:)(DepthCore::DepthValue min, DepthCore::DepthValue max)
{
  Swift::Double *v2;
  Swift::Double *v3;
  Swift::Double *v4;
  Swift::Double v5;
  Swift::Double v6;
  DepthCore::DepthValueRange result;

  v5 = *v2;
  v6 = *v3;
  *v4 = *v2;
  v4[1] = v6;
  result.max = *(DepthCore::DepthValue *)&v6;
  result.min = *(DepthCore::DepthValue *)&v5;
  return result;
}

uint64_t sub_23A3875E0(char a1)
{
  if ((a1 & 1) != 0)
    return 7889261;
  else
    return 7235949;
}

uint64_t sub_23A387608()
{
  char *v0;

  return sub_23A3875E0(*v0);
}

uint64_t sub_23A387610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A38AD88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A387634()
{
  sub_23A38A1A8();
  return sub_23A3A8720();
}

uint64_t sub_23A38765C()
{
  sub_23A38A1A8();
  return sub_23A3A872C();
}

uint64_t DepthValueRange.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F890);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38A1A8();
  sub_23A3A8714();
  v12 = v9;
  HIBYTE(v11) = 0;
  sub_23A38A1EC();
  sub_23A3A8660();
  if (!v2)
  {
    v12 = v8;
    HIBYTE(v11) = 1;
    sub_23A3A8660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t DepthValueRange.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F8A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38A1A8();
  sub_23A3A8708();
  if (!v2)
  {
    HIBYTE(v12) = 0;
    sub_23A38A230();
    sub_23A3A860C();
    v9 = v13;
    HIBYTE(v12) = 1;
    sub_23A3A860C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v13;
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_23A38794C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return DepthValueRange.init(from:)(a1, a2);
}

uint64_t sub_23A387960(_QWORD *a1)
{
  return DepthValueRange.encode(to:)(a1);
}

uint64_t DepthIntervalSummary.dateInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t DepthIntervalSummary.dateInterval.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*DepthIntervalSummary.dateInterval.modify())()
{
  return nullsub_1;
}

__n128 DepthIntervalSummary.depthRange.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for DepthIntervalSummary() + 20));
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t DepthIntervalSummary.depthRange.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = type metadata accessor for DepthIntervalSummary();
  v6 = v1 + *(int *)(result + 20);
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = v3;
  *(_BYTE *)(v6 + 16) = v4;
  return result;
}

uint64_t (*DepthIntervalSummary.depthRange.modify())()
{
  type metadata accessor for DepthIntervalSummary();
  return nullsub_1;
}

uint64_t sub_23A387A98(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E61526874706564;
  else
    return 0x65746E4965746164;
}

uint64_t sub_23A387ADC()
{
  char *v0;

  return sub_23A387A98(*v0);
}

uint64_t sub_23A387AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A38AE50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A387B08()
{
  sub_23A38A2B0();
  return sub_23A3A8720();
}

uint64_t sub_23A387B30()
{
  sub_23A38A2B0();
  return sub_23A3A872C();
}

uint64_t DepthIntervalSummary.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  __int128 *v9;
  char v10;
  _BYTE v12[16];
  __int128 v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F8B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38A2B0();
  sub_23A3A8714();
  LOBYTE(v13) = 0;
  sub_23A3A800C();
  sub_23A38B374(&qword_25696F8C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB888]);
  sub_23A3A8660();
  if (!v2)
  {
    v9 = (__int128 *)(v3 + *(int *)(type metadata accessor for DepthIntervalSummary() + 20));
    v10 = *((_BYTE *)v9 + 16);
    v13 = *v9;
    v14 = v10;
    v12[15] = 1;
    sub_23A38A2F4();
    sub_23A3A8630();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DepthIntervalSummary.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  char v26;
  char v27;

  v20 = a2;
  v23 = sub_23A3A800C();
  v21 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v22 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F8D8);
  v5 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DepthIntervalSummary();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &v11[*(int *)(v9 + 20)];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38A2B0();
  sub_23A3A8708();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v19 = a1;
  v13 = (uint64_t)v11;
  v14 = v21;
  LOBYTE(v25) = 0;
  sub_23A38B374(&qword_25696F8E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8A8]);
  v16 = v22;
  v15 = v23;
  sub_23A3A860C();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v16, v15);
  v27 = 1;
  sub_23A38A338();
  sub_23A3A85DC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v24);
  v17 = v26;
  *(_OWORD *)v12 = v25;
  v12[16] = v17;
  sub_23A38A37C(v13, v20);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  return sub_23A38A3C0(v13);
}

uint64_t sub_23A387F58@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DepthIntervalSummary.init(from:)(a1, a2);
}

uint64_t sub_23A387F6C(_QWORD *a1)
{
  return DepthIntervalSummary.encode(to:)(a1);
}

uint64_t sub_23A387F80@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v2 = v1;
  v4 = sub_23A3A809C();
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23A3A800C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v39 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v39 - v14;
  v16 = objc_msgSend(v2, sel_startDate);
  sub_23A3A8084();

  v17 = objc_msgSend(v2, sel_endDate);
  sub_23A3A8084();

  sub_23A3A7FE8();
  v18 = objc_msgSend(v2, sel_minimumQuantity);
  if (v18)
  {
    v19 = v18;
    v20 = objc_msgSend(v2, sel_maximumQuantity);
    if (v20)
    {
      v21 = v20;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v15, v6);
      v22 = (void *)objc_opt_self();
      v23 = objc_msgSend(v22, sel_meterUnit);
      objc_msgSend(v19, sel_doubleValueForUnit_, v23);
      v25 = v24;

      v26 = objc_msgSend(v22, sel_meterUnit);
      objc_msgSend(v21, sel_doubleValueForUnit_, v26);
      v28 = v27;

      (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v13, v6);
      result = type metadata accessor for DepthIntervalSummary();
      v30 = a1 + *(int *)(result + 20);
      *(_QWORD *)v30 = v25;
      *(_QWORD *)(v30 + 8) = v28;
      *(_BYTE *)(v30 + 16) = 0;
      return result;
    }

  }
  if (qword_25696F1C8 != -1)
    swift_once();
  v31 = sub_23A3A8180();
  __swift_project_value_buffer(v31, (uint64_t)qword_2569709C0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v15, v6);
  v32 = sub_23A3A8168();
  v33 = sub_23A3A8420();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v42 = v35;
    v40 = a1;
    *(_DWORD *)v34 = 136315138;
    v39 = v34 + 4;
    sub_23A38B374(&qword_25696FAD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8B8]);
    v36 = sub_23A3A8684();
    v41 = sub_23A37C734(v36, v37, &v42);
    a1 = v40;
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    _os_log_impl(&dword_23A377000, v32, v33, "DiveGraphDataProvider: Statistics exists for interval, but min/max not populated for dateInterval=%s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v35, -1, -1);
    MEMORY[0x23B84ADCC](v34, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v15, v6);
  result = type metadata accessor for DepthIntervalSummary();
  v38 = a1 + *(int *)(result + 20);
  *(_QWORD *)v38 = 0;
  *(_QWORD *)(v38 + 8) = 0;
  *(_BYTE *)(v38 + 16) = 1;
  return result;
}

uint64_t sub_23A3883D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_23A3A809C();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA80);
  v3[9] = swift_task_alloc();
  v5 = sub_23A3A827C();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA88);
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA90);
  v3[14] = swift_task_alloc();
  v6 = sub_23A3A8030();
  v3[15] = v6;
  v3[16] = *(_QWORD *)(v6 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA98);
  v3[19] = v7;
  v3[20] = *(_QWORD *)(v7 - 8);
  v3[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A38853C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = *(_QWORD *)(v0 + 32);
    v2 = (void *)objc_opt_self();
    *(_QWORD *)(v0 + 176) = v2;
    v3 = (void *)sub_23A3A80B4();
    v4 = objc_msgSend(v2, sel_predicateForObjectWithUUID_, v3);
    *(_QWORD *)(v0 + 184) = v4;

    __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAA8);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23A3A9210;
    sub_23A379D64(0, &qword_25696FAB0);
    v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_workoutType);
    sub_23A379D64(0, &qword_25696FAB8);
    v6 = v4;
    sub_23A3A8228();

    sub_23A3A824C();
    v7 = *(void **)(v1 + 16);
    *(_QWORD *)(v0 + 192) = v7;
    v8 = v7;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v9;
    *v9 = v0;
    v9[1] = sub_23A388830;
    return sub_23A3A8258();
  }
  else
  {
    if (qword_25696F1C8 != -1)
      swift_once();
    v11 = sub_23A3A8180();
    __swift_project_value_buffer(v11, (uint64_t)qword_2569709C0);
    v12 = sub_23A3A8168();
    v13 = sub_23A3A8414();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23A377000, v12, v13, "DiveGraphDataProvider: 0 intervals requested, returning empty summary array", v14, 2u);
      MEMORY[0x23B84ADCC](v14, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t sub_23A388830(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;

  v3 = *v2;
  v4 = *(void **)(*v2 + 192);
  *(_QWORD *)(v3 + 208) = a1;
  *(_QWORD *)(v3 + 216) = v1;
  swift_task_dealloc();

  return swift_task_switch();
}

void sub_23A3888A0()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD *v21;
  void *v22;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v1 = *(_QWORD *)(v0 + 208);
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_13:
    v22 = *(void **)(v0 + 184);
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v23 = sub_23A3A8570();
  swift_bridgeObjectRelease();
  if (!v23)
    goto LABEL_13;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x23B84A76C](0, *(_QWORD *)(v0 + 208));
  }
  else
  {
    if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_17;
    }
    v2 = *(id *)(*(_QWORD *)(v0 + 208) + 32);
  }
  *(_QWORD *)(v0 + 224) = v2;
  swift_bridgeObjectRelease();
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  *(_QWORD *)(v0 + 232) = v3;
  if (!v3)
  {
    v22 = *(void **)(v0 + 184);

LABEL_14:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
    return;
  }
  v4 = v3;
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 24);
  objc_msgSend(v3, sel_duration);
  v9 = ceil(v8 / (double)v7);
  v10 = sub_23A3A8138();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
  v11 = sub_23A3A8144();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
  if ((~*(_QWORD *)&v9 & 0x7FF0000000000000) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v9 > -9.22337204e18)
  {
    if (v9 < 9.22337204e18)
    {
      v12 = *(void **)(v0 + 176);
      v13 = *(_QWORD *)(v0 + 136);
      v14 = *(_QWORD *)(v0 + 144);
      v35 = *(_QWORD *)(v0 + 128);
      v36 = *(_QWORD *)(v0 + 120);
      v37 = *(_QWORD *)(v0 + 32);
      LOBYTE(v34) = 1;
      LOBYTE(v33) = 1;
      LOBYTE(v32) = 1;
      LOBYTE(v31) = 1;
      LOBYTE(v30) = 1;
      LOBYTE(v29) = 1;
      LOBYTE(v28) = 1;
      LOBYTE(v27) = 0;
      LOBYTE(v26) = 1;
      LOBYTE(v25) = 1;
      LOBYTE(v24) = 1;
      sub_23A3A8024();
      v15 = objc_retainAutoreleasedReturnValue(objc_msgSend(v12, sel_predicateForObjectsFromWorkout_, v4, 0, v24, 0, v25, 0, v26, (uint64_t)v9, v27, 0, v28, 0, v29, 0, v30, 0,
                v31,
                0,
                v32,
                0,
                v33,
                0,
                v34));
      *(_QWORD *)(v0 + 240) = v15;
      sub_23A379D64(0, (unint64_t *)&qword_25696F220);
      v16 = (void *)MEMORY[0x23B84A6A0]((id)*MEMORY[0x24BDD3698]);
      sub_23A379D64(0, &qword_25696F500);
      v17 = v15;
      sub_23A3A8228();

      v18 = objc_msgSend(v4, sel_startDate);
      sub_23A3A8084();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v13, v14, v36);
      sub_23A3A8270();
      v19 = *(void **)(v37 + 16);
      *(_QWORD *)(v0 + 248) = v19;
      v20 = v19;
      v21 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 256) = v21;
      *v21 = v0;
      v21[1] = sub_23A388CD8;
      sub_23A3A8264();
      return;
    }
    goto LABEL_19;
  }
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
}

uint64_t sub_23A388CD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  void *v5;

  v4 = *v2;
  v5 = *(void **)(*v2 + 248);
  *(_QWORD *)(*v2 + 264) = v1;
  swift_task_dealloc();

  if (!v1)
    *(_QWORD *)(v4 + 272) = a1;
  return swift_task_switch();
}

uint64_t sub_23A388D50()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(char *, uint64_t, uint64_t);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void (*v12)(char *, uint64_t, uint64_t);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 272);
  v13 = *(void **)(v0 + 240);
  v14 = *(void **)(v0 + 224);
  v3 = *(void **)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 144);
  v21 = *(_QWORD *)(v0 + 152);
  v22 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 120);
  v20 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 96);
  v18 = *(_QWORD *)(v0 + 128);
  v15 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 40);
  v8 = *(_QWORD *)(v0 + 24);
  v9 = objc_msgSend(*(id *)(v0 + 232), sel_startDate);
  sub_23A3A8084();

  v12 = sub_23A38B0B8(v2, v5, v4, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v4, v19);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v10 = swift_task_dealloc();
  if (!v1)
    v10 = (uint64_t)v12;
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_23A388EEC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A388FAC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 240);
  v2 = *(void **)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = *(_QWORD *)(v0 + 128);
  v7 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A3890AC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  unint64_t *v44;
  unint64_t v45;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v54)(char *, uint64_t);
  unint64_t *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v55 = a4;
  v63 = a2;
  v56 = sub_23A3A8030();
  v59 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v58 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A3A8138();
  v61 = *(_QWORD *)(v6 - 8);
  v62 = (void (*)(char *, uint64_t, uint64_t))v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A3A809C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v54 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v54 - v20;
  sub_23A3A8120();
  swift_beginAccess();
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v60 = a3;
  v23 = a3;
  v24 = v63;
  v22(v19, v23, v12);
  sub_23A3A8108();
  v25 = *(void (**)(char *, uint64_t))(v13 + 8);
  v57 = v19;
  v54 = v25;
  v25(v19, v12);
  (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v61 + 8))(v8, v62);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    v26 = v12;
    v62 = v22;
    sub_23A37D570((uint64_t)v11, &qword_25696F2D8);
    if (qword_25696F1C8 != -1)
      swift_once();
    v27 = sub_23A3A8180();
    __swift_project_value_buffer(v27, (uint64_t)qword_2569709C0);
    v29 = v58;
    v28 = v59;
    v30 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v58, v24, v56);
    v31 = sub_23A3A8168();
    v32 = sub_23A3A8420();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v63 = swift_slowAlloc();
      v65 = v63;
      *(_DWORD *)v33 = 136315394;
      v34 = v60;
      swift_beginAccess();
      v35 = v57;
      v62(v57, v34, v26);
      sub_23A38B374(&qword_25696FAE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v36 = sub_23A3A8684();
      v38 = v37;
      v54(v35, v26);
      v64 = sub_23A37C734(v36, v38, &v65);
      sub_23A3A84A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      sub_23A38B374(&qword_25696FAF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
      v39 = v58;
      v40 = sub_23A3A8684();
      v64 = sub_23A37C734(v40, v41, &v65);
      sub_23A3A84A4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v39, v30);
      _os_log_impl(&dword_23A377000, v31, v32, "DepthGraphDataProvider: Failed to create endDate from startDate=%s using components=%s", (uint8_t *)v33, 0x16u);
      v42 = v63;
      swift_arrayDestroy();
      MEMORY[0x23B84ADCC](v42, -1, -1);
      MEMORY[0x23B84ADCC](v33, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
    }

    sub_23A38B2E8();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    v43 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v43(v21, v11, v12);
    v63 = (uint64_t)v16;
    v22(v16, (uint64_t)v21, v12);
    v44 = v55;
    v45 = *v55;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v44 = v45;
    v47 = v12;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v45 = sub_23A3A620C(0, *(_QWORD *)(v45 + 16) + 1, 1, v45);
      *v44 = v45;
    }
    v49 = *(_QWORD *)(v45 + 16);
    v48 = *(_QWORD *)(v45 + 24);
    v50 = v63;
    if (v49 >= v48 >> 1)
    {
      v45 = sub_23A3A620C(v48 > 1, v49 + 1, 1, v45);
      *v44 = v45;
    }
    *(_QWORD *)(v45 + 16) = v49 + 1;
    v43((char *)(v45+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * v49), (char *)v50, v47);
    v51 = v57;
    v43(v57, v21, v47);
    v52 = v60;
    swift_beginAccess();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 40))(v52, v51, v47);
  }
}

uint64_t sub_23A38964C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;

  v2 = sub_23A3A809C();
  v50 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v49 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v48 = (char *)&v41 - v5;
  v47 = sub_23A3A800C();
  v6 = *(_QWORD *)(v47 - 8);
  v7 = MEMORY[0x24BDAC7A8](v47);
  v52 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v41 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAD8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v44 = (uint64_t)&v41 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAE0);
  v45 = *(_QWORD *)(v16 - 8);
  result = MEMORY[0x24BDAC7A8](v16);
  v43 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[3];
  v19 = a1[4];
  v21 = (v19 >> 1) - v20;
  if (__OFSUB__(v19 >> 1, v20))
  {
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  v23 = *a1;
  v22 = a1[1];
  v46 = a1[4];
  v24 = *(_QWORD *)(v23 + 16);
  v42 = a1[2];
  if (v21 >= v24)
    v25 = v24;
  else
    v25 = v21;
  v61 = MEMORY[0x24BEE4AF8];
  result = sub_23A3A663C(0, v25 & ~(v25 >> 63), 0);
  v53 = v23;
  v54 = 0;
  v55 = v22;
  v56 = v42;
  v57 = v20;
  v58 = v46;
  v59 = v20;
  v60 = 0;
  if (v25 < 0)
    goto LABEL_27;
  v46 = v16;
  if (v25)
  {
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    while (1)
    {
      sub_23A38AA40((uint64_t)v14);
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48))(v14, 1, v16);
      if ((_DWORD)result == 1)
        goto LABEL_28;
      v26 = &v14[*(int *)(v16 + 48)];
      v27 = v51;
      v28 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
      v28(v48, v14, v51);
      v28(v49, v26, v27);
      sub_23A3A7FE8();
      sub_23A37D570((uint64_t)v14, &qword_25696FAE0);
      v29 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23A3A663C(0, *(_QWORD *)(v29 + 16) + 1, 1);
        v29 = v61;
      }
      v31 = *(_QWORD *)(v29 + 16);
      v30 = *(_QWORD *)(v29 + 24);
      v16 = v46;
      if (v31 >= v30 >> 1)
      {
        sub_23A3A663C(v30 > 1, v31 + 1, 1);
        v29 = v61;
      }
      *(_QWORD *)(v29 + 16) = v31 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v29+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v31, v52, v47);
      v61 = v29;
      if (!--v25)
        goto LABEL_16;
    }
  }
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
LABEL_16:
  v32 = v44;
  sub_23A38AA40(v44);
  v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48);
  if (v33(v32, 1, v16) == 1)
  {
    v34 = v61;
  }
  else
  {
    v35 = (uint64_t)v43;
    do
    {
      sub_23A38B32C(v32, v35);
      v36 = v35 + *(int *)(v16 + 48);
      v37 = v51;
      v38 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
      v38(v48, v35, v51);
      v38(v49, v36, v37);
      sub_23A3A7FE8();
      sub_23A37D570(v35, &qword_25696FAE0);
      v34 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23A3A663C(0, *(_QWORD *)(v34 + 16) + 1, 1);
        v34 = v61;
      }
      v40 = *(_QWORD *)(v34 + 16);
      v39 = *(_QWORD *)(v34 + 24);
      v16 = v46;
      if (v40 >= v39 >> 1)
      {
        sub_23A3A663C(v39 > 1, v40 + 1, 1);
        v34 = v61;
      }
      *(_QWORD *)(v34 + 16) = v40 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v34+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v40, v10, v47);
      v61 = v34;
      v32 = v44;
      sub_23A38AA40(v44);
    }
    while (v33(v32, 1, v16) != 1);
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A37D570(v32, &qword_25696FAD8);
  return v34;
}

uint64_t sub_23A389B38@<X0>(char *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(_QWORD, _QWORD, _QWORD);
  uint64_t v33;
  void (*v34)(_QWORD, _QWORD);
  char *v35;
  void (*v36)(_QWORD, _QWORD, _QWORD);
  uint64_t v37;
  uint64_t result;
  char *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t *v60;
  char *v61;
  uint64_t v62;
  void (*v63)(_QWORD, _QWORD, _QWORD);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;

  v59 = a2;
  v60 = a3;
  v61 = (char *)a4;
  v6 = sub_23A3A800C();
  v7 = *(_QWORD *)(v6 - 8);
  v56 = v6;
  v57 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A3A809C();
  v62 = *(_QWORD *)(v9 - 8);
  v63 = (void (*)(_QWORD, _QWORD, _QWORD))v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A3A8138();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA88);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA90);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23A3A8030();
  v64 = *(_QWORD *)(v25 - 8);
  v65 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v66 = (char *)&v55 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = a1;
  sub_23A3A8000();
  v28 = fmod(v27 * 0.5, 1.0) * 1000000000.0;
  if ((~*(_QWORD *)&v28 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v28 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v28 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_9;
  }
  v58 = v4;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v24, 1, 1, v12);
  v29 = sub_23A3A8144();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v21, 1, 1, v29);
  v30 = (uint64_t)v18;
  v31 = v66;
  sub_23A3A8024();
  sub_23A3A8120();
  sub_23A3A7FF4();
  sub_23A3A8108();
  v33 = v62;
  v32 = v63;
  v34 = *(void (**)(_QWORD, _QWORD))(v62 + 8);
  v34(v11, v63);
  v35 = v15;
  v36 = v32;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v35, v12);
  LODWORD(v32) = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v33 + 48))(v30, 1, v32);
  sub_23A37D570(v30, &qword_25696F2D8);
  if ((_DWORD)v32 == 1)
  {
    sub_23A38B2E8();
    v37 = swift_allocError();
    swift_willThrow();
    result = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v31, v65);
    *v60 = v37;
    return result;
  }
  v39 = v31;
  v21 = v67;
  sub_23A3A7FF4();
  v40 = (void *)sub_23A3A8060();
  v34(v11, v36);
  v41 = objc_msgSend(v59, sel_statisticsForDate_, v40);

  if (v41)
  {
    sub_23A387F80((uint64_t)v61);

    return (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v39, v65);
  }
  if (qword_25696F1C8 != -1)
    goto LABEL_16;
LABEL_9:
  v42 = sub_23A3A8180();
  __swift_project_value_buffer(v42, (uint64_t)qword_2569709C0);
  v44 = v56;
  v43 = v57;
  v45 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  v46 = v55;
  v45(v55, v21, v56);
  v47 = sub_23A3A8168();
  v48 = sub_23A3A8420();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v50 = swift_slowAlloc();
    v69 = v50;
    v63 = (void (*)(_QWORD, _QWORD, _QWORD))v45;
    *(_DWORD *)v49 = 136315138;
    sub_23A38B374(&qword_25696FAD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8B8]);
    v51 = sub_23A3A8684();
    v68 = sub_23A37C734(v51, v52, &v69);
    v21 = v67;
    v45 = (void (*)(char *, char *, uint64_t))v63;
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v46, v44);
    _os_log_impl(&dword_23A377000, v47, v48, "DepthGraphDataProvider: Filling interval gap for interval=%s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v50, -1, -1);
    MEMORY[0x23B84ADCC](v49, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v44);
  }
  (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v65);
  v53 = (uint64_t)v61;
  v45(v61, v21, v44);
  result = type metadata accessor for DepthIntervalSummary();
  v54 = v53 + *(int *)(result + 20);
  *(_QWORD *)v54 = 0;
  *(_QWORD *)(v54 + 8) = 0;
  *(_BYTE *)(v54 + 16) = 1;
  return result;
}

uint64_t sub_23A38A184()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

unint64_t sub_23A38A1A8()
{
  unint64_t result;

  result = qword_25696F898;
  if (!qword_25696F898)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9D44, &type metadata for DepthValueRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F898);
  }
  return result;
}

unint64_t sub_23A38A1EC()
{
  unint64_t result;

  result = qword_25696F8A0;
  if (!qword_25696F8A0)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthValue, &type metadata for DepthValue);
    atomic_store(result, (unint64_t *)&qword_25696F8A0);
  }
  return result;
}

unint64_t sub_23A38A230()
{
  unint64_t result;

  result = qword_25696F8B0;
  if (!qword_25696F8B0)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthValue, &type metadata for DepthValue);
    atomic_store(result, (unint64_t *)&qword_25696F8B0);
  }
  return result;
}

uint64_t type metadata accessor for DepthIntervalSummary()
{
  uint64_t result;

  result = qword_25696F948;
  if (!qword_25696F948)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23A38A2B0()
{
  unint64_t result;

  result = qword_25696F8C0;
  if (!qword_25696F8C0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9CF4, &type metadata for DepthIntervalSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696F8C0);
  }
  return result;
}

unint64_t sub_23A38A2F4()
{
  unint64_t result;

  result = qword_25696F8D0;
  if (!qword_25696F8D0)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthValueRange, &type metadata for DepthValueRange);
    atomic_store(result, (unint64_t *)&qword_25696F8D0);
  }
  return result;
}

unint64_t sub_23A38A338()
{
  unint64_t result;

  result = qword_25696F8E8;
  if (!qword_25696F8E8)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthValueRange, &type metadata for DepthValueRange);
    atomic_store(result, (unint64_t *)&qword_25696F8E8);
  }
  return result;
}

uint64_t sub_23A38A37C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DepthIntervalSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A38A3C0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DepthIntervalSummary();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DepthValueRange()
{
  return &type metadata for DepthValueRange;
}

uint64_t *initializeBufferWithCopyOfBuffer for DepthIntervalSummary(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_23A3A800C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    *(_OWORD *)v9 = *(_OWORD *)v10;
    v9[16] = v10[16];
  }
  return a1;
}

uint64_t destroy for DepthIntervalSummary(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23A3A800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t assignWithCopy for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v6 = sub_23A3A800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_BYTE *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = v10;
  return a1;
}

uint64_t initializeWithTake for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23A3A800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t assignWithTake for DepthIntervalSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23A3A800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthIntervalSummary()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A38A694(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DepthIntervalSummary()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A38A6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_23A38A71C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A3A800C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for DiveGraphDataProvider()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for DepthIntervalSummary.CodingKeys()
{
  return &type metadata for DepthIntervalSummary.CodingKeys;
}

uint64_t _s9DepthCore20DepthIntervalSummaryV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A38A810 + 4 * byte_23A3A9A35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A38A844 + 4 * asc_23A3A9A30[v4]))();
}

uint64_t sub_23A38A844(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A38A84C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A38A854);
  return result;
}

uint64_t sub_23A38A860(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A38A868);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A38A86C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A38A874(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DepthValueRange.CodingKeys()
{
  return &type metadata for DepthValueRange.CodingKeys;
}

unint64_t sub_23A38A894()
{
  unint64_t result;

  result = qword_25696FA50;
  if (!qword_25696FA50)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9C14, &type metadata for DepthValueRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FA50);
  }
  return result;
}

unint64_t sub_23A38A8DC()
{
  unint64_t result;

  result = qword_25696FA58;
  if (!qword_25696FA58)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9CCC, &type metadata for DepthIntervalSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FA58);
  }
  return result;
}

unint64_t sub_23A38A924()
{
  unint64_t result;

  result = qword_25696FA60;
  if (!qword_25696FA60)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9C3C, &type metadata for DepthIntervalSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FA60);
  }
  return result;
}

unint64_t sub_23A38A96C()
{
  unint64_t result;

  result = qword_25696FA68;
  if (!qword_25696FA68)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9C64, &type metadata for DepthIntervalSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FA68);
  }
  return result;
}

unint64_t sub_23A38A9B4()
{
  unint64_t result;

  result = qword_25696FA70;
  if (!qword_25696FA70)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9B84, &type metadata for DepthValueRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FA70);
  }
  return result;
}

unint64_t sub_23A38A9FC()
{
  unint64_t result;

  result = qword_25696FA78;
  if (!qword_25696FA78)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9BAC, &type metadata for DepthValueRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FA78);
  }
  return result;
}

uint64_t sub_23A38AA40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, char *, uint64_t);
  void (*v31)(char *, unint64_t, uint64_t);
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v29 - v7;
  v9 = sub_23A3A809C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v29 - v15;
  if (*(_BYTE *)(v1 + 56) == 1)
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAE0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a1, 1, 1, v17);
  }
  v18 = *(_QWORD *)(v1 + 8);
  v19 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v18 == v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    v6 = v8;
LABEL_14:
    sub_23A37D570((uint64_t)v6, &qword_25696F2D8);
    *(_BYTE *)(v1 + 56) = 1;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAE0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a1, 1, 1, v25);
  }
  if (v18 >= v19)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  v20 = *(_QWORD *)(v10 + 72);
  v21 = *(_QWORD *)v1
      + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
      + v20 * v18;
  v31 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
  v31(v8, v21, v9);
  *(_QWORD *)(v1 + 8) = v18 + 1;
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v32(v8, 0, 1, v9);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v22(v8, 1, v9) == 1)
  {
    v6 = v8;
    goto LABEL_14;
  }
  v30 = *(uint64_t (**)(char *, char *, uint64_t))(v10 + 32);
  result = v30(v16, v8, v9);
  v23 = *(_QWORD *)(v1 + 48);
  v24 = *(_QWORD *)(v1 + 40) >> 1;
  if (v23 == v24)
  {
    v32(v6, 1, 1, v9);
LABEL_13:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_14;
  }
  if (v23 >= v24 || v23 < *(_QWORD *)(v1 + 32))
    goto LABEL_17;
  v31(v6, *(_QWORD *)(v1 + 24) + v23 * v20, v9);
  *(_QWORD *)(v1 + 48) = v23 + 1;
  v32(v6, 0, 1, v9);
  if (v22(v6, 1, v9) == 1)
    goto LABEL_13;
  v26 = (void (*)(uint64_t, char *, uint64_t))v30;
  v30(v13, v6, v9);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAE0);
  v28 = a1 + *(int *)(v27 + 48);
  v26(a1, v16, v9);
  v26(v28, v13, v9);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(a1, 0, 1, v27);
}

uint64_t sub_23A38AD88(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7235949 && a2 == 0xE300000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7889261 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A38AE50(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65746E4965746164 && a2 == 0xEC0000006C617672;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E61526874706564 && a2 == 0xEA00000000006567)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A38AF50(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v17 = a2;
  v5 = type metadata accessor for DepthIntervalSummary();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_23A3A6610(0, v9, 0);
    v10 = v19;
    v11 = *(_QWORD *)(sub_23A3A800C() - 8);
    v12 = (char *)(a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)));
    v13 = *(_QWORD *)(v11 + 72);
    while (1)
    {
      sub_23A389B38(v12, v17, &v18, (uint64_t)v8);
      if (v3)
        break;
      v3 = 0;
      v19 = v10;
      v15 = *(_QWORD *)(v10 + 16);
      v14 = *(_QWORD *)(v10 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_23A3A6610(v14 > 1, v15 + 1, 1);
        v10 = v19;
      }
      *(_QWORD *)(v10 + 16) = v15 + 1;
      sub_23A38B2A4((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v15);
      v12 += v13;
      if (!--v9)
        return v10;
    }
    swift_release();
  }
  return v10;
}

void (*sub_23A38B0B8(void (*a1)(char *, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4))(char *, uint64_t, uint64_t)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  void (*v20)(char *, uint64_t, uint64_t);
  char v21[8];
  uint64_t v22[5];
  uint64_t v23;

  v20 = a1;
  v8 = sub_23A3A809C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, a2, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAC0);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_23A3A9210;
  v12((char *)(v14 + v13), (uint64_t)v11, v8);
  v23 = v14;
  if (a4)
  {
    while (1)
    {
      sub_23A3890AC((uint64_t)v21, a3, (uint64_t)v11, (unint64_t *)&v23);
      if (v4)
        break;
      if (!--a4)
      {
        v14 = v23;
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v12 = v20;
    v15 = *(_QWORD *)(v14 + 16);
    v22[0] = v14;
    v22[1] = v14;
    v22[2] = v14 + v13;
    v22[3] = v15 != 0;
    v22[4] = (2 * v15) | 1;
    swift_bridgeObjectRetain();
    v16 = sub_23A38964C(v22);
    swift_bridgeObjectRelease();
    v17 = v12;
    v18 = sub_23A38AF50(v16, v17);
    if (!v4)
    {
      v12 = (void (*)(char *, uint64_t, uint64_t))v18;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      return v12;
    }

    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v12;
}

uint64_t sub_23A38B2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DepthIntervalSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23A38B2E8()
{
  unint64_t result;

  result = qword_25696FAC8;
  if (!qword_25696FAC8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9E24, &type metadata for DiveGraphDataProvider.DiveGraphDataProviderError);
    atomic_store(result, (unint64_t *)&qword_25696FAC8);
  }
  return result;
}

uint64_t sub_23A38B32C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A38B374(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B84AD3C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DiveGraphDataProvider.DiveGraphDataProviderError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A38B3F4 + 4 * byte_23A3A9A3A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A38B414 + 4 * byte_23A3A9A3F[v4]))();
}

_BYTE *sub_23A38B3F4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A38B414(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A38B41C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A38B424(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A38B42C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A38B434(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DiveGraphDataProvider.DiveGraphDataProviderError()
{
  return &type metadata for DiveGraphDataProvider.DiveGraphDataProviderError;
}

unint64_t sub_23A38B454()
{
  unint64_t result;

  result = qword_25696FAF8;
  if (!qword_25696FAF8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3A9DFC, &type metadata for DiveGraphDataProvider.DiveGraphDataProviderError);
    atomic_store(result, (unint64_t *)&qword_25696FAF8);
  }
  return result;
}

BOOL BatteryLevel.isLow.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 4) == 1;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for BatteryLevel(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryLevel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A38B554(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 4) <= 1u)
    return *(unsigned __int8 *)(a1 + 4);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23A38B56C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 4) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BatteryLevel()
{
  return &type metadata for BatteryLevel;
}

DepthCore::TemperatureValue __swiftcall TemperatureValue.init(value:inUnit:)(DepthCore::TemperatureValue value, DepthCore::WaterTemperatureUnit inUnit)
{
  double *v2;

  if (*(_BYTE *)inUnit)
    value.canonicalValue = (value.canonicalValue + -32.0) * 0.555555556;
  *v2 = value.canonicalValue;
  return value;
}

Swift::Double __swiftcall TemperatureValue.value(forUnit:)(DepthCore::WaterTemperatureUnit forUnit)
{
  Swift::Double *v1;
  Swift::Double result;

  result = *v1;
  if (*(_BYTE *)forUnit == 1)
    return result / 0.555555556 + 32.0;
  return result;
}

id WaterTemperatureUnit.unitTemperature.getter()
{
  unsigned __int8 *v0;
  int v1;
  void *v2;
  char **v3;

  v1 = *v0;
  v2 = (void *)objc_opt_self();
  v3 = &selRef_fahrenheit;
  if (!v1)
    v3 = &selRef_celsius;
  return objc_msgSend(v2, *v3);
}

BOOL static TemperatureValue.< infix(_:_:)(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL static TemperatureValue.> infix(_:_:)(double *a1, double *a2)
{
  return *a2 < *a1;
}

BOOL static TemperatureValue.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2;
}

void Temperature.temperature.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
  char v2;
  uint64_t v3;

  v2 = *((_BYTE *)v1 + 8);
  if ((v2 & 1) != 0)
    v3 = 0;
  else
    v3 = *v1;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t sub_23A38B694(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74617265706D6574;
  else
    return 0x6E776F6E6B6E75;
}

uint64_t sub_23A38B6D4()
{
  char *v0;

  return sub_23A38B694(*v0);
}

uint64_t sub_23A38B6DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A38CB74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A38B700()
{
  sub_23A38BA28();
  return sub_23A3A8720();
}

uint64_t sub_23A38B728()
{
  sub_23A38BA28();
  return sub_23A3A872C();
}

uint64_t sub_23A38B758()
{
  sub_23A38BA6C();
  return sub_23A3A8720();
}

uint64_t sub_23A38B780()
{
  sub_23A38BA6C();
  return sub_23A3A872C();
}

uint64_t sub_23A38B7A8()
{
  sub_23A38BAB0();
  return sub_23A3A8720();
}

uint64_t sub_23A38B7D0()
{
  sub_23A38BAB0();
  return sub_23A3A872C();
}

uint64_t Temperature.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB00);
  v19 = *(_QWORD *)(v3 - 8);
  v20 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB08);
  v17 = *(_QWORD *)(v6 - 8);
  v18 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB10);
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  v13 = *((_BYTE *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38BA28();
  sub_23A3A8714();
  if ((v13 & 1) != 0)
  {
    v22 = 0;
    sub_23A38BAB0();
    sub_23A3A8624();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v18);
  }
  else
  {
    v24 = 1;
    sub_23A38BA6C();
    sub_23A3A8624();
    v23 = v12;
    sub_23A3868D4();
    v15 = v20;
    sub_23A3A8660();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v11, v9);
}

unint64_t sub_23A38BA28()
{
  unint64_t result;

  result = qword_25696FB18;
  if (!qword_25696FB18)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA490, &type metadata for Temperature.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB18);
  }
  return result;
}

unint64_t sub_23A38BA6C()
{
  unint64_t result;

  result = qword_25696FB20;
  if (!qword_25696FB20)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA440, &type metadata for Temperature.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB20);
  }
  return result;
}

unint64_t sub_23A38BAB0()
{
  unint64_t result;

  result = qword_25696FB28;
  if (!qword_25696FB28)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA3F0, &type metadata for Temperature.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB28);
  }
  return result;
}

uint64_t Temperature.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  char *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;

  v36 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB30);
  v4 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  v35 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB38);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB40);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  sub_23A38BA28();
  v15 = v39;
  sub_23A3A8708();
  if (v15)
    goto LABEL_7;
  v16 = v7;
  v33 = v6;
  v17 = v37;
  v39 = v11;
  v18 = v13;
  v19 = sub_23A3A8618();
  v20 = v10;
  if (*(_QWORD *)(v19 + 16) != 1)
  {
    v28 = sub_23A3A8510();
    swift_allocError();
    v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F820);
    *v30 = &type metadata for Temperature;
    sub_23A3A85D0();
    sub_23A3A8504();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v30, *MEMORY[0x24BEE26D0], v28);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
LABEL_7:
    v27 = (uint64_t)v38;
    return __swift_destroy_boxed_opaque_existential_0(v27);
  }
  v21 = *(_BYTE *)(v19 + 32);
  if ((v21 & 1) != 0)
  {
    LODWORD(v33) = *(unsigned __int8 *)(v19 + 32);
    v42 = 1;
    sub_23A38BA6C();
    v22 = v17;
    v23 = v20;
    sub_23A3A85C4();
    sub_23A3869A0();
    v24 = v22;
    v25 = v34;
    sub_23A3A860C();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v18, v23);
    v26 = v40;
    v27 = (uint64_t)v38;
    v21 = v33;
  }
  else
  {
    v41 = 0;
    sub_23A38BAB0();
    sub_23A3A85C4();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v20);
    v26 = 0;
    v27 = (uint64_t)v38;
  }
  v32 = v36;
  *v36 = v26;
  *((_BYTE *)v32 + 8) = v21 ^ 1;
  return __swift_destroy_boxed_opaque_existential_0(v27);
}

uint64_t sub_23A38BE98@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return Temperature.init(from:)(a1, a2);
}

uint64_t sub_23A38BEAC(_QWORD *a1)
{
  return Temperature.encode(to:)(a1);
}

uint64_t static Temperature.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a2 + 8);
  if ((v2 & 1) != 0)
  {
    if ((v3 & 1) != 0)
      return 0;
    return v2 & (v3 ^ 1u);
  }
  if ((v3 & 1) != 0)
    return v2 & (v3 ^ 1u);
  return *(double *)a1 != *(double *)a2 && *(double *)a1 < *(double *)a2;
}

uint64_t static Temperature.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  uint64_t result;

  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a2 + 8);
  result = v3 & v4;
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
    return *(double *)a1 == *(double *)a2;
  return result;
}

uint64_t sub_23A38BF38(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a2 + 8);
  if ((v2 & 1) != 0)
  {
    if ((v3 & 1) != 0)
      return 0;
    return v2 & (v3 ^ 1u);
  }
  if ((v3 & 1) != 0)
    return v2 & (v3 ^ 1u);
  if (*(double *)a1 == *(double *)a2)
    return 0;
  return *(double *)a1 < *(double *)a2;
}

uint64_t sub_23A38BF7C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) != 0)
  {
    if ((v2 & 1) != 0)
      return 1;
    return v3 & (v2 ^ 1) ^ 1u;
  }
  if ((v2 & 1) != 0)
    return v3 & (v2 ^ 1) ^ 1u;
  if (*(double *)a2 == *(double *)a1)
    return 1;
  return *(double *)a2 >= *(double *)a1;
}

uint64_t sub_23A38BFC8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a2 + 8);
  if ((v2 & 1) != 0)
  {
    if ((v3 & 1) != 0)
      return 1;
    return v2 & (v3 ^ 1) ^ 1u;
  }
  if ((v3 & 1) != 0)
    return v2 & (v3 ^ 1) ^ 1u;
  if (*(double *)a1 == *(double *)a2)
    return 1;
  return *(double *)a1 >= *(double *)a2;
}

uint64_t sub_23A38C014(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) != 0)
  {
    if ((v2 & 1) != 0)
      return 0;
    return v3 & (v2 ^ 1u);
  }
  if ((v2 & 1) != 0)
    return v3 & (v2 ^ 1u);
  if (*(double *)a2 == *(double *)a1)
    return 0;
  return *(double *)a2 < *(double *)a1;
}

uint64_t sub_23A38C058(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  uint64_t result;

  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a2 + 8);
  result = v3 & v4;
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
    return *(double *)a1 == *(double *)a2;
  return result;
}

BOOL static WaterTemperatureUnit.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WaterTemperatureUnit.hash(into:)()
{
  return sub_23A3A86F0();
}

uint64_t WaterTemperatureUnit.hashValue.getter()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

uint64_t sub_23A38C110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A38CC6C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A38C138()
{
  sub_23A38C270();
  return sub_23A3A8720();
}

uint64_t sub_23A38C160()
{
  sub_23A38C270();
  return sub_23A3A872C();
}

uint64_t TemperatureValue.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB48);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38C270();
  sub_23A3A8714();
  sub_23A3A8654();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23A38C270()
{
  unint64_t result;

  result = qword_25696FB50;
  if (!qword_25696FB50)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA3A0, &type metadata for TemperatureValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB50);
  }
  return result;
}

uint64_t TemperatureValue.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB58);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38C270();
  sub_23A3A8708();
  if (!v2)
  {
    sub_23A3A8600();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_23A38C3C4()
{
  unint64_t result;

  result = qword_25696FB60;
  if (!qword_25696FB60)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for Temperature, &type metadata for Temperature);
    atomic_store(result, (unint64_t *)&qword_25696FB60);
  }
  return result;
}

unint64_t sub_23A38C40C()
{
  unint64_t result;

  result = qword_25696FB68;
  if (!qword_25696FB68)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for WaterTemperatureUnit, &type metadata for WaterTemperatureUnit);
    atomic_store(result, (unint64_t *)&qword_25696FB68);
  }
  return result;
}

uint64_t sub_23A38C450@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return TemperatureValue.init(from:)(a1, a2);
}

uint64_t sub_23A38C464(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FB48);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38C270();
  sub_23A3A8714();
  sub_23A3A8654();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23A38C550()
{
  unint64_t result;

  result = qword_25696FB70;
  if (!qword_25696FB70)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for TemperatureValue, &type metadata for TemperatureValue);
    atomic_store(result, (unint64_t *)&qword_25696FB70);
  }
  return result;
}

BOOL sub_23A38C594(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL sub_23A38C5A8(double *a1, double *a2)
{
  return *a2 >= *a1;
}

BOOL sub_23A38C5BC(double *a1, double *a2)
{
  return *a1 >= *a2;
}

BOOL sub_23A38C5D0(double *a1, double *a2)
{
  return *a2 < *a1;
}

BOOL sub_23A38C5E4(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Temperature(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Temperature(uint64_t result, int a2, int a3)
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

uint64_t sub_23A38C65C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A38C678(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Temperature()
{
  return &type metadata for Temperature;
}

ValueMetadata *type metadata accessor for WaterTemperatureUnit()
{
  return &type metadata for WaterTemperatureUnit;
}

ValueMetadata *type metadata accessor for TemperatureValue()
{
  return &type metadata for TemperatureValue;
}

ValueMetadata *type metadata accessor for TemperatureValue.CodingKeys()
{
  return &type metadata for TemperatureValue.CodingKeys;
}

uint64_t _s9DepthCore20WaterTemperatureUnitOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A38C730 + 4 * byte_23A3A9E95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A38C764 + 4 * byte_23A3A9E90[v4]))();
}

uint64_t sub_23A38C764(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A38C76C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A38C774);
  return result;
}

uint64_t sub_23A38C780(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A38C788);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A38C78C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A38C794(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Temperature.CodingKeys()
{
  return &type metadata for Temperature.CodingKeys;
}

ValueMetadata *type metadata accessor for Temperature.UnknownCodingKeys()
{
  return &type metadata for Temperature.UnknownCodingKeys;
}

uint64_t _s9DepthCore16TemperatureValueV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A38C800 + 4 * byte_23A3A9E9A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A38C820 + 4 * byte_23A3A9E9F[v4]))();
}

_BYTE *sub_23A38C800(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A38C820(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A38C828(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A38C830(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A38C838(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A38C840(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Temperature.TemperatureCodingKeys()
{
  return &type metadata for Temperature.TemperatureCodingKeys;
}

unint64_t sub_23A38C860()
{
  unint64_t result;

  result = qword_25696FB78;
  if (!qword_25696FB78)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA1B8, &type metadata for Temperature.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB78);
  }
  return result;
}

unint64_t sub_23A38C8A8()
{
  unint64_t result;

  result = qword_25696FB80;
  if (!qword_25696FB80)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA2C0, &type metadata for Temperature.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB80);
  }
  return result;
}

unint64_t sub_23A38C8F0()
{
  unint64_t result;

  result = qword_25696FB88;
  if (!qword_25696FB88)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA378, &type metadata for TemperatureValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB88);
  }
  return result;
}

unint64_t sub_23A38C938()
{
  unint64_t result;

  result = qword_25696FB90;
  if (!qword_25696FB90)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA2E8, &type metadata for TemperatureValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB90);
  }
  return result;
}

unint64_t sub_23A38C980()
{
  unint64_t result;

  result = qword_25696FB98;
  if (!qword_25696FB98)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA310, &type metadata for TemperatureValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FB98);
  }
  return result;
}

unint64_t sub_23A38C9C8()
{
  unint64_t result;

  result = qword_25696FBA0;
  if (!qword_25696FBA0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA1E0, &type metadata for Temperature.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FBA0);
  }
  return result;
}

unint64_t sub_23A38CA10()
{
  unint64_t result;

  result = qword_25696FBA8;
  if (!qword_25696FBA8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA208, &type metadata for Temperature.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FBA8);
  }
  return result;
}

unint64_t sub_23A38CA58()
{
  unint64_t result;

  result = qword_25696FBB0;
  if (!qword_25696FBB0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA128, &type metadata for Temperature.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FBB0);
  }
  return result;
}

unint64_t sub_23A38CAA0()
{
  unint64_t result;

  result = qword_25696FBB8;
  if (!qword_25696FBB8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA150, &type metadata for Temperature.TemperatureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FBB8);
  }
  return result;
}

unint64_t sub_23A38CAE8()
{
  unint64_t result;

  result = qword_25696FBC0;
  if (!qword_25696FBC0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA230, &type metadata for Temperature.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FBC0);
  }
  return result;
}

unint64_t sub_23A38CB30()
{
  unint64_t result;

  result = qword_25696FBC8;
  if (!qword_25696FBC8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA258, &type metadata for Temperature.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FBC8);
  }
  return result;
}

uint64_t sub_23A38CB74(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74617265706D6574 && a2 == 0xEB00000000657275)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A38CC6C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6163696E6F6E6163 && a2 == 0xEE0065756C61566CLL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23A38CD08()
{
  return 0x6163696E6F6E6163;
}

uint64_t SessionSummary.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A3A80F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*SessionSummary.id.modify())()
{
  return nullsub_1;
}

uint64_t SessionSummary.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 20);
  v4 = sub_23A3A809C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SessionSummary()
{
  uint64_t result;

  result = qword_25696FC90;
  if (!qword_25696FC90)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SessionSummary.startDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 20);
  v4 = sub_23A3A809C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*SessionSummary.startDate.modify())()
{
  type metadata accessor for SessionSummary();
  return nullsub_1;
}

uint64_t SessionSummary.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 24);
  v4 = sub_23A3A809C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SessionSummary.endDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SessionSummary() + 24);
  v4 = sub_23A3A809C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*SessionSummary.endDate.modify())()
{
  type metadata accessor for SessionSummary();
  return nullsub_1;
}

uint64_t SessionSummary.maxDepth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;

  result = type metadata accessor for SessionSummary();
  v4 = (uint64_t *)(v1 + *(int *)(result + 28));
  v5 = *v4;
  LOBYTE(v4) = *((_BYTE *)v4 + 8);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t SessionSummary.maxDepth.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  result = type metadata accessor for SessionSummary();
  v5 = v1 + *(int *)(result + 28);
  *(_QWORD *)v5 = v2;
  *(_BYTE *)(v5 + 8) = v3;
  return result;
}

uint64_t (*SessionSummary.maxDepth.modify())()
{
  type metadata accessor for SessionSummary();
  return nullsub_1;
}

__n128 SessionSummary.temperatureRange.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for SessionSummary() + 32));
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t SessionSummary.temperatureRange.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = type metadata accessor for SessionSummary();
  v6 = v1 + *(int *)(result + 32);
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = v3;
  *(_BYTE *)(v6 + 16) = v4;
  return result;
}

uint64_t (*SessionSummary.temperatureRange.modify())()
{
  type metadata accessor for SessionSummary();
  return nullsub_1;
}

uint64_t SessionSummary.underwaterTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v4 = type metadata accessor for SessionSummary();
  v5 = v1 + *(int *)(v4 + 20);
  v6 = sub_23A3A809C();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, v5, v6);
  v7(v3, v1 + *(int *)(v4 + 24), v6);
  type metadata accessor for UnderwaterTime();
  return swift_storeEnumTagMultiPayload();
}

uint64_t SessionSummary.init(id:startDate:endDate:maxDepth:temperatureRange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v10 = *a4;
  v11 = *((_BYTE *)a4 + 8);
  v12 = a5[1];
  v22 = *a5;
  v21 = *((_BYTE *)a5 + 16);
  v13 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a6, a1, v13);
  v14 = (int *)type metadata accessor for SessionSummary();
  v15 = a6 + v14[5];
  v16 = sub_23A3A809C();
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
  v17(v15, a2, v16);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v17)(a6 + v14[6], a3, v16);
  v19 = a6 + v14[7];
  *(_QWORD *)v19 = v10;
  *(_BYTE *)(v19 + 8) = v11;
  v20 = a6 + v14[8];
  *(_QWORD *)v20 = v22;
  *(_QWORD *)(v20 + 8) = v12;
  *(_BYTE *)(v20 + 16) = v21;
  return result;
}

uint64_t sub_23A38D214(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A38D24C + 4 * byte_23A3AA4E0[a1]))(0xD000000000000010, 0x800000023A3ADB60);
}

uint64_t sub_23A38D24C()
{
  return 25705;
}

uint64_t sub_23A38D258()
{
  return 0x7461447472617473;
}

uint64_t sub_23A38D274()
{
  return 0x65746144646E65;
}

uint64_t sub_23A38D28C()
{
  return 0x687470654478616DLL;
}

uint64_t sub_23A38D2A4()
{
  unsigned __int8 *v0;

  return sub_23A38D214(*v0);
}

uint64_t sub_23A38D2AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A38F294(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A38D2D0(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23A38D2DC()
{
  sub_23A38D594();
  return sub_23A3A8720();
}

uint64_t sub_23A38D304()
{
  sub_23A38D594();
  return sub_23A3A872C();
}

uint64_t SessionSummary.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __int128 *v12;
  char v13;
  __int128 v15;
  char v16;
  char v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FBD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38D594();
  sub_23A3A8714();
  LOBYTE(v15) = 0;
  sub_23A3A80F0();
  sub_23A38B374(&qword_25696FBE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23A3A8660();
  if (!v2)
  {
    v9 = type metadata accessor for SessionSummary();
    LOBYTE(v15) = 1;
    sub_23A3A809C();
    sub_23A38B374(&qword_25696FBE8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_23A3A8660();
    LOBYTE(v15) = 2;
    sub_23A3A8660();
    v10 = (uint64_t *)(v3 + *(int *)(v9 + 28));
    v11 = *v10;
    LOBYTE(v10) = *((_BYTE *)v10 + 8);
    *(_QWORD *)&v15 = v11;
    BYTE8(v15) = (_BYTE)v10;
    v17 = 3;
    sub_23A38D5D8();
    sub_23A3A8660();
    v12 = (__int128 *)(v3 + *(int *)(v9 + 32));
    v13 = *((_BYTE *)v12 + 16);
    v15 = *v12;
    v16 = v13;
    v17 = 4;
    sub_23A38D61C();
    sub_23A3A8660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23A38D594()
{
  unint64_t result;

  result = qword_25696FBD8;
  if (!qword_25696FBD8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA6D4, &type metadata for SessionSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FBD8);
  }
  return result;
}

unint64_t sub_23A38D5D8()
{
  unint64_t result;

  result = qword_25696FBF0;
  if (!qword_25696FBF0)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for WaterDepth, &type metadata for WaterDepth);
    atomic_store(result, (unint64_t *)&qword_25696FBF0);
  }
  return result;
}

unint64_t sub_23A38D61C()
{
  unint64_t result;

  result = qword_25696FBF8;
  if (!qword_25696FBF8)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for TemperatureRange, &type metadata for TemperatureRange);
    atomic_store(result, (unint64_t *)&qword_25696FBF8);
  }
  return result;
}

uint64_t SessionSummary.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _QWORD *v47;
  __int128 v48;
  char v49;
  char v50;

  v38 = a2;
  v3 = sub_23A3A809C();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v39 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)v35 - v6;
  v44 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FC00);
  v9 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SessionSummary();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A38D594();
  v45 = v11;
  v15 = (uint64_t)v47;
  sub_23A3A8708();
  if (v15)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v36 = v12;
  v37 = v9;
  v47 = a1;
  v16 = v14;
  v18 = v40;
  v17 = v41;
  v19 = v42;
  LOBYTE(v48) = 0;
  sub_23A38B374(&qword_25696FC08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v20 = v43;
  v21 = v44;
  sub_23A3A860C();
  v35[1] = v7;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v20, v21);
  LOBYTE(v48) = 1;
  sub_23A38B374(&qword_25696FC10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v22 = v18;
  v23 = v19;
  sub_23A3A860C();
  v24 = &v16[*(int *)(v36 + 20)];
  v25 = v17;
  v26 = (uint64_t)v16;
  v27 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
  v27(v24, v22, v19);
  LOBYTE(v48) = 2;
  v28 = v39;
  sub_23A3A860C();
  v29 = v36;
  v27((char *)(v26 + *(int *)(v36 + 24)), v28, v23);
  v50 = 3;
  sub_23A38DB18();
  sub_23A3A860C();
  v30 = BYTE8(v48);
  v31 = v26 + *(int *)(v29 + 28);
  *(_QWORD *)v31 = v48;
  *(_BYTE *)(v31 + 8) = v30;
  v50 = 4;
  sub_23A38DB5C();
  sub_23A3A860C();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v45, v46);
  v32 = v49;
  v33 = v26 + *(int *)(v29 + 32);
  *(_OWORD *)v33 = v48;
  *(_BYTE *)(v33 + 16) = v32;
  sub_23A38DBA0(v26, v38);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
  return sub_23A38E8C8(v26, (uint64_t (*)(_QWORD))type metadata accessor for SessionSummary);
}

unint64_t sub_23A38DB18()
{
  unint64_t result;

  result = qword_25696FC18;
  if (!qword_25696FC18)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for WaterDepth, &type metadata for WaterDepth);
    atomic_store(result, (unint64_t *)&qword_25696FC18);
  }
  return result;
}

unint64_t sub_23A38DB5C()
{
  unint64_t result;

  result = qword_25696FC20;
  if (!qword_25696FC20)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for TemperatureRange, &type metadata for TemperatureRange);
    atomic_store(result, (unint64_t *)&qword_25696FC20);
  }
  return result;
}

uint64_t sub_23A38DBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SessionSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A38DBE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SessionSummary.init(from:)(a1, a2);
}

uint64_t sub_23A38DBFC(_QWORD *a1)
{
  return SessionSummary.encode(to:)(a1);
}

uint64_t SessionSummary.dateInterval.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v1 = sub_23A3A809C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v11 - v6;
  v8 = type metadata accessor for SessionSummary();
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v9(v7, v0 + *(int *)(v8 + 20), v1);
  v9(v5, v0 + *(int *)(v8 + 24), v1);
  return sub_23A3A7FE8();
}

double SessionSummary.underwaterDuration.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  double v11;
  double v12;
  uint64_t v14;

  v1 = sub_23A3A809C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = &v7[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48)];
  v9 = type metadata accessor for SessionSummary();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v10(v7, v0 + *(int *)(v9 + 20), v1);
  v10(v8, v0 + *(int *)(v9 + 24), v1);
  swift_storeEnumTagMultiPayload();
  sub_23A3A8090();
  UnderwaterTime.timeInterval(untilDate:)();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_23A38E8C8((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for UnderwaterTime);
  return v12;
}

uint64_t SessionSummary.numberOfDivesMaybe.getter()
{
  return 0;
}

__n128 SessionSummary.with(startDate:endDate:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char v14;
  __n128 *v15;
  unsigned __int8 v16;
  uint64_t v17;
  __n128 *v18;
  __n128 result;

  v7 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, v3, v7);
  v8 = (int *)type metadata accessor for SessionSummary();
  v9 = a3 + v8[5];
  v10 = sub_23A3A809C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v9, a1, v10);
  v11(a3 + v8[6], a2, v10);
  v12 = v8[7];
  v13 = *(_QWORD *)(v3 + v12);
  v14 = *(_BYTE *)(v3 + v12 + 8);
  v15 = (__n128 *)(v3 + v8[8]);
  v16 = v15[1].n128_u8[0];
  v17 = a3 + v12;
  *(_QWORD *)v17 = v13;
  *(_BYTE *)(v17 + 8) = v14;
  v18 = (__n128 *)(a3 + v8[8]);
  result = *v15;
  *v18 = *v15;
  v18[1].n128_u8[0] = v16;
  return result;
}

uint64_t SessionSummary.with(temperatureRange:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *a1;
  v5 = a1[1];
  v6 = *((_BYTE *)a1 + 16);
  v7 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, v2, v7);
  v8 = (int *)type metadata accessor for SessionSummary();
  v9 = v8[5];
  v10 = v2 + v9;
  v11 = a2 + v9;
  v12 = sub_23A3A809C();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v13(v11, v10, v12);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(a2 + v8[6], v2 + v8[6], v12);
  v15 = v8[7];
  v16 = *(_QWORD *)(v2 + v15);
  v17 = *(_BYTE *)(v2 + v15 + 8);
  v18 = a2 + v15;
  *(_QWORD *)v18 = v16;
  *(_BYTE *)(v18 + 8) = v17;
  v19 = a2 + v8[8];
  *(_QWORD *)v19 = v4;
  *(_QWORD *)(v19 + 8) = v5;
  *(_BYTE *)(v19 + 16) = v6;
  return result;
}

uint64_t _s9DepthCore14SessionSummaryV2id10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A3A80F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_23A38E03C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v11;

  v3 = sub_23A3A809C();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v8((char *)&v11 - v9, v1 + *(int *)(a1 + 20), v3);
  v8(v6, v1 + *(int *)(a1 + 24), v3);
  return sub_23A3A7FE8();
}

uint64_t sub_23A38E108@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v2 + *(int *)(result + 28));
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = (_BYTE)v3;
  return result;
}

__n128 sub_23A38E124@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v2;
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(v2 + *(int *)(a1 + 32));
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

double sub_23A38E140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  double v12;
  double v13;
  uint64_t v15;

  v3 = sub_23A3A809C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48)];
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v11(v9, v1 + *(int *)(a1 + 20), v3);
  v11(v10, v1 + *(int *)(a1 + 24), v3);
  swift_storeEnumTagMultiPayload();
  sub_23A3A8090();
  UnderwaterTime.timeInterval(untilDate:)();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_23A38E8C8((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for UnderwaterTime);
  return v13;
}

double static SessionSummary.previewSummary.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  v2 = type metadata accessor for SessionSummary();
  sub_23A3A8090();
  sub_23A3A8054();
  sub_23A3A80E4();
  v3 = a1 + *(int *)(v2 + 28);
  *(_QWORD *)v3 = 0x40268E219652BD3DLL;
  *(_BYTE *)(v3 + 8) = 1;
  v4 = a1 + *(int *)(v2 + 32);
  result = 11.6666667;
  *(_OWORD *)v4 = xmmword_23A3AA730;
  *(_BYTE *)(v4 + 16) = 1;
  return result;
}

double static SessionSummary.previewSummaryMaxDepth.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  v2 = type metadata accessor for SessionSummary();
  sub_23A3A8090();
  sub_23A3A8054();
  sub_23A3A80E4();
  v3 = a1 + *(int *)(v2 + 28);
  *(_QWORD *)v3 = 2;
  *(_BYTE *)(v3 + 8) = 3;
  v4 = a1 + *(int *)(v2 + 32);
  result = 23.0;
  *(_OWORD *)v4 = xmmword_23A3AA740;
  *(_BYTE *)(v4 + 16) = 1;
  return result;
}

uint64_t static SessionSummary.previewSummaryOldDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  uint64_t result;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;

  v38 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA88);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FA90);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_23A3A8030();
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A3A8138();
  v45 = *(_QWORD *)(v9 - 8);
  v10 = v45;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v42 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v37 - v16;
  v18 = sub_23A3A809C();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v37 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v37 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v47 = (char *)&v37 - v25;
  sub_23A3A8120();
  v41 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v41(v6, 1, 1, v9);
  v26 = sub_23A3A8144();
  v39 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56);
  v40 = v26;
  v39(v3, 1, 1);
  v43 = v6;
  v44 = v3;
  sub_23A3A8024();
  sub_23A3A8090();
  sub_23A3A8108();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v18);
  v46 = *(_QWORD *)(v46 + 8);
  ((void (*)(char *, uint64_t))v46)(v8, v48);
  v27 = v9;
  v45 = *(_QWORD *)(v45 + 8);
  ((void (*)(char *, uint64_t))v45)(v12, v9);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  result = v28(v17, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v30 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    v30(v47, v17, v18);
    sub_23A3A8120();
    v41(v43, 1, 1, v27);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v39)(v44, 1, 1, v40);
    sub_23A3A8024();
    v31 = v42;
    sub_23A3A8108();
    ((void (*)(char *, uint64_t))v46)(v8, v48);
    ((void (*)(char *, uint64_t))v45)(v12, v27);
    result = v28(v31, 1, v18);
    if ((_DWORD)result != 1)
    {
      v32 = v37;
      v30(v37, v31, v18);
      v33 = v38;
      sub_23A3A80E4();
      v34 = (int *)type metadata accessor for SessionSummary();
      v30((char *)(v33 + v34[5]), v47, v18);
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(v33 + v34[6], v32, v18);
      v35 = v33 + v34[7];
      *(_QWORD *)v35 = 0x4024000000000000;
      *(_BYTE *)(v35 + 8) = 1;
      v36 = v33 + v34[8];
      *(_OWORD *)v36 = xmmword_23A3AA740;
      *(_BYTE *)(v36 + 16) = 1;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23A38E8C8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A38E904()
{
  return sub_23A38B374(&qword_25696FC28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_23A38E930(uint64_t a1)
{
  uint64_t result;

  result = sub_23A38B374(&qword_25696FC30, (uint64_t (*)(uint64_t))type metadata accessor for SessionSummary, (uint64_t)&protocol conformance descriptor for SessionSummary);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

char *initializeBufferWithCopyOfBuffer for SessionSummary(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A3A80F0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = sub_23A3A809C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&a1[a3[6]], &a2[a3[6]], v11);
    v13 = a3[7];
    v14 = a3[8];
    v15 = &a1[v13];
    v16 = &a2[v13];
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v15[8] = v16[8];
    v17 = &a1[v14];
    v18 = &a2[v14];
    *(_OWORD *)v17 = *(_OWORD *)v18;
    v17[16] = v18[16];
  }
  return a1;
}

uint64_t destroy for SessionSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);

  v4 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_23A3A809C();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v8(v5, v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(a1 + *(int *)(a2 + 24), v6);
}

uint64_t initializeWithCopy for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A3A809C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  v16 = a1 + v13;
  v17 = a2 + v13;
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_BYTE *)(v16 + 16) = *(_BYTE *)(v17 + 16);
  return a1;
}

uint64_t assignWithCopy for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A3A809C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = v15;
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_BYTE *)(v18 + 16);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *(_BYTE *)(v17 + 16) = v19;
  return a1;
}

uint64_t initializeWithTake for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A3A809C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  v16 = a1 + v13;
  v17 = a2 + v13;
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_BYTE *)(v16 + 16) = *(_BYTE *)(v17 + 16);
  return a1;
}

uint64_t assignWithTake for SessionSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A3A809C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  v16 = a1 + v13;
  v17 = a2 + v13;
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_BYTE *)(v16 + 16) = *(_BYTE *)(v17 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionSummary()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A38EE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_23A3A809C();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32) + 16);
  if (v14 > 2)
    return (v14 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SessionSummary()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A38EF20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23A3A80F0();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_23A3A809C();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 32) + 16) = -(char)a2;
  return result;
}

uint64_t sub_23A38EFC8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A3A80F0();
  if (v1 <= 0x3F)
  {
    result = sub_23A3A809C();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SessionSummary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionSummary.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A38F13C + 4 * byte_23A3AA4EA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23A38F170 + 4 * byte_23A3AA4E5[v4]))();
}

uint64_t sub_23A38F170(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A38F178(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A38F180);
  return result;
}

uint64_t sub_23A38F18C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A38F194);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23A38F198(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A38F1A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SessionSummary.CodingKeys()
{
  return &type metadata for SessionSummary.CodingKeys;
}

unint64_t sub_23A38F1C0()
{
  unint64_t result;

  result = qword_25696FCD8;
  if (!qword_25696FCD8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA6AC, &type metadata for SessionSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FCD8);
  }
  return result;
}

unint64_t sub_23A38F208()
{
  unint64_t result;

  result = qword_25696FCE0;
  if (!qword_25696FCE0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA61C, &type metadata for SessionSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FCE0);
  }
  return result;
}

unint64_t sub_23A38F250()
{
  unint64_t result;

  result = qword_25696FCE8;
  if (!qword_25696FCE8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA644, &type metadata for SessionSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FCE8);
  }
  return result;
}

uint64_t sub_23A38F294(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x687470654478616DLL && a2 == 0xE800000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023A3ADB60)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

DepthCore::DepthValue __swiftcall DepthSettings.nominalDepthLimit(inUnit:)(DepthCore::DepthUnit inUnit)
{
  uint64_t *v1;
  _BYTE *v2;
  uint64_t *v3;
  uint64_t *v4;
  DepthCore::DepthValue result;

  if (*v2)
    v3 = &qword_25696FCF8;
  else
    v3 = &qword_25696FD08;
  v4 = &qword_25696FCF0;
  if (!*v2)
    v4 = &qword_25696FD00;
  if (!*(_BYTE *)inUnit)
    v3 = v4;
  *(DepthCore::DepthValue *)&result.canonicalValue = (DepthCore::DepthValue)*v3;
  *v1 = *v3;
  return result;
}

double sub_23A38F4C4@<D0>(_QWORD *a1@<X8>)
{
  double result;

  result = *(double *)&qword_25696FCF0;
  *a1 = qword_25696FCF0;
  return result;
}

double sub_23A38F4D4@<D0>(_QWORD *a1@<X8>)
{
  double result;

  result = *(double *)&qword_25696FCF8;
  *a1 = qword_25696FCF8;
  return result;
}

double sub_23A38F4E4@<D0>(_QWORD *a1@<X8>)
{
  double result;

  result = *(double *)&qword_25696FD00;
  *a1 = qword_25696FD00;
  return result;
}

double sub_23A38F4F4@<D0>(_QWORD *a1@<X8>)
{
  double result;

  result = *(double *)&qword_25696FD08;
  *a1 = qword_25696FD08;
  return result;
}

BOOL static CurrentDevice.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CurrentDevice.hash(into:)()
{
  return sub_23A3A86F0();
}

uint64_t CurrentDevice.hashValue.getter()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

void static DepthSettings.currentDevice.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t DepthSettings.currentDeviceIsUltra.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

double DepthSettings.significantDepth.getter@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 8);
  *a1 = result;
  return result;
}

double DepthSettings.significantDepth.setter(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 8) = *a1;
  return result;
}

uint64_t (*DepthSettings.significantDepth.modify())()
{
  return nullsub_1;
}

void DepthSettings.currentDeviceLimit.getter(double *a1@<X8>)
{
  _BYTE *v1;
  double v2;

  v2 = 50.0;
  if (!*v1)
    v2 = 10.0;
  *a1 = v2;
}

double DepthSettings.deepDiveTimeThreshold.getter()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  double v13;
  double v14;
  void *v16;
  _OWORD v17[2];
  _QWORD v18[4];

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_23A3A82AC();
  v2 = objc_msgSend(v0, sel_valueForKey_, v1);

  if (v2)
  {
    sub_23A3A84BC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_23A3907A4((uint64_t)v17, (uint64_t)v18);
  if (v18[3])
  {
    sub_23A39082C();
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (qword_25696F1C0 != -1)
        swift_once();
      v3 = sub_23A3A8180();
      __swift_project_value_buffer(v3, (uint64_t)qword_2569709A8);
      v4 = v16;
      v5 = sub_23A3A8168();
      v6 = sub_23A3A8420();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        v8 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v7 = 138412290;
        v18[0] = v4;
        v9 = v4;
        sub_23A3A84A4();
        *v8 = v4;

        _os_log_impl(&dword_23A377000, v5, v6, "Using custom value for deepDiveTimeThreshold=%@", v7, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD30);
        swift_arrayDestroy();
        MEMORY[0x23B84ADCC](v8, -1, -1);
        MEMORY[0x23B84ADCC](v7, -1, -1);
      }
      else
      {

        v5 = v4;
      }

      -[NSObject doubleValue](v4, sel_doubleValue);
      v13 = v14;
      goto LABEL_18;
    }
  }
  else
  {
    sub_23A3907EC((uint64_t)v18);
  }
  if (qword_25696F1C0 != -1)
    swift_once();
  v10 = sub_23A3A8180();
  __swift_project_value_buffer(v10, (uint64_t)qword_2569709A8);
  v4 = sub_23A3A8168();
  v11 = sub_23A3A8420();
  if (os_log_type_enabled(v4, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_23A377000, v4, v11, "Returning default value", v12, 2u);
    MEMORY[0x23B84ADCC](v12, -1, -1);
  }
  v13 = 180.0;
LABEL_18:

  return v13;
}

double DepthSettings.sessionStopDelay.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void DepthSettings.sessionStopDelay.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
}

uint64_t (*DepthSettings.sessionStopDelay.modify())()
{
  return nullsub_1;
}

double DepthSettings.sessionStopDelayLong.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void DepthSettings.sessionStopDelayLong.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 24) = a1;
}

uint64_t (*DepthSettings.sessionStopDelayLong.modify())()
{
  return nullsub_1;
}

double DepthSettings.sessionRecoveryTimeout.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

void DepthSettings.sessionRecoveryTimeout.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 32) = a1;
}

uint64_t (*DepthSettings.sessionRecoveryTimeout.modify())()
{
  return nullsub_1;
}

double DepthSettings.shortDiveUnderwaterTimeThreshold.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

void DepthSettings.shortDiveUnderwaterTimeThreshold.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 40) = a1;
}

uint64_t (*DepthSettings.shortDiveUnderwaterTimeThreshold.modify())()
{
  return nullsub_1;
}

double DepthSettings.maxDepthMarkerMiniumSeparation.getter@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 48);
  *a1 = result;
  return result;
}

double DepthSettings.maxDepthMarkerMiniumSeparation.setter(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 48) = *a1;
  return result;
}

uint64_t (*DepthSettings.maxDepthMarkerMiniumSeparation.modify())()
{
  return nullsub_1;
}

double DepthSettings.maxDepthAlertUserDismissSuppressionTimeout.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

void DepthSettings.maxDepthAlertUserDismissSuppressionTimeout.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 56) = a1;
}

uint64_t (*DepthSettings.maxDepthAlertUserDismissSuppressionTimeout.modify())()
{
  return nullsub_1;
}

double DepthSettings.shortDiveCompletionTimeout.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

void DepthSettings.shortDiveCompletionTimeout.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 64) = a1;
}

uint64_t (*DepthSettings.shortDiveCompletionTimeout.modify())()
{
  return nullsub_1;
}

uint64_t DepthSettings.provider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = *(_QWORD *)(v1 + 72);
  v3 = *(_QWORD *)(v1 + 80);
  v4 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_BYTE *)(v1 + 96);
  *(_BYTE *)(a1 + 24) = v5;
  return sub_23A3795F0(v2, v3, v4, v5);
}

__n128 DepthSettings.provider.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int8 v3;
  __n128 result;
  __n128 v5;

  v5 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u8[8];
  sub_23A379608(*(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_BYTE *)(v1 + 96));
  result = v5;
  *(__n128 *)(v1 + 72) = v5;
  *(_QWORD *)(v1 + 88) = v2;
  *(_BYTE *)(v1 + 96) = v3;
  return result;
}

uint64_t (*DepthSettings.provider.modify())()
{
  return nullsub_1;
}

double DepthSettings.init(currentDeviceIsUltra:)@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  double result;

  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a2 + 8) = _Q0;
  *(_OWORD *)(a2 + 24) = xmmword_23A3AA760;
  *(_OWORD *)(a2 + 40) = xmmword_23A3AA770;
  result = 120.0;
  *(_OWORD *)(a2 + 56) = xmmword_23A3AA780;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_BYTE *)(a2 + 96) = 0x80;
  *(_BYTE *)a2 = a1;
  return result;
}

double static DepthProviderSetting.summaryTest.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 10.668;
  *(_OWORD *)a1 = xmmword_23A3AA790;
  *(_QWORD *)(a1 + 16) = 0x403E000000000000;
  *(_BYTE *)(a1 + 24) = 64;
  return result;
}

double static DepthProviderSetting.fullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 48.768;
  *(_OWORD *)a1 = xmmword_23A3AA7A0;
  *(_QWORD *)(a1 + 16) = 0x402E000000000000;
  *(_BYTE *)(a1 + 24) = 64;
  return result;
}

double static DepthProviderSetting.repeatingFullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 7.0104;
  *(_OWORD *)a1 = xmmword_23A3AA7B0;
  *(_QWORD *)(a1 + 16) = 0x402E000000000000;
  *(_BYTE *)(a1 + 24) = 65;
  return result;
}

double static DepthProviderSetting.recoveryRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 19.2024;
  *(_OWORD *)a1 = xmmword_23A3AA7C0;
  *(_QWORD *)(a1 + 16) = 0x3FF0000000000000;
  *(_BYTE *)(a1 + 24) = 64;
  return result;
}

uint64_t static DepthProviderSetting.montereyDiveReplay.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 v2;
  uint64_t v3;
  unsigned __int8 v4;

  swift_beginAccess();
  v2 = xmmword_25696FD10;
  v3 = qword_25696FD20;
  *(_OWORD *)a1 = xmmword_25696FD10;
  *(_QWORD *)(a1 + 16) = v3;
  v4 = byte_25696FD28;
  *(_BYTE *)(a1 + 24) = byte_25696FD28;
  return sub_23A3795F0(v2, *((uint64_t *)&v2 + 1), v3, v4);
}

uint64_t static DepthProviderSetting.montereyDiveReplay.setter(uint64_t a1)
{
  uint64_t v1;
  char v2;
  __int128 v3;
  uint64_t v4;
  unsigned __int8 v5;
  __int128 v7;

  v7 = *(_OWORD *)a1;
  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(_BYTE *)(a1 + 24);
  swift_beginAccess();
  v3 = xmmword_25696FD10;
  v4 = qword_25696FD20;
  xmmword_25696FD10 = v7;
  qword_25696FD20 = v1;
  v5 = byte_25696FD28;
  byte_25696FD28 = v2;
  return sub_23A379608(v3, *((uint64_t *)&v3 + 1), v4, v5);
}

uint64_t (*static DepthProviderSetting.montereyDiveReplay.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23A38FC6C(char a1)
{
  return *(_QWORD *)&aSensor_1[8 * a1];
}

uint64_t sub_23A38FC8C(char a1)
{
  return *(_QWORD *)&aMaxdepthreplay[8 * a1];
}

uint64_t sub_23A38FCAC()
{
  char *v0;

  return sub_23A38FC6C(*v0);
}

uint64_t sub_23A38FCB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A3915D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A38FCD8()
{
  sub_23A390918();
  return sub_23A3A8720();
}

uint64_t sub_23A38FD00()
{
  sub_23A390918();
  return sub_23A3A872C();
}

uint64_t sub_23A38FD28()
{
  char *v0;

  return sub_23A38FC8C(*v0);
}

uint64_t sub_23A38FD30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A391718(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A38FD54(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23A38FD60()
{
  sub_23A39095C();
  return sub_23A3A8720();
}

uint64_t sub_23A38FD88()
{
  sub_23A39095C();
  return sub_23A3A872C();
}

uint64_t sub_23A38FDB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A3918C4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A38FDDC()
{
  sub_23A3909A0();
  return sub_23A3A8720();
}

uint64_t sub_23A38FE04()
{
  sub_23A3909A0();
  return sub_23A3A872C();
}

uint64_t sub_23A38FE2C()
{
  sub_23A3909E4();
  return sub_23A3A8720();
}

uint64_t sub_23A38FE54()
{
  sub_23A3909E4();
  return sub_23A3A872C();
}

uint64_t DepthProviderSetting.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned int v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  uint64_t v42;
  char v43;

  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD38);
  v24 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v28 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD40);
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD48);
  v7 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD50);
  v32 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v1;
  v30 = v1[1];
  v31 = v12;
  v13 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A390918();
  v33 = v11;
  sub_23A3A8714();
  if (!(v13 >> 6))
  {
    v37 = 1;
    sub_23A3909A0();
    v16 = v33;
    v15 = v34;
    sub_23A3A8624();
    v19 = v27;
    sub_23A3A863C();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v16, v15);
  }
  if (v13 >> 6 == 1)
  {
    v43 = 2;
    sub_23A39095C();
    v14 = v28;
    v16 = v33;
    v15 = v34;
    sub_23A3A8624();
    v42 = v31;
    v41 = 0;
    sub_23A38A1EC();
    v17 = v29;
    v18 = v35;
    sub_23A3A8660();
    if (!v18)
    {
      v40 = 1;
      sub_23A3A8654();
      v39 = 2;
      sub_23A3A8654();
      v38 = 3;
      sub_23A3A8648();
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v17);
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v16, v15);
  }
  v36 = 0;
  sub_23A3909E4();
  v21 = v33;
  v22 = v34;
  sub_23A3A8624();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v21, v22);
}

uint64_t DepthProviderSetting.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;

  v47 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD78);
  v4 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  v46 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v49 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD80);
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v48 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD88);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD90);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[3];
  v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_23A390918();
  v17 = v51;
  sub_23A3A8708();
  if (!v17)
  {
    v51 = v8;
    v19 = v48;
    v18 = v49;
    v42 = v13;
    v20 = sub_23A3A8618();
    if (*(_QWORD *)(v20 + 16) == 1)
    {
      if (*(_BYTE *)(v20 + 32))
      {
        if (*(_BYTE *)(v20 + 32) == 1)
        {
          v54 = 1;
          sub_23A3909A0();
          v21 = v19;
          sub_23A3A85C4();
          v22 = v47;
          v29 = v44;
          v34 = sub_23A3A85E8();
          v36 = v35;
          (*(void (**)(char *, uint64_t))(v43 + 8))(v21, v29);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v12);
          v37 = 0;
          v38 = 0;
        }
        else
        {
          v59 = 2;
          sub_23A39095C();
          sub_23A3A85C4();
          v26 = v42;
          v58 = 0;
          sub_23A38A230();
          v27 = v45;
          v28 = v18;
          sub_23A3A860C();
          v30 = v52;
          v57 = 1;
          sub_23A3A8600();
          v32 = v31;
          v51 = v30;
          v56 = 2;
          sub_23A3A8600();
          v38 = v39;
          v55 = 3;
          v40 = sub_23A3A85F4();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v28, v27);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v12);
          v36 = v32;
          v37 = v40 & 1 | 0x40;
          v22 = v47;
          v34 = v51;
        }
      }
      else
      {
        v53 = 0;
        sub_23A3909E4();
        sub_23A3A85C4();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v51);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v12);
        v34 = 0;
        v36 = 0;
        v37 = 0x80;
        v38 = 0;
        v22 = v47;
      }
      *(_QWORD *)v22 = v34;
      *(_QWORD *)(v22 + 8) = v36;
      *(_QWORD *)(v22 + 16) = v38;
      *(_BYTE *)(v22 + 24) = v37;
    }
    else
    {
      v23 = sub_23A3A8510();
      swift_allocError();
      v25 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696F820);
      *v25 = &type metadata for DepthProviderSetting;
      sub_23A3A85D0();
      sub_23A3A8504();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v12);
    }
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
}

uint64_t sub_23A39077C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DepthProviderSetting.init(from:)(a1, a2);
}

uint64_t sub_23A390790(_QWORD *a1)
{
  return DepthProviderSetting.encode(to:)(a1);
}

uint64_t sub_23A3907A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F6A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A3907EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F6A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A39082C()
{
  unint64_t result;

  result = qword_25696F698;
  if (!qword_25696F698)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25696F698);
  }
  return result;
}

void sub_23A390868(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23A3A84A4();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

unint64_t sub_23A390918()
{
  unint64_t result;

  result = qword_25696FD58;
  if (!qword_25696FD58)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAD50, &type metadata for DepthProviderSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FD58);
  }
  return result;
}

unint64_t sub_23A39095C()
{
  unint64_t result;

  result = qword_25696FD60;
  if (!qword_25696FD60)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAD00, &type metadata for DepthProviderSetting.LinearRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FD60);
  }
  return result;
}

unint64_t sub_23A3909A0()
{
  unint64_t result;

  result = qword_25696FD68;
  if (!qword_25696FD68)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AACB0, &type metadata for DepthProviderSetting.ReplayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FD68);
  }
  return result;
}

unint64_t sub_23A3909E4()
{
  unint64_t result;

  result = qword_25696FD70;
  if (!qword_25696FD70)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAC60, &type metadata for DepthProviderSetting.SensorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FD70);
  }
  return result;
}

unint64_t sub_23A390A2C()
{
  unint64_t result;

  result = qword_25696FD98;
  if (!qword_25696FD98)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for CurrentDevice, &type metadata for CurrentDevice);
    atomic_store(result, (unint64_t *)&qword_25696FD98);
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthLimits()
{
  return &type metadata for DepthLimits;
}

uint64_t dispatch thunk of static DepthLimitProtocol.feet.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static DepthLimitProtocol.meters.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of DepthLimitProtocol.feet.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DepthLimitProtocol.meters.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t storeEnumTagSinglePayload for CurrentDevice(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A390AEC + 4 * byte_23A3AA7D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A390B20 + 4 * byte_23A3AA7D0[v4]))();
}

uint64_t sub_23A390B20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A390B28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A390B30);
  return result;
}

uint64_t sub_23A390B3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A390B44);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A390B48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A390B50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CurrentDevice()
{
  return &type metadata for CurrentDevice;
}

uint64_t destroy for DepthSettings(uint64_t a1)
{
  return sub_23A379608(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_BYTE *)(a1 + 96));
}

uint64_t initializeWithCopy for DepthSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v3 = *(_QWORD *)(a2 + 72);
  v4 = *(_QWORD *)(a2 + 80);
  v5 = *(_QWORD *)(a2 + 88);
  v6 = *(_BYTE *)(a2 + 96);
  sub_23A3795F0(v3, v4, v5, v6);
  *(_QWORD *)(a1 + 72) = v3;
  *(_QWORD *)(a1 + 80) = v4;
  *(_QWORD *)(a1 + 88) = v5;
  *(_BYTE *)(a1 + 96) = v6;
  return a1;
}

uint64_t assignWithCopy for DepthSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v3 = *(_QWORD *)(a2 + 72);
  v4 = *(_QWORD *)(a2 + 80);
  v5 = *(_QWORD *)(a2 + 88);
  v6 = *(_BYTE *)(a2 + 96);
  sub_23A3795F0(v3, v4, v5, v6);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 72) = v3;
  *(_QWORD *)(a1 + 80) = v4;
  *(_QWORD *)(a1 + 88) = v5;
  v10 = *(_BYTE *)(a1 + 96);
  *(_BYTE *)(a1 + 96) = v6;
  sub_23A379608(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for DepthSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v3 = *(_QWORD *)(a2 + 88);
  v4 = *(_BYTE *)(a2 + 96);
  v5 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = v3;
  v8 = *(_BYTE *)(a1 + 96);
  *(_BYTE *)(a1 + 96) = v4;
  sub_23A379608(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthSettings(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[97])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DepthSettings(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 97) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthSettings()
{
  return &type metadata for DepthSettings;
}

uint64_t destroy for DepthProviderSetting(uint64_t a1)
{
  return sub_23A379608(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for DepthProviderSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A3795F0(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for DepthProviderSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23A3795F0(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_23A379608(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DepthProviderSetting(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_23A379608(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DepthProviderSetting(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 126);
  v3 = ((*(unsigned __int8 *)(a1 + 24) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 24) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DepthProviderSetting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 0;
      *(_BYTE *)(result + 24) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_23A391008(uint64_t a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  v1 = *(unsigned __int8 *)(a1 + 24);
  v2 = (char)v1;
  v3 = v1 >> 6;
  if (v2 >= 0)
    return v3;
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23A391028(uint64_t result)
{
  *(_BYTE *)(result + 24) &= 0x3Fu;
  return result;
}

uint64_t sub_23A391038(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(_BYTE *)(result + 24) = *(_BYTE *)(result + 24) & 1 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 2;
    *(_BYTE *)(result + 24) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthProviderSetting()
{
  return &type metadata for DepthProviderSetting;
}

uint64_t storeEnumTagSinglePayload for DepthProviderSetting.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A3910C4 + 4 * byte_23A3AA7DF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A3910F8 + 4 * byte_23A3AA7DA[v4]))();
}

uint64_t sub_23A3910F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A391100(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A391108);
  return result;
}

uint64_t sub_23A391114(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A39111CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A391120(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A391128(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DepthProviderSetting.CodingKeys()
{
  return &type metadata for DepthProviderSetting.CodingKeys;
}

ValueMetadata *type metadata accessor for DepthProviderSetting.SensorCodingKeys()
{
  return &type metadata for DepthProviderSetting.SensorCodingKeys;
}

uint64_t storeEnumTagSinglePayload for DepthProviderSetting.ReplayCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A391194 + 4 * byte_23A3AA7E4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A3911B4 + 4 * byte_23A3AA7E9[v4]))();
}

_BYTE *sub_23A391194(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A3911B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A3911BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A3911C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A3911CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A3911D4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DepthProviderSetting.ReplayCodingKeys()
{
  return &type metadata for DepthProviderSetting.ReplayCodingKeys;
}

uint64_t storeEnumTagSinglePayload for DepthProviderSetting.LinearRangeCodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A39123C + 4 * byte_23A3AA7F3[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A391270 + 4 * byte_23A3AA7EE[v4]))();
}

uint64_t sub_23A391270(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A391278(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A391280);
  return result;
}

uint64_t sub_23A39128C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A391294);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A391298(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A3912A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DepthProviderSetting.LinearRangeCodingKeys()
{
  return &type metadata for DepthProviderSetting.LinearRangeCodingKeys;
}

unint64_t sub_23A3912C0()
{
  unint64_t result;

  result = qword_25696FDA0;
  if (!qword_25696FDA0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAA58, &type metadata for DepthProviderSetting.LinearRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDA0);
  }
  return result;
}

unint64_t sub_23A391308()
{
  unint64_t result;

  result = qword_25696FDA8;
  if (!qword_25696FDA8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAB10, &type metadata for DepthProviderSetting.ReplayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDA8);
  }
  return result;
}

unint64_t sub_23A391350()
{
  unint64_t result;

  result = qword_25696FDB0;
  if (!qword_25696FDB0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAC18, &type metadata for DepthProviderSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDB0);
  }
  return result;
}

unint64_t sub_23A391398()
{
  unint64_t result;

  result = qword_25696FDB8;
  if (!qword_25696FDB8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAB38, &type metadata for DepthProviderSetting.SensorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDB8);
  }
  return result;
}

unint64_t sub_23A3913E0()
{
  unint64_t result;

  result = qword_25696FDC0;
  if (!qword_25696FDC0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAB60, &type metadata for DepthProviderSetting.SensorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDC0);
  }
  return result;
}

unint64_t sub_23A391428()
{
  unint64_t result;

  result = qword_25696FDC8;
  if (!qword_25696FDC8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAA80, &type metadata for DepthProviderSetting.ReplayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDC8);
  }
  return result;
}

unint64_t sub_23A391470()
{
  unint64_t result;

  result = qword_25696FDD0;
  if (!qword_25696FDD0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAAA8, &type metadata for DepthProviderSetting.ReplayCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDD0);
  }
  return result;
}

unint64_t sub_23A3914B8()
{
  unint64_t result;

  result = qword_25696FDD8;
  if (!qword_25696FDD8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA9C8, &type metadata for DepthProviderSetting.LinearRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDD8);
  }
  return result;
}

unint64_t sub_23A391500()
{
  unint64_t result;

  result = qword_25696FDE0;
  if (!qword_25696FDE0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AA9F0, &type metadata for DepthProviderSetting.LinearRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDE0);
  }
  return result;
}

unint64_t sub_23A391548()
{
  unint64_t result;

  result = qword_25696FDE8;
  if (!qword_25696FDE8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AAB88, &type metadata for DepthProviderSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDE8);
  }
  return result;
}

unint64_t sub_23A391590()
{
  unint64_t result;

  result = qword_25696FDF0;
  if (!qword_25696FDF0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AABB0, &type metadata for DepthProviderSetting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FDF0);
  }
  return result;
}

uint64_t sub_23A3915D4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x726F736E6573 && a2 == 0xE600000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79616C706572 && a2 == 0xE600000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x61527261656E696CLL && a2 == 0xEB0000000065676ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A391718(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x687470654478616DLL && a2 == 0xE800000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x745379616C706572 && a2 == 0xEA00000000007065 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6152657461647075 && a2 == 0xEA00000000006574 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73746165706572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23A3918C4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x656C69466E6F736ALL && a2 == 0xEC00000068746150)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23A391958()
{
  return 0x656C69466E6F736ALL;
}

ValueMetadata *type metadata accessor for DepthLimits.Ultra()
{
  return &type metadata for DepthLimits.Ultra;
}

ValueMetadata *type metadata accessor for DepthLimits.Sundrift()
{
  return &type metadata for DepthLimits.Sundrift;
}

uint64_t TemperatureSettings.provider.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(a1 + 32) = v6;
  return sub_23A379478(v2, v3, v4, v5, v6);
}

__n128 TemperatureSettings.provider.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned __int8 v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = a1[2].n128_u8[0];
  sub_23A379490(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
  result = v6;
  *(__n128 *)v1 = v6;
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v3;
  *(_BYTE *)(v1 + 32) = v4;
  return result;
}

uint64_t (*TemperatureSettings.provider.modify())()
{
  return nullsub_1;
}

double TemperatureSettings.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 32) = 0x80;
  return result;
}

double static TemperatureProvider.fullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 40.5555556;
  *(_OWORD *)a1 = xmmword_23A3AAE30;
  *(_OWORD *)(a1 + 16) = xmmword_23A3AAE40;
  *(_BYTE *)(a1 + 32) = 64;
  return result;
}

double static TemperatureProvider.repeatingFullRangeDemo.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 40.5555556;
  *(_OWORD *)a1 = xmmword_23A3AAE30;
  *(_OWORD *)(a1 + 16) = xmmword_23A3AAE40;
  *(_BYTE *)(a1 + 32) = 65;
  return result;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TemperatureSettings()
{
  return &type metadata for TemperatureSettings;
}

uint64_t _s9DepthCore19TemperatureProviderOwxx_0(uint64_t a1)
{
  return sub_23A379490(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t _s9DepthCore19TemperatureProviderOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_23A379478(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t _s9DepthCore19TemperatureProviderOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_23A379478(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_23A379490(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t _s9DepthCore19TemperatureProviderOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_23A379490(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t _s9DepthCore19TemperatureProviderOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 126);
  v3 = ((*(unsigned __int8 *)(a1 + 32) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 32) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s9DepthCore19TemperatureProviderOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 126;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
    {
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_BYTE *)(result + 32) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_23A391C90(uint64_t a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  v1 = *(unsigned __int8 *)(a1 + 32);
  v2 = (char)v1;
  v3 = v1 >> 6;
  if (v2 >= 0)
    return v3;
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_23A391CB0(uint64_t result)
{
  *(_BYTE *)(result + 32) &= 0x3Fu;
  return result;
}

uint64_t sub_23A391CC0(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 1 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for TemperatureProvider()
{
  return &type metadata for TemperatureProvider;
}

uint64_t PrivacySettings.fitnessTrackingEnabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PrivacySettings.fitnessTrackingEnabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*PrivacySettings.fitnessTrackingEnabled.modify())()
{
  return nullsub_1;
}

DepthCore::PrivacySettings __swiftcall PrivacySettings.init(fitnessTrackingEnabled:)(DepthCore::PrivacySettings fitnessTrackingEnabled)
{
  DepthCore::PrivacySettings *v1;

  v1->fitnessTrackingEnabled = fitnessTrackingEnabled.fitnessTrackingEnabled;
  return fitnessTrackingEnabled;
}

uint64_t getEnumTagSinglePayload for InterfaceSettings(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacySettings(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A391E14 + 4 * byte_23A3AAEA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A391E48 + 4 * byte_23A3AAEA0[v4]))();
}

uint64_t sub_23A391E48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A391E50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A391E58);
  return result;
}

uint64_t sub_23A391E64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A391E6CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A391E70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A391E78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PrivacySettings()
{
  return &type metadata for PrivacySettings;
}

uint64_t DiveSummary.workoutID.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A3A80F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*DiveSummary.workoutID.modify())()
{
  return nullsub_1;
}

uint64_t DiveSummary.dateInterval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for DiveSummary() + 20);
  v4 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for DiveSummary()
{
  uint64_t result;

  result = qword_25696FE68;
  if (!qword_25696FE68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DiveSummary.dateInterval.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for DiveSummary() + 20);
  v4 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*DiveSummary.dateInterval.modify())()
{
  type metadata accessor for DiveSummary();
  return nullsub_1;
}

uint64_t DiveSummary.maxDepth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;

  result = type metadata accessor for DiveSummary();
  v4 = (uint64_t *)(v1 + *(int *)(result + 24));
  v5 = *v4;
  LOBYTE(v4) = *((_BYTE *)v4 + 8);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t DiveSummary.maxDepth.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  result = type metadata accessor for DiveSummary();
  v5 = v1 + *(int *)(result + 24);
  *(_QWORD *)v5 = v2;
  *(_BYTE *)(v5 + 8) = v3;
  return result;
}

uint64_t (*DiveSummary.maxDepth.modify())()
{
  type metadata accessor for DiveSummary();
  return nullsub_1;
}

double DiveSummary.underwaterDuration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for DiveSummary() + 28));
}

uint64_t DiveSummary.underwaterDuration.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DiveSummary();
  *(double *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*DiveSummary.underwaterDuration.modify())()
{
  type metadata accessor for DiveSummary();
  return nullsub_1;
}

__n128 DiveSummary.temperatureRange.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for DiveSummary() + 32));
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t DiveSummary.temperatureRange.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = type metadata accessor for DiveSummary();
  v6 = v1 + *(int *)(result + 32);
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = v3;
  *(_BYTE *)(v6 + 16) = v4;
  return result;
}

uint64_t (*DiveSummary.temperatureRange.modify())()
{
  type metadata accessor for DiveSummary();
  return nullsub_1;
}

uint64_t DiveSummary.numberOfDives.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for DiveSummary();
  v6 = v2 + *(int *)(result + 36);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*DiveSummary.numberOfDives.modify())()
{
  type metadata accessor for DiveSummary();
  return nullsub_1;
}

uint64_t DiveSummary.diveID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = v1;
  v4 = type metadata accessor for DiveSummary();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A39233C(v2 + *(int *)(v4 + 40), (uint64_t)v9);
  sub_23A392384(v2, (uint64_t)v6);
  v10 = sub_23A3A80F0();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(a1, v6, v10);
    sub_23A3923C8((uint64_t)v6);
    return sub_23A37D570((uint64_t)v9, &qword_25696FDF8);
  }
  else
  {
    sub_23A3923C8((uint64_t)v6);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a1, v9, v10);
  }
}

uint64_t sub_23A39233C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A392384(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DiveSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A3923C8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DiveSummary();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DiveSummary.init(workoutID:dateInterval:maxDepth:underwaterDuration:temperatureRange:numberOfDives:diveID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v13;
  char v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;

  v13 = *a3;
  v14 = *((_BYTE *)a3 + 8);
  v15 = a4[1];
  v27 = *a4;
  v26 = *((_BYTE *)a4 + 16);
  v16 = (int *)type metadata accessor for DiveSummary();
  v17 = a8 + v16[10];
  v18 = sub_23A3A80F0();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(a8, a1, v18);
  v20 = a8 + v16[5];
  v21 = sub_23A3A800C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20, a2, v21);
  v22 = a8 + v16[6];
  *(_QWORD *)v22 = v13;
  *(_BYTE *)(v22 + 8) = v14;
  *(double *)(a8 + v16[7]) = a9;
  v23 = a8 + v16[8];
  *(_QWORD *)v23 = v27;
  *(_QWORD *)(v23 + 8) = v15;
  *(_BYTE *)(v23 + 16) = v26;
  v24 = a8 + v16[9];
  *(_QWORD *)v24 = a5;
  *(_BYTE *)(v24 + 8) = a6 & 1;
  return sub_23A392548(a7, v17);
}

uint64_t sub_23A392548(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t static DiveSummary.fromHKWorkout(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  unint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  unint64_t v33;
  char v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  id v40;
  void *v41;
  double v42;
  id v43;
  id v44;
  double v45;
  double v46;
  char v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  uint64_t v53;
  int *v54;
  uint8_t *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  double v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  unint64_t v73;
  char v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  void (*v82)(void);
  id v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  int *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  double v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  __int128 v117;
  __int128 v118;

  v4 = type metadata accessor for DiveSummary();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A3A80F0();
  v111 = *(double *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v109 = (char *)&v98 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v110 = (uint64_t)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v112 = (uint64_t)&v98 - v16;
  v17 = sub_23A3A809C();
  v18 = MEMORY[0x24BDAC7A8](v17);
  MEMORY[0x24BDAC7A8](v18);
  v19 = sub_23A3A800C();
  v107 = *(_QWORD *)(v19 - 8);
  v108 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v106 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v113 = (char *)&v98 - v22;
  if (objc_msgSend(a1, sel_workoutActivityType) != (id)84)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  v105 = (int *)v4;
  v103 = v8;
  v23 = objc_msgSend(a1, sel_metadata);
  v104 = v5;
  if (v23)
  {
    v24 = v23;
    v25 = sub_23A3A8288();

    v26 = objc_msgSend(a1, sel_startDate);
    sub_23A3A8084();

    v27 = objc_msgSend(a1, sel_endDate);
    sub_23A3A8084();

    sub_23A3A7FE8();
    if (*(_QWORD *)(v25 + 16)
      && (v28 = sub_23A37CD84(0xD00000000000001DLL, 0x800000023A3ACE20), (v29 & 1) != 0)
      && (sub_23A37D4E8(*(_QWORD *)(v25 + 56) + 32 * v28, (uint64_t)&v117), (swift_dynamicCast() & 1) != 0))
    {
      v30 = 0;
      v31 = v114;
    }
    else
    {
      v31 = 0;
      v30 = 1;
    }
    v115 = v31;
    v116 = v30;
    if (*(_QWORD *)(v25 + 16))
    {
      v33 = sub_23A37CD84(0xD000000000000025, 0x800000023A3ACE40);
      if ((v34 & 1) != 0)
      {
        sub_23A37D4E8(*(_QWORD *)(v25 + 56) + 32 * v33, (uint64_t)&v117);
        swift_dynamicCast();
      }
    }
    static WaterDepth.depth(fromDepthValue:categoryString:)();
    swift_bridgeObjectRelease();
    v35 = BYTE8(v117);
    v36 = 0;
    v37 = *(_QWORD *)(v25 + 16);
    v101 = v117;
    if (v37)
    {
      v38 = sub_23A37CD84(0xD000000000000023, 0x800000023A3ACDF0);
      if ((v39 & 1) != 0)
      {
        sub_23A37D4E8(*(_QWORD *)(v25 + 56) + 32 * v38, (uint64_t)&v117);
        if (swift_dynamicCast())
          v36 = v114;
      }
    }
    sub_23A380A38();
    v40 = (id)*MEMORY[0x24BDD36D8];
    v41 = (void *)MEMORY[0x23B84A6A0]();
    v42 = COERCE_DOUBLE(objc_msgSend(a1, sel_statisticsForType_, v41));

    v102 = a2;
    if (v42 != 0.0)
    {
      v43 = objc_msgSend(*(id *)&v42, sel_minimumQuantity);

      if (v43)
      {
        v44 = objc_msgSend((id)objc_opt_self(), sel_degreeCelsiusUnit);
        objc_msgSend(v43, sel_doubleValueForUnit_, v44);
        v46 = v45;

        v47 = 0;
        v42 = v46;
LABEL_27:
        v64 = (void *)MEMORY[0x23B84A6A0](v40);
        v65 = objc_msgSend(a1, (SEL)&stru_250B530A0.imp + 2, v64);

        if (v65
          && (v66 = objc_msgSend(v65, sel_maximumQuantity), v65, v66))
        {
          v67 = v42;
          v68 = objc_msgSend((id)objc_opt_self(), sel_degreeCelsiusUnit);
          objc_msgSend(v66, sel_doubleValueForUnit_, v68);
          v70 = v69;

          v71 = v70;
          if ((v47 & 1) != 0)
          {
            v99 = 0;
            goto LABEL_33;
          }
          if (v70 <= v67)
            v42 = v70;
          else
            v42 = v67;
          if (v70 <= v67)
            v71 = v67;
          v99 = 1;
        }
        else
        {
          v71 = 0.0;
          if ((v47 & 1) != 0)
          {
            v99 = 2;
LABEL_33:
            v72 = v111;
            v42 = v71;
            v71 = 0.0;
            if (!*(_QWORD *)(v25 + 16))
              goto LABEL_46;
LABEL_43:
            v73 = sub_23A37CD84(0xD000000000000025, 0x800000023A3ACDC0);
            if ((v74 & 1) != 0)
            {
              sub_23A37D4E8(*(_QWORD *)(v25 + 56) + 32 * v73, (uint64_t)&v117);
              if (swift_dynamicCast())
              {
                v75 = v114;
LABEL_47:
                v98 = v75;
                if (*(_QWORD *)(v25 + 16)
                  && (v76 = sub_23A37CD84(0xD000000000000021, 0x800000023A3ACED0), (v77 & 1) != 0))
                {
                  sub_23A37D4E8(*(_QWORD *)(v25 + 56) + 32 * v76, (uint64_t)&v117);
                }
                else
                {
                  v117 = 0u;
                  v118 = 0u;
                }
                swift_bridgeObjectRelease();
                v111 = v42;
                v100 = v71;
                if (*((_QWORD *)&v118 + 1))
                {
                  if ((swift_dynamicCast() & 1) != 0)
                  {
                    v78 = (uint64_t)v7;
                    v79 = v112;
                    sub_23A3A80A8();
                    swift_bridgeObjectRelease();
                    v80 = v72;
                    v81 = v103;
LABEL_56:
                    v83 = objc_msgSend(a1, sel_UUID, v98);
                    v84 = v109;
                    sub_23A3A80CC();

                    v86 = v106;
                    v85 = v107;
                    v87 = v108;
                    (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v106, v113, v108);
                    v88 = v101;
                    if (v35 == 255)
                      v88 = 0;
                    v103 = v88;
                    if (v35 == 255)
                      v89 = 3;
                    else
                      v89 = v35;
                    LODWORD(v101) = v89;
                    v90 = v110;
                    sub_23A39233C(v79, v110);
                    v91 = v105;
                    v92 = v78 + v105[10];
                    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)&v80 + 56))(v92, 1, 1, v81);
                    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)&v80 + 32))(v78, v84, v81);
                    (*(void (**)(uint64_t, char *, uint64_t))(v85 + 32))(v78 + v91[5], v86, v87);
                    v93 = v78 + v91[6];
                    *(_QWORD *)v93 = v103;
                    *(_BYTE *)(v93 + 8) = v101;
                    *(_QWORD *)(v78 + v91[7]) = v36;
                    v94 = v78 + v91[8];
                    v95 = v100;
                    *(double *)v94 = v111;
                    *(double *)(v94 + 8) = v95;
                    *(_BYTE *)(v94 + 16) = v99;
                    v96 = v78 + v91[9];
                    *(_QWORD *)v96 = v98;
                    *(_BYTE *)(v96 + 8) = 0;
                    sub_23A392548(v90, v92);
                    v97 = v102;
                    sub_23A3939E0(v78, v102);
                    sub_23A37D570(v112, &qword_25696FDF8);
                    (*(void (**)(char *, uint64_t))(v85 + 8))(v113, v87);
                    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(v104 + 56))(v97, 0, 1, v91);
                  }
                }
                else
                {
                  sub_23A37D570((uint64_t)&v117, &qword_25696F6A0);
                }
                v78 = (uint64_t)v7;
                v82 = *(void (**)(void))(*(_QWORD *)&v72 + 56);
                v80 = v72;
                v81 = v103;
                v79 = v112;
                v82();
                goto LABEL_56;
              }
            }
LABEL_46:
            v75 = 1;
            goto LABEL_47;
          }
          v99 = 0;
        }
        v72 = v111;
        if (!*(_QWORD *)(v25 + 16))
          goto LABEL_46;
        goto LABEL_43;
      }
      v42 = 0.0;
    }
    v47 = 1;
    goto LABEL_27;
  }
  if (qword_25696F1C0 != -1)
    swift_once();
  v48 = sub_23A3A8180();
  __swift_project_value_buffer(v48, (uint64_t)qword_2569709A8);
  v49 = a1;
  v50 = sub_23A3A8168();
  v51 = sub_23A3A8414();
  v52 = os_log_type_enabled(v50, v51);
  v53 = v103;
  v54 = v105;
  if (v52)
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_QWORD *)&v117 = swift_slowAlloc();
    v56 = v117;
    *(_DWORD *)v55 = 136315138;
    v113 = (char *)(v55 + 4);
    v57 = objc_msgSend(v49, sel_UUID);
    sub_23A3A80CC();

    sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v58 = sub_23A3A8684();
    v59 = v53;
    v60 = a2;
    v62 = v61;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)&v111 + 8))(v11, v59);
    v114 = sub_23A37C734(v58, v62, (uint64_t *)&v117);
    sub_23A3A84A4();

    a2 = v60;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A377000, v50, v51, "Workout %s has nil metadata", v55, 0xCu);
    swift_arrayDestroy();
    v63 = v56;
    v54 = v105;
    MEMORY[0x23B84ADCC](v63, -1, -1);
    MEMORY[0x23B84ADCC](v55, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v104 + 56))(a2, 1, 1, v54);
}

uint64_t static DiveSummary.previewData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A3A809C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = sub_23A3A800C();
  v24 = *(_QWORD *)(v10 - 8);
  v25 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A3A80F0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A3A80E4();
  sub_23A3A8090();
  sub_23A3A806C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_23A3A8090();
  sub_23A3A7FE8();
  sub_23A3A80E4();
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v17(v4, 0, 1, v13);
  v18 = (int *)type metadata accessor for DiveSummary();
  v19 = a1 + v18[10];
  v17((char *)v19, 1, 1, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a1, v16, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(a1 + v18[5], v12, v25);
  v20 = a1 + v18[6];
  *(_QWORD *)v20 = 0x403B6E978D4FDF3CLL;
  *(_BYTE *)(v20 + 8) = 1;
  *(_QWORD *)(a1 + v18[7]) = 0x40A5900000000000;
  v21 = a1 + v18[8];
  *(_OWORD *)v21 = xmmword_23A3AAED0;
  *(_BYTE *)(v21 + 16) = 1;
  v22 = a1 + v18[9];
  *(_QWORD *)v22 = 2;
  *(_BYTE *)(v22 + 8) = 0;
  return sub_23A392548((uint64_t)v4, v19);
}

uint64_t DiveSummary.with(maxDepth:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(void);
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  char *v44;
  int v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;

  v3 = v2;
  v6 = (int *)type metadata accessor for DiveSummary();
  MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v49 = (char *)&v38 - v12;
  v13 = sub_23A3A800C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23A3A80F0();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v46 = *a1;
  v45 = *((unsigned __int8 *)a1 + 8);
  v20 = *(void (**)(void))(v18 + 16);
  v44 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20();
  v21 = v3 + v6[5];
  v47 = v16;
  v48 = v14;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v23 = (uint64_t)v39;
  v50 = v13;
  v22(v16, v21, v13);
  v24 = *(_QWORD *)(v3 + v6[7]);
  v25 = v3 + v6[8];
  v26 = *(_QWORD *)v25;
  v43 = *(_QWORD *)(v25 + 8);
  v27 = *(unsigned __int8 *)(v25 + 16);
  v28 = v6[10];
  v29 = v3 + v6[9];
  v40 = *(_QWORD *)v29;
  v41 = *(unsigned __int8 *)(v29 + 8);
  v42 = v27;
  sub_23A39233C(v3 + v28, (uint64_t)v11);
  sub_23A392384(v3, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1, v17) == 1)
  {
    v30 = (uint64_t)v49;
    ((void (*)(char *, uint64_t, uint64_t))v20)(v49, v23, v17);
    sub_23A3923C8(v23);
    sub_23A37D570((uint64_t)v11, &qword_25696FDF8);
  }
  else
  {
    sub_23A3923C8(v23);
    v30 = (uint64_t)v49;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v49, v11, v17);
  }
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v31(v30, 0, 1, v17);
  v32 = a2 + v6[10];
  v31(v32, 1, 1, v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a2, v44, v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(a2 + v6[5], v47, v50);
  v33 = a2 + v6[6];
  *(_QWORD *)v33 = v46;
  *(_BYTE *)(v33 + 8) = v45;
  *(_QWORD *)(a2 + v6[7]) = v24;
  v34 = a2 + v6[8];
  v35 = v43;
  *(_QWORD *)v34 = v26;
  *(_QWORD *)(v34 + 8) = v35;
  *(_BYTE *)(v34 + 16) = v42;
  v36 = a2 + v6[9];
  *(_QWORD *)v36 = v40;
  *(_BYTE *)(v36 + 8) = v41;
  return sub_23A392548(v30, v32);
}

uint64_t _s9DepthCore11DiveSummaryV13numberOfDivesSiSgvg_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for DiveSummary() + 36));
}

uint64_t DiveSummary.startDate.getter()
{
  return sub_23A3936C8(MEMORY[0x24BDCB848]);
}

uint64_t DiveSummary.endDate.getter()
{
  return sub_23A3936C8(MEMORY[0x24BDCB830]);
}

uint64_t sub_23A3936C8(uint64_t (*a1)(void))
{
  type metadata accessor for DiveSummary();
  return a1();
}

uint64_t DiveSummary.underwaterTime.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
  type metadata accessor for DiveSummary();
  sub_23A3A7FF4();
  sub_23A3A7FDC();
  type metadata accessor for UnderwaterTime();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A393774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_23A3A800C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_23A3937B4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)(v2 + *(int *)(result + 24));
  v4 = *v3;
  LOBYTE(v3) = *((_BYTE *)v3 + 8);
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = (_BYTE)v3;
  return result;
}

double sub_23A3937D0(uint64_t a1)
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_23A3937DC(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

uint64_t sub_23A3937F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = v2;
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A39233C(v4 + *(int *)(a1 + 40), (uint64_t)v10);
  sub_23A392384(v4, (uint64_t)v7);
  v11 = sub_23A3A80F0();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(a2, v7, v11);
    sub_23A3923C8((uint64_t)v7);
    return sub_23A37D570((uint64_t)v10, &qword_25696FDF8);
  }
  else
  {
    sub_23A3923C8((uint64_t)v7);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, v10, v11);
  }
}

uint64_t DiveSummary.hashValue.getter()
{
  sub_23A3A86E4();
  _s9DepthCore11DiveSummaryV4hash4intoys6HasherVz_tF_0();
  return sub_23A3A86FC();
}

uint64_t sub_23A393964()
{
  sub_23A3A86E4();
  _s9DepthCore11DiveSummaryV4hash4intoys6HasherVz_tF_0();
  return sub_23A3A86FC();
}

uint64_t sub_23A3939A4()
{
  sub_23A3A86E4();
  _s9DepthCore11DiveSummaryV4hash4intoys6HasherVz_tF_0();
  return sub_23A3A86FC();
}

uint64_t sub_23A3939E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DiveSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A393A24(uint64_t a1)
{
  uint64_t result;

  result = sub_23A38B374(&qword_25696FE00, (uint64_t (*)(uint64_t))type metadata accessor for DiveSummary, (uint64_t)&protocol conformance descriptor for DiveSummary);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A393A60()
{
  return sub_23A38B374(&qword_25696FE08, (uint64_t (*)(uint64_t))type metadata accessor for DiveSummary, (uint64_t)&protocol conformance descriptor for DiveSummary);
}

uint64_t *initializeBufferWithCopyOfBuffer for DiveSummary(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v28 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A3A80F0();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = a3[5];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_23A3A800C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = a3[6];
    v15 = a3[7];
    v16 = (char *)a1 + v14;
    v17 = (char *)a2 + v14;
    *(_QWORD *)v16 = *(_QWORD *)v17;
    v16[8] = v17[8];
    *(uint64_t *)((char *)a1 + v15) = *(uint64_t *)((char *)a2 + v15);
    v18 = a3[8];
    v19 = a3[9];
    v20 = (char *)a1 + v18;
    v21 = (char *)a2 + v18;
    v20[16] = v21[16];
    *(_OWORD *)v20 = *(_OWORD *)v21;
    v22 = (char *)a1 + v19;
    v23 = (char *)a2 + v19;
    *(_QWORD *)v22 = *(_QWORD *)v23;
    v22[8] = v23[8];
    v24 = a3[10];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v26, 1, v7))
    {
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v25, (uint64_t *)v26, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v25, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DiveSummary(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void (*v10)(uint64_t, uint64_t);

  v4 = sub_23A3A80F0();
  v5 = *(_QWORD *)(v4 - 8);
  v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v10(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = sub_23A3A800C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + *(int *)(a2 + 40);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v4);
  return result;
}

char *initializeWithCopy for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23A3A800C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  v17 = a3[8];
  v18 = a3[9];
  v19 = &a1[v17];
  v20 = &a2[v17];
  v19[16] = v20[16];
  *(_OWORD *)v19 = *(_OWORD *)v20;
  v21 = &a1[v18];
  v22 = &a2[v18];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[10];
  v24 = &a1[v23];
  v25 = &a2[v23];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v25, 1, v6))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v8(v24, v25, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v24, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t (*v28)(const void *, uint64_t, uint64_t);
  int v29;
  uint64_t v30;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23A3A800C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = v15[8];
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v16;
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  v17 = a3[8];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = v19[16];
  *(_OWORD *)v18 = *(_OWORD *)v19;
  v18[16] = v20;
  v21 = a3[9];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = v23[8];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  v22[8] = v24;
  v25 = a3[10];
  v26 = &a1[v25];
  v27 = &a2[v25];
  v28 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v10) = v28(&a1[v25], 1, v6);
  v29 = v28(v27, 1, v6);
  if (!(_DWORD)v10)
  {
    if (!v29)
    {
      v8(v26, v27, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v26, v6);
    goto LABEL_6;
  }
  if (v29)
  {
LABEL_6:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v26, v27, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v6);
  return a1;
}

char *initializeWithTake for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23A3A800C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  v17 = a3[8];
  v18 = a3[9];
  v19 = &a1[v17];
  v20 = &a2[v17];
  v19[16] = v20[16];
  *(_OWORD *)v19 = *(_OWORD *)v20;
  v21 = &a1[v18];
  v22 = &a2[v18];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[10];
  v24 = &a1[v23];
  v25 = &a2[v23];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v25, 1, v6))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v8(v24, v25, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v24, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for DiveSummary(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t (*v26)(const void *, uint64_t, uint64_t);
  int v27;
  uint64_t v28;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23A3A800C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  v17 = a3[8];
  v18 = a3[9];
  v19 = &a1[v17];
  v20 = &a2[v17];
  v19[16] = v20[16];
  *(_OWORD *)v19 = *(_OWORD *)v20;
  v21 = &a1[v18];
  v22 = &a2[v18];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[10];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v10) = v26(&a1[v23], 1, v6);
  v27 = v26(v25, 1, v6);
  if (!(_DWORD)v10)
  {
    if (!v27)
    {
      v8(v24, v25, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v24, v6);
    goto LABEL_6;
  }
  if (v27)
  {
LABEL_6:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v24, v25, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v24, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveSummary()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A3942D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_23A3A800C();
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 253)
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[10];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(unsigned __int8 *)(a1 + a3[8] + 16);
  if (v13 > 2)
    return (v13 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DiveSummary()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A3943A8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_23A3A80F0();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_23A3A800C();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 253)
      {
        *(_BYTE *)(a1 + a4[8] + 16) = -(char)a2;
        return result;
      }
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FDF8);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[10];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23A394474()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23A3A80F0();
  if (v0 <= 0x3F)
  {
    sub_23A3A800C();
    if (v1 <= 0x3F)
    {
      sub_23A394540();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_23A394540()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25696FE78[0])
  {
    sub_23A3A80F0();
    v0 = sub_23A3A8498();
    if (!v1)
      atomic_store(v0, qword_25696FE78);
  }
}

uint64_t InterfaceSettings.demoCornerMaskEnabled.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t InterfaceSettings.demoCornerMaskEnabled.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*InterfaceSettings.demoCornerMaskEnabled.modify())()
{
  return nullsub_1;
}

uint64_t storeEnumTagSinglePayload for InterfaceSettings(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A394600 + 4 * byte_23A3AB035[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A394634 + 4 * byte_23A3AB030[v4]))();
}

uint64_t sub_23A394634(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39463C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A394644);
  return result;
}

uint64_t sub_23A394650(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A394658);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A39465C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A394664(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InterfaceSettings()
{
  return &type metadata for InterfaceSettings;
}

void UnitSettings.depthUnit.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *UnitSettings.depthUnit.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*UnitSettings.depthUnit.modify())()
{
  return nullsub_1;
}

void UnitSettings.waterTemperatureUnit.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

_BYTE *UnitSettings.waterTemperatureUnit.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = *result;
  return result;
}

uint64_t (*UnitSettings.waterTemperatureUnit.modify())()
{
  return nullsub_1;
}

DepthCore::UnitSettings __swiftcall UnitSettings.init(depthUnit:waterTemperatureUnit:)(DepthCore::DepthUnit depthUnit, DepthCore::WaterTemperatureUnit waterTemperatureUnit)
{
  _BYTE *v2;
  char v3;
  DepthCore::UnitSettings result;

  v3 = *(_BYTE *)waterTemperatureUnit;
  *v2 = *(_BYTE *)depthUnit;
  v2[1] = v3;
  result.depthUnit = depthUnit;
  return result;
}

uint64_t UnitSettings.depthUnitString.getter()
{
  unsigned __int8 *v0;
  int v1;
  void *v2;
  char **v3;
  id v4;
  id v5;
  uint64_t v6;

  v1 = *v0;
  v2 = (void *)objc_opt_self();
  v3 = &selRef_meters;
  if (!v1)
    v3 = &selRef_feet;
  v4 = objc_msgSend(v2, *v3);
  v5 = objc_msgSend(v4, sel_symbol);

  v6 = sub_23A3A82DC();
  return v6;
}

uint64_t UnitSettings.waterTemperatureUnitString.getter()
{
  uint64_t v0;
  int v1;
  void *v2;
  char **v3;
  id v4;
  id v5;
  uint64_t v6;

  v1 = *(unsigned __int8 *)(v0 + 1);
  v2 = (void *)objc_opt_self();
  v3 = &selRef_fahrenheit;
  if (!v1)
    v3 = &selRef_celsius;
  v4 = objc_msgSend(v2, *v3);
  v5 = objc_msgSend(v4, sel_symbol);

  v6 = sub_23A3A82DC();
  return v6;
}

uint64_t UnitSettings.loggingString.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = 1952802150;
  if (*v0)
    v1 = 0x73726574656DLL;
  v3 = v1;
  swift_bridgeObjectRetain();
  sub_23A3A8318();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A3A8318();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UnitSettings(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UnitSettings(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_23A3949E4 + 4 * byte_23A3AB069[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_23A394A18 + 4 * asc_23A3AB064[v4]))();
}

uint64_t sub_23A394A18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_23A394A20(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x23A394A28);
  return result;
}

uint64_t sub_23A394A34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x23A394A3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A394A40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_23A394A48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnitSettings()
{
  return &type metadata for UnitSettings;
}

DepthCore::DepthValue __swiftcall DepthValue.init(value:inUnit:)(Swift::Double value, DepthCore::DepthUnit inUnit)
{
  double *v2;
  double v3;
  DepthCore::DepthValue result;

  v3 = 0.3048;
  if (*(_BYTE *)inUnit)
    v3 = 1.0;
  result.canonicalValue = v3 * value;
  *v2 = result.canonicalValue;
  return result;
}

void WaterDepth.depthValue.getter(uint64_t a1@<X8>)
{
  uint64_t *v1;
  unsigned int v2;
  uint64_t v3;

  v2 = *((unsigned __int8 *)v1 + 8);
  if (v2 <= 2)
    v3 = *v1;
  else
    v3 = 0;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v2 > 2;
}

Swift::Double __swiftcall DepthValue.value(forUnit:)(DepthCore::DepthUnit forUnit)
{
  double *v1;
  double v2;

  v2 = 3.2808399;
  if (*(_BYTE *)forUnit)
    v2 = 1.0;
  return *v1 * v2;
}

id DepthUnit.unitLength.getter()
{
  unsigned __int8 *v0;
  int v1;
  void *v2;
  char **v3;

  v1 = *v0;
  v2 = (void *)objc_opt_self();
  v3 = &selRef_meters;
  if (!v1)
    v3 = &selRef_feet;
  return objc_msgSend(v2, *v3);
}

BOOL static DepthValue.== infix(_:_:)(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) <= 0.0001;
}

uint64_t sub_23A394B44(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  return ((uint64_t (*)(void))((char *)sub_23A394B60 + 4 * byte_23A3AB0A0[a4]))();
}

uint64_t sub_23A394B60(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  if (a2)
    return ((uint64_t (*)(void))((char *)&loc_23A394C08 + 4 * byte_23A3AB0A4[a2]))();
  if (vabdd_f64(*(double *)&a3, *(double *)&a1) <= 0.0001)
    return 1;
  return *(double *)&a3 >= *(double *)&a1;
}

uint64_t sub_23A394C68(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(void))((char *)sub_23A394C84 + 4 * byte_23A3AB0A8[a2]))();
}

uint64_t sub_23A394C84(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4)
    return ((uint64_t (*)(void))((char *)&loc_23A394D2C + 4 * byte_23A3AB0AC[a4]))();
  if (vabdd_f64(*(double *)&a1, *(double *)&a3) <= 0.0001)
    return 1;
  return *(double *)&a1 >= *(double *)&a3;
}

double static DepthValue.- infix(_:_:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 - *a2;
  *a3 = result;
  return result;
}

uint64_t sub_23A394DA0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  return ((uint64_t (*)(void))((char *)sub_23A394DBC + 4 * byte_23A3AB0B0[a4]))();
}

uint64_t sub_23A394DBC(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  if (a2)
    return ((uint64_t (*)(void))((char *)&loc_23A394E60 + 4 * byte_23A3AB0B4[a2]))();
  if (vabdd_f64(*(double *)&a3, *(double *)&a1) <= 0.0001)
    return 0;
  return *(double *)&a3 < *(double *)&a1;
}

double DepthValue.canonicalValue.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

Swift::Double __swiftcall DepthUnit.conversionFactor(toUnit:)(DepthCore::DepthUnit toUnit)
{
  _BYTE *v1;
  Swift::Double result;
  double v3;

  result = 3.2808399;
  v3 = 1.0;
  if (*(_BYTE *)toUnit)
  {
    result = 1.0;
    v3 = 0.3048;
  }
  if (!*v1)
    return v3;
  return result;
}

uint64_t sub_23A394EF8()
{
  sub_23A395030();
  return sub_23A3A8720();
}

uint64_t sub_23A394F20()
{
  sub_23A395030();
  return sub_23A3A872C();
}

uint64_t DepthValue.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FEC0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A395030();
  sub_23A3A8714();
  sub_23A3A8654();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_23A395030()
{
  unint64_t result;

  result = qword_25696FEC8;
  if (!qword_25696FEC8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABC9C, &type metadata for DepthValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FEC8);
  }
  return result;
}

uint64_t DepthValue.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FED0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A395030();
  sub_23A3A8708();
  if (!v2)
  {
    sub_23A3A8600();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_23A395180@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return DepthValue.init(from:)(a1, a2);
}

uint64_t sub_23A395194(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FEC0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A395030();
  sub_23A3A8714();
  sub_23A3A8654();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL static DepthValue.< infix(_:_:)(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL static DepthValue.> infix(_:_:)(double *a1, double *a2)
{
  return *a2 < *a1;
}

BOOL sub_23A3952A4(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) <= 0.0001;
}

void static DepthValue.zero.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

double static DepthValue.+ infix(_:_:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 + *a2;
  *a3 = result;
  return result;
}

double sub_23A3952E0@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 + *a2;
  *a3 = result;
  return result;
}

double sub_23A3952F4(double *a1, double *a2)
{
  double result;

  result = *a2 + *a1;
  *a1 = result;
  return result;
}

double sub_23A395308@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 - *a2;
  *a3 = result;
  return result;
}

double sub_23A39531C(double *a1, double *a2)
{
  double result;

  result = *a1 - *a2;
  *a1 = result;
  return result;
}

BOOL WaterDepth.isExceedingMaxDepth.getter()
{
  uint64_t v0;
  unsigned int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  if (v1 < 2)
    return 0;
  if (v1 == 3)
    return *(_QWORD *)v0 > 1uLL;
  return 1;
}

BOOL WaterDepth.isSumberged.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 8) != 3 || *(_QWORD *)v0 > 1uLL;
}

uint64_t WaterDepth.hasEqualSubmersionState(to:)()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)sub_23A3953AC + 4 * byte_23A3AB0B8[*(unsigned __int8 *)(v0 + 8)]))();
}

BOOL sub_23A3953AC@<W0>(int a1@<W8>)
{
  return a1 == 0;
}

double *static WaterDepth.from(depthValue:withConfiguration:)@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v3;
  double v4;
  uint64_t *v5;
  uint64_t *v6;
  double v7;
  double v9[4];

  v3 = *a1;
  v4 = 50.0;
  if (!*(_BYTE *)a2)
    v4 = 10.0;
  v5 = &qword_25696FCF8;
  if (!*(_BYTE *)a2)
    v5 = &qword_25696FD08;
  v6 = &qword_25696FCF0;
  if (!*(_BYTE *)a2)
    v6 = &qword_25696FD00;
  if (!*(_BYTE *)(a2 + 138))
    v5 = v6;
  v7 = *(double *)v5;
  v9[1] = *(double *)(a2 + 8);
  v9[2] = v7;
  v9[3] = v4;
  v9[0] = v3;
  return DepthTransform.callAsFunction(depth:)(v9, a3);
}

DepthCore::DepthTransform __swiftcall DepthTransform.init(significantDepth:nominalDepthLimit:deviceLimitDepth:)(DepthCore::DepthValue significantDepth, DepthCore::DepthValue nominalDepthLimit, DepthCore::DepthValue deviceLimitDepth)
{
  Swift::Double *v3;
  Swift::Double *v4;
  Swift::Double *v5;
  Swift::Double *v6;
  Swift::Double v7;
  Swift::Double v8;
  Swift::Double v9;
  DepthCore::DepthTransform result;

  v7 = *v3;
  v8 = *v4;
  v9 = *v5;
  *v6 = *v3;
  v6[1] = v8;
  v6[2] = v9;
  result.deviceLimitDepth = *(DepthCore::DepthValue *)&v9;
  result.nominalDepthLimit = *(DepthCore::DepthValue *)&v8;
  result.significantDepth = *(DepthCore::DepthValue *)&v7;
  return result;
}

double *DepthTransform.callAsFunction(depth:)@<X0>(double *result@<X0>, uint64_t a2@<X8>)
{
  double *v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;

  v3 = *result;
  if (*result < 0.0)
  {
    v4 = 1;
LABEL_3:
    *(_QWORD *)a2 = v4;
    *(_BYTE *)(a2 + 8) = 3;
    return result;
  }
  if (v3 < *v2)
  {
    *(double *)a2 = v3;
    *(_BYTE *)(a2 + 8) = 0;
    return result;
  }
  v5 = v2[1];
  if (v5 < *v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (v3 < v5)
  {
    *(double *)a2 = v3;
    *(_BYTE *)(a2 + 8) = 1;
    return result;
  }
  v6 = v2[2];
  if (v6 < v5)
    goto LABEL_14;
  if (v3 >= v6)
  {
    v4 = 2;
    goto LABEL_3;
  }
  *(double *)a2 = v3;
  *(_BYTE *)(a2 + 8) = 2;
  return result;
}

uint64_t sub_23A395540(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A39557C + 4 * byte_23A3AB0BC[a1]))(0xD00000000000001ALL, 0x800000023A3ADBC0);
}

uint64_t sub_23A39557C()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_23A395594()
{
  return 0x656D627553746F6ELL;
}

uint64_t sub_23A3955B4()
{
  return 0x776F6C6C616873;
}

uint64_t sub_23A3955CC()
{
  return 0x6C616E696D6F6ELL;
}

unint64_t sub_23A3955E4()
{
  return 0xD000000000000019;
}

uint64_t sub_23A395600()
{
  unsigned __int8 *v0;

  return sub_23A395540(*v0);
}

uint64_t sub_23A395608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A397750(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A39562C(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_23A395638()
{
  sub_23A396940();
  return sub_23A3A8720();
}

uint64_t sub_23A395660()
{
  sub_23A396940();
  return sub_23A3A872C();
}

uint64_t sub_23A395688()
{
  sub_23A3969C8();
  return sub_23A3A8720();
}

uint64_t sub_23A3956B0()
{
  sub_23A3969C8();
  return sub_23A3A872C();
}

uint64_t sub_23A3956D8()
{
  sub_23A396984();
  return sub_23A3A8720();
}

uint64_t sub_23A395700()
{
  sub_23A396984();
  return sub_23A3A872C();
}

uint64_t sub_23A395728()
{
  sub_23A396A0C();
  return sub_23A3A8720();
}

uint64_t sub_23A395750()
{
  sub_23A396A0C();
  return sub_23A3A872C();
}

uint64_t sub_23A395778()
{
  sub_23A396A94();
  return sub_23A3A8720();
}

uint64_t sub_23A3957A0()
{
  sub_23A396A94();
  return sub_23A3A872C();
}

uint64_t sub_23A3957C8()
{
  sub_23A396A50();
  return sub_23A3A8720();
}

uint64_t sub_23A3957F0()
{
  sub_23A396A50();
  return sub_23A3A872C();
}

uint64_t sub_23A395818()
{
  sub_23A396AD8();
  return sub_23A3A8720();
}

uint64_t sub_23A395840()
{
  sub_23A396AD8();
  return sub_23A3A872C();
}

void WaterDepth.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  _QWORD v17[17];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FED8);
  v17[4] = *(_QWORD *)(v4 - 8);
  v17[5] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v17[3] = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FEE0);
  v17[13] = *(_QWORD *)(v6 - 8);
  v17[14] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v17[12] = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FEE8);
  v17[10] = *(_QWORD *)(v8 - 8);
  v17[11] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v17[9] = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FEF0);
  v17[7] = *(_QWORD *)(v10 - 8);
  v17[8] = v10;
  MEMORY[0x24BDAC7A8](v10);
  v17[6] = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FEF8);
  v17[1] = *(_QWORD *)(v12 - 8);
  v17[2] = v12;
  MEMORY[0x24BDAC7A8](v12);
  v17[0] = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF00);
  MEMORY[0x24BDAC7A8](v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF08);
  v17[15] = *(_QWORD *)(v15 - 8);
  v17[16] = v15;
  MEMORY[0x24BDAC7A8](v15);
  v16 = *(unsigned __int8 *)(v2 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A396940();
  sub_23A3A8714();
  __asm { BR              X9 }
}

uint64_t sub_23A395AA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v2 - 72) = 2;
  sub_23A396A50();
  v3 = *(_QWORD *)(v2 - 176);
  v4 = *(_QWORD *)(v2 - 96);
  sub_23A3A8624();
  *(_QWORD *)(v2 - 72) = v0;
  sub_23A38A1EC();
  v5 = *(_QWORD *)(v2 - 160);
  sub_23A3A8660();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 168) + 8))(v3, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 104) + 8))(v1, v4);
}

uint64_t WaterDepth.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v26[10];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;

  v37 = a2;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF48);
  v26[7] = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF50);
  v30 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v35 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF58);
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v34 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF60);
  v26[8] = *(_QWORD *)(v7 - 8);
  v26[9] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v33 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF68);
  v26[5] = *(_QWORD *)(v9 - 8);
  v26[6] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v32 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF70);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696FF78);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1[3];
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v19);
  sub_23A396940();
  v20 = v39;
  sub_23A3A8708();
  if (!v20)
  {
    v26[3] = v14;
    v26[1] = v12;
    v26[2] = v11;
    v39 = v16;
    v26[4] = 0;
    v21 = sub_23A3A8618();
    if (*(_QWORD *)(v21 + 16) == 1)
      __asm { BR              X10 }
    v22 = sub_23A3A8510();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F820);
    *v24 = &type metadata for WaterDepth;
    sub_23A3A85D0();
    sub_23A3A8504();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26D0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v18, v15);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
}

uint64_t sub_23A3964B4(uint64_t a1, uint64_t a2)
{
  return sub_23A394B44(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

uint64_t sub_23A3964CC(uint64_t a1)
{
  return sub_23A394C68(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_23A3964E4(uint64_t a1, uint64_t a2)
{
  return sub_23A394DA0(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

uint64_t sub_23A3964FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WaterDepth.init(from:)(a1, a2);
}

void sub_23A396510(_QWORD *a1)
{
  WaterDepth.encode(to:)(a1);
}

DepthCore::DepthUnit_optional __swiftcall DepthUnit.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (DepthCore::DepthUnit_optional)rawValue;
}

uint64_t DepthUnit.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

_QWORD *sub_23A39654C@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_23A39656C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

BOOL static WaterType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WaterType.hash(into:)()
{
  return sub_23A3A86F0();
}

uint64_t WaterType.hashValue.getter()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

BOOL static Pressure.PressureUnit.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Pressure.PressureUnit.hash(into:)()
{
  return sub_23A3A86F0();
}

uint64_t Pressure.PressureUnit.hashValue.getter()
{
  sub_23A3A86E4();
  sub_23A3A86F0();
  return sub_23A3A86FC();
}

DepthCore::Pressure __swiftcall Pressure.init(value:unit:)(DepthCore::Pressure value, DepthCore::Pressure::PressureUnit unit)
{
  double *v2;

  if (*(_BYTE *)unit)
    value.canonicalValue = value.canonicalValue * 1000.0;
  *v2 = value.canonicalValue;
  return value;
}

Swift::Double __swiftcall Pressure.depthValue(forUnit:waterType:)(DepthCore::DepthUnit forUnit, DepthCore::WaterType waterType)
{
  double *v2;
  Swift::Double result;

  result = *v2 / dbl_23A3ABCF0[*(char *)waterType];
  if (!*(_BYTE *)forUnit)
    return result / 3.2808399;
  return result;
}

Swift::Double __swiftcall Pressure.value(forUnit:)(DepthCore::Pressure::PressureUnit forUnit)
{
  Swift::Double *v1;
  Swift::Double result;

  result = *v1;
  if (*(_BYTE *)forUnit)
    return *v1 / 1000.0;
  return result;
}

double static Pressure.pressure(forDepthValue:unit:waterType:)@<D0>(_BYTE *a1@<X0>, char *a2@<X1>, double *a3@<X8>, double a4@<D0>)
{
  double v4;
  double result;

  v4 = 0.3048;
  if (*a1)
    v4 = 1.0;
  result = v4 * (dbl_23A3ABCF0[*a2] * a4);
  *a3 = result;
  return result;
}

CMWaterSubmersionDepthState __swiftcall SubmersionStateTransform.callAsFunction(depth:)(DepthCore::DepthValue depth)
{
  CMWaterSubmersionDepthState result;
  double *v2;
  double v3;
  double v4;
  double v5;

  v3 = *(double *)result;
  if (*(double *)result < *v2)
    return 200;
  v4 = v2[1];
  if (v4 < *v2)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  if (v3 < v4)
    return 300;
  v5 = v2[2];
  if (v5 < v4)
    goto LABEL_11;
  if (v3 >= v5)
    return 600;
  else
    return 500;
}

uint64_t _s9DepthCore05WaterA0O2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_23A3967B4 + 4 * byte_23A3AB0CC[*(unsigned __int8 *)(a1 + 8)]))();
}

BOOL sub_23A3967B4@<W0>(double a1@<X8>)
{
  double v1;
  int v2;

  return !v2 && vabdd_f64(v1, a1) <= 0.0001;
}

uint64_t _s9DepthCore05WaterA0O1loiySbAC_ACtFZ_0(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_23A39685C + 4 * byte_23A3AB0D0[*(unsigned __int8 *)(a1 + 8)]))();
}

uint64_t sub_23A39685C@<X0>(double a1@<X8>)
{
  uint64_t v1;
  double v2;

  if ((_DWORD)v1)
    return ((uint64_t (*)(void))((char *)&loc_23A396910 + 4 * byte_23A3AB0D4[v1]))();
  if (vabdd_f64(v2, a1) <= 0.0001)
    return 0;
  return v2 < a1;
}

BOOL sub_23A396920()
{
  unint64_t v0;

  return v0 < 4;
}

void sub_23A396928()
{
  JUMPOUT(0x23A396934);
}

unint64_t sub_23A396940()
{
  unint64_t result;

  result = qword_25696FF10;
  if (!qword_25696FF10)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABC4C, &type metadata for WaterDepth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FF10);
  }
  return result;
}

unint64_t sub_23A396984()
{
  unint64_t result;

  result = qword_25696FF18;
  if (!qword_25696FF18)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABBFC, &type metadata for WaterDepth.DepthExceedingSensorLimitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FF18);
  }
  return result;
}

unint64_t sub_23A3969C8()
{
  unint64_t result;

  result = qword_25696FF20;
  if (!qword_25696FF20)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABBAC, &type metadata for WaterDepth.DepthExceedingNominalRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FF20);
  }
  return result;
}

unint64_t sub_23A396A0C()
{
  unint64_t result;

  result = qword_25696FF28;
  if (!qword_25696FF28)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABB5C, &type metadata for WaterDepth.NominalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FF28);
  }
  return result;
}

unint64_t sub_23A396A50()
{
  unint64_t result;

  result = qword_25696FF30;
  if (!qword_25696FF30)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABB0C, &type metadata for WaterDepth.ShallowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FF30);
  }
  return result;
}

unint64_t sub_23A396A94()
{
  unint64_t result;

  result = qword_25696FF38;
  if (!qword_25696FF38)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABABC, &type metadata for WaterDepth.NotSubmergedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FF38);
  }
  return result;
}

unint64_t sub_23A396AD8()
{
  unint64_t result;

  result = qword_25696FF40;
  if (!qword_25696FF40)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABA6C, &type metadata for WaterDepth.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FF40);
  }
  return result;
}

unint64_t sub_23A396B20()
{
  unint64_t result;

  result = qword_25696FF80;
  if (!qword_25696FF80)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthValue, &type metadata for DepthValue);
    atomic_store(result, (unint64_t *)&qword_25696FF80);
  }
  return result;
}

unint64_t sub_23A396B68()
{
  unint64_t result;

  result = qword_25696FF88;
  if (!qword_25696FF88)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for WaterDepth, &type metadata for WaterDepth);
    atomic_store(result, (unint64_t *)&qword_25696FF88);
  }
  return result;
}

unint64_t sub_23A396BB0()
{
  unint64_t result;

  result = qword_25696FF90;
  if (!qword_25696FF90)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DepthUnit, &type metadata for DepthUnit);
    atomic_store(result, (unint64_t *)&qword_25696FF90);
  }
  return result;
}

unint64_t sub_23A396BF8()
{
  unint64_t result;

  result = qword_25696FF98;
  if (!qword_25696FF98)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for WaterType, &type metadata for WaterType);
    atomic_store(result, (unint64_t *)&qword_25696FF98);
  }
  return result;
}

unint64_t sub_23A396C40()
{
  unint64_t result;

  result = qword_25696FFA0;
  if (!qword_25696FFA0)
  {
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for Pressure.PressureUnit, &type metadata for Pressure.PressureUnit);
    atomic_store(result, (unint64_t *)&qword_25696FFA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DepthValue()
{
  return &type metadata for DepthValue;
}

uint64_t getEnumTagSinglePayload for WaterDepth(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WaterDepth(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_23A396D20(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_23A396D38(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for WaterDepth()
{
  return &type metadata for WaterDepth;
}

ValueMetadata *type metadata accessor for DepthUnit()
{
  return &type metadata for DepthUnit;
}

uint64_t storeEnumTagSinglePayload for WaterType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A396DC0 + 4 * byte_23A3AB0DD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A396DF4 + 4 * byte_23A3AB0D8[v4]))();
}

uint64_t sub_23A396DF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A396DFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A396E04);
  return result;
}

uint64_t sub_23A396E10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A396E18);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A396E1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A396E24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WaterType()
{
  return &type metadata for WaterType;
}

ValueMetadata *type metadata accessor for Pressure()
{
  return &type metadata for Pressure;
}

uint64_t _s9DepthCore9DepthUnitOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A396E9C + 4 * byte_23A3AB0E7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A396ED0 + 4 * byte_23A3AB0E2[v4]))();
}

uint64_t sub_23A396ED0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A396ED8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A396EE0);
  return result;
}

uint64_t sub_23A396EEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A396EF4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A396EF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A396F00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Pressure.PressureUnit()
{
  return &type metadata for Pressure.PressureUnit;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DepthTransform(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DepthTransform(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DepthTransform()
{
  return &type metadata for DepthTransform;
}

ValueMetadata *type metadata accessor for SubmersionStateTransform()
{
  return &type metadata for SubmersionStateTransform;
}

uint64_t storeEnumTagSinglePayload for WaterDepth.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A396FE8 + 4 * byte_23A3AB0F1[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23A39701C + 4 * byte_23A3AB0EC[v4]))();
}

uint64_t sub_23A39701C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A397024(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A39702CLL);
  return result;
}

uint64_t sub_23A397038(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A397040);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23A397044(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39704C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WaterDepth.CodingKeys()
{
  return &type metadata for WaterDepth.CodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.UnknownCodingKeys()
{
  return &type metadata for WaterDepth.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.NotSubmergedCodingKeys()
{
  return &type metadata for WaterDepth.NotSubmergedCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.ShallowCodingKeys()
{
  return &type metadata for WaterDepth.ShallowCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.NominalCodingKeys()
{
  return &type metadata for WaterDepth.NominalCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.DepthExceedingNominalRangeCodingKeys()
{
  return &type metadata for WaterDepth.DepthExceedingNominalRangeCodingKeys;
}

ValueMetadata *type metadata accessor for WaterDepth.DepthExceedingSensorLimitCodingKeys()
{
  return &type metadata for WaterDepth.DepthExceedingSensorLimitCodingKeys;
}

uint64_t _s9DepthCore10WaterDepthO17ShallowCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A39710C + 4 * byte_23A3AB0F6[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A39712C + 4 * byte_23A3AB0FB[v4]))();
}

_BYTE *sub_23A39710C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A39712C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A397134(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A39713C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A397144(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A39714C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DepthValue.CodingKeys()
{
  return &type metadata for DepthValue.CodingKeys;
}

unint64_t sub_23A39716C()
{
  unint64_t result;

  result = qword_25696FFA8;
  if (!qword_25696FFA8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB674, &type metadata for DepthValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFA8);
  }
  return result;
}

unint64_t sub_23A3971B4()
{
  unint64_t result;

  result = qword_25696FFB0;
  if (!qword_25696FFB0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB77C, &type metadata for WaterDepth.DepthExceedingNominalRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFB0);
  }
  return result;
}

unint64_t sub_23A3971FC()
{
  unint64_t result;

  result = qword_25696FFB8;
  if (!qword_25696FFB8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB834, &type metadata for WaterDepth.NominalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFB8);
  }
  return result;
}

unint64_t sub_23A397244()
{
  unint64_t result;

  result = qword_25696FFC0;
  if (!qword_25696FFC0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB8EC, &type metadata for WaterDepth.ShallowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFC0);
  }
  return result;
}

unint64_t sub_23A39728C()
{
  unint64_t result;

  result = qword_25696FFC8;
  if (!qword_25696FFC8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABA44, &type metadata for WaterDepth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFC8);
  }
  return result;
}

unint64_t sub_23A3972D4()
{
  unint64_t result;

  result = qword_25696FFD0;
  if (!qword_25696FFD0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB964, &type metadata for WaterDepth.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFD0);
  }
  return result;
}

unint64_t sub_23A39731C()
{
  unint64_t result;

  result = qword_25696FFD8;
  if (!qword_25696FFD8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB98C, &type metadata for WaterDepth.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFD8);
  }
  return result;
}

unint64_t sub_23A397364()
{
  unint64_t result;

  result = qword_25696FFE0;
  if (!qword_25696FFE0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB914, &type metadata for WaterDepth.NotSubmergedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFE0);
  }
  return result;
}

unint64_t sub_23A3973AC()
{
  unint64_t result;

  result = qword_25696FFE8;
  if (!qword_25696FFE8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB93C, &type metadata for WaterDepth.NotSubmergedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFE8);
  }
  return result;
}

unint64_t sub_23A3973F4()
{
  unint64_t result;

  result = qword_25696FFF0;
  if (!qword_25696FFF0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB85C, &type metadata for WaterDepth.ShallowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFF0);
  }
  return result;
}

unint64_t sub_23A39743C()
{
  unint64_t result;

  result = qword_25696FFF8;
  if (!qword_25696FFF8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB884, &type metadata for WaterDepth.ShallowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25696FFF8);
  }
  return result;
}

unint64_t sub_23A397484()
{
  unint64_t result;

  result = qword_256970000;
  if (!qword_256970000)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB7A4, &type metadata for WaterDepth.NominalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970000);
  }
  return result;
}

unint64_t sub_23A3974CC()
{
  unint64_t result;

  result = qword_256970008;
  if (!qword_256970008)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB7CC, &type metadata for WaterDepth.NominalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970008);
  }
  return result;
}

unint64_t sub_23A397514()
{
  unint64_t result;

  result = qword_256970010;
  if (!qword_256970010)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB6EC, &type metadata for WaterDepth.DepthExceedingNominalRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970010);
  }
  return result;
}

unint64_t sub_23A39755C()
{
  unint64_t result;

  result = qword_256970018;
  if (!qword_256970018)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB714, &type metadata for WaterDepth.DepthExceedingNominalRangeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970018);
  }
  return result;
}

unint64_t sub_23A3975A4()
{
  unint64_t result;

  result = qword_256970020;
  if (!qword_256970020)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB69C, &type metadata for WaterDepth.DepthExceedingSensorLimitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970020);
  }
  return result;
}

unint64_t sub_23A3975EC()
{
  unint64_t result;

  result = qword_256970028;
  if (!qword_256970028)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB6C4, &type metadata for WaterDepth.DepthExceedingSensorLimitCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970028);
  }
  return result;
}

unint64_t sub_23A397634()
{
  unint64_t result;

  result = qword_256970030;
  if (!qword_256970030)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB9B4, &type metadata for WaterDepth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970030);
  }
  return result;
}

unint64_t sub_23A39767C()
{
  unint64_t result;

  result = qword_256970038;
  if (!qword_256970038)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB9DC, &type metadata for WaterDepth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970038);
  }
  return result;
}

unint64_t sub_23A3976C4()
{
  unint64_t result;

  result = qword_256970040;
  if (!qword_256970040)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB5E4, &type metadata for DepthValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970040);
  }
  return result;
}

unint64_t sub_23A39770C()
{
  unint64_t result;

  result = qword_256970048;
  if (!qword_256970048)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AB60C, &type metadata for DepthValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970048);
  }
  return result;
}

uint64_t sub_23A397750(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D627553746F6ELL && a2 == 0xEC00000064656772 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x776F6C6C616873 && a2 == 0xE700000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C616E696D6F6ELL && a2 == 0xE700000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000023A3ADBC0 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000023A3ADBE0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

double UnderwaterTime.timeIntervalUntilNow.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  double v5;
  uint64_t v7;

  v0 = sub_23A3A809C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A3A8090();
  UnderwaterTime.timeInterval(untilDate:)();
  v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

void UnderwaterTime.timeInterval(untilDate:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v1 = v0;
  v2 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A3A809C();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v7);
  sub_23A37AE34(v1, (uint64_t)v4);
  v8 = (char *)sub_23A397B5C + 4 * byte_23A3ABD20[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

double sub_23A397B5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  double v7;
  double v8;
  void (*v9)(uint64_t, uint64_t);

  v5 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  v6(v3, v1, v0);
  v6(v2, v5, v0);
  sub_23A3A8048();
  v8 = v7;
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v2, v0);
  v9(v3, v0);
  return v8;
}

uint64_t type metadata accessor for UnderwaterTime()
{
  uint64_t result;

  result = qword_256970138;
  if (!qword_256970138)
    return swift_getSingletonMetadata();
  return result;
}

BOOL UnderwaterTime.isActive.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v7;

  v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A37AE34(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    sub_23A397D08((uint64_t)v3);
  }
  else
  {
    v5 = sub_23A3A809C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  }
  return EnumCaseMultiPayload == 0;
}

uint64_t sub_23A397D08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL UnderwaterTime.isTentative.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  uint64_t v9;

  v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A37AE34(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v5 = &v3[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48)];
    v6 = sub_23A3A809C();
    v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
    v7(v5, v6);
    v7(v3, v6);
  }
  else
  {
    sub_23A397D08((uint64_t)v3);
  }
  return EnumCaseMultiPayload == 1;
}

void UnderwaterTime.startDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v1);
  sub_23A37AE34(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_23A397EA8 + 4 * byte_23A3ABD24[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A397EA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v3 = sub_23A3A809C();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v0, v1, v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v0, 0, 1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
}

void UnderwaterTime.endDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v1);
  sub_23A37AE34(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_23A39800C + 4 * byte_23A3ABD28[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A39800C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v3 = sub_23A3A809C();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v0, v2, v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v0, 0, 1, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
}

void UnderwaterTime.asTentative(usingEndDate:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v1);
  sub_23A37AE34(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_23A398178 + 4 * byte_23A3ABD2C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A398178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v4 = v2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v5 = sub_23A3A809C();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v0, 1, 1, v1);
}

void UnderwaterTime.makeTentative(usingEndDate:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for UnderwaterTime();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  sub_23A37AE34(v0, (uint64_t)v4);
  v5 = (char *)sub_23A3982F4 + 4 * byte_23A3ABD30[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A3982F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v2 = sub_23A3A809C();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  return ((uint64_t (*)(uint64_t, uint64_t))v3)(v0, v2);
}

uint64_t sub_23A3983C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void UnderwaterTime.complete(withEndDate:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v1);
  sub_23A37AE34(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_23A398490 + 4 * byte_23A3ABD34[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A398490()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23A397D08(v0);
  v3 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
  v4 = sub_23A3A809C();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v0, v1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v2, v4);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A3985CC(char a1)
{
  return *(_QWORD *)&aZero_3[8 * a1];
}

uint64_t sub_23A3985EC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65746144646E65;
  else
    return 0x7461447472617473;
}

uint64_t sub_23A39862C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A39AD08(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23A398654()
{
  sub_23A399DAC();
  return sub_23A3A8720();
}

uint64_t sub_23A39867C()
{
  sub_23A399DAC();
  return sub_23A3A872C();
}

uint64_t sub_23A3986A4()
{
  char *v0;

  return sub_23A3985CC(*v0);
}

uint64_t sub_23A3986AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A39ADB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A3986D0()
{
  sub_23A399CE0();
  return sub_23A3A8720();
}

uint64_t sub_23A3986F8()
{
  sub_23A399CE0();
  return sub_23A3A872C();
}

uint64_t sub_23A398720()
{
  char *v0;

  return sub_23A3985EC(*v0);
}

uint64_t sub_23A398728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A39AF48(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A39874C()
{
  sub_23A399D24();
  return sub_23A3A8720();
}

uint64_t sub_23A398774()
{
  sub_23A399D24();
  return sub_23A3A872C();
}

uint64_t sub_23A39879C()
{
  sub_23A399D68();
  return sub_23A3A8720();
}

uint64_t sub_23A3987C4()
{
  sub_23A399D68();
  return sub_23A3A872C();
}

uint64_t sub_23A3987EC()
{
  sub_23A399DF0();
  return sub_23A3A8720();
}

uint64_t sub_23A398814()
{
  sub_23A399DF0();
  return sub_23A3A872C();
}

void UnderwaterTime.encode(to:)(_QWORD *a1)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  _QWORD v24[14];
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970050);
  v24[8] = *(_QWORD *)(v2 - 8);
  v24[9] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v24[7] = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970058);
  v24[5] = *(_QWORD *)(v4 - 8);
  v24[6] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v24[4] = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970060);
  v24[2] = *(_QWORD *)(v6 - 8);
  v24[3] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v24[1] = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23A3A809C();
  v30 = *(_QWORD *)(v25 - 8);
  v8 = MEMORY[0x24BDAC7A8](v25);
  v24[13] = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v24[11] = (char *)v24 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v24[12] = (char *)v24 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v24[10] = (char *)v24 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v24[0] = (char *)v24 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970068);
  MEMORY[0x24BDAC7A8](v17);
  v18 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970070);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v22 = (char *)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A399CE0();
  v26 = v22;
  sub_23A3A8714();
  sub_23A37AE34(v29, (uint64_t)v20);
  v23 = (char *)sub_23A398B0C + 4 * byte_23A3ABD38[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A398B0C()
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

  v2 = *(_QWORD *)(v1 - 96);
  v3 = *(_QWORD *)(v1 - 256);
  v4 = *(_QWORD *)(v1 - 144);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v3, v0, v4);
  *(_BYTE *)(v1 - 71) = 1;
  sub_23A399DAC();
  v5 = *(_QWORD *)(v1 - 248);
  v7 = *(_QWORD *)(v1 - 136);
  v6 = *(_QWORD *)(v1 - 128);
  sub_23A3A8624();
  sub_23A399E34(&qword_25696FBE8, MEMORY[0x24BDCE920]);
  v8 = *(_QWORD *)(v1 - 232);
  sub_23A3A8660();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 240) + 8))(v5, v8);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 112) + 8))(v7, v6);
}

uint64_t UnderwaterTime.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  char *v45;

  v36 = a2;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569700A0);
  v35 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v42 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569700A8);
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v41 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569700B0);
  v31[6] = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v38 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569700B8);
  v31[4] = *(_QWORD *)(v7 - 8);
  v31[5] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v37 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569700C0);
  v39 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UnderwaterTime();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v31 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v31 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v31 - v21;
  v23 = a1[3];
  v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_23A399CE0();
  v24 = v45;
  sub_23A3A8708();
  if (!v24)
  {
    v31[1] = v20;
    v31[2] = v17;
    v31[3] = v14;
    v25 = v43;
    v45 = v22;
    v26 = sub_23A3A8618();
    if (*(_QWORD *)(v26 + 16) == 1)
      __asm { BR              X10 }
    v27 = sub_23A3A8510();
    swift_allocError();
    v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F820);
    *v29 = v11;
    sub_23A3A85D0();
    sub_23A3A8504();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEE26D0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v25);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
}

void sub_23A399304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v4 - 71) = 1;
  sub_23A399DAC();
  v5 = *(_QWORD *)(v4 - 152);
  sub_23A3A85C4();
  if (!v2)
  {
    sub_23A3A809C();
    *(_QWORD *)(v4 - 128) = v1;
    sub_23A399E34(&qword_25696FC10, MEMORY[0x24BDCE960]);
    v6 = *(_QWORD *)(v4 - 248);
    sub_23A3A860C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 208) + 8))(v5, v0);
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v4 - 144) + 8))(*(_QWORD *)(v4 - 128), v3);
    swift_storeEnumTagMultiPayload();
    v7 = *(_QWORD *)(v4 - 96);
    sub_23A3983C4(v6, v7);
    sub_23A3983C4(v7, *(_QWORD *)(v4 - 168));
    JUMPOUT(0x23A3992D8);
  }
  JUMPOUT(0x23A3992B8);
}

void sub_23A3993F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v4 - 68) = 2;
  sub_23A399D68();
  sub_23A3A85C4();
  if (v2)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 144) + 8))(v0, v3);
    JUMPOUT(0x23A3992D8);
  }
  sub_23A3A809C();
  *(_BYTE *)(v4 - 69) = 0;
  sub_23A399E34(&qword_25696FC10, MEMORY[0x24BDCE960]);
  v5 = *(_QWORD *)(v4 - 240);
  v6 = *(_QWORD *)(v4 - 184);
  sub_23A3A860C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
  *(_BYTE *)(v4 - 70) = 1;
  sub_23A3A860C();
  v7 = *(_QWORD *)(v4 - 144);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 192) + 8))(v1, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(v7 + 8))(v0, *(_QWORD *)(v4 - 112));
  swift_storeEnumTagMultiPayload();
  sub_23A3983C4(v5, *(_QWORD *)(v4 - 96));
  JUMPOUT(0x23A399214);
}

uint64_t sub_23A39979C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UnderwaterTime.init(from:)(a1, a2);
}

void sub_23A3997B0(_QWORD *a1)
{
  UnderwaterTime.encode(to:)(a1);
}

void _s9DepthCore14UnderwaterTimeO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  char *v23;
  _QWORD v24[8];

  v4 = sub_23A3A809C();
  v24[6] = *(_QWORD *)(v4 - 8);
  v24[7] = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v24[3] = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v24[4] = (char *)v24 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v24[5] = (char *)v24 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v24[1] = (char *)v24 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v24[2] = (char *)v24 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v15);
  v16 = type metadata accessor for UnderwaterTime();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  MEMORY[0x24BDAC7A8](v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569701E0);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v24 + *(int *)(v20 + 48) - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A37AE34(a1, (uint64_t)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23A37AE34(a2, (uint64_t)v22);
  v23 = (char *)sub_23A3999D4 + 4 * byte_23A3ABD40[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A3999D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  sub_23A37AE34(v1, v3);
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 96) + 8))(v3, *(_QWORD *)(v4 - 88));
    sub_23A39B038(v1);
    v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)(v4 - 96);
    v7 = *(_QWORD *)(v4 - 88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v0, v2, v7);
    v5 = sub_23A3A8078();
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v8(v0, v7);
    v8(v3, v7);
    sub_23A397D08(v1);
  }
  return v5 & 1;
}

unint64_t sub_23A399CE0()
{
  unint64_t result;

  result = qword_256970078;
  if (!qword_256970078)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC2F4, &type metadata for UnderwaterTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970078);
  }
  return result;
}

unint64_t sub_23A399D24()
{
  unint64_t result;

  result = qword_256970080;
  if (!qword_256970080)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC2A4, &type metadata for UnderwaterTime.CompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970080);
  }
  return result;
}

unint64_t sub_23A399D68()
{
  unint64_t result;

  result = qword_256970088;
  if (!qword_256970088)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC254, &type metadata for UnderwaterTime.TentativeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970088);
  }
  return result;
}

unint64_t sub_23A399DAC()
{
  unint64_t result;

  result = qword_256970090;
  if (!qword_256970090)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC204, &type metadata for UnderwaterTime.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970090);
  }
  return result;
}

unint64_t sub_23A399DF0()
{
  unint64_t result;

  result = qword_256970098;
  if (!qword_256970098)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC1B4, &type metadata for UnderwaterTime.ZeroCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970098);
  }
  return result;
}

uint64_t sub_23A399E34(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23A3A809C();
    result = MEMORY[0x23B84AD3C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UnderwaterTime(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v10 = sub_23A3A809C();
      v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
      v11(a1, a2, v10);
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v11((uint64_t *)((char *)a1 + *(int *)(v12 + 48)), (uint64_t *)((char *)a2 + *(int *)(v12 + 48)), v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_23A3A809C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for UnderwaterTime(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    v4 = sub_23A3A809C();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
    v6(a1, v4);
    v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
    return ((uint64_t (*)(uint64_t, uint64_t))v6)(v5, v4);
  }
  else if (!(_DWORD)result)
  {
    v3 = sub_23A3A809C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

char *initializeWithCopy for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v8 = sub_23A3A809C();
    v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
    v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23A3A809C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithCopy for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;

  if (a1 != a2)
  {
    sub_23A397D08((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v8 = sub_23A3A809C();
      v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23A3A809C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *initializeWithTake for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v8 = sub_23A3A809C();
    v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
    v9(a1, a2, v8);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
    v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_23A3A809C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for UnderwaterTime(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;

  if (a1 != a2)
  {
    sub_23A397D08((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v8 = sub_23A3A809C();
      v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
      v9(a1, a2, v8);
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v9(&a1[*(int *)(v10 + 48)], &a2[*(int *)(v10 + 48)], v8);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_23A3A809C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for UnderwaterTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for UnderwaterTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A39A614()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A39A624()
{
  uint64_t result;
  unint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  char *v5;
  char *v6;

  result = sub_23A3A809C();
  if (v1 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v5 = &v3;
    swift_getTupleTypeLayout2();
    v6 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for UnderwaterTime.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A39A70C + 4 * byte_23A3ABD49[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A39A740 + 4 * byte_23A3ABD44[v4]))();
}

uint64_t sub_23A39A740(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39A748(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A39A750);
  return result;
}

uint64_t sub_23A39A75C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A39A764);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A39A768(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39A770(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnderwaterTime.CodingKeys()
{
  return &type metadata for UnderwaterTime.CodingKeys;
}

ValueMetadata *type metadata accessor for UnderwaterTime.ZeroCodingKeys()
{
  return &type metadata for UnderwaterTime.ZeroCodingKeys;
}

uint64_t storeEnumTagSinglePayload for UnderwaterTime.ActiveCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A39A7DC + 4 * byte_23A3ABD4E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A39A7FC + 4 * byte_23A3ABD53[v4]))();
}

_BYTE *sub_23A39A7DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A39A7FC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A39A804(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A39A80C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A39A814(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A39A81C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UnderwaterTime.ActiveCodingKeys()
{
  return &type metadata for UnderwaterTime.ActiveCodingKeys;
}

ValueMetadata *type metadata accessor for UnderwaterTime.TentativeCodingKeys()
{
  return &type metadata for UnderwaterTime.TentativeCodingKeys;
}

uint64_t _s9DepthCore14UnderwaterTimeO19TentativeCodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A39A898 + 4 * byte_23A3ABD5D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A39A8CC + 4 * byte_23A3ABD58[v4]))();
}

uint64_t sub_23A39A8CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39A8D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A39A8DCLL);
  return result;
}

uint64_t sub_23A39A8E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A39A8F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A39A8F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39A8FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnderwaterTime.CompletedCodingKeys()
{
  return &type metadata for UnderwaterTime.CompletedCodingKeys;
}

unint64_t sub_23A39A91C()
{
  unint64_t result;

  result = qword_256970170;
  if (!qword_256970170)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABF14, &type metadata for UnderwaterTime.CompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970170);
  }
  return result;
}

unint64_t sub_23A39A964()
{
  unint64_t result;

  result = qword_256970178;
  if (!qword_256970178)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABFCC, &type metadata for UnderwaterTime.TentativeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970178);
  }
  return result;
}

unint64_t sub_23A39A9AC()
{
  unint64_t result;

  result = qword_256970180;
  if (!qword_256970180)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC084, &type metadata for UnderwaterTime.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970180);
  }
  return result;
}

unint64_t sub_23A39A9F4()
{
  unint64_t result;

  result = qword_256970188;
  if (!qword_256970188)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC18C, &type metadata for UnderwaterTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970188);
  }
  return result;
}

unint64_t sub_23A39AA3C()
{
  unint64_t result;

  result = qword_256970190;
  if (!qword_256970190)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC0AC, &type metadata for UnderwaterTime.ZeroCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970190);
  }
  return result;
}

unint64_t sub_23A39AA84()
{
  unint64_t result;

  result = qword_256970198;
  if (!qword_256970198)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC0D4, &type metadata for UnderwaterTime.ZeroCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970198);
  }
  return result;
}

unint64_t sub_23A39AACC()
{
  unint64_t result;

  result = qword_2569701A0;
  if (!qword_2569701A0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABFF4, &type metadata for UnderwaterTime.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701A0);
  }
  return result;
}

unint64_t sub_23A39AB14()
{
  unint64_t result;

  result = qword_2569701A8;
  if (!qword_2569701A8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC01C, &type metadata for UnderwaterTime.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701A8);
  }
  return result;
}

unint64_t sub_23A39AB5C()
{
  unint64_t result;

  result = qword_2569701B0;
  if (!qword_2569701B0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABF3C, &type metadata for UnderwaterTime.TentativeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701B0);
  }
  return result;
}

unint64_t sub_23A39ABA4()
{
  unint64_t result;

  result = qword_2569701B8;
  if (!qword_2569701B8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABF64, &type metadata for UnderwaterTime.TentativeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701B8);
  }
  return result;
}

unint64_t sub_23A39ABEC()
{
  unint64_t result;

  result = qword_2569701C0;
  if (!qword_2569701C0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABE84, &type metadata for UnderwaterTime.CompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701C0);
  }
  return result;
}

unint64_t sub_23A39AC34()
{
  unint64_t result;

  result = qword_2569701C8;
  if (!qword_2569701C8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3ABEAC, &type metadata for UnderwaterTime.CompletedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701C8);
  }
  return result;
}

unint64_t sub_23A39AC7C()
{
  unint64_t result;

  result = qword_2569701D0;
  if (!qword_2569701D0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC0FC, &type metadata for UnderwaterTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701D0);
  }
  return result;
}

unint64_t sub_23A39ACC4()
{
  unint64_t result;

  result = qword_2569701D8;
  if (!qword_2569701D8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC124, &type metadata for UnderwaterTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701D8);
  }
  return result;
}

uint64_t sub_23A39AD08(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23A39AD94()
{
  return 0x7461447472617473;
}

uint64_t sub_23A39ADB0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1869768058 && a2 == 0xE400000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x76697461746E6574 && a2 == 0xE900000000000065 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23A39AF48(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7461447472617473 && a2 == 0xE900000000000065;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746144646E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A39B038(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569701E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t InSessionRecoveryData.sessionUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A3A80F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t InSessionRecoveryData.sessionUUID.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A3A80F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*InSessionRecoveryData.sessionUUID.modify())()
{
  return nullsub_1;
}

uint64_t InSessionRecoveryData.underwaterTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for InSessionRecoveryData(0);
  return sub_23A39BC30(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(_QWORD))type metadata accessor for UnderwaterTime);
}

uint64_t type metadata accessor for InSessionRecoveryData(uint64_t a1)
{
  return sub_23A39C25C(a1, qword_2569702E8);
}

uint64_t InSessionRecoveryData.underwaterTime.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 20);
  return sub_23A39B180(a1, v3);
}

uint64_t sub_23A39B180(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UnderwaterTime();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*InSessionRecoveryData.underwaterTime.modify())()
{
  type metadata accessor for InSessionRecoveryData(0);
  return nullsub_1;
}

uint64_t InSessionRecoveryData.maxDepth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;

  result = type metadata accessor for InSessionRecoveryData(0);
  v4 = (uint64_t *)(v1 + *(int *)(result + 24));
  v5 = *v4;
  LOBYTE(v4) = *((_BYTE *)v4 + 8);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t InSessionRecoveryData.maxDepth.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  result = type metadata accessor for InSessionRecoveryData(0);
  v5 = v1 + *(int *)(result + 24);
  *(_QWORD *)v5 = v2;
  *(_BYTE *)(v5 + 8) = v3;
  return result;
}

uint64_t (*InSessionRecoveryData.maxDepth.modify())()
{
  type metadata accessor for InSessionRecoveryData(0);
  return nullsub_1;
}

__n128 InSessionRecoveryData.temperatureRange.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 28));
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t InSessionRecoveryData.temperatureRange.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = type metadata accessor for InSessionRecoveryData(0);
  v6 = v1 + *(int *)(result + 28);
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = v3;
  *(_BYTE *)(v6 + 16) = v4;
  return result;
}

uint64_t (*InSessionRecoveryData.temperatureRange.modify())()
{
  type metadata accessor for InSessionRecoveryData(0);
  return nullsub_1;
}

uint64_t InSessionRecoveryData.didHaveActiveRuntimeSession.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 32));
}

uint64_t InSessionRecoveryData.didHaveActiveRuntimeSession.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for InSessionRecoveryData(0);
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*InSessionRecoveryData.didHaveActiveRuntimeSession.modify())()
{
  type metadata accessor for InSessionRecoveryData(0);
  return nullsub_1;
}

uint64_t InSessionRecoveryData.init(sessionUUID:underwaterTime:maxDepth:temperatureRange:didHaveActiveRuntimeSession:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  v10 = *a3;
  v11 = *((_BYTE *)a3 + 8);
  v12 = *a4;
  v13 = a4[1];
  v14 = *((_BYTE *)a4 + 16);
  v15 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a6, a1, v15);
  v16 = (int *)type metadata accessor for InSessionRecoveryData(0);
  result = sub_23A39C2D4(a2, a6 + v16[5], (uint64_t (*)(_QWORD))type metadata accessor for UnderwaterTime);
  v18 = a6 + v16[6];
  *(_QWORD *)v18 = v10;
  *(_BYTE *)(v18 + 8) = v11;
  v19 = a6 + v16[7];
  *(_QWORD *)v19 = v12;
  *(_QWORD *)(v19 + 8) = v13;
  *(_BYTE *)(v19 + 16) = v14;
  *(_BYTE *)(a6 + v16[8]) = a5;
  return result;
}

uint64_t sub_23A39B46C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A39B4A4 + 4 * byte_23A3AC390[a1]))(0xD000000000000010, 0x800000023A3ADB60);
}

uint64_t sub_23A39B4A4()
{
  return 0x556E6F6973736573;
}

uint64_t sub_23A39B4C4()
{
  return 0x7461777265646E75;
}

uint64_t sub_23A39B4E8()
{
  return 0x687470654478616DLL;
}

uint64_t sub_23A39B500(uint64_t a1)
{
  return a1 + 11;
}

uint64_t sub_23A39B518()
{
  unsigned __int8 *v0;

  return sub_23A39B46C(*v0);
}

uint64_t sub_23A39B520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A39ED14(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A39B544()
{
  sub_23A39B7E8();
  return sub_23A3A8720();
}

uint64_t sub_23A39B56C()
{
  sub_23A39B7E8();
  return sub_23A3A872C();
}

uint64_t InSessionRecoveryData.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __int128 *v12;
  char v13;
  __int128 v15;
  char v16;
  char v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569701E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A39B7E8();
  sub_23A3A8714();
  LOBYTE(v15) = 0;
  sub_23A3A80F0();
  sub_23A38B374(&qword_25696FBE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23A3A8660();
  if (!v2)
  {
    v9 = type metadata accessor for InSessionRecoveryData(0);
    LOBYTE(v15) = 1;
    type metadata accessor for UnderwaterTime();
    sub_23A38B374(&qword_2569701F8, (uint64_t (*)(uint64_t))type metadata accessor for UnderwaterTime, (uint64_t)&protocol conformance descriptor for UnderwaterTime);
    sub_23A3A8660();
    v10 = (uint64_t *)(v3 + *(int *)(v9 + 24));
    v11 = *v10;
    LOBYTE(v10) = *((_BYTE *)v10 + 8);
    *(_QWORD *)&v15 = v11;
    BYTE8(v15) = (_BYTE)v10;
    v17 = 2;
    sub_23A38D5D8();
    sub_23A3A8660();
    v12 = (__int128 *)(v3 + *(int *)(v9 + 28));
    v13 = *((_BYTE *)v12 + 16);
    v15 = *v12;
    v16 = v13;
    v17 = 3;
    sub_23A38D61C();
    sub_23A3A8660();
    LOBYTE(v15) = 4;
    sub_23A3A8648();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_23A39B7E8()
{
  unint64_t result;

  result = qword_2569701F0;
  if (!qword_2569701F0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC9D4, &type metadata for InSessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569701F0);
  }
  return result;
}

uint64_t InSessionRecoveryData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  __int128 v33;
  char v34;
  char v35;

  v25 = a2;
  v26 = type metadata accessor for UnderwaterTime();
  MEMORY[0x24BDAC7A8](v26);
  v27 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_23A3A80F0();
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v29 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970200);
  v6 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for InSessionRecoveryData(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A39B7E8();
  v31 = v8;
  v12 = (uint64_t)v32;
  sub_23A3A8708();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v13 = (uint64_t)v27;
  v24 = v6;
  v32 = a1;
  v14 = (uint64_t)v11;
  LOBYTE(v33) = 0;
  sub_23A38B374(&qword_25696FC08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v15 = v28;
  v16 = v29;
  sub_23A3A860C();
  v23 = v4;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v14, v16, v15);
  LOBYTE(v33) = 1;
  sub_23A38B374(&qword_256970208, (uint64_t (*)(uint64_t))type metadata accessor for UnderwaterTime, (uint64_t)&protocol conformance descriptor for UnderwaterTime);
  sub_23A3A860C();
  sub_23A39C2D4(v13, v14 + v9[5], (uint64_t (*)(_QWORD))type metadata accessor for UnderwaterTime);
  v35 = 2;
  sub_23A38DB18();
  sub_23A3A860C();
  v17 = BYTE8(v33);
  v18 = v14 + v9[6];
  *(_QWORD *)v18 = v33;
  *(_BYTE *)(v18 + 8) = v17;
  v35 = 3;
  sub_23A38DB5C();
  sub_23A3A860C();
  v19 = v34;
  v20 = v14 + v9[7];
  *(_OWORD *)v20 = v33;
  *(_BYTE *)(v20 + 16) = v19;
  LOBYTE(v33) = 4;
  v21 = sub_23A3A85F4();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v31, v30);
  *(_BYTE *)(v14 + v9[8]) = v21 & 1;
  sub_23A39BC30(v14, v25, type metadata accessor for InSessionRecoveryData);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
  return sub_23A38E8C8(v14, type metadata accessor for InSessionRecoveryData);
}

uint64_t sub_23A39BC30(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A39BC74(char a1)
{
  return *(_QWORD *)&aNone_0[8 * a1];
}

uint64_t sub_23A39BC94@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InSessionRecoveryData.init(from:)(a1, a2);
}

uint64_t sub_23A39BCA8(_QWORD *a1)
{
  return InSessionRecoveryData.encode(to:)(a1);
}

uint64_t sub_23A39BCBC()
{
  char *v0;

  return sub_23A39BC74(*v0);
}

uint64_t sub_23A39BCC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A39EF34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A39BCE8()
{
  sub_23A39C290();
  return sub_23A3A8720();
}

uint64_t sub_23A39BD10()
{
  sub_23A39C290();
  return sub_23A3A872C();
}

uint64_t sub_23A39BD38()
{
  sub_23A39C35C();
  return sub_23A3A8720();
}

uint64_t sub_23A39BD60()
{
  sub_23A39C35C();
  return sub_23A3A872C();
}

uint64_t sub_23A39BD88()
{
  sub_23A39C3A0();
  return sub_23A3A8720();
}

uint64_t sub_23A39BDB0()
{
  sub_23A39C3A0();
  return sub_23A3A872C();
}

uint64_t sub_23A39BDD8()
{
  sub_23A39C318();
  return sub_23A3A8720();
}

uint64_t sub_23A39BE00()
{
  sub_23A39C318();
  return sub_23A3A872C();
}

uint64_t SessionRecoveryData.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int EnumCaseMultiPayload;
  uint64_t (*v19)(_QWORD);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char v44;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970210);
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v36 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for SessionSummary();
  MEMORY[0x24BDAC7A8](v34);
  v35 = (uint64_t)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970218);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for InSessionRecoveryData(0);
  MEMORY[0x24BDAC7A8](v30);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970220);
  v9 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SessionRecoveryData(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970228);
  v40 = *(_QWORD *)(v15 - 8);
  v41 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A39C290();
  sub_23A3A8714();
  sub_23A39BC30(v39, (uint64_t)v14, type metadata accessor for SessionRecoveryData);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v19 = type metadata accessor for InSessionRecoveryData;
    sub_23A39C2D4((uint64_t)v14, (uint64_t)v8, type metadata accessor for InSessionRecoveryData);
    v43 = 1;
    sub_23A39C35C();
    v25 = v31;
    v22 = v41;
    sub_23A3A8624();
    sub_23A38B374(&qword_256970250, type metadata accessor for InSessionRecoveryData, (uint64_t)&protocol conformance descriptor for InSessionRecoveryData);
    v26 = v33;
    sub_23A3A8660();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v26);
    v24 = (uint64_t)v8;
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v19 = (uint64_t (*)(_QWORD))type metadata accessor for SessionSummary;
    v20 = v35;
    sub_23A39C2D4((uint64_t)v14, v35, (uint64_t (*)(_QWORD))type metadata accessor for SessionSummary);
    v44 = 2;
    sub_23A39C318();
    v21 = v36;
    v22 = v41;
    sub_23A3A8624();
    sub_23A38B374(&qword_256970240, (uint64_t (*)(uint64_t))type metadata accessor for SessionSummary, (uint64_t)&protocol conformance descriptor for SessionSummary);
    v23 = v38;
    sub_23A3A8660();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v21, v23);
    v24 = v20;
LABEL_5:
    sub_23A38E8C8(v24, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v17, v22);
  }
  v42 = 0;
  sub_23A39C3A0();
  v28 = v41;
  sub_23A3A8624();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v17, v28);
}

uint64_t type metadata accessor for SessionRecoveryData(uint64_t a1)
{
  return sub_23A39C25C(a1, qword_2569703A0);
}

uint64_t sub_23A39C25C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23A39C290()
{
  unint64_t result;

  result = qword_256970230;
  if (!qword_256970230)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC984, &type metadata for SessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970230);
  }
  return result;
}

uint64_t sub_23A39C2D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_23A39C318()
{
  unint64_t result;

  result = qword_256970238;
  if (!qword_256970238)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC934, &type metadata for SessionRecoveryData.SummaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970238);
  }
  return result;
}

unint64_t sub_23A39C35C()
{
  unint64_t result;

  result = qword_256970248;
  if (!qword_256970248)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC8E4, &type metadata for SessionRecoveryData.InSessionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970248);
  }
  return result;
}

unint64_t sub_23A39C3A0()
{
  unint64_t result;

  result = qword_256970258;
  if (!qword_256970258)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC894, &type metadata for SessionRecoveryData.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970258);
  }
  return result;
}

uint64_t SessionRecoveryData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  char *v41;
  char *v42;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  _QWORD *v65;
  uint64_t v66;
  char v67;
  char v68;
  char v69;

  v59 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970260);
  v4 = *(_QWORD *)(v3 - 8);
  v57 = v3;
  v58 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v64 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970268);
  v55 = *(_QWORD *)(v6 - 8);
  v56 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970270);
  v53 = *(_QWORD *)(v8 - 8);
  v54 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v62 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970278);
  v61 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SessionRecoveryData(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v49 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v49 - v19;
  v21 = a1[3];
  v65 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_23A39C290();
  v22 = v11;
  v23 = v66;
  sub_23A3A8708();
  if (v23)
    goto LABEL_9;
  v25 = v61;
  v24 = v62;
  v50 = v15;
  v51 = v18;
  v52 = v20;
  v66 = v12;
  v27 = v63;
  v26 = v64;
  v28 = v22;
  v29 = sub_23A3A8618();
  if (*(_QWORD *)(v29 + 16) != 1)
  {
    v37 = v27;
    v38 = sub_23A3A8510();
    swift_allocError();
    v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F820);
    *v40 = v66;
    sub_23A3A85D0();
    sub_23A3A8504();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v40, *MEMORY[0x24BEE26D0], v38);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v37);
LABEL_9:
    v34 = (uint64_t)v65;
    return __swift_destroy_boxed_opaque_existential_0(v34);
  }
  v30 = v22;
  v31 = v25;
  if (*(_BYTE *)(v29 + 32))
  {
    if (*(_BYTE *)(v29 + 32) == 1)
    {
      v68 = 1;
      sub_23A39C35C();
      v32 = v60;
      sub_23A3A85C4();
      type metadata accessor for InSessionRecoveryData(0);
      sub_23A38B374(&qword_256970288, type metadata accessor for InSessionRecoveryData, (uint64_t)&protocol conformance descriptor for InSessionRecoveryData);
      v33 = v56;
      sub_23A3A860C();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v27);
      v34 = (uint64_t)v65;
      v35 = (uint64_t)v51;
      swift_storeEnumTagMultiPayload();
      v36 = v35;
    }
    else
    {
      v69 = 2;
      sub_23A39C318();
      v41 = v26;
      v42 = v28;
      sub_23A3A85C4();
      type metadata accessor for SessionSummary();
      sub_23A38B374(&qword_256970280, (uint64_t (*)(uint64_t))type metadata accessor for SessionSummary, (uint64_t)&protocol conformance descriptor for SessionSummary);
      v45 = (uint64_t)v50;
      v46 = v41;
      v47 = v27;
      v48 = v57;
      sub_23A3A860C();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v46, v48);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v42, v47);
      v34 = (uint64_t)v65;
      swift_storeEnumTagMultiPayload();
      v36 = v45;
    }
    v44 = (uint64_t)v52;
    sub_23A39C2D4(v36, (uint64_t)v52, type metadata accessor for SessionRecoveryData);
  }
  else
  {
    v67 = 0;
    sub_23A39C3A0();
    sub_23A3A85C4();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v24, v54);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v30, v27);
    v44 = (uint64_t)v52;
    swift_storeEnumTagMultiPayload();
    v34 = (uint64_t)v65;
  }
  sub_23A39C2D4(v44, v59, type metadata accessor for SessionRecoveryData);
  return __swift_destroy_boxed_opaque_existential_0(v34);
}

uint64_t sub_23A39C998@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SessionRecoveryData.init(from:)(a1, a2);
}

uint64_t sub_23A39C9AC(_QWORD *a1)
{
  return SessionRecoveryData.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for InSessionRecoveryData(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A3A80F0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for UnderwaterTime();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v15 = sub_23A3A809C();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      v16(v9, v10, v15);
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v16(&v9[*(int *)(v17 + 48)], &v10[*(int *)(v17 + 48)], v15);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      v13 = sub_23A3A809C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v9, v10, v13);
      swift_storeEnumTagMultiPayload();
    }
    v18 = a3[6];
    v19 = a3[7];
    v20 = (char *)a1 + v18;
    v21 = (char *)a2 + v18;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    v20[8] = v21[8];
    v22 = (char *)a1 + v19;
    v23 = (char *)a2 + v19;
    *(_OWORD *)v22 = *(_OWORD *)v23;
    v22[16] = v23[16];
    *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  }
  return a1;
}

uint64_t destroy for InSessionRecoveryData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  v4 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  type metadata accessor for UnderwaterTime();
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    v8 = sub_23A3A809C();
    v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v10(v5, v8);
    v9 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v8);
  }
  else if (!(_DWORD)result)
  {
    v7 = sub_23A3A809C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return result;
}

uint64_t initializeWithCopy for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for UnderwaterTime();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v13 = sub_23A3A809C();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v14(v8, v9, v13);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
    v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v12 = sub_23A3A809C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
    swift_storeEnumTagMultiPayload();
  }
  v16 = a3[6];
  v17 = a3[7];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  v20 = a1 + v17;
  v21 = a2 + v17;
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_BYTE *)(v20 + 16) = *(_BYTE *)(v21 + 16);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithCopy for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  __int128 v23;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (char *)(a1 + v7);
    v9 = (char *)(a2 + v7);
    sub_23A38E8C8(a1 + v7, (uint64_t (*)(_QWORD))type metadata accessor for UnderwaterTime);
    v10 = type metadata accessor for UnderwaterTime();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v13 = sub_23A3A809C();
      v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
      v14(v8, v9, v13);
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      v12 = sub_23A3A809C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  v16 = a3[6];
  v17 = a1 + v16;
  v18 = (uint64_t *)(a2 + v16);
  v19 = *v18;
  *(_BYTE *)(v17 + 8) = *((_BYTE *)v18 + 8);
  *(_QWORD *)v17 = v19;
  v20 = a3[7];
  v21 = a1 + v20;
  v22 = (__int128 *)(a2 + v20);
  v23 = *v22;
  *(_BYTE *)(v21 + 16) = *((_BYTE *)v22 + 16);
  *(_OWORD *)v21 = v23;
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = type metadata accessor for UnderwaterTime();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v13 = sub_23A3A809C();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
    v14(v8, v9, v13);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
    v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    v12 = sub_23A3A809C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v8, v9, v12);
    swift_storeEnumTagMultiPayload();
  }
  v16 = a3[6];
  v17 = a3[7];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  v20 = a1 + v17;
  v21 = a2 + v17;
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_BYTE *)(v20 + 16) = *(_BYTE *)(v21 + 16);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for InSessionRecoveryData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[5];
    v8 = (char *)(a1 + v7);
    v9 = (char *)(a2 + v7);
    sub_23A38E8C8(a1 + v7, (uint64_t (*)(_QWORD))type metadata accessor for UnderwaterTime);
    v10 = type metadata accessor for UnderwaterTime();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v13 = sub_23A3A809C();
      v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
      v14(v8, v9, v13);
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v14(&v8[*(int *)(v15 + 48)], &v9[*(int *)(v15 + 48)], v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      v12 = sub_23A3A809C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v8, v9, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  v16 = a3[6];
  v17 = a3[7];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  v20 = a1 + v17;
  v21 = a2 + v17;
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_BYTE *)(v20 + 16) = *(_BYTE *)(v21 + 16);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for InSessionRecoveryData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A39D420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = type metadata accessor for UnderwaterTime();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32));
  if (v14 >= 2)
    return ((v14 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InSessionRecoveryData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A39D4E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_23A3A80F0();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = type metadata accessor for UnderwaterTime();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 32)) = a2 + 1;
  return result;
}

uint64_t sub_23A39D588()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A3A80F0();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for UnderwaterTime();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for SessionRecoveryData(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v16 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v17 = sub_23A3A80F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a1, a2, v17);
      v18 = (int *)type metadata accessor for SessionSummary();
      v19 = v18[5];
      v20 = &a1[v19];
      v21 = &a2[v19];
      v22 = sub_23A3A809C();
      v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
      v23(v20, v21, v22);
      v23(&a1[v18[6]], &a2[v18[6]], v22);
      v24 = v18[7];
      v25 = &a1[v24];
      v26 = &a2[v24];
      *(_QWORD *)v25 = *(_QWORD *)v26;
      v25[8] = v26[8];
      v27 = v18[8];
      v28 = &a1[v27];
      v29 = &a2[v27];
      *(_OWORD *)v28 = *(_OWORD *)v29;
      v28[16] = v29[16];
LABEL_15:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v8 = sub_23A3A80F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = (int *)type metadata accessor for InSessionRecoveryData(0);
      v10 = v9[5];
      v11 = &a1[v10];
      v12 = &a2[v10];
      v13 = type metadata accessor for UnderwaterTime();
      v14 = swift_getEnumCaseMultiPayload();
      if (v14 == 2 || v14 == 1)
      {
        v30 = sub_23A3A809C();
        v31 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
        v31(v11, v12, v30);
        v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
        v31(&v11[*(int *)(v32 + 48)], &v12[*(int *)(v32 + 48)], v30);
        swift_storeEnumTagMultiPayload();
      }
      else if (v14)
      {
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        v15 = sub_23A3A809C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v11, v12, v15);
        swift_storeEnumTagMultiPayload();
      }
      v33 = v9[6];
      v34 = &a1[v33];
      v35 = &a2[v33];
      *(_QWORD *)v34 = *(_QWORD *)v35;
      v34[8] = v35[8];
      v36 = v9[7];
      v37 = &a1[v36];
      v38 = &a2[v36];
      v37[16] = v38[16];
      *(_OWORD *)v37 = *(_OWORD *)v38;
      a1[v9[8]] = a2[v9[8]];
      goto LABEL_15;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for SessionRecoveryData(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v8 = sub_23A3A80F0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
    v9 = type metadata accessor for SessionSummary();
    v10 = a1 + *(int *)(v9 + 20);
    v11 = sub_23A3A809C();
    v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v13(v10, v11);
    v7 = a1 + *(int *)(v9 + 24);
    v5 = v11;
LABEL_10:
    v6 = (uint64_t (*)(uint64_t, uint64_t))v13;
    return v6(v7, v5);
  }
  if ((_DWORD)result)
    return result;
  v3 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  v4 = a1 + *(int *)(type metadata accessor for InSessionRecoveryData(0) + 20);
  type metadata accessor for UnderwaterTime();
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    v12 = sub_23A3A809C();
    v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
    v13(v4, v12);
    v7 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0) + 48);
    v5 = v12;
    goto LABEL_10;
  }
  if (!(_DWORD)result)
  {
    v5 = sub_23A3A809C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7 = v4;
    return v6(v7, v5);
  }
  return result;
}

_BYTE *initializeWithCopy for SessionRecoveryData(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v15 = sub_23A3A80F0();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
    v16 = (int *)type metadata accessor for SessionSummary();
    v17 = v16[5];
    v18 = &a1[v17];
    v19 = &a2[v17];
    v20 = sub_23A3A809C();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    v21(&a1[v16[6]], &a2[v16[6]], v20);
    v22 = v16[7];
    v23 = &a1[v22];
    v24 = &a2[v22];
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    v25 = v16[8];
    v26 = &a1[v25];
    v27 = &a2[v25];
    *(_OWORD *)v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = sub_23A3A80F0();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
    v9 = v8[5];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = type metadata accessor for UnderwaterTime();
    v13 = swift_getEnumCaseMultiPayload();
    if (v13 == 2 || v13 == 1)
    {
      v28 = sub_23A3A809C();
      v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
      v29(v10, v11, v28);
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v29(&v10[*(int *)(v30 + 48)], &v11[*(int *)(v30 + 48)], v28);
      swift_storeEnumTagMultiPayload();
    }
    else if (v13)
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v14 = sub_23A3A809C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
      swift_storeEnumTagMultiPayload();
    }
    v31 = v8[6];
    v32 = &a1[v31];
    v33 = &a2[v31];
    *(_QWORD *)v32 = *(_QWORD *)v33;
    v32[8] = v33[8];
    v34 = v8[7];
    v35 = &a1[v34];
    v36 = &a2[v34];
    v35[16] = v36[16];
    *(_OWORD *)v35 = *(_OWORD *)v36;
    a1[v8[8]] = a2[v8[8]];
    goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_BYTE *assignWithCopy for SessionRecoveryData(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  char v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  __int128 v40;

  if (a1 != a2)
  {
    sub_23A38E8C8((uint64_t)a1, type metadata accessor for SessionRecoveryData);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v15 = sub_23A3A80F0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
      v16 = (int *)type metadata accessor for SessionSummary();
      v17 = v16[5];
      v18 = &a1[v17];
      v19 = &a2[v17];
      v20 = sub_23A3A809C();
      v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
      v21(v18, v19, v20);
      v21(&a1[v16[6]], &a2[v16[6]], v20);
      v22 = v16[7];
      v23 = &a1[v22];
      v24 = &a2[v22];
      v25 = v24[8];
      *(_QWORD *)v23 = *(_QWORD *)v24;
      v23[8] = v25;
      v26 = v16[8];
      v27 = &a1[v26];
      v28 = &a2[v26];
      v29 = v28[16];
      *(_OWORD *)v27 = *(_OWORD *)v28;
      v27[16] = v29;
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v7 = sub_23A3A80F0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
      v9 = v8[5];
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = type metadata accessor for UnderwaterTime();
      v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 2 || v13 == 1)
      {
        v30 = sub_23A3A809C();
        v31 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
        v31(v10, v11, v30);
        v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
        v31(&v10[*(int *)(v32 + 48)], &v11[*(int *)(v32 + 48)], v30);
        swift_storeEnumTagMultiPayload();
      }
      else if (v13)
      {
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        v14 = sub_23A3A809C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v10, v11, v14);
        swift_storeEnumTagMultiPayload();
      }
      v33 = v8[6];
      v34 = &a1[v33];
      v35 = &a2[v33];
      v36 = *(_QWORD *)v35;
      v34[8] = v35[8];
      *(_QWORD *)v34 = v36;
      v37 = v8[7];
      v38 = &a1[v37];
      v39 = &a2[v37];
      v40 = *(_OWORD *)v39;
      v38[16] = v39[16];
      *(_OWORD *)v38 = v40;
      a1[v8[8]] = a2[v8[8]];
      goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_BYTE *initializeWithTake for SessionRecoveryData(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v15 = sub_23A3A80F0();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a1, a2, v15);
    v16 = (int *)type metadata accessor for SessionSummary();
    v17 = v16[5];
    v18 = &a1[v17];
    v19 = &a2[v17];
    v20 = sub_23A3A809C();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32);
    v21(v18, v19, v20);
    v21(&a1[v16[6]], &a2[v16[6]], v20);
    v22 = v16[7];
    v23 = &a1[v22];
    v24 = &a2[v22];
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    v25 = v16[8];
    v26 = &a1[v25];
    v27 = &a2[v25];
    *(_OWORD *)v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = sub_23A3A80F0();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
    v9 = v8[5];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = type metadata accessor for UnderwaterTime();
    v13 = swift_getEnumCaseMultiPayload();
    if (v13 == 2 || v13 == 1)
    {
      v28 = sub_23A3A809C();
      v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32);
      v29(v10, v11, v28);
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
      v29(&v10[*(int *)(v30 + 48)], &v11[*(int *)(v30 + 48)], v28);
      swift_storeEnumTagMultiPayload();
    }
    else if (v13)
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v14 = sub_23A3A809C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v10, v11, v14);
      swift_storeEnumTagMultiPayload();
    }
    v31 = v8[6];
    v32 = &a1[v31];
    v33 = &a2[v31];
    *(_QWORD *)v32 = *(_QWORD *)v33;
    v32[8] = v33[8];
    v34 = v8[7];
    v35 = &a1[v34];
    v36 = &a2[v34];
    v35[16] = v36[16];
    *(_OWORD *)v35 = *(_OWORD *)v36;
    a1[v8[8]] = a2[v8[8]];
    goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_BYTE *assignWithTake for SessionRecoveryData(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;

  if (a1 != a2)
  {
    sub_23A38E8C8((uint64_t)a1, type metadata accessor for SessionRecoveryData);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v15 = sub_23A3A80F0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a1, a2, v15);
      v16 = (int *)type metadata accessor for SessionSummary();
      v17 = v16[5];
      v18 = &a1[v17];
      v19 = &a2[v17];
      v20 = sub_23A3A809C();
      v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32);
      v21(v18, v19, v20);
      v21(&a1[v16[6]], &a2[v16[6]], v20);
      v22 = v16[7];
      v23 = &a1[v22];
      v24 = &a2[v22];
      *(_QWORD *)v23 = *(_QWORD *)v24;
      v23[8] = v24[8];
      v25 = v16[8];
      v26 = &a1[v25];
      v27 = &a2[v25];
      *(_OWORD *)v26 = *(_OWORD *)v27;
      v26[16] = v27[16];
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v7 = sub_23A3A80F0();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = (int *)type metadata accessor for InSessionRecoveryData(0);
      v9 = v8[5];
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = type metadata accessor for UnderwaterTime();
      v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 2 || v13 == 1)
      {
        v28 = sub_23A3A809C();
        v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32);
        v29(v10, v11, v28);
        v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D0);
        v29(&v10[*(int *)(v30 + 48)], &v11[*(int *)(v30 + 48)], v28);
        swift_storeEnumTagMultiPayload();
      }
      else if (v13)
      {
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        v14 = sub_23A3A809C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v10, v11, v14);
        swift_storeEnumTagMultiPayload();
      }
      v31 = v8[6];
      v32 = &a1[v31];
      v33 = &a2[v31];
      *(_QWORD *)v32 = *(_QWORD *)v33;
      v32[8] = v33[8];
      v34 = v8[7];
      v35 = &a1[v34];
      v36 = &a2[v34];
      v35[16] = v36[16];
      *(_OWORD *)v35 = *(_OWORD *)v36;
      a1[v8[8]] = a2[v8[8]];
      goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_23A39E64C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for InSessionRecoveryData(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for SessionSummary();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SessionRecoveryData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A39E718 + 4 * byte_23A3AC39A[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A39E74C + 4 * byte_23A3AC395[v4]))();
}

uint64_t sub_23A39E74C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39E754(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A39E75CLL);
  return result;
}

uint64_t sub_23A39E768(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A39E770);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A39E774(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39E77C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SessionRecoveryData.CodingKeys()
{
  return &type metadata for SessionRecoveryData.CodingKeys;
}

ValueMetadata *type metadata accessor for SessionRecoveryData.NoneCodingKeys()
{
  return &type metadata for SessionRecoveryData.NoneCodingKeys;
}

ValueMetadata *type metadata accessor for SessionRecoveryData.InSessionCodingKeys()
{
  return &type metadata for SessionRecoveryData.InSessionCodingKeys;
}

uint64_t _s9DepthCore19SessionRecoveryDataO19InSessionCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A39E7FC + 4 * byte_23A3AC39F[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A39E81C + 4 * byte_23A3AC3A4[v4]))();
}

_BYTE *sub_23A39E7FC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A39E81C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A39E824(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A39E82C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A39E834(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A39E83C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SessionRecoveryData.SummaryCodingKeys()
{
  return &type metadata for SessionRecoveryData.SummaryCodingKeys;
}

uint64_t storeEnumTagSinglePayload for InSessionRecoveryData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A39E8A4 + 4 * byte_23A3AC3AE[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23A39E8D8 + 4 * byte_23A3AC3A9[v4]))();
}

uint64_t sub_23A39E8D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39E8E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A39E8E8);
  return result;
}

uint64_t sub_23A39E8F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A39E8FCLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23A39E900(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A39E908(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InSessionRecoveryData.CodingKeys()
{
  return &type metadata for InSessionRecoveryData.CodingKeys;
}

unint64_t sub_23A39E928()
{
  unint64_t result;

  result = qword_2569703D8;
  if (!qword_2569703D8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC5F4, &type metadata for InSessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569703D8);
  }
  return result;
}

unint64_t sub_23A39E970()
{
  unint64_t result;

  result = qword_2569703E0;
  if (!qword_2569703E0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC6AC, &type metadata for SessionRecoveryData.SummaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569703E0);
  }
  return result;
}

unint64_t sub_23A39E9B8()
{
  unint64_t result;

  result = qword_2569703E8;
  if (!qword_2569703E8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC764, &type metadata for SessionRecoveryData.InSessionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569703E8);
  }
  return result;
}

unint64_t sub_23A39EA00()
{
  unint64_t result;

  result = qword_2569703F0;
  if (!qword_2569703F0)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC86C, &type metadata for SessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569703F0);
  }
  return result;
}

unint64_t sub_23A39EA48()
{
  unint64_t result;

  result = qword_2569703F8;
  if (!qword_2569703F8)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC78C, &type metadata for SessionRecoveryData.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2569703F8);
  }
  return result;
}

unint64_t sub_23A39EA90()
{
  unint64_t result;

  result = qword_256970400;
  if (!qword_256970400)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC7B4, &type metadata for SessionRecoveryData.NoneCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970400);
  }
  return result;
}

unint64_t sub_23A39EAD8()
{
  unint64_t result;

  result = qword_256970408;
  if (!qword_256970408)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC6D4, &type metadata for SessionRecoveryData.InSessionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970408);
  }
  return result;
}

unint64_t sub_23A39EB20()
{
  unint64_t result;

  result = qword_256970410;
  if (!qword_256970410)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC6FC, &type metadata for SessionRecoveryData.InSessionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970410);
  }
  return result;
}

unint64_t sub_23A39EB68()
{
  unint64_t result;

  result = qword_256970418;
  if (!qword_256970418)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC61C, &type metadata for SessionRecoveryData.SummaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970418);
  }
  return result;
}

unint64_t sub_23A39EBB0()
{
  unint64_t result;

  result = qword_256970420;
  if (!qword_256970420)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC644, &type metadata for SessionRecoveryData.SummaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970420);
  }
  return result;
}

unint64_t sub_23A39EBF8()
{
  unint64_t result;

  result = qword_256970428;
  if (!qword_256970428)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC7DC, &type metadata for SessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970428);
  }
  return result;
}

unint64_t sub_23A39EC40()
{
  unint64_t result;

  result = qword_256970430;
  if (!qword_256970430)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC804, &type metadata for SessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970430);
  }
  return result;
}

unint64_t sub_23A39EC88()
{
  unint64_t result;

  result = qword_256970438;
  if (!qword_256970438)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC564, &type metadata for InSessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970438);
  }
  return result;
}

unint64_t sub_23A39ECD0()
{
  unint64_t result;

  result = qword_256970440;
  if (!qword_256970440)
  {
    result = MEMORY[0x23B84AD3C](&unk_23A3AC58C, &type metadata for InSessionRecoveryData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256970440);
  }
  return result;
}

uint64_t sub_23A39ED14(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x556E6F6973736573 && a2 == 0xEB00000000444955;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461777265646E75 && a2 == 0xEE00656D69547265 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x687470654478616DLL && a2 == 0xE800000000000000 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023A3ADB60 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000023A3ADC00)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_23A39EF34(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v3 || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69737365536E69 && a2 == 0xE90000000000006ELL || (sub_23A3A8690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23A3A8690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t LastDive.dive.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23A39F07C(v1, a1);
}

uint64_t sub_23A39F07C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t LastDive.dive.setter(__int128 *a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_0(v1);
  return sub_23A39F0EC(a1, v1);
}

uint64_t sub_23A39F0EC(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t (*LastDive.dive.modify())()
{
  return nullsub_1;
}

uint64_t LastDive.graphData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LastDive.graphData.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*LastDive.graphData.modify())()
{
  return nullsub_1;
}

uint64_t HealthKitProvider.maxDepth.getter()
{
  return sub_23A39F47C();
}

uint64_t sub_23A39F168@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  result = swift_release();
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_23A39F1F0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_23A3A81F8();
}

uint64_t HealthKitProvider.maxDepth.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_23A3A81F8();
}

uint64_t (*HealthKitProvider.maxDepth.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_23A3A81E0();
  return sub_23A39F368;
}

uint64_t HealthKitProvider.$maxDepth.getter()
{
  return sub_23A39FAAC((uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_256970450);
}

uint64_t HealthKitProvider.$maxDepth.setter(uint64_t a1)
{
  return sub_23A39FCB0(a1, &qword_256970458, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_256970450);
}

uint64_t (*HealthKitProvider.$maxDepth.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970458);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256970450);
  sub_23A3A81C8();
  swift_endAccess();
  return sub_23A39F464;
}

uint64_t HealthKitProvider.minTemperature.getter()
{
  return sub_23A39F47C();
}

uint64_t sub_23A39F47C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  return swift_release();
}

uint64_t sub_23A39F4D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  result = swift_release();
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_23A39F560()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_23A3A81F8();
}

uint64_t HealthKitProvider.minTemperature.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_23A3A81F8();
}

uint64_t (*HealthKitProvider.minTemperature.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_23A3A81E0();
  return sub_23A39F368;
}

uint64_t HealthKitProvider.$minTemperature.getter()
{
  return sub_23A39FAAC((uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_256970468);
}

uint64_t HealthKitProvider.$minTemperature.setter(uint64_t a1)
{
  return sub_23A39FCB0(a1, &qword_256970470, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_256970468);
}

uint64_t (*HealthKitProvider.$minTemperature.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970470);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256970468);
  sub_23A3A81C8();
  swift_endAccess();
  return sub_23A39F464;
}

uint64_t HealthKitProvider.lastDive.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  return swift_release();
}

uint64_t sub_23A39F834()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  return swift_release();
}

uint64_t sub_23A39F8A0(uint64_t a1)
{
  uint64_t v2;
  _BYTE v3[48];

  sub_23A3A3EAC(a1, (uint64_t)v3, &qword_256970480);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A3EAC((uint64_t)v3, (uint64_t)&v2, &qword_256970480);
  swift_retain();
  sub_23A3A81F8();
  return sub_23A37D570((uint64_t)v3, &qword_256970480);
}

uint64_t HealthKitProvider.lastDive.setter(uint64_t a1)
{
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A3EAC(a1, (uint64_t)&v3, &qword_256970480);
  swift_retain();
  sub_23A3A81F8();
  return sub_23A37D570(a1, &qword_256970480);
}

uint64_t (*HealthKitProvider.lastDive.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_23A3A81E0();
  return sub_23A39F368;
}

void sub_23A39FA4C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t HealthKitProvider.$lastDive.getter()
{
  return sub_23A39FAAC((uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_256970488);
}

uint64_t sub_23A39FAAC(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_23A3A81C8();
  return swift_endAccess();
}

uint64_t sub_23A39FB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_23A3A81C8();
  return swift_endAccess();
}

uint64_t sub_23A39FB7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_23A3A81D4();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t HealthKitProvider.$lastDive.setter(uint64_t a1)
{
  return sub_23A39FCB0(a1, &qword_256970490, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_256970488);
}

uint64_t sub_23A39FCB0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_23A3A81D4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*HealthKitProvider.$lastDive.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970490);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_256970488);
  sub_23A3A81C8();
  swift_endAccess();
  return sub_23A39F464;
}

void sub_23A39FE50(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_23A3A81D4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_23A3A81D4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t HealthKitProvider.__allocating_init(withConfiguration:maxDepth:minTemperature:)(__int128 *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3C40]), sel_init);
  v3 = swift_allocObject();
  HealthKitProvider.init(withConfiguration:healthStore:)(a1, v2);
  return v3;
}

uint64_t HealthKitProvider.__allocating_init(withConfiguration:healthStore:)(__int128 *a1, void *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  HealthKitProvider.init(withConfiguration:healthStore:)(a1, a2);
  return v4;
}

uint64_t HealthKitProvider.init(withConfiguration:healthStore:)(__int128 *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t Operation;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD v43[6];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v3 = v2;
  v41 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970488);
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970468);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970450);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[7];
  v50 = a1[6];
  v51 = v16;
  v17 = a1[9];
  v52 = a1[8];
  v53 = v17;
  v18 = a1[3];
  v46 = a1[2];
  v47 = v18;
  v19 = a1[5];
  v48 = a1[4];
  v49 = v19;
  v20 = a1[1];
  v44 = *a1;
  v45 = v20;
  v21 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  v43[0] = 0;
  LOBYTE(v43[1]) = 3;
  sub_23A3A81BC();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v21, v15, v12);
  v22 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  v43[0] = 0;
  LOBYTE(v43[1]) = 1;
  sub_23A3A81BC();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v22, v11, v8);
  v23 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  memset(v43, 0, sizeof(v43));
  sub_23A3A3EAC((uint64_t)v43, (uint64_t)&v42, &qword_256970480);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256970480);
  sub_23A3A81BC();
  sub_23A37D570((uint64_t)v43, &qword_256970480);
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v23, v7, v40);
  v24 = v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation;
  Operation = type metadata accessor for GraphFetchOperation(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Operation - 8) + 56))(v24, 1, 1, Operation);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_subscriptions) = MEMORY[0x24BEE4B08];
  v26 = (_OWORD *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration);
  v27 = v51;
  v26[6] = v50;
  v26[7] = v27;
  v28 = v53;
  v26[8] = v52;
  v26[9] = v28;
  v29 = v47;
  v26[2] = v46;
  v26[3] = v29;
  v30 = v49;
  v26[4] = v48;
  v26[5] = v30;
  v31 = v45;
  *v26 = v44;
  v26[1] = v31;
  type metadata accessor for HealthKitHistoryObserver();
  v32 = swift_allocObject();
  v43[0] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569704B0);
  swift_allocObject();
  v33 = v41;
  v34 = sub_23A3A81B0();
  *(_OWORD *)(v32 + 32) = 0u;
  *(_OWORD *)(v32 + 48) = 0u;
  *(_QWORD *)(v32 + 16) = v34;
  *(_QWORD *)(v32 + 24) = v33;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_historyObserver) = v32;
  type metadata accessor for DiveGraphDataProvider();
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = v33;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_diveGraphDataProvider) = v35;
  v36 = v33;
  sub_23A3A0418();
  v43[0] = v34;
  swift_allocObject();
  swift_weakInit();
  sub_23A3A40C4(&qword_2569704C8, &qword_2569704B0, MEMORY[0x24BDB9D10]);
  swift_retain();
  sub_23A3A821C();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_23A3A8198();
  swift_endAccess();

  swift_release();
  return v3;
}

uint64_t type metadata accessor for GraphFetchOperation(uint64_t a1)
{
  return sub_23A39C25C(a1, qword_256970648);
}

uint64_t sub_23A3A0418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  id v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  id *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  id v47;
  id v48;
  id v49;

  v0 = sub_23A3A8450();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569706D0);
  MEMORY[0x24BDAC7A8](v4);
  v41 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569706D8);
  v40 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v39 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569706E0);
  v44 = *(_QWORD *)(v7 - 8);
  v45 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v43 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)*MEMORY[0x24BDBC9E8];
  v47 = (id)*MEMORY[0x24BEBDFF0];
  v48 = v9;
  v49 = (id)*MEMORY[0x24BDBCBC0];
  v10 = v49;
  v46 = (char *)MEMORY[0x24BEE4AF8];
  v11 = v47;
  v12 = v9;
  v13 = v10;
  sub_23A3A6668(0, 3, 0);
  v14 = v46;
  v15 = (void *)objc_opt_self();
  v16 = v11;
  v17 = objc_msgSend(v15, sel_defaultCenter);
  sub_23A3A845C();

  v19 = *((_QWORD *)v14 + 2);
  v18 = *((_QWORD *)v14 + 3);
  if (v19 >= v18 >> 1)
  {
    sub_23A3A6668(v18 > 1, v19 + 1, 1);
    v14 = v46;
  }
  v38 = &v47;
  *((_QWORD *)v14 + 2) = v19 + 1;
  v20 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v21 = *(_QWORD *)(v1 + 72);
  v22 = *(void (**)(char *, char *, uint64_t))(v1 + 32);
  v22(&v14[v20 + v21 * v19], v3, v0);
  v23 = v48;
  v24 = objc_msgSend(v15, sel_defaultCenter);
  sub_23A3A845C();

  v46 = v14;
  v26 = *((_QWORD *)v14 + 2);
  v25 = *((_QWORD *)v14 + 3);
  if (v26 >= v25 >> 1)
  {
    sub_23A3A6668(v25 > 1, v26 + 1, 1);
    v14 = v46;
  }
  *((_QWORD *)v14 + 2) = v26 + 1;
  v22(&v14[v20 + v26 * v21], v3, v0);
  v27 = v49;
  v28 = objc_msgSend(v15, sel_defaultCenter);
  sub_23A3A845C();

  v46 = v14;
  v30 = *((_QWORD *)v14 + 2);
  v29 = *((_QWORD *)v14 + 3);
  if (v30 >= v29 >> 1)
  {
    sub_23A3A6668(v29 > 1, v30 + 1, 1);
    v14 = v46;
  }
  *((_QWORD *)v14 + 2) = v30 + 1;
  v22(&v14[v20 + v30 * v21], v3, v0);
  type metadata accessor for Name(0);
  swift_arrayDestroy();
  v46 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569706E8);
  sub_23A38B374(&qword_2569706F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0078], MEMORY[0x24BDD0070]);
  sub_23A3A40C4(&qword_2569706F8, &qword_2569706E8, MEMORY[0x24BEE12C8]);
  v31 = v39;
  sub_23A3A818C();
  sub_23A3A4080();
  v46 = (char *)sub_23A3A8444();
  v32 = sub_23A3A8438();
  v33 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v41, 1, 1, v32);
  sub_23A3A40C4(&qword_256970708, &qword_2569706D8, MEMORY[0x24BDB99D8]);
  sub_23A38B374(&qword_256970710, (uint64_t (*)(uint64_t))sub_23A3A4080, MEMORY[0x24BEE5670]);
  v34 = v42;
  v35 = v43;
  sub_23A3A8210();
  sub_23A37D570(v33, &qword_2569706D0);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v34);
  swift_allocObject();
  swift_weakInit();
  sub_23A3A40C4(&qword_256970718, &qword_2569706E0, MEMORY[0x24BDB9A08]);
  v36 = v45;
  sub_23A3A821C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v35, v36);
  swift_beginAccess();
  sub_23A3A8198();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_23A3A0994(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = v1;
    sub_23A3A09FC(&v3);
    return swift_release();
  }
  return result;
}

uint64_t *sub_23A3A09FC(uint64_t *result)
{
  uint64_t v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  _BYTE v11[40];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v1 = *result;
  if (*result)
  {
    if (v1 == 1)
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_23A3A3EAC((uint64_t)&v17, (uint64_t)&v12, &qword_256970480);
      swift_retain();
      sub_23A3A81F8();
      v2 = &v17;
      return (uint64_t *)sub_23A37D570((uint64_t)v2, &qword_256970480);
    }
    if (*(_QWORD *)(v1 + 16))
    {
      sub_23A39F07C(v1 + 32, (uint64_t)&v12);
    }
    else
    {
      *(_QWORD *)&v14 = 0;
      v12 = 0u;
      v13 = 0u;
    }
    sub_23A3A3EAC((uint64_t)&v12, (uint64_t)&v15, &qword_2569706A8);
    if (v16)
    {
      sub_23A39F0EC(&v15, (uint64_t)v11);
      sub_23A39F07C((uint64_t)v11, (uint64_t)&v17);
      *((_QWORD *)&v19 + 1) = 0;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
    }
    sub_23A37D570((uint64_t)&v12, &qword_2569706A8);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23A3A3EAC((uint64_t)&v17, (uint64_t)&v12, &qword_256970480);
    swift_retain();
    sub_23A3A81F8();
    sub_23A37D570((uint64_t)&v17, &qword_256970480);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_23A3A81EC();
    swift_release();
    swift_release();
    if (!*((_QWORD *)&v13 + 1))
    {
      v2 = &v12;
      return (uint64_t *)sub_23A37D570((uint64_t)v2, &qword_256970480);
    }
    v18 = v13;
    v19 = v14;
    v17 = v12;
    v3 = *((_QWORD *)&v13 + 1);
    v4 = v14;
    __swift_project_boxed_opaque_existential_1(&v17, *((uint64_t *)&v13 + 1));
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v4 + 24))(&v12, v3, v4);
    v5 = v12;
    v6 = BYTE8(v12);
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v15 = v5;
    BYTE8(v15) = v6;
    swift_retain();
    sub_23A3A81F8();
    v7 = *((_QWORD *)&v18 + 1);
    v8 = v19;
    __swift_project_boxed_opaque_existential_1(&v17, *((uint64_t *)&v18 + 1));
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v8 + 32))(&v12, v7, v8);
    v9 = v13 > 1u;
    if (v13 <= 1u)
      v10 = v12;
    else
      v10 = 0;
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)&v12 = v10;
    BYTE8(v12) = v9;
    swift_retain();
    sub_23A3A81F8();
    sub_23A3A1324(&v17);
    return (uint64_t *)sub_23A3A3E80((uint64_t)&v17);
  }
  return result;
}

Swift::Void __swiftcall HealthKitProvider.start()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569704D0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_historyObserver);
  if (*(_QWORD *)(v4 + 56))
  {
    if (qword_25696F1C0 != -1)
      swift_once();
    v5 = sub_23A3A8180();
    __swift_project_value_buffer(v5, (uint64_t)qword_2569709A8);
    v11 = sub_23A3A8168();
    v6 = sub_23A3A8414();
    if (os_log_type_enabled(v11, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23A377000, v11, v6, "DiveHistorySource: start() should not be called multiple times", v7, 2u);
      MEMORY[0x23B84ADCC](v7, -1, -1);
    }

  }
  else
  {
    sub_23A3A4280();
    v8 = sub_23A3A83C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v4;
    swift_retain();
    sub_23A3A2D1C((uint64_t)v3, (uint64_t)&unk_2569704D8, (uint64_t)v9);
    swift_release();
  }
}

uint64_t sub_23A3A0EB0(uint64_t a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_23A3A0F0C(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_23A3A0F0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v17[3];
  uint64_t v18;

  v2 = v1;
  v4 = sub_23A3A8018();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696F1D0 != -1)
    swift_once();
  v8 = sub_23A3A8180();
  __swift_project_value_buffer(v8, (uint64_t)qword_2569709D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v9 = sub_23A3A8168();
  v10 = sub_23A3A8420();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v17[1] = v2;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v18 = v13;
    *(_DWORD *)v12 = 136315138;
    sub_23A38B374(&qword_256970720, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB930], MEMORY[0x24BDCB950]);
    v14 = sub_23A3A8684();
    v17[2] = sub_23A37C734(v14, v15, &v18);
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_23A377000, v9, v10, "HealthKitProvider: Received notification: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v13, -1, -1);
    MEMORY[0x23B84ADCC](v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  return sub_23A3A1130();
}

uint64_t sub_23A3A1130()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A3EAC((uint64_t)&v7, (uint64_t)&v5, &qword_256970480);
  swift_retain();
  sub_23A3A81F8();
  sub_23A37D570((uint64_t)&v7, &qword_256970480);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  swift_release();
  v0 = v7;
  v1 = v8;
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = v0;
  v6 = v1;
  swift_retain();
  sub_23A3A81F8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  swift_release();
  v2 = v7;
  v3 = v8;
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = v2;
  v6 = v3;
  swift_retain();
  return sub_23A3A81F8();
}

void sub_23A3A1324(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t Operation;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  int v36;
  uint64_t v37;
  uint8_t *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t *v52;
  uint8_t *v53;
  int v54;
  uint64_t v55;
  os_log_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64[3];
  uint64_t v65;
  __int128 v66;
  uint64_t v67;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569704D0);
  MEMORY[0x24BDAC7A8](v4);
  v62 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_23A3A80F0();
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v59 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569704E0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v52 - v11;
  Operation = type metadata accessor for GraphFetchOperation(0);
  v14 = *(_QWORD *)(Operation - 8);
  MEMORY[0x24BDAC7A8](Operation);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v17 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v18);
  v19 = (*(double (**)(uint64_t, uint64_t))(v17 + 40))(v18, v17);
  if (DepthSettings.deepDiveTimeThreshold.getter() <= v19)
  {
    v30 = v1 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation;
    swift_beginAccess();
    sub_23A3A3EAC(v30, (uint64_t)v12, &qword_2569704E0);
    v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, Operation);
    v32 = v1;
    v58 = v14;
    if (v31 == 1)
    {
      sub_23A37D570((uint64_t)v12, &qword_2569704E0);
    }
    else
    {
      sub_23A39C2D4((uint64_t)v12, (uint64_t)v16, type metadata accessor for GraphFetchOperation);
      if (qword_25696F1C8 != -1)
        swift_once();
      v33 = sub_23A3A8180();
      __swift_project_value_buffer(v33, (uint64_t)qword_2569709C0);
      sub_23A39F07C((uint64_t)a1, (uint64_t)&v66);
      v34 = sub_23A3A8168();
      v35 = sub_23A3A8420();
      v36 = v35;
      if (os_log_type_enabled(v34, v35))
      {
        v56 = v34;
        v37 = swift_slowAlloc();
        v54 = v36;
        v38 = (uint8_t *)v37;
        v55 = swift_slowAlloc();
        v65 = v55;
        v53 = v38;
        *(_DWORD *)v38 = 136315138;
        v52 = v38 + 4;
        v57 = v2;
        __swift_project_boxed_opaque_existential_1(&v66, v67);
        v39 = v59;
        sub_23A3A84EC();
        sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v40 = v61;
        v41 = sub_23A3A8684();
        v43 = v42;
        (*(void (**)(char *, uint64_t))(v60 + 8))(v39, v40);
        v63 = sub_23A37C734(v41, v43, &v65);
        sub_23A3A84A4();
        v32 = v57;
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
        v34 = v56;
        v44 = v53;
        _os_log_impl(&dword_23A377000, v56, (os_log_type_t)v54, "HealthKitProvider: Cancelling existing graph fetch for uuid=%s", v53, 0xCu);
        v45 = v55;
        swift_arrayDestroy();
        MEMORY[0x23B84ADCC](v45, -1, -1);
        MEMORY[0x23B84ADCC](v44, -1, -1);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
      }

      swift_retain();
      sub_23A3A83CC();
      swift_release();
      sub_23A38E8C8((uint64_t)v16, type metadata accessor for GraphFetchOperation);
    }
    v46 = sub_23A3A83C0();
    v47 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v62, 1, 1, v46);
    sub_23A39F07C((uint64_t)a1, (uint64_t)&v66);
    sub_23A3A83A8();
    swift_retain();
    v48 = sub_23A3A839C();
    v49 = (_QWORD *)swift_allocObject();
    v50 = MEMORY[0x24BEE6930];
    v49[2] = v48;
    v49[3] = v50;
    sub_23A39F0EC(&v66, (uint64_t)(v49 + 4));
    v49[9] = v32;
    v51 = sub_23A3A2D1C(v47, (uint64_t)&unk_2569706B8, (uint64_t)v49);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_23A3A84EC();
    *(_QWORD *)&v10[*(int *)(Operation + 20)] = v51;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v10, 0, 1, Operation);
    swift_beginAccess();
    sub_23A3A3FA0((uint64_t)v10, v30);
    swift_endAccess();
  }
  else
  {
    if (qword_25696F1C8 != -1)
      swift_once();
    v20 = sub_23A3A8180();
    __swift_project_value_buffer(v20, (uint64_t)qword_2569709C0);
    sub_23A39F07C((uint64_t)a1, (uint64_t)&v66);
    v21 = sub_23A3A8168();
    v22 = sub_23A3A8420();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v64[0] = v24;
      *(_DWORD *)v23 = 136315138;
      __swift_project_boxed_opaque_existential_1(&v66, v67);
      v25 = v59;
      sub_23A3A84EC();
      sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v26 = v61;
      v27 = sub_23A3A8684();
      v29 = v28;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v25, v26);
      v65 = sub_23A37C734(v27, v29, v64);
      sub_23A3A84A4();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
      _os_log_impl(&dword_23A377000, v21, v22, "HealthKitProvider: Graph data not needed for dive uuid=%s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B84ADCC](v24, -1, -1);
      MEMORY[0x23B84ADCC](v23, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v66);
    }

  }
}

uint64_t sub_23A3A1A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[22] = a4;
  v5[23] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569706C0);
  v5[24] = v6;
  v5[25] = *(_QWORD *)(v6 - 8);
  v5[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569706C8);
  v5[27] = swift_task_alloc();
  v5[28] = swift_task_alloc();
  v7 = sub_23A3A80F0();
  v5[29] = v7;
  v5[30] = *(_QWORD *)(v7 - 8);
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  sub_23A3A83A8();
  v5[33] = sub_23A3A839C();
  v5[34] = sub_23A3A8390();
  v5[35] = v8;
  return swift_task_switch();
}

uint64_t sub_23A3A1B98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  os_log_type_t type;
  uint64_t v15;
  uint64_t v16;

  if (qword_25696F1C8 != -1)
    swift_once();
  v1 = v0[22];
  v2 = sub_23A3A8180();
  v0[36] = __swift_project_value_buffer(v2, (uint64_t)qword_2569709C0);
  sub_23A39F07C(v1, (uint64_t)(v0 + 2));
  v3 = sub_23A3A8168();
  v4 = sub_23A3A8420();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = v0[32];
    v6 = v0[29];
    v13 = v0[30];
    type = v4;
    v7 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v16 = v15;
    *(_DWORD *)v7 = 136315138;
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    sub_23A3A84EC();
    sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v8 = sub_23A3A8684();
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v5, v6);
    v0[21] = sub_23A37C734(v8, v10, &v16);
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
    _os_log_impl(&dword_23A377000, v3, type, "HealthKitProvider: Starting graph data fetch for uuid=%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v15, -1, -1);
    MEMORY[0x23B84ADCC](v7, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  }

  __swift_project_boxed_opaque_existential_1((_QWORD *)v0[22], *(_QWORD *)(v0[22] + 24));
  sub_23A3A84EC();
  v11 = (_QWORD *)swift_task_alloc();
  v0[37] = v11;
  *v11 = v0;
  v11[1] = sub_23A3A1E28;
  return sub_23A3883D0(v0[31], 40);
}

uint64_t sub_23A3A1E28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v3 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 240);
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 248);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 232);
  v3[38] = a1;
  v3[39] = v1;
  swift_task_dealloc();
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v3[40] = v7;
  v7(v4, v6);
  return swift_task_switch();
}

void sub_23A3A1EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  os_log_type_t v24;
  BOOL v25;
  uint64_t v26;
  os_log_type_t v27;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 200);
  swift_release();
  v4 = *(_QWORD *)(v1 + 16);
  v48 = v1;
  swift_bridgeObjectRetain();
  v5 = 0;
  while (1)
  {
    if (v5 == v4)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v2 + 56))(*(_QWORD *)(v0 + 216), 1, 1, *(_QWORD *)(v0 + 192));
      v5 = v4;
    }
    else
    {
      if (v5 >= *(_QWORD *)(v48 + 16))
      {
        __break(1u);
        return;
      }
      v6 = *(_QWORD *)(v0 + 304);
      v8 = *(_QWORD *)(v0 + 208);
      v7 = *(unint64_t **)(v0 + 216);
      v9 = *(_QWORD *)(v0 + 192);
      v10 = type metadata accessor for DepthIntervalSummary();
      v11 = v6
          + ((*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80))
          + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v5;
      v12 = v8 + *(int *)(v3 + 48);
      sub_23A38A37C(v11, v12);
      v13 = (uint64_t)v7 + *(int *)(v3 + 48);
      *v7 = v5;
      sub_23A39C2D4(v12, v13, (uint64_t (*)(_QWORD))type metadata accessor for DepthIntervalSummary);
      (*(void (**)(unint64_t *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v7, 0, 1, v9);
      ++v5;
    }
    v14 = *(_QWORD *)(v0 + 224);
    v15 = *(_QWORD *)(v0 + 192);
    sub_23A3A3FE8(*(_QWORD *)(v0 + 216), v14);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v14, 1, v15) == 1)
      break;
    v16 = *(uint64_t **)(v0 + 224);
    v17 = *v16;
    v18 = (uint64_t)v16 + *(int *)(v3 + 48);
    v19 = v18 + *(int *)(type metadata accessor for DepthIntervalSummary() + 20);
    v21 = *(_QWORD *)v19;
    v20 = *(_QWORD *)(v19 + 8);
    v22 = *(_BYTE *)(v19 + 16);
    sub_23A38E8C8(v18, (uint64_t (*)(_QWORD))type metadata accessor for DepthIntervalSummary);
    v23 = sub_23A3A8168();
    v24 = sub_23A3A8420();
    v25 = os_log_type_enabled(v23, v24);
    if ((v22 & 1) != 0)
    {
      if (v25)
      {
        v26 = swift_slowAlloc();
        *(_DWORD *)v26 = 134217984;
        *(_QWORD *)(v26 + 4) = v17;
        v27 = v24;
        v28 = v23;
        v29 = "HealthKitProvider: %ld: NULL";
        v30 = (uint8_t *)v26;
        v31 = 12;
LABEL_2:
        _os_log_impl(&dword_23A377000, v28, v27, v29, v30, v31);
        MEMORY[0x23B84ADCC](v26, -1, -1);
      }
    }
    else if (v25)
    {
      v26 = swift_slowAlloc();
      *(_DWORD *)v26 = 134218496;
      *(_QWORD *)(v26 + 4) = v17;
      *(_WORD *)(v26 + 12) = 2048;
      *(_QWORD *)(v26 + 14) = v21;
      *(_WORD *)(v26 + 22) = 2048;
      *(_QWORD *)(v26 + 24) = v20;
      v27 = v24;
      v28 = v23;
      v29 = "HealthKitProvider: %ld: %f-%f";
      v30 = (uint8_t *)v26;
      v31 = 32;
      goto LABEL_2;
    }

  }
  v32 = *(_QWORD *)(v0 + 176);
  swift_bridgeObjectRelease();
  v45 = (_QWORD *)(v0 + 96);
  sub_23A39F07C(v32, v0 + 96);
  swift_bridgeObjectRetain();
  v33 = sub_23A3A8168();
  v34 = sub_23A3A8420();
  if (os_log_type_enabled(v33, v34))
  {
    v47 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    v35 = *(_QWORD *)(v0 + 256);
    v36 = *(_QWORD *)(v0 + 232);
    v37 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    v49 = v46;
    *(_DWORD *)v37 = 134218242;
    *(_QWORD *)(v0 + 152) = *(_QWORD *)(v48 + 16);
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2080;
    __swift_project_boxed_opaque_existential_1(v45, *(_QWORD *)(v0 + 120));
    sub_23A3A84EC();
    sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v38 = sub_23A3A8684();
    v40 = v39;
    v47(v35, v36);
    *(_QWORD *)(v0 + 160) = sub_23A37C734(v38, v40, &v49);
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
    _os_log_impl(&dword_23A377000, v33, v34, "HealthKitProvider: Completed graph fetch with count=%ld for uuid=%s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v46, -1, -1);
    MEMORY[0x23B84ADCC](v37, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  }

  v41 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
  v42 = *(_QWORD *)(v0 + 304);
  v43 = *(_QWORD *)(v0 + 256);
  v44 = *(_QWORD *)(v0 + 232);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 176), *(_QWORD *)(*(_QWORD *)(v0 + 176) + 24));
  sub_23A3A84EC();
  sub_23A3A2694(v42, v43);
  swift_bridgeObjectRelease();
  v41(v43, v44);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(void))(v0 + 8))();
}

uint64_t sub_23A3A23BC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (*v18)(uint64_t, uint64_t);
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(void **)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 176);
  swift_release();
  sub_23A39F07C(v2, v0 + 56);
  v3 = v1;
  v4 = v1;
  v5 = sub_23A3A8168();
  v6 = sub_23A3A8414();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 312);
    v18 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    v8 = *(_QWORD *)(v0 + 256);
    v9 = *(_QWORD *)(v0 + 232);
    v10 = swift_slowAlloc();
    v19 = (_QWORD *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v21 = v20;
    *(_DWORD *)v10 = 136315394;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    sub_23A3A84EC();
    sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v11 = sub_23A3A8684();
    v13 = v12;
    v18(v8, v9);
    *(_QWORD *)(v0 + 144) = sub_23A37C734(v11, v13, &v21);
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    *(_WORD *)(v10 + 12) = 2112;
    v14 = v7;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 136) = v15;
    sub_23A3A84A4();
    *v19 = v15;

    _os_log_impl(&dword_23A377000, v5, v6, "HealthKitProvider: Failed to fetch graph data for uuid=%s with error=%@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD30);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v20, -1, -1);
    MEMORY[0x23B84ADCC](v10, -1, -1);

  }
  else
  {
    v16 = *(void **)(v0 + 312);

    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23A3A2694(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40[6];
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[4];

  v4 = sub_23A3A80F0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v37 - v9;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23A3A81EC();
  swift_release();
  swift_release();
  if (*((_QWORD *)&v43 + 1))
  {
    v45[1] = v43;
    v45[2] = v44;
    v45[0] = v42;
    __swift_project_boxed_opaque_existential_1(v45, *((uint64_t *)&v43 + 1));
    sub_23A3A84EC();
    v11 = _s9DepthCore11DiveSummaryV2eeoiySbAC_ACtFZ_0();
    v12 = *(void (**)(char *, uint64_t))(v5 + 8);
    v12(v10, v4);
    if ((v11 & 1) != 0)
    {
      if (qword_25696F1C8 != -1)
        swift_once();
      v13 = sub_23A3A8180();
      __swift_project_value_buffer(v13, (uint64_t)qword_2569709C0);
      sub_23A3A4030((uint64_t)v45, (uint64_t)&v42);
      v14 = sub_23A3A8168();
      v15 = sub_23A3A8420();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        v17 = swift_slowAlloc();
        v37 = v12;
        v18 = v17;
        v39 = a1;
        v40[0] = v17;
        *(_DWORD *)v16 = 136315138;
        v38 = v16 + 4;
        __swift_project_boxed_opaque_existential_1(&v42, *((uint64_t *)&v43 + 1));
        sub_23A3A84EC();
        sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v19 = sub_23A3A8684();
        v21 = v20;
        v37(v10, v4);
        v41 = sub_23A37C734(v19, v21, v40);
        a1 = v39;
        sub_23A3A84A4();
        swift_bridgeObjectRelease();
        sub_23A3A3E80((uint64_t)&v42);
        _os_log_impl(&dword_23A377000, v14, v15, "HealthKitProvider: Adding graph data for uuid=%s", v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B84ADCC](v18, -1, -1);
        MEMORY[0x23B84ADCC](v16, -1, -1);
      }
      else
      {
        sub_23A3A3E80((uint64_t)&v42);
      }

      sub_23A39F07C((uint64_t)v45, (uint64_t)&v42);
      *((_QWORD *)&v44 + 1) = a1;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_23A3A3EAC((uint64_t)&v42, (uint64_t)v40, &qword_256970480);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_23A3A81F8();
      sub_23A37D570((uint64_t)&v42, &qword_256970480);
    }
    else
    {
      if (qword_25696F1C8 != -1)
        swift_once();
      v26 = sub_23A3A8180();
      __swift_project_value_buffer(v26, (uint64_t)qword_2569709C0);
      sub_23A3A4030((uint64_t)v45, (uint64_t)&v42);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
      v27 = sub_23A3A8168();
      v28 = sub_23A3A8420();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = swift_slowAlloc();
        v39 = swift_slowAlloc();
        v40[0] = v39;
        *(_DWORD *)v29 = 136315394;
        v38 = (uint8_t *)(v29 + 4);
        __swift_project_boxed_opaque_existential_1(&v42, *((uint64_t *)&v43 + 1));
        sub_23A3A84EC();
        sub_23A38B374((unint64_t *)&qword_25696F4E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v30 = sub_23A3A8684();
        v31 = v12;
        v33 = v32;
        v31(v10, v4);
        v41 = sub_23A37C734(v30, v33, v40);
        sub_23A3A84A4();
        swift_bridgeObjectRelease();
        sub_23A3A3E80((uint64_t)&v42);
        *(_WORD *)(v29 + 12) = 2080;
        v34 = sub_23A3A8684();
        v41 = sub_23A37C734(v34, v35, v40);
        sub_23A3A84A4();
        swift_bridgeObjectRelease();
        v31(v8, v4);
        _os_log_impl(&dword_23A377000, v27, v28, "HealthKitProvider: Not updating lastDive graph data, current dive is %s, graph data supplied for %s", (uint8_t *)v29, 0x16u);
        v36 = v39;
        swift_arrayDestroy();
        MEMORY[0x23B84ADCC](v36, -1, -1);
        MEMORY[0x23B84ADCC](v29, -1, -1);
      }
      else
      {
        sub_23A3A3E80((uint64_t)&v42);
        v12(v8, v4);
      }

    }
    sub_23A3A3E80((uint64_t)v45);
  }
  else
  {
    sub_23A37D570((uint64_t)&v42, &qword_256970480);
    if (qword_25696F1C8 != -1)
      swift_once();
    v22 = sub_23A3A8180();
    __swift_project_value_buffer(v22, (uint64_t)qword_2569709C0);
    v23 = sub_23A3A8168();
    v24 = sub_23A3A8420();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_23A377000, v23, v24, "HealthKitProvider: Not updating lastDive graphData, lastDive is nil", v25, 2u);
      MEMORY[0x23B84ADCC](v25, -1, -1);
    }

  }
}

uint64_t sub_23A3A2D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A3A83C0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23A3A83B4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23A37D570(a1, &qword_2569704D0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A3A8390();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23A3A2E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A3A83C0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23A3A83B4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23A37D570(a1, &qword_2569704D0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A3A8390();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256970690);
  return swift_task_create();
}

uint64_t HealthKitProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[10];

  v1 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970450);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970468);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970488);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 112);
  v13[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 96);
  v13[7] = v7;
  v8 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 144);
  v13[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 128);
  v13[9] = v8;
  v9 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 48);
  v13[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 32);
  v13[3] = v9;
  v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 80);
  v13[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 64);
  v13[5] = v10;
  v11 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 16);
  v13[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration);
  v13[1] = v11;
  sub_23A3A32E8((uint64_t)v13);
  swift_release();
  swift_release();
  sub_23A37D570(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation, &qword_2569704E0);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t HealthKitProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[10];

  v1 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970450);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970468);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970488);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 112);
  v13[6] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 96);
  v13[7] = v7;
  v8 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 144);
  v13[8] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 128);
  v13[9] = v8;
  v9 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 48);
  v13[2] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 32);
  v13[3] = v9;
  v10 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 80);
  v13[4] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 64);
  v13[5] = v10;
  v11 = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration + 16);
  v13[0] = *(_OWORD *)(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_configuration);
  v13[1] = v11;
  sub_23A3A32E8((uint64_t)v13);
  swift_release();
  swift_release();
  sub_23A37D570(v0 + OBJC_IVAR____TtC9DepthCore17HealthKitProvider_graphFetchOperation, &qword_2569704E0);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A3A3224()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A3A3248(uint64_t *a1)
{
  return sub_23A3A0994(a1);
}

uint64_t sub_23A3A3250()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A3A327C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A3A4104;
  return sub_23A3A5D48();
}

uint64_t sub_23A3A32E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 120);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_BYTE *)(a1 + 136);
  sub_23A379608(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_BYTE *)(a1 + 96));
  sub_23A379490(v2, v3, v4, v5, v6);
  return a1;
}

uint64_t sub_23A3A334C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A39FB10(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_256970450);
}

uint64_t sub_23A3A3370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A39FB7C(a1, a2, a3, a4, &qword_256970458, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__maxDepth, &qword_256970450);
}

uint64_t sub_23A3A339C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A39FB10(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_256970468);
}

uint64_t sub_23A3A33C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A39FB7C(a1, a2, a3, a4, &qword_256970470, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__minTemperature, &qword_256970468);
}

uint64_t sub_23A3A33EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A39FB10(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_256970488);
}

uint64_t sub_23A3A3410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A39FB7C(a1, a2, a3, a4, &qword_256970490, (uint64_t)&OBJC_IVAR____TtC9DepthCore17HealthKitProvider__lastDive, &qword_256970488);
}

uint64_t destroy for LastDive(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LastDive(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for LastDive(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for LastDive(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LastDive(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LastDive(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LastDive()
{
  return &type metadata for LastDive;
}

uint64_t sub_23A3A35D4()
{
  return type metadata accessor for HealthKitProvider(0);
}

uint64_t type metadata accessor for HealthKitProvider(uint64_t a1)
{
  return sub_23A39C25C(a1, (uint64_t *)&unk_256970510);
}

void sub_23A3A35F0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_23A3A3704(319, &qword_256970520);
  if (v0 <= 0x3F)
  {
    sub_23A3A3704(319, &qword_256970528);
    if (v1 <= 0x3F)
    {
      sub_23A3A3748();
      if (v2 <= 0x3F)
      {
        sub_23A3A37A0();
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for HealthKitProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthKitProvider.__allocating_init(withConfiguration:healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

void sub_23A3A3704(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23A3A8204();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_23A3A3748()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256970530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256970480);
    v0 = sub_23A3A8204();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256970530);
  }
}

void sub_23A3A37A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256970538[0])
  {
    type metadata accessor for GraphFetchOperation(255);
    v0 = sub_23A3A8498();
    if (!v1)
      atomic_store(v0, qword_256970538);
  }
}

uint64_t *sub_23A3A37F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_23A3A80F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_23A3A387C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_23A3A38C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_23A3A3920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23A3A398C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_23A3A39E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A3A80F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_23A3A3A4C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A3A3A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A3A80F0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23A3A3AD4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A3A3AE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A3A80F0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_23A3A3B58()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A3A80F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A3A3BCC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A3A3C30;
  return v6(a1);
}

uint64_t sub_23A3A3C30()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A3A3C7C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_23A3A3CE4;
  return v5(v2 + 32);
}

uint64_t sub_23A3A3CE4()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_23A3A3D34()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A3A3D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A3A3DC8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256970680 + dword_256970680))(a1, v4);
}

uint64_t sub_23A3A3DC8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A3A3E10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A3A4104;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256970698 + dword_256970698))(a1, v4);
}

uint64_t sub_23A3A3E80(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23A3A3EAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A3A3EF0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A3A3F24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (uint64_t)(v1 + 4);
  v7 = v1[9];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A3A3DC8;
  return sub_23A3A1A94(a1, v4, v5, v6, v7);
}

uint64_t sub_23A3A3FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569704E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A3A3FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569706C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A3A4030(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a2;
}

unint64_t sub_23A3A4080()
{
  unint64_t result;

  result = qword_256970700;
  if (!qword_256970700)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256970700);
  }
  return result;
}

uint64_t sub_23A3A40BC(uint64_t a1)
{
  return sub_23A3A0EB0(a1);
}

uint64_t sub_23A3A40C4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B84AD3C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of SummaryPresentable.dateInterval.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SummaryPresentable.maxDepth.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SummaryPresentable.temperatureRange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SummaryPresentable.underwaterDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SummaryPresentable.numberOfDivesMaybe.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SummaryPresentable.diveID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t HealthKitHistoryObserver.__allocating_init(healthStore:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569704B0);
  swift_allocObject();
  v3 = sub_23A3A81B0();
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_QWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 24) = a1;
  return v2;
}

BOOL DiveHistory.hasDives.getter()
{
  _QWORD *v0;

  return *v0 > 1uLL;
}

uint64_t DiveHistory.diveSummaries.getter()
{
  _QWORD *v0;

  if (*v0 >= 2uLL)
    return swift_bridgeObjectRetain();
  else
    return MEMORY[0x24BEE4AF8];
}

uint64_t HealthKitHistoryObserver.healthKitDiveHistorySubject.getter()
{
  return swift_retain();
}

uint64_t HealthKitHistoryObserver.init(healthStore:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569704B0);
  swift_allocObject();
  v3 = sub_23A3A81B0();
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v1 + 24) = a1;
  return v1;
}

void sub_23A3A4280()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[6];

  sub_23A379D64(0, &qword_25696FAB0);
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_workoutType);
  v2 = objc_msgSend((id)objc_opt_self(), sel_predicateForWorkoutsWithWorkoutActivityType_, 84);
  v3 = swift_allocObject();
  swift_weakInit();
  v4 = objc_allocWithZone(MEMORY[0x24BDD3DC8]);
  v8[4] = sub_23A3A6BDC;
  v8[5] = v3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_23A3A5E18;
  v8[3] = &block_descriptor_0;
  v5 = _Block_copy(v8);
  swift_retain();
  v6 = objc_msgSend(v4, sel_initWithSampleType_predicate_updateHandler_, v1, v2, v5);

  _Block_release(v5);
  swift_release();
  swift_release();
  objc_msgSend(*(id *)(v0 + 24), sel_executeQuery_, v6);
  v7 = *(void **)(v0 + 56);
  *(_QWORD *)(v0 + 56) = v6;

}

uint64_t sub_23A3A43EC(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[4];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569704D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696F1C0 != -1)
    swift_once();
  v10 = sub_23A3A8180();
  __swift_project_value_buffer(v10, (uint64_t)qword_2569709A8);
  v11 = sub_23A3A8168();
  v12 = sub_23A3A8420();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_23A377000, v11, v12, "DiveHistorySource: Workout observer query triggered", v13, 2u);
    MEMORY[0x23B84ADCC](v13, -1, -1);
  }

  if (a4)
  {
    v14 = a4;
    v15 = a4;
    v16 = sub_23A3A8168();
    v17 = sub_23A3A8414();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v18 = 138412290;
      v20 = a4;
      v21 = _swift_stdlib_bridgeErrorToNSError();
      v26[1] = v21;
      sub_23A3A84A4();
      *v19 = v21;

      _os_log_impl(&dword_23A377000, v16, v17, "DiveWorkoutSource: Failed to observer dive workouts with error %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD30);
      swift_arrayDestroy();
      MEMORY[0x23B84ADCC](v19, -1, -1);
      MEMORY[0x23B84ADCC](v18, -1, -1);
    }
    else
    {

    }
    return a2();
  }
  else
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v23 = result;
      v24 = sub_23A3A83C0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v9, 1, 1, v24);
      v25 = (_QWORD *)swift_allocObject();
      v25[2] = 0;
      v25[3] = 0;
      v25[4] = v23;
      v25[5] = a2;
      v25[6] = a3;
      swift_retain();
      sub_23A3A2D1C((uint64_t)v9, (uint64_t)&unk_2569708F8, (uint64_t)v25);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_23A3A46E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v9;
  *v9 = v6;
  v9[1] = sub_23A3A4104;
  return sub_23A3A4748(a5, a6);
}

uint64_t sub_23A3A4748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569704D0);
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256970870);
  v3[9] = swift_task_alloc();
  v4 = type metadata accessor for DiveSummary();
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970878);
  v3[14] = v5;
  v3[15] = *(_QWORD *)(v5 - 8);
  v3[16] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970880);
  v3[17] = v6;
  v3[18] = *(_QWORD *)(v6 - 8);
  v3[19] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970888);
  v3[20] = v7;
  v3[21] = *(_QWORD *)(v7 - 8);
  v3[22] = swift_task_alloc();
  v8 = sub_23A3A812C();
  v3[23] = v8;
  v3[24] = *(_QWORD *)(v8 - 8);
  v3[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25696F2D8);
  v3[26] = swift_task_alloc();
  v9 = sub_23A3A8138();
  v3[27] = v9;
  v3[28] = *(_QWORD *)(v9 - 8);
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  v10 = sub_23A3A809C();
  v3[31] = v10;
  v3[32] = *(_QWORD *)(v10 - 8);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A3A4944()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t KeyPath;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  if (qword_25696F1C0 != -1)
    swift_once();
  v1 = sub_23A3A8180();
  v0[35] = __swift_project_value_buffer(v1, (uint64_t)qword_2569709A8);
  v2 = sub_23A3A8168();
  v3 = sub_23A3A8414();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23A377000, v2, v3, "DiveHistorySource: Starting new historical query", v4, 2u);
    MEMORY[0x23B84ADCC](v4, -1, -1);
  }
  v46 = v0[32];
  v47 = v0[31];
  v5 = v0[28];
  v6 = v0[29];
  v7 = v0[26];
  v44 = v0[27];
  v8 = v0[24];
  v9 = v0[25];
  v10 = v0[23];

  sub_23A3A8090();
  sub_23A3A8120();
  sub_23A3A8120();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v9, *MEMORY[0x24BDCF220], v10);
  sub_23A3A8114();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  v11 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v11(v6, v44);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v7, 1, v47);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v14 = v0[31];
    v13 = v0[32];
    v15 = v0[30];
    v17 = v0[26];
    v16 = v0[27];
    v18 = v0[21];
    v40 = v0[22];
    v41 = v0[19];
    v42 = v0[20];
    v43 = v0[18];
    v45 = v0[17];
    v48 = v0[7];
    sub_23A3A80FC();
    v11(v15, v16);
    v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v0[36] = v19;
    v19(v17, v14);
    v20 = (void *)objc_opt_self();
    v21 = (void *)sub_23A3A8060();
    v22 = (void *)sub_23A3A8060();
    v23 = objc_msgSend(v20, sel_predicateForSamplesWithStartDate_endDate_options_, v21, v22, 0);
    v0[37] = v23;

    v24 = objc_msgSend(v20, sel__predicateForObjectsFromAppleWatches);
    v0[38] = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696F6B0);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_23A3ACC00;
    *(_QWORD *)(v25 + 32) = v23;
    *(_QWORD *)(v25 + 40) = v24;
    v26 = v23;
    v27 = v24;
    *(_QWORD *)(v25 + 48) = objc_msgSend(v20, sel_predicateForWorkoutsWithWorkoutActivityType_, 84);
    sub_23A3A8360();
    v28 = objc_allocWithZone(MEMORY[0x24BDD14C0]);
    sub_23A379D64(0, &qword_256970890);
    v29 = (void *)sub_23A3A8348();
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v28, sel_initWithType_subpredicates_, 1, v29);
    v0[39] = v30;

    sub_23A379D64(0, &qword_25696FAB8);
    v31 = v30;
    sub_23A3A8240();

    KeyPath = swift_getKeyPath();
    MEMORY[0x23B84A2B0](KeyPath, 1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256970898);
    v33 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_23A3A9210;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 16))(v34 + v33, v40, v42);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569708A0);
    v35 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_23A3A9210;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v43 + 16))(v36 + v35, v41, v45);
    sub_23A379D64(0, &qword_2569708A8);
    sub_23A3A824C();
    v37 = *(void **)(v48 + 24);
    v0[40] = v37;
    v38 = v37;
    v39 = (_QWORD *)swift_task_alloc();
    v0[41] = v39;
    *v39 = v0;
    v39[1] = sub_23A3A4E0C;
    return sub_23A3A8258();
  }
  return result;
}

uint64_t sub_23A3A4E0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 336) = a1;
  *(_QWORD *)(v3 + 344) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_23A3A4E80()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 336);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_23A3A8570();
    v2 = result;
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v45 = v1;
  v43 = v1 >> 62;
  if (v2)
  {
    if (v2 < 1)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    v5 = *(_QWORD *)(v0 + 88);
    v6 = v1 & 0xC000000000000001;
    v7 = *(_QWORD *)(v0 + 336) + 32;
    v8 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v6)
        v9 = (id)MEMORY[0x23B84A76C](v4, *(_QWORD *)(v0 + 336));
      else
        v9 = *(id *)(v7 + 8 * v4);
      v10 = v9;
      v12 = *(_QWORD *)(v0 + 72);
      v11 = *(_QWORD *)(v0 + 80);
      static DiveSummary.fromHKWorkout(_:)(v9, v12);

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v12, 1, v11) == 1)
      {
        sub_23A3A64F8(*(_QWORD *)(v0 + 72));
      }
      else
      {
        v14 = *(_QWORD *)(v0 + 96);
        v13 = *(_QWORD *)(v0 + 104);
        sub_23A3939E0(*(_QWORD *)(v0 + 72), v13);
        sub_23A3939E0(v13, v14);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_23A3A6220(0, *(_QWORD *)(v8 + 16) + 1, 1, v8, &qword_2569708C0, (uint64_t (*)(_QWORD))type metadata accessor for DiveSummary);
        v16 = *(_QWORD *)(v8 + 16);
        v15 = *(_QWORD *)(v8 + 24);
        if (v16 >= v15 >> 1)
          v8 = sub_23A3A6220(v15 > 1, v16 + 1, 1, v8, &qword_2569708C0, (uint64_t (*)(_QWORD))type metadata accessor for DiveSummary);
        v17 = *(_QWORD *)(v0 + 96);
        *(_QWORD *)(v8 + 16) = v16 + 1;
        sub_23A3939E0(v17, v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v16);
      }
      ++v4;
    }
    while (v2 != v4);
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = sub_23A3A8168();
  v19 = sub_23A3A8420();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    *(_DWORD *)v20 = 134218240;
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v8 + 16);
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2048;
    if (v43)
    {
      swift_bridgeObjectRetain();
      v21 = sub_23A3A8570();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = *(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 32) = v21;
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A377000, v18, v19, "DiveHistorySource: Parsed %ld valid dive summaries from %ld workouts", (uint8_t *)v20, 0x16u);
    MEMORY[0x23B84ADCC](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }

  if (*(_QWORD *)(v8 + 16))
  {
    v22 = sub_23A3A5954(v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = 1;
  }
  v23 = *(void **)(v0 + 296);
  v35 = *(void **)(v0 + 304);
  v36 = *(void **)(v0 + 312);
  v24 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  v46 = *(_QWORD *)(v0 + 272);
  v25 = *(_QWORD *)(v0 + 248);
  v42 = *(_QWORD *)(v0 + 176);
  v44 = *(_QWORD *)(v0 + 264);
  v40 = *(_QWORD *)(v0 + 168);
  v41 = *(_QWORD *)(v0 + 160);
  v37 = *(_QWORD *)(v0 + 144);
  v38 = *(_QWORD *)(v0 + 136);
  v39 = *(_QWORD *)(v0 + 152);
  v26 = *(_QWORD *)(v0 + 120);
  v33 = *(_QWORD *)(v0 + 112);
  v34 = *(_QWORD *)(v0 + 128);
  v27 = *(_QWORD *)(v0 + 64);
  v28 = sub_23A3A83C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 1, 1, v28);
  v29 = swift_allocObject();
  swift_weakInit();
  sub_23A3A83A8();
  swift_retain();
  v30 = sub_23A3A839C();
  v31 = (_QWORD *)swift_allocObject();
  v32 = MEMORY[0x24BEE6930];
  v31[2] = v30;
  v31[3] = v32;
  v31[4] = v29;
  v31[5] = v22;
  swift_release();
  sub_23A3A2E68(v27, (uint64_t)&unk_2569708B8, (uint64_t)v31);

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v34, v33);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v42, v41);
  v24(v44, v25);
  v24(v46, v25);
  sub_23A3A56B4(*(uint64_t (**)(uint64_t))(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A3A53F4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(void **)(v0 + 344);

  v2 = v1;
  v3 = v1;
  v4 = sub_23A3A8168();
  v5 = sub_23A3A8414();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 344);
    v7 = *(void **)(v0 + 312);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v6;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v11;
    sub_23A3A84A4();
    *v9 = v11;

    _os_log_impl(&dword_23A377000, v4, v5, "DiveHistorySource: Failed to query dive workout history with error %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25696FD30);
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v9, -1, -1);
    MEMORY[0x23B84ADCC](v8, -1, -1);

  }
  else
  {
    v6 = *(void **)(v0 + 344);
    v7 = *(void **)(v0 + 312);

  }
  v12 = *(void **)(v0 + 296);
  v13 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  v25 = *(_QWORD *)(v0 + 264);
  v26 = *(_QWORD *)(v0 + 272);
  v14 = *(_QWORD *)(v0 + 248);
  v22 = *(_QWORD *)(v0 + 168);
  v15 = *(_QWORD *)(v0 + 152);
  v23 = *(_QWORD *)(v0 + 160);
  v24 = *(_QWORD *)(v0 + 176);
  v17 = *(_QWORD *)(v0 + 136);
  v16 = *(_QWORD *)(v0 + 144);
  v18 = *(_QWORD *)(v0 + 120);
  v19 = *(_QWORD *)(v0 + 128);
  v20 = *(_QWORD *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  v13(v25, v14);
  v13(v26, v14);
  sub_23A3A56B4(*(uint64_t (**)(uint64_t))(v0 + 40));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A3A56B4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_23A3A8180();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25696F1C0 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2569709A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_23A3A6BCC((uint64_t)a1);
  sub_23A3A6BCC((uint64_t)a1);
  v7 = sub_23A3A8168();
  v8 = sub_23A3A8420();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v17 = v3;
    v10 = (uint8_t *)v9;
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136315138;
    v19 = v11;
    if (a1)
      v12 = 5457241;
    else
      v12 = 20302;
    if (a1)
      v13 = 0xE300000000000000;
    else
      v13 = 0xE200000000000000;
    v18 = sub_23A37C734(v12, v13, &v19);
    sub_23A3A84A4();
    swift_bridgeObjectRelease();
    sub_23A3A5F64((uint64_t)a1);
    sub_23A3A5F64((uint64_t)a1);
    _os_log_impl(&dword_23A377000, v7, v8, "DiveHistorySource: Calling completion %s", v10, 0xCu);
    v14 = v16;
    swift_arrayDestroy();
    MEMORY[0x23B84ADCC](v14, -1, -1);
    MEMORY[0x23B84ADCC](v10, -1, -1);

    result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v5, v2);
  }
  else
  {
    sub_23A3A5F64((uint64_t)a1);
    sub_23A3A5F64((uint64_t)a1);

    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (a1)
    return a1(result);
  return result;
}

void sub_23A3A5908(id *a1)
{
  id v1;

  v1 = objc_msgSend(*a1, sel_endDate);
  sub_23A3A8084();

}

uint64_t sub_23A3A5954(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  __int128 v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v2 = type metadata accessor for DiveSummary();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_23A3A6694(0, v6, 0);
    v7 = v17;
    v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_23A392384(v8, (uint64_t)v5);
      v17 = v7;
      v11 = *(_QWORD *)(v7 + 16);
      v10 = *(_QWORD *)(v7 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_23A3A6694(v10 > 1, v11 + 1, 1);
        v7 = v17;
      }
      v15 = v2;
      v16 = sub_23A3A6B48();
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
      sub_23A392384((uint64_t)v5, (uint64_t)boxed_opaque_existential_1);
      *(_QWORD *)(v7 + 16) = v11 + 1;
      sub_23A39F0EC(&v14, v7 + 40 * v11 + 32);
      sub_23A3923C8((uint64_t)v5);
      v8 += v9;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_23A3A5AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = a5;
  v5[6] = a1;
  sub_23A3A83A8();
  v5[9] = sub_23A3A839C();
  sub_23A3A8390();
  return swift_task_switch();
}

uint64_t sub_23A3A5B14()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;

  swift_release();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v2 = *(_QWORD *)(v0 + 64);
    swift_retain();
    swift_release();
    *(_QWORD *)(v0 + 40) = v2;
    sub_23A3A81A4();
    swift_release();
  }
  **(_BYTE **)(v0 + 48) = Strong == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23A3A5BB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569704D0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + 56))
  {
    if (qword_25696F1C0 != -1)
      swift_once();
    v4 = sub_23A3A8180();
    __swift_project_value_buffer(v4, (uint64_t)qword_2569709A8);
    v10 = sub_23A3A8168();
    v5 = sub_23A3A8414();
    if (os_log_type_enabled(v10, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23A377000, v10, v5, "DiveHistorySource: start() should not be called multiple times", v6, 2u);
      MEMORY[0x23B84ADCC](v6, -1, -1);
    }

  }
  else
  {
    sub_23A3A4280();
    v7 = sub_23A3A83C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 1, 1, v7);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v0;
    swift_retain();
    sub_23A3A2D1C((uint64_t)v3, (uint64_t)&unk_2569704D8, (uint64_t)v8);
    swift_release();
  }
}

uint64_t sub_23A3A5D48()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A3A4104;
  return sub_23A3A4748(0, 0);
}

uint64_t HealthKitHistoryObserver.deinit()
{
  uint64_t v0;

  swift_release();

  sub_23A3A5F64(*(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t HealthKitHistoryObserver.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();

  sub_23A3A5F64(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance();
}

void sub_23A3A5E18(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  void (*v6)(id, uint64_t (*)(), uint64_t, void *);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = *(void (**)(id, uint64_t (*)(), uint64_t, void *))(a1 + 32);
  v7 = _Block_copy(aBlock);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_retain();
  v10 = a2;
  v9 = a4;
  v6(v10, sub_23A3A6C20, v8, a4);
  swift_release();
  swift_release();

}

uint64_t sub_23A3A5EC8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A3A5EF4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A3A4104;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_23A3A4104;
  return sub_23A3A4748(0, 0);
}

uint64_t sub_23A3A5F64(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DiveHistory(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_bridgeObjectRetain();
  *a1 = v3;
  return a1;
}

unint64_t destroy for DiveHistory(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t *assignWithCopy for DiveHistory(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_bridgeObjectRetain();
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for DiveHistory(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  if (*a1 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveHistory(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DiveHistory(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_23A3A6164(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_23A3A617C(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for DiveHistory()
{
  return &type metadata for DiveHistory;
}

uint64_t type metadata accessor for HealthKitHistoryObserver()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthKitHistoryObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthKitHistoryObserver.__allocating_init(healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of HealthKitHistoryObserver.start()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t sub_23A3A61EC(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_23A3A620C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A3A6220(a1, a2, a3, a4, &qword_25696FAC0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

uint64_t sub_23A3A6220(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23A3A8564();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23A3A6A30(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

void *sub_23A3A642C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_23A3A85A0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_23A3A64C0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

char *keypath_get_selector_endDate()
{
  return sel_endDate;
}

uint64_t sub_23A3A64F8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256970870);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A3A6538()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23A3A655C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 40) >= 2uLL)
    swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A3A6598(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A3A4104;
  return sub_23A3A5AA4(a1, v4, v5, v7, v6);
}

uint64_t sub_23A3A6610(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A3A66B0(a1, a2, a3, (_QWORD *)*v3, &qword_2569708E0, (uint64_t (*)(_QWORD))type metadata accessor for DepthIntervalSummary);
  *v3 = result;
  return result;
}

uint64_t sub_23A3A663C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A3A66B0(a1, a2, a3, (_QWORD *)*v3, &qword_2569708E8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCB878]);
  *v3 = result;
  return result;
}

uint64_t sub_23A3A6668(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A3A66B0(a1, a2, a3, (_QWORD *)*v3, &qword_256970900, (uint64_t (*)(_QWORD))MEMORY[0x24BDD0078]);
  *v3 = result;
  return result;
}

uint64_t sub_23A3A6694(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A3A6890(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23A3A66B0(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_23A3A85A0();
  __break(1u);
  return result;
}

uint64_t sub_23A3A6890(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569708D0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569708D8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23A3A85A0();
  __break(1u);
  return result;
}

uint64_t sub_23A3A6A30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_23A3A85A0();
  __break(1u);
  return result;
}

unint64_t sub_23A3A6B48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569708C8;
  if (!qword_2569708C8)
  {
    v1 = type metadata accessor for DiveSummary();
    result = MEMORY[0x23B84AD3C](&protocol conformance descriptor for DiveSummary, v1);
    atomic_store(result, (unint64_t *)&qword_2569708C8);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_23A3A6BCC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23A3A6BDC(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void *a4)
{
  return sub_23A3A43EC(a1, a2, a3, a4);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23A3A6BFC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23A3A6C20()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23A3A6C2C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A3A6C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23A3A3DC8;
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_23A3A4104;
  return sub_23A3A4748(v2, v3);
}

uint64_t DiveConfiguration.depth.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = *(_QWORD *)(v1 + 72);
  v3 = *(_QWORD *)(v1 + 80);
  v4 = *(_QWORD *)(v1 + 88);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v1 + 56);
  *(_QWORD *)(a1 + 72) = v2;
  *(_QWORD *)(a1 + 80) = v3;
  *(_QWORD *)(a1 + 88) = v4;
  v5 = *(_BYTE *)(v1 + 96);
  *(_BYTE *)(a1 + 96) = v5;
  return sub_23A3795F0(v2, v3, v4, v5);
}

__n128 DiveConfiguration.depth.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __n128 result;
  __n128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v2 = *a1;
  v10 = *(_OWORD *)(a1 + 24);
  v11 = *(_OWORD *)(a1 + 8);
  v3 = *((_QWORD *)a1 + 7);
  v4 = *((_QWORD *)a1 + 8);
  v8 = *(__n128 *)(a1 + 72);
  v9 = *(_OWORD *)(a1 + 40);
  v5 = *((_QWORD *)a1 + 11);
  v6 = a1[96];
  sub_23A379608(*(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_BYTE *)(v1 + 96));
  *(_BYTE *)v1 = v2;
  *(_OWORD *)(v1 + 8) = v11;
  *(_OWORD *)(v1 + 24) = v10;
  *(_OWORD *)(v1 + 40) = v9;
  *(_QWORD *)(v1 + 56) = v3;
  *(_QWORD *)(v1 + 64) = v4;
  result = v8;
  *(__n128 *)(v1 + 72) = v8;
  *(_QWORD *)(v1 + 88) = v5;
  *(_BYTE *)(v1 + 96) = v6;
  return result;
}

uint64_t (*DiveConfiguration.depth.modify())()
{
  return nullsub_1;
}

uint64_t DiveConfiguration.temperature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v2 = *(_QWORD *)(v1 + 104);
  v3 = *(_QWORD *)(v1 + 112);
  v4 = *(_QWORD *)(v1 + 120);
  v5 = *(_QWORD *)(v1 + 128);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_BYTE *)(v1 + 136);
  *(_BYTE *)(a1 + 32) = v6;
  return sub_23A379478(v2, v3, v4, v5, v6);
}

__n128 DiveConfiguration.temperature.setter(__n128 *a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unsigned __int8 v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = a1[2].n128_u8[0];
  sub_23A379490(*(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128), *(_BYTE *)(v1 + 136));
  result = v6;
  *(__n128 *)(v1 + 104) = v6;
  *(_QWORD *)(v1 + 120) = v2;
  *(_QWORD *)(v1 + 128) = v3;
  *(_BYTE *)(v1 + 136) = v4;
  return result;
}

uint64_t (*DiveConfiguration.temperature.modify())()
{
  return nullsub_1;
}

void DiveConfiguration.interface.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 137);
}

_BYTE *DiveConfiguration.interface.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 137) = *result;
  return result;
}

uint64_t (*DiveConfiguration.interface.modify())()
{
  return nullsub_1;
}

void DiveConfiguration.units.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 139);
  *a1 = *(_BYTE *)(v1 + 138);
  a1[1] = v2;
}

_BYTE *DiveConfiguration.units.setter(_BYTE *result)
{
  uint64_t v1;
  char v2;

  v2 = result[1];
  *(_BYTE *)(v1 + 138) = *result;
  *(_BYTE *)(v1 + 139) = v2;
  return result;
}

uint64_t (*DiveConfiguration.units.modify())()
{
  return nullsub_1;
}

void DiveConfiguration.privacy.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 140);
}

_BYTE *DiveConfiguration.privacy.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 140) = *result;
  return result;
}

uint64_t (*DiveConfiguration.privacy.modify())()
{
  return nullsub_1;
}

__n128 DiveConfiguration.location.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[9];
  *a1 = result;
  return result;
}

__n128 DiveConfiguration.location.setter(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = *a1;
  v1[9] = *a1;
  return result;
}

uint64_t (*DiveConfiguration.location.modify())()
{
  return nullsub_1;
}

uint64_t destroy for DiveConfiguration(uint64_t a1)
{
  sub_23A379608(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_BYTE *)(a1 + 96));
  return sub_23A379490(*(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_BYTE *)(a1 + 136));
}

uint64_t initializeWithCopy for DiveConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v4 = *(_QWORD *)(a2 + 72);
  v5 = *(_QWORD *)(a2 + 80);
  v6 = *(_QWORD *)(a2 + 88);
  v7 = *(_BYTE *)(a2 + 96);
  sub_23A3795F0(v4, v5, v6, v7);
  *(_QWORD *)(a1 + 72) = v4;
  *(_QWORD *)(a1 + 80) = v5;
  *(_QWORD *)(a1 + 88) = v6;
  *(_BYTE *)(a1 + 96) = v7;
  v8 = *(_QWORD *)(a2 + 104);
  v9 = *(_QWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 120);
  v11 = *(_QWORD *)(a2 + 128);
  v12 = *(_BYTE *)(a2 + 136);
  sub_23A379478(v8, v9, v10, v11, v12);
  *(_QWORD *)(a1 + 104) = v8;
  *(_QWORD *)(a1 + 112) = v9;
  *(_QWORD *)(a1 + 120) = v10;
  *(_QWORD *)(a1 + 128) = v11;
  *(_BYTE *)(a1 + 136) = v12;
  *(_BYTE *)(a1 + 137) = *(_BYTE *)(a2 + 137);
  *(_WORD *)(a1 + 138) = *(_WORD *)(a2 + 138);
  *(_BYTE *)(a1 + 140) = *(_BYTE *)(a2 + 140);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  return a1;
}

uint64_t assignWithCopy for DiveConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v4 = *(_QWORD *)(a2 + 72);
  v5 = *(_QWORD *)(a2 + 80);
  v6 = *(_QWORD *)(a2 + 88);
  v7 = *(_BYTE *)(a2 + 96);
  sub_23A3795F0(v4, v5, v6, v7);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 72) = v4;
  *(_QWORD *)(a1 + 80) = v5;
  *(_QWORD *)(a1 + 88) = v6;
  v11 = *(_BYTE *)(a1 + 96);
  *(_BYTE *)(a1 + 96) = v7;
  sub_23A379608(v8, v9, v10, v11);
  v12 = *(_QWORD *)(a2 + 104);
  v13 = *(_QWORD *)(a2 + 112);
  v14 = *(_QWORD *)(a2 + 120);
  v15 = *(_QWORD *)(a2 + 128);
  v16 = *(_BYTE *)(a2 + 136);
  sub_23A379478(v12, v13, v14, v15, v16);
  v17 = *(_QWORD *)(a1 + 104);
  v18 = *(_QWORD *)(a1 + 112);
  v19 = *(_QWORD *)(a1 + 120);
  v20 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 104) = v12;
  *(_QWORD *)(a1 + 112) = v13;
  *(_QWORD *)(a1 + 120) = v14;
  *(_QWORD *)(a1 + 128) = v15;
  v21 = *(_BYTE *)(a1 + 136);
  *(_BYTE *)(a1 + 136) = v16;
  sub_23A379490(v17, v18, v19, v20, v21);
  *(_BYTE *)(a1 + 137) = *(_BYTE *)(a2 + 137);
  *(_BYTE *)(a1 + 138) = *(_BYTE *)(a2 + 138);
  *(_BYTE *)(a1 + 139) = *(_BYTE *)(a2 + 139);
  *(_BYTE *)(a1 + 140) = *(_BYTE *)(a2 + 140);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for DiveConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v4 = *(_QWORD *)(a2 + 88);
  v5 = *(_BYTE *)(a2 + 96);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = v4;
  v9 = *(_BYTE *)(a1 + 96);
  *(_BYTE *)(a1 + 96) = v5;
  sub_23A379608(v6, v7, v8, v9);
  v10 = *(_BYTE *)(a2 + 136);
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_QWORD *)(a1 + 112);
  v13 = *(_QWORD *)(a1 + 120);
  v14 = *(_QWORD *)(a1 + 128);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  v15 = *(_BYTE *)(a1 + 136);
  *(_BYTE *)(a1 + 136) = v10;
  sub_23A379490(v11, v12, v13, v14, v15);
  *(_BYTE *)(a1 + 137) = *(_BYTE *)(a2 + 137);
  *(_BYTE *)(a1 + 138) = *(_BYTE *)(a2 + 138);
  *(_BYTE *)(a1 + 139) = *(_BYTE *)(a2 + 139);
  *(_BYTE *)(a1 + 140) = *(_BYTE *)(a2 + 140);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for DiveConfiguration(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[160])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DiveConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 160) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 160) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DiveConfiguration()
{
  return &type metadata for DiveConfiguration;
}

void sub_23A3A730C()
{
  qword_256970908 = 0x6C7070612E6D6F63;
  unk_256970910 = 0xEF68747065442E65;
}

void sub_23A3A733C()
{
  qword_256970918 = 0x746C7561666564;
  unk_256970920 = 0xE700000000000000;
}

void sub_23A3A7360()
{
  strcpy((char *)&qword_256970928, "complications");
  unk_256970936 = -4864;
}

void sub_23A3A7390()
{
  qword_256970938 = 0x676E697473;
  unk_256970940 = 0xE500000000000000;
}

void sub_23A3A73B0()
{
  qword_256970948 = 0x694B68746C616548;
  unk_256970950 = 0xE900000000000074;
}

void sub_23A3A73D8()
{
  qword_256970958 = 0x72656874616577;
  unk_256970960 = 0xE700000000000000;
}

void sub_23A3A73FC()
{
  qword_256970968 = 0x6E6F697461636F6CLL;
  unk_256970970 = 0xE800000000000000;
}

void sub_23A3A7420()
{
  qword_256970978 = 0x6E6F6D656164;
  unk_256970980 = 0xE600000000000000;
}

void sub_23A3A7440()
{
  qword_256970988 = 0x746E65696C63;
  unk_256970990 = 0xE600000000000000;
}

void sub_23A3A7460()
{
  qword_256970998 = 0x746E65696C63;
  unk_2569709A0 = 0xE600000000000000;
}

uint64_t sub_23A3A7480()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_2569709A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569709A8);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F178;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F1C0, (uint64_t)qword_2569709A8, a1);
}

uint64_t sub_23A3A7580()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_2569709C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569709C0);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F180;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.complications.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F1C8, (uint64_t)qword_2569709C0, a1);
}

uint64_t sub_23A3A7680@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_23A3A8180();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_23A3A76E8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_2569709D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569709D8);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F190;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.healthkit.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F1D0, (uint64_t)qword_2569709D8, a1);
}

uint64_t sub_23A3A77E8()
{
  uint64_t v0;
  uint64_t result;

  sub_23A3A7F40();
  if (qword_25696F170 != -1)
    swift_once();
  v0 = qword_25696F180;
  swift_bridgeObjectRetain();
  if (v0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_23A3A848C();
  qword_2569709F0 = result;
  return result;
}

id static DepthLog.osLogger.getter()
{
  if (qword_25696F1D8 != -1)
    swift_once();
  return (id)qword_2569709F0;
}

uint64_t sub_23A3A78F0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_2569709F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569709F8);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F188;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.sting.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F1E0, (uint64_t)qword_2569709F8, a1);
}

uint64_t sub_23A3A79F0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_256970A10);
  __swift_project_value_buffer(v0, (uint64_t)qword_256970A10);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F1A0;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.location.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F1E8, (uint64_t)qword_256970A10, a1);
}

uint64_t sub_23A3A7AF0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_256970A28);
  __swift_project_value_buffer(v0, (uint64_t)qword_256970A28);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F198;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.weather.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F1F0, (uint64_t)qword_256970A28, a1);
}

uint64_t sub_23A3A7BF0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_256970A40);
  __swift_project_value_buffer(v0, (uint64_t)qword_256970A40);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F1A8;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F1F8, (uint64_t)qword_256970A40, a1);
}

uint64_t sub_23A3A7CF0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_256970A58);
  __swift_project_value_buffer(v0, (uint64_t)qword_256970A58);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F1B0;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F200, (uint64_t)qword_256970A58, a1);
}

uint64_t sub_23A3A7DF0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_23A3A8180();
  __swift_allocate_value_buffer(v0, qword_256970A70);
  __swift_project_value_buffer(v0, (uint64_t)qword_256970A70);
  if (qword_25696F170 != -1)
    swift_once();
  v1 = qword_25696F1B8;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_23A3A8174();
}

uint64_t static DepthLog.demo.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A3A7680(&qword_25696F208, (uint64_t)qword_256970A70, a1);
}

ValueMetadata *type metadata accessor for DepthLog()
{
  return &type metadata for DepthLog;
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

unint64_t sub_23A3A7F40()
{
  unint64_t result;

  result = qword_25696F690;
  if (!qword_25696F690)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25696F690);
  }
  return result;
}

uint64_t sub_23A3A7F7C()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_23A3A7F88()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_23A3A7F94()
{
  return MEMORY[0x24BDCB648]();
}

uint64_t sub_23A3A7FA0()
{
  return MEMORY[0x24BDCB6B0]();
}

uint64_t sub_23A3A7FAC()
{
  return MEMORY[0x24BDCB6D8]();
}

uint64_t sub_23A3A7FB8()
{
  return MEMORY[0x24BDCB710]();
}

uint64_t sub_23A3A7FC4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_23A3A7FD0()
{
  return MEMORY[0x24BDCB828]();
}

uint64_t sub_23A3A7FDC()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_23A3A7FE8()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_23A3A7FF4()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_23A3A8000()
{
  return MEMORY[0x24BDCB868]();
}

uint64_t sub_23A3A800C()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_23A3A8018()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23A3A8024()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_23A3A8030()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23A3A803C()
{
  return MEMORY[0x24BDCBEF8]();
}

uint64_t sub_23A3A8048()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23A3A8054()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23A3A8060()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23A3A806C()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_23A3A8078()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23A3A8084()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23A3A8090()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23A3A809C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A3A80A8()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23A3A80B4()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t _s9DepthCore11DiveSummaryV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23A3A80CC()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t _s9DepthCore11DiveSummaryV4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x24BDCEA08]();
}

uint64_t sub_23A3A80E4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A3A80F0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A3A80FC()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_23A3A8108()
{
  return MEMORY[0x24BDCF150]();
}

uint64_t sub_23A3A8114()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23A3A8120()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23A3A812C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23A3A8138()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23A3A8144()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23A3A8150()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_23A3A815C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23A3A8168()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A3A8174()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A3A8180()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A3A818C()
{
  return MEMORY[0x24BDB99C8]();
}

uint64_t sub_23A3A8198()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_23A3A81A4()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_23A3A81B0()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_23A3A81BC()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_23A3A81C8()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_23A3A81D4()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_23A3A81E0()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_23A3A81EC()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_23A3A81F8()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_23A3A8204()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_23A3A8210()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_23A3A821C()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_23A3A8228()
{
  return MEMORY[0x24BDD2108]();
}

uint64_t sub_23A3A8234()
{
  return MEMORY[0x24BDD2110]();
}

uint64_t sub_23A3A8240()
{
  return MEMORY[0x24BDD2118]();
}

uint64_t sub_23A3A824C()
{
  return MEMORY[0x24BDD2208]();
}

uint64_t sub_23A3A8258()
{
  return MEMORY[0x24BDD2210]();
}

uint64_t sub_23A3A8264()
{
  return MEMORY[0x24BDD2318]();
}

uint64_t sub_23A3A8270()
{
  return MEMORY[0x24BDD2328]();
}

uint64_t sub_23A3A827C()
{
  return MEMORY[0x24BDD2330]();
}

uint64_t sub_23A3A8288()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23A3A8294()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_23A3A82A0()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_23A3A82AC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A3A82B8()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_23A3A82C4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23A3A82D0()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23A3A82DC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A3A82E8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23A3A82F4()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_23A3A8300()
{
  return MEMORY[0x24BEE0AA0]();
}

uint64_t sub_23A3A830C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A3A8318()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A3A8324()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A3A8330()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23A3A833C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A3A8348()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A3A8354()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A3A8360()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A3A836C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A3A8378()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23A3A8384()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A3A8390()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A3A839C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23A3A83A8()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23A3A83B4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A3A83C0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A3A83CC()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23A3A83D8()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_23A3A83E4()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23A3A83F0()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_23A3A83FC()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23A3A8408()
{
  return MEMORY[0x24BEE7638]();
}

uint64_t sub_23A3A8414()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A3A8420()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A3A842C()
{
  return MEMORY[0x24BDD2530]();
}

uint64_t sub_23A3A8438()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_23A3A8444()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23A3A8450()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_23A3A845C()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_23A3A8468()
{
  return MEMORY[0x24BDD00A8]();
}

uint64_t sub_23A3A8474()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23A3A8480()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_23A3A848C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23A3A8498()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A3A84A4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A3A84B0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A3A84BC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A3A84C8()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_23A3A84D4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A3A84E0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A3A84EC()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_23A3A84F8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A3A8504()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A3A8510()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A3A851C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A3A8528()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_23A3A8534()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A3A8540()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A3A854C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A3A8558()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A3A8564()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A3A8570()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A3A857C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A3A8588()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A3A8594()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A3A85A0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A3A85AC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23A3A85B8()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A3A85C4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23A3A85D0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23A3A85DC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23A3A85E8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A3A85F4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23A3A8600()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23A3A860C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A3A8618()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A3A8624()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23A3A8630()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23A3A863C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A3A8648()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23A3A8654()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23A3A8660()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A3A866C()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_23A3A8678()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23A3A8684()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A3A8690()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A3A869C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A3A86A8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23A3A86B4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A3A86C0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A3A86CC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A3A86D8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A3A86E4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A3A86F0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A3A86FC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A3A8708()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A3A8714()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A3A8720()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A3A872C()
{
  return MEMORY[0x24BEE4A10]();
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

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

