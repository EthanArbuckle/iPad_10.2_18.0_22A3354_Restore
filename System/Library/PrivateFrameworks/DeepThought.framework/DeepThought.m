uint64_t dispatch thunk of static PenetrationRateEventFilter.isAppUIEvent(appIntent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static PenetrationRateEventFilter.isSiriEvent(siriExecution:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

BOOL sub_23A2805A4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_23A2805B8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_23A2805C8(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for BMAppIntentHandlingStatus(uint64_t a1)
{
  sub_23A280610(a1, &qword_25695B1A0);
}

void type metadata accessor for BMAppIntentInteractionDirection(uint64_t a1)
{
  sub_23A280610(a1, &qword_25695B1A8);
}

void type metadata accessor for BMSiriExecutionTaskStep(uint64_t a1)
{
  sub_23A280610(a1, &qword_25695B1B0);
}

void sub_23A280610(uint64_t a1, unint64_t *a2)
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

void PenetrationRateCalculationTask.taskType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t PenetrationRateCalculationTask.eventFilter.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_23A280674()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for SendSMSPenetrationRateEventFilter();
  type metadata accessor for PenetrationRateCalculationTask();
  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = v0;
  *(_QWORD *)(result + 32) = &protocol witness table for SendSMSPenetrationRateEventFilter;
  qword_25695B1B8 = result;
  return result;
}

uint64_t static PenetrationRateCalculationTask.sendSMSCalculation.getter()
{
  return sub_23A2807B4(&qword_25695B150);
}

uint64_t sub_23A2806DC()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for SetReminderPenetrationEventFilter();
  type metadata accessor for PenetrationRateCalculationTask();
  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 1;
  *(_QWORD *)(result + 24) = v0;
  *(_QWORD *)(result + 32) = &protocol witness table for SetReminderPenetrationEventFilter;
  qword_25695B1C0 = result;
  return result;
}

uint64_t static PenetrationRateCalculationTask.setReminderCalculation.getter()
{
  return sub_23A2807B4(&qword_25695B158);
}

uint64_t sub_23A280748()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for StartCallPenetrationRateEventFilter();
  type metadata accessor for PenetrationRateCalculationTask();
  result = swift_allocObject();
  *(_BYTE *)(result + 16) = 2;
  *(_QWORD *)(result + 24) = v0;
  *(_QWORD *)(result + 32) = &protocol witness table for StartCallPenetrationRateEventFilter;
  qword_25695B1C8 = result;
  return result;
}

uint64_t static PenetrationRateCalculationTask.startCallCalculation.getter()
{
  return sub_23A2807B4(&qword_25695B160);
}

uint64_t sub_23A2807B4(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t PenetrationRateCalculationTask.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PenetrationRateCalculationTask.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PenetrationRateCalculationTask()
{
  return objc_opt_self();
}

uint64_t method lookup function for PenetrationRateCalculationTask()
{
  return swift_lookUpClassMethod();
}

uint64_t SiriPenetrationRateResult.countsByAggregationInterval.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriPenetrationRateResult.countsByAggregationInterval.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*SiriPenetrationRateResult.countsByAggregationInterval.modify())()
{
  return nullsub_1;
}

uint64_t SiriPenetrationRateResult.eventStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriPenetrationRateResult.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A280884()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A28088C()
{
  return swift_bridgeObjectRetain();
}

BOOL static SiriPenetrationRateUtils.hasViewMode(siriUI:)(uint64_t a1)
{
  return sub_23A2808EC(a1, (void (*)(_QWORD))MEMORY[0x24BE2B9F8], MEMORY[0x24BE2B9F0], (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x24BE2BA40]);
}

BOOL static SiriPenetrationRateUtils.hasAudioInputRoute(turn:)(uint64_t a1)
{
  return sub_23A2808EC(a1, (void (*)(_QWORD))MEMORY[0x24BE2B9A0], MEMORY[0x24BE2B998], (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x24BE2BBE8]);
}

BOOL static SiriPenetrationRateUtils.hasSiriInputLocale(turn:)(uint64_t a1)
{
  return sub_23A2808EC(a1, (void (*)(_QWORD))MEMORY[0x24BE2B9C8], MEMORY[0x24BE2B9C0], (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD))MEMORY[0x24BE2BBE8]);
}

BOOL sub_23A2808EC(uint64_t a1, void (*a2)(_QWORD), uint64_t (*a3)(void), void (*a4)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  a2(0);
  v6 = a3();
  a4(&v10, v6, v7, MEMORY[0x24BEE0D00], MEMORY[0x24BEE0D00]);
  swift_bridgeObjectRelease();
  v8 = v11;
  if (v11)
    swift_bridgeObjectRelease();
  return v8 != 0;
}

uint64_t sub_23A280970(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_23A2A3C74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23A2A3C74();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B8475C4](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_23A292D54(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_23A2A3C74();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_23A2A3B00();
  }
  __break(1u);
  return result;
}

uint64_t _s11DeepThought24SiriPenetrationRateUtilsO07alignToC15ExecutionEvents04siriiJ00K8UIEvents0K13Conversations12timeDurationSay0aB15BiomeFoundation15FeaturizedEventCGAL_ALSayAI0R12ConversationCGSdtFZ_0(unint64_t a1, unint64_t a2, unint64_t a3, double a4)
{
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
  __int128 v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  char *v39;
  char *v40;
  NSObject *v41;
  int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  int v55;
  unint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  char *v79;
  unint64_t v80;
  unint64_t v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  char *v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int64_t v101;
  unint64_t v102;
  int64_t v103;
  uint64_t v104;
  int64_t v105;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  unint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  __int128 v134;
  unint64_t v135;
  uint64_t v136;
  char *v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  v111 = a3;
  v135 = a2;
  v130 = sub_23A2A371C();
  v127 = *(_QWORD *)(v130 - 8);
  MEMORY[0x24BDAC7A8](v130);
  v129 = (char *)&v107 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = sub_23A2A3560();
  v121 = *(_QWORD *)(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  v120 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A2A3A04();
  v131 = *(_QWORD *)(v8 - 8);
  v132 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v107 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v133 = (char *)&v107 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v107 - v17;
  v128 = sub_23A2A39BC();
  swift_allocObject();
  v19 = sub_23A2A3980();
  if (a1 >> 62)
    goto LABEL_52;
  v20 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  v124 = v19;
  v113 = v11;
  v119 = v14;
  if (v20)
  {
    v22 = a1 & 0xC000000000000001;
    v11 = 4;
    *(_QWORD *)&v21 = 136315394;
    v134 = v21;
    *(_QWORD *)&v117 = MEMORY[0x24BEE4AD8] + 8;
    v126 = (char *)a1;
    v125 = v18;
    v123 = v20;
    *(_QWORD *)&v118 = a1 & 0xC000000000000001;
    while (1)
    {
      v23 = v11 - 4;
      if (v22)
      {
        v14 = (char *)MEMORY[0x23B8475B8](v11 - 4, a1);
        v24 = __OFADD__(v23, 1);
        v25 = v11 - 3;
        if (v24)
          goto LABEL_44;
      }
      else
      {
        v14 = *(char **)(a1 + 8 * v11);
        swift_retain();
        v24 = __OFADD__(v23, 1);
        v25 = v11 - 3;
        if (v24)
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          swift_bridgeObjectRetain();
          v20 = sub_23A2A3C74();
          goto LABEL_3;
        }
      }
      sub_23A2A37F4();
      swift_retain_n();
      v26 = sub_23A2A39EC();
      v19 = sub_23A2A3B84();
      if (os_log_type_enabled(v26, (os_log_type_t)v19))
      {
        v136 = v25;
        v27 = swift_slowAlloc();
        v18 = (char *)swift_slowAlloc();
        v137 = v18;
        *(_DWORD *)v27 = v134;
        sub_23A2A3824();
        v28 = v120;
        sub_23A2A3524();
        sub_23A282054();
        v29 = v122;
        a1 = sub_23A2A3D4C();
        v31 = v30;
        (*(void (**)(char *, uint64_t))(v121 + 8))(v28, v29);
        *(_QWORD *)(v27 + 4) = sub_23A288988(a1, v31, (uint64_t *)&v137);
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2048;
        sub_23A2A3824();
        v33 = v32;
        swift_release();
        v34 = v33 / a4;
        if ((~COERCE__INT64(v33 / a4) & 0x7FF0000000000000) == 0)
          goto LABEL_46;
        if (v34 <= -9.22337204e18)
          goto LABEL_47;
        if (v34 >= 9.22337204e18)
          goto LABEL_48;
        *(_QWORD *)(v27 + 14) = (uint64_t)v34;
        swift_release();
        _os_log_impl(&dword_23A27E000, v26, (os_log_type_t)v19, "marker: adding the event to the siriExecutionEventsByBucketizedTimestamp at time %s with bucket %ld", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x23B847BB8](v18, -1, -1);
        MEMORY[0x23B847BB8](v27, -1, -1);

        v18 = v125;
        (*(void (**)(char *, uint64_t))(v131 + 8))(v125, v132);
        a1 = (unint64_t)v126;
        v20 = v123;
        v22 = v118;
        v25 = v136;
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v131 + 8))(v18, v132);
      }
      sub_23A2A3824();
      v19 = v124;
      sub_23A2A3974();
      swift_release();
      ++v11;
      if (v25 == v20)
      {
        swift_bridgeObjectRelease();
        v11 = v113;
        v14 = v119;
        goto LABEL_19;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_19:
  swift_allocObject();
  v112 = sub_23A2A3980();
  v35 = v135;
  v36 = MEMORY[0x24BEE4AD8];
  if (v135 >> 62)
  {
    swift_bridgeObjectRetain();
    v18 = (char *)sub_23A2A3C74();
    if (v18)
    {
LABEL_21:
      v136 = sub_23A2A3794();
      *(_QWORD *)&v134 = v35 & 0xC000000000000001;
      LODWORD(v123) = *MEMORY[0x24BE2B950];
      v19 = 4;
      *(_QWORD *)&v37 = 136315650;
      v118 = v37;
      *(_QWORD *)&v117 = v36 + 8;
      v126 = v18;
      do
      {
        v38 = v19 - 4;
        if ((_QWORD)v134)
        {
          a1 = MEMORY[0x23B8475B8](v19 - 4, v35);
          v39 = (char *)(v19 - 3);
          if (__OFADD__(v38, 1))
            goto LABEL_45;
        }
        else
        {
          a1 = *(_QWORD *)(v35 + 8 * v19);
          swift_retain();
          v39 = (char *)(v19 - 3);
          if (__OFADD__(v38, 1))
            goto LABEL_45;
        }
        sub_23A2A3788();
        sub_23A2A3800();
        swift_bridgeObjectRelease();
        if (v138)
        {
          swift_bridgeObjectRelease();
          v40 = v133;
          sub_23A2A37F4();
          swift_retain_n();
          v41 = sub_23A2A39EC();
          v42 = sub_23A2A3B84();
          if (os_log_type_enabled(v41, (os_log_type_t)v42))
          {
            LODWORD(v125) = v42;
            v11 = swift_slowAlloc();
            v43 = swift_slowAlloc();
            v141 = v43;
            *(_DWORD *)v11 = v118;
            sub_23A2A3824();
            v44 = v120;
            sub_23A2A3524();
            sub_23A282054();
            v18 = (char *)v122;
            v45 = sub_23A2A3D4C();
            v14 = v46;
            (*(void (**)(char *, char *))(v121 + 8))(v44, v18);
            *(_QWORD *)(v11 + 4) = sub_23A288988(v45, (unint64_t)v14, &v141);
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v11 + 12) = 2048;
            sub_23A2A3824();
            v48 = v47;
            swift_release();
            v49 = v48 / a4;
            if ((~COERCE__INT64(v48 / a4) & 0x7FF0000000000000) == 0)
              goto LABEL_49;
            if (v49 <= -9.22337204e18)
              goto LABEL_50;
            if (v49 >= 9.22337204e18)
              goto LABEL_51;
            *(_QWORD *)(v11 + 14) = (uint64_t)v49;
            swift_release();
            *(_WORD *)(v11 + 22) = 2080;
            sub_23A2A3788();
            sub_23A2A3800();
            swift_bridgeObjectRelease();
            if (v138)
              v50 = (uint64_t)v137;
            else
              v50 = 0;
            if (v138)
              v51 = v138;
            else
              v51 = 0xE000000000000000;
            *(_QWORD *)(v11 + 24) = sub_23A288988(v50, v51, &v141);
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23A27E000, v41, (os_log_type_t)v125, "marker: trying to add the event to the siriUIEventsByBucketizedTimestamp at time %s with bucket %ld with %s", (uint8_t *)v11, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x23B847BB8](v43, -1, -1);
            MEMORY[0x23B847BB8](v11, -1, -1);

            (*(void (**)(char *, uint64_t))(v131 + 8))(v133, v132);
            v11 = v113;
            v36 = MEMORY[0x24BEE4AD8];
          }
          else
          {

            swift_release_n();
            (*(void (**)(char *, uint64_t))(v131 + 8))(v40, v132);
          }
          v52 = v127;
          v139 = v128;
          v140 = MEMORY[0x24BE2BCC8];
          v137 = (char *)v124;
          v54 = v129;
          v53 = v130;
          (*(void (**)(char *, _QWORD, uint64_t))(v127 + 104))(v129, v123, v130);
          swift_retain();
          sub_23A2A3998();
          swift_release();
          swift_release();
          (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v53);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v137);
          v14 = v119;
          v35 = v135;
          v18 = v126;
        }
        else
        {
          swift_release();
          v35 = v135;
        }
        ++v19;
      }
      while (v39 != v18);
      swift_bridgeObjectRelease();
      v19 = v124;
      v55 = v123;
      goto LABEL_55;
    }
  }
  else
  {
    v18 = *(char **)((v135 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18)
      goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  v55 = *MEMORY[0x24BE2B950];
LABEL_55:
  v56 = v127;
  v57 = *(char **)(v127 + 104);
  v58 = v129;
  LODWORD(v123) = v55;
  v59 = v130;
  v126 = v57;
  ((void (*)(char *))v57)(v129);
  sub_23A2A3968();
  v125 = *(char **)(v56 + 8);
  ((void (*)(char *, uint64_t))v125)(v58, v59);
  sub_23A2A395C();
  swift_allocObject();
  v60 = sub_23A2A3938();
  if (v111 >> 62)
    goto LABEL_119;
  v61 = *(_QWORD *)((v111 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v63 = v61;
LABEL_57:
  v64 = v111;
  *(_QWORD *)&v118 = v60;
  if (v63)
  {
    v65 = 0;
    v110 = v111 & 0xC000000000000001;
    v108 = v111 & 0xFFFFFFFFFFFFFF8;
    v107 = v111 + 32;
    *(_QWORD *)&v62 = 136315394;
    v117 = v62;
    v116 = v36 + 8;
    v109 = v63;
    do
    {
      if (v110)
      {
        v66 = v65;
        v67 = MEMORY[0x23B8475B8](v65, v64);
        v36 = v123;
        v24 = __OFADD__(v66, 1);
        v68 = v66 + 1;
        if (v24)
          goto LABEL_116;
      }
      else
      {
        v36 = v123;
        if (v65 >= *(_QWORD *)(v108 + 16))
          goto LABEL_117;
        v67 = *(_QWORD *)(v107 + 8 * v65);
        v69 = v65;
        swift_retain();
        v24 = __OFADD__(v69, 1);
        v68 = v69 + 1;
        if (v24)
          goto LABEL_116;
      }
      v115 = v68;
      v70 = sub_23A2A38B4();
      v114 = v67;
      if (v70 >> 62)
      {
        v71 = sub_23A2A3C74();
        if (v71)
        {
LABEL_68:
          v72 = sub_23A2A3734();
          v133 = (char *)v71;
          *(_QWORD *)&v134 = v72;
          v135 = v70 & 0xC000000000000001;
          v11 = 4;
          v127 = v70;
          do
          {
            v75 = v11 - 4;
            if (v135)
            {
              MEMORY[0x23B8475B8](v11 - 4, v70);
              v76 = v11 - 3;
              if (__OFADD__(v75, 1))
                goto LABEL_111;
            }
            else
            {
              swift_retain();
              v76 = v11 - 3;
              if (__OFADD__(v75, 1))
              {
LABEL_111:
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
                swift_bridgeObjectRetain();
                v63 = sub_23A2A3C74();
                goto LABEL_57;
              }
            }
            v136 = v76;
            sub_23A2A3728();
            sub_23A2A38D8();
            swift_bridgeObjectRelease();
            if (v138 || (sub_23A2A374C(), sub_23A2A3740(), sub_23A2A38D8(), swift_bridgeObjectRelease(), v138))
            {
              swift_bridgeObjectRelease();
              sub_23A2A37F4();
              swift_retain_n();
              v77 = sub_23A2A39EC();
              v78 = sub_23A2A3B84();
              if (os_log_type_enabled(v77, v78))
              {
                v19 = swift_slowAlloc();
                v60 = swift_slowAlloc();
                v137 = (char *)v60;
                *(_DWORD *)v19 = v117;
                sub_23A2A38E4();
                v79 = v120;
                sub_23A2A3524();
                sub_23A282054();
                v36 = v122;
                v14 = (char *)sub_23A2A3D4C();
                v81 = v80;
                (*(void (**)(char *, uint64_t))(v121 + 8))(v79, v36);
                *(_QWORD *)(v19 + 4) = sub_23A288988((uint64_t)v14, v81, (uint64_t *)&v137);
                swift_release_n();
                swift_bridgeObjectRelease();
                *(_WORD *)(v19 + 12) = 2048;
                sub_23A2A38E4();
                v83 = v82;
                swift_release();
                v84 = v83 / a4;
                if ((~COERCE__INT64(v83 / a4) & 0x7FF0000000000000) == 0)
                  goto LABEL_112;
                if (v84 <= -9.22337204e18)
                  goto LABEL_113;
                if (v84 >= 9.22337204e18)
                  goto LABEL_114;
                *(_QWORD *)(v19 + 14) = (uint64_t)v84;
                swift_release();
                _os_log_impl(&dword_23A27E000, v77, v78, "marker: trying to add the turn to the turnsByBucketizedTimestamp at time %s with bucket %ld", (uint8_t *)v19, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x23B847BB8](v60, -1, -1);
                MEMORY[0x23B847BB8](v19, -1, -1);

                v14 = v119;
                (*(void (**)(char *, uint64_t))(v131 + 8))(v119, v132);
                v19 = v124;
                v60 = v118;
                v36 = v123;
              }
              else
              {

                swift_release_n();
                (*(void (**)(char *, uint64_t))(v131 + 8))(v14, v132);
              }
              v73 = v129;
              v139 = v128;
              v140 = MEMORY[0x24BE2BCC8];
              v137 = (char *)v19;
              v74 = v130;
              ((void (*)(char *, uint64_t, uint64_t))v126)(v129, v36, v130);
              swift_retain();
              sub_23A2A3944();
              swift_release();
              swift_release();
              ((void (*)(char *, uint64_t))v125)(v73, v74);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v137);
              v70 = v127;
            }
            else
            {
              swift_release();
            }
            ++v11;
          }
          while ((char *)v136 != v133);
        }
      }
      else
      {
        v71 = *(_QWORD *)((v70 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v71)
          goto LABEL_68;
      }
      swift_release();
      swift_bridgeObjectRelease();
      v65 = v115;
      v11 = v113;
      v64 = v111;
    }
    while (v115 != v109);
  }
  swift_bridgeObjectRelease();
  v86 = v129;
  v85 = v130;
  ((void (*)(char *, _QWORD, uint64_t))v126)(v129, v123, v130);
  sub_23A2A39B0();
  ((void (*)(char *, uint64_t))v125)(v86, v85);
  sub_23A2A37F4();
  swift_retain_n();
  v14 = (char *)v112;
  swift_retain_n();
  swift_retain_n();
  v87 = sub_23A2A39EC();
  v88 = sub_23A2A3B84();
  if (os_log_type_enabled(v87, v88))
  {
    v89 = swift_slowAlloc();
    v90 = swift_slowAlloc();
    v137 = (char *)v90;
    *(_DWORD *)v89 = 136315650;
    v91 = sub_23A2A39A4();
    v141 = sub_23A288988(v91, v92, (uint64_t *)&v137);
    sub_23A2A3BA8();
    swift_release_n();
    swift_bridgeObjectRelease();
    v11 = 2080;
    *(_WORD *)(v89 + 12) = 2080;
    v93 = sub_23A2A39A4();
    v141 = sub_23A288988(v93, v94, (uint64_t *)&v137);
    sub_23A2A3BA8();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 22) = 2080;
    v95 = sub_23A2A3950();
    v141 = sub_23A288988(v95, v96, (uint64_t *)&v137);
    sub_23A2A3BA8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A27E000, v87, v88, "    marker: The detail of siriExecutionEventsByBucketizedTimestamp is %s,\n\n            The detail of siriUIEventsByBucketizedTimestamp is %s,\n\n            The detail of turnsByBucketizedTimestamp is %s,\n", (uint8_t *)v89, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v90, -1, -1);
    MEMORY[0x23B847BB8](v89, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v113, v132);
  }
  else
  {

    swift_release_n();
    swift_release_n();
    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v11, v132);
  }
  v137 = (char *)MEMORY[0x24BEE4AF8];
  v97 = sub_23A2A398C();
  v19 = 0;
  v98 = v97 + 64;
  v99 = 1 << *(_BYTE *)(v97 + 32);
  v100 = -1;
  if (v99 < 64)
    v100 = ~(-1 << v99);
  v36 = v100 & *(_QWORD *)(v97 + 64);
  v101 = (unint64_t)(v99 + 63) >> 6;
  v60 = v112;
  while (1)
  {
    if (v36)
    {
      v36 &= v36 - 1;
      goto LABEL_94;
    }
    v103 = v19 + 1;
    if (__OFADD__(v19, 1))
      goto LABEL_115;
    if (v103 >= v101)
      break;
    v104 = *(_QWORD *)(v98 + 8 * v103);
    ++v19;
    if (!v104)
    {
      v19 = v103 + 1;
      if (v103 + 1 >= v101)
        break;
      v104 = *(_QWORD *)(v98 + 8 * v19);
      if (!v104)
      {
        v19 = v103 + 2;
        if (v103 + 2 >= v101)
          break;
        v104 = *(_QWORD *)(v98 + 8 * v19);
        if (!v104)
        {
          v105 = v103 + 3;
          if (v105 >= v101)
            break;
          v104 = *(_QWORD *)(v98 + 8 * v105);
          if (!v104)
          {
            while (1)
            {
              v19 = v105 + 1;
              if (__OFADD__(v105, 1))
                goto LABEL_118;
              if (v19 >= v101)
                goto LABEL_110;
              v104 = *(_QWORD *)(v98 + 8 * v19);
              ++v105;
              if (v104)
                goto LABEL_109;
            }
          }
          v19 = v105;
        }
      }
    }
LABEL_109:
    v36 = (v104 - 1) & v104;
LABEL_94:
    v102 = swift_bridgeObjectRetain();
    sub_23A280970(v102);
  }
LABEL_110:
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return (uint64_t)v137;
}

unint64_t sub_23A281DD0(uint64_t a1)
{
  unint64_t result;

  result = sub_23A281DF4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23A281DF4()
{
  unint64_t result;

  result = qword_25695B278;
  if (!qword_25695B278)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for SiriPenetrationRateResult, &type metadata for SiriPenetrationRateResult);
    atomic_store(result, (unint64_t *)&qword_25695B278);
  }
  return result;
}

uint64_t destroy for SiriPenetrationRateResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s11DeepThought25SiriPenetrationRateResultVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SiriPenetrationRateResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SiriPenetrationRateResult(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriPenetrationRateResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriPenetrationRateResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriPenetrationRateResult()
{
  return &type metadata for SiriPenetrationRateResult;
}

ValueMetadata *type metadata accessor for SiriPenetrationRateUtils()
{
  return &type metadata for SiriPenetrationRateUtils;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_23A282054()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25695B280;
  if (!qword_25695B280)
  {
    v1 = sub_23A2A3560();
    result = MEMORY[0x23B847B10](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_25695B280);
  }
  return result;
}

uint64_t Date.getPreviousDate(calendar:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v2 = sub_23A2A365C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCF220], v2);
  sub_23A2A3638();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v8 = sub_23A2A3560();
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B847AF8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t Date.getEndOfDate(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A28222C(a1, 23, 59, a2);
}

uint64_t Date.getStartOfDate(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A28222C(a1, 0, 0, a2);
}

uint64_t sub_23A28222C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a2;
  v24 = a3;
  v25 = a1;
  v21 = a4;
  v4 = sub_23A2A3614();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A2A3620();
  v22 = *(_QWORD *)(v8 - 8);
  v9 = v22;
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A2A35FC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDCF020], v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDCF0B0], v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCF068], v4);
  sub_23A2A362C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v18 = sub_23A2A3560();
  v19 = *(_QWORD *)(v18 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(v21, v17, v18);
  __break(1u);
  return result;
}

uint64_t Date.getOffsetDateByDays(calendar:numOfDays:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v2 = sub_23A2A365C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCF220], v2);
  sub_23A2A3638();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v8 = sub_23A2A3560();
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
  __break(1u);
  return result;
}

uint64_t static Calendar.currentUTC.getter()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A8);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A2A3644();
  sub_23A2A3674();
  v2 = sub_23A2A3680();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2);
  if ((_DWORD)result != 1)
    return sub_23A2A3650();
  __break(1u);
  return result;
}

uint64_t Calendar.numberOfDaysBetween(start:end:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v0 = sub_23A2A3500();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2B0);
  v4 = sub_23A2A365C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23A2A45A0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v5 + 104))(v7 + v6, *MEMORY[0x24BDCF220], v4);
  sub_23A282ABC(v7);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_23A2A3608();
  swift_bridgeObjectRelease();
  result = sub_23A2A34F4();
  if ((v9 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = result;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return v10;
  }
  return result;
}

uint64_t sub_23A2827A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  __swift_allocate_value_buffer(v0, qword_25695B288);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25695B288);
  v2 = sub_23A2A3560();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t static CustomDate.dateOverride.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25695B168 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25695B288);
  swift_beginAccess();
  return sub_23A282D3C(v3, a1);
}

uint64_t static CustomDate.dateOverride.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25695B168 != -1)
    swift_once();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25695B288);
  swift_beginAccess();
  sub_23A282D84(a1, v3);
  swift_endAccess();
  return sub_23A282DCC(a1);
}

uint64_t (*static CustomDate.dateOverride.modify())()
{
  uint64_t v0;

  if (qword_25695B168 != -1)
    swift_once();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25695B288);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static CustomDate.current()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25695B168 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v2, (uint64_t)qword_25695B288);
  swift_beginAccess();
  sub_23A282D3C(v5, (uint64_t)v4);
  v6 = sub_23A2A3560();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v4, v6);
  sub_23A2A3554();
  return sub_23A282DCC((uint64_t)v4);
}

uint64_t sub_23A282ABC(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_23A2A365C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2C0);
    v10 = sub_23A2A3BE4();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_23A28338C(&qword_25695B2C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_23A2A3A34();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_23A28338C(&qword_25695B2D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_23A2A3A58();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A282D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A282D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A282DCC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s11DeepThought10CustomDateO15isTodayOrFuture4date8calendarSb10Foundation0D0V_AG8CalendarVtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  char *v28;
  void (*v29)(_QWORD);
  unsigned int v30;
  uint64_t v31;
  void (*v32)(_QWORD);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(_QWORD);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  unsigned int v52;
  void (*v53)(char *, _QWORD, uint64_t);
  unsigned int v54;
  void (*v55)(char *, _QWORD, uint64_t);
  unsigned int v56;
  void (*v57)(char *, _QWORD, uint64_t);
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t (*v70)(char *, uint64_t, uint64_t);
  uint64_t v71;

  v67 = a2;
  v60 = a1;
  v71 = sub_23A2A3614();
  v65 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v63 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_23A2A3620();
  v64 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v4 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A2A35FC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v66 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v59 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v50 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v50 - v14;
  v16 = sub_23A2A3560();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v51 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v50 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v50 - v23;
  if (qword_25695B168 != -1)
    swift_once();
  v68 = v24;
  v25 = __swift_project_value_buffer(v8, (uint64_t)qword_25695B288);
  swift_beginAccess();
  sub_23A282D3C(v25, (uint64_t)v15);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  v27 = v26(v15, 1, v16);
  v58 = v17;
  v69 = v22;
  v70 = v26;
  v61 = v16;
  if (v27 == 1)
  {
    sub_23A2A3554();
    sub_23A282DCC((uint64_t)v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
  }
  v28 = v66;
  v29 = *(void (**)(_QWORD))(v6 + 104);
  v56 = *MEMORY[0x24BDCF020];
  v57 = (void (*)(char *, _QWORD, uint64_t))v29;
  v29(v66);
  v30 = *MEMORY[0x24BDCF0B0];
  v67 = v6;
  v31 = v64;
  v32 = *(void (**)(_QWORD))(v64 + 104);
  v54 = v30;
  v33 = v62;
  v55 = (void (*)(char *, _QWORD, uint64_t))v32;
  v32(v4);
  v34 = v65;
  v35 = *(void (**)(_QWORD))(v65 + 104);
  v36 = v63;
  v52 = *MEMORY[0x24BDCF068];
  v37 = v71;
  v53 = (void (*)(char *, _QWORD, uint64_t))v35;
  v35(v63);
  sub_23A2A362C();
  v65 = *(_QWORD *)(v34 + 8);
  ((void (*)(char *, uint64_t))v65)(v36, v37);
  v64 = *(_QWORD *)(v31 + 8);
  ((void (*)(char *, uint64_t))v64)(v4, v33);
  v38 = v33;
  v67 = *(_QWORD *)(v67 + 8);
  ((void (*)(char *, uint64_t))v67)(v28, v5);
  v39 = v61;
  result = v70(v13, 1, v61);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v41 = v58;
    v50 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
    v50(v68, v13, v39);
    v42 = *(void (**)(char *, uint64_t))(v41 + 8);
    v42(v69, v39);
    v57(v28, v56, v5);
    v55(v4, v54, v38);
    v43 = v38;
    v44 = v71;
    v53(v36, v52, v71);
    v45 = v59;
    sub_23A2A362C();
    ((void (*)(char *, uint64_t))v65)(v36, v44);
    ((void (*)(char *, uint64_t))v64)(v4, v43);
    ((void (*)(char *, uint64_t))v67)(v28, v5);
    v46 = v45;
    result = v70(v45, 1, v39);
    if ((_DWORD)result != 1)
    {
      v47 = v51;
      v50(v51, v46, v39);
      sub_23A28338C(&qword_25695B2B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
      v48 = v68;
      v49 = sub_23A2A3A4C();
      v42(v47, v39);
      v42(v48, v39);
      return (v49 & 1) == 0;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for CustomDate()
{
  return &type metadata for CustomDate;
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

uint64_t sub_23A28338C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B847B10](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SiriPenetrationRateSELFReporter.odmId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  v4 = sub_23A2A359C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SiriPenetrationRateSELFReporter.__allocating_init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = swift_allocObject();
  v5 = v4 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  v6 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  v7 = v4 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  v8 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
  return v4;
}

uint64_t SiriPenetrationRateSELFReporter.init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = v2 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  v6 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  v7 = v2 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  v8 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
  return v2;
}

uint64_t sub_23A28352C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

void sub_23A283548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18[2];

  v1 = *(_QWORD *)(v0 + 24);
  v2 = v1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v6 = *(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  v7 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  while (v5)
  {
    v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    v10 = v9 | (v8 << 6);
LABEL_20:
    v14 = *(_QWORD *)(v1 + 48) + 16 * v10;
    v15 = *(double *)(v14 + 8);
    v16 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v10);
    LODWORD(v18[0]) = *(_DWORD *)v14;
    v18[1] = v15;
    swift_bridgeObjectRetain();
    v17 = _s11DeepThought20SELFMessageConverterO27convertToODMSiriClientEvent19aggregationInterval6counts5odmId6loggerSo0g6SchemaghI0CSgAA011AggregationK0V_SayAA14CountsReportedVG10Foundation4UUIDV2os6LoggerVtFZ_0(v18, v16, v6);
    swift_bridgeObjectRelease();
    if (v17)
    {
      sub_23A283708(v17);

    }
  }
  v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v11 >= v7)
    goto LABEL_22;
  v12 = *(_QWORD *)(v2 + 8 * v11);
  ++v8;
  if (v12)
    goto LABEL_19;
  v8 = v11 + 1;
  if (v11 + 1 >= v7)
    goto LABEL_22;
  v12 = *(_QWORD *)(v2 + 8 * v8);
  if (v12)
    goto LABEL_19;
  v8 = v11 + 2;
  if (v11 + 2 >= v7)
    goto LABEL_22;
  v12 = *(_QWORD *)(v2 + 8 * v8);
  if (v12)
  {
LABEL_19:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_20;
  }
  v13 = v11 + 3;
  if (v13 >= v7)
  {
LABEL_22:
    swift_release();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v12 = *(_QWORD *)(v2 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v7)
      goto LABEL_22;
    v12 = *(_QWORD *)(v2 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_19;
  }
LABEL_24:
  __break(1u);
}

uint64_t sub_23A283708(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void (*v18)(char *, uint64_t);
  id v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = sub_23A2A359C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - v7;
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedAnalytics);
  v10 = objc_msgSend(v9, sel_defaultMessageStream);

  sub_23A2A3590();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v11 = a1;
  v12 = sub_23A2A39EC();
  v13 = sub_23A2A3B84();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v28 = v2;
    v15 = v14;
    v25 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v30 = v26;
    *(_DWORD *)v15 = 136315394;
    v27 = v10;
    v16 = sub_23A2A3578();
    v29 = sub_23A288988(v16, v17, &v30);
    sub_23A2A3BA8();
    swift_bridgeObjectRelease();
    v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v6, v28);
    *(_WORD *)(v15 + 12) = 2112;
    v29 = (uint64_t)v11;
    v19 = v11;
    sub_23A2A3BA8();
    v20 = v25;
    *v25 = v11;

    v10 = v27;
    _os_log_impl(&dword_23A27E000, v12, v13, "SELF reporter: reported task with stats, isolatedStreamUUID = %s, message = %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695B3C0);
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v20, -1, -1);
    v21 = v26;
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v21, -1, -1);
    v22 = v15;
    v2 = v28;
    MEMORY[0x23B847BB8](v22, -1, -1);

  }
  else
  {

    v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v6, v2);

  }
  v23 = (void *)sub_23A2A3584();
  objc_msgSend(v10, sel_emitMessage_isolatedStreamUUID_, v11, v23);

  return ((uint64_t (*)(char *, uint64_t))v18)(v8, v2);
}

uint64_t sub_23A2839FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  v4 = sub_23A2A3A04();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t SiriPenetrationRateSELFReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  v4 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriPenetrationRateSELFReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  v4 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_23A283B48(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23A2A3AC4();
    return sub_23A2A3AE8();
  }
  return result;
}

uint64_t sub_23A283BD0(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;

  if ((a6 & 0x2000000000000000) != 0)
    v6 = HIBYTE(a6) & 0xF;
  else
    v6 = a5 & 0xFFFFFFFFFFFFLL;
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6)
    return 1;
  else
    return sub_23A2A3D40() & 1;
}

id _s11DeepThought20SELFMessageConverterO30convertLocaleStringToISOLocale6localeSo08SISchemaI0CSgSSSg_tFZ_0(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  id v22;

  v2 = a2;
  if (a2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_23A283B48(6);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    swift_bridgeObjectRelease();
    LOBYTE(v4) = sub_23A283BD0(v4, v6, v8, v10, 0x454C41434F4CLL, 0xE600000000000000);
    swift_bridgeObjectRelease();
    if ((v4 & 1) != 0)
    {
      v21 = a1;
      v22 = v2;
      sub_23A287448();
      v11 = (_QWORD *)sub_23A2A3BC0();
      if (v11[2] == 3)
      {
        swift_bridgeObjectRetain();
        v12 = (void *)sub_23A2A3A64();
        swift_bridgeObjectRelease();
        v13 = v12;
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ISOLANGUAGECODE_UNKNOWN"), 95, 0xE100000000000000, v21, v22) & 1) != 0)
        {
          v14 = 0;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AB")) & 1) != 0)
        {
          v14 = 1;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AA")) & 1) != 0)
        {
          v14 = 2;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AF")) & 1) != 0)
        {
          v14 = 3;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AK")) & 1) != 0)
        {
          v14 = 4;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SQ")) & 1) != 0)
        {
          v14 = 5;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AM")) & 1) != 0)
        {
          v14 = 6;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AR")) & 1) != 0)
        {
          v14 = 7;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AN")) & 1) != 0)
        {
          v14 = 8;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HY")) & 1) != 0)
        {
          v14 = 9;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AS")) & 1) != 0)
        {
          v14 = 10;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AV")) & 1) != 0)
        {
          v14 = 11;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AE")) & 1) != 0)
        {
          v14 = 12;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AY")) & 1) != 0)
        {
          v14 = 13;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("AZ")) & 1) != 0)
        {
          v14 = 14;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BM")) & 1) != 0)
        {
          v14 = 15;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BA")) & 1) != 0)
        {
          v14 = 16;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("EU")) & 1) != 0)
        {
          v14 = 17;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BE")) & 1) != 0)
        {
          v14 = 18;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BN")) & 1) != 0)
        {
          v14 = 19;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BI")) & 1) != 0)
        {
          v14 = 20;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BS")) & 1) != 0)
        {
          v14 = 21;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BR")) & 1) != 0)
        {
          v14 = 22;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BG")) & 1) != 0)
        {
          v14 = 23;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MY")) & 1) != 0)
        {
          v14 = 24;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CA")) & 1) != 0)
        {
          v14 = 25;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CH")) & 1) != 0)
        {
          v14 = 26;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CE")) & 1) != 0)
        {
          v14 = 27;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NY")) & 1) != 0)
        {
          v14 = 28;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ZH")) & 1) != 0)
        {
          v14 = 29;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CV")) & 1) != 0)
        {
          v14 = 30;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KW")) & 1) != 0)
        {
          v14 = 31;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CO")) & 1) != 0)
        {
          v14 = 32;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CR")) & 1) != 0)
        {
          v14 = 33;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HR")) & 1) != 0)
        {
          v14 = 34;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CS")) & 1) != 0)
        {
          v14 = 35;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DA")) & 1) != 0)
        {
          v14 = 36;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DV")) & 1) != 0)
        {
          v14 = 37;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NL")) & 1) != 0)
        {
          v14 = 38;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DZ")) & 1) != 0)
        {
          v14 = 39;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("EN")) & 1) != 0)
        {
          v14 = 40;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("EO")) & 1) != 0)
        {
          v14 = 41;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ET")) & 1) != 0)
        {
          v14 = 42;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("EE")) & 1) != 0)
        {
          v14 = 43;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FO")) & 1) != 0)
        {
          v14 = 44;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FJ")) & 1) != 0)
        {
          v14 = 45;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FI")) & 1) != 0)
        {
          v14 = 46;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FR")) & 1) != 0)
        {
          v14 = 47;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FF")) & 1) != 0)
        {
          v14 = 48;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("GL")) & 1) != 0)
        {
          v14 = 49;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KA")) & 1) != 0)
        {
          v14 = 50;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DE")) & 1) != 0)
        {
          v14 = 51;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("EL")) & 1) != 0)
        {
          v14 = 52;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("GN")) & 1) != 0)
        {
          v14 = 53;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("GU")) & 1) != 0)
        {
          v14 = 54;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HT")) & 1) != 0)
        {
          v14 = 55;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HA")) & 1) != 0)
        {
          v14 = 56;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HE")) & 1) != 0)
        {
          v14 = 57;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HZ")) & 1) != 0)
        {
          v14 = 58;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HI")) & 1) != 0)
        {
          v14 = 59;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HO")) & 1) != 0)
        {
          v14 = 60;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("HU")) & 1) != 0)
        {
          v14 = 61;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IA")) & 1) != 0)
        {
          v14 = 62;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ID")) & 1) != 0)
        {
          v14 = 63;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IE")) & 1) != 0)
        {
          v14 = 64;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("GA")) & 1) != 0)
        {
          v14 = 65;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IG")) & 1) != 0)
        {
          v14 = 66;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IK")) & 1) != 0)
        {
          v14 = 67;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IO")) & 1) != 0)
        {
          v14 = 68;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IS")) & 1) != 0)
        {
          v14 = 69;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IT")) & 1) != 0)
        {
          v14 = 70;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("IU")) & 1) != 0)
        {
          v14 = 71;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("JA")) & 1) != 0)
        {
          v14 = 72;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("JV")) & 1) != 0)
        {
          v14 = 73;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KL")) & 1) != 0)
        {
          v14 = 74;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KN")) & 1) != 0)
        {
          v14 = 75;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KR")) & 1) != 0)
        {
          v14 = 76;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KS")) & 1) != 0)
        {
          v14 = 77;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KK")) & 1) != 0)
        {
          v14 = 78;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KM")) & 1) != 0)
        {
          v14 = 79;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KI")) & 1) != 0)
        {
          v14 = 80;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RW")) & 1) != 0)
        {
          v14 = 81;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KY")) & 1) != 0)
        {
          v14 = 82;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KV")) & 1) != 0)
        {
          v14 = 83;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KG")) & 1) != 0)
        {
          v14 = 84;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KO")) & 1) != 0)
        {
          v14 = 85;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KU")) & 1) != 0)
        {
          v14 = 86;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("KJ")) & 1) != 0)
        {
          v14 = 87;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LA")) & 1) != 0)
        {
          v14 = 88;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LB")) & 1) != 0)
        {
          v14 = 89;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LG")) & 1) != 0)
        {
          v14 = 90;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LI")) & 1) != 0)
        {
          v14 = 91;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LN")) & 1) != 0)
        {
          v14 = 92;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LO")) & 1) != 0)
        {
          v14 = 93;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LT")) & 1) != 0)
        {
          v14 = 94;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LU")) & 1) != 0)
        {
          v14 = 95;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("LV")) & 1) != 0)
        {
          v14 = 96;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("GV")) & 1) != 0)
        {
          v14 = 97;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MK")) & 1) != 0)
        {
          v14 = 98;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MG")) & 1) != 0)
        {
          v14 = 99;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MS")) & 1) != 0)
        {
          v14 = 100;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ML")) & 1) != 0)
        {
          v14 = 101;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MT")) & 1) != 0)
        {
          v14 = 102;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MI")) & 1) != 0)
        {
          v14 = 103;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MR")) & 1) != 0)
        {
          v14 = 104;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MH")) & 1) != 0)
        {
          v14 = 105;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("MN")) & 1) != 0)
        {
          v14 = 106;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NA")) & 1) != 0)
        {
          v14 = 107;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NV")) & 1) != 0)
        {
          v14 = 108;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ND")) & 1) != 0)
        {
          v14 = 109;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NE")) & 1) != 0)
        {
          v14 = 110;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NG")) & 1) != 0)
        {
          v14 = 111;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NB")) & 1) != 0)
        {
          v14 = 112;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NN")) & 1) != 0)
        {
          v14 = 113;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NO")) & 1) != 0)
        {
          v14 = 114;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("II")) & 1) != 0)
        {
          v14 = 115;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NR")) & 1) != 0)
        {
          v14 = 116;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("OC")) & 1) != 0)
        {
          v14 = 117;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("OJ")) & 1) != 0)
        {
          v14 = 118;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CU")) & 1) != 0)
        {
          v14 = 119;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("OM")) & 1) != 0)
        {
          v14 = 120;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("OR")) & 1) != 0)
        {
          v14 = 121;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("OS")) & 1) != 0)
        {
          v14 = 122;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PA")) & 1) != 0)
        {
          v14 = 123;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PI")) & 1) != 0)
        {
          v14 = 124;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FA")) & 1) != 0)
        {
          v14 = 125;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PL")) & 1) != 0)
        {
          v14 = 126;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PS")) & 1) != 0)
        {
          v14 = 127;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PT")) & 1) != 0)
        {
          v14 = 128;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("QU")) & 1) != 0)
        {
          v14 = 129;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RM")) & 1) != 0)
        {
          v14 = 130;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RN")) & 1) != 0)
        {
          v14 = 131;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RO")) & 1) != 0)
        {
          v14 = 132;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RU")) & 1) != 0)
        {
          v14 = 133;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SA")) & 1) != 0)
        {
          v14 = 134;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SC")) & 1) != 0)
        {
          v14 = 135;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SD")) & 1) != 0)
        {
          v14 = 136;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SE")) & 1) != 0)
        {
          v14 = 137;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SM")) & 1) != 0)
        {
          v14 = 138;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SG")) & 1) != 0)
        {
          v14 = 139;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SR")) & 1) != 0)
        {
          v14 = 140;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("GD")) & 1) != 0)
        {
          v14 = 141;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SN")) & 1) != 0)
        {
          v14 = 142;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SI")) & 1) != 0)
        {
          v14 = 143;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SK")) & 1) != 0)
        {
          v14 = 144;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SL")) & 1) != 0)
        {
          v14 = 145;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SO")) & 1) != 0)
        {
          v14 = 146;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ST")) & 1) != 0)
        {
          v14 = 147;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ES")) & 1) != 0)
        {
          v14 = 148;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SU")) & 1) != 0)
        {
          v14 = 149;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SW")) & 1) != 0)
        {
          v14 = 150;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SS")) & 1) != 0)
        {
          v14 = 151;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("SV")) & 1) != 0)
        {
          v14 = 152;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TA")) & 1) != 0)
        {
          v14 = 153;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TE")) & 1) != 0)
        {
          v14 = 154;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TG")) & 1) != 0)
        {
          v14 = 155;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TH")) & 1) != 0)
        {
          v14 = 156;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TI")) & 1) != 0)
        {
          v14 = 157;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BO")) & 1) != 0)
        {
          v14 = 158;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TK")) & 1) != 0)
        {
          v14 = 159;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TL")) & 1) != 0)
        {
          v14 = 160;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TN")) & 1) != 0)
        {
          v14 = 161;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TO")) & 1) != 0)
        {
          v14 = 162;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TR")) & 1) != 0)
        {
          v14 = 163;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TS")) & 1) != 0)
        {
          v14 = 164;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TT")) & 1) != 0)
        {
          v14 = 165;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TW")) & 1) != 0)
        {
          v14 = 166;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("TY")) & 1) != 0)
        {
          v14 = 167;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UG")) & 1) != 0)
        {
          v14 = 168;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UK")) & 1) != 0)
        {
          v14 = 169;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UR")) & 1) != 0)
        {
          v14 = 170;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UZ")) & 1) != 0)
        {
          v14 = 171;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VE")) & 1) != 0)
        {
          v14 = 172;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VI")) & 1) != 0)
        {
          v14 = 173;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VO")) & 1) != 0)
        {
          v14 = 174;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WA")) & 1) != 0)
        {
          v14 = 175;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CY")) & 1) != 0)
        {
          v14 = 176;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WO")) & 1) != 0)
        {
          v14 = 177;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("FY")) & 1) != 0)
        {
          v14 = 178;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("XH")) & 1) != 0)
        {
          v14 = 179;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("YI")) & 1) != 0)
        {
          v14 = 180;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("YO")) & 1) != 0)
        {
          v14 = 181;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ZA")) & 1) != 0)
        {
          v14 = 182;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ZU")) & 1) != 0)
        {
          v14 = 183;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("WUU")) & 1) != 0)
        {
          v14 = 184;
        }
        else if (objc_msgSend(v13, "isEqualToString:", CFSTR("YUE")))
        {
          v14 = 185;
        }
        else
        {
          v14 = 0;
        }

        v16 = objc_opt_self();
        if (v11[2] >= 3uLL)
        {
          v17 = (void *)v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v18 = (void *)sub_23A2A3A64();
          swift_bridgeObjectRelease();
          v2 = objc_msgSend(v17, sel_convertCountryCodeToSchemaCountryCode_, v18);

          goto LABEL_758;
        }
        __break(1u);
        goto LABEL_754;
      }
      swift_bridgeObjectRelease();
    }
    else if (sub_23A2A3AB8() == 2)
    {
      sub_23A2A3AA0();
      v15 = (void *)sub_23A2A3A64();
      swift_bridgeObjectRelease();
      v11 = v15;
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ISOLANGUAGECODE_UNKNOWN")) & 1) != 0)
      {
        v14 = 0;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AB")) & 1) != 0)
      {
        v14 = 1;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AA")) & 1) != 0)
      {
        v14 = 2;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AF")) & 1) != 0)
      {
        v14 = 3;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AK")) & 1) != 0)
      {
        v14 = 4;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SQ")) & 1) != 0)
      {
        v14 = 5;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AM")) & 1) != 0)
      {
        v14 = 6;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AR")) & 1) != 0)
      {
        v14 = 7;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AN")) & 1) != 0)
      {
        v14 = 8;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HY")) & 1) != 0)
      {
        v14 = 9;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AS")) & 1) != 0)
      {
        v14 = 10;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AV")) & 1) != 0)
      {
        v14 = 11;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AE")) & 1) != 0)
      {
        v14 = 12;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AY")) & 1) != 0)
      {
        v14 = 13;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("AZ")) & 1) != 0)
      {
        v14 = 14;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BM")) & 1) != 0)
      {
        v14 = 15;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BA")) & 1) != 0)
      {
        v14 = 16;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("EU")) & 1) != 0)
      {
        v14 = 17;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BE")) & 1) != 0)
      {
        v14 = 18;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BN")) & 1) != 0)
      {
        v14 = 19;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BI")) & 1) != 0)
      {
        v14 = 20;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BS")) & 1) != 0)
      {
        v14 = 21;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BR")) & 1) != 0)
      {
        v14 = 22;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BG")) & 1) != 0)
      {
        v14 = 23;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MY")) & 1) != 0)
      {
        v14 = 24;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CA")) & 1) != 0)
      {
        v14 = 25;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CH")) & 1) != 0)
      {
        v14 = 26;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CE")) & 1) != 0)
      {
        v14 = 27;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NY")) & 1) != 0)
      {
        v14 = 28;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ZH")) & 1) != 0)
      {
        v14 = 29;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CV")) & 1) != 0)
      {
        v14 = 30;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KW")) & 1) != 0)
      {
        v14 = 31;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CO")) & 1) != 0)
      {
        v14 = 32;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CR")) & 1) != 0)
      {
        v14 = 33;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HR")) & 1) != 0)
      {
        v14 = 34;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CS")) & 1) != 0)
      {
        v14 = 35;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("DA")) & 1) != 0)
      {
        v14 = 36;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("DV")) & 1) != 0)
      {
        v14 = 37;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NL")) & 1) != 0)
      {
        v14 = 38;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("DZ")) & 1) != 0)
      {
        v14 = 39;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("EN")) & 1) != 0)
      {
        v14 = 40;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("EO")) & 1) != 0)
      {
        v14 = 41;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ET")) & 1) != 0)
      {
        v14 = 42;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("EE")) & 1) != 0)
      {
        v14 = 43;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FO")) & 1) != 0)
      {
        v14 = 44;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FJ")) & 1) != 0)
      {
        v14 = 45;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FI")) & 1) != 0)
      {
        v14 = 46;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FR")) & 1) != 0)
      {
        v14 = 47;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FF")) & 1) != 0)
      {
        v14 = 48;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GL")) & 1) != 0)
      {
        v14 = 49;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KA")) & 1) != 0)
      {
        v14 = 50;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("DE")) & 1) != 0)
      {
        v14 = 51;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("EL")) & 1) != 0)
      {
        v14 = 52;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GN")) & 1) != 0)
      {
        v14 = 53;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GU")) & 1) != 0)
      {
        v14 = 54;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HT")) & 1) != 0)
      {
        v14 = 55;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HA")) & 1) != 0)
      {
        v14 = 56;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HE")) & 1) != 0)
      {
        v14 = 57;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HZ")) & 1) != 0)
      {
        v14 = 58;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HI")) & 1) != 0)
      {
        v14 = 59;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HO")) & 1) != 0)
      {
        v14 = 60;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HU")) & 1) != 0)
      {
        v14 = 61;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IA")) & 1) != 0)
      {
        v14 = 62;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ID")) & 1) != 0)
      {
        v14 = 63;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IE")) & 1) != 0)
      {
        v14 = 64;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GA")) & 1) != 0)
      {
        v14 = 65;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IG")) & 1) != 0)
      {
        v14 = 66;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IK")) & 1) != 0)
      {
        v14 = 67;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IO")) & 1) != 0)
      {
        v14 = 68;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IS")) & 1) != 0)
      {
        v14 = 69;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IT")) & 1) != 0)
      {
        v14 = 70;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IU")) & 1) != 0)
      {
        v14 = 71;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("JA")) & 1) != 0)
      {
        v14 = 72;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("JV")) & 1) != 0)
      {
        v14 = 73;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KL")) & 1) != 0)
      {
        v14 = 74;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KN")) & 1) != 0)
      {
        v14 = 75;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KR")) & 1) != 0)
      {
        v14 = 76;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KS")) & 1) != 0)
      {
        v14 = 77;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KK")) & 1) != 0)
      {
        v14 = 78;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KM")) & 1) != 0)
      {
        v14 = 79;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KI")) & 1) != 0)
      {
        v14 = 80;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RW")) & 1) != 0)
      {
        v14 = 81;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KY")) & 1) != 0)
      {
        v14 = 82;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KV")) & 1) != 0)
      {
        v14 = 83;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KG")) & 1) != 0)
      {
        v14 = 84;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KO")) & 1) != 0)
      {
        v14 = 85;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KU")) & 1) != 0)
      {
        v14 = 86;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("KJ")) & 1) != 0)
      {
        v14 = 87;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LA")) & 1) != 0)
      {
        v14 = 88;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LB")) & 1) != 0)
      {
        v14 = 89;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LG")) & 1) != 0)
      {
        v14 = 90;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LI")) & 1) != 0)
      {
        v14 = 91;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LN")) & 1) != 0)
      {
        v14 = 92;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LO")) & 1) != 0)
      {
        v14 = 93;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LT")) & 1) != 0)
      {
        v14 = 94;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LU")) & 1) != 0)
      {
        v14 = 95;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("LV")) & 1) != 0)
      {
        v14 = 96;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GV")) & 1) != 0)
      {
        v14 = 97;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MK")) & 1) != 0)
      {
        v14 = 98;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MG")) & 1) != 0)
      {
        v14 = 99;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MS")) & 1) != 0)
      {
        v14 = 100;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ML")) & 1) != 0)
      {
        v14 = 101;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MT")) & 1) != 0)
      {
        v14 = 102;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MI")) & 1) != 0)
      {
        v14 = 103;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MR")) & 1) != 0)
      {
        v14 = 104;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MH")) & 1) != 0)
      {
        v14 = 105;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("MN")) & 1) != 0)
      {
        v14 = 106;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NA")) & 1) != 0)
      {
        v14 = 107;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NV")) & 1) != 0)
      {
        v14 = 108;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ND")) & 1) != 0)
      {
        v14 = 109;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NE")) & 1) != 0)
      {
        v14 = 110;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NG")) & 1) != 0)
      {
        v14 = 111;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NB")) & 1) != 0)
      {
        v14 = 112;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NN")) & 1) != 0)
      {
        v14 = 113;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NO")) & 1) != 0)
      {
        v14 = 114;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("II")) & 1) != 0)
      {
        v14 = 115;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("NR")) & 1) != 0)
      {
        v14 = 116;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("OC")) & 1) != 0)
      {
        v14 = 117;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("OJ")) & 1) != 0)
      {
        v14 = 118;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CU")) & 1) != 0)
      {
        v14 = 119;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("OM")) & 1) != 0)
      {
        v14 = 120;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("OR")) & 1) != 0)
      {
        v14 = 121;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("OS")) & 1) != 0)
      {
        v14 = 122;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PA")) & 1) != 0)
      {
        v14 = 123;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PI")) & 1) != 0)
      {
        v14 = 124;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FA")) & 1) != 0)
      {
        v14 = 125;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PL")) & 1) != 0)
      {
        v14 = 126;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PS")) & 1) != 0)
      {
        v14 = 127;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("PT")) & 1) != 0)
      {
        v14 = 128;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("QU")) & 1) != 0)
      {
        v14 = 129;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RM")) & 1) != 0)
      {
        v14 = 130;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RN")) & 1) != 0)
      {
        v14 = 131;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RO")) & 1) != 0)
      {
        v14 = 132;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RU")) & 1) != 0)
      {
        v14 = 133;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SA")) & 1) != 0)
      {
        v14 = 134;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SC")) & 1) != 0)
      {
        v14 = 135;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SD")) & 1) != 0)
      {
        v14 = 136;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SE")) & 1) != 0)
      {
        v14 = 137;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SM")) & 1) != 0)
      {
        v14 = 138;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SG")) & 1) != 0)
      {
        v14 = 139;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SR")) & 1) != 0)
      {
        v14 = 140;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("GD")) & 1) != 0)
      {
        v14 = 141;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SN")) & 1) != 0)
      {
        v14 = 142;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SI")) & 1) != 0)
      {
        v14 = 143;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SK")) & 1) != 0)
      {
        v14 = 144;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SL")) & 1) != 0)
      {
        v14 = 145;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SO")) & 1) != 0)
      {
        v14 = 146;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ST")) & 1) != 0)
      {
        v14 = 147;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ES")) & 1) != 0)
      {
        v14 = 148;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SU")) & 1) != 0)
      {
        v14 = 149;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SW")) & 1) != 0)
      {
        v14 = 150;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SS")) & 1) != 0)
      {
        v14 = 151;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SV")) & 1) != 0)
      {
        v14 = 152;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TA")) & 1) != 0)
      {
        v14 = 153;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TE")) & 1) != 0)
      {
        v14 = 154;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TG")) & 1) != 0)
      {
        v14 = 155;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TH")) & 1) != 0)
      {
        v14 = 156;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TI")) & 1) != 0)
      {
        v14 = 157;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BO")) & 1) != 0)
      {
        v14 = 158;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TK")) & 1) != 0)
      {
        v14 = 159;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TL")) & 1) != 0)
      {
        v14 = 160;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TN")) & 1) != 0)
      {
        v14 = 161;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TO")) & 1) != 0)
      {
        v14 = 162;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TR")) & 1) != 0)
      {
        v14 = 163;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TS")) & 1) != 0)
      {
        v14 = 164;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TT")) & 1) != 0)
      {
        v14 = 165;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TW")) & 1) != 0)
      {
        v14 = 166;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TY")) & 1) != 0)
      {
        v14 = 167;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UG")) & 1) != 0)
      {
        v14 = 168;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UK")) & 1) != 0)
      {
        v14 = 169;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UR")) & 1) != 0)
      {
        v14 = 170;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UZ")) & 1) != 0)
      {
        v14 = 171;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VE")) & 1) != 0)
      {
        v14 = 172;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VI")) & 1) != 0)
      {
        v14 = 173;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("VO")) & 1) != 0)
      {
        v14 = 174;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WA")) & 1) != 0)
      {
        v14 = 175;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CY")) & 1) != 0)
      {
        v14 = 176;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WO")) & 1) != 0)
      {
        v14 = 177;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("FY")) & 1) != 0)
      {
        v14 = 178;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("XH")) & 1) != 0)
      {
        v14 = 179;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("YI")) & 1) != 0)
      {
        v14 = 180;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("YO")) & 1) != 0)
      {
        v14 = 181;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ZA")) & 1) != 0)
      {
        v14 = 182;
      }
      else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ZU")) & 1) != 0)
      {
        v14 = 183;
      }
      else
      {
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WUU")) & 1) == 0)
        {
LABEL_754:
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("YUE")))
            v14 = 185;
          else
            v14 = 0;
          goto LABEL_757;
        }
        v14 = 184;
      }
LABEL_757:

      v2 = 0;
      goto LABEL_758;
    }
    v2 = 0;
    v14 = 0;
  }
  else
  {
    v14 = 0;
  }
LABEL_758:
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B18]), sel_init);
  objc_msgSend(v19, sel_setLanguageCode_, v14);
  objc_msgSend(v19, sel_setCountryCode_, v2);
  return v19;
}

void *sub_23A286718(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  unsigned int v19;
  unsigned int v20;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(void **)(a1 + 24);
  v3 = *(char *)(a1 + 64);
  v20 = *(_DWORD *)(a1 + 68);
  v4 = *(_DWORD *)(a1 + 80);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955C8]), sel_init);
  if (v5)
  {
    v6 = v5;
    v19 = v4;
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955F8]), sel_init);
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955A8]), sel_init);
      if (v9)
      {
        v10 = v9;
        v11 = _s11DeepThought20SELFMessageConverterO30convertLocaleStringToISOLocale6localeSo08SISchemaI0CSgSSSg_tFZ_0(v1, v2);
        -[NSObject setSiriInputLocale:](v10, sel_setSiriInputLocale_, v11);

        -[NSObject setTaskType:](v10, sel_setTaskType_, dword_23A2A4628[v3]);
        v12 = (id)sub_23A2A3A64();
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_UNKNOWN")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_COMPACT")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_TV")) & 1) != 0)
        {
          v13 = 2;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_BLUETOOTH_CAR")) & 1) != 0)
        {
          v13 = 3;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_EYES_FREE")) & 1) != 0)
        {
          v13 = 4;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_CARPLAY")) & 1) != 0)
        {
          v13 = 5;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_VOX")) & 1) != 0)
        {
          v13 = 6;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("ODMSIRIUIVIEWMODE_NOT_APPLICABLE")))
        {
          v13 = 7;
        }
        else
        {
          v13 = 0;
        }

        -[NSObject setViewMode:](v10, sel_setViewMode_, v13);
        v16 = (id)sub_23A2A3A64();
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_UNKNOWN")) & 1) != 0)
        {
          v17 = 0;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_DEVICE")) & 1) != 0)
        {
          v17 = 1;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_BLUETOOTH")) & 1) != 0)
        {
          v17 = 3;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH")) & 1) != 0)
        {
          v17 = 4;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_WIRED")) & 1) != 0)
        {
          v17 = 5;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_WIRED")) & 1) != 0)
        {
          v17 = 6;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_CARPLAY")) & 1) != 0)
        {
          v17 = 7;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_BLUETOOTH_DO_AP_DEVICE")) & 1) != 0)
        {
          v17 = 8;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_DO_AP_DEVICE")) & 1) != 0)
        {
          v17 = 9;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_APPLE_BLUETOOTH_HANDS_FREE_DEVICE")) & 1) != 0)
        {
          v17 = 10;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_HANDS_FREE_DEVICE")) & 1) != 0)
        {
          v17 = 11;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_USB_AUDIO")) & 1) != 0)
        {
          v17 = 12;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_SIRI_ACCESSORY")) & 1) != 0)
        {
          v17 = 13;
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_AUDIO_INJECTION")) & 1) != 0)
        {
          v17 = 14;
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("AUDIOINPUTROUTE_DARWIN")))
        {
          v17 = 15;
        }
        else
        {
          v17 = 0;
        }

        -[NSObject setAudioInterface:](v10, sel_setAudioInterface_, v17);
        objc_msgSend(v8, sel_setCompletedSiriTaskCount_, v20);
        objc_msgSend(v8, sel_setCompletedUITaskCount_, v19);
        objc_msgSend(v6, sel_setTaskCounts_, v8);
        objc_msgSend(v6, sel_setDimensions_, v10);

        goto LABEL_59;
      }

    }
    else
    {
      v8 = v6;
    }

  }
  v10 = sub_23A2A39EC();
  v14 = sub_23A2A3B90();
  if (os_log_type_enabled(v10, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23A27E000, v10, v14, "Unable to create ODMSiriSchemaODMSiriCounts SELF message", v15, 2u);
    MEMORY[0x23B847BB8](v15, -1, -1);
  }
  v6 = 0;
LABEL_59:

  return v6;
}

void *_s11DeepThought20SELFMessageConverterO27convertToODMSiriClientEvent19aggregationInterval6counts5odmId6loggerSo0g6SchemaghI0CSgAA011AggregationK0V_SayAA14CountsReportedVG10Foundation4UUIDV2os6LoggerVtFZ_0(double *a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v16;
  uint64_t v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  id v45;
  void *v46;
  id v47;
  char **v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  void (*v57)(char *, uint64_t);
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  __int128 v84;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B3C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A2A359C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B3D0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a2 + 16);
  if (v16)
  {
    v75 = v10;
    v76 = v9;
    v17 = *(unsigned int *)a1;
    v18 = a1[1];
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955C0]), sel_init);
    if (v19)
    {
      v20 = v19;
      v74 = a3;
      v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955E8]), sel_init);
      if (v21)
      {
        v22 = v21;
        v77 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955D8]), sel_init);
        if (v77)
        {
          v73 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE955B8]), sel_init);
          if (v73)
          {
            v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95610]), sel_init);
            if (v72)
            {
              v71 = v22;
              v23 = v73;
              objc_msgSend(v73, sel_setAggregationIntervalInDays_, v17);
              objc_msgSend(v23, sel_setAggregationIntervalStartTimestampInSecondsSince2001_, v18);
              objc_msgSend(v77, sel_setAggregationInterval_, v23);
              swift_bridgeObjectRetain();
              v24 = 0;
              do
              {
                v25 = *(_QWORD *)(a2 + v24 + 40);
                v26 = *(_OWORD *)(a2 + v24 + 48);
                v27 = *(_OWORD *)(a2 + v24 + 64);
                v28 = *(_QWORD *)(a2 + v24 + 80);
                v29 = *(_QWORD *)(a2 + v24 + 88);
                v30 = *(_BYTE *)(a2 + v24 + 96);
                LODWORD(v78) = *(_DWORD *)(a2 + v24 + 32);
                *((_QWORD *)&v78 + 1) = v25;
                v79 = v26;
                v80 = v27;
                v81 = v28;
                v82 = v29;
                v83 = v30;
                v84 = *(_OWORD *)(a2 + v24 + 100);
                v31 = sub_23A286718((uint64_t)&v78);
                if (v31)
                {
                  v32 = v31;
                  objc_msgSend(v77, sel_addSiriCounts_, v31);

                }
                v24 += 88;
                --v16;
              }
              while (v16);
              swift_bridgeObjectRelease();
              sub_23A2A368C();
              v37 = sub_23A2A36A4();
              v38 = *(_QWORD *)(v37 - 8);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v15, 1, v37) == 1)
              {
                sub_23A2874C8((uint64_t)v15, &qword_25695B3D0);
                v39 = 0;
                v40 = 0;
              }
              else
              {
                v43 = sub_23A2A3698();
                v44 = *(void (**)(char *, uint64_t))(v38 + 8);
                v40 = (void *)v43;
                v44(v15, v37);
                v45 = objc_msgSend(v40, sel_bmltTaskId);
                sub_23A2A3A70();

                v39 = (void *)sub_23A2A3A64();
                swift_bridgeObjectRelease();
              }
              v46 = v71;
              v47 = v72;
              objc_msgSend(v72, sel_setExperimentId_, v39);

              v48 = &selRef_setAggregationInterval_;
              if (v40)
              {
                v49 = objc_msgSend(v40, sel_treatmentId);
                if (v49)
                {
                  v50 = v49;
                  sub_23A2A3A70();

                  sub_23A2A356C();
                  swift_bridgeObjectRelease();
                  v51 = v75;
                  v52 = v76;
                  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v8, 1, v76) == 1)
                  {
                    sub_23A2874C8((uint64_t)v8, &qword_25695B3C8);
                    v53 = 0;
                    v47 = v72;
                    v48 = &selRef_setAggregationInterval_;
                  }
                  else
                  {
                    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v12, v8, v52);
                    v55 = objc_allocWithZone(MEMORY[0x24BE95C78]);
                    v56 = (void *)sub_23A2A3584();
                    v53 = objc_msgSend(v55, sel_initWithNSUUID_, v56);

                    v57 = *(void (**)(char *, uint64_t))(v51 + 8);
                    v48 = &selRef_setAggregationInterval_;
                    v57(v12, v52);
                    v47 = v72;
                  }
                }
                else
                {
                  v53 = 0;
                }
                objc_msgSend(v47, sel_setTreatmentId_, v53);
                v54 = (int)objc_msgSend(v40, sel_deploymentId);
              }
              else
              {
                objc_msgSend(v47, sel_setTreatmentId_, 0);
                v53 = 0;
                v54 = -1;
              }
              v58 = v40;
              objc_msgSend(v47, sel_setDeploymentId_, v54);
              v59 = objc_allocWithZone(MEMORY[0x24BE95C78]);
              v60 = (void *)sub_23A2A3584();
              v61 = objc_msgSend(v59, v48[4], v60);

              objc_msgSend(v46, sel_setOdmId_, v61);
              objc_msgSend(v46, sel_setTrialExperimentIdentifiers_, v47);
              v62 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
              v63 = objc_msgSend(v62, sel_infoDictionary);

              if (v63)
              {
                v64 = sub_23A2A3A1C();

                if (*(_QWORD *)(v64 + 16)
                  && (v65 = sub_23A291288(0xD00000000000001DLL, 0x800000023A2A92F0), (v66 & 1) != 0))
                {
                  sub_23A28748C(*(_QWORD *)(v64 + 56) + 32 * v65, (uint64_t)&v78);
                }
                else
                {
                  v78 = 0u;
                  v79 = 0u;
                }
                swift_bridgeObjectRelease();
                if (*((_QWORD *)&v79 + 1))
                {
                  if ((swift_dynamicCast() & 1) != 0)
                  {
                    v67 = (void *)sub_23A2A3A64();
                    swift_bridgeObjectRelease();
                    v68 = v73;
LABEL_45:
                    objc_msgSend(v46, sel_setPluginVersion_, v67);

                    objc_msgSend(v20, sel_setEventMetadata_, v46);
                    v69 = v77;
                    objc_msgSend(v20, sel_setCountsReported_, v69);

                    return v20;
                  }
LABEL_44:
                  v68 = v73;
                  v67 = 0;
                  goto LABEL_45;
                }
              }
              else
              {
                v78 = 0u;
                v79 = 0u;
              }
              sub_23A2874C8((uint64_t)&v78, &qword_25695B3D8);
              goto LABEL_44;
            }

            v20 = v22;
            v22 = v77;
            v41 = v73;
          }
          else
          {
            v41 = v77;
          }

          v20 = v22;
          v22 = v41;
        }

        v20 = v22;
      }

    }
    v33 = sub_23A2A39EC();
    v34 = sub_23A2A3B90();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      v36 = "Unable to create ODMSiriSchemaODMSiriClientEvent SELF message";
      goto LABEL_22;
    }
  }
  else
  {
    v33 = sub_23A2A39EC();
    v34 = sub_23A2A3B78();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      v36 = "no aggregations to report";
LABEL_22:
      _os_log_impl(&dword_23A27E000, v33, v34, v36, v35, 2u);
      MEMORY[0x23B847BB8](v35, -1, -1);
    }
  }

  return 0;
}

uint64_t sub_23A287358()
{
  return type metadata accessor for SiriPenetrationRateSELFReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateSELFReporter()
{
  uint64_t result;

  result = qword_25695B310;
  if (!qword_25695B310)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A28739C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A2A359C();
  if (v1 <= 0x3F)
  {
    result = sub_23A2A3A04();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateSELFReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPenetrationRateSELFReporter.__allocating_init(_:odmId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for SELFMessageConverter()
{
  return &type metadata for SELFMessageConverter;
}

unint64_t sub_23A287448()
{
  unint64_t result;

  result = qword_25695B3B8;
  if (!qword_25695B3B8)
  {
    result = MEMORY[0x23B847B10](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25695B3B8);
  }
  return result;
}

uint64_t sub_23A28748C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23A2874C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t StreamBookmarkService.__allocating_init(bookmarkName:bookmarkFilename:bookmarkPath:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;

  v24 = a2;
  v21 = a4;
  v22 = a6;
  v23 = a1;
  v7 = sub_23A2A3A04();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A2A3518();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A2A3914();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v26 = a5;
  v16(v14, a5, v11);
  v17 = v22;
  v18 = sub_23A2A3908();
  v25[3] = v15;
  v25[4] = MEMORY[0x24BE2BC40];
  v25[0] = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
  type metadata accessor for StreamBookmarkService();
  v19 = swift_allocObject();
  StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(v25, v23, v24, (uint64_t)v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v17, v7);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v26, v11);
  return v19;
}

uint64_t StreamBookmarkService.__allocating_init(bookmarkStore:bookmarkName:logger:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(a1, a2, a3, a4);
  return v8;
}

uint64_t type metadata accessor for StreamBookmarkService()
{
  uint64_t result;

  result = qword_25695B418;
  if (!qword_25695B418)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = v4;
  sub_23A287A24((uint64_t)a1, v5 + 24);
  *(_QWORD *)(v5 + 64) = a2;
  *(_QWORD *)(v5 + 72) = a3;
  v10 = v5 + OBJC_IVAR____TtC11DeepThought21StreamBookmarkService_logger;
  v11 = sub_23A2A3A04();
  v12 = *(_QWORD *)(v11 - 8);
  v31 = a4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, a4, v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_bridgeObjectRetain();
  v13 = sub_23A2A389C();
  if (v29)
  {
    swift_bridgeObjectRelease();
    v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v14(v31, v11);
    __swift_destroy_boxed_opaque_existential_1(v5 + 24);
    swift_bridgeObjectRelease();
    v14(v10, v11);
    type metadata accessor for StreamBookmarkService();
    swift_deallocPartialClassInstance();
    v15 = (uint64_t)a1;
  }
  else
  {
    v16 = v13;
    v27 = v12;
    v28 = v11;
    v17 = v5;
    v30 = a1;
    if (v13)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23A2A386C();
      v16 = sub_23A2A3860();
    }
    *(_QWORD *)(v5 + 16) = v16;
    swift_retain_n();
    v18 = sub_23A2A39EC();
    v19 = sub_23A2A3B84();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      *(_DWORD *)v20 = 136315138;
      v32 = v21;
      v22 = objc_msgSend(*(id *)(v5 + 16), sel_debugDescription);
      v23 = sub_23A2A3A70();
      v25 = v24;

      v5 = v17;
      sub_23A288988(v23, v25, &v32);
      sub_23A2A3BA8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A27E000, v18, v19, "marker: fetched bookmark: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B847BB8](v21, -1, -1);
      MEMORY[0x23B847BB8](v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v31, v28);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(a4, v28);
    }
    v15 = (uint64_t)v30;
  }
  __swift_destroy_boxed_opaque_existential_1(v15);
  return v5;
}

uint64_t sub_23A287A24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id sub_23A287A8C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  v3 = v1;
  if ((a1 & 1) != 0)
  {
    sub_23A287A24(v1 + 24, (uint64_t)v9);
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    v4 = sub_23A2A389C();
    if (v2)
      return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    v7 = v4;
    if (!v4)
    {
      sub_23A2A386C();
      swift_bridgeObjectRetain();
      v7 = sub_23A2A3860();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    v8 = *(void **)(v3 + 16);
    v6 = (id *)(v3 + 16);
    *v6 = (id)v7;

  }
  else
  {
    v6 = (id *)(v1 + 16);
  }
  return *v6;
}

uint64_t sub_23A287B74()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = v0;
  return swift_task_switch();
}

uint64_t sub_23A287B8C()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;

  v1 = v0[12];
  sub_23A287A24(v1 + 24, (uint64_t)(v0 + 2));
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v2 = *(id *)(v1 + 16);
  sub_23A2A38A8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  sub_23A287A24(v1 + 24, (uint64_t)(v0 + 7));
  __swift_project_boxed_opaque_existential_1(v0 + 7, v0[10]);
  v3 = (_QWORD *)swift_task_alloc();
  v0[13] = v3;
  *v3 = v0;
  v3[1] = sub_23A287CA4;
  return sub_23A2A3890();
}

uint64_t sub_23A287CA4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A287CF8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A287D2C()
{
  uint64_t v0;
  id v1;
  char v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A2A3854();

  return v2 & 1;
}

uint64_t sub_23A287D78()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A2A383C();

  return v2;
}

uint64_t sub_23A287DC4()
{
  uint64_t v0;
  id v1;
  char v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A2A3848();

  return v2 & 1;
}

uint64_t sub_23A287E10(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A287EA0(a1, a2, a3, a4, (void (*)(uint64_t))MEMORY[0x24BE2BA88], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE2BA98], (uint64_t (*)(uint64_t))MEMORY[0x24BE2BCE8], "max look back set for stream=%ld,\nbookmark_date=%s, start_date=%s", "ERROR: Could not update bookmark for stream=%ld");
}

uint64_t sub_23A287E58(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A287EA0(a1, a2, a3, a4, MEMORY[0x24BE2BA78], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BE2BA90], MEMORY[0x24BE2BB08], "max look back set for stream=%ld,\nbookmark_date=%s,\nstart_date=%s", "Unable to update bookmark for stream=%ld");
}

uint64_t sub_23A287EA0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t (*a6)(uint64_t, uint64_t), uint64_t (*a7)(uint64_t), const char *a8, const char *a9)
{
  uint64_t v9;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
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
  char *v42;
  id v43;
  unint64_t v44;
  uint64_t result;
  void (*v46)(_QWORD);
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  unint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  id v71;
  char *v72;
  char *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  NSObject *v84;
  os_log_type_t v85;
  uint8_t *v86;
  uint64_t v87;
  const char *v88;
  uint64_t (*v89)(uint64_t);
  char *v90;
  char *v91;
  char *v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  void (*v96)(char *, char *, uint64_t);
  unsigned int v97;
  void (*v98)(unint64_t, _QWORD, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t (*v102)(char *, uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;

  v88 = a8;
  v89 = a7;
  v93 = a6;
  v120 = a3;
  v121 = a4;
  v116 = a2;
  v12 = sub_23A2A3500();
  v103 = *(_QWORD *)(v12 - 8);
  v104 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v105 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A2A3614();
  v112 = *(_QWORD *)(v14 - 8);
  v113 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v111 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23A2A3620();
  v109 = *(_QWORD *)(v16 - 8);
  v110 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v108 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23A2A35FC();
  v118 = *(_QWORD *)(v18 - 8);
  v119 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v106 = (char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_23A2A365C();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v92 = (char *)&v87 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v107 = (char *)&v87 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v87 - v29;
  v31 = sub_23A2A3560();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v91 = (char *)&v87 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v90 = (char *)&v87 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v117 = (char *)&v87 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v114 = (char *)&v87 - v40;
  MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v87 - v41;
  v94 = v9;
  v43 = *(id *)(v9 + 16);
  v95 = a1;
  a5(a1);

  v115 = v42;
  v44 = v116;
  result = sub_23A2A3524();
  if ((v44 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  v46 = *(void (**)(_QWORD))(v21 + 104);
  v97 = *MEMORY[0x24BDCF220];
  v98 = (void (*)(unint64_t, _QWORD, uint64_t))v46;
  v46(v23);
  sub_23A2A3638();
  v99 = v21;
  v47 = *(void (**)(char *, uint64_t))(v21 + 8);
  v100 = v20;
  v47(v23, v20);
  v102 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
  result = v102(v30, 1, v31);
  if ((_DWORD)result == 1)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v48 = v32;
  v49 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
  v101 = v31;
  v96 = v49;
  v49(v117, v30, v31);
  v50 = v106;
  (*(void (**)(char *, _QWORD, uint64_t))(v118 + 104))(v106, *MEMORY[0x24BDCF020], v119);
  v51 = v108;
  v52 = v109;
  v53 = v110;
  (*(void (**)(char *, _QWORD, uint64_t))(v109 + 104))(v108, *MEMORY[0x24BDCF0B0], v110);
  v55 = v111;
  v54 = v112;
  v56 = v113;
  (*(void (**)(char *, _QWORD, uint64_t))(v112 + 104))(v111, *MEMORY[0x24BDCF068], v113);
  v57 = v107;
  sub_23A2A362C();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v53);
  (*(void (**)(char *, uint64_t))(v118 + 8))(v50, v119);
  v58 = v101;
  result = v102(v57, 1, v101);
  if ((_DWORD)result == 1)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v59 = v114;
  v96(v114, v57, v58);
  v60 = v48;
  v61 = *(void (**)(char *, uint64_t))(v48 + 8);
  v61(v117, v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2B0);
  v62 = (*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80);
  v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_23A2A45A0;
  v98(v63 + v62, v97, v100);
  sub_23A282ABC(v63);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v64 = v105;
  v65 = v115;
  sub_23A2A3608();
  swift_bridgeObjectRelease();
  result = sub_23A2A34F4();
  if ((v66 & 1) == 0)
  {
    v67 = result;
    (*(void (**)(char *, uint64_t))(v103 + 8))(v64, v104);
    if (v67 >= 1 && v67 > v116)
    {
      v68 = v60;
      v69 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
      v70 = (uint64_t)v92;
      v69(v92, v59, v58);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v68 + 56))(v70, 0, 1, v58);
      v71 = *(id *)(v94 + 16);
      LOBYTE(v68) = v93(v95, v70);

      sub_23A282DCC(v70);
      if ((v68 & 1) != 0)
      {
        v72 = v90;
        v69(v90, v65, v58);
        v73 = v91;
        v69(v91, v59, v58);
        v74 = sub_23A2A39EC();
        v75 = sub_23A2A3B84();
        if (os_log_type_enabled(v74, v75))
        {
          v76 = swift_slowAlloc();
          v121 = swift_slowAlloc();
          v123 = v121;
          *(_DWORD *)v76 = 134218498;
          v122 = v89(v95);
          sub_23A2A3BA8();
          *(_WORD *)(v76 + 12) = 2080;
          sub_23A282054();
          v77 = sub_23A2A3D4C();
          v122 = sub_23A288988(v77, v78, &v123);
          sub_23A2A3BA8();
          swift_bridgeObjectRelease();
          v61(v72, v58);
          *(_WORD *)(v76 + 22) = 2080;
          v79 = v91;
          v80 = sub_23A2A3D4C();
          v122 = sub_23A288988(v80, v81, &v123);
          sub_23A2A3BA8();
          swift_bridgeObjectRelease();
          v61(v79, v58);
          _os_log_impl(&dword_23A27E000, v74, v75, v88, (uint8_t *)v76, 0x20u);
          v82 = v121;
          swift_arrayDestroy();
          MEMORY[0x23B847BB8](v82, -1, -1);
          MEMORY[0x23B847BB8](v76, -1, -1);

          v61(v114, v58);
          v83 = v115;
          return ((uint64_t (*)(char *, uint64_t))v61)(v83, v58);
        }

        v61(v73, v58);
        v61(v72, v58);
      }
      else
      {
        v84 = sub_23A2A39EC();
        v85 = sub_23A2A3B90();
        if (os_log_type_enabled(v84, v85))
        {
          v86 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v86 = 134217984;
          v123 = v89(v95);
          sub_23A2A3BA8();
          _os_log_impl(&dword_23A27E000, v84, v85, a9, v86, 0xCu);
          MEMORY[0x23B847BB8](v86, -1, -1);
        }

      }
    }
    v61(v59, v58);
    v83 = v65;
    return ((uint64_t (*)(char *, uint64_t))v61)(v83, v58);
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t StreamBookmarkService.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC11DeepThought21StreamBookmarkService_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t StreamBookmarkService.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC11DeepThought21StreamBookmarkService_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A2888B4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23A2888C4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23A2888F8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23A288918(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23A288988(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23A2A3BA8();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23A288988(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A288A58(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A28748C((uint64_t)v12, *a3);
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
      sub_23A28748C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A288A58(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A2A3BB4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A288C10(a5, a6);
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
  v8 = sub_23A2A3C44();
  if (!v8)
  {
    sub_23A2A3C5C();
    __break(1u);
LABEL_17:
    result = sub_23A2A3CA4();
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

uint64_t sub_23A288C10(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A288CA4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A288E7C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A288E7C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A288CA4(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A288E18(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A2A3BFC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A2A3C5C();
      __break(1u);
LABEL_10:
      v2 = sub_23A2A3ADC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A2A3CA4();
    __break(1u);
LABEL_14:
    result = sub_23A2A3C5C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A288E18(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_25695B528);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A288E7C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_25695B528);
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
  result = sub_23A2A3CA4();
  __break(1u);
  return result;
}

_BYTE **sub_23A288FC8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_23A288FD8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_23A2A3CA4();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_23A28906C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_23A289094()
{
  return type metadata accessor for StreamBookmarkService();
}

uint64_t sub_23A28909C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for StreamBookmarkService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StreamBookmarkService.__allocating_init(bookmarkStore:bookmarkName:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of StreamBookmarkService.fetchPluginBookmark(reload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of StreamBookmarkService.storePluginBookmark()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 176) + *(_QWORD *)(*(_QWORD *)v0 + 176));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A2891C4;
  return v4();
}

uint64_t sub_23A2891C4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of StreamBookmarkService.updateTimeInterval(eventType:endTime:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of StreamBookmarkService.getTimeInterval(eventType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of StreamBookmarkService.updateTimeInterval(conversationType:endTime:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of StreamBookmarkService.updateLookbackTimeInterval(eventType:numOfDays:refDate:refCalendar:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of StreamBookmarkService.updateLookbackTimeInterval(conversationType:numOfDays:refDate:refCalendar:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t BiomeDonator.__allocating_init(biomeSource:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t BiomeDonator.init(biomeSource:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

id sub_23A2892A4(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_sendEvent_, a1);
}

id sub_23A2892B8(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_sendEvent_timestamp_, a1);
}

uint64_t BiomeDonator.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BiomeDonator.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_23A289310()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BiomeDonator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BiomeDonator);
}

uint64_t method lookup function for BiomeDonator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BiomeDonator.__allocating_init(biomeSource:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of BiomeDonator.donateEvent(event:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of BiomeDonator.donateEvent(event:timestamp:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B847AC8](a1, v6, a5);
}

void *sub_23A2893B8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B658);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A4710;
  sub_23A2A37E8();
  *(_QWORD *)(inited + 32) = sub_23A2A37DC();
  *(_QWORD *)(inited + 40) = v1;
  v2 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000013;
  *(_QWORD *)(inited + 56) = 0x800000023A2A9AF0;
  *(_QWORD *)(inited + 80) = sub_23A2A37A0();
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 120) = v2;
  *(_QWORD *)(inited + 96) = 0x736B736154646441;
  *(_QWORD *)(inited + 104) = 0xE800000000000000;
  *(_QWORD *)(inited + 128) = sub_23A2A37AC();
  *(_QWORD *)(inited + 136) = v4;
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = 0;
  result = (void *)sub_23A289E8C(inited);
  off_25695B5B0 = result;
  return result;
}

uint64_t static SetReminderPenetrationEventFilter.expectedAppIntentIntraEventFeatures.getter()
{
  return sub_23A28959C(&qword_25695B170);
}

void *sub_23A2894A8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B658);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A4710;
  sub_23A2A377C();
  *(_QWORD *)(inited + 32) = sub_23A2A3764();
  *(_QWORD *)(inited + 40) = v1;
  v2 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000013;
  *(_QWORD *)(inited + 56) = 0x800000023A2A9AF0;
  *(_QWORD *)(inited + 80) = sub_23A2A3758();
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 120) = v2;
  *(_QWORD *)(inited + 96) = 0xD000000000000023;
  *(_QWORD *)(inited + 104) = 0x800000023A2A9B10;
  *(_QWORD *)(inited + 128) = sub_23A2A3770();
  *(_QWORD *)(inited + 136) = v4;
  type metadata accessor for BMSiriExecutionTaskStep(0);
  *(_QWORD *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 7;
  result = (void *)sub_23A289E8C(inited);
  off_25695B5B8 = result;
  return result;
}

uint64_t static SetReminderPenetrationEventFilter.expectedSiriExecutionIntraEventFeatures.getter()
{
  return sub_23A28959C(&qword_25695B178);
}

uint64_t sub_23A28959C(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t SetReminderPenetrationEventFilter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SetReminderPenetrationEventFilter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

BOOL _s11DeepThought33SetReminderPenetrationEventFilterC12isAppUIEvent9appIntentSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  _BOOL8 result;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;

  sub_23A2A37E8();
  sub_23A2A37DC();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v0 = *((_QWORD *)&v34 + 1);
  v31 = v34;
  if (qword_25695B170 != -1)
    swift_once();
  v1 = off_25695B5B0;
  v2 = sub_23A2A37DC();
  if (v1[2] && (v4 = sub_23A291288(v2, v3), (v5 & 1) != 0))
  {
    sub_23A28748C(v1[7] + 32 * v4, (uint64_t)&v34);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v35 + 1))
  {
    v6 = swift_dynamicCast();
    v7 = v32;
    if (!v6)
      v7 = 0;
    v30 = v7;
    if (v6)
      v8 = v33;
    else
      v8 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v34);
    v30 = 0;
    v8 = 0;
  }
  sub_23A2A37A0();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)&v34 + 1);
  v29 = v34;
  v10 = off_25695B5B0;
  v11 = sub_23A2A37A0();
  if (v10[2] && (v13 = sub_23A291288(v11, v12), (v14 & 1) != 0))
  {
    sub_23A28748C(v10[7] + 32 * v13, (uint64_t)&v34);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v35 + 1))
  {
    v15 = swift_dynamicCast();
    v16 = v32;
    if (!v15)
      v16 = 0;
    v28 = v16;
    if (v15)
      v17 = v33;
    else
      v17 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v34);
    v28 = 0;
    v17 = 0;
  }
  sub_23A2A37AC();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v18 = v34;
  v19 = off_25695B5B0;
  v20 = sub_23A2A37AC();
  if (v19[2] && (v22 = sub_23A291288(v20, v21), (v23 & 1) != 0))
  {
    sub_23A28748C(v19[7] + 32 * v22, (uint64_t)&v34);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v35 + 1))
  {
    sub_23A289E4C((uint64_t)&v34);
    v24 = 2;
    if (v0)
      goto LABEL_34;
LABEL_39:
    if (!v8)
      goto LABEL_45;
    goto LABEL_40;
  }
  if (swift_dynamicCast())
    v24 = v32;
  else
    v24 = 2;
  if (!v0)
    goto LABEL_39;
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v31 == v30 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  v26 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17)
      goto LABEL_54;
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17)
    goto LABEL_42;
  if (v29 == v28 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v27 & 1) == 0)
      return result;
  }
LABEL_54:
  result = v24 == 2 && v18 == 2;
  if (v18 != 2 && v24 != 2)
    return ((v18 & 1) == 0) ^ (v24 != 0);
  return result;
}

uint64_t _s11DeepThought33SetReminderPenetrationEventFilterC06isSiriF013siriExecutionSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  int v25;
  uint64_t v26;
  char v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;

  sub_23A2A377C();
  sub_23A2A3764();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v0 = *((_QWORD *)&v37 + 1);
  v34 = v37;
  if (qword_25695B178 != -1)
    swift_once();
  v1 = off_25695B5B8;
  v2 = sub_23A2A3764();
  if (v1[2] && (v4 = sub_23A291288(v2, v3), (v5 & 1) != 0))
  {
    sub_23A28748C(v1[7] + 32 * v4, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v38 + 1))
  {
    v6 = swift_dynamicCast();
    v7 = v35;
    if (!v6)
      v7 = 0;
    v33 = v7;
    if (v6)
      v8 = v36;
    else
      v8 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v37);
    v33 = 0;
    v8 = 0;
  }
  sub_23A2A3758();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)&v37 + 1);
  v32 = v37;
  v10 = off_25695B5B8;
  v11 = sub_23A2A3758();
  if (v10[2] && (v13 = sub_23A291288(v11, v12), (v14 & 1) != 0))
  {
    sub_23A28748C(v10[7] + 32 * v13, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v38 + 1))
  {
    v15 = swift_dynamicCast();
    v16 = v35;
    if (!v15)
      v16 = 0;
    v31 = v16;
    if (v15)
      v17 = v36;
    else
      v17 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v37);
    v31 = 0;
    v17 = 0;
  }
  sub_23A2A3770();
  type metadata accessor for BMSiriExecutionTaskStep(0);
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v30 = v37;
  v18 = BYTE4(v37);
  v19 = off_25695B5B8;
  v20 = sub_23A2A3770();
  if (v19[2] && (v22 = sub_23A291288(v20, v21), (v23 & 1) != 0))
  {
    sub_23A28748C(v19[7] + 32 * v22, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v38 + 1))
  {
    sub_23A289E4C((uint64_t)&v37);
    v25 = 0;
    v26 = 1;
    if (v0)
      goto LABEL_34;
LABEL_39:
    if (!v8)
      goto LABEL_45;
    goto LABEL_40;
  }
  v24 = swift_dynamicCast();
  if (v24)
    v25 = v35;
  else
    v25 = 0;
  v26 = v24 ^ 1u;
  if (!v0)
    goto LABEL_39;
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v34 == v33 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  v28 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17)
    {
LABEL_51:
      if ((v18 & 1) == 0)
        return (v30 == v25) & ~(_DWORD)v26;
      return v26;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17)
    goto LABEL_42;
  if (v32 == v31 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  v29 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v18 & 1 | ((v29 & 1) == 0)))
    return (v30 == v25) & ~(_DWORD)v26;
  return v29 & v26;
}

uint64_t type metadata accessor for SetReminderPenetrationEventFilter()
{
  return objc_opt_self();
}

uint64_t method lookup function for SetReminderPenetrationEventFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_23A289E4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B3D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A289E8C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B818);
  v2 = sub_23A2A3C98();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23A28C3C0(v6, (uint64_t)&v15, &qword_25695B820);
    v7 = v15;
    v8 = v16;
    result = sub_23A291288(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23A28C404(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_23A289FC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7E0);
  v6 = sub_23A2A3C98();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (char *)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_23A28C3C0(v12, (uint64_t)v5, &qword_25695B7D8);
    v14 = *v5;
    result = sub_23A2912EC(*v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v7[6] + 8 * result) = v14;
    v18 = v7[7];
    v19 = sub_23A2A36BC();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_23A28A158(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7F8);
  v2 = (_QWORD *)sub_23A2A3C98();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 2);
    v7 = *(v4 - 1);
    v6 = *v4;
    v8 = v4[1];
    v9 = v4[2];
    v10 = v4[3];
    v11 = v4[4];
    v12 = *((_BYTE *)v4 + 40);
    v21 = *(_OWORD *)((char *)v4 + 44);
    LODWORD(v22) = *((_DWORD *)v4 - 6);
    *((_QWORD *)&v22 + 1) = v5;
    *(_QWORD *)&v23 = v7;
    *((_QWORD *)&v23 + 1) = v6;
    *(_QWORD *)&v24 = v8;
    *((_QWORD *)&v24 + 1) = v9;
    *(_QWORD *)&v25 = v10;
    *((_QWORD *)&v25 + 1) = v11;
    v26 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23A291348((double *)&v22);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v15 = v2[6] + 72 * result;
    v16 = v25;
    *(_OWORD *)(v15 + 32) = v24;
    *(_OWORD *)(v15 + 48) = v16;
    *(_BYTE *)(v15 + 64) = v26;
    v17 = v23;
    *(_OWORD *)v15 = v22;
    *(_OWORD *)(v15 + 16) = v17;
    *(_OWORD *)(v2[7] + 16 * result) = v21;
    v18 = v2[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_11;
    v4 += 11;
    v2[2] = v20;
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

unint64_t sub_23A28A2CC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7E8);
  v2 = (_QWORD *)sub_23A2A3C98();
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
    swift_bridgeObjectRetain();
    result = sub_23A291288(v5, v6);
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

unint64_t sub_23A28A3E4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7F0);
  v2 = (_QWORD *)sub_23A2A3C98();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_23A291288(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
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

unint64_t static SiriPenetrationRateMetrics.DEFAULT_BOOKMARK_LOCATION.getter()
{
  return 0xD00000000000003FLL;
}

uint64_t SiriPenetrationRateMetrics.__allocating_init(bookmarkLocation:)(void (*a1)(char *, uint64_t, uint64_t), unint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SiriPenetrationRateMetrics.init(bookmarkLocation:)(a1, a2);
  return v4;
}

uint64_t SiriPenetrationRateMetrics.init(bookmarkLocation:)(void (*a1)(char *, uint64_t, uint64_t), unint64_t a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  unint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(char *, uint64_t);
  id v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  id v56;
  id v57;
  void (*v58)(char *, uint64_t, uint64_t);
  char *v59;
  void (*v60)(char *, char *, uint64_t);
  id v61;
  id v62;
  char *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  _QWORD *v68;
  void (*v69)(uint64_t, char *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  void (*v87)(uint64_t, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t, uint64_t);
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t, uint64_t);
  uint64_t v99;
  void (*v100)(uint64_t, char *, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  _QWORD v108[2];
  uint64_t v109;
  _QWORD *v110;
  __int128 v111;
  void (*v112)(char *, uint64_t);
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  void (*v117)(char *, uint64_t, uint64_t);
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130[8];

  v5 = sub_23A2A359C();
  v122 = *(_QWORD *)(v5 - 8);
  v123 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v116 = (char *)v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A2A3A04();
  v126 = *(_QWORD *)(v7 - 8);
  v127 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v115 = (char *)v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v119 = (char *)v108 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v120 = (char *)v108 - v12;
  v13 = sub_23A2A3518();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v118 = (char *)v108 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v108 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v108 - v20;
  v124 = v2 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_odmId;
  sub_23A2A3590();
  v128 = v2;
  v22 = (char *)(v2 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_logger);
  sub_23A2A39F8();
  if (a2)
    v23 = a1;
  else
    v23 = (void (*)(char *, uint64_t, uint64_t))0xD00000000000003FLL;
  if (a2)
    v24 = a2;
  else
    v24 = 0x800000023A2A9B40;
  swift_bridgeObjectRetain_n();
  v129 = v22;
  v25 = sub_23A2A39EC();
  v26 = sub_23A2A3B84();
  v27 = os_log_type_enabled(v25, v26);
  v125 = v21;
  if (v27)
  {
    v28 = swift_slowAlloc();
    v114 = v14;
    v29 = (uint8_t *)v28;
    v30 = swift_slowAlloc();
    v117 = v23;
    v31 = v30;
    v130[0] = v30;
    *(_DWORD *)v29 = 136315138;
    swift_bridgeObjectRetain();
    v130[7] = sub_23A288988((uint64_t)v117, v24, v130);
    v21 = v125;
    sub_23A2A3BA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A27E000, v25, v26, "marker: streams bookmark path=%s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v31, -1, -1);
    v32 = v29;
    v14 = v114;
    MEMORY[0x23B847BB8](v32, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_23A2A350C();
  swift_bridgeObjectRelease();
  v33 = v14;
  v34 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v34(v19, v21, v13);
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v126 + 16);
  v36 = v120;
  v37 = v19;
  v38 = v127;
  v35(v120, (uint64_t)v129, v127);
  v39 = sub_23A2A3914();
  v34(v118, v37, v13);
  v40 = sub_23A2A3908();
  v130[3] = v39;
  v130[4] = MEMORY[0x24BE2BC40];
  v130[0] = v40;
  v41 = (uint64_t)v119;
  v35(v119, (uint64_t)v36, v38);
  type metadata accessor for StreamBookmarkService();
  swift_allocObject();
  v42 = v121;
  v43 = StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(v130, 0xD000000000000021, 0x800000023A2A9BC0, v41);
  v121 = v42;
  if (v42)
  {
    v44 = v127;
    v45 = *(void (**)(char *, uint64_t))(v126 + 8);
    v45(v36, v127);
    v46 = *(void (**)(char *, uint64_t))(v33 + 8);
    v46(v37, v13);
    v46(v125, v13);
    (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v124, v123);
    v45(v129, v44);
    type metadata accessor for SiriPenetrationRateMetrics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v48 = v126;
    v47 = v127;
    v49 = *(void (**)(char *, uint64_t))(v126 + 8);
    v117 = v35;
    v119 = (char *)v43;
    v49(v36, v127);
    v50 = *(void (**)(char *, uint64_t))(v33 + 8);
    v113 = v13;
    v112 = v50;
    v50(v37, v13);
    v51 = objc_msgSend(objc_allocWithZone((Class)sub_23A2A3920()), sel_init);
    v52 = v115;
    v53 = v129;
    v35(v115, (uint64_t)v129, v47);
    type metadata accessor for FeaturizedBiomeDataProvider();
    v54 = (char *)swift_allocObject();
    v55 = v119;
    *((_QWORD *)v54 + 4) = v119;
    v126 = *(_QWORD *)(v48 + 32);
    ((void (*)(char *, char *, uint64_t))v126)(&v54[OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger], v52, v47);
    v120 = v54;
    *((_QWORD *)v54 + 2) = 13;
    *((_QWORD *)v54 + 3) = v51;
    v56 = objc_allocWithZone((Class)sub_23A2A392C());
    swift_retain();
    v57 = objc_msgSend(v56, sel_init);
    v58 = v117;
    v117(v52, (uint64_t)v53, v47);
    v59 = (char *)swift_allocObject();
    v118 = v59;
    *((_QWORD *)v59 + 4) = v55;
    v60 = (void (*)(char *, char *, uint64_t))v126;
    ((void (*)(char *, char *, uint64_t))v126)(&v59[OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger], v52, v47);
    *((_QWORD *)v59 + 2) = 6;
    *((_QWORD *)v59 + 3) = v57;
    v61 = objc_allocWithZone((Class)sub_23A2A38F0());
    swift_retain();
    v62 = objc_msgSend(v61, sel_init);
    v58(v52, (uint64_t)v53, v47);
    v63 = (char *)swift_allocObject();
    *((_QWORD *)v63 + 4) = v55;
    v60(&v63[OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger], v52, v47);
    *((_QWORD *)v63 + 2) = 1;
    *((_QWORD *)v63 + 3) = v62;
    v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B660);
    v64 = swift_allocObject();
    v111 = xmmword_23A2A4780;
    *(_OWORD *)(v64 + 16) = xmmword_23A2A4780;
    v65 = objc_allocWithZone((Class)sub_23A2A3884());
    swift_retain();
    *(_QWORD *)(v64 + 32) = objc_msgSend(v65, sel_init);
    *(_QWORD *)(v64 + 40) = objc_msgSend(objc_allocWithZone((Class)sub_23A2A38FC()), sel_init);
    *(_QWORD *)(v64 + 48) = objc_msgSend(objc_allocWithZone((Class)sub_23A2A3878()), sel_init);
    v130[0] = v64;
    sub_23A2A3B00();
    v66 = v130[0];
    v67 = v117;
    v117(v52, (uint64_t)v53, v47);
    type metadata accessor for FeaturizedConversationDataProvider();
    v68 = (_QWORD *)swift_allocObject();
    v68[4] = v55;
    v69 = (void (*)(uint64_t, char *, uint64_t))v126;
    ((void (*)(char *, char *, uint64_t))v126)((char *)v68 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger, v52, v47);
    v68[2] = 0;
    v68[3] = v66;
    v67(v52, (uint64_t)v53, v47);
    type metadata accessor for SiriPenetrationRateDataProvider();
    v70 = swift_allocObject();
    *(_QWORD *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedAppIntentProivder) = v120;
    *(_QWORD *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriExecutionProvider) = v118;
    *(_QWORD *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriUIProvider) = v63;
    *(_QWORD *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedConversationProvider) = v68;
    v69(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger, v52, v47);
    *(_QWORD *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_bookmarkService) = v55;
    *(_QWORD *)(v128 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_siriPenetrationRateDataProvider) = v70;
    v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = v111;
    v72 = qword_25695B150;
    swift_retain_n();
    swift_retain();
    swift_retain();
    *(_QWORD *)&v111 = v63;
    swift_retain();
    v110 = v68;
    swift_retain();
    if (v72 != -1)
      swift_once();
    *(_QWORD *)(v71 + 32) = qword_25695B1B8;
    v73 = qword_25695B158;
    swift_retain();
    if (v73 != -1)
      swift_once();
    *(_QWORD *)(v71 + 40) = qword_25695B1C0;
    v74 = qword_25695B160;
    swift_retain();
    v75 = v117;
    v76 = v129;
    if (v74 != -1)
      swift_once();
    *(_QWORD *)(v71 + 48) = qword_25695B1C8;
    v130[0] = v71;
    sub_23A2A3B00();
    v77 = v130[0];
    v78 = (uint64_t)v115;
    v79 = v127;
    v75(v115, (uint64_t)v76, v127);
    type metadata accessor for SiriPenetrationRateCalculator();
    swift_allocObject();
    swift_retain();
    v80 = SiriPenetrationRateCalculator.init(calculationTasks:logger:)(v77, v78);
    *(_QWORD *)(v128 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_siriPenetrationRateWorker) = v80;
    v81 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
    swift_unknownObjectRelease();
    v82 = objc_msgSend(v81, sel_TaskAggregation);
    swift_unknownObjectRelease();
    v83 = objc_msgSend(v82, sel_source);

    __swift_instantiateConcreteTypeFromMangledName(&qword_25695B668);
    v84 = swift_allocObject();
    *(_QWORD *)(v84 + 16) = v83;
    v75((char *)v78, (uint64_t)v76, v79);
    v85 = v122;
    v108[0] = *(_QWORD *)(v122 + 16);
    v86 = v116;
    v87 = (void (*)(uint64_t, uint64_t, uint64_t))v75;
    v88 = v123;
    ((void (*)(char *, uint64_t, uint64_t))v108[0])(v116, v124, v123);
    type metadata accessor for SiriPenetrationRateBiomeReporter();
    v89 = swift_allocObject();
    *(_QWORD *)(v89 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator) = v84;
    v108[1] = v84;
    v90 = v89;
    v109 = v89;
    v91 = (void (*)(uint64_t, uint64_t, uint64_t))v126;
    ((void (*)(uint64_t, uint64_t, uint64_t))v126)(v89 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger, v78, v79);
    v122 = *(_QWORD *)(v85 + 32);
    ((void (*)(uint64_t, char *, uint64_t))v122)(v90 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId, v86, v88);
    v92 = v129;
    v87(v78, (uint64_t)v129, v79);
    type metadata accessor for SiriPenetrationRateJsonLoggingReporter();
    v93 = swift_allocObject();
    v94 = v88;
    v95 = OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult;
    swift_retain();
    swift_retain();
    *(_QWORD *)(v93 + v95) = sub_23A289E8C(MEMORY[0x24BEE4AF8]);
    v91(v93 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger, v78, v79);
    swift_release();
    v87(v78, (uint64_t)v92, v79);
    v96 = v116;
    v97 = v124;
    v98 = (void (*)(char *, uint64_t, uint64_t))v108[0];
    ((void (*)(char *, uint64_t, uint64_t))v108[0])(v116, v124, v94);
    type metadata accessor for SiriPenetrationRateCoreAnalyticsReporter();
    v99 = swift_allocObject();
    v91(v99 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger, v78, v79);
    v100 = (void (*)(uint64_t, char *, uint64_t))v122;
    ((void (*)(uint64_t, char *, uint64_t))v122)(v99 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId, v96, v94);
    v117((char *)v78, (uint64_t)v129, v79);
    v98(v96, v97, v94);
    type metadata accessor for SiriPenetrationRateSELFReporter();
    v101 = swift_allocObject();
    ((void (*)(uint64_t, uint64_t, uint64_t))v126)(v101 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger, v78, v79);
    v100(v101 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId, v96, v94);
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_23A2A4790;
    *(_QWORD *)(v102 + 32) = v109;
    *(_QWORD *)(v102 + 40) = v93;
    *(_QWORD *)(v102 + 48) = v99;
    *(_QWORD *)(v102 + 56) = v101;
    v130[0] = v102;
    sub_23A2A3B00();
    v103 = v130[0];
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v112(v125, v113);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695B670);
    v104 = swift_allocObject();
    *(_QWORD *)(v104 + 16) = v103;
    __swift_instantiateConcreteTypeFromMangledName(qword_25695B678);
    v105 = swift_allocObject();
    v106 = v119;
    *(_QWORD *)(v105 + 16) = v104;
    *(_QWORD *)(v105 + 24) = v106;
    *(_QWORD *)(v128 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_siriPenetrationRateReporter) = v105;
  }
  return v128;
}

uint64_t type metadata accessor for SiriPenetrationRateMetrics()
{
  uint64_t result;

  result = qword_25695B700;
  if (!qword_25695B700)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A28B290(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23A28B2A8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_23A28B304;
  return sub_23A29925C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23A28B304()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A28B34C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = v2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(v3 + 96) = *(_QWORD *)a2;
  *(_QWORD *)(v3 + 104) = v4;
  *(_OWORD *)(v3 + 112) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(v3 + 128) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 136) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(v3 + 152) = *(_QWORD *)(a2 + 56);
  return swift_task_switch();
}

uint64_t sub_23A28B38C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  v4 = *(_OWORD *)(v0 + 112);
  v3 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 32) = v4;
  *(_OWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)(v0 + 72) = v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v5;
  *v5 = v0;
  v5[1] = sub_23A28B408;
  return sub_23A28E424(*(_QWORD *)(v0 + 80), (uint64_t *)(v0 + 16));
}

uint64_t sub_23A28B408()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A28B454(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 40) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_23A28B47C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25695B698 + dword_25695B698);
  v1 = (_QWORD *)swift_task_alloc();
  v0[6] = v1;
  *v1 = v0;
  v1[1] = sub_23A28B4F0;
  return v3(v0[3], v0[4], v0[5]);
}

uint64_t sub_23A28B4F0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t SiriPenetrationRateMetrics.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_logger;
  v4 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriPenetrationRateMetrics.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_logger;
  v4 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23A28B67C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_23A28B698(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = v4;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(v3 + 96) = *(_QWORD *)a2;
  *(_QWORD *)(v3 + 104) = v5;
  *(_OWORD *)(v3 + 112) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(v3 + 128) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 136) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(v3 + 152) = *(_QWORD *)(a2 + 56);
  return swift_task_switch();
}

uint64_t sub_23A28B6DC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a1;
  *(_QWORD *)(v2 + 40) = *(_QWORD *)(a1 + 16);
  return swift_task_switch();
}

uint64_t sub_23A28B708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = v3;
  return swift_task_switch();
}

uint64_t sub_23A28B724()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 16);
  *(_QWORD *)(v0 + 48) = v1;
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = v2;
    if (v2)
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_23A2A3C74();
  v2 = result;
  *(_QWORD *)(v0 + 56) = result;
  if (!result)
    goto LABEL_9;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 64) = 0;
    v4 = *(_QWORD *)(v0 + 48);
    if ((v4 & 0xC000000000000001) != 0)
    {
      v5 = MEMORY[0x23B8475B8](0);
    }
    else
    {
      v5 = *(_QWORD *)(v4 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 72) = v5;
    v7 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v5 + 80) + *(_QWORD *)(*(_QWORD *)v5 + 80));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v6;
    *v6 = v0;
    v6[1] = sub_23A28B83C;
    return v7(v0 + 16);
  }
  return result;
}

uint64_t sub_23A28B83C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A28B890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 56);
  swift_release();
  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 64) + 1;
    *(_QWORD *)(v0 + 64) = v4;
    v5 = *(_QWORD *)(v0 + 48);
    if ((v5 & 0xC000000000000001) != 0)
    {
      v6 = MEMORY[0x23B8475B8]();
    }
    else
    {
      v6 = *(_QWORD *)(v5 + 8 * v4 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 72) = v6;
    v8 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v6 + 80) + *(_QWORD *)(*(_QWORD *)v6 + 80));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v7;
    *v7 = v0;
    v7[1] = sub_23A28B83C;
    return v8(v0 + 16);
  }
}

uint64_t sub_23A28B96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v5 = type metadata accessor for conversationStreamMetadata(0);
  v4[11] = v5;
  v4[12] = *(_QWORD *)(v5 - 8);
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  v4[14] = swift_task_alloc();
  v6 = type metadata accessor for eventStreamMetadata(0);
  v4[15] = v6;
  v4[16] = *(_QWORD *)(v6 - 8);
  v4[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A28BA1C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25695B808 + dword_25695B808);
  v1 = (_QWORD *)swift_task_alloc();
  v0[18] = v1;
  *v1 = v0;
  v1[1] = sub_23A28BA88;
  return v3(v0[7], v0[8], v0[9]);
}

uint64_t sub_23A28BA88()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A28BB18()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 40) = &type metadata for SiriPenetrationRateResult;
  v2 = sub_23A28C2FC();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 48) = v2;
  *(_QWORD *)(v0 + 32) = v1;
  v3 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), (uint64_t)&type metadata for SiriPenetrationRateResult)[1];
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(v0 + 128);
    v27 = *(_QWORD *)(v0 + 136) + *(int *)(*(_QWORD *)(v0 + 120) + 20);
    v25 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + 24);
    v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v7 = *(_QWORD *)(v5 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    do
    {
      v8 = *(_QWORD *)(v0 + 136);
      v9 = *(_QWORD *)(v0 + 112);
      sub_23A28C340(v6, v8, type metadata accessor for eventStreamMetadata);
      v10 = sub_23A2A3560();
      v11 = *(_QWORD *)(v10 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v27, v10);
      sub_23A28C384(v8, type metadata accessor for eventStreamMetadata);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      v12 = *(id *)(v25 + 16);
      sub_23A2A3854();

      sub_23A282DCC(v9);
      v6 += v7;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  v13 = *(_QWORD *)(v0 + 32);
  v14 = *(_QWORD *)(v13 + 16);
  if (v14)
  {
    v15 = *(_QWORD *)(v0 + 96);
    v28 = *(_QWORD *)(v0 + 104) + *(int *)(*(_QWORD *)(v0 + 88) + 20);
    v26 = *(_QWORD *)(*(_QWORD *)(v0 + 80) + 24);
    v16 = v13 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v17 = *(_QWORD *)(v15 + 72);
    swift_bridgeObjectRetain();
    do
    {
      v18 = *(_QWORD *)(v0 + 104);
      v19 = *(_QWORD *)(v0 + 112);
      sub_23A28C340(v16, v18, type metadata accessor for conversationStreamMetadata);
      v20 = sub_23A2A3560();
      v21 = *(_QWORD *)(v20 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v28, v20);
      sub_23A28C384(v18, type metadata accessor for conversationStreamMetadata);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v21 + 56))(v19, 0, 1, v20);
      v22 = *(id *)(v26 + 16);
      sub_23A2A3848();

      sub_23A282DCC(v19);
      v16 += v17;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  v23 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v23;
  *v23 = v0;
  v23[1] = sub_23A28BDC8;
  return sub_23A287B74();
}

uint64_t sub_23A28BDC8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A28BE2C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A28BE88()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A28BEE0()
{
  return sub_23A28BF4C(&qword_25695B6A0, (uint64_t)&protocol conformance descriptor for SiriPenetrationRateMetrics);
}

uint64_t sub_23A28BF04()
{
  return sub_23A28BF4C(&qword_25695B6A8, (uint64_t)&protocol conformance descriptor for SiriPenetrationRateMetrics);
}

uint64_t sub_23A28BF28()
{
  return sub_23A28BF4C(&qword_25695B6B0, (uint64_t)&protocol conformance descriptor for SiriPenetrationRateMetrics);
}

uint64_t sub_23A28BF4C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SiriPenetrationRateMetrics();
    result = MEMORY[0x23B847B10](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A28BF90()
{
  unint64_t result;

  result = qword_25695B6B8[0];
  if (!qword_25695B6B8[0])
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for SiriPenetrationRateDataRecord, &type metadata for SiriPenetrationRateDataRecord);
    atomic_store(result, qword_25695B6B8);
  }
  return result;
}

uint64_t sub_23A28BFD8()
{
  return type metadata accessor for SiriPenetrationRateMetrics();
}

uint64_t sub_23A28BFE0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A2A359C();
  if (v1 <= 0x3F)
  {
    result = sub_23A2A3A04();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.__allocating_init(bookmarkLocation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 128) + *(_QWORD *)(*(_QWORD *)v1 + 128));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A28C414;
  return v6(a1);
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 136) + *(_QWORD *)(*(_QWORD *)v2 + 136));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A2891C4;
  return v8(a1, a2);
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.report(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 144) + *(_QWORD *)(*(_QWORD *)v1 + 144));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A28C414;
  return v6(a1);
}

unint64_t sub_23A28C1DC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int v4;
  double v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B800);
  v3 = (_QWORD *)sub_23A2A3C98();
  v4 = *(_DWORD *)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  result = sub_23A2913B8(v4, v5);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = (_QWORD *)(a1 + 72);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = v3[6] + 16 * result;
    *(_DWORD *)v10 = v4;
    *(double *)(v10 + 8) = v5;
    *(_QWORD *)(v3[7] + 8 * result) = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *((_DWORD *)v9 - 4);
    v5 = *((double *)v9 - 1);
    v15 = *v9;
    swift_bridgeObjectRetain();
    result = sub_23A2913B8(v4, v5);
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_23A28C2FC()
{
  unint64_t result;

  result = qword_25695B810;
  if (!qword_25695B810)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for SiriPenetrationRateResult, &type metadata for SiriPenetrationRateResult);
    atomic_store(result, (unint64_t *)&qword_25695B810);
  }
  return result;
}

uint64_t sub_23A28C340(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A28C384(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A28C3C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_23A28C404(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id BiomeEvent.biomeEvent.getter()
{
  id *v0;

  return *v0;
}

double BiomeEvent.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t BiomeEvent.init(biomeEvent:timestamp:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(_QWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t BiomeRecord.biomeEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t BiomeRecord.init(biomeEvents:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id BiomeDataProvider.biomeSource.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t BiomeDataProvider.__allocating_init(logger:biomeSource:bookmark:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v7 = v6 + qword_25695B828;
  v8 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a1, v8);
  return v6;
}

uint64_t BiomeDataProvider.init(logger:biomeSource:bookmark:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  v5 = v3 + qword_25695B828;
  v6 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  return v3;
}

uint64_t sub_23A28C518(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *v1;
  return swift_task_switch();
}

uint64_t sub_23A28C538()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 48) + 80);
  sub_23A28C83C();
  v2 = sub_23A2A36F8();
  type metadata accessor for BiomeEvent(0, v1, v3, v4);
  v19 = sub_23A2A3B18();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_23A2A3C74();
    v5 = result;
    if (!result)
      goto LABEL_10;
  }
  else
  {
    v5 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v5)
      goto LABEL_10;
  }
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  v7 = 0;
  do
  {
    if ((v2 & 0xC000000000000001) != 0)
      v8 = (id)MEMORY[0x23B8475B8](v7, v2);
    else
      v8 = *(id *)(v2 + 8 * v7 + 32);
    v9 = v8;
    ++v7;
    sub_23A2A39C8();
    v10 = swift_dynamicCastUnknownClassUnconditional();
    sub_23A2A39D4();
    *(_QWORD *)(v0 + 16) = v10;
    *(_QWORD *)(v0 + 24) = v11;
    sub_23A2A3B48();
    sub_23A2A3B30();

  }
  while (v5 != v7);
LABEL_10:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v12 = sub_23A2A39EC();
  v13 = sub_23A2A3B84();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v20 = v15;
    *(_DWORD *)v14 = 134218242;
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v16 = sub_23A2A3C74();
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = v16;
    sub_23A2A3BA8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v17 = sub_23A2A3DF4();
    *(_QWORD *)(v0 + 16) = sub_23A288988(v17, v18, &v20);
    sub_23A2A3BA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A27E000, v12, v13, "marker: read %ld events of type %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v15, -1, -1);
    MEMORY[0x23B847BB8](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  **(_QWORD **)(v0 + 32) = v19;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A28C83C()
{
  uint64_t v0;
  uint64_t result;

  sub_23A28CEE4(0, &qword_25695B9C8);
  v0 = swift_dynamicCastMetatype();
  result = 0;
  if (!v0)
  {
    sub_23A28CEE4(0, &qword_25695B9D0);
    if (swift_dynamicCastMetatype())
    {
      return 1;
    }
    else
    {
      sub_23A28CEE4(0, &qword_25695B9D8);
      if (swift_dynamicCastMetatype())
      {
        return 2;
      }
      else
      {
        sub_23A28CEE4(0, &qword_25695B9E0);
        if (swift_dynamicCastMetatype())
        {
          return 3;
        }
        else
        {
          sub_23A28CEE4(0, &qword_25695B9E8);
          if (swift_dynamicCastMetatype())
          {
            return 4;
          }
          else
          {
            sub_23A28CEE4(0, &qword_25695B9F0);
            if (swift_dynamicCastMetatype())
            {
              return 6;
            }
            else
            {
              sub_23A28CEE4(0, &qword_25695B9F8);
              if (swift_dynamicCastMetatype())
              {
                return 7;
              }
              else
              {
                sub_23A28CEE4(0, &qword_25695BA00);
                if (swift_dynamicCastMetatype())
                {
                  return 8;
                }
                else
                {
                  sub_23A28CEE4(0, &qword_25695BA08);
                  if (swift_dynamicCastMetatype())
                  {
                    return 9;
                  }
                  else
                  {
                    sub_23A28CEE4(0, &qword_25695BA10);
                    if (swift_dynamicCastMetatype())
                    {
                      return 10;
                    }
                    else
                    {
                      sub_23A28CEE4(0, &qword_25695BA18);
                      if (swift_dynamicCastMetatype())
                      {
                        return 11;
                      }
                      else
                      {
                        sub_23A28CEE4(0, &qword_25695BA20);
                        if (swift_dynamicCastMetatype())
                        {
                          return 12;
                        }
                        else
                        {
                          sub_23A28CEE4(0, &qword_25695BA28);
                          if (swift_dynamicCastMetatype())
                          {
                            return 13;
                          }
                          else
                          {
                            sub_23A28CEE4(0, &qword_25695BA30);
                            if (swift_dynamicCastMetatype())
                            {
                              return 16;
                            }
                            else
                            {
                              sub_23A28CEE4(0, &qword_25695BA38);
                              if (swift_dynamicCastMetatype())
                              {
                                return 15;
                              }
                              else
                              {
                                sub_23A28CEE4(0, &qword_25695BA40);
                                if (swift_dynamicCastMetatype())
                                {
                                  return 14;
                                }
                                else
                                {
                                  sub_23A28CEE4(0, &qword_25695BA48);
                                  if (swift_dynamicCastMetatype())
                                  {
                                    return 18;
                                  }
                                  else
                                  {
                                    sub_23A28CEE4(0, &qword_25695BA50);
                                    if (swift_dynamicCastMetatype())
                                      return 19;
                                    else
                                      return 5;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t BiomeDataProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_25695B828;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t BiomeDataProvider.__deallocating_deinit()
{
  BiomeDataProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23A28CBF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(**(_QWORD **)v1 + 120) + *(_QWORD *)(**(_QWORD **)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A2891C4;
  return v6(a1);
}

uint64_t type metadata accessor for BiomeEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BiomeEvent);
}

void sub_23A28CC6C()
{
  JUMPOUT(0x23B847B10);
}

uint64_t sub_23A28CC7C()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_23A28CC84(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void sub_23A28CCB0(id *a1)
{

}

uint64_t sub_23A28CCB8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23A28CD0C(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriPentrationRateCoreAnalyticsPayload(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriPentrationRateCoreAnalyticsPayload(uint64_t result, int a2, int a3)
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
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for BiomeRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BiomeRecord);
}

uint64_t sub_23A28CDD8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for BiomeDataProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BiomeDataProvider);
}

uint64_t method lookup function for BiomeDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BiomeDataProvider.__allocating_init(logger:biomeSource:bookmark:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BiomeDataProvider.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A2891C4;
  return v6(a1);
}

uint64_t sub_23A28CEE4(uint64_t a1, unint64_t *a2)
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

uint64_t static BookmarkUtils.getBookmarkEndTime(calendar:)@<X0>(uint64_t (*a1)(char *, uint64_t, uint64_t)@<X0>, char *a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(char *, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  char *v56;

  v53 = a1;
  v43 = a2;
  v2 = sub_23A2A3614();
  v50 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v49 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A2A3620();
  v47 = *(_QWORD *)(v4 - 8);
  v48 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v46 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A2A35FC();
  v54 = *(_QWORD *)(v6 - 8);
  v55 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_23A2A365C();
  v8 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v45 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v41 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v41 - v17;
  v19 = sub_23A2A3560();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v41 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v56 = (char *)&v41 - v24;
  if (qword_25695B168 != -1)
    swift_once();
  v25 = __swift_project_value_buffer(v11, (uint64_t)qword_25695B288);
  swift_beginAccess();
  sub_23A282D3C(v25, (uint64_t)v18);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  v27 = v19;
  if (v26(v18, 1, v19) == 1)
  {
    sub_23A2A3554();
    sub_23A282DCC((uint64_t)v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v23, v18, v19);
  }
  v28 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDCF220], v52);
  sub_23A2A3638();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v28);
  v53 = (uint64_t (*)(char *, uint64_t, uint64_t))v26;
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v26)(v16, 1, v19);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v42 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v42(v56, v16, v19);
    v41 = *(void (**)(char *, uint64_t))(v20 + 8);
    v41(v23, v19);
    v30 = v44;
    (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v44, *MEMORY[0x24BDCF020], v55);
    v31 = *MEMORY[0x24BDCF0B0];
    v33 = v47;
    v32 = v48;
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 104);
    v52 = v27;
    v35 = v46;
    v34(v46, v31, v48);
    v37 = v49;
    v36 = v50;
    v38 = v51;
    (*(void (**)(char *, _QWORD, uint64_t))(v50 + 104))(v49, *MEMORY[0x24BDCF068], v51);
    v39 = v45;
    sub_23A2A362C();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
    v40 = v52;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v30, v55);
    result = v53(v39, 1, v40);
    if ((_DWORD)result != 1)
    {
      v42(v43, v39, v40);
      return ((uint64_t (*)(char *, uint64_t))v41)(v56, v40);
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for BookmarkUtils()
{
  return &type metadata for BookmarkUtils;
}

void *sub_23A28D378()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B658);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A4A20;
  sub_23A2A37E8();
  *(_QWORD *)(inited + 32) = sub_23A2A37DC();
  *(_QWORD *)(inited + 40) = v1;
  v2 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000017;
  *(_QWORD *)(inited + 56) = 0x800000023A2A9CE0;
  *(_QWORD *)(inited + 80) = sub_23A2A37A0();
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 120) = v2;
  *(_QWORD *)(inited + 96) = 0x6C61437472617453;
  *(_QWORD *)(inited + 104) = 0xE90000000000006CLL;
  *(_QWORD *)(inited + 128) = sub_23A2A37B8();
  *(_QWORD *)(inited + 136) = v4;
  type metadata accessor for BMAppIntentHandlingStatus(0);
  *(_QWORD *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 4;
  *(_QWORD *)(inited + 176) = sub_23A2A37AC();
  *(_QWORD *)(inited + 184) = v6;
  *(_QWORD *)(inited + 216) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 192) = 0;
  *(_QWORD *)(inited + 224) = sub_23A2A37D0();
  *(_QWORD *)(inited + 232) = v7;
  *(_QWORD *)(inited + 264) = v2;
  *(_QWORD *)(inited + 240) = 0x676E696F6774754FLL;
  *(_QWORD *)(inited + 248) = 0xE800000000000000;
  result = (void *)sub_23A289E8C(inited);
  off_25695BA58 = result;
  return result;
}

uint64_t static StartCallPenetrationRateEventFilter.expectedAppIntentIntraEventFeatures.getter()
{
  return sub_23A28959C(&qword_25695B180);
}

void *sub_23A28D4AC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B658);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A4710;
  sub_23A2A377C();
  *(_QWORD *)(inited + 32) = sub_23A2A3764();
  *(_QWORD *)(inited + 40) = v1;
  v2 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000017;
  *(_QWORD *)(inited + 56) = 0x800000023A2A9CE0;
  *(_QWORD *)(inited + 80) = sub_23A2A3758();
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 120) = v2;
  *(_QWORD *)(inited + 96) = 0xD000000000000023;
  *(_QWORD *)(inited + 104) = 0x800000023A2A9D00;
  *(_QWORD *)(inited + 128) = sub_23A2A3770();
  *(_QWORD *)(inited + 136) = v4;
  type metadata accessor for BMSiriExecutionTaskStep(0);
  *(_QWORD *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 7;
  result = (void *)sub_23A289E8C(inited);
  off_25695BA60 = result;
  return result;
}

uint64_t static StartCallPenetrationRateEventFilter.expectedSiriExecutionIntraEventFeatures.getter()
{
  return sub_23A28959C(&qword_25695B188);
}

uint64_t StartCallPenetrationRateEventFilter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t StartCallPenetrationRateEventFilter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t _s11DeepThought35StartCallPenetrationRateEventFilterC06isSiriG013siriExecutionSb0aB15BiomeFoundation010FeaturizedG0C_tFZ_0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  int v25;
  uint64_t v26;
  char v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;

  sub_23A2A377C();
  sub_23A2A3764();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v0 = *((_QWORD *)&v37 + 1);
  v34 = v37;
  if (qword_25695B188 != -1)
    swift_once();
  v1 = off_25695BA60;
  v2 = sub_23A2A3764();
  if (v1[2] && (v4 = sub_23A291288(v2, v3), (v5 & 1) != 0))
  {
    sub_23A28748C(v1[7] + 32 * v4, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v38 + 1))
  {
    v6 = swift_dynamicCast();
    v7 = v35;
    if (!v6)
      v7 = 0;
    v33 = v7;
    if (v6)
      v8 = v36;
    else
      v8 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v37);
    v33 = 0;
    v8 = 0;
  }
  sub_23A2A3758();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)&v37 + 1);
  v32 = v37;
  v10 = off_25695BA60;
  v11 = sub_23A2A3758();
  if (v10[2] && (v13 = sub_23A291288(v11, v12), (v14 & 1) != 0))
  {
    sub_23A28748C(v10[7] + 32 * v13, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v38 + 1))
  {
    v15 = swift_dynamicCast();
    v16 = v35;
    if (!v15)
      v16 = 0;
    v31 = v16;
    if (v15)
      v17 = v36;
    else
      v17 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v37);
    v31 = 0;
    v17 = 0;
  }
  sub_23A2A3770();
  type metadata accessor for BMSiriExecutionTaskStep(0);
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v30 = v37;
  v18 = BYTE4(v37);
  v19 = off_25695BA60;
  v20 = sub_23A2A3770();
  if (v19[2] && (v22 = sub_23A291288(v20, v21), (v23 & 1) != 0))
  {
    sub_23A28748C(v19[7] + 32 * v22, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v38 + 1))
  {
    sub_23A289E4C((uint64_t)&v37);
    v25 = 0;
    v26 = 1;
    if (v0)
      goto LABEL_34;
LABEL_39:
    if (!v8)
      goto LABEL_45;
    goto LABEL_40;
  }
  v24 = swift_dynamicCast();
  if (v24)
    v25 = v35;
  else
    v25 = 0;
  v26 = v24 ^ 1u;
  if (!v0)
    goto LABEL_39;
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v34 == v33 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  v28 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17)
    {
LABEL_51:
      if ((v18 & 1) == 0)
        return (v30 == v25) & ~(_DWORD)v26;
      return v26;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17)
    goto LABEL_42;
  if (v32 == v31 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  v29 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v18 & 1 | ((v29 & 1) == 0)))
    return (v30 == v25) & ~(_DWORD)v26;
  return v29 & v26;
}

uint64_t _s11DeepThought35StartCallPenetrationRateEventFilterC12isAppUIEvent9appIntentSb0aB15BiomeFoundation010FeaturizedG0C_tFZ_0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  int v23;
  int v24;
  char v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  int v31;
  __int128 v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  char v43;
  char v44;
  int v45;
  int v46;
  int v47;
  unint64_t v48;
  char v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  __int128 v55;
  __int128 v56;

  sub_23A2A37E8();
  sub_23A2A37DC();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v0 = *((_QWORD *)&v55 + 1);
  v52 = v55;
  if (qword_25695B180 != -1)
    swift_once();
  v1 = off_25695BA58;
  v2 = sub_23A2A37DC();
  if (v1[2] && (v4 = sub_23A291288(v2, v3), (v5 & 1) != 0))
  {
    sub_23A28748C(v1[7] + 32 * v4, (uint64_t)&v55);
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v56 + 1))
  {
    v6 = swift_dynamicCast();
    v7 = v53;
    if (!v6)
      v7 = 0;
    v51 = v7;
    if (v6)
      v8 = v54;
    else
      v8 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v55);
    v51 = 0;
    v8 = 0;
  }
  sub_23A2A37A0();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v9 = v55;
  v10 = off_25695BA58;
  v11 = sub_23A2A37A0();
  if (v10[2] && (v13 = sub_23A291288(v11, v12), (v14 & 1) != 0))
  {
    sub_23A28748C(v10[7] + 32 * v13, (uint64_t)&v55);
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v56 + 1))
  {
    v15 = swift_dynamicCast();
    v16 = v53;
    if (!v15)
      v16 = 0;
    v48 = v16;
    if (v15)
      v17 = v54;
    else
      v17 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v55);
    v48 = 0;
    v17 = 0;
  }
  sub_23A2A37B8();
  type metadata accessor for BMAppIntentHandlingStatus(0);
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v46 = v55;
  v50 = BYTE4(v55);
  v18 = off_25695BA58;
  v19 = sub_23A2A37B8();
  if (v18[2] && (v21 = sub_23A291288(v19, v20), (v22 & 1) != 0))
  {
    sub_23A28748C(v18[7] + 32 * v21, (uint64_t)&v55);
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v56 + 1))
  {
    v23 = swift_dynamicCast();
    v24 = v53;
    if (!v23)
      v24 = 0;
    v45 = v24;
    v25 = v23 ^ 1;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v55);
    v45 = 0;
    v25 = 1;
  }
  v49 = v25;
  sub_23A2A37AC();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v47 = v55;
  v26 = off_25695BA58;
  v27 = sub_23A2A37AC();
  if (v26[2] && (v29 = sub_23A291288(v27, v28), (v30 & 1) != 0))
  {
    sub_23A28748C(v26[7] + 32 * v29, (uint64_t)&v55);
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v56 + 1))
  {
    if (swift_dynamicCast())
      v31 = v53;
    else
      v31 = 2;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v55);
    v31 = 2;
  }
  sub_23A2A37D0();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v32 = v55;
  v33 = off_25695BA58;
  v34 = sub_23A2A37D0();
  if (v33[2] && (v36 = sub_23A291288(v34, v35), (v37 & 1) != 0))
  {
    sub_23A28748C(v33[7] + 32 * v36, (uint64_t)&v55);
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v56 + 1))
  {
    sub_23A289E4C((uint64_t)&v55);
    v39 = 0;
    v40 = 0;
    if (v0)
      goto LABEL_55;
LABEL_60:
    if (!v8)
      goto LABEL_68;
    goto LABEL_61;
  }
  v38 = swift_dynamicCast();
  if (v38)
    v39 = v53;
  else
    v39 = 0;
  if (v38)
    v40 = v54;
  else
    v40 = 0;
  if (!v0)
    goto LABEL_60;
LABEL_55:
  if (!v8)
  {
LABEL_61:
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  if (v52 == v51 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_68;
  }
  v43 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v43 & 1) == 0)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    goto LABEL_63;
  }
LABEL_68:
  if (!*((_QWORD *)&v9 + 1))
  {
    if (!v17)
      goto LABEL_76;
LABEL_63:
    swift_bridgeObjectRelease();
    goto LABEL_64;
  }
  if (!v17)
    goto LABEL_63;
  if (v9 == __PAIR128__(v17, v48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v44 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v44 & 1) == 0)
      goto LABEL_64;
  }
LABEL_76:
  if ((v50 & 1) != 0)
  {
    if ((v49 & 1) == 0)
      goto LABEL_64;
  }
  else if ((v49 & 1) != 0 || v46 != v45)
  {
    goto LABEL_64;
  }
  if (v47 == 2)
  {
    if (v31 == 2)
      goto LABEL_86;
LABEL_64:
    swift_bridgeObjectRelease();
    goto LABEL_65;
  }
  if (v31 == 2 || ((v47 & 1) == 0) == (v31 != 0))
    goto LABEL_64;
LABEL_86:
  if (!*((_QWORD *)&v32 + 1))
  {
    if (!v40)
    {
      v41 = 1;
      return v41 & 1;
    }
    goto LABEL_65;
  }
  if (!v40)
  {
LABEL_65:
    swift_bridgeObjectRelease();
    v41 = 0;
    return v41 & 1;
  }
  if (v32 == __PAIR128__(v40, v39))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v41 = 1;
  }
  else
  {
    v41 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v41 & 1;
}

uint64_t type metadata accessor for StartCallPenetrationRateEventFilter()
{
  return objc_opt_self();
}

uint64_t method lookup function for StartCallPenetrationRateEventFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t SiriPenetrationRateCalculator.__allocating_init(calculationTasks:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SiriPenetrationRateCalculator.init(calculationTasks:logger:)(a1, a2);
  return v4;
}

double SiriPenetrationRateCalculator.timeBucketInSec.getter()
{
  return 60.0;
}

uint64_t SiriPenetrationRateCalculator.defaultLocale.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriPenetrationRateCalculator.init(calculationTasks:logger:)(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  char *v39;

  v3 = v2;
  v37 = a1;
  v38 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A8);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A2A3668();
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695BB00);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A2A35D8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23A2A35F0();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_timeBucketInSec) = 0x404E000000000000;
  v20 = objc_msgSend((id)objc_opt_self(), sel_autoupdatingCurrentLocale);
  sub_23A2A35C0();

  sub_23A2A35E4();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  sub_23A2A35CC();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v21 = sub_23A2A35B4();
  v22 = *(_QWORD *)(v21 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v11, 1, v21);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v24 = (uint64_t *)(v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
    v25 = sub_23A2A35A8();
    v27 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v21);
    *v24 = v25;
    v24[1] = v27;
    v28 = OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_conversationStream;
    sub_23A2A38CC();
    *(_QWORD *)(v3 + v28) = sub_23A2A38C0();
    sub_23A2A3644();
    v29 = v39;
    sub_23A2A3674();
    v30 = sub_23A2A3680();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48))(v29, 1, v30);
    if ((_DWORD)result != 1)
    {
      v31 = v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
      sub_23A2A3650();
      (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v31, v8, v36);
      *(_QWORD *)(v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calculationTasks) = v37;
      v32 = v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_logger;
      v33 = sub_23A2A3A04();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v32, v38, v33);
      return v3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23A28E424(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v3 + 256) = a1;
  *(_QWORD *)(v3 + 264) = v2;
  v5 = sub_23A2A3560();
  *(_QWORD *)(v3 + 272) = v5;
  *(_QWORD *)(v3 + 280) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 288) = swift_task_alloc();
  v6 = sub_23A2A3A04();
  *(_QWORD *)(v3 + 296) = v6;
  *(_QWORD *)(v3 + 304) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 312) = swift_task_alloc();
  *(_QWORD *)(v3 + 320) = swift_task_alloc();
  *(_QWORD *)(v3 + 328) = swift_task_alloc();
  v7 = swift_task_alloc();
  v8 = *a2;
  v9 = a2[1];
  *(_QWORD *)(v3 + 336) = v7;
  *(_QWORD *)(v3 + 344) = v8;
  *(_QWORD *)(v3 + 352) = v9;
  *(_OWORD *)(v3 + 360) = *((_OWORD *)a2 + 1);
  *(_QWORD *)(v3 + 376) = a2[4];
  *(_OWORD *)(v3 + 384) = *(_OWORD *)(a2 + 5);
  *(_QWORD *)(v3 + 400) = a2[7];
  return swift_task_switch();
}

uint64_t sub_23A28E504()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  os_log_type_t v13;
  uint8_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(_QWORD *@<X8>);
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  unsigned int *v30;
  double v31;
  objc_class **v32;
  objc_class *v33;
  objc_class *v34;
  char isUniquelyReferenced_nonNull_native;
  char v36;
  unint64_t v37;
  Class isa;
  _BOOL8 v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  Class v45;
  BOOL v46;
  Class v47;
  char v48;
  unint64_t v49;
  unint64_t v50;
  NSObject *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t inited;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  Class *v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  objc_class *v80;
  uint64_t v81;
  objc_class *v82;
  char v83;
  NSObject **v84;

  v1 = *(_QWORD *)(v0 + 392);
  v2 = *(_QWORD *)(v0 + 376);
  v3 = *(_QWORD *)(v0 + 360);
  v4 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 208) = sub_23A28C1DC(MEMORY[0x24BEE4AF8]);
  v84 = (NSObject **)(v0 + 208);
  *(_QWORD *)(v0 + 232) = sub_23A28A158(v4);
  v5 = v0 + 232;
  v6 = _s11DeepThought24LocaleChangingPointUtilsO03getcD6Points23featurizedConversationsSayAA07DateAndC4PairVGSay0aB15BiomeFoundation22FeaturizedConversationCG_tFZ_0(v1);
  v7 = _s11DeepThought24SiriPenetrationRateUtilsO07alignToC15ExecutionEvents04siriiJ00K8UIEvents0K13Conversations12timeDurationSay0aB15BiomeFoundation15FeaturizedEventCGAL_ALSayAI0R12ConversationCGSdtFZ_0(v3, v2, v1, 60.0);
  sub_23A2A37F4();
  swift_bridgeObjectRetain_n();
  v8 = sub_23A2A39EC();
  LOBYTE(v9) = sub_23A2A3B84();
  if (!os_log_type_enabled(v8, (os_log_type_t)v9))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_6;
  }
  v10 = swift_slowAlloc();
  *(_DWORD *)v10 = 134217984;
  if (!(v7 >> 62))
  {
    v11 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_4;
  }
LABEL_56:
  swift_bridgeObjectRetain();
  v11 = sub_23A2A3C74();
  swift_bridgeObjectRelease();
LABEL_4:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 248) = v11;
  sub_23A2A3BA8();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_23A27E000, v8, (os_log_type_t)v9, "marker: The size of siriExecutionEvents is %ld", (uint8_t *)v10, 0xCu);
  MEMORY[0x23B847BB8](v10, -1, -1);
LABEL_6:

  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 304) + 8);
  v12(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 296));
  v81 = (uint64_t)v6;
  sub_23A28EF0C(v7, (uint64_t)v6, (char *)v5);
  swift_bridgeObjectRelease();
  sub_23A2A37F4();
  v6 = sub_23A2A39EC();
  v13 = sub_23A2A3B84();
  if (os_log_type_enabled(v6, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v14 = 134217984;
    LOBYTE(v9) = (_BYTE)v14 + 12;
    swift_beginAccess();
    *(_QWORD *)(v5 + 8) = *(_QWORD *)(*(_QWORD *)v5 + 16);
    sub_23A2A3BA8();
    _os_log_impl(&dword_23A27E000, v6, v13, "marker: Counts are updated with SiriEvents. The size of counts is %ld", v14, 0xCu);
    MEMORY[0x23B847BB8](v14, -1, -1);
  }
  v67 = (Class *)(v5 - 16);
  v15 = *(_QWORD *)(v0 + 344);
  v16 = *(_QWORD *)(v0 + 328);
  v10 = *(_QWORD *)(v0 + 296);

  v12(v16, v10);
  swift_beginAccess();
  sub_23A290034(v15, v81, v5);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_23A2A37F4();
  v17 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRetain();
  v8 = sub_23A2A39EC();
  v18 = sub_23A2A3B84();
  v7 = v18;
  if (os_log_type_enabled(v8, v18))
  {
    v10 = 12;
    v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v19 = 134217984;
    *(_QWORD *)(v5 - 8) = *(_QWORD *)(v17 + 16);
    sub_23A2A3BA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A27E000, v8, (os_log_type_t)v7, "marker: Counts are updated with UIEvents. The size of counts is %ld", v19, 0xCu);
    MEMORY[0x23B847BB8](v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v69 = v12;
  v12(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 296));
  v20 = *(_QWORD *)(v0 + 232);
  v21 = *(_QWORD *)(v20 + 64);
  v71 = v0;
  v72 = v20 + 64;
  v22 = -1;
  v23 = -1 << *(_BYTE *)(v20 + 32);
  if (-v23 < 64)
    v22 = ~(-1 << -(char)v23);
  v24 = v22 & v21;
  v73 = (unint64_t)(63 - v23) >> 6;
  v75 = *(_QWORD *)(v0 + 232);
  swift_bridgeObjectRetain();
  v25 = 0;
  v0 = 0;
  if (v24)
  {
LABEL_14:
    v79 = (v24 - 1) & v24;
    v26 = __clz(__rbit64(v24)) | (v0 << 6);
    goto LABEL_29;
  }
  while (1)
  {
    v27 = v0 + 1;
    if (__OFADD__(v0, 1))
      goto LABEL_54;
    if (v27 >= v73)
      break;
    v28 = *(_QWORD *)(v72 + 8 * v27);
    ++v0;
    if (v28)
      goto LABEL_28;
    v0 = v27 + 1;
    if (v27 + 1 >= v73)
      break;
    v28 = *(_QWORD *)(v72 + 8 * v0);
    if (v28)
      goto LABEL_28;
    v0 = v27 + 2;
    if (v27 + 2 >= v73)
      break;
    v28 = *(_QWORD *)(v72 + 8 * v0);
    if (v28)
      goto LABEL_28;
    v29 = v27 + 3;
    if (v29 >= v73)
      break;
    v28 = *(_QWORD *)(v72 + 8 * v29);
    if (!v28)
    {
      while (1)
      {
        v0 = v29 + 1;
        if (__OFADD__(v29, 1))
          goto LABEL_55;
        if (v0 >= v73)
          goto LABEL_48;
        v28 = *(_QWORD *)(v72 + 8 * v0);
        ++v29;
        if (v28)
          goto LABEL_28;
      }
    }
    v0 = v29;
LABEL_28:
    v79 = (v28 - 1) & v28;
    v26 = __clz(__rbit64(v28)) + (v0 << 6);
LABEL_29:
    v30 = (unsigned int *)(*(_QWORD *)(v75 + 48) + 72 * v26);
    v7 = *v30;
    v31 = *((double *)v30 + 1);
    v5 = *((_QWORD *)v30 + 2);
    v10 = *((_QWORD *)v30 + 3);
    v9 = (objc_class *)*((_QWORD *)v30 + 5);
    v80 = (objc_class *)*((_QWORD *)v30 + 4);
    v6 = *((_QWORD *)v30 + 7);
    v82 = (objc_class *)*((_QWORD *)v30 + 6);
    v83 = *((_BYTE *)v30 + 64);
    v32 = (objc_class **)(*(_QWORD *)(v75 + 56) + 16 * v26);
    v34 = *v32;
    v33 = v32[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23A293138((uint64_t)v25);
    v8 = *v84;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v37 = sub_23A2913B8(v7, v31);
    isa = v8[2].isa;
    v39 = (v36 & 1) == 0;
    v40 = (uint64_t)isa + v39;
    if (__OFADD__(isa, v39))
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    v41 = v36;
    if ((uint64_t)v8[3].isa >= v40)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23A292400();
    }
    else
    {
      sub_23A291C08(v40, isUniquelyReferenced_nonNull_native);
      v42 = sub_23A2913B8(v7, v31);
      if ((v41 & 1) != (v43 & 1))
        return sub_23A2A3D64();
      v37 = v42;
    }
    v77 = (_QWORD *)v0;
    *v84 = v8;
    swift_bridgeObjectRelease();
    if ((v41 & 1) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v8[(v37 >> 6) + 8].isa = (Class)((uint64_t)v8[(v37 >> 6) + 8].isa | (1 << v37));
      v44 = (uint64_t)v8[6].isa + 16 * v37;
      *(_DWORD *)v44 = v7;
      *(double *)(v44 + 8) = v31;
      *((_QWORD *)v8[7].isa + v37) = MEMORY[0x24BEE4AF8];
      v45 = v8[2].isa;
      v0 = (uint64_t)v45 + 1;
      v46 = __OFADD__(v45, 1);
      swift_bridgeObjectRetain();
      if (v46)
        goto LABEL_53;
      v8[2].isa = (Class)v0;
    }
    v47 = v8[7].isa;
    swift_bridgeObjectRelease();
    v8 = *((_QWORD *)v47 + v37);
    v48 = swift_isUniquelyReferenced_nonNull_native();
    *((_QWORD *)v47 + v37) = v8;
    if ((v48 & 1) == 0)
    {
      v8 = sub_23A291164(0, (int64_t)v8[2].isa + 1, 1, v8);
      *((_QWORD *)v47 + v37) = v8;
    }
    v50 = (unint64_t)v8[2].isa;
    v49 = (unint64_t)v8[3].isa;
    if (v50 >= v49 >> 1)
    {
      v8 = sub_23A291164((_QWORD *)(v49 > 1), v50 + 1, 1, v8);
      *((_QWORD *)v47 + v37) = v8;
    }
    v24 = v79;
    v8[2].isa = (Class)(v50 + 1);
    v51 = &v8[11 * v50];
    LODWORD(v51[4].isa) = v7;
    *(double *)&v51[5].isa = v31;
    v51[6].isa = (Class)v5;
    v51[7].isa = (Class)v10;
    v51[8].isa = v80;
    v51[9].isa = v9;
    v51[10].isa = v82;
    v51[11].isa = (Class)v6;
    LOBYTE(v51[12].isa) = v83;
    *(Class *)((char *)&v51[12].isa + 4) = v34;
    *(Class *)((char *)&v51[13].isa + 4) = v33;
    v25 = sub_23A28EEFC;
    v0 = (uint64_t)v77;
    if (v79)
      goto LABEL_14;
  }
LABEL_48:
  swift_release();
  sub_23A2A37F4();
  v52 = sub_23A2A39EC();
  v53 = sub_23A2A3B84();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v54 = 134217984;
    swift_beginAccess();
    *v67 = (*v84)[2].isa;
    sub_23A2A3BA8();
    _os_log_impl(&dword_23A27E000, v52, v53, "marker: The size of countsToReport is %ld", v54, 0xCu);
    MEMORY[0x23B847BB8](v54, -1, -1);
  }
  v74 = *(_QWORD *)(v71 + 400);
  v70 = *(_QWORD *)(v71 + 384);
  v68 = *(_QWORD *)(v71 + 368);
  v55 = *(_QWORD *)(v71 + 352);
  v56 = *(_QWORD *)(v71 + 312);
  v57 = *(char **)(v71 + 288);
  v58 = *(_QWORD *)(v71 + 296);
  v59 = *(_QWORD *)(v71 + 264);
  v76 = *(_QWORD *)(v71 + 280);
  v78 = *(_QWORD *)(v71 + 272);
  v60 = *(_QWORD **)(v71 + 256);

  v69(v56, v58);
  static BookmarkUtils.getBookmarkEndTime(calendar:)((uint64_t (*)(char *, uint64_t, uint64_t))(v59+ OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar), v57);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695BB30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A4710;
  *(_QWORD *)(inited + 32) = v55;
  *(_QWORD *)(inited + 40) = v68;
  *(_QWORD *)(inited + 48) = v70;
  v62 = sub_23A296FCC(inited, (uint64_t)v57);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25695BB38);
  v63 = swift_initStackObject();
  *(_OWORD *)(v63 + 16) = xmmword_23A2A45A0;
  *(_QWORD *)(v63 + 32) = v74;
  v64 = sub_23A296FE0(v63, (uint64_t)v57);
  swift_setDeallocating();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v57, v78);
  swift_beginAccess();
  v65 = *(_QWORD *)(v71 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A293138((uint64_t)v25);
  *v60 = v65;
  v60[1] = v62;
  v60[2] = v64;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v71 + 8))();
}

void sub_23A28EEFC(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_23A28EF0C(unint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
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
  __int128 v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  BOOL v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(_QWORD);
  unint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint8_t *v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  uint64_t v80;
  void (*v81)(_QWORD *);
  char isUniquelyReferenced_nonNull_native;
  char v83;
  unint64_t v84;
  uint64_t v85;
  _BOOL8 v86;
  uint64_t v87;
  char v88;
  unint64_t v89;
  char v90;
  uint64_t result;
  uint64_t *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  __int128 v109;
  char *v110;
  char *v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  __int128 v137;
  uint64_t v138;
  unint64_t v139;
  char *v140;
  uint64_t v141;
  int v142;
  char *v143;
  char *v144;
  char *v145;
  uint64_t v146;
  _OWORD v147[4];
  char v148;
  uint64_t v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  char v154;

  v143 = a3;
  v106 = a2;
  v118 = sub_23A2A3A04();
  v117 = *(_QWORD *)(v118 - 8);
  MEMORY[0x24BDAC7A8](v118);
  v5 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_23A2A3614();
  v125 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  v124 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = sub_23A2A3620();
  v122 = *(_QWORD *)(v123 - 8);
  MEMORY[0x24BDAC7A8](v123);
  v121 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_23A2A35FC();
  v138 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v119 = (char *)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695BC70);
  MEMORY[0x24BDAC7A8](v12);
  v105 = (uint64_t)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = type metadata accessor for DateAndLocalePair();
  v103 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v98 = (uint64_t)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A2A3560();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v116 = (char *)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v132 = (uint64_t)&v92 - v19;
  if (a1 >> 62)
    goto LABEL_63;
  v20 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v22 = v20;
  if (!v20)
    return swift_bridgeObjectRelease();
LABEL_3:
  v23 = 0;
  v131 = v97 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  v92 = (uint64_t *)(v97 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
  v100 = a1 & 0xC000000000000001;
  v94 = a1 & 0xFFFFFFFFFFFFFF8;
  v93 = (char *)(a1 + 32);
  v96 = OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calculationTasks;
  v110 = (char *)v147 + 8;
  v114 = *MEMORY[0x24BDCF020];
  v113 = *MEMORY[0x24BDCF0B0];
  v112 = *MEMORY[0x24BDCF068];
  *(_QWORD *)&v21 = 136315138;
  v109 = v21;
  v108 = MEMORY[0x24BEE4AD8] + 8;
  v102 = xmmword_23A2A4A90;
  v95 = (char *)a1;
  v111 = v5;
  v115 = v11;
  v130 = v15;
  v134 = v16;
  v99 = v22;
  while (1)
  {
    if (v100)
    {
      v24 = v23;
      v25 = MEMORY[0x23B8475B8](v23, a1);
      v26 = __OFADD__(v24, 1);
      v27 = v24 + 1;
      if (v26)
        goto LABEL_60;
    }
    else
    {
      if (v23 >= *(_QWORD *)(v94 + 16))
        goto LABEL_62;
      v25 = *(_QWORD *)&v93[8 * v23];
      v28 = v23;
      swift_retain();
      v26 = __OFADD__(v28, 1);
      v27 = v28 + 1;
      if (v26)
      {
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        swift_bridgeObjectRetain();
        v22 = sub_23A2A3C74();
        if (!v22)
          return swift_bridgeObjectRelease();
        goto LABEL_3;
      }
    }
    v107 = v27;
    v5 = (char *)v25;
    sub_23A2A3824();
    v29 = v132;
    sub_23A2A3524();
    if ((_s11DeepThought10CustomDateO15isTodayOrFuture4date8calendarSb10Foundation0D0V_AG8CalendarVtFZ_0(v29, v131) & 1) == 0)
      break;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v29, v15);
    swift_release();
LABEL_5:
    v23 = v107;
    if (v107 == v99)
      return swift_bridgeObjectRelease();
  }
  v30 = *(_QWORD *)(v97 + v96);
  if (!((unint64_t)v30 >> 62))
  {
    v15 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15)
      goto LABEL_15;
    goto LABEL_56;
  }
  if (v30 < 0)
    v5 = *(char **)(v97 + v96);
  else
    v5 = (char *)(v30 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain_n();
  v15 = sub_23A2A3C74();
  swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_56:
    swift_bridgeObjectRelease();
    swift_release();
    v15 = v130;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v132, v130);
    a1 = (unint64_t)v95;
    goto LABEL_5;
  }
LABEL_15:
  v31 = (char *)v92[1];
  v101 = *v92;
  v139 = v30 & 0xC000000000000001;
  v32 = 4;
  v129 = v25;
  v133 = v31;
  v127 = v30;
  v128 = v15;
  while (1)
  {
    v5 = (char *)(v32 - 4);
    if (v139)
    {
      v33 = MEMORY[0x23B8475B8](v32 - 4, v30);
      v34 = v32 - 3;
      if (__OFADD__(v5, 1))
        goto LABEL_58;
    }
    else
    {
      v33 = swift_retain();
      v34 = v32 - 3;
      if (__OFADD__(v5, 1))
      {
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
        goto LABEL_60;
      }
    }
    v146 = v34;
    v5 = *(char **)(v33 + 24);
    a1 = *(_QWORD *)(v33 + 32);
    v142 = *(unsigned __int8 *)(v33 + 16);
    v35 = v33;
    v11 = *(char **)(a1 + 16);
    swift_bridgeObjectRetain();
    if ((((uint64_t (*)(uint64_t, char *, unint64_t))v11)(v25, v5, a1) & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    v140 = (char *)v35;
    v36 = sub_23A2A380C();
    v37 = sub_23A28FD84(v36, (void (*)(_QWORD))MEMORY[0x24BE2BA60], &qword_25695BC98, &qword_25695BC90, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23A292F80);
    v38 = sub_23A293238(v37);
    v40 = v39;
    swift_bridgeObjectRelease();
    v41 = sub_23A2A3818();
    v42 = (void (*)(_QWORD))MEMORY[0x24BE2BC10];
    v43 = sub_23A28FD84(v41, MEMORY[0x24BE2BC10], &qword_25695BC88, &qword_25695BC80, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23A292FD8);
    v136 = sub_23A293888(v43);
    v145 = v44;
    swift_bridgeObjectRelease();
    v45 = sub_23A2A3818();
    v46 = sub_23A28FD84(v45, v42, &qword_25695BC88, &qword_25695BC80, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23A292FD8);
    v47 = sub_23A293C38(v46);
    v49 = v48;
    swift_bridgeObjectRelease();
    v141 = v32;
    *((_QWORD *)&v137 + 1) = v40;
    *(_QWORD *)&v137 = v38;
    if (v49)
    {
      v135 = v47;
      v144 = v49;
      swift_bridgeObjectRelease();
    }
    else
    {
      v50 = v105;
      static LocaleChangingPointUtils.findLocaleChangingPoint(date:localeChangingPoints:)(v132, v106, v105);
      v51 = v104;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v103 + 48))(v50, 1, v104) == 1)
      {
        sub_23A2941B0(v50);
        v135 = v101;
        v144 = v31;
      }
      else
      {
        swift_bridgeObjectRelease();
        v52 = v50;
        v53 = v98;
        sub_23A2941F0(v52, v98);
        v54 = (uint64_t *)(v53 + *(int *)(v51 + 20));
        v55 = (char *)v54[1];
        v135 = *v54;
        v144 = v55;
        swift_bridgeObjectRetain();
        sub_23A294234(v53);
      }
    }
    v56 = v119;
    v57 = v120;
    (*(void (**)(char *, _QWORD, uint64_t))(v138 + 104))(v119, v114, v120);
    v58 = v122;
    v59 = v121;
    v60 = v123;
    (*(void (**)(char *, _QWORD, uint64_t))(v122 + 104))(v121, v113, v123);
    v61 = v125;
    v62 = v124;
    v63 = v126;
    (*(void (**)(char *, _QWORD, uint64_t))(v125 + 104))(v124, v112, v126);
    v64 = v115;
    sub_23A2A362C();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v63);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v138 + 8))(v56, v57);
    v16 = v134;
    v65 = v130;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v134 + 48))(v64, 1, v130) == 1)
      break;
    v66 = v116;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v116, v64, v65);
    sub_23A2A3530();
    v68 = v67;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v66, v65);
    LODWORD(v150) = 1;
    *((_QWORD *)&v150 + 1) = v68;
    v69 = v144;
    *(_QWORD *)&v151 = v135;
    *((_QWORD *)&v151 + 1) = v144;
    v152 = v137;
    *(_QWORD *)&v153 = v136;
    *((_QWORD *)&v153 + 1) = v145;
    v154 = v142;
    v70 = v111;
    sub_23A2A37F4();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v11 = (char *)sub_23A2A39EC();
    v71 = sub_23A2A3B84();
    if (os_log_type_enabled((os_log_t)v11, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc();
      v73 = swift_slowAlloc();
      *(_DWORD *)v72 = v109;
      v149 = v73;
      v147[2] = v152;
      v147[3] = v153;
      v148 = v154;
      v147[0] = v150;
      v147[1] = v151;
      v74 = AggregationKeys.description.getter();
      *(_QWORD *)&v147[0] = sub_23A288988(v74, v75, &v149);
      v16 = v134;
      sub_23A2A3BA8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A27E000, (os_log_t)v11, v71, "Updating key for %s", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B847BB8](v73, -1, -1);
      v76 = v72;
      v69 = v144;
      MEMORY[0x23B847BB8](v76, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v117 + 8))(v70, v118);
    v25 = v129;
    v31 = v133;
    v32 = v141;
    v77 = *(_QWORD *)v143;
    v15 = v128;
    a1 = (unint64_t)v140;
    if (*(_QWORD *)(*(_QWORD *)v143 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v11 = v145;
      swift_bridgeObjectRetain();
      v78 = sub_23A291348((double *)&v150);
      if ((v79 & 1) != 0)
      {
        v16 = *(unsigned int *)(*(_QWORD *)(v77 + 56) + 16 * v78);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v5 = v143;
        v81 = sub_23A28FFA0(v147, (double *)&v150);
        if ((*(_BYTE *)(v80 + 16) & 1) != 0)
        {
          ((void (*)(_OWORD *, _QWORD))v81)(v147, 0);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          if ((_DWORD)v16 == -1)
            goto LABEL_61;
          *(_DWORD *)v80 = v16 + 1;
          ((void (*)(_OWORD *, _QWORD))v81)(v147, 0);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        swift_release();
        v30 = v127;
        v16 = v134;
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 = (unint64_t)v11;
    }
    else
    {
      a1 = (unint64_t)v145;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v147[0] = *(_QWORD *)v143;
    v5 = *(char **)&v147[0];
    *(_QWORD *)v143 = 0x8000000000000000;
    v84 = sub_23A291348((double *)&v150);
    v85 = *((_QWORD *)v5 + 2);
    v86 = (v83 & 1) == 0;
    v87 = v85 + v86;
    if (__OFADD__(v85, v86))
      goto LABEL_59;
    v88 = v83;
    if (*((_QWORD *)v5 + 3) >= v87)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23A292210();
    }
    else
    {
      sub_23A291864(v87, isUniquelyReferenced_nonNull_native);
      v89 = sub_23A291348((double *)&v150);
      if ((v88 & 1) != (v90 & 1))
        goto LABEL_66;
      v84 = v89;
    }
    v31 = v133;
    v5 = *(char **)&v147[0];
    if ((v88 & 1) != 0)
    {
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)&v147[0] + 56) + 16 * v84) = v102;
    }
    else
    {
      sub_23A2958BC(v84, (uint64_t)&v150, 1, 0, *(_QWORD **)&v147[0]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    v11 = v69;
    *(_QWORD *)v143 = v5;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30 = v127;
    v32 = v141;
LABEL_17:
    ++v32;
    if (v146 == v15)
      goto LABEL_56;
  }
  __break(1u);
LABEL_66:
  result = sub_23A2A3D64();
  __break(1u);
  return result;
}

unint64_t sub_23A28FD84(unint64_t a1, void (*a2)(_QWORD), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;

  v5 = a1;
  if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0)
    goto LABEL_39;
  v6 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v16 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_4:
  if ((v6 & 0x4000000000000000) == 0)
  {
    v7 = *(_QWORD *)(v6 + 16);
    swift_bridgeObjectRelease();
    v8 = (unint64_t)v7 >> 1;
    goto LABEL_6;
  }
  while (1)
  {
    swift_retain();
    v7 = sub_23A2A3C74();
    swift_bridgeObjectRelease();
    swift_release();
    v15 = v7 >= 0 ? v7 : v7 + 1;
    if (v7 < -1)
      __break(1u);
    v8 = v15 >> 1;
LABEL_6:
    if ((unint64_t)(v7 + 1) < 3)
      return v6;
    for (i = 0; ; ++i)
    {
      v10 = i + 1;
      v5 = v7 - (i + 1);
      if (__OFSUB__(v7, i + 1))
        break;
      if (i != v5)
      {
        if ((v16 & 0xC000000000000001) != 0)
        {
          v12 = MEMORY[0x23B8475B8](i, v16);
          v13 = MEMORY[0x23B8475B8](v7 - (i + 1), v16);
        }
        else
        {
          if ((i & 0x8000000000000000) != 0)
            goto LABEL_33;
          v11 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (i >= v11)
            goto LABEL_34;
          v12 = *(_QWORD *)(v16 + 8 * i + 32);
          swift_retain();
          if ((v5 & 0x8000000000000000) != 0)
            goto LABEL_35;
          if (v5 >= v11)
            goto LABEL_37;
          v13 = *(_QWORD *)(v16 + 32 + 8 * v5);
          swift_retain();
        }
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v16 & 0x8000000000000000) != 0
          || (v16 & 0x4000000000000000) != 0)
        {
          sub_23A292A44(v16);
        }
        swift_release();
        *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * i + 0x20) = v13;
        sub_23A2A3B00();
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v16 & 0x8000000000000000) != 0
          || (v16 & 0x4000000000000000) != 0)
        {
          sub_23A292A44(v16);
        }
        if ((v5 & 0x8000000000000000) != 0)
          goto LABEL_36;
        if (v5 >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_38;
        swift_release();
        *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v12;
        sub_23A2A3B00();
      }
      if (v8 == v10)
        return v16;
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    v6 = (uint64_t)sub_23A292AAC(v5, a2, a3, a4, a5);
    v16 = v6;
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_4;
  }
}

void (*sub_23A28FFA0(_QWORD *a1, double *a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[4] = a2;
  sub_23A294270((uint64_t)a2);
  v4[5] = sub_23A292764(v4, a2);
  return sub_23A28FFFC;
}

void sub_23A28FFFC(_QWORD *a1)
{
  void *v1;
  uint64_t v2;

  v1 = (void *)*a1;
  v2 = *(_QWORD *)(*a1 + 32);
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  sub_23A2942B8(v2);
  free(v1);
}

uint64_t sub_23A290034(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char **v57;
  char *v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  void (*v62)(_QWORD *);
  char v63;
  uint64_t v64;
  _BOOL8 v65;
  uint64_t v66;
  char v67;
  unint64_t v68;
  char v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t result;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  unint64_t v89;
  const char *v90;
  unint64_t v91;
  char *v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  unint64_t v119;
  char **v120;
  int v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  char v130;

  v111 = a2;
  v110 = sub_23A2A3614();
  v109 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v108 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_23A2A3620();
  v106 = *(_QWORD *)(v107 - 8);
  MEMORY[0x24BDAC7A8](v107);
  v105 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_23A2A35FC();
  v117 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v103 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695BC70);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = type metadata accessor for DateAndLocalePair();
  v101 = *(_QWORD *)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102);
  v86 = (uint64_t)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A2A3560();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v100 = (char *)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  isUniquelyReferenced_nonNull_native = (uint64_t)&v77 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v77 - v22;
  if (a1 >> 62)
    goto LABEL_59;
  v24 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v25 = v24;
  if (!v24)
    return swift_bridgeObjectRelease();
LABEL_3:
  v26 = 0;
  v113 = v82 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  v81 = OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calculationTasks;
  v96 = (uint64_t *)(v82 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
  v84 = a1 & 0xC000000000000001;
  v79 = a1 & 0xFFFFFFFFFFFFFF8;
  v78 = a1 + 32;
  v95 = *MEMORY[0x24BDCF020];
  v94 = *MEMORY[0x24BDCF0B0];
  v93 = *MEMORY[0x24BDCF068];
  v92 = "with negative count";
  v91 = 0x800000023A2A9E70;
  v90 = "ODMSIRIUIVIEWMODE_UNKNOWN";
  v89 = 0x800000023A2A9E90;
  v87 = xmmword_23A2A4AA0;
  v99 = v10;
  v88 = v13;
  v98 = v15;
  v97 = v16;
  v116 = isUniquelyReferenced_nonNull_native;
  v83 = v25;
  v77 = a1;
  v120 = (char **)a3;
  v80 = v23;
  while (1)
  {
    if (v84)
    {
      v27 = v26;
      v114 = MEMORY[0x23B8475B8](v26, a1);
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        goto LABEL_56;
    }
    else
    {
      if (v26 >= *(_QWORD *)(v79 + 16))
        goto LABEL_58;
      v114 = *(_QWORD *)(v78 + 8 * v26);
      v30 = v26;
      swift_retain();
      v28 = __OFADD__(v30, 1);
      v29 = v30 + 1;
      if (v28)
      {
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        swift_bridgeObjectRetain();
        v25 = sub_23A2A3C74();
        if (!v25)
          return swift_bridgeObjectRelease();
        goto LABEL_3;
      }
    }
    v85 = v29;
    v31 = v114;
    v10 = (char *)v114;
    sub_23A2A3824();
    sub_23A2A3524();
    if ((_s11DeepThought10CustomDateO15isTodayOrFuture4date8calendarSb10Foundation0D0V_AG8CalendarVtFZ_0((uint64_t)v23, v113) & 1) == 0)break;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v23, v15);
    swift_release();
LABEL_5:
    v26 = v85;
    if (v85 == v83)
      return swift_bridgeObjectRelease();
  }
  v112 = *(_QWORD *)(v82 + v81);
  v10 = (char *)v112;
  if (!(v112 >> 62))
  {
    v32 = *(_QWORD *)((v112 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v32)
      goto LABEL_15;
    goto LABEL_50;
  }
  swift_bridgeObjectRetain_n();
  v31 = v114;
  v32 = sub_23A2A3C74();
  swift_bridgeObjectRelease();
  if (!v32)
  {
LABEL_50:
    swift_bridgeObjectRelease();
    swift_release();
    v23 = *(char **)(v16 + 8);
LABEL_51:
    v75 = v80;
    ((void (*)(char *, uint64_t))v23)(v80, v15);
    v23 = v75;
    goto LABEL_5;
  }
LABEL_15:
  v33 = v32;
  v34 = v112;
  v119 = v112 & 0xC000000000000001;
  v35 = 4;
  v118 = (char *)v33;
  while (1)
  {
    v10 = (char *)(v35 - 4);
    v123 = v35;
    if (v119)
    {
      v124 = MEMORY[0x23B8475B8](v35 - 4, v34);
      v23 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_53;
    }
    else
    {
      v124 = *(_QWORD *)(v34 + 8 * v35);
      swift_retain();
      v23 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
    }
    sub_23A2A3824();
    sub_23A2A3524();
    a1 = v124;
    v36 = *(char **)(v124 + 24);
    v37 = *(_QWORD *)(v124 + 32);
    v121 = *(unsigned __int8 *)(v124 + 16);
    v10 = v36;
    v38 = (*(uint64_t (**)(uint64_t))(v37 + 8))(v31);
    v122 = v23;
    if ((v38 & 1) != 0)
      break;
    v23 = *(char **)(v16 + 8);
    ((void (*)(uint64_t, uint64_t))v23)(isUniquelyReferenced_nonNull_native, v15);
    swift_release();
LABEL_17:
    v35 = v123 + 1;
    if (v122 == v118)
    {
      swift_bridgeObjectRelease();
      swift_release();
      a1 = v77;
      goto LABEL_51;
    }
  }
  v40 = *v96;
  v39 = v96[1];
  swift_bridgeObjectRetain();
  static LocaleChangingPointUtils.findLocaleChangingPoint(date:localeChangingPoints:)(isUniquelyReferenced_nonNull_native, v111, v13);
  v41 = v102;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v101 + 48))(v13, 1, v102) == 1)
  {
    *(_QWORD *)&v115 = v40;
    *((_QWORD *)&v115 + 1) = v39;
    sub_23A2941B0(v13);
  }
  else
  {
    swift_bridgeObjectRelease();
    v42 = v86;
    sub_23A2941F0(v13, v86);
    v43 = (_QWORD *)(v42 + *(int *)(v41 + 20));
    v44 = v43[1];
    *(_QWORD *)&v115 = *v43;
    *((_QWORD *)&v115 + 1) = v44;
    swift_bridgeObjectRetain();
    sub_23A294234(v42);
  }
  v45 = v103;
  v46 = v104;
  (*(void (**)(char *, _QWORD, uint64_t))(v117 + 104))(v103, v95, v104);
  v47 = v106;
  v48 = v105;
  v49 = v107;
  (*(void (**)(char *, _QWORD, uint64_t))(v106 + 104))(v105, v94, v107);
  v50 = v109;
  v51 = v108;
  v52 = v110;
  (*(void (**)(char *, _QWORD, uint64_t))(v109 + 104))(v108, v93, v110);
  v53 = v99;
  sub_23A2A362C();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
  (*(void (**)(char *, uint64_t))(v117 + 8))(v45, v46);
  v16 = v97;
  v15 = v98;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v97 + 48))(v53, 1, v98) != 1)
  {
    v54 = v100;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v100, v53, v15);
    sub_23A2A3530();
    v56 = v55;
    v23 = *(char **)(v16 + 8);
    ((void (*)(char *, uint64_t))v23)(v54, v15);
    LODWORD(v126) = 1;
    *((_QWORD *)&v126 + 1) = v56;
    a1 = *((_QWORD *)&v115 + 1);
    v127 = v115;
    *(_QWORD *)&v128 = 0xD000000000000019;
    *((_QWORD *)&v128 + 1) = v91;
    *(_QWORD *)&v129 = 0xD000000000000017;
    *((_QWORD *)&v129 + 1) = v89;
    v130 = v121;
    v57 = v120;
    v58 = *v120;
    v13 = (uint64_t)v90;
    if (*((_QWORD *)*v120 + 2))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a3 = v13 | 0x8000000000000000;
      swift_bridgeObjectRetain();
      v59 = sub_23A291348((double *)&v126);
      if ((v60 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = *(unsigned int *)(*((_QWORD *)v58 + 7) + 16 * v59 + 12);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v10 = (char *)v120;
        v62 = sub_23A28FFA0(&v125, (double *)&v126);
        if ((*(_BYTE *)(v61 + 16) & 1) == 0)
        {
          v34 = v112;
          v10 = (char *)v124;
          if ((_DWORD)isUniquelyReferenced_nonNull_native == -1)
            goto LABEL_57;
          *(_DWORD *)(v61 + 12) = isUniquelyReferenced_nonNull_native + 1;
          ((void (*)(char **, _QWORD))v62)(&v125, 0);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          isUniquelyReferenced_nonNull_native = v116;
          ((void (*)(uint64_t, uint64_t))v23)(v116, v15);
          v13 = v88;
          v31 = v114;
          goto LABEL_17;
        }
        ((void (*)(char **, _QWORD))v62)(&v125, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_47;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v57 = v120;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v125 = *v57;
    v10 = v125;
    *v57 = (char *)0x8000000000000000;
    a3 = sub_23A291348((double *)&v126);
    v64 = *((_QWORD *)v10 + 2);
    v65 = (v63 & 1) == 0;
    v66 = v64 + v65;
    if (__OFADD__(v64, v65))
      goto LABEL_54;
    v67 = v63;
    if (*((_QWORD *)v10 + 3) < v66)
    {
      sub_23A291864(v66, isUniquelyReferenced_nonNull_native);
      v10 = v125;
      v68 = sub_23A291348((double *)&v126);
      if ((v67 & 1) != (v69 & 1))
        goto LABEL_62;
      a3 = v68;
      isUniquelyReferenced_nonNull_native = (uint64_t)v125;
      if ((v67 & 1) == 0)
        goto LABEL_44;
LABEL_40:
      *(_OWORD *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 16 * a3) = v87;
LABEL_46:
      a3 = (unint64_t)v120;
      v10 = *v120;
      *v120 = (char *)isUniquelyReferenced_nonNull_native;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_47:
      isUniquelyReferenced_nonNull_native = v116;
      ((void (*)(uint64_t, uint64_t))v23)(v116, v15);
      v13 = v88;
      v31 = v114;
      v34 = v112;
      goto LABEL_17;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = (uint64_t)v125;
      if ((v63 & 1) != 0)
        goto LABEL_40;
    }
    else
    {
      v10 = (char *)&v125;
      sub_23A292210();
      isUniquelyReferenced_nonNull_native = (uint64_t)v125;
      if ((v67 & 1) != 0)
        goto LABEL_40;
    }
LABEL_44:
    *(_QWORD *)(isUniquelyReferenced_nonNull_native + 8 * (a3 >> 6) + 64) |= 1 << a3;
    v70 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + 72 * a3;
    v71 = v129;
    *(_OWORD *)(v70 + 32) = v128;
    *(_OWORD *)(v70 + 48) = v71;
    *(_BYTE *)(v70 + 64) = v130;
    v72 = v127;
    *(_OWORD *)v70 = v126;
    *(_OWORD *)(v70 + 16) = v72;
    *(_OWORD *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 16 * a3) = v87;
    v73 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16);
    v28 = __OFADD__(v73, 1);
    v74 = v73 + 1;
    if (v28)
      goto LABEL_55;
    *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = v74;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_46;
  }
  __break(1u);
LABEL_62:
  result = sub_23A2A3D64();
  __break(1u);
  return result;
}

uint64_t SiriPenetrationRateCalculator.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  v4 = sub_23A2A3668();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriPenetrationRateCalculator.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  v4 = sub_23A2A3668();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_23A290D60(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A290DC4;
  return sub_23A28E424(a1, a2);
}

uint64_t sub_23A290DC4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A290E10(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A290F44(a1, a2, a3, a4, &qword_25695BCA0, (uint64_t (*)(_QWORD))type metadata accessor for DateAndLocalePair);
}

_QWORD *sub_23A290E24(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25695BC78);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A293148(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A290F30(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A290F44(a1, a2, a3, a4, &qword_25695BC60, type metadata accessor for eventStreamMetadata);
}

uint64_t sub_23A290F44(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
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
    result = sub_23A2A3C5C();
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
    sub_23A293F10(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23A291150(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A290F44(a1, a2, a3, a4, &qword_25695BC58, type metadata accessor for conversationStreamMetadata);
}

_QWORD *sub_23A291164(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25695BC68);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 88);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[11 * v8 + 4])
          memmove(v12, a4 + 4, 88 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_23A293E20(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_23A291288(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A2A3D7C();
  sub_23A2A3AAC();
  v4 = sub_23A2A3DAC();
  return sub_23A291434(a1, a2, v4);
}

unint64_t sub_23A2912EC(uint64_t a1)
{
  uint64_t v2;

  sub_23A2A3D7C();
  sub_23A2A39E0();
  sub_23A2A3D88();
  v2 = sub_23A2A3DAC();
  return sub_23A291514(a1, v2);
}

unint64_t sub_23A291348(double *a1)
{
  uint64_t v2;

  sub_23A2A3D7C();
  AggregationKeys.hash(into:)();
  v2 = sub_23A2A3DAC();
  return sub_23A2915FC(a1, v2);
}

unint64_t sub_23A2913B8(int a1, double a2)
{
  uint64_t v4;

  sub_23A2A3D7C();
  sub_23A2A3D94();
  sub_23A2A3DA0();
  v4 = sub_23A2A3DAC();
  return sub_23A2917EC(a1, v4, a2);
}

unint64_t sub_23A291434(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A2A3D58() & 1) == 0)
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
      while (!v14 && (sub_23A2A3D58() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23A291514(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v6 = sub_23A2A39E0();
    if (v6 != sub_23A2A39E0())
    {
      v7 = ~v4;
      for (i = (i + 1) & v7; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v7)
      {
        v8 = sub_23A2A39E0();
        if (v8 == sub_23A2A39E0())
          break;
      }
    }
  }
  return i;
}

unint64_t sub_23A2915FC(double *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  double v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[12];
  char v25;
  char v26;
  char v27;
  char v28;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = ~v4;
    v7 = *(_QWORD *)(v2 + 48);
    v8 = *(_DWORD *)a1;
    v9 = a1[1];
    v21 = *((_OWORD *)a1 + 1);
    v22 = *((_OWORD *)a1 + 2);
    v23 = *((_OWORD *)a1 + 3);
    v24[0] = *((_BYTE *)a1 + 64);
    sub_23A294300(v24, &v25);
    do
    {
      v10 = v7 + 72 * v5;
      if (*(_DWORD *)v10 == v8 && *(double *)(v10 + 8) == v9)
      {
        v13 = *(_QWORD *)(v10 + 32);
        v12 = *(_QWORD *)(v10 + 40);
        v14 = *(_QWORD *)(v10 + 48);
        v15 = *(_QWORD *)(v10 + 56);
        v16 = *(unsigned __int8 *)(v10 + 64);
        v17 = *(_QWORD *)(v10 + 16) == (_QWORD)v21 && *(_QWORD *)(v10 + 24) == *((_QWORD *)&v21 + 1);
        if (v17 || (sub_23A2A3D58() & 1) != 0)
        {
          v18 = v13 == (_QWORD)v22 && v12 == *((_QWORD *)&v22 + 1);
          if (v18 || (sub_23A2A3D58() & 1) != 0)
          {
            v19 = v14 == (_QWORD)v23 && v15 == *((_QWORD *)&v23 + 1);
            if (v19 || (sub_23A2A3D58() & 1) != 0)
            {
              if (v16)
              {
                if (v16 == 1)
                {
                  sub_23A294300(&v25, &v27);
                  if (v27 == 1)
                    return v5;
                }
                else
                {
                  sub_23A294300(&v25, &v28);
                  if (v28 == 2)
                    return v5;
                }
              }
              else
              {
                sub_23A294300(&v25, &v26);
                if (!v26)
                  return v5;
              }
            }
          }
        }
      }
      v5 = (v5 + 1) & v6;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_23A2917EC(int a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v5 = -1 << *(_BYTE *)(v3 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = ~v5;
    do
    {
      v8 = *(_QWORD *)(v3 + 48) + 16 * result;
      if (*(double *)(v8 + 8) == a3 && *(_DWORD *)v8 == a1)
        break;
      result = (result + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_23A291864(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t result;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  int64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  int64_t v42;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7F8);
  v40 = a2;
  v5 = sub_23A2A3C8C();
  v6 = (_QWORD *)v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v36 = (_QWORD *)(v4 + 64);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v4 + 64);
    v35 = (unint64_t)(v7 + 63) >> 6;
    v38 = v5 + 64;
    result = swift_retain();
    v11 = 0;
    v39 = v4;
    v37 = v6;
    while (1)
    {
      if (v9)
      {
        v41 = (v9 - 1) & v9;
        v42 = v11;
        v14 = __clz(__rbit64(v9)) | (v11 << 6);
      }
      else
      {
        v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v15 >= v35)
          goto LABEL_23;
        v16 = v36[v15];
        v17 = v11 + 1;
        if (!v16)
        {
          v17 = v11 + 2;
          if (v11 + 2 >= v35)
            goto LABEL_23;
          v16 = v36[v17];
          if (!v16)
          {
            v18 = v11 + 3;
            if (v11 + 3 >= v35)
            {
LABEL_23:
              swift_release();
              if ((v40 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v4 + 32);
                if (v33 > 63)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v4 + 16) = 0;
              }
              break;
            }
            v16 = v36[v18];
            if (!v16)
            {
              while (1)
              {
                v17 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_30;
                if (v17 >= v35)
                  goto LABEL_23;
                v16 = v36[v17];
                ++v18;
                if (v16)
                  goto LABEL_20;
              }
            }
            v17 = v11 + 3;
          }
        }
LABEL_20:
        v41 = (v16 - 1) & v16;
        v42 = v17;
        v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      v19 = *(_QWORD *)(v4 + 56);
      v20 = *(_QWORD *)(v4 + 48) + 72 * v14;
      v21 = *(_DWORD *)v20;
      v22 = *(_QWORD *)(v20 + 8);
      v23 = *(_QWORD *)(v20 + 16);
      v25 = *(_QWORD *)(v20 + 24);
      v24 = *(_QWORD *)(v20 + 32);
      v26 = *(_QWORD *)(v20 + 40);
      v27 = *(_QWORD *)(v20 + 48);
      v28 = *(_QWORD *)(v20 + 56);
      v29 = *(_BYTE *)(v20 + 64);
      v30 = (uint64_t *)(v19 + 16 * v14);
      v32 = *v30;
      v31 = v30[1];
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_23A2A3D7C();
      sub_23A2A3D94();
      sub_23A2A3DA0();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A2A3AAC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23A2A3AAC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23A2A3AAC();
      swift_bridgeObjectRelease();
      sub_23A2A3D88();
      sub_23A2A3D88();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23A2A3DAC();
      v6 = v37;
      result = sub_23A2A3BD8();
      *(_QWORD *)(v38 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      v12 = v37[6] + 72 * result;
      *(_DWORD *)v12 = v21;
      *(_QWORD *)(v12 + 8) = v22;
      *(_QWORD *)(v12 + 16) = v23;
      *(_QWORD *)(v12 + 24) = v25;
      *(_QWORD *)(v12 + 32) = v24;
      *(_QWORD *)(v12 + 40) = v26;
      *(_QWORD *)(v12 + 48) = v27;
      *(_QWORD *)(v12 + 56) = v28;
      *(_BYTE *)(v12 + 64) = v29;
      v13 = (_QWORD *)(v37[7] + 16 * result);
      *v13 = v32;
      v13[1] = v31;
      ++v37[2];
      v4 = v39;
      v9 = v41;
      v11 = v42;
    }
  }
  result = swift_release();
  *v34 = v6;
  return result;
}

uint64_t sub_23A291C08(uint64_t a1, char a2)
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
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  char v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B800);
  v34 = a2;
  result = sub_23A2A3C8C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_33;
        v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_33;
          v21 = v33[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v32)
                  goto LABEL_33;
                v21 = v33[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(v5 + 48) + 16 * v19;
      v28 = *(_DWORD *)v27;
      v29 = *(_QWORD *)(v27 + 8);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v19);
      if ((v34 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_23A2A3D7C();
      sub_23A2A3D94();
      sub_23A2A3DA0();
      result = sub_23A2A3DAC();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = *(_QWORD *)(v7 + 48) + 16 * v16;
      *(_DWORD *)v17 = v28;
      *(_QWORD *)(v17 + 8) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v16) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_23A291F04(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7F0);
  v38 = a2;
  v6 = sub_23A2A3C8C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_23A2A3D7C();
    sub_23A2A3AAC();
    result = sub_23A2A3DAC();
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
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_23A292210()
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
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7F8);
  v2 = *v0;
  v3 = sub_23A2A3C80();
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
    v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      v9 = v29 + 1;
      if (v29 + 1 >= v13)
        goto LABEL_26;
      v30 = *(_QWORD *)(v6 + 8 * v9);
      if (!v30)
        break;
    }
LABEL_25:
    v12 = (v30 - 1) & v30;
    v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    v16 = 72 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 72 * v15;
    v18 = *(_DWORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v21 = *(_QWORD *)(v17 + 16);
    v20 = *(_QWORD *)(v17 + 24);
    v22 = *(_QWORD *)(v17 + 32);
    v23 = *(_QWORD *)(v17 + 40);
    v24 = *(_QWORD *)(v17 + 48);
    v25 = *(_QWORD *)(v17 + 56);
    LOBYTE(v17) = *(_BYTE *)(v17 + 64);
    v26 = 16 * v15;
    v27 = *(_QWORD *)(v4 + 48) + v16;
    v28 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v26);
    *(_DWORD *)v27 = v18;
    *(_QWORD *)(v27 + 8) = v19;
    *(_QWORD *)(v27 + 16) = v21;
    *(_QWORD *)(v27 + 24) = v20;
    *(_QWORD *)(v27 + 32) = v22;
    *(_QWORD *)(v27 + 40) = v23;
    *(_QWORD *)(v27 + 48) = v24;
    *(_QWORD *)(v27 + 56) = v25;
    *(_BYTE *)(v27 + 64) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v26) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v31 = v29 + 2;
  if (v31 >= v13)
    goto LABEL_26;
  v30 = *(_QWORD *)(v6 + 8 * v31);
  if (v30)
  {
    v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v9);
    ++v31;
    if (v30)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23A292400()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B800);
  v2 = *v0;
  v3 = sub_23A2A3C80();
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
    v17 = *(_QWORD *)(v2 + 48) + 16 * v15;
    v18 = *(_QWORD *)(v17 + 8);
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = *(_QWORD *)(v4 + 48) + v16;
    *(_DWORD *)v21 = *(_DWORD *)v17;
    *(_QWORD *)(v21 + 8) = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain();
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

id sub_23A2925B4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7F0);
  v2 = *v0;
  v3 = sub_23A2A3C80();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

void (*sub_23A292764(_QWORD *a1, double *a2))(uint64_t a1)
{
  _QWORD *v4;
  char isUniquelyReferenced_nonNull_native;

  v4 = malloc(0x58uLL);
  *a1 = v4;
  v4[8] = a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_23A294270((uint64_t)a2);
  v4[9] = sub_23A292A18(v4);
  v4[10] = sub_23A29283C(v4 + 4, a2, isUniquelyReferenced_nonNull_native);
  return sub_23A2927EC;
}

void sub_23A2927EC(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);
  uint64_t v3;

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  sub_23A2942B8(v3);
  v2(v1, 0);
  free(v1);
}

void (*sub_23A29283C(_QWORD *a1, double *a2, char a3))(uint64_t a1)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  unsigned __int8 v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t);

  v4 = v3;
  v8 = malloc(0x30uLL);
  *a1 = v8;
  v8[3] = a2;
  v8[4] = v4;
  v9 = *v4;
  v11 = sub_23A291348(a2);
  *((_BYTE *)v8 + 17) = v10 & 1;
  v12 = *(_QWORD *)(v9 + 16);
  v13 = v10 ^ 1;
  v14 = v12 + ((v10 ^ 1) & 1);
  if (__OFADD__(v12, (v10 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    v15 = v10;
    v16 = *(_QWORD *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[5] = v11;
      if ((v15 & 1) != 0)
      {
LABEL_8:
        v17 = (uint64_t *)(*(_QWORD *)(*v4 + 56) + 16 * v11);
        v18 = *v17;
        v19 = v17[1];
LABEL_12:
        *v8 = v18;
        v8[1] = v19;
        *((_BYTE *)v8 + 16) = v13 & 1;
        return sub_23A292968;
      }
LABEL_11:
      v18 = 0;
      v19 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_23A292210();
      goto LABEL_7;
    }
    sub_23A291864(v14, a3 & 1);
    v20 = sub_23A291348(a2);
    if ((v15 & 1) == (v21 & 1))
    {
      v11 = v20;
      v8[5] = v20;
      if ((v15 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t))sub_23A2A3D64();
  __break(1u);
  return result;
}

void sub_23A292968(uint64_t a1)
{
  void *v1;
  char v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD **v8;
  uint64_t *v9;
  uint64_t v10;

  v1 = *(void **)a1;
  v2 = *(_BYTE *)(*(_QWORD *)a1 + 17);
  if ((*(_BYTE *)(*(_QWORD *)a1 + 16) & 1) != 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)a1 + 17) & 1) != 0)
    {
      v3 = *((_QWORD *)v1 + 5);
      v4 = **((_QWORD **)v1 + 4);
      swift_arrayDestroy();
      sub_23A2959F8(v3, v4);
    }
  }
  else
  {
    v5 = *(_QWORD *)v1;
    v6 = *((_QWORD *)v1 + 1);
    v8 = (_QWORD **)*((_QWORD *)v1 + 4);
    v7 = *((_QWORD *)v1 + 5);
    if ((v2 & 1) != 0)
    {
      v9 = (uint64_t *)((*v8)[7] + 16 * v7);
      *v9 = v5;
      v9[1] = v6;
    }
    else
    {
      v10 = *((_QWORD *)v1 + 3);
      sub_23A2958BC(v7, v10, v5, v6, *v8);
      sub_23A294270(v10);
    }
  }
  free(v1);
}

uint64_t (*sub_23A292A18(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_23A292A38;
}

uint64_t sub_23A292A38(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

void sub_23A292A44(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A2A3C74();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B8475C4);
}

_QWORD *sub_23A292AAC(unint64_t a1, void (*a2)(_QWORD), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t);

  if (a1 >> 62)
    goto LABEL_10;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v10 <= 0)
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25695B660);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 25;
      v11[2] = v10;
      v11[3] = (2 * (v13 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_23A292D78((unint64_t)(v11 + 4), v10, a1, a2, a3, a4, a5);
    a5 = v14;
    swift_bridgeObjectRelease();
    if (a5 == (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))v10)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v10 = sub_23A2A3C74();
    swift_bridgeObjectRelease();
    if (!v10)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v11;
}

uint64_t sub_23A292BD0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A292BEC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A292BEC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695BC78);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23A2A3CA4();
  __break(1u);
  return result;
}

uint64_t sub_23A292D54(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_23A292D78(a1, a2, a3, (void (*)(_QWORD))MEMORY[0x24BE2BA60], &qword_25695BC98, &qword_25695BC90, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))sub_23A292F80);
}

uint64_t sub_23A292D78(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void (*v22)(_BYTE *, _QWORD);
  uint64_t *v23;
  uint64_t v24;
  uint64_t result;
  _BYTE v26[32];

  v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_23A2A3C74();
    swift_bridgeObjectRelease();
    if (!v15)
      return a3;
  }
  else
  {
    v15 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    v18 = sub_23A2A3C74();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        v19 = sub_23A294380(a5, a6);
        swift_bridgeObjectRetain();
        for (i = 0; i != v15; ++i)
        {
          v21 = __swift_instantiateConcreteTypeFromMangledName(a6);
          v22 = (void (*)(_BYTE *, _QWORD))a7(v26, i, a3, v21, v19);
          v24 = *v23;
          swift_retain();
          v22(v26, 0);
          *(_QWORD *)(a1 + 8 * i) = v24;
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
  v17 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_23A2A3CA4();
  __break(1u);
  return result;
}

uint64_t (*sub_23A292F80(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23A293058(v6, a2, a3);
  return sub_23A292FD4;
}

uint64_t (*sub_23A292FD8(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23A2930CC(v6, a2, a3);
  return sub_23A292FD4;
}

void sub_23A29302C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_23A293058(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x23B8475B8](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return sub_23A2930C4;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A2930C4()
{
  return swift_release();
}

uint64_t (*sub_23A2930CC(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x23B8475B8](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return sub_23A2943C0;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A293138(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A293148(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23A2A3CA4();
  __break(1u);
  return result;
}

unint64_t sub_23A293238(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;

  v2 = sub_23A2A3A04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23A2A3C74();
    v37 = v3;
    v38 = v2;
    if (v5)
    {
LABEL_3:
      sub_23A2A3794();
      if (v5 < 1)
      {
        __break(1u);
LABEL_68:
        v35 = sub_23A2A3D58();
        swift_bridgeObjectRelease();
        if ((v35 & 1) != 0)
          v2 += 6;
        return v2;
      }
      v6 = 0;
      v7 = a1 & 0xC000000000000001;
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v40 = a1;
      do
      {
        if (v7)
          MEMORY[0x23B8475B8](v6, a1);
        else
          swift_retain();
        sub_23A2A3788();
        sub_23A2A3800();
        swift_release();
        swift_bridgeObjectRelease();
        v10 = v43;
        if (v43)
        {
          v11 = (uint64_t)v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v8 = sub_23A290E24(0, v8[2] + 1, 1, v8);
          v13 = v8[2];
          v12 = v8[3];
          if (v13 >= v12 >> 1)
            v8 = sub_23A290E24((_QWORD *)(v12 > 1), v13 + 1, 1, v8);
          v8[2] = v13 + 1;
          v9 = &v8[2 * v13];
          v9[4] = v11;
          v9[5] = v10;
          a1 = v40;
        }
        ++v6;
      }
      while (v5 != v6);
      swift_bridgeObjectRelease();
      v14 = v8[2];
      if (v14)
        goto LABEL_16;
LABEL_30:
      v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
      goto LABEL_31;
    }
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v37 = v3;
    v38 = v2;
    if (v5)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  if (!v14)
    goto LABEL_30;
LABEL_16:
  v15 = v8 + 5;
  v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v20 = *(v15 - 1);
    v21 = *v15;
    if (v20)
      v22 = 0;
    else
      v22 = v21 == 0xE000000000000000;
    if (!v22 && (sub_23A2A3D58() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v42 = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_23A292BD0(0, v16[2] + 1, 1);
        v16 = v42;
      }
      v18 = v16[2];
      v17 = v16[3];
      if (v18 >= v17 >> 1)
      {
        sub_23A292BD0(v17 > 1, v18 + 1, 1);
        v16 = v42;
      }
      v16[2] = v18 + 1;
      v19 = &v16[2 * v18];
      v19[4] = v20;
      v19[5] = v21;
    }
    v15 += 2;
    --v14;
  }
  while (v14);
LABEL_31:
  swift_bridgeObjectRelease();
  if (v16[2])
  {
    v25 = v16[4];
    v24 = v16[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    v25 = 0;
    v24 = 0;
  }
  v26 = v39;
  swift_release();
  sub_23A2A37F4();
  swift_bridgeObjectRetain_n();
  v27 = sub_23A2A39EC();
  v28 = sub_23A2A3B84();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    *(_DWORD *)v29 = 136315138;
    v42 = (_QWORD *)v30;
    v31 = v25;
    if (v24)
      v32 = v25;
    else
      v32 = 0;
    if (v24)
      v33 = v24;
    else
      v33 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v41 = sub_23A288988(v32, v33, (uint64_t *)&v42);
    sub_23A2A3BA8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A27E000, v27, v28, "Get rawViewMode for this bucket is %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v30, -1, -1);
    MEMORY[0x23B847BB8](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v38);
  }
  else
  {
    v31 = v25;

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v38);
  }
  v2 = 0xD000000000000019;
  if (v24)
  {
    if (v31 == 48 && v24 == 0xE100000000000000 || (sub_23A2A3D58() & 1) != 0)
    {
LABEL_56:
      swift_bridgeObjectRelease();
      return v2;
    }
    if (v31 == 52 && v24 == 0xE100000000000000 || (sub_23A2A3D58() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 0xD00000000000001BLL;
    }
    if (v31 == 53 && v24 == 0xE100000000000000 || (sub_23A2A3D58() & 1) != 0)
      goto LABEL_56;
    if (v31 == 54 && v24 == 0xE100000000000000 || (sub_23A2A3D58() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 0xD000000000000014;
    }
    if (v31 == 55 && v24 == 0xE100000000000000 || (sub_23A2A3D58() & 1) != 0)
      goto LABEL_56;
    if (v31 == 56 && v24 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      return 0xD00000000000001FLL;
    }
    goto LABEL_68;
  }
  return v2;
}

uint64_t sub_23A293888(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = sub_23A2A3A04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_23A2A3C74();
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v26 = v3;
  v27 = v2;
  v28 = v5;
  if (v6)
  {
    result = sub_23A2A3734();
    if (v6 < 1)
    {
      __break(1u);
      return result;
    }
    v8 = 0;
    v9 = a1 & 0xC000000000000001;
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v29 = a1;
    do
    {
      if (v9)
        MEMORY[0x23B8475B8](v8, a1);
      else
        swift_retain();
      sub_23A2A3728();
      sub_23A2A38D8();
      swift_release();
      swift_bridgeObjectRelease();
      v12 = v32;
      if (v32)
      {
        v13 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v10 = sub_23A290E24(0, v10[2] + 1, 1, v10);
        v15 = v10[2];
        v14 = v10[3];
        if (v15 >= v14 >> 1)
          v10 = sub_23A290E24((_QWORD *)(v14 > 1), v15 + 1, 1, v10);
        v10[2] = v15 + 1;
        v11 = &v10[2 * v15];
        v11[4] = v13;
        v11[5] = v12;
        a1 = v29;
      }
      ++v8;
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    v5 = v28;
    if (v10[2])
      goto LABEL_17;
LABEL_19:
    v17 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_19;
LABEL_17:
  v17 = v10[4];
  v16 = v10[5];
  swift_bridgeObjectRetain();
LABEL_20:
  swift_bridgeObjectRelease();
  sub_23A2A37F4();
  swift_bridgeObjectRetain_n();
  v18 = sub_23A2A39EC();
  v19 = sub_23A2A3B84();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    *(_DWORD *)v20 = 136315138;
    v31 = v21;
    if (v16)
      v22 = v17;
    else
      v22 = 0;
    v23 = v17;
    if (v16)
      v24 = v16;
    else
      v24 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v30 = sub_23A288988(v22, v24, &v31);
    sub_23A2A3BA8();
    swift_bridgeObjectRelease_n();
    v17 = v23;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A27E000, v18, v19, "Get audioInputRoute for this bucket is %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v21, -1, -1);
    MEMORY[0x23B847BB8](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
  }
  if (v16)
    return v17;
  else
    return 0xD000000000000017;
}

uint64_t sub_23A293C38(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_18:
    swift_bridgeObjectRelease();
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    {
LABEL_16:
      v9 = v5[4];
      swift_bridgeObjectRetain();
LABEL_20:
      swift_bridgeObjectRelease();
      return v9;
    }
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  v2 = sub_23A2A3C74();
  if (!v2)
    goto LABEL_18;
LABEL_3:
  result = sub_23A2A374C();
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v10 = v2;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x23B8475B8](v4, a1);
      else
        swift_retain();
      sub_23A2A3740();
      sub_23A2A38D8();
      swift_release();
      swift_bridgeObjectRelease();
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_23A290E24(0, v5[2] + 1, 1, v5);
        v8 = v5[2];
        v7 = v5[3];
        if (v8 >= v7 >> 1)
          v5 = sub_23A290E24((_QWORD *)(v7 > 1), v8 + 1, 1, v5);
        v5[2] = v8 + 1;
        v6 = &v5[2 * v8];
        v6[4] = v11;
        v6[5] = v12;
        v2 = v10;
      }
      ++v4;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    if (v5[2])
      goto LABEL_16;
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A293E20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 88 * a1 + 32;
    v6 = a3 + 88 * v4;
    if (v5 >= v6 || v5 + 88 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23A2A3CA4();
  __break(1u);
  return result;
}

uint64_t sub_23A293F10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
  result = sub_23A2A3CA4();
  __break(1u);
  return result;
}

uint64_t sub_23A294028()
{
  return type metadata accessor for SiriPenetrationRateCalculator();
}

uint64_t type metadata accessor for SiriPenetrationRateCalculator()
{
  uint64_t result;

  result = qword_25695BB70;
  if (!qword_25695BB70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A29406C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = sub_23A2A3668();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateCalculator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPenetrationRateCalculator.__allocating_init(calculationTasks:logger:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SiriPenetrationRateCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 136) + *(_QWORD *)(*(_QWORD *)v2 + 136));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A2891C4;
  return v8(a1, a2);
}

uint64_t sub_23A2941B0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695BC70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A2941F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DateAndLocalePair();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A294234(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DateAndLocalePair();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A294270(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A2942B8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *sub_23A294300(_BYTE *a1, _BYTE *a2)
{
  __swift_memcpy1_1(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B847B04](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A294380(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B847B10](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SiriPenetrationRateCoreAnalyticsReporter.__allocating_init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = swift_allocObject();
  v5 = v4 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  v6 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  v7 = v4 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  v8 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
  return v4;
}

uint64_t SiriPenetrationRateCoreAnalyticsReporter.init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = v2 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  v6 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  v7 = v2 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  v8 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
  return v2;
}

uint64_t sub_23A2944E0(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v2[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B3D0);
  v4 = swift_task_alloc();
  v5 = *a1;
  v2[10] = v4;
  v2[11] = v5;
  return swift_task_switch();
}

uint64_t sub_23A294544()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  unint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v1 = (const void *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v2 + 64);
  v44 = v2 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(*(_QWORD *)(v0 + 88) + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & v3;
  v45 = (unint64_t)(63 - v5) >> 6;
  v46 = *(_QWORD *)(v0 + 88);
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (v6)
  {
    v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v10 = v9 | (v8 << 6);
LABEL_21:
    result = *(_QWORD *)(*(_QWORD *)(v46 + 56) + 8 * v10);
    v14 = *(_QWORD *)(result + 16);
    if (v14)
    {
      v47 = v6;
      v48 = v8;
      swift_bridgeObjectRetain();
      v15 = 0;
      do
      {
        v50 = v15;
        v51 = v14;
        v22 = *(_QWORD *)(v0 + 80);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v23 = sub_23A297678();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_23A2A368C();
        v24 = sub_23A2A36A4();
        v25 = *(_QWORD *)(v24 - 8);
        v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v22, 1, v24);
        v27 = *(_QWORD *)(v0 + 80);
        if (v26 == 1)
        {
          sub_23A2955E0(*(_QWORD *)(v0 + 80));
          v28 = objc_allocWithZone(MEMORY[0x24BEBA8F8]);
          v29 = v23;
          v30 = (void *)sub_23A2A3A64();
          v31 = (void *)sub_23A2A3A64();
          v32 = objc_msgSend(v28, sel_initWithBMLTTaskId_deploymentId_treatmentId_, v30, 0xFFFFFFFFLL, v31);

        }
        else
        {
          v32 = (id)sub_23A2A3698();
          (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v24);
        }
        v33 = (void *)sub_23A2A3A64();
        v34 = swift_allocObject();
        *(_QWORD *)(v34 + 16) = v23;
        *(_QWORD *)(v34 + 24) = v32;
        *(_QWORD *)(v0 + 48) = sub_23A29564C;
        *(_QWORD *)(v0 + 56) = v34;
        *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
        *(_QWORD *)(v0 + 24) = 1107296256;
        *(_QWORD *)(v0 + 32) = sub_23A29556C;
        *(_QWORD *)(v0 + 40) = &block_descriptor;
        v35 = _Block_copy(v1);
        v36 = v23;
        v37 = v32;
        swift_release();
        AnalyticsSendEventLazy();
        _Block_release(v35);

        v38 = v36;
        v39 = v37;
        v40 = v38;
        v41 = v39;
        v42 = sub_23A2A39EC();
        v43 = sub_23A2A3B84();
        if (os_log_type_enabled(v42, v43))
        {
          v16 = (uint8_t *)swift_slowAlloc();
          v17 = swift_slowAlloc();
          v52 = v17;
          *(_DWORD *)v16 = 136315138;
          v49 = v17;
          sub_23A294C70();
          sub_23A295668();
          v18 = sub_23A2A3A28();
          v20 = v19;
          swift_bridgeObjectRelease();
          *(_QWORD *)(v0 + 64) = sub_23A288988(v18, v20, &v52);
          sub_23A2A3BA8();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_23A27E000, v42, v43, "CoreAnalytics Reporter: reported task with stats, eventpayload=%s", v16, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B847BB8](v49, -1, -1);
          v21 = v16;
          v1 = (const void *)(v0 + 16);
          MEMORY[0x23B847BB8](v21, -1, -1);

        }
        else
        {

        }
        v15 = v50 + 88;
        v14 = v51 - 1;
      }
      while (v51 != 1);
      result = swift_bridgeObjectRelease();
      v6 = v47;
      v8 = v48;
    }
  }
  v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v11 >= v45)
    goto LABEL_30;
  v12 = *(_QWORD *)(v44 + 8 * v11);
  ++v8;
  if (v12)
    goto LABEL_20;
  v8 = v11 + 1;
  if (v11 + 1 >= v45)
    goto LABEL_30;
  v12 = *(_QWORD *)(v44 + 8 * v8);
  if (v12)
    goto LABEL_20;
  v8 = v11 + 2;
  if (v11 + 2 >= v45)
    goto LABEL_30;
  v12 = *(_QWORD *)(v44 + 8 * v8);
  if (v12)
  {
LABEL_20:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_21;
  }
  v13 = v11 + 3;
  if (v13 >= v45)
  {
LABEL_30:
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v12 = *(_QWORD *)(v44 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v45)
      goto LABEL_30;
    v12 = *(_QWORD *)(v44 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_20;
  }
LABEL_32:
  __break(1u);
  return result;
}

void SiriPentrationRateCoreAnalyticsPayload.init(_:_:)(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  if (a2)
  {
    v5 = a2;
  }
  else
  {
    v6 = objc_allocWithZone(MEMORY[0x24BEBA8F8]);
    v7 = a1;
    v8 = (void *)sub_23A2A3A64();
    v9 = (void *)sub_23A2A3A64();
    v5 = objc_msgSend(v6, sel_initWithBMLTTaskId_deploymentId_treatmentId_, v8, 0xFFFFFFFFLL, v9);

  }
  *a3 = a1;
  a3[1] = v5;
}

uint64_t static SiriPenetrationRateCoreAnalytics.report(payload:)(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[6];

  v1 = *(void **)a1;
  v2 = *(void **)(a1 + 8);
  v3 = (void *)sub_23A2A3A64();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v2;
  v10[4] = sub_23A29564C;
  v10[5] = v4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_23A29556C;
  v10[3] = &block_descriptor_7;
  v5 = _Block_copy(v10);
  v6 = v1;
  v7 = v2;
  swift_release();
  v8 = AnalyticsSendEventLazy();
  _Block_release(v5);

  return v8;
}

id sub_23A294C70()
{
  uint64_t v0;
  void *v1;
  void *v2;
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  id result;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  char v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  char v37;
  id v38;
  void *v39;
  uint64_t v40;
  char v41;
  id v42;
  void *v43;
  uint64_t v44;
  char v45;
  id v46;
  void *v47;
  uint64_t v48;
  char v49;
  id v50;
  void *v51;
  uint64_t v52;
  char v53;
  id v54;
  void *v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  v3 = sub_23A28A3E4(MEMORY[0x24BEE4AF8]);
  v67 = v3;
  v4 = objc_msgSend(v1, sel_metadata);
  if (v4 && (v5 = v4, v6 = objc_msgSend(v4, sel_odmId), v5, v6))
  {
    sub_23A2A3A70();

    v7 = sub_23A2A3A64();
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v58 = v3;
    sub_23A295EAC(v7, 0x64494D444FLL, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    v67 = v3;
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  result = objc_msgSend(v2, sel_bmltTaskId, v58);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v10 = (uint64_t)result;
  v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_23A295EAC(v10, 0xD000000000000011, 0x800000023A2AA000, v11);
  v12 = v67;
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v2, sel_treatmentId);
  if (!v13)
    goto LABEL_10;
  v14 = v13;
  v15 = sub_23A2A3A70();
  v17 = v16;

  v18 = HIBYTE(v17) & 0xF;
  if ((v17 & 0x2000000000000000) == 0)
    v18 = v15 & 0xFFFFFFFFFFFFLL;
  if (!v18)
  {
LABEL_10:
    v19 = objc_msgSend(v2, sel_factorPackId, v67);
    if (!v19)
    {
      swift_bridgeObjectRelease();

      v12 = v67;
      goto LABEL_14;
    }
    v20 = v19;
    sub_23A2A3A70();

    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v21 = sub_23A2A3A64();
  swift_bridgeObjectRelease();
  v22 = swift_isUniquelyReferenced_nonNull_native();
  v59 = v67;
  sub_23A295EAC(v21, 0xD000000000000010, 0x800000023A2AA020, v22);
  swift_bridgeObjectRelease();
LABEL_14:
  objc_msgSend(v2, sel_deploymentId, v59, v67);
  v23 = sub_23A2A3D70();
  v24 = swift_isUniquelyReferenced_nonNull_native();
  v60 = v12;
  sub_23A295EAC(v23, 0xD000000000000011, 0x800000023A2AA040, v24);
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v1, sel_dimensions);
  if (v25)
  {
    v26 = v25;
    objc_msgSend(v25, sel_productArea);

    v27 = sub_23A2A3B6C();
    v28 = swift_isUniquelyReferenced_nonNull_native();
    v60 = v12;
    sub_23A295EAC(v27, 0x6465747563657865, 0xEE006E69616D6F44, v28);
    swift_bridgeObjectRelease();
  }
  v29 = objc_msgSend(v1, sel_metadata, v60);
  if (v29)
  {
    v30 = v29;
    objc_msgSend(v29, sel_schedule);

    v31 = sub_23A2A3D70();
    v32 = swift_isUniquelyReferenced_nonNull_native();
    v61 = v12;
    sub_23A295EAC(v31, 0xD000000000000019, 0x800000023A2AA110, v32);
    swift_bridgeObjectRelease();
  }
  v33 = objc_msgSend(v1, sel_dimensions, v61);
  if (v33)
  {
    v34 = v33;
    v35 = objc_msgSend(v33, sel_siriInputLocale);

    if (v35)
    {
      sub_23A2A3A70();

      v36 = sub_23A2A3A64();
      swift_bridgeObjectRelease();
      v37 = swift_isUniquelyReferenced_nonNull_native();
      v62 = v12;
      sub_23A295EAC(v36, 0x61636F4C69726973, 0xEA0000000000656CLL, v37);
      swift_bridgeObjectRelease();
    }
  }
  v38 = objc_msgSend(v1, sel_metadata, v62);
  if (v38)
  {
    v39 = v38;
    objc_msgSend(v38, sel_aggregationWindowStartTimestamp);

    v40 = sub_23A2A3B54();
    v41 = swift_isUniquelyReferenced_nonNull_native();
    v63 = v12;
    sub_23A295EAC(v40, 0xD000000000000024, 0x800000023A2AA0E0, v41);
    swift_bridgeObjectRelease();
  }
  v42 = objc_msgSend(v1, sel_statistics, v63);
  if (v42)
  {
    v43 = v42;
    objc_msgSend(v42, sel_completedSystemTasks);

    v44 = sub_23A2A3DB8();
    v45 = swift_isUniquelyReferenced_nonNull_native();
    v64 = v12;
    sub_23A295EAC(v44, 0xD000000000000019, 0x800000023A2AA0C0, v45);
    swift_bridgeObjectRelease();
  }
  v46 = objc_msgSend(v1, sel_statistics, v64);
  if (v46)
  {
    v47 = v46;
    objc_msgSend(v46, sel_failedSystemTasks);

    v48 = sub_23A2A3DB8();
    v49 = swift_isUniquelyReferenced_nonNull_native();
    v65 = v12;
    sub_23A295EAC(v48, 0xD000000000000016, 0x800000023A2AA0A0, v49);
    swift_bridgeObjectRelease();
  }
  v50 = objc_msgSend(v1, sel_statistics, v65);
  if (v50)
  {
    v51 = v50;
    objc_msgSend(v50, sel_cancelledSystemTasks);

    v52 = sub_23A2A3DB8();
    v53 = swift_isUniquelyReferenced_nonNull_native();
    v66 = v12;
    sub_23A295EAC(v52, 0xD000000000000019, 0x800000023A2AA080, v53);
    swift_bridgeObjectRelease();
  }
  v54 = objc_msgSend(v1, sel_statistics, v66);
  if (v54)
  {
    v55 = v54;
    objc_msgSend(v54, sel_tasksPerformedWithUI);

    v56 = sub_23A2A3DB8();
    v57 = swift_isUniquelyReferenced_nonNull_native();
    sub_23A295EAC(v56, 0xD000000000000019, 0x800000023A2AA060, v57);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return (id)v12;
}

uint64_t sub_23A2953A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  v4 = sub_23A2A359C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t SiriPenetrationRateCoreAnalyticsReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  v4 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriPenetrationRateCoreAnalyticsReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  v4 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

id SiriPentrationRateCoreAnalyticsPayload.bmSiriTaskAggregation.getter()
{
  id *v0;

  return *v0;
}

void SiriPentrationRateCoreAnalyticsPayload.bmSiriTaskAggregation.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*SiriPentrationRateCoreAnalyticsPayload.bmSiriTaskAggregation.modify())()
{
  return nullsub_1;
}

id SiriPentrationRateCoreAnalyticsPayload.trialIds.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

void SiriPentrationRateCoreAnalyticsPayload.trialIds.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*SiriPentrationRateCoreAnalyticsPayload.trialIds.modify())()
{
  return nullsub_1;
}

id sub_23A29556C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_23A295668();
    v4 = (void *)sub_23A2A3A10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_23A2955E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B3D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A295620()
{
  uint64_t v0;

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

unint64_t sub_23A295668()
{
  unint64_t result;

  result = qword_25695BCC0;
  if (!qword_25695BCC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25695BCC0);
  }
  return result;
}

id sub_23A2956A4()
{
  return sub_23A294C70();
}

uint64_t sub_23A2956D4()
{
  return type metadata accessor for SiriPenetrationRateCoreAnalyticsReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateCoreAnalyticsReporter()
{
  uint64_t result;

  result = qword_25695BCF0;
  if (!qword_25695BCF0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A295718()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = sub_23A2A359C();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateCoreAnalyticsReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPenetrationRateCoreAnalyticsReporter.__allocating_init(_:odmId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

_QWORD *initializeBufferWithCopyOfBuffer for SiriPentrationRateCoreAnalyticsPayload(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for SiriPentrationRateCoreAnalyticsPayload(id *a1)
{

}

uint64_t assignWithCopy for SiriPentrationRateCoreAnalyticsPayload(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for SiriPentrationRateCoreAnalyticsPayload(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for SiriPentrationRateCoreAnalyticsPayload()
{
  return &type metadata for SiriPentrationRateCoreAnalyticsPayload;
}

ValueMetadata *type metadata accessor for SiriPenetrationRateCoreAnalytics()
{
  return &type metadata for SiriPenetrationRateCoreAnalytics;
}

unint64_t sub_23A2958BC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = a5[6] + 72 * result;
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v5 + 48) = v6;
  *(_BYTE *)(v5 + 64) = *(_BYTE *)(a2 + 64);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v7;
  v8 = (_QWORD *)(a5[7] + 16 * result);
  *v8 = a3;
  v8[1] = a4;
  v9 = a5[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a5[2] = v11;
  return result;
}

uint64_t sub_23A29592C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23A291288(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23A2925B4();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_23A295CD8(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_23A2959F8(unint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v2 = a2;
  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A2A3BCC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v21 = v4;
      v22 = v2;
      v23 = (result + 1) & v7;
      do
      {
        v24 = 72 * v6;
        sub_23A2A3D7C();
        sub_23A2A3D94();
        sub_23A2A3DA0();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23A2A3AAC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_23A2A3AAC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_23A2A3AAC();
        swift_bridgeObjectRelease();
        sub_23A2A3D88();
        sub_23A2A3D88();
        v8 = sub_23A2A3DAC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v9 = v8 & v7;
        if (v3 >= (uint64_t)v23)
        {
          if (v9 < v23)
          {
            v4 = v21;
            v2 = v22;
          }
          else
          {
            v4 = v21;
            v2 = v22;
            if (v3 >= (uint64_t)v9)
              goto LABEL_12;
          }
        }
        else
        {
          v4 = v21;
          v2 = v22;
          if (v9 >= v23 || v3 >= (uint64_t)v9)
          {
LABEL_12:
            v10 = *(_QWORD *)(v2 + 48);
            result = v10 + 72 * v3;
            v11 = (const void *)(v10 + v24);
            if (72 * v3 < v24 || result >= (unint64_t)v11 + 72 || v3 != v6)
              result = (unint64_t)memmove((void *)result, v11, 0x48uLL);
            v12 = *(_QWORD *)(v2 + 56);
            v13 = (_OWORD *)(v12 + 16 * v3);
            v14 = (_OWORD *)(v12 + 16 * v6);
            if (v3 != v6 || (v3 = v6, v13 >= v14 + 1))
            {
              *v13 = *v14;
              v3 = v6;
            }
          }
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v15 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v16 = *v15;
    v17 = (-1 << v3) - 1;
  }
  else
  {
    v15 = (uint64_t *)(v4 + 8 * (result >> 6));
    v17 = *v15;
    v16 = (-1 << result) - 1;
  }
  *v15 = v17 & v16;
  v18 = *(_QWORD *)(v2 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = v20;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

unint64_t sub_23A295CD8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A2A3BCC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A2A3D7C();
        swift_bridgeObjectRetain();
        sub_23A2A3AAC();
        v9 = sub_23A2A3DAC();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_23A295EAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23A291288(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
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
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_23A2925B4();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_23A291F04(v15, a4 & 1);
  v20 = sub_23A291288(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_23A2A3D64();
  __break(1u);
}

uint64_t BatchReporter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t BookmarkedReporter.__allocating_init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 80) - 8) + 32))(v4 + *(_QWORD *)(*(_QWORD *)v4 + 96), a1);
  *(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 104)) = a2;
  return v4;
}

uint64_t BatchReporter.init(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_23A2960C0(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[3] = a1;
  v2[4] = v1;
  v3 = *v1;
  v2[5] = *v1;
  v4 = *(_QWORD *)(v3 + 80);
  v2[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[7] = v5;
  v2[8] = *(_QWORD *)(v5 + 64);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A296138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 88) = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 16);
  v2 = swift_bridgeObjectRetain();
  if (MEMORY[0x23B8474E0](v2, v1))
  {
    v3 = sub_23A2A3B24();
    sub_23A2A3B0C();
    if ((v3 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88)+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 56) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 56) + 80)), *(_QWORD *)(v0 + 48));
LABEL_4:
      *(_QWORD *)(v0 + 96) = 1;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 32))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 48));
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v4;
      *v4 = v0;
      v4[1] = sub_23A2962AC;
      return sub_23A2A36B0();
    }
    v6 = *(_QWORD *)(v0 + 64);
    result = sub_23A2A3C08();
    if (v6 == 8)
    {
      v7 = result;
      v8 = *(_QWORD *)(v0 + 80);
      v9 = *(_QWORD *)(v0 + 48);
      v10 = *(_QWORD *)(v0 + 56);
      *(_QWORD *)(v0 + 16) = v7;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v0 + 16, v9);
      swift_unknownObjectRelease();
      goto LABEL_4;
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_23A2962AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A296318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 48);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 72), v3);
  if (v2 == MEMORY[0x23B8474E0](v1, v3))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = *(_QWORD *)(v0 + 96);
  v6 = sub_23A2A3B24();
  sub_23A2A3B0C();
  if ((v6 & 1) != 0)
  {
    result = (*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88)+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 56) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 56) + 80))+ *(_QWORD *)(*(_QWORD *)(v0 + 56) + 72) * v5, *(_QWORD *)(v0 + 48));
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 64);
    result = sub_23A2A3C08();
    if (v8 != 8)
      goto LABEL_10;
    v9 = *(_QWORD *)(v0 + 80);
    v10 = *(_QWORD *)(v0 + 48);
    v11 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(v0 + 16) = result;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v0 + 16, v10);
    result = swift_unknownObjectRelease();
  }
  *(_QWORD *)(v0 + 96) = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 32))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 48));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v7;
    *v7 = v0;
    v7[1] = sub_23A2962AC;
    return sub_23A2A36B0();
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_23A2964A8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t BatchReporter.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BatchReporter.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A296538(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A2891C4;
  return sub_23A2960C0(a1);
}

uint64_t BookmarkedReporter.init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 80) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 96), a1);
  *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 104)) = a2;
  return v2;
}

uint64_t sub_23A2965D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  _QWORD *v6;

  v2[12] = a1;
  v2[13] = v1;
  v3 = type metadata accessor for conversationStreamMetadata(0);
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  v2[17] = swift_task_alloc();
  v4 = type metadata accessor for eventStreamMetadata(0);
  v2[18] = v4;
  v2[19] = *(_QWORD *)(v4 - 8);
  v2[20] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[21] = AssociatedTypeWitness;
  v2[22] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v2[23] = swift_task_alloc();
  v6 = (_QWORD *)swift_task_alloc();
  v2[24] = v6;
  *v6 = v2;
  v6[1] = sub_23A296704;
  return sub_23A2A36B0();
}

uint64_t sub_23A296704()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A2967A0()
{
  uint64_t v0;
  _QWORD *v1;
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
  id v13;
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
  id v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 16))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 168));
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695BDA0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v1 = (_QWORD *)(v0 + 16);
    sub_23A296D18((__int128 *)(v0 + 56), v0 + 16);
    v2 = *(_QWORD *)(v0 + 40);
    v3 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v2);
    v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
    v5 = *(_QWORD *)(v4 + 16);
    if (v5)
    {
      v6 = *(_QWORD *)(v0 + 152);
      v30 = *(_QWORD *)(v0 + 160) + *(int *)(*(_QWORD *)(v0 + 144) + 20);
      v28 = *(_QWORD *)(*(_QWORD *)(v0 + 104) + *(_QWORD *)(**(_QWORD **)(v0 + 104) + 104));
      v7 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      v8 = *(_QWORD *)(v6 + 72);
      do
      {
        v9 = *(_QWORD *)(v0 + 160);
        v10 = *(_QWORD *)(v0 + 136);
        sub_23A28C340(v7, v9, type metadata accessor for eventStreamMetadata);
        v11 = sub_23A2A3560();
        v12 = *(_QWORD *)(v11 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v30, v11);
        sub_23A28C384(v9, type metadata accessor for eventStreamMetadata);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
        v13 = *(id *)(v28 + 16);
        sub_23A2A3854();

        sub_23A2874C8(v10, &qword_25695B2A0);
        v7 += v8;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      v1 = (_QWORD *)(v0 + 16);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v15 = *(_QWORD *)(v0 + 40);
    v16 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1(v1, v15);
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v19 = *(_QWORD *)(v0 + 120);
      v31 = *(_QWORD *)(v0 + 128) + *(int *)(*(_QWORD *)(v0 + 112) + 20);
      v29 = *(_QWORD *)(*(_QWORD *)(v0 + 104) + *(_QWORD *)(**(_QWORD **)(v0 + 104) + 104));
      v20 = v17 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
      v21 = *(_QWORD *)(v19 + 72);
      do
      {
        v22 = *(_QWORD *)(v0 + 128);
        v23 = *(_QWORD *)(v0 + 136);
        sub_23A28C340(v20, v22, type metadata accessor for conversationStreamMetadata);
        v24 = sub_23A2A3560();
        v25 = *(_QWORD *)(v24 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v23, v31, v24);
        sub_23A28C384(v22, type metadata accessor for conversationStreamMetadata);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v25 + 56))(v23, 0, 1, v24);
        v26 = *(id *)(v29 + 16);
        sub_23A2A3848();

        sub_23A2874C8(v23, &qword_25695B2A0);
        v20 += v21;
        --v18;
      }
      while (v18);
    }
    swift_bridgeObjectRelease();
    v27 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v27;
    *v27 = v0;
    v27[1] = sub_23A296B10;
    return sub_23A287B74();
  }
  else
  {
    *(_QWORD *)(v0 + 88) = 0;
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    sub_23A2874C8(v0 + 56, qword_25695BDA8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A296B10()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A296B74()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A296BD8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t BookmarkedReporter.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  swift_release();
  return v0;
}

uint64_t BookmarkedReporter.__deallocating_deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23A296CC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23A28C414;
  return sub_23A2965D4(a1);
}

uint64_t sub_23A296D18(__int128 *a1, uint64_t a2)
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

uint64_t sub_23A296D30()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_23A296D4C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BatchReporter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BatchReporter);
}

uint64_t method lookup function for BatchReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BatchReporter.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of BatchReporter.report(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 112) + *(_QWORD *)(*(_QWORD *)v1 + 112));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A2891C4;
  return v6(a1);
}

uint64_t sub_23A296E14()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for BookmarkedReporter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BookmarkedReporter);
}

uint64_t method lookup function for BookmarkedReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BookmarkedReporter.__allocating_init(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BookmarkedReporter.report(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A28C414;
  return v6(a1);
}

uint64_t static StreamUtils.getEventStreamMetadata(bookmarkableEventStreams:endTime:)(uint64_t a1, uint64_t a2)
{
  return sub_23A296FF4(a1, a2, type metadata accessor for eventStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_23A290F30);
}

uint64_t static StreamUtils.getConversationStreamMetadata(bookmarkableConversationStreams:endTime:)(uint64_t a1, uint64_t a2)
{
  return sub_23A296FF4(a1, a2, type metadata accessor for conversationStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_23A291150);
}

uint64_t eventStreamMetadata.eventType.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t eventStreamMetadata.endTime.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A296F80(type metadata accessor for eventStreamMetadata, a1);
}

uint64_t conversationStreamMetadata.endTime.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23A296F80(type metadata accessor for conversationStreamMetadata, a1);
}

uint64_t sub_23A296F80@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1(0) + 20);
  v5 = sub_23A2A3560();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_23A296FCC(uint64_t a1, uint64_t a2)
{
  return sub_23A296FF4(a1, a2, type metadata accessor for eventStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_23A290F30);
}

uint64_t sub_23A296FE0(uint64_t a1, uint64_t a2)
{
  return sub_23A296FF4(a1, a2, type metadata accessor for conversationStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_23A291150);
}

uint64_t sub_23A296FF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(BOOL, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t (*v18)(BOOL, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD);

  v20 = a2;
  v21 = a3;
  v19 = a3(0);
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v8 = (char *)&v18 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    return MEMORY[0x24BEE4AF8];
  v18 = a4;
  v10 = sub_23A2A3560();
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v12 = 0;
  v13 = MEMORY[0x24BEE4AF8];
  do
  {
    v14 = *(_QWORD *)(a1 + 8 * v12 + 32);
    v11(&v8[*(int *)(v19 + 20)], v20, v10);
    *(_QWORD *)v8 = v14;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = v18(0, *(_QWORD *)(v13 + 16) + 1, 1, v13);
    v16 = *(_QWORD *)(v13 + 16);
    v15 = *(_QWORD *)(v13 + 24);
    if (v16 >= v15 >> 1)
      v13 = v18(v15 > 1, v16 + 1, 1, v13);
    ++v12;
    *(_QWORD *)(v13 + 16) = v16 + 1;
    sub_23A297580((uint64_t)v8, v13+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v16, v21);
  }
  while (v9 != v12);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t type metadata accessor for eventStreamMetadata(uint64_t a1)
{
  return sub_23A2971A4(a1, qword_25695BF28);
}

uint64_t type metadata accessor for conversationStreamMetadata(uint64_t a1)
{
  return sub_23A2971A4(a1, qword_25695BFB8);
}

uint64_t sub_23A2971A4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t getEnumTagSinglePayload for eventStreamMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for eventStreamMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *_s11DeepThought19eventStreamMetadataVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_23A2A3560();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t _s11DeepThought19eventStreamMetadataVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_23A2A3560();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *_s11DeepThought19eventStreamMetadataVwcp_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A2A3560();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *_s11DeepThought19eventStreamMetadataVwca_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A2A3560();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *_s11DeepThought19eventStreamMetadataVwtk_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A2A3560();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *_s11DeepThought19eventStreamMetadataVwta_0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_23A2A3560();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for conversationStreamMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_23A2A3560();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for conversationStreamMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_23A2A3560();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_23A2974E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3560();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of BookmarkedResult.eventStreamMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BookmarkedResult.conversationStreamMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for StreamUtils()
{
  return &type metadata for StreamUtils;
}

uint64_t sub_23A297580(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t SiriPentrationRateReporter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SiriPenetrationRateBiomeReporter.__allocating_init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator) = a1;
  v7 = v6 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  v8 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
  v9 = v6 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  v10 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a3, v10);
  return v6;
}

id sub_23A297678()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = sub_23A2A3560();
  v33 = *(_QWORD *)(v1 - 8);
  v34 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  v5 = *((_QWORD *)v0 + 3);
  v32 = *((_QWORD *)v0 + 2);
  HIDWORD(v31) = *((unsigned __int8 *)v0 + 64);
  if (v4 == 30)
    v6 = 3;
  else
    v6 = 0;
  if (v4 == 7)
    v7 = 2;
  else
    v7 = v6;
  v8 = (void *)sub_23A2A3B54();
  if (v4 != 30)
  {
    if (v4 == 1)
      v9 = 1;
    else
      v9 = v7;
    if (v4 == 7)
      v7 = v7;
    else
      v7 = v9;
  }
  v10 = (void *)sub_23A2A3B54();
  sub_23A2A3578();
  v11 = objc_allocWithZone(MEMORY[0x24BE0C770]);
  v12 = (void *)sub_23A2A3A64();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithSchedule_aggregationWindowStartTimestamp_aggregationWindowEndTimestamp_odmId_, v7, v8, v10, v12);

  v14 = (void *)sub_23A2A3DB8();
  sub_23A2983F4();
  v15 = (void *)sub_23A2A3B9C();
  v16 = (void *)sub_23A2A3B9C();
  v17 = (void *)sub_23A2A3DB8();
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C778]), sel_initWithCompletedSystemTasks_failedSystemTasks_cancelledSystemTasks_tasksPerformedWithUI_, v14, v15, v16, v17);

  v19 = (HIDWORD(v31) + 1);
  v20 = objc_allocWithZone(MEMORY[0x24BDD1760]);
  swift_bridgeObjectRetain_n();
  v21 = objc_msgSend(v20, sel_init);
  v22 = objc_msgSend(v21, sel_operatingSystemVersionString);

  v23 = sub_23A2A3A70();
  v25 = v24;

  v26 = objc_allocWithZone(MEMORY[0x24BE0C768]);
  v27 = sub_23A29811C(v19, v32, v5, v32, v5, 0x6E776F6E6B6E75, 0xE700000000000000, 0x6E776F6E6B6E75, 0xE700000000000000, v23, v25);
  sub_23A2A3554();
  sub_23A2A3530();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v3, v34);
  v28 = (void *)sub_23A2A3B54();
  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C760]), sel_initWithAbsoluteTimestamp_metadata_statistics_dimensions_, v28, v13, v18, v27);

  return v29;
}

uint64_t sub_23A2979C4()
{
  return swift_task_switch();
}

uint64_t sub_23A2979D8()
{
  return sub_23A2A3C68();
}

uint64_t SiriPentrationRateReporter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_23A297A54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(**(_QWORD **)v1 + 80) + *(_QWORD *)(**(_QWORD **)v1 + 80));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A290DC4;
  return v6(a1);
}

uint64_t SiriPenetrationRateBiomeReporter.odmId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  v4 = sub_23A2A359C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SiriPenetrationRateBiomeReporter.init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v3 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator) = a1;
  v6 = v3 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  v7 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, a2, v7);
  v8 = v3 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  v9 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a3, v9);
  return v3;
}

uint64_t sub_23A297B90(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_23A297BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[8];
  char v44;
  __int128 v45;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = v0 + 24;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v3 + 64);
  v35 = v2;
  v36 = v3 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(v3 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & v4;
  v34 = OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator;
  v37 = (unint64_t)(63 - v6) >> 6;
  v38 = *(_QWORD *)(v1 + 8);
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (v7)
  {
    v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v11 = v10 | (v9 << 6);
LABEL_21:
    v15 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8 * v11);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v39 = v7;
      v40 = v9;
      v42 = *(_QWORD *)(v35 + v34);
      swift_bridgeObjectRetain_n();
      v17 = 0;
      v41 = v15;
      do
      {
        v22 = *(_QWORD *)(v15 + v17 + 40);
        v23 = *(_QWORD *)(v15 + v17 + 48);
        v24 = *(_QWORD *)(v15 + v17 + 56);
        v25 = *(_QWORD *)(v15 + v17 + 64);
        v26 = *(_QWORD *)(v15 + v17 + 72);
        v27 = *(_QWORD *)(v15 + v17 + 80);
        v28 = *(_QWORD *)(v15 + v17 + 88);
        v29 = *(_BYTE *)(v15 + v17 + 96);
        LODWORD(v43[0]) = *(_DWORD *)(v15 + v17 + 32);
        v43[1] = v22;
        v43[2] = v23;
        v43[3] = v24;
        v43[4] = v25;
        v43[5] = v26;
        v43[6] = v27;
        v43[7] = v28;
        v44 = v29;
        v45 = *(_OWORD *)(v15 + v17 + 100);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v30 = sub_23A297678();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_msgSend(*(id *)(v42 + 16), sel_sendEvent_, v30);

        swift_bridgeObjectRetain_n();
        v31 = sub_23A2A39EC();
        v32 = sub_23A2A3B84();
        if (os_log_type_enabled(v31, v32))
        {
          v18 = (uint8_t *)swift_slowAlloc();
          v19 = swift_slowAlloc();
          v43[0] = v19;
          *(_DWORD *)v18 = 136315138;
          v20 = MEMORY[0x23B847498](v15, &type metadata for CountsReported);
          *(_QWORD *)(v1 - 8) = sub_23A288988(v20, v21, v43);
          sub_23A2A3BA8();
          v15 = v41;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_23A27E000, v31, v32, "%s", v18, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B847BB8](v19, -1, -1);
          MEMORY[0x23B847BB8](v18, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v17 += 88;
        --v16;
      }
      while (v16);
      result = swift_bridgeObjectRelease_n();
      v7 = v39;
      v9 = v40;
    }
  }
  v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v12 >= v37)
    goto LABEL_27;
  v13 = *(_QWORD *)(v36 + 8 * v12);
  ++v9;
  if (v13)
    goto LABEL_20;
  v9 = v12 + 1;
  if (v12 + 1 >= v37)
    goto LABEL_27;
  v13 = *(_QWORD *)(v36 + 8 * v9);
  if (v13)
    goto LABEL_20;
  v9 = v12 + 2;
  if (v12 + 2 >= v37)
    goto LABEL_27;
  v13 = *(_QWORD *)(v36 + 8 * v9);
  if (v13)
  {
LABEL_20:
    v7 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }
  v14 = v12 + 3;
  if (v14 >= v37)
  {
LABEL_27:
    swift_release();
    return (*(uint64_t (**)(void))(v33 + 8))();
  }
  v13 = *(_QWORD *)(v36 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v37)
      goto LABEL_27;
    v13 = *(_QWORD *)(v36 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_20;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_23A297FA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  v4 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_release();
}

uint64_t SiriPenetrationRateBiomeReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  v4 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return v0;
}

uint64_t SiriPenetrationRateBiomeReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  v2 = sub_23A2A359C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  v4 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return swift_deallocClassInstance();
}

id sub_23A29811C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  if (a3)
  {
    v15 = (void *)sub_23A2A3A64();
    swift_bridgeObjectRelease();
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v15 = 0;
    if (a5)
    {
LABEL_3:
      v16 = (void *)sub_23A2A3A64();
      swift_bridgeObjectRelease();
      v17 = a9;
      if (a7)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v16 = 0;
  v17 = a9;
  if (a7)
  {
LABEL_4:
    v18 = (void *)sub_23A2A3A64();
    swift_bridgeObjectRelease();
    v19 = a11;
    if (v17)
      goto LABEL_5;
LABEL_10:
    v20 = 0;
    if (v19)
      goto LABEL_6;
LABEL_11:
    v21 = 0;
    goto LABEL_12;
  }
LABEL_9:
  v18 = 0;
  v19 = a11;
  if (!v17)
    goto LABEL_10;
LABEL_5:
  v20 = (void *)sub_23A2A3A64();
  swift_bridgeObjectRelease();
  if (!v19)
    goto LABEL_11;
LABEL_6:
  v21 = (void *)sub_23A2A3A64();
  swift_bridgeObjectRelease();
LABEL_12:
  v22 = objc_msgSend(v11, sel_initWithProductArea_siriInputLocale_systemLocale_countryCode_deviceType_systemBuild_, a1, v15, v16, v18, v20, v21);

  return v22;
}

uint64_t type metadata accessor for SiriPentrationRateReporter()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriPentrationRateReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPentrationRateReporter.report(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 80) + *(_QWORD *)(*(_QWORD *)v1 + 80));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A2891C4;
  return v6(a1);
}

uint64_t sub_23A298308()
{
  return type metadata accessor for SiriPenetrationRateBiomeReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateBiomeReporter()
{
  uint64_t result;

  result = qword_25695C0E8;
  if (!qword_25695C0E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A29834C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A2A359C();
  if (v1 <= 0x3F)
  {
    result = sub_23A2A3A04();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateBiomeReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPenetrationRateBiomeReporter.__allocating_init(biomeDonator:logger:odmId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t sub_23A2983F4()
{
  unint64_t result;

  result = qword_25695C190;
  if (!qword_25695C190)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25695C190);
  }
  return result;
}

uint64_t SiriPenetrationRateJsonLoggingReporter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = swift_allocObject();
  v3 = OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult;
  *(_QWORD *)(v2 + v3) = sub_23A289E8C(MEMORY[0x24BEE4AF8]);
  v4 = v2 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  v5 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a1, v5);
  return v2;
}

uint64_t static SiriPenetrationRateJsonLoggingReporter.SAVE_TO_FILE.getter()
{
  return 0;
}

unint64_t static SiriPenetrationRateJsonLoggingReporter.FILE_PATH.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_23A2984D4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A29853C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SiriPenetrationRateJsonLoggingReporter.init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult;
  swift_retain();
  *(_QWORD *)(v1 + v3) = sub_23A289E8C(MEMORY[0x24BEE4AF8]);
  v4 = v1 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  v5 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a1, v5);
  swift_release();
  return v1;
}

uint64_t sub_23A298600(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v2[25] = v1;
  sub_23A2A3A94();
  v2[26] = swift_task_alloc();
  sub_23A2A34B8();
  v4 = swift_task_alloc();
  v5 = *a1;
  v2[27] = v4;
  v2[28] = v5;
  return swift_task_switch();
}

uint64_t sub_23A298680()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  unint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  const char *v22;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = v0[28];
  v3 = v0[25];
  sub_23A2A34E8();
  swift_allocObject();
  sub_23A2A34DC();
  sub_23A2A34AC();
  sub_23A2A34C4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B658);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A45A0;
  *(_QWORD *)(inited + 32) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 40) = 0x800000023A2AA240;
  *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C1A8);
  *(_QWORD *)(inited + 48) = v2;
  swift_bridgeObjectRetain();
  v5 = sub_23A289E8C(inited);
  v6 = (unint64_t *)(v3 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult);
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695C1B0);
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_23A2A45A0;
  *(_QWORD *)(v7 + 32) = 0xD00000000000001BLL;
  *(_QWORD *)(v7 + 40) = 0x800000023A2AA240;
  *(_QWORD *)(v7 + 48) = v2;
  swift_bridgeObjectRetain();
  v0[22] = sub_23A28A2CC(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695C1B8);
  sub_23A298BFC();
  v8 = sub_23A2A34D0();
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_23A2A3A88();
  v11 = sub_23A2A3A7C();
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    swift_bridgeObjectRetain();
    v15 = sub_23A2A39EC();
    v16 = sub_23A2A3B84();
    if (os_log_type_enabled(v15, v16))
    {
      v25 = v10;
      v17 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v26 = v24;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      v1[24] = sub_23A288988(v13, v14, &v26);
      sub_23A2A3BA8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23A27E000, v15, v16, "json_string=%s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B847BB8](v24, -1, -1);
      v18 = v17;
      v10 = v25;
      MEMORY[0x23B847BB8](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v19 = sub_23A2A39EC();
    v20 = sub_23A2A3B90();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      v22 = "Unable to convert JSON string to data.";
      goto LABEL_9;
    }
  }
  else
  {
    v19 = sub_23A2A39EC();
    v20 = sub_23A2A3B90();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      v22 = "Extracting results to JSON failed";
LABEL_9:
      _os_log_impl(&dword_23A27E000, v19, v20, v22, v21, 2u);
      MEMORY[0x23B847BB8](v21, -1, -1);
    }
  }
  sub_23A298F70(v8, v10);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

unint64_t sub_23A298BFC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_25695C1C0;
  if (!qword_25695C1C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25695C1B8);
    v2 = sub_23A298C68();
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B847B10](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25695C1C0);
  }
  return result;
}

unint64_t sub_23A298C68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25695C1C8;
  if (!qword_25695C1C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25695C1A8);
    v2[0] = sub_23A298CD4();
    v2[1] = sub_23A298D18();
    result = MEMORY[0x23B847B10](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25695C1C8);
  }
  return result;
}

unint64_t sub_23A298CD4()
{
  unint64_t result;

  result = qword_25695C1D0;
  if (!qword_25695C1D0)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for AggregationInterval, &type metadata for AggregationInterval);
    atomic_store(result, (unint64_t *)&qword_25695C1D0);
  }
  return result;
}

unint64_t sub_23A298D18()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25695C1D8;
  if (!qword_25695C1D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25695C1E0);
    v2 = sub_23A298D7C();
    result = MEMORY[0x23B847B10](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25695C1D8);
  }
  return result;
}

unint64_t sub_23A298D7C()
{
  unint64_t result;

  result = qword_25695C1E8;
  if (!qword_25695C1E8)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for CountsReported, &type metadata for CountsReported);
    atomic_store(result, (unint64_t *)&qword_25695C1E8);
  }
  return result;
}

uint64_t sub_23A298DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t SiriPenetrationRateJsonLoggingReporter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SiriPenetrationRateJsonLoggingReporter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_23A298EC0(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23A2A3BA8();
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

uint64_t sub_23A298F70(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A298FB4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A29900C()
{
  return type metadata accessor for SiriPenetrationRateJsonLoggingReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateJsonLoggingReporter()
{
  uint64_t result;

  result = qword_25695C218;
  if (!qword_25695C218)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A299050()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateJsonLoggingReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPenetrationRateJsonLoggingReporter.jsonResult.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SiriPenetrationRateJsonLoggingReporter.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t SiriPenetrationRateDataProvider.__allocating_init(appIntentEventProvider:siriExecutionEventProivder:siriUIEventProvider:conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedAppIntentProivder) = a1;
  *(_QWORD *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriExecutionProvider) = a2;
  *(_QWORD *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriUIProvider) = a3;
  *(_QWORD *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedConversationProvider) = a4;
  v13 = v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  v14 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v13, a6, v14);
  *(_QWORD *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_bookmarkService) = a5;
  return v12;
}

uint64_t FeaturizedBiomeData.featurizedEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturizedBiomeData.eventType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t FeaturizedBiomeData.init(featurizedEvents:eventType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t SiriPenetrationRateDataProvider.init(appIntentEventProvider:siriExecutionEventProivder:siriUIEventProvider:conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedAppIntentProivder) = a1;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriExecutionProvider) = a2;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriUIProvider) = a3;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedConversationProvider) = a4;
  v9 = v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  v10 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a6, v10);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_bookmarkService) = a5;
  return v6;
}

uint64_t sub_23A29925C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_23A299274()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23A299650(7uLL);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_23A2992DC;
  return sub_23A29A08C(v0 + 16);
}

uint64_t sub_23A2992DC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A299340()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[10] = v0[2];
  v1 = (_QWORD *)swift_task_alloc();
  v0[11] = v1;
  *v1 = v0;
  v1[1] = sub_23A2993A8;
  return sub_23A29A08C((uint64_t)(v0 + 3));
}

uint64_t sub_23A2993A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A299414()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[13] = v0[3];
  v1 = (_QWORD *)swift_task_alloc();
  v0[14] = v1;
  *v1 = v0;
  v1[1] = sub_23A29947C;
  return sub_23A29A08C((uint64_t)(v0 + 4));
}

uint64_t sub_23A29947C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_23A2994F4()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[16] = v0[4];
  v1 = (_QWORD *)swift_task_alloc();
  v0[17] = v1;
  *v1 = v0;
  v1[1] = sub_23A29955C;
  return sub_23A29B348((uint64_t)(v0 + 5));
}

uint64_t sub_23A29955C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_23A2995E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD **)(v0 + 48);
  *v3 = *(_QWORD *)(v0 + 80);
  v3[1] = 13;
  v3[2] = v2;
  v3[3] = 6;
  v3[4] = v1;
  v3[5] = 1;
  v3[6] = v4;
  v3[7] = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A299620()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A29962C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A299638()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A299644()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A299650(unint64_t a1)
{
  uint64_t v2;
  char *v3;
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
  char *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A0);
  MEMORY[0x24BDAC7A8](v22);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A2A3560();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B2A8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A2A3668();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v21 - v16;
  sub_23A2A3644();
  sub_23A2A3674();
  v18 = sub_23A2A3680();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v10, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_23A2A3650();
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v15, v11);
    if (qword_25695B168 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v22, (uint64_t)qword_25695B288);
    swift_beginAccess();
    sub_23A282D3C(v20, (uint64_t)v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_23A2A3554();
      sub_23A282DCC((uint64_t)v3);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    }
    sub_23A287E10(13, a1, (uint64_t)v7, (uint64_t)v17);
    sub_23A287E10(6, a1, (uint64_t)v7, (uint64_t)v17);
    sub_23A287E10(1, a1, (uint64_t)v7, (uint64_t)v17);
    sub_23A287E58(0, a1, (uint64_t)v7, (uint64_t)v17);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  return result;
}

uint64_t SiriPenetrationRateDataProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriPenetrationRateDataProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23A299A50(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A2891C4;
  v5[6] = a1;
  v5[7] = v4;
  return swift_task_switch();
}

uint64_t initializeBufferWithCopyOfBuffer for CountsReported(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriPenetrationRateDataRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SiriPenetrationRateDataRecord(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

_QWORD *assignWithCopy for SiriPenetrationRateDataRecord(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for SiriPenetrationRateDataRecord(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriPenetrationRateDataRecord(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriPenetrationRateDataRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriPenetrationRateDataRecord()
{
  return &type metadata for SiriPenetrationRateDataRecord;
}

_QWORD *initializeBufferWithCopyOfBuffer for FeaturizedBiomeData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeaturizedBiomeData()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithTake for FeaturizedBiomeData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for FeaturizedBiomeData()
{
  return &type metadata for FeaturizedBiomeData;
}

_QWORD *_s11DeepThought19FeaturizedBiomeDataVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for FeaturizedConversationData()
{
  return &type metadata for FeaturizedConversationData;
}

uint64_t sub_23A299E3C()
{
  return type metadata accessor for SiriPenetrationRateDataProvider();
}

uint64_t type metadata accessor for SiriPenetrationRateDataProvider()
{
  uint64_t result;

  result = qword_25695C338;
  if (!qword_25695C338)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A299E80()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriPenetrationRateDataProvider.__allocating_init(appIntentEventProvider:siriExecutionEventProivder:siriUIEventProvider:conversationProvider:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SiriPenetrationRateDataProvider.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 136) + *(_QWORD *)(*(_QWORD *)v1 + 136));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A2891C4;
  return v6(a1);
}

_QWORD *FeaturizedBiomeDataProvider.__allocating_init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  char *v9;
  uint64_t v10;

  v8 = (_QWORD *)swift_allocObject();
  v8[4] = a3;
  v9 = (char *)v8 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  v10 = sub_23A2A3A04();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a4, v10);
  v8[2] = a1;
  v8[3] = a2;
  return v8;
}

uint64_t FeaturizedBiomeEvents.featurizedEvents.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *FeaturizedBiomeDataProvider.init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  char *v8;
  uint64_t v9;

  v4[4] = a3;
  v8 = (char *)v4 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  v9 = sub_23A2A3A04();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a4, v9);
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

uint64_t sub_23A29A08C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_23A29A0A4()
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
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25695C410);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695B7D8);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23A2A45A0;
  v6 = v5 + v4 + *(int *)(v2 + 48);
  v7 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v5 + v4) = v7;
  v8 = *MEMORY[0x24BE2B8D8];
  v9 = sub_23A2A36BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v6, v8, v9);
  sub_23A289FC0(v5);
  sub_23A2A36EC();
  swift_allocObject();
  sub_23A2A36C8();
  v10 = *(id *)(*(_QWORD *)(v1 + 32) + 16);
  sub_23A2A36D4();

  sub_23A2A3830();
  v11 = sub_23A2A36E0();
  swift_bridgeObjectRelease();
  sub_23A2A3710();
  v12 = MEMORY[0x23B8470A8](v7);
  v14 = v13;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v15 = sub_23A2A39EC();
  v16 = sub_23A2A3B84();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v21 = v20;
    *(_DWORD *)v17 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_23A288988(v12, v14, &v21);
    sub_23A2A3BA8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2048;
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_23A2A3C74();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = v18;
    sub_23A2A3BA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A27E000, v15, v16, "marker: fetched featurized events, eventType=%s,\ncount=%ld", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B847BB8](v20, -1, -1);
    MEMORY[0x23B847BB8](v17, -1, -1);
    swift_release();

  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_release();

    swift_bridgeObjectRelease_n();
  }
  **(_QWORD **)(v0 + 24) = v11;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t FeaturizedBiomeDataProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FeaturizedBiomeDataProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A29A494(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A2891C4;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

unint64_t sub_23A29A4FC()
{
  unint64_t result;

  result = qword_25695C418;
  if (!qword_25695C418)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for FeaturizedBiomeEvents, &type metadata for FeaturizedBiomeEvents);
    atomic_store(result, (unint64_t *)&qword_25695C418);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeaturizedBiomeEvents()
{
  return &type metadata for FeaturizedBiomeEvents;
}

uint64_t sub_23A29A550()
{
  return type metadata accessor for FeaturizedBiomeDataProvider();
}

uint64_t type metadata accessor for FeaturizedBiomeDataProvider()
{
  uint64_t result;

  result = qword_25695C450;
  if (!qword_25695C450)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A29A594()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FeaturizedBiomeDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeaturizedBiomeDataProvider.__allocating_init(_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FeaturizedBiomeDataProvider.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A2891C4;
  return v6(a1);
}

void *sub_23A29A6A8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B658);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A5070;
  sub_23A2A37E8();
  *(_QWORD *)(inited + 32) = sub_23A2A37DC();
  *(_QWORD *)(inited + 40) = v1;
  v2 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000013;
  *(_QWORD *)(inited + 56) = 0x800000023A2AA410;
  *(_QWORD *)(inited + 80) = sub_23A2A37A0();
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 120) = v2;
  *(_QWORD *)(inited + 96) = 0x7373654D646E6553;
  *(_QWORD *)(inited + 104) = 0xEB00000000656761;
  *(_QWORD *)(inited + 128) = sub_23A2A37AC();
  *(_QWORD *)(inited + 136) = v4;
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = 0;
  *(_QWORD *)(inited + 176) = sub_23A2A37C4();
  *(_QWORD *)(inited + 184) = v5;
  type metadata accessor for BMAppIntentInteractionDirection(0);
  *(_QWORD *)(inited + 216) = v6;
  *(_DWORD *)(inited + 192) = 2;
  result = (void *)sub_23A289E8C(inited);
  off_25695C500 = result;
  return result;
}

uint64_t static SendSMSPenetrationRateEventFilter.expectedAppIntentIntraEventFeatures.getter()
{
  return sub_23A28959C(&qword_25695B190);
}

void *sub_23A29A7BC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25695B658);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2A4710;
  sub_23A2A377C();
  *(_QWORD *)(inited + 32) = sub_23A2A3764();
  *(_QWORD *)(inited + 40) = v1;
  v2 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000013;
  *(_QWORD *)(inited + 56) = 0x800000023A2AA410;
  *(_QWORD *)(inited + 80) = sub_23A2A3758();
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 120) = v2;
  *(_QWORD *)(inited + 96) = 0xD000000000000029;
  *(_QWORD *)(inited + 104) = 0x800000023A2AA430;
  *(_QWORD *)(inited + 128) = sub_23A2A3770();
  *(_QWORD *)(inited + 136) = v4;
  type metadata accessor for BMSiriExecutionTaskStep(0);
  *(_QWORD *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 7;
  result = (void *)sub_23A289E8C(inited);
  off_25695C508 = result;
  return result;
}

uint64_t static SendSMSPenetrationRateEventFilter.expectedSiriExecutionIntraEventFeatures.getter()
{
  return sub_23A28959C(&qword_25695B198);
}

uint64_t SendSMSPenetrationRateEventFilter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SendSMSPenetrationRateEventFilter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t _s11DeepThought33SendSMSPenetrationRateEventFilterC06isSiriF013siriExecutionSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  int v25;
  uint64_t v26;
  char v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;

  sub_23A2A377C();
  sub_23A2A3764();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v0 = *((_QWORD *)&v37 + 1);
  v34 = v37;
  if (qword_25695B198 != -1)
    swift_once();
  v1 = off_25695C508;
  v2 = sub_23A2A3764();
  if (v1[2] && (v4 = sub_23A291288(v2, v3), (v5 & 1) != 0))
  {
    sub_23A28748C(v1[7] + 32 * v4, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v38 + 1))
  {
    v6 = swift_dynamicCast();
    v7 = v35;
    if (!v6)
      v7 = 0;
    v33 = v7;
    if (v6)
      v8 = v36;
    else
      v8 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v37);
    v33 = 0;
    v8 = 0;
  }
  sub_23A2A3758();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)&v37 + 1);
  v32 = v37;
  v10 = off_25695C508;
  v11 = sub_23A2A3758();
  if (v10[2] && (v13 = sub_23A291288(v11, v12), (v14 & 1) != 0))
  {
    sub_23A28748C(v10[7] + 32 * v13, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v38 + 1))
  {
    v15 = swift_dynamicCast();
    v16 = v35;
    if (!v15)
      v16 = 0;
    v31 = v16;
    if (v15)
      v17 = v36;
    else
      v17 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v37);
    v31 = 0;
    v17 = 0;
  }
  sub_23A2A3770();
  type metadata accessor for BMSiriExecutionTaskStep(0);
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v30 = v37;
  v18 = BYTE4(v37);
  v19 = off_25695C508;
  v20 = sub_23A2A3770();
  if (v19[2] && (v22 = sub_23A291288(v20, v21), (v23 & 1) != 0))
  {
    sub_23A28748C(v19[7] + 32 * v22, (uint64_t)&v37);
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v38 + 1))
  {
    sub_23A289E4C((uint64_t)&v37);
    v25 = 0;
    v26 = 1;
    if (v0)
      goto LABEL_34;
LABEL_39:
    if (!v8)
      goto LABEL_45;
    goto LABEL_40;
  }
  v24 = swift_dynamicCast();
  if (v24)
    v25 = v35;
  else
    v25 = 0;
  v26 = v24 ^ 1u;
  if (!v0)
    goto LABEL_39;
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v34 == v33 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  v28 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17)
    {
LABEL_51:
      if ((v18 & 1) == 0)
        return (v30 == v25) & ~(_DWORD)v26;
      return v26;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17)
    goto LABEL_42;
  if (v32 == v31 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  v29 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v18 & 1 | ((v29 & 1) == 0)))
    return (v30 == v25) & ~(_DWORD)v26;
  return v29 & v26;
}

uint64_t _s11DeepThought33SendSMSPenetrationRateEventFilterC12isAppUIEvent9appIntentSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  int v23;
  int v24;
  char v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  int v31;
  int v32;
  unsigned int v33;
  uint64_t result;
  char v35;
  char v36;
  char v37;
  int v38;
  unint64_t v39;
  int v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;

  sub_23A2A37E8();
  sub_23A2A37DC();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v0 = *((_QWORD *)&v46 + 1);
  v43 = v46;
  if (qword_25695B190 != -1)
    swift_once();
  v1 = off_25695C500;
  v2 = sub_23A2A37DC();
  if (v1[2] && (v4 = sub_23A291288(v2, v3), (v5 & 1) != 0))
  {
    sub_23A28748C(v1[7] + 32 * v4, (uint64_t)&v46);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v47 + 1))
  {
    v6 = swift_dynamicCast();
    v7 = v44;
    if (!v6)
      v7 = 0;
    v42 = v7;
    if (v6)
      v8 = v45;
    else
      v8 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v46);
    v42 = 0;
    v8 = 0;
  }
  sub_23A2A37A0();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v9 = v46;
  v10 = off_25695C500;
  v11 = sub_23A2A37A0();
  if (v10[2] && (v13 = sub_23A291288(v11, v12), (v14 & 1) != 0))
  {
    sub_23A28748C(v10[7] + 32 * v13, (uint64_t)&v46);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v47 + 1))
  {
    v15 = swift_dynamicCast();
    v16 = v44;
    if (!v15)
      v16 = 0;
    v39 = v16;
    if (v15)
      v17 = v45;
    else
      v17 = 0;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v46);
    v39 = 0;
    v17 = 0;
  }
  sub_23A2A37AC();
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v41 = v46;
  v18 = off_25695C500;
  v19 = sub_23A2A37AC();
  if (v18[2] && (v21 = sub_23A291288(v19, v20), (v22 & 1) != 0))
  {
    sub_23A28748C(v18[7] + 32 * v21, (uint64_t)&v46);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v47 + 1))
  {
    v23 = swift_dynamicCast();
    v24 = v44;
    if (!v23)
      v24 = 2;
  }
  else
  {
    sub_23A289E4C((uint64_t)&v46);
    v24 = 2;
  }
  v40 = v24;
  sub_23A2A37C4();
  type metadata accessor for BMAppIntentInteractionDirection(0);
  sub_23A2A3800();
  swift_bridgeObjectRelease();
  v38 = v46;
  v25 = BYTE4(v46);
  v26 = off_25695C500;
  v27 = sub_23A2A37C4();
  if (v26[2] && (v29 = sub_23A291288(v27, v28), (v30 & 1) != 0))
  {
    sub_23A28748C(v26[7] + 32 * v29, (uint64_t)&v46);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v47 + 1))
  {
    sub_23A289E4C((uint64_t)&v46);
    v32 = 0;
    v33 = 1;
    if (v0)
      goto LABEL_42;
LABEL_47:
    if (!v8)
      goto LABEL_53;
    goto LABEL_48;
  }
  v31 = swift_dynamicCast();
  if (v31)
    v32 = v44;
  else
    v32 = 0;
  v33 = v31 ^ 1;
  if (!v0)
    goto LABEL_47;
LABEL_42:
  if (!v8)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
  if (v43 == v42 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_53;
  }
  v35 = sub_23A2A3D58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) == 0)
  {
LABEL_49:
    swift_bridgeObjectRelease();
    goto LABEL_50;
  }
LABEL_53:
  if (!*((_QWORD *)&v9 + 1))
  {
    if (!v17)
      goto LABEL_61;
LABEL_50:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17)
    goto LABEL_50;
  if (v9 == __PAIR128__(v17, v39))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v36 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v36 & 1) == 0)
      return result;
  }
LABEL_61:
  if (v41 != 2)
  {
    if (!((v40 != 2) & (((v41 & 1) == 0) ^ v40)) | v25 & 1)
      return ((v40 != 2) & (((v41 & 1) == 0) ^ v40)) & v33;
    return (v38 == v32) & ~v33;
  }
  if (v40 == 2)
    v37 = v25;
  else
    v37 = 1;
  if (v40 == 2)
    result = v33;
  else
    result = 0;
  if ((v37 & 1) == 0)
    return (v38 == v32) & ~v33;
  return result;
}

uint64_t type metadata accessor for SendSMSPenetrationRateEventFilter()
{
  return objc_opt_self();
}

uint64_t method lookup function for SendSMSPenetrationRateEventFilter()
{
  return swift_lookUpClassMethod();
}

_QWORD *FeaturizedConversationDataProvider.__allocating_init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  char *v9;
  uint64_t v10;

  v8 = (_QWORD *)swift_allocObject();
  v8[4] = a3;
  v9 = (char *)v8 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  v10 = sub_23A2A3A04();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a4, v10);
  v8[2] = a1;
  v8[3] = a2;
  return v8;
}

uint64_t FeaturizedConversationEvents.featurizedConversations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturizedConversationEvents.init(featurizedConversations:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

_QWORD *FeaturizedConversationDataProvider.init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  char *v8;
  uint64_t v9;

  v4[4] = a3;
  v8 = (char *)v4 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  v9 = sub_23A2A3A04();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a4, v9);
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

uint64_t sub_23A29B348(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_23A29B360()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t (*v7)(void *, uint64_t);

  v1 = v0[4];
  sub_23A2A38CC();
  v0[5] = sub_23A2A38C0();
  v2 = *(void **)(*(_QWORD *)(v1 + 32) + 16);
  v0[6] = v2;
  v3 = *(_QWORD *)(v1 + 24);
  v7 = (uint64_t (*)(void *, uint64_t))((int)*MEMORY[0x24BE2BAD0] + MEMORY[0x24BE2BAD0]);
  v4 = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  *v5 = v0;
  v5[1] = sub_23A29B404;
  return v7(v2, v3);
}

uint64_t sub_23A29B404(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_23A29B478()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  unint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;

  swift_bridgeObjectRetain_n();
  v1 = sub_23A2A39EC();
  v2 = sub_23A2A3B84();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(_QWORD *)(v0 + 64);
  if (v3)
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v6 = sub_23A2A3C74();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v7 = *(void **)(v0 + 40);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = v6;
    sub_23A2A3BA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A27E000, v1, v2, "marker: fetched SELF conversations, count=%ld", v5, 0xCu);
    MEMORY[0x23B847BB8](v5, -1, -1);
  }
  else
  {
    v7 = *(void **)(v0 + 40);
    swift_bridgeObjectRelease_n();
  }

  **(_QWORD **)(v0 + 24) = *(_QWORD *)(v0 + 64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A29B5E8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t FeaturizedConversationDataProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FeaturizedConversationDataProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  v2 = sub_23A2A3A04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A29B6D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A2891C4;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

unint64_t sub_23A29B73C()
{
  unint64_t result;

  result = qword_25695C5B8;
  if (!qword_25695C5B8)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for FeaturizedConversationEvents, &type metadata for FeaturizedConversationEvents);
    atomic_store(result, (unint64_t *)&qword_25695C5B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeaturizedConversationEvents()
{
  return &type metadata for FeaturizedConversationEvents;
}

uint64_t sub_23A29B790()
{
  return type metadata accessor for FeaturizedConversationDataProvider();
}

uint64_t type metadata accessor for FeaturizedConversationDataProvider()
{
  uint64_t result;

  result = qword_25695C5F0;
  if (!qword_25695C5F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A29B7D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3A04();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FeaturizedConversationDataProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeaturizedConversationDataProvider.__allocating_init(_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FeaturizedConversationDataProvider.loadData()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A2891C4;
  return v6(a1);
}

uint64_t ProductArea.getODMTaskType()()
{
  char *v0;

  return dword_23A2A6630[*v0];
}

uint64_t AggregationKeys.init(aggregationStartTimeSince2001:aggregationIntervalInDays:siriInputLocale:viewMode:audioInputRoute:taskType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, double a10@<D0>)
{
  char v10;

  v10 = *a8;
  *(_DWORD *)a9 = result;
  *(double *)(a9 + 8) = a10;
  *(_QWORD *)(a9 + 16) = a2;
  *(_QWORD *)(a9 + 24) = a3;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_QWORD *)(a9 + 48) = a6;
  *(_QWORD *)(a9 + 56) = a7;
  *(_BYTE *)(a9 + 64) = v10;
  return result;
}

uint64_t AggregationKeys.description.getter()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t v6;
  _QWORD v8[3];
  int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;

  v1 = sub_23A2A3560();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v6 = *((_QWORD *)v0 + 6);
  v8[1] = *((_QWORD *)v0 + 4);
  v8[2] = v6;
  v9 = *((unsigned __int8 *)v0 + 64);
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_23A2A3BF0();
  sub_23A2A3AD0();
  v10 = v5;
  sub_23A2A3D4C();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  sub_23A2A3B60();
  sub_23A2A3AD0();
  sub_23A2A3524();
  sub_23A282054();
  sub_23A2A3D4C();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_23A2A3AD0();
  swift_bridgeObjectRetain();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  swift_bridgeObjectRetain();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  swift_bridgeObjectRetain();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  LOBYTE(v10) = v9;
  sub_23A2A3C50();
  return v11;
}

uint64_t ProductArea.getBiomeProductArea()()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

uint64_t static ProductArea.MessagingType.== infix(_:_:)()
{
  return 1;
}

uint64_t ProductArea.MessagingType.hash(into:)()
{
  return sub_23A2A3D88();
}

uint64_t sub_23A29BBF0()
{
  return 1;
}

uint64_t sub_23A29BBFC()
{
  return sub_23A2A3D88();
}

uint64_t sub_23A29BC24()
{
  return 0x534D535F444E4553;
}

uint64_t sub_23A29BC3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x534D535F444E4553 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A2A3D58();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A29BCD0()
{
  return 0;
}

void sub_23A29BCDC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23A29BCE8()
{
  sub_23A29EA30();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29BD10()
{
  sub_23A29EA30();
  return sub_23A2A3DE8();
}

uint64_t sub_23A29BD38()
{
  return 0;
}

uint64_t sub_23A29BD44@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_23A29BD70()
{
  sub_23A29EA74();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29BD98()
{
  sub_23A29EA74();
  return sub_23A2A3DE8();
}

uint64_t ProductArea.MessagingType.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6A0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6A8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EA30();
  sub_23A2A3DD0();
  sub_23A29EA74();
  sub_23A2A3D04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ProductArea.MessagingType.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6C0);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6C8);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EA30();
  v8 = v23;
  sub_23A2A3DC4();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_23A2A3CF8() + 16) != 1)
  {
    v14 = sub_23A2A3C38();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6D0);
    *v16 = &type metadata for ProductArea.MessagingType;
    sub_23A2A3CBC();
    sub_23A2A3C2C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_23A29EA74();
  v11 = v4;
  sub_23A2A3CB0();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_23A29C15C(_QWORD *a1)
{
  return ProductArea.MessagingType.init(from:)(a1);
}

uint64_t sub_23A29C170(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6A0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6A8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EA30();
  sub_23A2A3DD0();
  sub_23A29EA74();
  sub_23A2A3D04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t static ProductArea.RemindersType.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_23A29C2B4()
{
  return 0x494D45525F544553;
}

uint64_t sub_23A29C2D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x494D45525F544553 && a2 == 0xEC0000005245444ELL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A2A3D58();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A29C380()
{
  sub_23A29EAB8();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29C3A8()
{
  sub_23A29EAB8();
  return sub_23A2A3DE8();
}

uint64_t sub_23A29C3D0()
{
  sub_23A29EAFC();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29C3F8()
{
  sub_23A29EAFC();
  return sub_23A2A3DE8();
}

uint64_t ProductArea.RemindersType.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6E0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EAB8();
  sub_23A2A3DD0();
  sub_23A29EAFC();
  sub_23A2A3D04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ProductArea.RemindersType.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6F8);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C700);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EAB8();
  v8 = v23;
  sub_23A2A3DC4();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_23A2A3CF8() + 16) != 1)
  {
    v14 = sub_23A2A3C38();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6D0);
    *v16 = &type metadata for ProductArea.RemindersType;
    sub_23A2A3CBC();
    sub_23A2A3C2C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_23A29EAFC();
  v11 = v4;
  sub_23A2A3CB0();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_23A29C7BC(_QWORD *a1)
{
  return ProductArea.RemindersType.init(from:)(a1);
}

uint64_t sub_23A29C7D0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6E0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EAB8();
  sub_23A2A3DD0();
  sub_23A29EAFC();
  sub_23A2A3D04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t static ProductArea.PhoneCallType.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_23A29C914()
{
  return 0x41435F5452415453;
}

uint64_t sub_23A29C930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x41435F5452415453 && a2 == 0xEA00000000004C4CLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A2A3D58();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A29C9D0()
{
  sub_23A29EB40();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29C9F8()
{
  sub_23A29EB40();
  return sub_23A2A3DE8();
}

uint64_t sub_23A29CA20()
{
  sub_23A29EB84();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29CA48()
{
  sub_23A29EB84();
  return sub_23A2A3DE8();
}

uint64_t ProductArea.PhoneCallType.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C708);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C710);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EB40();
  sub_23A2A3DD0();
  sub_23A29EB84();
  sub_23A2A3D04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t _s11DeepThought11ProductAreaO13MessagingTypeO9hashValueSivg_0()
{
  sub_23A2A3D7C();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t ProductArea.PhoneCallType.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C728);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C730);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EB40();
  v8 = v23;
  sub_23A2A3DC4();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_23A2A3CF8() + 16) != 1)
  {
    v14 = sub_23A2A3C38();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6D0);
    *v16 = &type metadata for ProductArea.PhoneCallType;
    sub_23A2A3CBC();
    sub_23A2A3C2C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v13);
  }
  sub_23A29EB84();
  v11 = v4;
  sub_23A2A3CB0();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_1(v13);
}

uint64_t sub_23A29CE4C(_QWORD *a1)
{
  return ProductArea.PhoneCallType.init(from:)(a1);
}

uint64_t sub_23A29CE60(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C708);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C710);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EB40();
  sub_23A2A3DD0();
  sub_23A29EB84();
  sub_23A2A3D04();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ProductArea.hash(into:)()
{
  sub_23A2A3D88();
  return sub_23A2A3D88();
}

uint64_t static ProductArea.== infix(_:_:)(_BYTE *a1, _BYTE *a2)
{
  int v2;

  v2 = *a2;
  if (*a1)
  {
    if (*a1 == 1)
    {
      if (v2 == 1)
        return 1;
    }
    else if (v2 == 2)
    {
      return 1;
    }
  }
  else if (!*a2)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_23A29D01C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7265646E696D6552;
  if (*v0 != 1)
    v1 = 0x6C6143656E6F6850;
  if (*v0)
    return v1;
  else
    return 0x6E6967617373654DLL;
}

uint64_t sub_23A29D07C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A2A1E88(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A29D0A0(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23A29D0AC()
{
  sub_23A29EBC8();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29D0D4()
{
  sub_23A29EBC8();
  return sub_23A2A3DE8();
}

uint64_t sub_23A29D0FC()
{
  return 0x657079546B736174;
}

uint64_t sub_23A29D118()
{
  sub_23A29ED1C();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29D140()
{
  sub_23A29ED1C();
  return sub_23A2A3DE8();
}

uint64_t sub_23A29D168()
{
  sub_23A29EC0C();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29D190()
{
  sub_23A29EC0C();
  return sub_23A2A3DE8();
}

uint64_t sub_23A29D1B8()
{
  sub_23A2A3D7C();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29D1F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x657079546B736174 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23A2A3D58();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_23A29D288()
{
  sub_23A29EC94();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29D2B0()
{
  sub_23A29EC94();
  return sub_23A2A3DE8();
}

uint64_t ProductArea.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C738);
  v25 = *(_QWORD *)(v4 - 8);
  v26 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C740);
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C748);
  v22 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C750);
  v27 = *(_QWORD *)(v13 - 8);
  v28 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EBC8();
  sub_23A2A3DD0();
  if (v16)
  {
    if (v16 == 1)
    {
      v30 = 1;
      sub_23A29EC94();
      v17 = v28;
      sub_23A2A3D04();
      sub_23A29ECD8();
      v18 = v24;
      sub_23A2A3D28();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v18);
    }
    else
    {
      v31 = 2;
      sub_23A29EC0C();
      v17 = v28;
      sub_23A2A3D04();
      sub_23A29EC50();
      v21 = v26;
      sub_23A2A3D28();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v21);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v15, v17);
  }
  else
  {
    v29 = 0;
    sub_23A29ED1C();
    v19 = v28;
    sub_23A2A3D04();
    sub_23A29ED60();
    sub_23A2A3D28();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v15, v19);
  }
}

uint64_t ProductArea.hashValue.getter()
{
  sub_23A2A3D7C();
  sub_23A2A3D88();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t ProductArea.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  char v43;
  char v44;
  char v45;

  v38 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C790);
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v40 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C798);
  v36 = *(_QWORD *)(v5 - 8);
  v37 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C7A0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C7A8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v41 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_23A29EBC8();
  v16 = v42;
  sub_23A2A3DC4();
  if (!v16)
  {
    v32 = v8;
    v33 = v7;
    v17 = v39;
    v18 = v40;
    v42 = v12;
    v19 = sub_23A2A3CF8();
    v20 = v11;
    if (*(_QWORD *)(v19 + 16) == 1)
    {
      v21 = v14;
      LODWORD(v14) = *(unsigned __int8 *)(v19 + 32);
      if (*(_BYTE *)(v19 + 32))
      {
        if ((_DWORD)v14 != 1)
        {
          LODWORD(v39) = *(unsigned __int8 *)(v19 + 32);
          v45 = 2;
          sub_23A29EC0C();
          v14 = v18;
          sub_23A2A3CB0();
          sub_23A29EDA4();
          v29 = v35;
          sub_23A2A3CE0();
          v30 = v42;
          (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v29);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v30 + 8))(v21, v20);
          v27 = (uint64_t)v41;
          LOBYTE(v14) = (_BYTE)v39;
LABEL_12:
          *v38 = (_BYTE)v14;
          return __swift_destroy_boxed_opaque_existential_1(v27);
        }
        v44 = 1;
        sub_23A29EC94();
        v10 = v17;
        sub_23A2A3CB0();
        sub_23A29EDE8();
        v22 = v37;
        sub_23A2A3CE0();
        v23 = v36;
      }
      else
      {
        v43 = 0;
        sub_23A29ED1C();
        sub_23A2A3CB0();
        sub_23A29EE2C();
        v22 = v33;
        sub_23A2A3CE0();
        v23 = v32;
      }
      (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v22);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v20);
      v27 = (uint64_t)v41;
      goto LABEL_12;
    }
    v24 = sub_23A2A3C38();
    swift_allocError();
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25695C6D0);
    *v26 = &type metadata for ProductArea;
    sub_23A2A3CBC();
    sub_23A2A3C2C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BEE26D0], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v11);
  }
  v27 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1(v27);
}

uint64_t sub_23A29DADC()
{
  sub_23A2A3D7C();
  sub_23A2A3D88();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29DB2C()
{
  sub_23A2A3D88();
  return sub_23A2A3D88();
}

uint64_t sub_23A29DB5C()
{
  sub_23A2A3D7C();
  sub_23A2A3D88();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29DBA8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return ProductArea.init(from:)(a1, a2);
}

uint64_t sub_23A29DBBC(_QWORD *a1)
{
  return ProductArea.encode(to:)(a1);
}

BOOL sub_23A29DBD0(_BYTE *a1, _BYTE *a2)
{
  int v2;

  v2 = *a2;
  if (*a1)
  {
    if (*a1 == 1)
      return v2 == 1;
    if (v2 != 2)
      return 0;
  }
  else if (*a2)
  {
    return 0;
  }
  return 1;
}

uint64_t AggregationInterval.aggregationIntervalInDays.getter()
{
  unsigned int *v0;

  return *v0;
}

double AggregationInterval.aggregationIntervalStartTimestampInSecondsSince2001.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t AggregationInterval.init(aggregationIntervalInDays:aggregationIntervalStartTimestampInSecondsSince2001:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(_DWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t AggregationInterval.hash(into:)()
{
  sub_23A2A3D94();
  return sub_23A2A3DA0();
}

BOOL static AggregationInterval.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
}

BOOL sub_23A29DC94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A29DCAC()
{
  sub_23A2A3D7C();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29DCF0()
{
  return sub_23A2A3D88();
}

uint64_t sub_23A29DD18()
{
  sub_23A2A3D7C();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

unint64_t sub_23A29DD58()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000033;
  else
    return 0xD000000000000019;
}

uint64_t sub_23A29DD98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A2A1FE8(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A29DDBC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23A29DDC8()
{
  sub_23A29EE70();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29DDF0()
{
  sub_23A29EE70();
  return sub_23A2A3DE8();
}

uint64_t AggregationInterval.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C7C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EE70();
  sub_23A2A3DD0();
  v8[15] = 0;
  sub_23A2A3D34();
  if (!v1)
  {
    v8[14] = 1;
    sub_23A2A3D1C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t AggregationInterval.hashValue.getter()
{
  sub_23A2A3D7C();
  sub_23A2A3D94();
  sub_23A2A3DA0();
  return sub_23A2A3DAC();
}

uint64_t AggregationInterval.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C7D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29EE70();
  sub_23A2A3DC4();
  if (!v2)
  {
    v13[15] = 0;
    v9 = sub_23A2A3CEC();
    v13[14] = 1;
    sub_23A2A3CD4();
    v11 = v10;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    *(_DWORD *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23A29E0FC()
{
  sub_23A2A3D94();
  return sub_23A2A3DA0();
}

uint64_t sub_23A29E13C()
{
  sub_23A2A3D7C();
  sub_23A2A3D94();
  sub_23A2A3DA0();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29E198@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return AggregationInterval.init(from:)(a1, a2);
}

uint64_t sub_23A29E1AC(_QWORD *a1)
{
  return AggregationInterval.encode(to:)(a1);
}

BOOL sub_23A29E1C0(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
}

uint64_t DynamicDimensions.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  sub_23A2A3D88();
  return sub_23A2A3D88();
}

uint64_t sub_23A29E2A8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A29E2E4 + 4 * byte_23A2A51D0[*v0]))(0x75706E4969726973, 0xEF656C61636F4C74);
}

uint64_t sub_23A29E2E4()
{
  return 0x65646F4D77656976;
}

uint64_t sub_23A29E2FC()
{
  return 0x746E496F69647561;
}

uint64_t sub_23A29E320()
{
  return 0x41746375646F7270;
}

uint64_t sub_23A29E340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A2A20D0(a1, a2);
  *a3 = result;
  return result;
}

void sub_23A29E364(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23A29E370()
{
  sub_23A29FFCC();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29E398()
{
  sub_23A29FFCC();
  return sub_23A2A3DE8();
}

uint64_t DynamicDimensions.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C7E0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v15 = *(_QWORD *)(v1 + 24);
  v16 = v7;
  v8 = *(_QWORD *)(v1 + 32);
  v13 = *(_QWORD *)(v1 + 40);
  v14 = v8;
  HIDWORD(v12) = *(unsigned __int8 *)(v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29FFCC();
  sub_23A2A3DD0();
  v22 = 0;
  v9 = v17;
  sub_23A2A3D10();
  if (!v9)
  {
    v10 = BYTE4(v12);
    v21 = 1;
    sub_23A2A3D10();
    v20 = 2;
    sub_23A2A3D10();
    v19 = v10;
    v18 = 3;
    sub_23A2A0010();
    sub_23A2A3D28();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DynamicDimensions.hashValue.getter()
{
  sub_23A2A3D7C();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  sub_23A2A3D88();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t DynamicDimensions.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C7F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A29FFCC();
  sub_23A2A3DC4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v30 = 0;
  v9 = sub_23A2A3CC8();
  v11 = v10;
  v24 = v9;
  v29 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_23A2A3CC8();
  v25 = v13;
  v23 = v12;
  v28 = 2;
  swift_bridgeObjectRetain();
  v21 = sub_23A2A3CC8();
  v26 = 3;
  v15 = v14;
  sub_23A2A0054();
  v22 = v15;
  swift_bridgeObjectRetain();
  sub_23A2A3CE0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v27;
  v18 = v25;
  *(_QWORD *)a2 = v24;
  *(_QWORD *)(a2 + 8) = v11;
  v19 = v22;
  *(_QWORD *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v18;
  *(_QWORD *)(a2 + 32) = v21;
  *(_QWORD *)(a2 + 40) = v19;
  *(_BYTE *)(a2 + 48) = v17;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A29E908()
{
  sub_23A2A3D7C();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  sub_23A2A3D88();
  sub_23A2A3D88();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29E9D8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicDimensions.init(from:)(a1, a2);
}

uint64_t sub_23A29E9EC(_QWORD *a1)
{
  return DynamicDimensions.encode(to:)(a1);
}

double AggregationKeys.init(aggregationInterval:dimension:)@<D0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  result = *(double *)(a1 + 8);
  v4 = *a2;
  v5 = a2[1];
  v6 = *((_QWORD *)a2 + 4);
  v7 = *((_QWORD *)a2 + 5);
  v8 = *((_BYTE *)a2 + 48);
  *(_DWORD *)a3 = *(_DWORD *)a1;
  *(double *)(a3 + 8) = result;
  *(_OWORD *)(a3 + 16) = v4;
  *(_OWORD *)(a3 + 32) = v5;
  *(_QWORD *)(a3 + 48) = v6;
  *(_QWORD *)(a3 + 56) = v7;
  *(_BYTE *)(a3 + 64) = v8;
  return result;
}

unint64_t sub_23A29EA30()
{
  unint64_t result;

  result = qword_25695C6B0;
  if (!qword_25695C6B0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A65DC, &type metadata for ProductArea.MessagingType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C6B0);
  }
  return result;
}

unint64_t sub_23A29EA74()
{
  unint64_t result;

  result = qword_25695C6B8;
  if (!qword_25695C6B8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A658C, &type metadata for ProductArea.MessagingType.SEND_SMSCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C6B8);
  }
  return result;
}

unint64_t sub_23A29EAB8()
{
  unint64_t result;

  result = qword_25695C6E8;
  if (!qword_25695C6E8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A653C, &type metadata for ProductArea.RemindersType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C6E8);
  }
  return result;
}

unint64_t sub_23A29EAFC()
{
  unint64_t result;

  result = qword_25695C6F0;
  if (!qword_25695C6F0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A64EC, &type metadata for ProductArea.RemindersType.SET_REMINDERCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C6F0);
  }
  return result;
}

unint64_t sub_23A29EB40()
{
  unint64_t result;

  result = qword_25695C718;
  if (!qword_25695C718)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A649C, &type metadata for ProductArea.PhoneCallType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C718);
  }
  return result;
}

unint64_t sub_23A29EB84()
{
  unint64_t result;

  result = qword_25695C720;
  if (!qword_25695C720)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A644C, &type metadata for ProductArea.PhoneCallType.START_CALLCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C720);
  }
  return result;
}

unint64_t sub_23A29EBC8()
{
  unint64_t result;

  result = qword_25695C758;
  if (!qword_25695C758)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A63FC, &type metadata for ProductArea.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C758);
  }
  return result;
}

unint64_t sub_23A29EC0C()
{
  unint64_t result;

  result = qword_25695C760;
  if (!qword_25695C760)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A63AC, &type metadata for ProductArea.PhoneCallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C760);
  }
  return result;
}

unint64_t sub_23A29EC50()
{
  unint64_t result;

  result = qword_25695C768;
  if (!qword_25695C768)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.PhoneCallType, &type metadata for ProductArea.PhoneCallType);
    atomic_store(result, (unint64_t *)&qword_25695C768);
  }
  return result;
}

unint64_t sub_23A29EC94()
{
  unint64_t result;

  result = qword_25695C770;
  if (!qword_25695C770)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A635C, &type metadata for ProductArea.RemindersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C770);
  }
  return result;
}

unint64_t sub_23A29ECD8()
{
  unint64_t result;

  result = qword_25695C778;
  if (!qword_25695C778)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.RemindersType, &type metadata for ProductArea.RemindersType);
    atomic_store(result, (unint64_t *)&qword_25695C778);
  }
  return result;
}

unint64_t sub_23A29ED1C()
{
  unint64_t result;

  result = qword_25695C780;
  if (!qword_25695C780)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A630C, &type metadata for ProductArea.MessagingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C780);
  }
  return result;
}

unint64_t sub_23A29ED60()
{
  unint64_t result;

  result = qword_25695C788;
  if (!qword_25695C788)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.MessagingType, &type metadata for ProductArea.MessagingType);
    atomic_store(result, (unint64_t *)&qword_25695C788);
  }
  return result;
}

unint64_t sub_23A29EDA4()
{
  unint64_t result;

  result = qword_25695C7B0;
  if (!qword_25695C7B0)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.PhoneCallType, &type metadata for ProductArea.PhoneCallType);
    atomic_store(result, (unint64_t *)&qword_25695C7B0);
  }
  return result;
}

unint64_t sub_23A29EDE8()
{
  unint64_t result;

  result = qword_25695C7B8;
  if (!qword_25695C7B8)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.RemindersType, &type metadata for ProductArea.RemindersType);
    atomic_store(result, (unint64_t *)&qword_25695C7B8);
  }
  return result;
}

unint64_t sub_23A29EE2C()
{
  unint64_t result;

  result = qword_25695C7C0;
  if (!qword_25695C7C0)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.MessagingType, &type metadata for ProductArea.MessagingType);
    atomic_store(result, (unint64_t *)&qword_25695C7C0);
  }
  return result;
}

unint64_t sub_23A29EE70()
{
  unint64_t result;

  result = qword_25695C7D0;
  if (!qword_25695C7D0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A62BC, &type metadata for AggregationInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C7D0);
  }
  return result;
}

uint64_t AggregationKeys.hash(into:)()
{
  sub_23A2A3D94();
  sub_23A2A3DA0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  sub_23A2A3D88();
  sub_23A2A3D88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t AggregationKeys.hashValue.getter()
{
  sub_23A2A3D7C();
  AggregationKeys.hash(into:)();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29F024(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A29F05C + 4 * byte_23A2A51D4[a1]))(0xD000000000000016, 0x800000023A2AA6D0);
}

uint64_t sub_23A29F05C(uint64_t a1)
{
  return a1 - 3;
}

uint64_t sub_23A29F090()
{
  sub_23A2A3D7C();
  AggregationKeys.hash(into:)();
  return sub_23A2A3DAC();
}

uint64_t sub_23A29F100()
{
  sub_23A2A3D7C();
  AggregationKeys.hash(into:)();
  return sub_23A2A3DAC();
}

BOOL sub_23A29F16C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A29F180()
{
  unsigned __int8 *v0;

  return sub_23A29F024(*v0);
}

uint64_t sub_23A29F188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A2A22E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A29F1AC()
{
  sub_23A2A0098();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29F1D4()
{
  sub_23A2A0098();
  return sub_23A2A3DE8();
}

uint64_t TaskCounts.encode(to:)(_QWORD *a1)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  _DWORD v10[7];
  char v11;
  char v12;
  char v13;
  char v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C808);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[6] = v1[1];
  v8 = v1[2];
  v10[2] = v1[3];
  v10[3] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A2A0098();
  sub_23A2A3DD0();
  v14 = 0;
  sub_23A2A3D34();
  if (!v2)
  {
    v13 = 1;
    sub_23A2A3D34();
    v12 = 2;
    sub_23A2A3D34();
    v11 = 3;
    sub_23A2A3D34();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t TaskCounts.init(from:)@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int v10;
  int v12;
  uint64_t v13;
  int v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C818);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A2A0098();
  sub_23A2A3DC4();
  if (!v2)
  {
    v18 = 0;
    v9 = sub_23A2A3CEC();
    v17 = 1;
    v10 = sub_23A2A3CEC();
    v16 = 2;
    v14 = sub_23A2A3CEC();
    v15 = 3;
    v12 = sub_23A2A3CEC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v14;
    a2[3] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23A29F51C@<X0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return TaskCounts.init(from:)(a1, a2);
}

uint64_t sub_23A29F530(_QWORD *a1)
{
  return TaskCounts.encode(to:)(a1);
}

uint64_t CountsReported.description.getter()
{
  sub_23A2A3BF0();
  sub_23A2A3AD0();
  sub_23A2A3C50();
  sub_23A2A3AD0();
  sub_23A2A3D4C();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  sub_23A2A3B60();
  sub_23A2A3AD0();
  swift_bridgeObjectRetain();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  swift_bridgeObjectRetain();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  swift_bridgeObjectRetain();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  sub_23A2A3D4C();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  sub_23A2A3AD0();
  sub_23A2A3D4C();
  sub_23A2A3AD0();
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_23A29F81C()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6F69736E656D6964;
  if (*v0 != 1)
    v1 = 0x6E756F436B736174;
  if (*v0)
    return v1;
  else
    return 0xD000000000000013;
}

uint64_t sub_23A29F880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23A2A247C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23A29F8A4()
{
  sub_23A2A00DC();
  return sub_23A2A3DDC();
}

uint64_t sub_23A29F8CC()
{
  sub_23A2A00DC();
  return sub_23A2A3DE8();
}

uint64_t CountsReported.encode(to:)(_QWORD *a1)
{
  int *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  char v29;
  char v30;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C820);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v10 = *((_QWORD *)v1 + 2);
  v21 = *((_QWORD *)v1 + 3);
  v22 = v10;
  v11 = *((_QWORD *)v1 + 4);
  v19 = *((_QWORD *)v1 + 5);
  v20 = v11;
  v12 = *((_QWORD *)v1 + 6);
  v17 = *((_QWORD *)v1 + 7);
  v18 = v12;
  HIDWORD(v16) = *((unsigned __int8 *)v1 + 64);
  v13 = *(_QWORD *)(v1 + 17);
  v14 = *(_QWORD *)(v1 + 19);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A2A00DC();
  sub_23A2A3DD0();
  LODWORD(v23) = v8;
  v24 = v9;
  v30 = 0;
  sub_23A298CD4();
  sub_23A2A3D28();
  if (!v2)
  {
    v23 = v22;
    v24 = v21;
    v25 = v20;
    v26 = v19;
    v27 = v18;
    v28 = v17;
    v29 = BYTE4(v16);
    v30 = 1;
    sub_23A2A0120();
    sub_23A2A3D28();
    v23 = v13;
    v24 = v14;
    v30 = 2;
    sub_23A2A0164();
    sub_23A2A3D28();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t CountsReported.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  char v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25695C840);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A2A00DC();
  sub_23A2A3DC4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v29 = 0;
  sub_23A2A01A8();
  sub_23A2A3CE0();
  v9 = v23;
  v10 = *((_QWORD *)&v23 + 1);
  v29 = 1;
  sub_23A2A01EC();
  sub_23A2A3CE0();
  v21 = v9;
  v11 = *((_QWORD *)&v23 + 1);
  v12 = v25;
  v19 = v24;
  v20 = v23;
  v13 = v27;
  v18 = v26;
  HIDWORD(v17) = v28;
  v29 = 2;
  sub_23A2A0230();
  v22 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A2A3CE0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = v23;
  *(_DWORD *)a2 = v21;
  *(_QWORD *)(a2 + 8) = v10;
  v15 = v22;
  *(_QWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)(a2 + 32) = v19;
  *(_QWORD *)(a2 + 40) = v12;
  *(_QWORD *)(a2 + 48) = v18;
  *(_QWORD *)(a2 + 56) = v13;
  *(_BYTE *)(a2 + 64) = BYTE4(v17);
  *(_OWORD *)(a2 + 68) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A29FD5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CountsReported.init(from:)(a1, a2);
}

uint64_t sub_23A29FD70(_QWORD *a1)
{
  return CountsReported.encode(to:)(a1);
}

uint64_t _s11DeepThought15AggregationKeysV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  result = 0;
  if (*(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(unsigned __int8 *)(a1 + 64);
    v9 = *(_QWORD *)(a2 + 32);
    v10 = *(_QWORD *)(a2 + 40);
    v11 = *(_QWORD *)(a2 + 48);
    v12 = *(_QWORD *)(a2 + 56);
    v13 = *(unsigned __int8 *)(a2 + 64);
    if ((*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
       || (sub_23A2A3D58() & 1) != 0)
      && (v4 == v9 && v5 == v10 || (sub_23A2A3D58() & 1) != 0)
      && (v6 == v11 && v7 == v12 || (sub_23A2A3D58() & 1) != 0))
    {
      if (v8)
      {
        if (v8 == 1)
        {
          if (v13 == 1)
            return 1;
        }
        else if (v13 == 2)
        {
          return 1;
        }
      }
      else if (!v13)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t _s11DeepThought17DynamicDimensionsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  char v14;
  char v15;

  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 48);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(unsigned __int8 *)(a2 + 48);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v12 = sub_23A2A3D58(), result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v4 == v8 || (v14 = sub_23A2A3D58(), result = 0, (v14 & 1) != 0))
    {
      if (v3 == v9 && v5 == v10 || (v15 = sub_23A2A3D58(), result = 0, (v15 & 1) != 0))
      {
        if (v6)
        {
          if (v6 == 1)
          {
            if (v11 == 1)
              return 1;
          }
          else if (v11 == 2)
          {
            return 1;
          }
        }
        else if (!v11)
        {
          return 1;
        }
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_23A29FFCC()
{
  unint64_t result;

  result = qword_25695C7E8;
  if (!qword_25695C7E8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A626C, &type metadata for DynamicDimensions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C7E8);
  }
  return result;
}

unint64_t sub_23A2A0010()
{
  unint64_t result;

  result = qword_25695C7F0;
  if (!qword_25695C7F0)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea, &type metadata for ProductArea);
    atomic_store(result, (unint64_t *)&qword_25695C7F0);
  }
  return result;
}

unint64_t sub_23A2A0054()
{
  unint64_t result;

  result = qword_25695C800;
  if (!qword_25695C800)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea, &type metadata for ProductArea);
    atomic_store(result, (unint64_t *)&qword_25695C800);
  }
  return result;
}

unint64_t sub_23A2A0098()
{
  unint64_t result;

  result = qword_25695C810;
  if (!qword_25695C810)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A621C, &type metadata for TaskCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C810);
  }
  return result;
}

unint64_t sub_23A2A00DC()
{
  unint64_t result;

  result = qword_25695C828;
  if (!qword_25695C828)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A61CC, &type metadata for CountsReported.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C828);
  }
  return result;
}

unint64_t sub_23A2A0120()
{
  unint64_t result;

  result = qword_25695C830;
  if (!qword_25695C830)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for DynamicDimensions, &type metadata for DynamicDimensions);
    atomic_store(result, (unint64_t *)&qword_25695C830);
  }
  return result;
}

unint64_t sub_23A2A0164()
{
  unint64_t result;

  result = qword_25695C838;
  if (!qword_25695C838)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for TaskCounts, &type metadata for TaskCounts);
    atomic_store(result, (unint64_t *)&qword_25695C838);
  }
  return result;
}

unint64_t sub_23A2A01A8()
{
  unint64_t result;

  result = qword_25695C848;
  if (!qword_25695C848)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for AggregationInterval, &type metadata for AggregationInterval);
    atomic_store(result, (unint64_t *)&qword_25695C848);
  }
  return result;
}

unint64_t sub_23A2A01EC()
{
  unint64_t result;

  result = qword_25695C850;
  if (!qword_25695C850)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for DynamicDimensions, &type metadata for DynamicDimensions);
    atomic_store(result, (unint64_t *)&qword_25695C850);
  }
  return result;
}

unint64_t sub_23A2A0230()
{
  unint64_t result;

  result = qword_25695C858;
  if (!qword_25695C858)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for TaskCounts, &type metadata for TaskCounts);
    atomic_store(result, (unint64_t *)&qword_25695C858);
  }
  return result;
}

unint64_t sub_23A2A0278()
{
  unint64_t result;

  result = qword_25695C860;
  if (!qword_25695C860)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.MessagingType, &type metadata for ProductArea.MessagingType);
    atomic_store(result, (unint64_t *)&qword_25695C860);
  }
  return result;
}

unint64_t sub_23A2A02C0()
{
  unint64_t result;

  result = qword_25695C868;
  if (!qword_25695C868)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.RemindersType, &type metadata for ProductArea.RemindersType);
    atomic_store(result, (unint64_t *)&qword_25695C868);
  }
  return result;
}

unint64_t sub_23A2A0308()
{
  unint64_t result;

  result = qword_25695C870;
  if (!qword_25695C870)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea.PhoneCallType, &type metadata for ProductArea.PhoneCallType);
    atomic_store(result, (unint64_t *)&qword_25695C870);
  }
  return result;
}

unint64_t sub_23A2A0350()
{
  unint64_t result;

  result = qword_25695C878;
  if (!qword_25695C878)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for ProductArea, &type metadata for ProductArea);
    atomic_store(result, (unint64_t *)&qword_25695C878);
  }
  return result;
}

unint64_t sub_23A2A0398()
{
  unint64_t result;

  result = qword_25695C880;
  if (!qword_25695C880)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for AggregationInterval, &type metadata for AggregationInterval);
    atomic_store(result, (unint64_t *)&qword_25695C880);
  }
  return result;
}

unint64_t sub_23A2A03E0()
{
  unint64_t result;

  result = qword_25695C888;
  if (!qword_25695C888)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for DynamicDimensions, &type metadata for DynamicDimensions);
    atomic_store(result, (unint64_t *)&qword_25695C888);
  }
  return result;
}

unint64_t sub_23A2A0428()
{
  unint64_t result;

  result = qword_25695C890;
  if (!qword_25695C890)
  {
    result = MEMORY[0x23B847B10](&protocol conformance descriptor for AggregationKeys, &type metadata for AggregationKeys);
    atomic_store(result, (unint64_t *)&qword_25695C890);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProductArea(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  int v7;

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
  if (v6 <= 2)
    v7 = -1;
  else
    v7 = v6 ^ 0xFF;
  return (v7 + 1);
}

uint64_t storeEnumTagSinglePayload for ProductArea(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A2A055C + 4 * byte_23A2A51DD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A2A0590 + 4 * byte_23A2A51D8[v4]))();
}

uint64_t sub_23A2A0590(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A0598(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A2A05A0);
  return result;
}

uint64_t sub_23A2A05AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A2A05B4);
  *(_BYTE *)result = -(char)a2;
  return result;
}

uint64_t sub_23A2A05B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A05C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductArea()
{
  return &type metadata for ProductArea;
}

uint64_t sub_23A2A05E8()
{
  return 0;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingType()
{
  return &type metadata for ProductArea.MessagingType;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersType()
{
  return &type metadata for ProductArea.RemindersType;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallType()
{
  return &type metadata for ProductArea.PhoneCallType;
}

uint64_t storeEnumTagSinglePayload for AggregationInterval(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AggregationInterval()
{
  return &type metadata for AggregationInterval;
}

uint64_t destroy for DynamicDimensions()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DynamicDimensions(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DynamicDimensions(uint64_t a1, uint64_t a2)
{
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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DynamicDimensions(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicDimensions(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicDimensions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicDimensions()
{
  return &type metadata for DynamicDimensions;
}

uint64_t initializeWithCopy for AggregationKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AggregationKeys(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AggregationKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for AggregationKeys(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AggregationKeys(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AggregationKeys()
{
  return &type metadata for AggregationKeys;
}

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TaskCounts(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

ValueMetadata *type metadata accessor for TaskCounts()
{
  return &type metadata for TaskCounts;
}

uint64_t _s11DeepThought14CountsReportedVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CountsReported(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 68) = *(_OWORD *)(a2 + 68);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CountsReported(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy84_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for CountsReported(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 68) = *(_OWORD *)(a2 + 68);
  return a1;
}

uint64_t getEnumTagSinglePayload for CountsReported(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 84))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CountsReported(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 84) = 1;
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
    *(_BYTE *)(result + 84) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CountsReported()
{
  return &type metadata for CountsReported;
}

ValueMetadata *type metadata accessor for CountsReported.CodingKeys()
{
  return &type metadata for CountsReported.CodingKeys;
}

uint64_t sub_23A2A0DE4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A2A0DEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskCounts.CodingKeys()
{
  return &type metadata for TaskCounts.CodingKeys;
}

uint64_t _s11DeepThought10TaskCountsV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s11DeepThought10TaskCountsV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A2A0EE0 + 4 * byte_23A2A51E7[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A2A0F14 + 4 * byte_23A2A51E2[v4]))();
}

uint64_t sub_23A2A0F14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A0F1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A2A0F24);
  return result;
}

uint64_t sub_23A2A0F30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A2A0F38);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A2A0F3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A0F44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DynamicDimensions.CodingKeys()
{
  return &type metadata for DynamicDimensions.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AggregationInterval.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AggregationInterval.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A2A103C + 4 * byte_23A2A51F1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A2A1070 + 4 * byte_23A2A51EC[v4]))();
}

uint64_t sub_23A2A1070(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A1078(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A2A1080);
  return result;
}

uint64_t sub_23A2A108C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A2A1094);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A2A1098(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A10A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23A2A10AC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AggregationInterval.CodingKeys()
{
  return &type metadata for AggregationInterval.CodingKeys;
}

uint64_t _s11DeepThought14CountsReportedV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s11DeepThought14CountsReportedV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A2A11A4 + 4 * byte_23A2A51FB[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23A2A11D8 + 4 * byte_23A2A51F6[v4]))();
}

uint64_t sub_23A2A11D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A11E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A2A11E8);
  return result;
}

uint64_t sub_23A2A11F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A2A11FCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23A2A1200(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A2A1208(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProductArea.CodingKeys()
{
  return &type metadata for ProductArea.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingCodingKeys()
{
  return &type metadata for ProductArea.MessagingCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersCodingKeys()
{
  return &type metadata for ProductArea.RemindersCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallCodingKeys()
{
  return &type metadata for ProductArea.PhoneCallCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallType.CodingKeys()
{
  return &type metadata for ProductArea.PhoneCallType.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallType.START_CALLCodingKeys()
{
  return &type metadata for ProductArea.PhoneCallType.START_CALLCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersType.CodingKeys()
{
  return &type metadata for ProductArea.RemindersType.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersType.SET_REMINDERCodingKeys()
{
  return &type metadata for ProductArea.RemindersType.SET_REMINDERCodingKeys;
}

uint64_t _s11DeepThought11ProductAreaO13MessagingTypeOwet_0(unsigned int *a1, int a2)
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

uint64_t _s11DeepThought11ProductAreaO13MessagingTypeOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23A2A1324 + 4 * byte_23A2A5200[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23A2A1344 + 4 * byte_23A2A5205[v4]))();
}

_BYTE *sub_23A2A1324(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23A2A1344(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A2A134C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A2A1354(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23A2A135C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23A2A1364(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingType.CodingKeys()
{
  return &type metadata for ProductArea.MessagingType.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingType.SEND_SMSCodingKeys()
{
  return &type metadata for ProductArea.MessagingType.SEND_SMSCodingKeys;
}

unint64_t sub_23A2A1394()
{
  unint64_t result;

  result = qword_25695C898;
  if (!qword_25695C898)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A59D4, &type metadata for ProductArea.MessagingType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C898);
  }
  return result;
}

unint64_t sub_23A2A13DC()
{
  unint64_t result;

  result = qword_25695C8A0;
  if (!qword_25695C8A0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5ADC, &type metadata for ProductArea.RemindersType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8A0);
  }
  return result;
}

unint64_t sub_23A2A1424()
{
  unint64_t result;

  result = qword_25695C8A8;
  if (!qword_25695C8A8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5BE4, &type metadata for ProductArea.PhoneCallType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8A8);
  }
  return result;
}

unint64_t sub_23A2A146C()
{
  unint64_t result;

  result = qword_25695C8B0;
  if (!qword_25695C8B0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5C9C, &type metadata for ProductArea.PhoneCallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8B0);
  }
  return result;
}

unint64_t sub_23A2A14B4()
{
  unint64_t result;

  result = qword_25695C8B8;
  if (!qword_25695C8B8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5D54, &type metadata for ProductArea.RemindersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8B8);
  }
  return result;
}

unint64_t sub_23A2A14FC()
{
  unint64_t result;

  result = qword_25695C8C0;
  if (!qword_25695C8C0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5E0C, &type metadata for ProductArea.MessagingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8C0);
  }
  return result;
}

unint64_t sub_23A2A1544()
{
  unint64_t result;

  result = qword_25695C8C8;
  if (!qword_25695C8C8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5EC4, &type metadata for ProductArea.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8C8);
  }
  return result;
}

unint64_t sub_23A2A158C()
{
  unint64_t result;

  result = qword_25695C8D0;
  if (!qword_25695C8D0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5F7C, &type metadata for AggregationInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8D0);
  }
  return result;
}

unint64_t sub_23A2A15D4()
{
  unint64_t result;

  result = qword_25695C8D8;
  if (!qword_25695C8D8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A6034, &type metadata for DynamicDimensions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8D8);
  }
  return result;
}

unint64_t sub_23A2A161C()
{
  unint64_t result;

  result = qword_25695C8E0;
  if (!qword_25695C8E0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A60EC, &type metadata for TaskCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8E0);
  }
  return result;
}

unint64_t sub_23A2A1664()
{
  unint64_t result;

  result = qword_25695C8E8;
  if (!qword_25695C8E8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A61A4, &type metadata for CountsReported.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8E8);
  }
  return result;
}

unint64_t sub_23A2A16AC()
{
  unint64_t result;

  result = qword_25695C8F0;
  if (!qword_25695C8F0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A6114, &type metadata for CountsReported.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8F0);
  }
  return result;
}

unint64_t sub_23A2A16F4()
{
  unint64_t result;

  result = qword_25695C8F8;
  if (!qword_25695C8F8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A613C, &type metadata for CountsReported.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C8F8);
  }
  return result;
}

unint64_t sub_23A2A173C()
{
  unint64_t result;

  result = qword_25695C900;
  if (!qword_25695C900)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A605C, &type metadata for TaskCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C900);
  }
  return result;
}

unint64_t sub_23A2A1784()
{
  unint64_t result;

  result = qword_25695C908;
  if (!qword_25695C908)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A6084, &type metadata for TaskCounts.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C908);
  }
  return result;
}

unint64_t sub_23A2A17CC()
{
  unint64_t result;

  result = qword_25695C910;
  if (!qword_25695C910)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5FA4, &type metadata for DynamicDimensions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C910);
  }
  return result;
}

unint64_t sub_23A2A1814()
{
  unint64_t result;

  result = qword_25695C918;
  if (!qword_25695C918)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5FCC, &type metadata for DynamicDimensions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C918);
  }
  return result;
}

unint64_t sub_23A2A185C()
{
  unint64_t result;

  result = qword_25695C920;
  if (!qword_25695C920)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5EEC, &type metadata for AggregationInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C920);
  }
  return result;
}

unint64_t sub_23A2A18A4()
{
  unint64_t result;

  result = qword_25695C928;
  if (!qword_25695C928)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5F14, &type metadata for AggregationInterval.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C928);
  }
  return result;
}

unint64_t sub_23A2A18EC()
{
  unint64_t result;

  result = qword_25695C930;
  if (!qword_25695C930)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5D7C, &type metadata for ProductArea.MessagingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C930);
  }
  return result;
}

unint64_t sub_23A2A1934()
{
  unint64_t result;

  result = qword_25695C938;
  if (!qword_25695C938)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5DA4, &type metadata for ProductArea.MessagingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C938);
  }
  return result;
}

unint64_t sub_23A2A197C()
{
  unint64_t result;

  result = qword_25695C940;
  if (!qword_25695C940)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5CC4, &type metadata for ProductArea.RemindersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C940);
  }
  return result;
}

unint64_t sub_23A2A19C4()
{
  unint64_t result;

  result = qword_25695C948;
  if (!qword_25695C948)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5CEC, &type metadata for ProductArea.RemindersCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C948);
  }
  return result;
}

unint64_t sub_23A2A1A0C()
{
  unint64_t result;

  result = qword_25695C950;
  if (!qword_25695C950)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5C0C, &type metadata for ProductArea.PhoneCallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C950);
  }
  return result;
}

unint64_t sub_23A2A1A54()
{
  unint64_t result;

  result = qword_25695C958;
  if (!qword_25695C958)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5C34, &type metadata for ProductArea.PhoneCallCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C958);
  }
  return result;
}

unint64_t sub_23A2A1A9C()
{
  unint64_t result;

  result = qword_25695C960;
  if (!qword_25695C960)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5E34, &type metadata for ProductArea.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C960);
  }
  return result;
}

unint64_t sub_23A2A1AE4()
{
  unint64_t result;

  result = qword_25695C968;
  if (!qword_25695C968)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5E5C, &type metadata for ProductArea.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C968);
  }
  return result;
}

unint64_t sub_23A2A1B2C()
{
  unint64_t result;

  result = qword_25695C970;
  if (!qword_25695C970)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5B04, &type metadata for ProductArea.PhoneCallType.START_CALLCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C970);
  }
  return result;
}

unint64_t sub_23A2A1B74()
{
  unint64_t result;

  result = qword_25695C978;
  if (!qword_25695C978)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5B2C, &type metadata for ProductArea.PhoneCallType.START_CALLCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C978);
  }
  return result;
}

unint64_t sub_23A2A1BBC()
{
  unint64_t result;

  result = qword_25695C980;
  if (!qword_25695C980)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5B54, &type metadata for ProductArea.PhoneCallType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C980);
  }
  return result;
}

unint64_t sub_23A2A1C04()
{
  unint64_t result;

  result = qword_25695C988;
  if (!qword_25695C988)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5B7C, &type metadata for ProductArea.PhoneCallType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C988);
  }
  return result;
}

unint64_t sub_23A2A1C4C()
{
  unint64_t result;

  result = qword_25695C990;
  if (!qword_25695C990)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A59FC, &type metadata for ProductArea.RemindersType.SET_REMINDERCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C990);
  }
  return result;
}

unint64_t sub_23A2A1C94()
{
  unint64_t result;

  result = qword_25695C998;
  if (!qword_25695C998)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5A24, &type metadata for ProductArea.RemindersType.SET_REMINDERCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C998);
  }
  return result;
}

unint64_t sub_23A2A1CDC()
{
  unint64_t result;

  result = qword_25695C9A0;
  if (!qword_25695C9A0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5A4C, &type metadata for ProductArea.RemindersType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C9A0);
  }
  return result;
}

unint64_t sub_23A2A1D24()
{
  unint64_t result;

  result = qword_25695C9A8;
  if (!qword_25695C9A8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5A74, &type metadata for ProductArea.RemindersType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C9A8);
  }
  return result;
}

unint64_t sub_23A2A1D6C()
{
  unint64_t result;

  result = qword_25695C9B0;
  if (!qword_25695C9B0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A58F4, &type metadata for ProductArea.MessagingType.SEND_SMSCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C9B0);
  }
  return result;
}

unint64_t sub_23A2A1DB4()
{
  unint64_t result;

  result = qword_25695C9B8;
  if (!qword_25695C9B8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A591C, &type metadata for ProductArea.MessagingType.SEND_SMSCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C9B8);
  }
  return result;
}

unint64_t sub_23A2A1DFC()
{
  unint64_t result;

  result = qword_25695C9C0;
  if (!qword_25695C9C0)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A5944, &type metadata for ProductArea.MessagingType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C9C0);
  }
  return result;
}

unint64_t sub_23A2A1E44()
{
  unint64_t result;

  result = qword_25695C9C8;
  if (!qword_25695C9C8)
  {
    result = MEMORY[0x23B847B10](&unk_23A2A596C, &type metadata for ProductArea.MessagingType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25695C9C8);
  }
  return result;
}

uint64_t sub_23A2A1E88(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6967617373654DLL && a2 == 0xE900000000000067;
  if (v2 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265646E696D6552 && a2 == 0xE900000000000073 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6143656E6F6850 && a2 == 0xE90000000000006CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23A2A1FE8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000019 && a2 == 0x800000023A2AA110 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000033 && a2 == 0x800000023A2AA690)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_23A2A20D0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x75706E4969726973 && a2 == 0xEF656C61636F4C74;
  if (v2 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F4D77656976 && a2 == 0xE800000000000000 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E496F69647561 && a2 == 0xEE00656361667265 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x41746375646F7270 && a2 == 0xEB00000000616572)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23A2A22E8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000016 && a2 == 0x800000023A2AA6D0 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023A2AA6F0 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023A2AA710 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000023A2AA730)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_23A2A247C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x800000023A2AA750 || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_23A2A3D58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E756F436B736174 && a2 == 0xEA00000000007374)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23A2A3D58();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t static LocaleChangingPointUtils.findLocaleChangingPoint(date:localeChangingPoints:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a3;
  v5 = sub_23A2A3560();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  if (!v9)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_6;
  }
  v21 = type metadata accessor for DateAndLocalePair();
  v10 = *(_QWORD *)(v21 - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = a2 + v11;
  v13 = sub_23A2A353C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((v13 & 1) != 0)
  {
LABEL_6:
    v15 = type metadata accessor for DateAndLocalePair();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v22, 1, 1, v15);
  }
  if (v9 == 1)
  {
    v14 = a2 + v11;
  }
  else
  {
    v17 = *(_QWORD *)(v10 + 72);
    sub_23A28338C(&qword_25695B2B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v18 = a2 + v17 + v11;
    v19 = 1;
    while (1)
    {
      result = sub_23A2A3A4C();
      if ((result & 1) != 0)
        break;
      ++v19;
      v18 += v17;
      if (v9 == v19)
      {
        v19 = v9;
        break;
      }
    }
    if (v19 - 1 >= v9)
    {
      __break(1u);
      return result;
    }
    v14 = v12 + (v19 - 1) * v17;
  }
  v20 = v22;
  sub_23A2A3020(v14, v22);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v21);
}

uint64_t DateAndLocalePair.hash(into:)()
{
  sub_23A2A3560();
  sub_23A28338C(&qword_25695C9D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23A2A3A40();
  type metadata accessor for DateAndLocalePair();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  return swift_bridgeObjectRelease();
}

uint64_t static DateAndLocalePair.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if ((sub_23A2A3548() & 1) == 0)
    return 0;
  v4 = *(int *)(type metadata accessor for DateAndLocalePair() + 20);
  v5 = *(_QWORD *)(a1 + v4);
  v6 = *(_QWORD *)(a1 + v4 + 8);
  v7 = (_QWORD *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1])
    return 1;
  else
    return sub_23A2A3D58();
}

uint64_t DateAndLocalePair.hashValue.getter()
{
  sub_23A2A3D7C();
  sub_23A2A3560();
  sub_23A28338C(&qword_25695C9D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23A2A3A40();
  type metadata accessor for DateAndLocalePair();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  return sub_23A2A3DAC();
}

uint64_t sub_23A2A2960()
{
  sub_23A2A3D7C();
  sub_23A2A3560();
  sub_23A28338C(&qword_25695C9D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23A2A3A40();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  return sub_23A2A3DAC();
}

uint64_t sub_23A2A2A04()
{
  sub_23A2A3560();
  sub_23A28338C(&qword_25695C9D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23A2A3A40();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A2A2A8C()
{
  sub_23A2A3D7C();
  sub_23A2A3560();
  sub_23A28338C(&qword_25695C9D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_23A2A3A40();
  swift_bridgeObjectRetain();
  sub_23A2A3AAC();
  swift_bridgeObjectRelease();
  return sub_23A2A3DAC();
}

uint64_t sub_23A2A2B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if ((sub_23A2A3548() & 1) == 0)
    return 0;
  v6 = *(int *)(a3 + 20);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1])
    return 1;
  else
    return sub_23A2A3D58();
}

unint64_t _s11DeepThought24LocaleChangingPointUtilsO03getcD6Points23featurizedConversationsSayAA07DateAndC4PairVGSay0aB15BiomeFoundation22FeaturizedConversationCG_tFZ_0(unint64_t a1)
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
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v29[2];
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;

  v2 = type metadata accessor for DateAndLocalePair();
  v36 = *(_QWORD *)(v2 - 8);
  v37 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v39 = (uint64_t)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v38 = (uint64_t)v29 - v5;
  v6 = sub_23A2A3560();
  v42 = *(_QWORD *)(v6 - 8);
  v43 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_38;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    v27 = MEMORY[0x24BEE4AF8];
    goto LABEL_40;
  }
LABEL_3:
  v10 = 0;
  v11 = 0;
  v33 = a1 & 0xC000000000000001;
  v30 = a1 & 0xFFFFFFFFFFFFFF8;
  v31 = a1;
  v29[1] = a1 + 32;
  v40 = MEMORY[0x24BEE4AF8];
  a1 = 0xE000000000000000;
  v32 = v9;
  do
  {
    if (v33)
    {
      v13 = MEMORY[0x23B8475B8](v11, v31);
      v14 = __OFADD__(v11, 1);
      v15 = v11 + 1;
      if (v14)
        goto LABEL_35;
    }
    else
    {
      if (v11 >= *(_QWORD *)(v30 + 16))
        goto LABEL_37;
      v13 = swift_retain();
      v14 = __OFADD__(v11, 1);
      v15 = v11 + 1;
      if (v14)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
    }
    v34 = v13;
    v35 = v15;
    v16 = sub_23A2A38B4();
    if (v16 >> 62)
    {
      v17 = sub_23A2A3C74();
      if (!v17)
        goto LABEL_4;
LABEL_14:
      sub_23A2A374C();
      if (v17 >= 1)
      {
        v18 = 0;
        v41 = v16 & 0xC000000000000001;
        while (1)
        {
          if (v41)
            MEMORY[0x23B8475B8](v18, v16);
          else
            swift_retain();
          sub_23A2A38E4();
          sub_23A2A3524();
          sub_23A2A3740();
          sub_23A2A38D8();
          swift_bridgeObjectRelease();
          v19 = v45;
          if (v45)
          {
            v12 = v44;
            if ((v44 != v10 || v45 != a1) && (sub_23A2A3D58() & 1) == 0)
            {
              swift_bridgeObjectRelease();
              v20 = v38;
              (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v38, v8, v43);
              v21 = (_QWORD *)(v20 + *(int *)(v37 + 20));
              *v21 = v12;
              v21[1] = v19;
              sub_23A2A3020(v20, v39);
              swift_bridgeObjectRetain();
              v22 = v40;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v22 = sub_23A290E10(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
              v24 = *(_QWORD *)(v22 + 16);
              v23 = *(_QWORD *)(v22 + 24);
              v40 = v22;
              if (v24 >= v23 >> 1)
                v40 = sub_23A290E10(v23 > 1, v24 + 1, 1, v40);
              v25 = v39;
              v26 = v40;
              *(_QWORD *)(v40 + 16) = v24 + 1;
              sub_23A2941F0(v25, v26+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(_QWORD *)(v36 + 72) * v24);
              swift_release();
              sub_23A294234(v38);
              (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v43);
              a1 = v19;
              goto LABEL_18;
            }
            (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v43);
            swift_bridgeObjectRelease();
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v43);
          }
          swift_release();
          v12 = v10;
LABEL_18:
          ++v18;
          v10 = v12;
          if (v17 == v18)
            goto LABEL_5;
        }
      }
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain();
      v9 = sub_23A2A3C74();
      if (!v9)
        goto LABEL_39;
      goto LABEL_3;
    }
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v17)
      goto LABEL_14;
LABEL_4:
    v12 = v10;
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    v10 = v12;
    v11 = v35;
  }
  while (v35 != v32);
  swift_bridgeObjectRelease();
  v27 = v40;
LABEL_40:
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t type metadata accessor for DateAndLocalePair()
{
  uint64_t result;

  result = qword_25695CA38;
  if (!qword_25695CA38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A2A3020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DateAndLocalePair();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A2A3064()
{
  return sub_23A28338C(&qword_25695C9D8, (uint64_t (*)(uint64_t))type metadata accessor for DateAndLocalePair, (uint64_t)&protocol conformance descriptor for DateAndLocalePair);
}

uint64_t *initializeBufferWithCopyOfBuffer for DateAndLocalePair(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
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
    v7 = sub_23A2A3560();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DateAndLocalePair(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A2A3560();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_23A2A3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_23A2A3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A2A3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23A2A3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DateAndLocalePair()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A2A3324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A2A3560();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DateAndLocalePair()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A2A33B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A2A3560();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23A2A342C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2A3560();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocaleChangingPointUtils()
{
  return &type metadata for LocaleChangingPointUtils;
}

uint64_t sub_23A2A34AC()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_23A2A34B8()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_23A2A34C4()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_23A2A34D0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23A2A34DC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23A2A34E8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23A2A34F4()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_23A2A3500()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23A2A350C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23A2A3518()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A2A3524()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_23A2A3530()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_23A2A353C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23A2A3548()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23A2A3554()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23A2A3560()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A2A356C()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23A2A3578()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A2A3584()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23A2A3590()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A2A359C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A2A35A8()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_23A2A35B4()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_23A2A35C0()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_23A2A35CC()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_23A2A35D8()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_23A2A35E4()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_23A2A35F0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23A2A35FC()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_23A2A3608()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_23A2A3614()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_23A2A3620()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_23A2A362C()
{
  return MEMORY[0x24BDCF138]();
}

uint64_t sub_23A2A3638()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23A2A3644()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23A2A3650()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_23A2A365C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23A2A3668()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23A2A3674()
{
  return MEMORY[0x24BDCF4B0]();
}

uint64_t sub_23A2A3680()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23A2A368C()
{
  return MEMORY[0x24BECE080]();
}

uint64_t sub_23A2A3698()
{
  return MEMORY[0x24BECE090]();
}

uint64_t sub_23A2A36A4()
{
  return MEMORY[0x24BECE098]();
}

uint64_t sub_23A2A36B0()
{
  return MEMORY[0x24BECE140]();
}

uint64_t sub_23A2A36BC()
{
  return MEMORY[0x24BE2B8E0]();
}

uint64_t sub_23A2A36C8()
{
  return MEMORY[0x24BE2B8F0]();
}

uint64_t sub_23A2A36D4()
{
  return MEMORY[0x24BE2B8F8]();
}

uint64_t sub_23A2A36E0()
{
  return MEMORY[0x24BE2B900]();
}

uint64_t sub_23A2A36EC()
{
  return MEMORY[0x24BE2B908]();
}

uint64_t sub_23A2A36F8()
{
  return MEMORY[0x24BE2B910]();
}

uint64_t sub_23A2A3704()
{
  return MEMORY[0x24BE2B940]();
}

uint64_t sub_23A2A3710()
{
  return MEMORY[0x24BE2B948]();
}

uint64_t sub_23A2A371C()
{
  return MEMORY[0x24BE2B958]();
}

uint64_t sub_23A2A3728()
{
  return MEMORY[0x24BE2B998]();
}

uint64_t sub_23A2A3734()
{
  return MEMORY[0x24BE2B9A0]();
}

uint64_t sub_23A2A3740()
{
  return MEMORY[0x24BE2B9C0]();
}

uint64_t sub_23A2A374C()
{
  return MEMORY[0x24BE2B9C8]();
}

uint64_t sub_23A2A3758()
{
  return MEMORY[0x24BE2B9D0]();
}

uint64_t sub_23A2A3764()
{
  return MEMORY[0x24BE2B9D8]();
}

uint64_t sub_23A2A3770()
{
  return MEMORY[0x24BE2B9E0]();
}

uint64_t sub_23A2A377C()
{
  return MEMORY[0x24BE2B9E8]();
}

uint64_t sub_23A2A3788()
{
  return MEMORY[0x24BE2B9F0]();
}

uint64_t sub_23A2A3794()
{
  return MEMORY[0x24BE2B9F8]();
}

uint64_t sub_23A2A37A0()
{
  return MEMORY[0x24BE2BA00]();
}

uint64_t sub_23A2A37AC()
{
  return MEMORY[0x24BE2BA08]();
}

uint64_t sub_23A2A37B8()
{
  return MEMORY[0x24BE2BA10]();
}

uint64_t sub_23A2A37C4()
{
  return MEMORY[0x24BE2BA18]();
}

uint64_t sub_23A2A37D0()
{
  return MEMORY[0x24BE2BA20]();
}

uint64_t sub_23A2A37DC()
{
  return MEMORY[0x24BE2BA28]();
}

uint64_t sub_23A2A37E8()
{
  return MEMORY[0x24BE2BA30]();
}

uint64_t sub_23A2A37F4()
{
  return MEMORY[0x24BE2BA38]();
}

uint64_t sub_23A2A3800()
{
  return MEMORY[0x24BE2BA40]();
}

uint64_t sub_23A2A380C()
{
  return MEMORY[0x24BE2BA48]();
}

uint64_t sub_23A2A3818()
{
  return MEMORY[0x24BE2BA50]();
}

uint64_t sub_23A2A3824()
{
  return MEMORY[0x24BE2BA58]();
}

uint64_t sub_23A2A3830()
{
  return MEMORY[0x24BE2BA60]();
}

uint64_t sub_23A2A383C()
{
  return MEMORY[0x24BE2BA88]();
}

uint64_t sub_23A2A3848()
{
  return MEMORY[0x24BE2BA90]();
}

uint64_t sub_23A2A3854()
{
  return MEMORY[0x24BE2BA98]();
}

uint64_t sub_23A2A3860()
{
  return MEMORY[0x24BE2BAB0]();
}

uint64_t sub_23A2A386C()
{
  return MEMORY[0x24BE2BAC0]();
}

uint64_t sub_23A2A3878()
{
  return MEMORY[0x24BE2BAF8]();
}

uint64_t sub_23A2A3884()
{
  return MEMORY[0x24BE2BB00]();
}

uint64_t sub_23A2A3890()
{
  return MEMORY[0x24BE2BB20]();
}

uint64_t sub_23A2A389C()
{
  return MEMORY[0x24BE2BB30]();
}

uint64_t sub_23A2A38A8()
{
  return MEMORY[0x24BE2BB38]();
}

uint64_t sub_23A2A38B4()
{
  return MEMORY[0x24BE2BB48]();
}

uint64_t sub_23A2A38C0()
{
  return MEMORY[0x24BE2BBB8]();
}

uint64_t sub_23A2A38CC()
{
  return MEMORY[0x24BE2BBC0]();
}

uint64_t sub_23A2A38D8()
{
  return MEMORY[0x24BE2BBE8]();
}

uint64_t sub_23A2A38E4()
{
  return MEMORY[0x24BE2BC08]();
}

uint64_t sub_23A2A38F0()
{
  return MEMORY[0x24BE2BC28]();
}

uint64_t sub_23A2A38FC()
{
  return MEMORY[0x24BE2BC30]();
}

uint64_t sub_23A2A3908()
{
  return MEMORY[0x24BE2BC38]();
}

uint64_t sub_23A2A3914()
{
  return MEMORY[0x24BE2BC48]();
}

uint64_t sub_23A2A3920()
{
  return MEMORY[0x24BE2BC50]();
}

uint64_t sub_23A2A392C()
{
  return MEMORY[0x24BE2BC68]();
}

uint64_t sub_23A2A3938()
{
  return MEMORY[0x24BE2BC70]();
}

uint64_t sub_23A2A3944()
{
  return MEMORY[0x24BE2BC78]();
}

uint64_t sub_23A2A3950()
{
  return MEMORY[0x24BE2BC80]();
}

uint64_t sub_23A2A395C()
{
  return MEMORY[0x24BE2BC88]();
}

uint64_t sub_23A2A3968()
{
  return MEMORY[0x24BE2BC90]();
}

uint64_t sub_23A2A3974()
{
  return MEMORY[0x24BE2BC98]();
}

uint64_t sub_23A2A3980()
{
  return MEMORY[0x24BE2BCA0]();
}

uint64_t sub_23A2A398C()
{
  return MEMORY[0x24BE2BCA8]();
}

uint64_t sub_23A2A3998()
{
  return MEMORY[0x24BE2BCB0]();
}

uint64_t sub_23A2A39A4()
{
  return MEMORY[0x24BE2BCB8]();
}

uint64_t sub_23A2A39B0()
{
  return MEMORY[0x24BE2BCC0]();
}

uint64_t sub_23A2A39BC()
{
  return MEMORY[0x24BE2BCD0]();
}

uint64_t sub_23A2A39C8()
{
  return MEMORY[0x24BE2BCD8]();
}

uint64_t sub_23A2A39D4()
{
  return MEMORY[0x24BE2BCE0]();
}

uint64_t sub_23A2A39E0()
{
  return MEMORY[0x24BE2BCE8]();
}

uint64_t sub_23A2A39EC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A2A39F8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A2A3A04()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A2A3A10()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23A2A3A1C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23A2A3A28()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23A2A3A34()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23A2A3A40()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23A2A3A4C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23A2A3A58()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A2A3A64()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A2A3A70()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A2A3A7C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23A2A3A88()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23A2A3A94()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23A2A3AA0()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_23A2A3AAC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A2A3AB8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23A2A3AC4()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23A2A3AD0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A2A3ADC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A2A3AE8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23A2A3AF4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23A2A3B00()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A2A3B0C()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_23A2A3B18()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23A2A3B24()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_23A2A3B30()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23A2A3B3C()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_23A2A3B48()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23A2A3B54()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_23A2A3B60()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23A2A3B6C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23A2A3B78()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A2A3B84()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A2A3B90()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A2A3B9C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23A2A3BA8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A2A3BB4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A2A3BC0()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_23A2A3BCC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A2A3BD8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23A2A3BE4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A2A3BF0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A2A3BFC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A2A3C08()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_23A2A3C14()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A2A3C20()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23A2A3C2C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A2A3C38()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A2A3C44()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A2A3C50()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A2A3C5C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A2A3C68()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A2A3C74()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A2A3C80()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A2A3C8C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A2A3C98()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A2A3CA4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A2A3CB0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23A2A3CBC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23A2A3CC8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A2A3CD4()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_23A2A3CE0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A2A3CEC()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_23A2A3CF8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23A2A3D04()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23A2A3D10()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A2A3D1C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_23A2A3D28()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A2A3D34()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_23A2A3D40()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_23A2A3D4C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A2A3D58()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A2A3D64()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A2A3D70()
{
  return MEMORY[0x24BDD0730]();
}

uint64_t sub_23A2A3D7C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A2A3D88()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A2A3D94()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A2A3DA0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23A2A3DAC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A2A3DB8()
{
  return MEMORY[0x24BDD07D0]();
}

uint64_t sub_23A2A3DC4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A2A3DD0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A2A3DDC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A2A3DE8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23A2A3DF4()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x24BEE4C90]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

