uint64_t DeviceContextBuilder.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DeviceContextBuilder.init()()
{
  uint64_t v0;

  return v0;
}

id DeviceContextBuilder.getCurrentDeviceContext()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  id result;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t inited;
  _BYTE v21[64];

  v2 = sub_23F357C4C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = (id)MobileGestalt_get_current_device();
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  v7 = result;
  v8 = (id)MobileGestalt_copy_buildVersion_obj();

  if (v8)
  {
    v9 = sub_23F357F10();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  sub_23F357C40();
  v12 = sub_23F357C34();
  v14 = v13;
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  result = (id)MobileGestalt_get_current_device();
  if (!result)
    goto LABEL_11;
  v15 = result;
  v16 = (id)MobileGestalt_copy_marketingNameString_obj();

  if (v16)
  {
    v17 = sub_23F357F10();
    v19 = v18;

  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  sub_23F34D6BC(&qword_256E6D170);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F3583F0;
  *(_QWORD *)(inited + 32) = 0x79746867696DLL;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = 7104878;
  *(_QWORD *)(inited + 56) = 0xE300000000000000;
  result = (id)sub_23F357F04();
  *a1 = v12;
  a1[1] = v14;
  a1[2] = (uint64_t)result;
  a1[3] = v9;
  a1[4] = v11;
  a1[5] = v17;
  a1[6] = v19;
  return result;
}

uint64_t sub_23F34D6BC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242669E98]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t DeviceContextBuilder.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DeviceContextBuilder.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceContextBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for DeviceContextBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceContextBuilder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_23F34D748(char a1)
{
  if (!a1)
    return 0xD00000000000001ELL;
  if (a1 == 1)
    return 0xD00000000000001DLL;
  return 0xD00000000000002ALL;
}

BOOL sub_23F34D7A4(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_23F34D7B4(char *a1, char *a2)
{
  return sub_23F34D7A4(*a1, *a2);
}

unint64_t sub_23F34D7D4()
{
  char *v0;

  return sub_23F34D748(*v0);
}

uint64_t (*TranscriptContext.userUtterance.modify())()
{
  return nullsub_1;
}

uint64_t (*TranscriptContext.rgInputPayload.modify())()
{
  return nullsub_1;
}

uint64_t (*TranscriptContext.finalResponse.modify())()
{
  return nullsub_1;
}

unint64_t TranscriptContext.toolRetrievalConfidence.getter()
{
  uint64_t v0;

  return sub_23F350418(*(unsigned int *)(v0 + 40));
}

uint64_t TranscriptContext.toolRetrievalConfidence.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 40) = result;
  *(_BYTE *)(v1 + 44) = BYTE4(result) & 1;
  return result;
}

uint64_t (*TranscriptContext.toolRetrievalConfidence.modify())()
{
  return nullsub_1;
}

uint64_t TranscriptContext.toolRetrievalOutputs.getter()
{
  return swift_bridgeObjectRetain();
}

void TranscriptContext.toolRetrievalOutputs.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  sub_23F35039C();
}

uint64_t (*TranscriptContext.toolRetrievalOutputs.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.locale.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.assetsInfo.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.osVersion.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.deviceType.modify())()
{
  return nullsub_1;
}

uint64_t DeviceContext.toDict()()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t inited;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v2 = *v0;
  v1 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = v0[5];
  v7 = v0[6];
  sub_23F34D6BC(&qword_256E6D210);
  inited = swift_initStackObject();
  v9 = (_QWORD *)inited;
  *(_OWORD *)(inited + 16) = xmmword_23F358460;
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 32) = 0x656C61636F6CLL;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  if (v1)
    v11 = v2;
  else
    v11 = 0;
  v12 = 0xE000000000000000;
  if (v1)
    v12 = v1;
  *(_QWORD *)(inited + 48) = v11;
  *(_QWORD *)(inited + 56) = v12;
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = 0x6E49737465737361;
  *(_QWORD *)(inited + 88) = 0xEA00000000006F66;
  *(_QWORD *)(inited + 120) = sub_23F34D6BC(&qword_256E6D218);
  swift_bridgeObjectRetain();
  if (v3)
    v13 = v3;
  else
    v13 = sub_23F350480();
  v9[12] = v13;
  v9[16] = 0x6F6973726556736FLL;
  v9[17] = 0xE90000000000006ELL;
  if (v5)
    v14 = v4;
  else
    v14 = 0;
  v15 = 0xE000000000000000;
  if (v5)
    v16 = v5;
  else
    v16 = 0xE000000000000000;
  v9[18] = v14;
  v9[19] = v16;
  v9[21] = v10;
  v9[22] = 0x7954656369766564;
  v9[27] = v10;
  if (v7)
    v17 = v6;
  else
    v17 = 0;
  if (v7)
    v15 = v7;
  v9[23] = 0xEA00000000006570;
  v9[24] = v17;
  v9[25] = v15;
  sub_23F3504E8();
  sub_23F350384();
  sub_23F3503FC();
  return sub_23F357F04();
}

void RetrievedTool.id.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void RetrievedTool.id.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F3503B8();
  *v1 = v2;
  v1[1] = v0;
  sub_23F350378();
}

uint64_t (*RetrievedTool.id.modify())()
{
  return nullsub_1;
}

void RetrievedTool.name.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void RetrievedTool.name.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F350404();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  sub_23F350378();
}

uint64_t (*RetrievedTool.name.modify())()
{
  return nullsub_1;
}

void RetrievedTool.toolType.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void RetrievedTool.toolType.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F350404();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  sub_23F350378();
}

uint64_t (*RetrievedTool.toolType.modify())()
{
  return nullsub_1;
}

void __swiftcall RetrievedTool.init(id:name:toolType:)(IntelligenceFlowFeedbackDataCollector::RetrievedTool *__return_ptr retstr, Swift::String_optional id, Swift::String_optional name, Swift::String_optional toolType)
{
  retstr->id = id;
  retstr->name = name;
  retstr->toolType = toolType;
}

uint64_t RetrievedTool.toDict()()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  sub_23F34D6BC(&qword_256E6D170);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F358470;
  *(_QWORD *)(inited + 32) = 25705;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  if (v1)
    v8 = v2;
  else
    v8 = 0;
  if (v1)
    v9 = v1;
  else
    v9 = 0xE000000000000000;
  *(_QWORD *)(inited + 48) = v8;
  *(_QWORD *)(inited + 56) = v9;
  *(_QWORD *)(inited + 64) = 1701667182;
  *(_QWORD *)(inited + 72) = 0xE400000000000000;
  if (v3)
    v10 = v4;
  else
    v10 = 0;
  if (v3)
    v11 = v3;
  else
    v11 = 0xE000000000000000;
  *(_QWORD *)(inited + 80) = v10;
  *(_QWORD *)(inited + 88) = v11;
  sub_23F3504F0();
  v12[12] = v14;
  v12[13] = 0xE800000000000000;
  if (v5)
    v15 = v6;
  else
    v15 = 0;
  if (v5)
    v13 = v5;
  v12[14] = v15;
  v12[15] = v13;
  sub_23F3504E8();
  sub_23F350384();
  sub_23F3503FC();
  return sub_23F350480();
}

void FeedbackDataView.OriginalContent.userUtterance.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void FeedbackDataView.OriginalContent.userUtterance.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F3503B8();
  *v1 = v2;
  v1[1] = v0;
  sub_23F350378();
}

uint64_t (*FeedbackDataView.OriginalContent.userUtterance.modify())()
{
  return nullsub_1;
}

void FeedbackDataView.OriginalContent.toDict()()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t inited;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = *v0;
  v1 = v0[1];
  sub_23F34D6BC(&qword_256E6D170);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23F3583F0;
  v5 = sub_23F3504A0(inited, 0x6574745572657375);
  if (v4)
    v6 = 0;
  else
    v6 = v2;
  v7 = 0xE000000000000000;
  if (!v4)
    v7 = v1;
  *(_QWORD *)(v5 + 48) = v6;
  *(_QWORD *)(v5 + 56) = v7;
  sub_23F3503FC();
  sub_23F350480();
  sub_23F350498();
}

uint64_t FeedbackDataView.GeneratedContent.rgInputPayload.getter()
{
  return swift_bridgeObjectRetain();
}

void FeedbackDataView.GeneratedContent.rgInputPayload.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  sub_23F35039C();
}

uint64_t (*FeedbackDataView.GeneratedContent.rgInputPayload.modify())()
{
  return nullsub_1;
}

void FeedbackDataView.GeneratedContent.finalResponse.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void FeedbackDataView.GeneratedContent.finalResponse.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F350404();
  sub_23F350490();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v0;
  sub_23F350378();
}

uint64_t (*FeedbackDataView.GeneratedContent.finalResponse.modify())()
{
  return nullsub_1;
}

unint64_t FeedbackDataView.GeneratedContent.toolRetrievalConfidence.getter()
{
  uint64_t v0;

  return sub_23F350418(*(unsigned int *)(v0 + 32));
}

uint64_t FeedbackDataView.GeneratedContent.toolRetrievalConfidence.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 32) = result;
  *(_BYTE *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

uint64_t (*FeedbackDataView.GeneratedContent.toolRetrievalConfidence.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.GeneratedContent.init(rgInputPayload:finalResponse:toolRetrievalOutputs:toolRetrievalConfidence:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_DWORD *)(a6 + 32) = a5;
  *(_BYTE *)(a6 + 36) = BYTE4(a5) & 1;
  return result;
}

uint64_t FeedbackDataView.GeneratedContent.toDict()()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int v4;
  int64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t inited;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  int v40;
  int v41;

  v1 = *v0;
  v37 = v0[1];
  v2 = v0[2];
  v3 = v0[3];
  v4 = *((_DWORD *)v0 + 8);
  v41 = *((unsigned __int8 *)v0 + 36);
  if (v3)
  {
    v40 = v4;
    v5 = *(_QWORD *)(v3 + 16);
    v6 = MEMORY[0x24BEE4AF8];
    if (v5)
    {
      v35 = v2;
      v36 = v1;
      *(_QWORD *)&v38 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_23F34F08C(0, v5, 0);
      v7 = (unint64_t *)(v3 + 40);
      do
      {
        v9 = *(v7 - 1);
        v8 = *v7;
        v11 = v7[1];
        v10 = v7[2];
        v13 = v7[3];
        v12 = v7[4];
        sub_23F34D6BC(&qword_256E6D170);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_23F358470;
        *(_QWORD *)(inited + 32) = 25705;
        if (v8)
          v15 = v9;
        else
          v15 = 0;
        if (v8)
          v16 = v8;
        else
          v16 = 0xE000000000000000;
        *(_QWORD *)(inited + 40) = 0xE200000000000000;
        *(_QWORD *)(inited + 48) = v15;
        *(_QWORD *)(inited + 56) = v16;
        *(_QWORD *)(inited + 64) = 1701667182;
        if (v10)
          v17 = v11;
        else
          v17 = 0;
        *(_QWORD *)(inited + 72) = 0xE400000000000000;
        *(_QWORD *)(inited + 80) = v17;
        sub_23F3504F0();
        v18[11] = v21;
        v18[12] = v20;
        if (v12)
          v22 = v13;
        else
          v22 = 0;
        if (v12)
          v23 = v12;
        else
          v23 = v19;
        v18[13] = 0xE800000000000000;
        v18[14] = v22;
        v18[15] = v23;
        sub_23F350488();
        sub_23F350488();
        sub_23F350488();
        v24 = sub_23F357F04();
        sub_23F350410();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v6 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23F34F08C(0, *(_QWORD *)(v38 + 16) + 1, 1);
          v6 = v38;
        }
        v26 = *(_QWORD *)(v6 + 16);
        v25 = *(_QWORD *)(v6 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_23F34F08C((char *)(v25 > 1), v26 + 1, 1);
          v6 = v38;
        }
        v7 += 6;
        *(_QWORD *)(v6 + 16) = v26 + 1;
        *(_QWORD *)(v6 + 8 * v26 + 32) = v24;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      v1 = v36;
      v4 = v40;
      v2 = v35;
    }
    else
    {
      v4 = v40;
    }
  }
  else
  {
    v6 = MEMORY[0x24BEE4AF8];
  }
  sub_23F34D6BC(&qword_256E6D210);
  v27 = swift_initStackObject();
  *(_OWORD *)(v27 + 16) = xmmword_23F358460;
  v29 = sub_23F3504A0(v27, 0x7365526C616E6966);
  if (v28)
    v30 = 0;
  else
    v30 = v37;
  if (v28)
    v31 = 0xE000000000000000;
  else
    v31 = v2;
  *(_QWORD *)(v29 + 48) = v30;
  *(_QWORD *)(v29 + 56) = v31;
  v32 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v29 + 72) = MEMORY[0x24BEE0D00];
  strcpy((char *)(v29 + 80), "rgInputPayload");
  *(_BYTE *)(v29 + 95) = -18;
  if (v1)
  {
    v39 = sub_23F34D6BC(&qword_256E6D230);
    *(_QWORD *)&v38 = v1;
    sub_23F34E194(&v38, (_OWORD *)(v27 + 96));
  }
  else
  {
    *(_QWORD *)(v27 + 120) = v32;
    *(_QWORD *)(v27 + 96) = 0;
    *(_QWORD *)(v27 + 104) = 0xE000000000000000;
  }
  sub_23F3503FC();
  *(_QWORD *)(v27 + 128) = 0xD000000000000014;
  *(_QWORD *)(v27 + 136) = 0x800000023F358B60;
  v33 = sub_23F34D6BC(&qword_256E6D220);
  *(_QWORD *)(v27 + 144) = v6;
  *(_QWORD *)(v27 + 168) = v33;
  *(_QWORD *)(v27 + 176) = 0xD000000000000017;
  *(_QWORD *)(v27 + 184) = 0x800000023F358B80;
  *(_QWORD *)(v27 + 216) = sub_23F34D6BC(&qword_256E6D228);
  *(_DWORD *)(v27 + 192) = v4;
  *(_BYTE *)(v27 + 196) = v41;
  swift_bridgeObjectRetain();
  return sub_23F357F04();
}

_OWORD *sub_23F34E194(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void FeedbackDataView.AdditionalDiagnostics.locale.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void FeedbackDataView.AdditionalDiagnostics.locale.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  sub_23F3503B8();
  *v1 = v2;
  v1[1] = v0;
  sub_23F350378();
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.locale.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.AdditionalDiagnostics.assetsInfo.getter()
{
  return swift_bridgeObjectRetain();
}

void FeedbackDataView.AdditionalDiagnostics.assetsInfo.setter(uint64_t a1)
{
  uint64_t v1;

  sub_23F350490();
  *(_QWORD *)(v1 + 16) = a1;
  sub_23F35039C();
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.assetsInfo.modify())()
{
  return nullsub_1;
}

void FeedbackDataView.AdditionalDiagnostics.osVersion.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextV13finalResponseSSSgvs_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F350404();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  sub_23F350378();
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.osVersion.modify())()
{
  return nullsub_1;
}

void FeedbackDataView.AdditionalDiagnostics.deviceType.getter()
{
  sub_23F350384();
  sub_23F3503A4();
  sub_23F35039C();
}

void _s37IntelligenceFlowFeedbackDataCollector13DeviceContextV10deviceTypeSSSgvs_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_23F350404();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 48) = v0;
  sub_23F350378();
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.deviceType.modify())()
{
  return nullsub_1;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeedbackDataView.AdditionalDiagnostics.JSON()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  Swift::String result;

  sub_23F357F34();
  MEMORY[0x24BDAC7A8]();
  sub_23F350454();
  v3 = v2 - v1;
  sub_23F357BC8();
  swift_allocObject();
  v4 = sub_23F357BBC();
  sub_23F34F0A8();
  sub_23F357BB0();
  swift_release();
  if (!v0)
  {
    sub_23F357F28();
    v5 = sub_23F357F1C();
    if (v6)
    {
      v3 = v5;
      v4 = v6;
    }
    else
    {
      sub_23F34F0E4();
      sub_23F3503D8();
      sub_23F3504C8(v9, 2);
    }
    sub_23F35046C();
  }
  v7 = v3;
  v8 = (void *)v4;
  result._object = v8;
  result._countAndFlagsBits = v7;
  return result;
}

uint64_t sub_23F34E430()
{
  return sub_23F358090();
}

uint64_t sub_23F34E454(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v3 || (sub_23F358048() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E49737465737361 && a2 == 0xEA00000000006F66;
    if (v6 || (sub_23F358048() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL;
      if (v7 || (sub_23F358048() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x7954656369766564 && a2 == 0xEA00000000006570)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_23F358048();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_23F34E5F4()
{
  return 4;
}

void sub_23F34E5FC()
{
  sub_23F358084();
  sub_23F358090();
  sub_23F35809C();
  sub_23F350498();
}

uint64_t sub_23F34E63C()
{
  return 0;
}

uint64_t sub_23F34E648(char a1)
{
  return *(_QWORD *)&aLocale_0[8 * a1];
}

void sub_23F34E668()
{
  sub_23F34E5FC();
}

uint64_t sub_23F34E680()
{
  return sub_23F34E430();
}

void sub_23F34E688()
{
  sub_23F358084();
  sub_23F358090();
  sub_23F35809C();
  sub_23F350498();
}

uint64_t sub_23F34E6C4()
{
  char *v0;

  return sub_23F34E648(*v0);
}

uint64_t sub_23F34E6CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23F34E454(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23F34E6F0()
{
  return sub_23F34E63C();
}

uint64_t sub_23F34E70C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23F34E5F4();
  *a1 = result;
  return result;
}

uint64_t sub_23F34E730()
{
  sub_23F34F188();
  return sub_23F3580C0();
}

uint64_t sub_23F34E758()
{
  sub_23F34F188();
  return sub_23F3580CC();
}

void FeedbackDataView.AdditionalDiagnostics.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sub_23F34D6BC(&qword_256E6D248);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23F350454();
  v6 = v5 - v4;
  sub_23F34F164(a1, a1[3]);
  sub_23F34F188();
  sub_23F3580B4();
  sub_23F358024();
  if (!v7)
  {
    sub_23F34D6BC(&qword_256E6D218);
    sub_23F34F228(&qword_256E6D258, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_23F358030();
    sub_23F350434();
    sub_23F350434();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  sub_23F3503E4();
}

void FeedbackDataView.AdditionalDiagnostics.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;

  v5 = sub_23F34D6BC(&qword_256E6D260);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_23F350454();
  v9 = v8 - v7;
  sub_23F34F164(a1, a1[3]);
  sub_23F34F188();
  sub_23F3580A8();
  if (v2)
  {
    sub_23F34F208((uint64_t)a1);
    swift_bridgeObjectRelease();
    sub_23F350478();
    sub_23F350410();
  }
  else
  {
    v10 = sub_23F3503C8();
    v12 = v11;
    sub_23F34D6BC(&qword_256E6D218);
    sub_23F34F228(&qword_256E6D268, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    swift_bridgeObjectRetain();
    sub_23F358018();
    v22 = a2;
    swift_bridgeObjectRetain();
    v13 = sub_23F3503C8();
    v15 = v14;
    v21 = v13;
    swift_bridgeObjectRetain();
    v16 = sub_23F3503C8();
    v18 = v17;
    v19 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v20 = v16;
    v19(v9, v5);
    sub_23F350384();
    swift_bridgeObjectRelease();
    *v22 = v10;
    v22[1] = v12;
    v22[2] = v23;
    v22[3] = v21;
    v22[4] = v15;
    v22[5] = v20;
    v22[6] = v18;
    sub_23F34F208((uint64_t)a1);
    swift_bridgeObjectRelease();
    sub_23F350478();
    sub_23F350464();
  }
  swift_bridgeObjectRelease();
  sub_23F3503E4();
}

void sub_23F34EB7C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  FeedbackDataView.AdditionalDiagnostics.init(from:)(a1, a2);
}

void sub_23F34EB90(_QWORD *a1)
{
  FeedbackDataView.AdditionalDiagnostics.encode(to:)(a1);
}

void FeedbackDataView.__allocating_init(clientRequestId:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_23F350404();
  swift_allocObject();
  FeedbackDataView.init(clientRequestId:)(v1, v0);
  sub_23F350378();
}

uint64_t FeedbackDataView.init(clientRequestId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  *(_OWORD *)(v2 + 16) = xmmword_23F358480;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_QWORD *)(v2 + 80) = 1;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_QWORD *)(v2 + 120) = 0;
  type metadata accessor for TranscriptContextBuilder();
  *(_QWORD *)(swift_initStackObject() + 16) = MEMORY[0x24BEE4AF8];
  sub_23F350694();
  TranscriptContextBuilder.getTranscriptContext(clientRequestId:)(a1, a2, (uint64_t)&v17);
  sub_23F35042C();
  swift_setDeallocating();
  sub_23F350490();
  v5 = v19;
  v6 = v20;
  v7 = 0x100000000;
  if (!BYTE12(v19))
    v7 = 0;
  v8 = v7 | DWORD2(v19);
  v9 = *(_QWORD *)(v2 + 16);
  v10 = *(_QWORD *)(v2 + 24);
  v11 = v18;
  *(_OWORD *)(v2 + 16) = v17;
  *(_OWORD *)(v2 + 32) = v11;
  *(_QWORD *)(v2 + 48) = v5;
  *(_QWORD *)(v2 + 56) = v8;
  *(_QWORD *)(v2 + 64) = v6;
  sub_23F34F288(v9, v10);
  type metadata accessor for DeviceContextBuilder();
  swift_initStackObject();
  DeviceContextBuilder.getCurrentDeviceContext()((uint64_t *)&v17);
  v12 = *(_QWORD *)(v2 + 72);
  v13 = *(_QWORD *)(v2 + 80);
  v14 = v18;
  *(_OWORD *)(v2 + 72) = v17;
  v15 = v20;
  *(_OWORD *)(v2 + 88) = v14;
  *(_OWORD *)(v2 + 104) = v19;
  *(_QWORD *)(v2 + 120) = v15;
  sub_23F34F288(v12, v13);
  return v2;
}

IntelligenceFlowFeedbackDataCollector::FeedbackDataView::OriginalContent __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeedbackDataView.originalContent()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  IntelligenceFlowFeedbackDataCollector::FeedbackDataView::OriginalContent result;

  v2 = *(_QWORD *)(v1 + 24);
  if (v2 == 1)
  {
    sub_23F34F0E4();
    v3 = sub_23F3503D8();
    v5 = sub_23F350444(v3, v4);
  }
  else
  {
    *v0 = *(_QWORD *)(v1 + 16);
    v0[1] = v2;
    v5 = swift_bridgeObjectRetain();
  }
  result.userUtterance.value._object = v6;
  result.userUtterance.value._countAndFlagsBits = v5;
  return result;
}

uint64_t FeedbackDataView.generatedContent()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v1 + 24) == 1)
  {
    sub_23F34F0E4();
    v2 = sub_23F3503D8();
    return sub_23F350444(v2, v3);
  }
  else
  {
    v6 = *(_QWORD *)(v1 + 56);
    v5 = *(_QWORD *)(v1 + 64);
    v7 = *(_QWORD *)(v1 + 48);
    *(_OWORD *)a1 = *(_OWORD *)(v1 + 32);
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v5;
    *(_DWORD *)(a1 + 32) = v6;
    *(_BYTE *)(a1 + 36) = BYTE4(v6) & 1;
    swift_bridgeObjectRetain();
    sub_23F350384();
    return sub_23F3503FC();
  }
}

uint64_t FeedbackDataView.additionalDiagnostics()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v5;
  __int128 v6;

  v2 = *(_QWORD *)(v1 + 80);
  if (v2 == 1)
  {
    sub_23F34F0E4();
    sub_23F3503D8();
    return sub_23F3504C8(v3, 1);
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 120);
    *(_QWORD *)a1 = *(_QWORD *)(v1 + 72);
    *(_QWORD *)(a1 + 8) = v2;
    v6 = *(_OWORD *)(v1 + 104);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 88);
    *(_OWORD *)(a1 + 32) = v6;
    *(_QWORD *)(a1 + 48) = v5;
    swift_bridgeObjectRetain();
    sub_23F3503FC();
    sub_23F350384();
    return swift_bridgeObjectRetain();
  }
}

uint64_t *FeedbackDataView.deinit()
{
  uint64_t *v0;

  sub_23F34F288(v0[2], v0[3]);
  sub_23F34F288(v0[9], v0[10]);
  return v0;
}

uint64_t FeedbackDataView.__deallocating_deinit()
{
  FeedbackDataView.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23F34EEC4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_23F358000();
    __break(1u);
  }
  else
  {
    sub_23F34D6BC(&qword_256E6D218);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_23F34EFB0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    sub_23F350404();
    v6 = *(_QWORD *)(*(_QWORD *)(sub_23F34D6BC(&qword_256E6D340) - 8) + 72) * v3;
    v7 = a3 + v6;
    v8 = v4 + v6;
    if (v7 <= v4 || v8 <= a3)
      return swift_arrayInitWithCopy();
  }
  sub_23F3504D4();
  result = sub_23F358000();
  __break(1u);
  return result;
}

char *sub_23F34F08C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_23F350108(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

unint64_t sub_23F34F0A8()
{
  unint64_t result;

  result = qword_256E6D238;
  if (!qword_256E6D238)
  {
    result = MEMORY[0x242669EB0](&protocol conformance descriptor for FeedbackDataView.AdditionalDiagnostics, &type metadata for FeedbackDataView.AdditionalDiagnostics);
    atomic_store(result, (unint64_t *)&qword_256E6D238);
  }
  return result;
}

unint64_t sub_23F34F0E4()
{
  unint64_t result;

  result = qword_256E6D240;
  if (!qword_256E6D240)
  {
    result = MEMORY[0x242669EB0](&unk_23F3587CC, &unk_250FC8990);
    atomic_store(result, (unint64_t *)&qword_256E6D240);
  }
  return result;
}

uint64_t sub_23F34F120(uint64_t a1, unint64_t a2)
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

_QWORD *sub_23F34F164(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23F34F188()
{
  unint64_t result;

  result = qword_256E6D250;
  if (!qword_256E6D250)
  {
    result = MEMORY[0x242669EB0](&unk_23F35877C, &type metadata for FeedbackDataView.AdditionalDiagnostics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E6D250);
  }
  return result;
}

uint64_t sub_23F34F1C4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242669EA4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23F34F208(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23F34F228(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = sub_23F34F1C4(&qword_256E6D218);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x242669EB0](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23F34F288(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    sub_23F35042C();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TranscriptContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TranscriptContext(uint64_t a1, uint64_t a2)
{
  int v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_DWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for TranscriptContext(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TranscriptContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for TranscriptContext()
{
  sub_23F3503B0();
}

void type metadata accessor for DeviceContext()
{
  sub_23F3503B0();
}

uint64_t destroy for RetrievedTool()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RetrievedTool(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for RetrievedTool(_QWORD *a1, _QWORD *a2)
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

__n128 initializeWithTake for RetrievedTool(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithTake for RetrievedTool(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for RetrievedTool(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for RetrievedTool(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for RetrievedTool()
{
  sub_23F3503B0();
}

uint64_t type metadata accessor for FeedbackDataView()
{
  return objc_opt_self();
}

uint64_t method lookup function for FeedbackDataView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeedbackDataView.__allocating_init(clientRequestId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

_QWORD *initializeBufferWithCopyOfBuffer for FeedbackDataView.OriginalContent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeedbackDataView.OriginalContent()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for FeedbackDataView.OriginalContent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for FeedbackDataView.OriginalContent(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for FeedbackDataView.OriginalContent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackDataView.OriginalContent(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for FeedbackDataView.OriginalContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for FeedbackDataView.OriginalContent()
{
  sub_23F3503B0();
}

uint64_t initializeBufferWithCopyOfBuffer for FeedbackDataView.GeneratedContent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FeedbackDataView.GeneratedContent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  int v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  return a1;
}

__n128 initializeWithTake for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 29) = *(_QWORD *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackDataView.GeneratedContent(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 37))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
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

uint64_t storeEnumTagSinglePayload for FeedbackDataView.GeneratedContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 37) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 37) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void type metadata accessor for FeedbackDataView.GeneratedContent()
{
  sub_23F3503B0();
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void _s37IntelligenceFlowFeedbackDataCollector13DeviceContextVwcp_0(_QWORD *a1, _QWORD *a2)
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
  sub_23F350384();
  sub_23F3504E8();
  swift_bridgeObjectRetain();
  sub_23F350378();
}

void _s37IntelligenceFlowFeedbackDataCollector13DeviceContextVwca_0(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  sub_23F3504B4(a1, a2);
  v3[1] = *(_QWORD *)(v4 + 8);
  swift_bridgeObjectRetain();
  sub_23F35042C();
  v3[2] = v2[2];
  swift_bridgeObjectRetain();
  sub_23F35042C();
  v3[3] = v2[3];
  v3[4] = v2[4];
  swift_bridgeObjectRetain();
  sub_23F35042C();
  v3[5] = v2[5];
  v3[6] = v2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_23F350378();
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector13DeviceContextVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_23F3504B4(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v3 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v2 + 48);
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v3 + 48) = v5;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextVwet_0(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
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

uint64_t _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for FeedbackDataView.AdditionalDiagnostics()
{
  sub_23F3503B0();
}

_BYTE *initializeBufferWithCopyOfBuffer for FeedbackDataView.AdditionalDiagnostics.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FeedbackDataView.AdditionalDiagnostics.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedbackDataView.AdditionalDiagnostics.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F34FE0C + 4 * byte_23F358495[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23F34FE40 + 4 * byte_23F358490[v4]))();
}

uint64_t sub_23F34FE40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F34FE48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F34FE50);
  return result;
}

uint64_t sub_23F34FE5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F34FE64);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23F34FE68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F34FE70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F34FE7C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23F34FE84(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeedbackDataView.AdditionalDiagnostics.CodingKeys()
{
  return &type metadata for FeedbackDataView.AdditionalDiagnostics.CodingKeys;
}

uint64_t sub_23F34FE9C(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_23F34FF24(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23F34FF70 + 4 * byte_23F35849F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23F34FFA4 + 4 * byte_23F35849A[v4]))();
}

uint64_t sub_23F34FFA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F34FFAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23F34FFB4);
  return result;
}

uint64_t sub_23F34FFC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23F34FFC8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23F34FFCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23F34FFD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for FeedbackDataError()
{
  sub_23F3503B0();
}

unint64_t sub_23F34FFF0()
{
  unint64_t result;

  result = qword_256E6D318;
  if (!qword_256E6D318)
  {
    result = MEMORY[0x242669EB0](&unk_23F35869C, &unk_250FC8990);
    atomic_store(result, (unint64_t *)&qword_256E6D318);
  }
  return result;
}

unint64_t sub_23F350030()
{
  unint64_t result;

  result = qword_256E6D320;
  if (!qword_256E6D320)
  {
    result = MEMORY[0x242669EB0](&unk_23F358754, &type metadata for FeedbackDataView.AdditionalDiagnostics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E6D320);
  }
  return result;
}

unint64_t sub_23F350070()
{
  unint64_t result;

  result = qword_256E6D328;
  if (!qword_256E6D328)
  {
    result = MEMORY[0x242669EB0](&unk_23F3586C4, &type metadata for FeedbackDataView.AdditionalDiagnostics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E6D328);
  }
  return result;
}

unint64_t sub_23F3500B0()
{
  unint64_t result;

  result = qword_256E6D330;
  if (!qword_256E6D330)
  {
    result = MEMORY[0x242669EB0](&unk_23F3586EC, &type metadata for FeedbackDataView.AdditionalDiagnostics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256E6D330);
  }
  return result;
}

size_t sub_23F3500EC(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_23F3501E8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23F350108(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_23F34D6BC(&qword_256E6D348);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23F356D78(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23F34EEC4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_23F3501E8(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_23F34D6BC(&qword_256E6D338);
  v10 = *(_QWORD *)(sub_23F34D6BC(&qword_256E6D340) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_23F34D6BC(&qword_256E6D340) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_23F356E5C(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23F34EFB0(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_23F350384()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F35038C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_23F3503A4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F3503B8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F3503C8()
{
  return sub_23F35800C();
}

uint64_t sub_23F3503D8()
{
  return swift_allocError();
}

uint64_t sub_23F3503FC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23F350410()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_23F350418@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 v1;

  return a1 | ((unint64_t)v1 << 32);
}

uint64_t sub_23F35042C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F350434()
{
  return sub_23F358024();
}

uint64_t sub_23F350444(uint64_t a1, _BYTE *a2)
{
  *a2 = 0;
  return swift_willThrow();
}

uint64_t sub_23F350464()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F35046C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_23F34F120(v1, v0);
}

uint64_t sub_23F350478()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F350480()
{
  return sub_23F357F04();
}

uint64_t sub_23F350488()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_23F350490()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F3504A0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;

  *(_QWORD *)(result + 32) = a2;
  *(_QWORD *)(result + 40) = v2 | 0xED00006500000000;
  return result;
}

_QWORD *sub_23F3504B4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_23F3504C8@<X0>(_BYTE *a1@<X1>, char a2@<W8>)
{
  *a1 = a2;
  return swift_willThrow();
}

uint64_t sub_23F3504E8()
{
  return swift_bridgeObjectRetain();
}

void TranscriptContextBuilder.__allocating_init()()
{
  sub_23F357B50();
  *(_QWORD *)(swift_allocObject() + 16) = MEMORY[0x24BEE4AF8];
  sub_23F350694();
  sub_23F35039C();
}

uint64_t TranscriptContextBuilder.getTranscriptContext(clientRequestId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;

  swift_retain();
  v6 = swift_bridgeObjectRetain();
  v7 = sub_23F35146C(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23F351868(v7, a1, a2);
  v9 = v8;
  v10 = sub_23F351B14(v8);
  v11 = sub_23F352A94(v9);
  v12 = sub_23F353DBC(v9);
  v13 = sub_23F354CB8(v9);
  v15 = v14;
  swift_bridgeObjectRelease();
  if (*((_QWORD *)v10 + 2))
  {
    v17 = *((_QWORD *)v10 + 4);
    v16 = *((_QWORD *)v10 + 5);
    swift_bridgeObjectRetain();
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)v11 + 2))
  {
    v19 = *((_QWORD *)v11 + 4);
    v18 = *((_QWORD *)v11 + 5);
    swift_bridgeObjectRetain();
  }
  else
  {
    v19 = 0;
    v18 = 0;
  }
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a3 = v17;
  *(_QWORD *)(a3 + 8) = v16;
  *(_QWORD *)(a3 + 16) = v12;
  *(_QWORD *)(a3 + 24) = v19;
  *(_QWORD *)(a3 + 32) = v18;
  *(_DWORD *)(a3 + 40) = v15;
  *(_BYTE *)(a3 + 44) = BYTE4(v15) & 1;
  *(_QWORD *)(a3 + 48) = v13;
  return result;
}

uint64_t TranscriptContextBuilder.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  sub_23F350694();
  return v0;
}

uint64_t sub_23F350694()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  void (*v24)(void *);
  uint64_t v25;

  v1 = sub_23F357C28();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  sub_23F357B38();
  v3 = sub_23F34D6BC(&qword_256E6D4C0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v21 - v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = MEMORY[0x24BEE4AF8];
  v10 = objc_msgSend((id)BiomeLibrary(), sel_IntelligenceFlow);
  swift_unknownObjectRelease();
  v11 = objc_msgSend(v10, sel_Transcript);
  swift_unknownObjectRelease();
  v12 = objc_msgSend(v11, sel_Datastream);
  swift_unknownObjectRelease();
  sub_23F357C1C();
  sub_23F3563E0((uint64_t)v8);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  sub_23F357B8C((uint64_t)v8, 0);
  sub_23F357B8C((uint64_t)v6, 1);
  v13 = objc_allocWithZone(MEMORY[0x24BE0CC98]);
  v14 = sub_23F356580((uint64_t)v8, (uint64_t)v6, 0, 0, 0);
  v15 = objc_msgSend(v12, sel_publisherWithOptions_, v14);

  v24 = (void (*)(void *))nullsub_1;
  v25 = 0;
  v16 = MEMORY[0x24BDAC760];
  v22 = MEMORY[0x24BDAC760];
  v23 = 1107296256;
  v17 = sub_23F357BA4((uint64_t)sub_23F3561BC);
  v24 = sub_23F357B00;
  v25 = v9;
  v22 = v16;
  v23 = 1107296256;
  v18 = sub_23F357BA4((uint64_t)sub_23F3561BC);
  swift_retain();
  swift_release();
  v19 = objc_msgSend(v15, sel_sinkWithCompletion_receiveInput_, v17, v18);

  _Block_release(v18);
  _Block_release(v17);

  swift_beginAccess();
  *(_QWORD *)(v21[1] + 16) = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23F350978@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t (*v41)();
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  void *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  unint64_t v68;
  char *v69;
  void (*v70)(char *, char *, uint64_t);
  char *v71;
  char *v72;
  char *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  unint64_t v82;
  NSObject *v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t);
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  NSObject *v99;
  void (*v100)(NSObject *, uint64_t);
  void *v101;
  uint64_t v102;
  _OWORD v103[2];
  uint64_t v104;
  uint64_t v105;

  v102 = a2;
  sub_23F357CAC();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v97 = (char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23F357D48();
  v98 = *(_QWORD *)(v4 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v91 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v90 = (char *)&v87 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v87 - v9;
  v11 = sub_23F357CF4();
  v100 = *(void (**)(NSObject *, uint64_t))(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v99 = ((char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v87 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v93 = (char *)&v87 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v87 - v19;
  v21 = sub_23F34D6BC(&qword_256E6D4C0);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v87 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v87 - v25;
  v27 = sub_23F357918(a1);
  v29 = v28;
  v101 = a1;
  v30 = objc_msgSend(a1, sel_absoluteTimestamp);
  if (v30)
  {
    v31 = v30;
    sub_23F357C10();

    v32 = sub_23F357C28();
    v33 = (uint64_t)v24;
    v34 = 0;
  }
  else
  {
    v32 = sub_23F357C28();
    v33 = (uint64_t)v24;
    v34 = 1;
  }
  sub_23F357868(v33, v34, 1, v32);
  sub_23F357978((uint64_t)v24, (uint64_t)v26, &qword_256E6D4C0);
  sub_23F357C28();
  v35 = sub_23F35785C((uint64_t)v26, 1, v32);
  v95 = v16;
  if (v35 == 1)
  {
    sub_23F3579A4((uint64_t)v26, &qword_256E6D4C0);
    v96 = 0;
    v36 = 0;
  }
  else
  {
    v96 = sub_23F357BF8();
    v36 = v37;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v26, v32);
  }
  v38 = v20;
  sub_23F357CDC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v39 = sub_23F357CE8();
  v40 = sub_23F357F88();
  v41 = sub_23F358000;
  if (os_log_type_enabled(v39, v40))
  {
    v42 = swift_slowAlloc();
    v92 = v10;
    v43 = v42;
    v44 = swift_slowAlloc();
    v88 = v38;
    v45 = v44;
    *(_QWORD *)&v103[0] = v44;
    *(_DWORD *)v43 = 136315394;
    if (!v29)
      v27 = 0x3E4C494E3CLL;
    v94 = v4;
    if (v29)
      v46 = v29;
    else
      v46 = 0xE500000000000000;
    v47 = v11;
    swift_bridgeObjectRetain();
    v105 = sub_23F356FB0(v27, v46, (uint64_t *)v103);
    sub_23F357FA0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    if (v36)
      v48 = v96;
    else
      v48 = 0x3E4C494E3CLL;
    if (v36)
      v49 = v36;
    else
      v49 = 0xE500000000000000;
    swift_bridgeObjectRetain();
    v50 = v48;
    v11 = v47;
    v41 = sub_23F358000;
    v105 = sub_23F356FB0(v50, v49, (uint64_t *)v103);
    v4 = v94;
    sub_23F357FA0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23F34B000, v39, v40, "Decoding Event: %s with eventTimeStamp: %s \n", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242669F10](v45, -1, -1);
    v51 = v43;
    v10 = v92;
    MEMORY[0x242669F10](v51, -1, -1);

    v52 = (void (*)(char *, uint64_t))*((_QWORD *)v100 + 1);
    v52(v88, v11);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v52 = (void (*)(char *, uint64_t))*((_QWORD *)v100 + 1);
    v52(v38, v11);
  }
  v53 = v101;
  v54 = sub_23F3579DC(v101);
  if (v55 >> 60 == 15)
  {
    v56 = v11;
    v57 = v99;
    sub_23F357CDC();
    v58 = v53;
    v59 = sub_23F357CE8();
    v60 = sub_23F357F88();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      v62 = swift_slowAlloc();
      *(_QWORD *)&v103[0] = v62;
      *(_DWORD *)v61 = 136315138;
      v63 = sub_23F357918(v58);
      if (v64)
      {
        v65 = v64;
      }
      else
      {
        v63 = 0x3E4C494E3CLL;
        v65 = 0xE500000000000000;
      }
      v100 = (void (*)(NSObject *, uint64_t))v52;
      v105 = sub_23F356FB0(v63, v65, (uint64_t *)v103);
      sub_23F357FA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23F34B000, v59, v60, "BMSageTranscript did not contain valid event payload, skipping event: %s", v61, 0xCu);
      v66 = 1;
      swift_arrayDestroy();
      MEMORY[0x242669F10](v62, -1, -1);
      MEMORY[0x242669F10](v61, -1, -1);

      v100(v99, v56);
    }
    else
    {

      v52((char *)v57, v56);
      v66 = 1;
    }
  }
  else
  {
    v67 = (void *)v54;
    v68 = v55;
    v104 = 0;
    memset(v103, 0, sizeof(v103));
    sub_23F357A3C(v54, v55);
    sub_23F357CA0();
    sub_23F3578DC(&qword_256E6D410, (uint64_t (*)(uint64_t))MEMORY[0x24BE55B10], MEMORY[0x24BE55B08]);
    v101 = v67;
    sub_23F357CC4();
    v89 = v11;
    v69 = v93;
    sub_23F357CDC();
    v70 = *(void (**)(char *, char *, uint64_t))(v98 + 16);
    v71 = v90;
    v70(v90, v10, v4);
    v72 = v91;
    v70(v91, v10, v4);
    v73 = v71;
    v74 = sub_23F357CE8();
    v75 = sub_23F357F88();
    v99 = v74;
    LODWORD(v97) = v75;
    if (os_log_type_enabled(v74, v75))
    {
      v77 = swift_slowAlloc();
      v96 = swift_slowAlloc();
      *(_QWORD *)&v103[0] = v96;
      *(_DWORD *)v77 = *((_QWORD *)v41 + 267);
      v92 = v10;
      v78 = sub_23F357D3C();
      v105 = sub_23F356FB0(v78, v79, (uint64_t *)v103);
      v100 = (void (*)(NSObject *, uint64_t))v52;
      sub_23F357FA0();
      swift_bridgeObjectRelease();
      v80 = *(void (**)(char *, uint64_t))(v98 + 8);
      v80(v73, v4);
      *(_WORD *)(v77 + 12) = 2080;
      v81 = sub_23F357CD0();
      v105 = sub_23F356FB0(v81, v82, (uint64_t *)v103);
      v10 = v92;
      sub_23F357FA0();
      swift_bridgeObjectRelease();
      v80(v72, v4);
      v83 = v99;
      _os_log_impl(&dword_23F34B000, v99, (os_log_type_t)v97, "Decoded SessionID: %s for event: %s \n", (uint8_t *)v77, 0x16u);
      v84 = v96;
      swift_arrayDestroy();
      MEMORY[0x242669F10](v84, -1, -1);
      MEMORY[0x242669F10](v77, -1, -1);

      sub_23F357ABC((uint64_t)v101, v68);
      v100(v93, v89);
    }
    else
    {
      sub_23F357ABC((uint64_t)v101, v68);
      v85 = *(void (**)(char *, uint64_t))(v98 + 8);
      v85(v73, v4);
      v85(v72, v4);

      v52(v69, v89);
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v98 + 32))(v102, v10, v4);
    v66 = 0;
  }
  return sub_23F357868(v102, v66, 1, v4);
}

uint64_t sub_23F35146C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v2 = v1;
  v4 = sub_23F34D6BC(&qword_256E6D4B0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23F357D48();
  v42 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23F34D6BC(&qword_256E6D4B8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (_QWORD *)((char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v47 = sub_23F34D6BC(&qword_256E6D340);
  v40 = *(_QWORD *)(v47 - 8);
  v12 = MEMORY[0x24BDAC7A8](v47);
  v46 = (uint64_t)v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v39 = (uint64_t)v38 - v14;
  if (a1 >> 62)
    goto LABEL_26;
  v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v15; v15 = sub_23F357FF4())
  {
    v43 = v7;
    v38[1] = v2;
    v45 = a1 & 0xC000000000000001;
    v48 = MEMORY[0x24BEE4AF8];
    v16 = 4;
    v44 = a1;
    v7 = v47;
    while (1)
    {
      v2 = v16 - 4;
      v17 = v45 ? (id)MEMORY[0x242669B20](v16 - 4, a1) : *(id *)(a1 + 8 * v16);
      v18 = v17;
      if (__OFADD__(v2, 1))
        break;
      v49 = v16 - 3;
      v19 = v15;
      sub_23F350978(v17, (uint64_t)v6);
      v20 = v43;
      if (sub_23F35785C((uint64_t)v6, 1, v43) == 1)
      {
        sub_23F3579A4((uint64_t)v6, &qword_256E6D4B0);
        v21 = 1;
      }
      else
      {
        v22 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
        v23 = v6;
        v24 = v41;
        v22(v41, v23, v20);
        v25 = sub_23F357918(v18);
        v27 = 7104878;
        if (v26)
          v27 = v25;
        v28 = 0xE300000000000000;
        if (v26)
          v28 = v26;
        *v11 = v27;
        v11[1] = v28;
        v29 = v24;
        v6 = v23;
        v7 = v47;
        v22((char *)v11 + *(int *)(v47 + 48), v29, v20);
        v21 = 0;
      }
      v15 = v19;
      sub_23F357868((uint64_t)v11, v21, 1, v7);

      v30 = sub_23F35785C((uint64_t)v11, 1, v7) == 1;
      v31 = v48;
      if (v30)
      {
        sub_23F3579A4((uint64_t)v11, &qword_256E6D4B8);
      }
      else
      {
        v32 = v39;
        sub_23F357978((uint64_t)v11, v39, &qword_256E6D340);
        sub_23F357978(v32, v46, &qword_256E6D340);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v31 = sub_23F35688C(0, *(_QWORD *)(v31 + 16) + 1, 1, v31);
        v35 = *(_QWORD *)(v31 + 16);
        v34 = *(_QWORD *)(v31 + 24);
        if (v35 >= v34 >> 1)
          v31 = sub_23F35688C(v34 > 1, v35 + 1, 1, v31);
        *(_QWORD *)(v31 + 16) = v35 + 1;
        v36 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
        v48 = v31;
        sub_23F357978(v46, v31 + v36 + *(_QWORD *)(v40 + 72) * v35, &qword_256E6D340);
      }
      ++v16;
      a1 = v44;
      if (v49 == v15)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return v48;
      }
    }
    __break(1u);
LABEL_26:
    swift_bridgeObjectRetain();
  }
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

void sub_23F351868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;

  v7 = sub_23F34D6BC(&qword_256E6D340);
  v37 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v39 = (uint64_t)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v36 = (_QWORD *)((char *)v33 - v11);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (_QWORD *)((char *)v33 - v12);
  v42 = MEMORY[0x24BEE4AF8];
  v35 = *(_QWORD *)(a1 + 16);
  if (!v35)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v33[1] = v3;
  v34 = a1;
  v14 = 0;
  while (v14 < *(_QWORD *)(a1 + 16))
  {
    v15 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    v40 = *(_QWORD *)(v37 + 72);
    v41 = v15;
    sub_23F3578B0(a1 + v15 + v40 * v14, (uint64_t)v13, &qword_256E6D340);
    v16 = *(int *)(v38 + 48);
    v17 = v36;
    v18 = (char *)v36 + v16;
    v19 = (char *)v13 + v16;
    v20 = v13[1];
    *v36 = *v13;
    v17[1] = v20;
    v21 = sub_23F357D48();
    v22 = a3;
    v23 = *(_QWORD *)(v21 - 8);
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v18, v19, v21);
    v24 = sub_23F357D30();
    v26 = v25;
    v27 = *(void (**)(char *, uint64_t))(v23 + 8);
    a3 = v22;
    v27(v18, v21);
    if (v24 == a2 && v26 == v22)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      sub_23F357978((uint64_t)v13, v39, &qword_256E6D340);
      v30 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23F3500EC(0, *(_QWORD *)(v30 + 16) + 1, 1);
        v30 = v42;
      }
      v32 = *(_QWORD *)(v30 + 16);
      v31 = *(_QWORD *)(v30 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_23F3500EC(v31 > 1, v32 + 1, 1);
        v30 = v42;
      }
      *(_QWORD *)(v30 + 16) = v32 + 1;
      sub_23F357978(v39, v30 + v41 + v32 * v40, &qword_256E6D340);
      goto LABEL_16;
    }
    v29 = sub_23F358048();
    swift_bridgeObjectRelease();
    if ((v29 & 1) != 0)
      goto LABEL_11;
    sub_23F3579A4((uint64_t)v13, &qword_256E6D340);
LABEL_16:
    a1 = v34;
    if (v35 == ++v14)
      goto LABEL_17;
  }
  __break(1u);
}

char *sub_23F351B14(uint64_t a1)
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  void (*v87)(char *, uint64_t);
  uint64_t v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  unint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  unint64_t v114;
  unint64_t v115;
  char *v116;
  uint64_t v118;
  int v119;
  int v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  __int128 v147;
  char *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;

  v2 = sub_23F357CF4();
  v151 = *(_QWORD *)(v2 - 8);
  v152 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v132 = (char *)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v139 = (char *)&v118 - v5;
  v123 = sub_23F357ED4();
  v122 = *(_QWORD *)(v123 - 8);
  MEMORY[0x24BDAC7A8](v123);
  v121 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = sub_23F357D18();
  v127 = *(_QWORD *)(v128 - 8);
  MEMORY[0x24BDAC7A8](v128);
  v126 = (char *)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_23F357D0C();
  v130 = *(_QWORD *)(v131 - 8);
  MEMORY[0x24BDAC7A8](v131);
  v129 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23F34D6BC(&qword_256E6D488);
  MEMORY[0x24BDAC7A8](v9);
  v136 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23F34D6BC(&qword_256E6D490);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v133 = (uint64_t)&v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v144 = (uint64_t)&v118 - v14;
  v15 = sub_23F357D78();
  v142 = *(_QWORD *)(v15 - 8);
  v143 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v135 = (char *)&v118 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v145 = (char *)&v118 - v18;
  v19 = sub_23F34D6BC(&qword_256E6D400);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_23F34D6BC(&qword_256E6D408);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v141 = (uint64_t)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v118 - v25;
  v27 = sub_23F357D48();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v150 = (char *)&v118 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v118 - v31;
  v157 = sub_23F34D6BC(&qword_256E6D340);
  v33 = *(_QWORD *)(v157 - 8);
  v34 = MEMORY[0x24BDAC7A8](v157);
  v36 = (char *)&v118 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v34);
  v155 = (uint64_t)&v118 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v40 = (uint64_t *)((char *)&v118 - v39);
  v159 = MEMORY[0x24BEE4AF8];
  v41 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v148 = v21;
  v149 = v26;
  v138 = v27;
  v137 = v28;
  v156 = v32;
  v158 = v33;
  if (v41)
  {
    v42 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    v43 = *(_QWORD *)(v33 + 72);
    v154 = a1;
    v44 = a1 + v42;
    v45 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_23F3578B0(v44, (uint64_t)v40, &qword_256E6D340);
      v46 = *v40 == 0x74736575716552 && v40[1] == 0xE700000000000000;
      if (v46 || (sub_23F358048() & 1) != 0)
      {
        sub_23F357978((uint64_t)v40, (uint64_t)v36, &qword_256E6D340);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23F3500EC(0, *(_QWORD *)(v45 + 16) + 1, 1);
        v45 = v159;
        v48 = *(_QWORD *)(v159 + 16);
        v47 = *(_QWORD *)(v159 + 24);
        if (v48 >= v47 >> 1)
        {
          sub_23F3500EC(v47 > 1, v48 + 1, 1);
          v45 = v159;
        }
        *(_QWORD *)(v45 + 16) = v48 + 1;
        sub_23F357978((uint64_t)v36, v45 + v42 + v48 * v43, &qword_256E6D340);
        v26 = v149;
        v32 = v156;
      }
      else
      {
        sub_23F3579A4((uint64_t)v40, &qword_256E6D340);
      }
      v44 += v43;
      --v41;
    }
    while (v41);
    v49 = v159;
    v21 = v148;
    v27 = v138;
    v28 = v137;
  }
  else
  {
    v49 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v51 = *(_QWORD *)(v49 + 16);
  if (v51)
  {
    v154 = v155 + *(int *)(v157 + 48);
    v52 = (*(unsigned __int8 *)(v158 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v158 + 80);
    v125 = v49;
    v53 = v49 + v52;
    v134 = (char *)MEMORY[0x24BEE4AF8];
    v153 = *(_QWORD *)(v158 + 72);
    v140 = *MEMORY[0x24BE56278];
    v124 = *MEMORY[0x24BE56500];
    v120 = *MEMORY[0x24BE56508];
    v119 = *MEMORY[0x24BE564F8];
    *(_QWORD *)&v50 = 136315138;
    v147 = v50;
    v146 = MEMORY[0x24BEE4AD8] + 8;
    v54 = v132;
    while (1)
    {
      sub_23F3578B0(v53, v155, &qword_256E6D340);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v32, v154, v27);
      sub_23F357D24();
      v55 = sub_23F357D60();
      if (sub_23F35785C((uint64_t)v21, 1, v55) == 1)
      {
        sub_23F3579A4((uint64_t)v21, &qword_256E6D400);
        v56 = sub_23F357E14();
        sub_23F357868((uint64_t)v26, 1, 1, v56);
LABEL_26:
        v157 = v51;
        v158 = v53;
        v64 = v26;
        sub_23F357CDC();
        v65 = v150;
        (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v150, v32, v27);
        v66 = v28;
        v67 = sub_23F357CE8();
        v68 = sub_23F357F88();
        if (os_log_type_enabled(v67, v68))
        {
          v69 = swift_slowAlloc();
          v70 = swift_slowAlloc();
          v159 = v70;
          *(_DWORD *)v69 = v147;
          sub_23F3578DC(&qword_256E6D410, (uint64_t (*)(uint64_t))MEMORY[0x24BE55B10], MEMORY[0x24BE55B08]);
          v71 = sub_23F357CD0();
          *(_QWORD *)(v69 + 4) = sub_23F356FB0(v71, v72, &v159);
          swift_bridgeObjectRelease();
          v73 = *(void (**)(char *, uint64_t))(v66 + 8);
          v73(v65, v27);
          _os_log_impl(&dword_23F34B000, v67, v68, "Unable to convert eventPayload into Request event: %s", (uint8_t *)v69, 0xCu);
          swift_arrayDestroy();
          v74 = v70;
          v32 = v156;
          MEMORY[0x242669F10](v74, -1, -1);
          v75 = v69;
          v21 = v148;
          MEMORY[0x242669F10](v75, -1, -1);

          (*(void (**)(char *, uint64_t))(v151 + 8))(v54, v152);
          v73(v32, v27);
        }
        else
        {

          v76 = *(void (**)(char *, uint64_t))(v66 + 8);
          v76(v65, v27);
          (*(void (**)(char *, uint64_t))(v151 + 8))(v54, v152);
          v76(v32, v27);
        }
        v28 = v66;
        v26 = v64;
        v51 = v157;
        v53 = v158;
        goto LABEL_30;
      }
      sub_23F357D54();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v55 - 8) + 8))(v21, v55);
      v57 = sub_23F357E14();
      if (sub_23F35785C((uint64_t)v26, 1, v57) == 1)
        goto LABEL_26;
      v58 = v141;
      sub_23F3578B0((uint64_t)v26, v141, &qword_256E6D408);
      v59 = *(_QWORD *)(v57 - 8);
      v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v59 + 88))(v58, v57);
      if (v60 != v140)
      {
        (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v57);
        v32 = v156;
        goto LABEL_26;
      }
      (*(void (**)(uint64_t, uint64_t))(v59 + 96))(v58, v57);
      (*(void (**)(char *, uint64_t, uint64_t))(v142 + 32))(v145, v58, v143);
      v61 = (uint64_t)v136;
      sub_23F357D6C();
      v62 = sub_23F357E50();
      if (sub_23F35785C(v61, 1, v62) == 1)
        break;
      v77 = v144;
      sub_23F357E44();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 8))(v61, v62);
      v78 = sub_23F357EA4();
      if (sub_23F35785C(v77, 1, v78) == 1)
        goto LABEL_33;
      v91 = v133;
      sub_23F3578B0(v144, v133, &qword_256E6D490);
      v92 = *(_QWORD *)(v78 - 8);
      v93 = (*(uint64_t (**)(uint64_t, uint64_t))(v92 + 88))(v91, v78);
      if (v93 == v124)
      {
        (*(void (**)(uint64_t, uint64_t))(v92 + 96))(v91, v78);
        (*(void (**)(char *, uint64_t, uint64_t))(v130 + 32))(v129, v91, v131);
        v94 = sub_23F357D00();
        v96 = v95;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v97 = v134;
        else
          v97 = sub_23F3566AC(0, *((_QWORD *)v134 + 2) + 1, 1, (uint64_t)v134);
        v99 = *((_QWORD *)v97 + 2);
        v98 = *((_QWORD *)v97 + 3);
        if (v99 >= v98 >> 1)
          v97 = sub_23F3566AC((char *)(v98 > 1), v99 + 1, 1, (uint64_t)v97);
        *((_QWORD *)v97 + 2) = v99 + 1;
        v134 = v97;
        v100 = &v97[16 * v99];
        *((_QWORD *)v100 + 4) = v94;
        *((_QWORD *)v100 + 5) = v96;
        (*(void (**)(char *, uint64_t))(v130 + 8))(v129, v131);
      }
      else if (v93 == v120)
      {
        v101 = v133;
        (*(void (**)(uint64_t, uint64_t))(v92 + 96))(v133, v78);
        (*(void (**)(char *, uint64_t, uint64_t))(v127 + 32))(v126, v101, v128);
        sub_23F3578DC(&qword_256E6D4A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE54AE8], MEMORY[0x24BE54AE0]);
        v102 = sub_23F357CD0();
        v104 = v103;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v105 = v134;
        else
          v105 = sub_23F3566AC(0, *((_QWORD *)v134 + 2) + 1, 1, (uint64_t)v134);
        v107 = *((_QWORD *)v105 + 2);
        v106 = *((_QWORD *)v105 + 3);
        if (v107 >= v106 >> 1)
          v105 = sub_23F3566AC((char *)(v106 > 1), v107 + 1, 1, (uint64_t)v105);
        *((_QWORD *)v105 + 2) = v107 + 1;
        v134 = v105;
        v108 = &v105[16 * v107];
        *((_QWORD *)v108 + 4) = v102;
        *((_QWORD *)v108 + 5) = v104;
        (*(void (**)(char *, uint64_t))(v127 + 8))(v126, v128);
      }
      else
      {
        if (v93 != v119)
        {
          (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v133, v78);
          goto LABEL_33;
        }
        v109 = v133;
        (*(void (**)(uint64_t, uint64_t))(v92 + 96))(v133, v78);
        (*(void (**)(char *, uint64_t, uint64_t))(v122 + 32))(v121, v109, v123);
        sub_23F3578DC(&qword_256E6D4A0, (uint64_t (*)(uint64_t))MEMORY[0x24BE565F0], MEMORY[0x24BE565E8]);
        v110 = sub_23F357CD0();
        v112 = v111;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v134 = sub_23F3566AC(0, *((_QWORD *)v134 + 2) + 1, 1, (uint64_t)v134);
        v113 = v134;
        v115 = *((_QWORD *)v134 + 2);
        v114 = *((_QWORD *)v134 + 3);
        if (v115 >= v114 >> 1)
          v113 = sub_23F3566AC((char *)(v114 > 1), v115 + 1, 1, (uint64_t)v134);
        *((_QWORD *)v113 + 2) = v115 + 1;
        v134 = v113;
        v116 = &v113[16 * v115];
        *((_QWORD *)v116 + 4) = v110;
        *((_QWORD *)v116 + 5) = v112;
        (*(void (**)(char *, uint64_t))(v122 + 8))(v121, v123);
      }
      (*(void (**)(char *, uint64_t))(v142 + 8))(v145, v143);
      v32 = v156;
      v27 = v138;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v156, v138);
LABEL_56:
      sub_23F3579A4(v144, &qword_256E6D490);
LABEL_30:
      sub_23F3579A4((uint64_t)v26, &qword_256E6D408);
      v53 += v153;
      if (!--v51)
      {
        swift_release();
        return v134;
      }
    }
    sub_23F3579A4(v61, &qword_256E6D488);
    v63 = sub_23F357EA4();
    sub_23F357868(v144, 1, 1, v63);
LABEL_33:
    sub_23F357CDC();
    v79 = v142;
    v80 = v143;
    v81 = v135;
    (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v135, v145, v143);
    v82 = sub_23F357CE8();
    v83 = sub_23F357F88();
    if (os_log_type_enabled(v82, v83))
    {
      v84 = swift_slowAlloc();
      v158 = swift_slowAlloc();
      v159 = v158;
      *(_DWORD *)v84 = v147;
      sub_23F3578DC(&qword_256E6D498, (uint64_t (*)(uint64_t))MEMORY[0x24BE56088], MEMORY[0x24BE56078]);
      v85 = sub_23F357CD0();
      *(_QWORD *)(v84 + 4) = sub_23F356FB0(v85, v86, &v159);
      swift_bridgeObjectRelease();
      v87 = *(void (**)(char *, uint64_t))(v79 + 8);
      v87(v81, v80);
      _os_log_impl(&dword_23F34B000, v82, v83, "Request event does not contain a requestContextEnum: %s", (uint8_t *)v84, 0xCu);
      v88 = v158;
      swift_arrayDestroy();
      MEMORY[0x242669F10](v88, -1, -1);
      v89 = v84;
      v21 = v148;
      MEMORY[0x242669F10](v89, -1, -1);

      (*(void (**)(char *, uint64_t))(v151 + 8))(v139, v152);
      v87(v145, v80);
    }
    else
    {

      v90 = *(void (**)(char *, uint64_t))(v79 + 8);
      v90(v81, v80);
      (*(void (**)(char *, uint64_t))(v151 + 8))(v139, v152);
      v90(v145, v80);
    }
    v28 = v137;
    v32 = v156;
    v27 = v138;
    (*(void (**)(char *, uint64_t))(v137 + 8))(v156, v138);
    v26 = v149;
    goto LABEL_56;
  }
  swift_release();
  return (char *)MEMORY[0x24BEE4AF8];
}

char *sub_23F352A94(uint64_t a1)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  __int128 v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  void (*v82)(_BYTE *, uint64_t);
  uint64_t v83;
  uint64_t v84;
  void (*v85)(_BYTE *, uint64_t);
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  _BYTE *v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE *v95;
  NSObject *v96;
  _BYTE *v97;
  os_log_type_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  void (*v104)(_BYTE *, uint64_t);
  uint64_t v105;
  void (*v106)(_BYTE *, uint64_t);
  _BYTE *v107;
  uint64_t v108;
  int v109;
  _BYTE *v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char isUniquelyReferenced_nonNull_native;
  char *v117;
  unint64_t v118;
  unint64_t v119;
  char *v120;
  void (*v121)(_BYTE *, uint64_t);
  _BYTE *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  unint64_t v127;
  unint64_t v128;
  char *v129;
  void (*v130)(_BYTE *, uint64_t);
  _BYTE *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  unint64_t v136;
  unint64_t v137;
  char *v138;
  void (*v139)(_BYTE *, uint64_t);
  _BYTE *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  unint64_t v145;
  unint64_t v146;
  char *v147;
  void (*v148)(_BYTE *, uint64_t);
  _BYTE *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  unint64_t v154;
  unint64_t v155;
  char *v156;
  _BYTE v158[12];
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  _BYTE *v164;
  uint64_t v165;
  uint64_t v166;
  _BYTE *v167;
  uint64_t v168;
  uint64_t v169;
  _BYTE *v170;
  uint64_t v171;
  uint64_t v172;
  _BYTE *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _BYTE *v177;
  uint64_t v178;
  uint64_t v179;
  _BYTE *v180;
  char *v181;
  _BYTE *v182;
  _BYTE *v183;
  _BYTE *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _BYTE *v188;
  _BYTE *v189;
  uint64_t v190;
  uint64_t v191;
  _BYTE *v192;
  _BYTE *v193;
  _BYTE *v194;
  uint64_t v195;
  __int128 v196;
  _BYTE *v197;
  _BYTE *v198;
  char *v199;
  uint64_t v200;
  uint64_t v201;
  _BYTE *v202;
  _BYTE *v203;
  uint64_t v204;
  _BYTE *v205;
  uint64_t v206;

  v2 = sub_23F357CF4();
  v200 = *(_QWORD *)(v2 - 8);
  v201 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v188 = &v158[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v189 = &v158[-v5];
  v166 = sub_23F357E08();
  v165 = *(_QWORD *)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v164 = &v158[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v169 = sub_23F357E98();
  v168 = *(_QWORD *)(v169 - 8);
  MEMORY[0x24BDAC7A8](v169);
  v167 = &v158[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v179 = sub_23F357DFC();
  v178 = *(_QWORD *)(v179 - 8);
  MEMORY[0x24BDAC7A8](v179);
  v177 = &v158[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v175 = sub_23F357D90();
  v174 = *(_QWORD *)(v175 - 8);
  MEMORY[0x24BDAC7A8](v175);
  v173 = &v158[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v172 = sub_23F357E38();
  v171 = *(_QWORD *)(v172 - 8);
  MEMORY[0x24BDAC7A8](v172);
  v170 = &v158[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_23F34D6BC(&qword_256E6D458);
  MEMORY[0x24BDAC7A8](v11);
  v183 = &v158[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_23F34D6BC(&qword_256E6D460);
  MEMORY[0x24BDAC7A8](v13);
  v182 = &v158[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_23F34D6BC(&qword_256E6D468);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v180 = &v158[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v16);
  v193 = &v158[-v18];
  v191 = sub_23F357E80();
  v185 = *(_QWORD *)(v191 - 8);
  v19 = MEMORY[0x24BDAC7A8](v191);
  v184 = &v158[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v19);
  v194 = &v158[-v21];
  v22 = sub_23F34D6BC(&qword_256E6D400);
  MEMORY[0x24BDAC7A8](v22);
  v24 = &v158[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = sub_23F34D6BC(&qword_256E6D408);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v192 = &v158[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v26);
  v29 = &v158[-v28];
  v30 = sub_23F357D48();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v198 = &v158[-((v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v32);
  v35 = &v158[-v34];
  v195 = sub_23F34D6BC(&qword_256E6D340);
  v36 = *(_QWORD *)(v195 - 8);
  v37 = MEMORY[0x24BDAC7A8](v195);
  v39 = &v158[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v40 = MEMORY[0x24BDAC7A8](v37);
  v202 = &v158[-v41];
  MEMORY[0x24BDAC7A8](v40);
  v43 = &v158[-v42];
  v206 = MEMORY[0x24BEE4AF8];
  v44 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v197 = v24;
  v205 = v29;
  v187 = v30;
  v186 = v31;
  v203 = v35;
  *(_QWORD *)&v196 = v36;
  if (v44)
  {
    v45 = *(unsigned __int8 *)(v36 + 80);
    v46 = *(_QWORD *)(v36 + 72);
    v190 = a1;
    v204 = (v45 + 32) & ~v45;
    v47 = a1 + v204;
    v48 = MEMORY[0x24BEE4AF8];
    v199 = "onRequestCreated";
    do
    {
      sub_23F3578B0(v47, (uint64_t)v43, &qword_256E6D340);
      if (*v43 == 0xD000000000000017 && v43[1] == 0x800000023F359020 || (sub_23F358048() & 1) != 0)
      {
        sub_23F357978((uint64_t)v43, (uint64_t)v39, &qword_256E6D340);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23F3500EC(0, *(_QWORD *)(v48 + 16) + 1, 1);
        v48 = v206;
        v50 = *(_QWORD *)(v206 + 16);
        v49 = *(_QWORD *)(v206 + 24);
        if (v50 >= v49 >> 1)
        {
          sub_23F3500EC(v49 > 1, v50 + 1, 1);
          v48 = v206;
        }
        *(_QWORD *)(v48 + 16) = v50 + 1;
        sub_23F357978((uint64_t)v39, v48 + v204 + v50 * v46, &qword_256E6D340);
        v35 = v203;
      }
      else
      {
        sub_23F3579A4((uint64_t)v43, &qword_256E6D340);
      }
      v47 += v46;
      --v44;
    }
    while (v44);
    v51 = v206;
    v24 = v197;
    v52 = v198;
    v30 = v187;
    v31 = v186;
  }
  else
  {
    v51 = MEMORY[0x24BEE4AF8];
    v52 = v198;
  }
  swift_bridgeObjectRelease();
  v54 = *(_QWORD *)(v51 + 16);
  if (v54)
  {
    v199 = &v202[*(int *)(v195 + 48)];
    v55 = (*(unsigned __int8 *)(v196 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v196 + 80);
    v176 = v51;
    v56 = v51 + v55;
    v198 = *(_BYTE **)(v196 + 72);
    LODWORD(v190) = *MEMORY[0x24BE56268];
    v163 = *MEMORY[0x24BE562F0];
    v162 = *MEMORY[0x24BE56310];
    v161 = *MEMORY[0x24BE56300];
    v160 = *MEMORY[0x24BE56308];
    v159 = *MEMORY[0x24BE562F8];
    v181 = (char *)MEMORY[0x24BEE4AF8];
    v195 = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v53 = 136315138;
    v196 = v53;
    v57 = v188;
    while (1)
    {
      sub_23F3578B0(v56, (uint64_t)v202, &qword_256E6D340);
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, char *, uint64_t))(v31 + 32))(v35, v199, v30);
      sub_23F357D24();
      v58 = sub_23F357D60();
      if (sub_23F35785C((uint64_t)v24, 1, v58) == 1)
      {
        sub_23F3579A4((uint64_t)v24, &qword_256E6D400);
        v59 = sub_23F357E14();
        sub_23F357868((uint64_t)v205, 1, 1, v59);
LABEL_24:
        v204 = v56;
        v73 = v54;
        sub_23F357CDC();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v31 + 16))(v52, v35, v30);
        v74 = v57;
        v75 = v31;
        v76 = sub_23F357CE8();
        v77 = sub_23F357F88();
        if (os_log_type_enabled(v76, v77))
        {
          v78 = swift_slowAlloc();
          v79 = swift_slowAlloc();
          v206 = v79;
          *(_DWORD *)v78 = v196;
          sub_23F3578DC(&qword_256E6D410, (uint64_t (*)(uint64_t))MEMORY[0x24BE55B10], MEMORY[0x24BE55B08]);
          v80 = sub_23F357CD0();
          *(_QWORD *)(v78 + 4) = sub_23F356FB0(v80, v81, &v206);
          swift_bridgeObjectRelease();
          v82 = *(void (**)(_BYTE *, uint64_t))(v75 + 8);
          v82(v52, v30);
          _os_log_impl(&dword_23F34B000, v76, v77, "Unable to convert eventPayload into SystemResponseGenerated event: %s", (uint8_t *)v78, 0xCu);
          swift_arrayDestroy();
          v83 = v79;
          v35 = v203;
          MEMORY[0x242669F10](v83, -1, -1);
          v84 = v78;
          v24 = v197;
          MEMORY[0x242669F10](v84, -1, -1);

          (*(void (**)(_BYTE *, uint64_t))(v200 + 8))(v74, v201);
          v82(v35, v30);
        }
        else
        {

          v85 = *(void (**)(_BYTE *, uint64_t))(v75 + 8);
          v85(v52, v30);
          (*(void (**)(_BYTE *, uint64_t))(v200 + 8))(v74, v201);
          v85(v35, v30);
        }
        v31 = v75;
        v57 = v74;
        v86 = v73;
        v56 = v204;
        goto LABEL_28;
      }
      v60 = v24;
      v61 = v52;
      v62 = (uint64_t)v205;
      sub_23F357D54();
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v58 - 8) + 8))(v60, v58);
      v63 = sub_23F357E14();
      v64 = v62;
      v52 = v61;
      v24 = v60;
      if (sub_23F35785C(v64, 1, v63) == 1)
        goto LABEL_24;
      v65 = v192;
      sub_23F3578B0((uint64_t)v205, (uint64_t)v192, &qword_256E6D408);
      v66 = *(_QWORD *)(v63 - 8);
      v67 = (*(uint64_t (**)(_BYTE *, uint64_t))(v66 + 88))(v65, v63);
      if (v67 != (_DWORD)v190)
      {
        (*(void (**)(_BYTE *, uint64_t))(v66 + 8))(v65, v63);
        v35 = v203;
        goto LABEL_24;
      }
      v204 = v54;
      (*(void (**)(_BYTE *, uint64_t))(v66 + 96))(v65, v63);
      v68 = v185;
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v185 + 32))(v194, v65, v191);
      v69 = (uint64_t)v183;
      sub_23F357E74();
      v70 = sub_23F357E68();
      if (sub_23F35785C(v69, 1, v70) == 1)
        break;
      v87 = (uint64_t)v182;
      sub_23F357E5C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 8))(v69, v70);
      v88 = sub_23F357DE4();
      if (sub_23F35785C(v87, 1, v88) == 1)
      {
        v71 = v87;
        v72 = &qword_256E6D460;
        goto LABEL_32;
      }
      v107 = v193;
      sub_23F357DD8();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 8))(v87, v88);
      v108 = sub_23F357E20();
      v109 = sub_23F35785C((uint64_t)v107, 1, v108);
      v90 = v189;
      v91 = v184;
      if (v109 == 1)
        goto LABEL_34;
      v110 = v180;
      sub_23F3578B0((uint64_t)v193, (uint64_t)v180, &qword_256E6D468);
      v111 = *(_QWORD *)(v108 - 8);
      v112 = (*(uint64_t (**)(_BYTE *, uint64_t))(v111 + 88))(v110, v108);
      if (v112 == v163)
      {
        (*(void (**)(_BYTE *, uint64_t))(v111 + 96))(v110, v108);
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v178 + 32))(v177, v110, v179);
        v113 = sub_23F357D00();
        v115 = v114;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v57 = v188;
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v86 = v204;
          v117 = v181;
        }
        else
        {
          v117 = sub_23F3566AC(0, *((_QWORD *)v181 + 2) + 1, 1, (uint64_t)v181);
          v86 = v204;
        }
        v119 = *((_QWORD *)v117 + 2);
        v118 = *((_QWORD *)v117 + 3);
        if (v119 >= v118 >> 1)
          v117 = sub_23F3566AC((char *)(v118 > 1), v119 + 1, 1, (uint64_t)v117);
        *((_QWORD *)v117 + 2) = v119 + 1;
        v181 = v117;
        v120 = &v117[16 * v119];
        *((_QWORD *)v120 + 4) = v113;
        *((_QWORD *)v120 + 5) = v115;
        (*(void (**)(_BYTE *, uint64_t))(v178 + 8))(v177, v179);
      }
      else
      {
        v57 = v188;
        if (v112 == v162)
        {
          v121 = *(void (**)(_BYTE *, uint64_t))(v111 + 96);
          v122 = v180;
          v121(v180, v108);
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v174 + 32))(v173, v122, v175);
          v123 = sub_23F357D00();
          v125 = v124;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v181 = sub_23F3566AC(0, *((_QWORD *)v181 + 2) + 1, 1, (uint64_t)v181);
          v86 = v204;
          v126 = v181;
          v128 = *((_QWORD *)v181 + 2);
          v127 = *((_QWORD *)v181 + 3);
          if (v128 >= v127 >> 1)
            v126 = sub_23F3566AC((char *)(v127 > 1), v128 + 1, 1, (uint64_t)v181);
          *((_QWORD *)v126 + 2) = v128 + 1;
          v181 = v126;
          v129 = &v126[16 * v128];
          *((_QWORD *)v129 + 4) = v123;
          *((_QWORD *)v129 + 5) = v125;
          (*(void (**)(_BYTE *, uint64_t))(v174 + 8))(v173, v175);
        }
        else if (v112 == v161)
        {
          v130 = *(void (**)(_BYTE *, uint64_t))(v111 + 96);
          v131 = v180;
          v130(v180, v108);
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v171 + 32))(v170, v131, v172);
          v132 = sub_23F357D00();
          v134 = v133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v181 = sub_23F3566AC(0, *((_QWORD *)v181 + 2) + 1, 1, (uint64_t)v181);
          v86 = v204;
          v135 = v181;
          v137 = *((_QWORD *)v181 + 2);
          v136 = *((_QWORD *)v181 + 3);
          if (v137 >= v136 >> 1)
            v135 = sub_23F3566AC((char *)(v136 > 1), v137 + 1, 1, (uint64_t)v181);
          *((_QWORD *)v135 + 2) = v137 + 1;
          v181 = v135;
          v138 = &v135[16 * v137];
          *((_QWORD *)v138 + 4) = v132;
          *((_QWORD *)v138 + 5) = v134;
          (*(void (**)(_BYTE *, uint64_t))(v171 + 8))(v170, v172);
        }
        else if (v112 == v160)
        {
          v139 = *(void (**)(_BYTE *, uint64_t))(v111 + 96);
          v140 = v180;
          v139(v180, v108);
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v168 + 32))(v167, v140, v169);
          sub_23F3578DC(&qword_256E6D480, (uint64_t (*)(uint64_t))MEMORY[0x24BE56418], MEMORY[0x24BE56410]);
          v141 = sub_23F357CD0();
          v143 = v142;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v181 = sub_23F3566AC(0, *((_QWORD *)v181 + 2) + 1, 1, (uint64_t)v181);
          v86 = v204;
          v144 = v181;
          v146 = *((_QWORD *)v181 + 2);
          v145 = *((_QWORD *)v181 + 3);
          if (v146 >= v145 >> 1)
            v144 = sub_23F3566AC((char *)(v145 > 1), v146 + 1, 1, (uint64_t)v181);
          *((_QWORD *)v144 + 2) = v146 + 1;
          v181 = v144;
          v147 = &v144[16 * v146];
          *((_QWORD *)v147 + 4) = v141;
          *((_QWORD *)v147 + 5) = v143;
          (*(void (**)(_BYTE *, uint64_t))(v168 + 8))(v167, v169);
        }
        else
        {
          if (v112 != v159)
          {
            (*(void (**)(_BYTE *, uint64_t))(v111 + 8))(v180, v108);
            goto LABEL_33;
          }
          v148 = *(void (**)(_BYTE *, uint64_t))(v111 + 96);
          v149 = v180;
          v148(v180, v108);
          (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v165 + 32))(v164, v149, v166);
          sub_23F3578DC(&qword_256E6D478, (uint64_t (*)(uint64_t))MEMORY[0x24BE56248], MEMORY[0x24BE56240]);
          v150 = sub_23F357CD0();
          v152 = v151;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v181 = sub_23F3566AC(0, *((_QWORD *)v181 + 2) + 1, 1, (uint64_t)v181);
          v86 = v204;
          v153 = v181;
          v155 = *((_QWORD *)v181 + 2);
          v154 = *((_QWORD *)v181 + 3);
          if (v155 >= v154 >> 1)
            v153 = sub_23F3566AC((char *)(v154 > 1), v155 + 1, 1, (uint64_t)v181);
          *((_QWORD *)v153 + 2) = v155 + 1;
          v181 = v153;
          v156 = &v153[16 * v155];
          *((_QWORD *)v156 + 4) = v150;
          *((_QWORD *)v156 + 5) = v152;
          (*(void (**)(_BYTE *, uint64_t))(v165 + 8))(v164, v166);
        }
      }
      (*(void (**)(_BYTE *, uint64_t))(v185 + 8))(v194, v191);
      v35 = v203;
      v30 = v187;
      (*(void (**)(_BYTE *, uint64_t))(v31 + 8))(v203, v187);
LABEL_38:
      sub_23F3579A4((uint64_t)v193, &qword_256E6D468);
LABEL_28:
      sub_23F3579A4((uint64_t)v205, &qword_256E6D408);
      v56 += (uint64_t)v198;
      v54 = v86 - 1;
      if (!v54)
      {
        swift_release();
        return v181;
      }
    }
    v71 = v69;
    v72 = &qword_256E6D458;
LABEL_32:
    sub_23F3579A4(v71, v72);
    v89 = sub_23F357E20();
    sub_23F357868((uint64_t)v193, 1, 1, v89);
LABEL_33:
    v90 = v189;
    v91 = v184;
LABEL_34:
    sub_23F357CDC();
    v92 = v194;
    v93 = v68;
    v94 = v191;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v68 + 16))(v91, v194, v191);
    v95 = v90;
    v96 = sub_23F357CE8();
    v97 = v91;
    v98 = sub_23F357F88();
    if (os_log_type_enabled(v96, v98))
    {
      v99 = swift_slowAlloc();
      v100 = v93;
      v101 = swift_slowAlloc();
      v206 = v101;
      *(_DWORD *)v99 = v196;
      sub_23F3578DC(&qword_256E6D470, (uint64_t (*)(uint64_t))MEMORY[0x24BE563D8], MEMORY[0x24BE563D0]);
      v102 = sub_23F357CD0();
      *(_QWORD *)(v99 + 4) = sub_23F356FB0(v102, v103, &v206);
      swift_bridgeObjectRelease();
      v104 = *(void (**)(_BYTE *, uint64_t))(v100 + 8);
      v104(v97, v94);
      _os_log_impl(&dword_23F34B000, v96, v98, "SystemResponseGenerated event does not contain a dialogFormat: %s", (uint8_t *)v99, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242669F10](v101, -1, -1);
      v105 = v99;
      v24 = v197;
      MEMORY[0x242669F10](v105, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v200 + 8))(v189, v201);
      v104(v194, v94);
    }
    else
    {

      v106 = *(void (**)(_BYTE *, uint64_t))(v93 + 8);
      v106(v97, v94);
      (*(void (**)(_BYTE *, uint64_t))(v200 + 8))(v95, v201);
      v106(v92, v94);
    }
    v31 = v186;
    v35 = v203;
    v30 = v187;
    (*(void (**)(_BYTE *, uint64_t))(v186 + 8))(v203, v187);
    v57 = v188;
    v86 = v204;
    goto LABEL_38;
  }
  swift_release();
  return (char *)MEMORY[0x24BEE4AF8];
}

char *sub_23F353DBC(uint64_t a1)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  __int128 v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  void (*v61)(_QWORD, _QWORD, _QWORD);
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  id v84;
  id v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v95;
  unint64_t v96;
  char *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  char *v103;
  char *v104;
  NSObject *v105;
  os_log_type_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  void (*v112)(char *, uint64_t);
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  _QWORD v117[2];
  char *v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  __int128 v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(_QWORD, _QWORD, _QWORD);
  const char *v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  char *v152;
  unint64_t v153;
  id v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;
  uint64_t v158;

  v158 = *MEMORY[0x24BDAC8D0];
  v144 = sub_23F357CF4();
  v143 = *(_QWORD *)(v144 - 8);
  v2 = MEMORY[0x24BDAC7A8](v144);
  v4 = (char *)v117 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v118 = (char *)v117 - v5;
  v6 = sub_23F357F34();
  MEMORY[0x24BDAC7A8](v6);
  v124 = (char *)v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23F357C94();
  v145 = *(_QWORD *)(v8 - 8);
  v146 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v150 = (char *)v117 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = sub_23F357E8C();
  v149 = *(_QWORD *)(v151 - 8);
  v10 = MEMORY[0x24BDAC7A8](v151);
  v139 = (char *)v117 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v117 - v12;
  v119 = sub_23F357EEC();
  v123 = *(_QWORD *)(v119 - 8);
  MEMORY[0x24BDAC7A8](v119);
  v122 = (char *)v117 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23F34D6BC(&qword_256E6D400);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v117 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23F34D6BC(&qword_256E6D408);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v121 = (uint64_t)v117 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v142 = (uint64_t)v117 - v21;
  v135 = sub_23F357D48();
  v134 = *(_QWORD *)(v135 - 8);
  v22 = MEMORY[0x24BDAC7A8](v135);
  v127 = (char *)v117 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v152 = (char *)v117 - v24;
  v25 = sub_23F34D6BC(&qword_256E6D340);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v117 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v132 = (uint64_t)v117 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v33 = (_QWORD *)((char *)v117 - v32);
  v34 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v156 = MEMORY[0x24BEE4AF8];
  v35 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v137 = v4;
  v140 = v13;
  v138 = v17;
  v133 = v26;
  if (v35)
  {
    v141 = v25;
    v36 = *(_QWORD *)(v26 + 72);
    v153 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v37 = a1 + v153;
    v147 = (void (*)(_QWORD, _QWORD, _QWORD))a1;
    v148 = "Swift/UnsafeBufferPointer.swift";
    do
    {
      sub_23F3578B0(v37, (uint64_t)v33, &qword_256E6D340);
      if (*v33 == 0xD000000000000020 && v33[1] == 0x800000023F358FF0 || (sub_23F358048() & 1) != 0)
      {
        sub_23F357978((uint64_t)v33, (uint64_t)v29, &qword_256E6D340);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23F3500EC(0, *(_QWORD *)(v34 + 16) + 1, 1);
        v34 = v156;
        v39 = *(_QWORD *)(v156 + 16);
        v38 = *(_QWORD *)(v156 + 24);
        if (v39 >= v38 >> 1)
        {
          sub_23F3500EC(v38 > 1, v39 + 1, 1);
          v34 = v156;
        }
        *(_QWORD *)(v34 + 16) = v39 + 1;
        sub_23F357978((uint64_t)v29, v34 + v153 + v39 * v36, &qword_256E6D340);
        v17 = v138;
      }
      else
      {
        sub_23F3579A4((uint64_t)v33, &qword_256E6D340);
      }
      v37 += v36;
      --v35;
    }
    while (v35);
    v34 = v156;
    v13 = v140;
    v26 = v133;
    v25 = v141;
  }
  swift_bridgeObjectRelease();
  v41 = v151;
  v130 = *(_QWORD *)(v34 + 16);
  if (v130)
  {
    v42 = 0;
    v43 = 0;
    v129 = v132 + *(int *)(v25 + 48);
    v44 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v131 = v34;
    v128 = v34 + v44;
    v126 = (char *)MEMORY[0x24BEE4AF8];
    v120 = *MEMORY[0x24BE56270];
    *(_QWORD *)&v40 = 136315138;
    v136 = v40;
    v125 = MEMORY[0x24BEE4AD8] + 8;
    v45 = v118;
    v46 = v135;
    v47 = v134;
    while (1)
    {
      if (v42 >= *(_QWORD *)(v131 + 16))
        __break(1u);
      v153 = (unint64_t)v43;
      v48 = *(_QWORD *)(v26 + 72);
      v141 = v42;
      sub_23F3578B0(v128 + v48 * v42, v132, &qword_256E6D340);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v152, v129, v46);
      sub_23F357D24();
      v49 = sub_23F357D60();
      if (sub_23F35785C((uint64_t)v17, 1, v49) == 1)
      {
        sub_23F3579A4((uint64_t)v17, &qword_256E6D400);
        v50 = sub_23F357E14();
        sub_23F357868(v142, 1, 1, v50);
      }
      else
      {
        v51 = v142;
        sub_23F357D54();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v49 - 8) + 8))(v17, v49);
        v52 = sub_23F357E14();
        if (sub_23F35785C(v51, 1, v52) != 1)
        {
          v53 = v121;
          sub_23F3578B0(v142, v121, &qword_256E6D408);
          v54 = *(_QWORD *)(v52 - 8);
          v55 = (*(uint64_t (**)(uint64_t, uint64_t))(v54 + 88))(v53, v52);
          if (v55 == v120)
          {
            (*(void (**)(uint64_t, uint64_t))(v54 + 96))(v53, v52);
            v56 = v119;
            (*(void (**)(char *, uint64_t, uint64_t))(v123 + 32))(v122, v53, v119);
            v57 = sub_23F357EE0();
            v58 = *(_QWORD *)(v57 + 16);
            if (!v58)
            {
              swift_bridgeObjectRelease();
              v86 = v152;
              v43 = (void *)v153;
LABEL_52:
              (*(void (**)(char *, uint64_t))(v123 + 8))(v122, v56);
              v47 = v134;
              v46 = v135;
              (*(void (**)(char *, uint64_t))(v134 + 8))(v86, v135);
              v45 = v118;
              v26 = v133;
              goto LABEL_49;
            }
            v59 = (*(unsigned __int8 *)(v149 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v149 + 80);
            v117[1] = v57;
            v60 = v57 + v59;
            v148 = *(const char **)(v149 + 72);
            v61 = *(void (**)(_QWORD, _QWORD, _QWORD))(v149 + 16);
            v62 = v150;
            v63 = v137;
            v147 = v61;
            v43 = (void *)v153;
            while (2)
            {
              v153 = v58;
              v61(v13, v60, v41);
              sub_23F357C88();
              sub_23F3578DC(&qword_256E6D448, (uint64_t (*)(uint64_t))MEMORY[0x24BE563E8], MEMORY[0x24BE563E0]);
              v64 = sub_23F357CB8();
              if (v43)
              {
                (*(void (**)(char *, uint64_t))(v145 + 8))(v62, v146);
                sub_23F357CDC();
                v66 = v139;
                v61(v139, v13, v41);
                v67 = v13;
                v68 = sub_23F357CE8();
                v69 = sub_23F357F94();
                if (os_log_type_enabled(v68, v69))
                {
                  v70 = swift_slowAlloc();
                  v71 = swift_slowAlloc();
                  *(_QWORD *)&v156 = v71;
                  *(_DWORD *)v70 = v136;
                  v72 = sub_23F357CD0();
                  *(_QWORD *)(v70 + 4) = sub_23F356FB0(v72, v73, (uint64_t *)&v156);
                  swift_bridgeObjectRelease();
                  v74 = *(void (**)(char *, uint64_t))(v149 + 8);
                  v74(v66, v151);
                  _os_log_impl(&dword_23F34B000, v68, v69, "Unable to get json string for statementResult: %s", (uint8_t *)v70, 0xCu);
                  swift_arrayDestroy();
                  v75 = v71;
                  v63 = v137;
                  MEMORY[0x242669F10](v75, -1, -1);
                  v76 = v70;
                  v41 = v151;
                  MEMORY[0x242669F10](v76, -1, -1);

                }
                else
                {

                  v74 = *(void (**)(char *, uint64_t))(v149 + 8);
                  v74(v66, v41);
                }
                (*(void (**)(char *, uint64_t))(v143 + 8))(v63, v144);
                v74(v67, v41);
                v43 = 0;
                v62 = v150;
                v13 = v67;
                v86 = v152;
                goto LABEL_36;
              }
              v77 = v64;
              v78 = v65;
              (*(void (**)(char *, uint64_t))(v145 + 8))(v62, v146);
              v79 = (void *)objc_opt_self();
              v80 = (void *)sub_23F357BE0();
              v154 = 0;
              v81 = objc_msgSend(v79, sel_JSONObjectWithData_options_error_, v80, 0, &v154);

              v82 = v154;
              if (v81)
              {
                sub_23F357FB8();
                swift_unknownObjectRelease();
                sub_23F34E194(&v155, &v156);
                sub_23F34F164(&v156, v157);
                v83 = sub_23F35803C();
                *(_QWORD *)&v155 = 0;
                v84 = objc_msgSend(v79, sel_dataWithJSONObject_options_error_, v83, 3, &v155);
                swift_unknownObjectRelease();
                v85 = (id)v155;
                v86 = v152;
                if (v84)
                {
                  v87 = sub_23F357BEC();
                  v89 = v88;

                  sub_23F357F28();
                  v90 = sub_23F357F1C();
                  v92 = v91;
                  sub_23F34F120(v87, v89);
                  sub_23F34F208((uint64_t)&v156);
                  sub_23F34F120(v77, v78);
                  if (v92)
                  {
                    v93 = v126;
                    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                    v63 = v137;
                    v41 = v151;
                    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                      v93 = sub_23F3566AC(0, *((_QWORD *)v93 + 2) + 1, 1, (uint64_t)v93);
                    v96 = *((_QWORD *)v93 + 2);
                    v95 = *((_QWORD *)v93 + 3);
                    if (v96 >= v95 >> 1)
                      v93 = sub_23F3566AC((char *)(v95 > 1), v96 + 1, 1, (uint64_t)v93);
                    *((_QWORD *)v93 + 2) = v96 + 1;
                    v126 = v93;
                    v97 = &v93[16 * v96];
                    *((_QWORD *)v97 + 4) = v90;
                    *((_QWORD *)v97 + 5) = v92;
                    v13 = v140;
                    (*(void (**)(char *, uint64_t))(v149 + 8))(v140, v41);
                    v62 = v150;
LABEL_36:
                    v98 = v153;
                    v61 = v147;
LABEL_42:
                    v60 += (unint64_t)v148;
                    v58 = v98 - 1;
                    if (!v58)
                    {
                      swift_bridgeObjectRelease();
                      v56 = v119;
                      v17 = v138;
                      goto LABEL_52;
                    }
                    continue;
                  }
                  v63 = v137;
                }
                else
                {
                  v101 = v85;
                  v102 = (void *)sub_23F357BD4();

                  swift_willThrow();
                  sub_23F34F208((uint64_t)&v156);
                  sub_23F34F120(v77, v78);
                  v43 = 0;
                }
                v41 = v151;
              }
              else
              {
                v99 = v82;
                v100 = (void *)sub_23F357BD4();

                swift_willThrow();
                sub_23F34F120(v77, v78);
                v43 = 0;
                v41 = v151;
                v86 = v152;
              }
              break;
            }
            v98 = v153;
            v61 = v147;
            v13 = v140;
            (*(void (**)(char *, uint64_t))(v149 + 8))(v140, v41);
            v62 = v150;
            goto LABEL_42;
          }
          (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v52);
        }
      }
      sub_23F357CDC();
      v47 = v134;
      v103 = v127;
      v104 = v152;
      v46 = v135;
      (*(void (**)(char *, char *, uint64_t))(v134 + 16))(v127, v152, v135);
      v105 = sub_23F357CE8();
      v106 = sub_23F357F88();
      if (os_log_type_enabled(v105, v106))
      {
        v107 = v103;
        v108 = swift_slowAlloc();
        v109 = swift_slowAlloc();
        *(_QWORD *)&v156 = v109;
        *(_DWORD *)v108 = v136;
        sub_23F3578DC(&qword_256E6D410, (uint64_t (*)(uint64_t))MEMORY[0x24BE55B10], MEMORY[0x24BE55B08]);
        v110 = sub_23F357CD0();
        *(_QWORD *)(v108 + 4) = sub_23F356FB0(v110, v111, (uint64_t *)&v156);
        swift_bridgeObjectRelease();
        v112 = *(void (**)(char *, uint64_t))(v47 + 8);
        v112(v107, v46);
        _os_log_impl(&dword_23F34B000, v105, v106, "Unable to convert eventPayload into ResponseGenerationRequestCreated event: %s", (uint8_t *)v108, 0xCu);
        swift_arrayDestroy();
        v113 = v109;
        v17 = v138;
        MEMORY[0x242669F10](v113, -1, -1);
        MEMORY[0x242669F10](v108, -1, -1);

        (*(void (**)(char *, uint64_t))(v143 + 8))(v45, v144);
        v112(v152, v46);
      }
      else
      {

        v114 = *(void (**)(char *, uint64_t))(v47 + 8);
        v114(v103, v46);
        (*(void (**)(char *, uint64_t))(v143 + 8))(v45, v144);
        v114(v104, v46);
      }
      v13 = v140;
      v26 = v133;
      v43 = (void *)v153;
LABEL_49:
      v115 = v141 + 1;
      sub_23F3579A4(v142, &qword_256E6D408);
      v42 = v115;
      if (v115 == v130)
      {
        swift_release();
        return v126;
      }
    }
  }
  swift_release();
  return (char *)MEMORY[0x24BEE4AF8];
}

char *sub_23F354CB8(unint64_t a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  unint64_t v50;
  unint64_t v51;
  __int128 v52;
  uint64_t v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  NSObject *v91;
  os_log_type_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  void (*v97)(char *, uint64_t);
  NSObject *v98;
  char *v99;
  char *v100;
  os_log_type_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  void (*v108)(char *, uint64_t);
  void (*v109)(char *, uint64_t);
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  uint64_t v117;
  unint64_t v118;
  char v119;
  id v120;
  void *v121;
  unint64_t v122;
  char v123;
  uint64_t v124;
  unint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  char *v136;
  char *v137;
  char *v138;
  NSObject *v139;
  os_log_type_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  void (*v145)(char *, uint64_t);
  uint64_t v146;
  uint64_t v147;
  void (*v148)(char *, uint64_t);
  unint64_t v149;
  char v150;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  int v158;
  char *v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  char *v171;
  char *v172;
  int v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  char *v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  char *v187;
  char *v188;
  char *v189;
  __int128 v190;
  unint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void (*v200)(char *, unint64_t, uint64_t);
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  __int128 v204;
  __int128 v205;
  uint64_t v206;

  v206 = *MEMORY[0x24BDAC8D0];
  v2 = sub_23F357CF4();
  v198 = *(_QWORD *)(v2 - 8);
  v199 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v171 = (char *)&v152 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v180 = (char *)&v152 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v188 = (char *)&v152 - v7;
  v166 = sub_23F357C94();
  v165 = *(_QWORD *)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v164 = (char *)&v152 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v176 = sub_23F357EF8();
  v178 = *(_QWORD *)(v176 - 8);
  v9 = MEMORY[0x24BDAC7A8](v176);
  v159 = (char *)&v152 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v152 - v11;
  v13 = sub_23F34D6BC(&qword_256E6D3F0);
  MEMORY[0x24BDAC7A8](v13);
  v189 = (char *)&v152 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23F34D6BC(&qword_256E6D3F8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v175 = (uint64_t)&v152 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v201 = (uint64_t)&v152 - v18;
  v192 = sub_23F357DCC();
  v197 = *(_QWORD *)(v192 - 8);
  v19 = MEMORY[0x24BDAC7A8](v192);
  v21 = (char *)&v152 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v152 - v22;
  v163 = sub_23F357EC8();
  v162 = *(_QWORD *)(v163 - 8);
  MEMORY[0x24BDAC7A8](v163);
  v161 = (char *)&v152 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23F34D6BC(&qword_256E6D400);
  MEMORY[0x24BDAC7A8](v25);
  v172 = (char *)&v152 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_23F34D6BC(&qword_256E6D408);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v160 = (uint64_t)&v152 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v195 = (uint64_t)&v152 - v30;
  v31 = sub_23F357D48();
  v194 = *(_QWORD *)(v31 - 8);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v179 = (char *)&v152 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v32);
  v157 = (char *)&v152 - v34;
  v196 = sub_23F34D6BC(&qword_256E6D340);
  v35 = *(_QWORD *)(v196 - 8);
  v36 = MEMORY[0x24BDAC7A8](v196);
  v38 = (char *)&v152 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x24BDAC7A8](v36);
  v186 = (uint64_t)&v152 - v40;
  MEMORY[0x24BDAC7A8](v39);
  v42 = (uint64_t *)((char *)&v152 - v41);
  v43 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v204 = MEMORY[0x24BEE4AF8];
  v44 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v167 = v21;
  v193 = v31;
  v184 = v35;
  v177 = v12;
  if (v44)
  {
    v45 = *(unsigned __int8 *)(v35 + 80);
    v46 = *(_QWORD *)(v35 + 72);
    v191 = a1;
    v200 = (void (*)(char *, unint64_t, uint64_t))((v45 + 32) & ~v45);
    v47 = (uint64_t)v200 + a1;
    v48 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_23F3578B0(v47, (uint64_t)v42, &qword_256E6D340);
      v49 = *v42 == 0x746552736C6F6F54 && v42[1] == 0xEE00646576656972;
      if (v49 || (sub_23F358048() & 1) != 0)
      {
        sub_23F357978((uint64_t)v42, (uint64_t)v38, &qword_256E6D340);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23F3500EC(0, *(_QWORD *)(v48 + 16) + 1, 1);
        v48 = v204;
        v51 = *(_QWORD *)(v204 + 16);
        v50 = *(_QWORD *)(v204 + 24);
        if (v51 >= v50 >> 1)
        {
          sub_23F3500EC(v50 > 1, v51 + 1, 1);
          v48 = v204;
        }
        *(_QWORD *)(v48 + 16) = v51 + 1;
        sub_23F357978((uint64_t)v38, (uint64_t)v200 + v48 + v51 * v46, &qword_256E6D340);
        v31 = v193;
      }
      else
      {
        sub_23F3579A4((uint64_t)v42, &qword_256E6D340);
      }
      v47 += v46;
      --v44;
    }
    while (v44);
    v43 = v204;
    v21 = v167;
    v35 = v184;
  }
  swift_bridgeObjectRelease();
  v53 = (uint64_t)v172;
  v54 = v157;
  v185 = *(_QWORD *)(v43 + 16);
  if (!v185)
  {
    swift_release();
    v156 = (char *)MEMORY[0x24BEE4AF8];
    v150 = 1;
    goto LABEL_81;
  }
  LODWORD(v200) = 0;
  v55 = 0;
  v174 = 0;
  v182 = v186 + *(int *)(v196 + 48);
  v181 = v43 + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80));
  v156 = (char *)MEMORY[0x24BEE4AF8];
  v158 = *MEMORY[0x24BE56260];
  v173 = *MEMORY[0x24BE56160];
  v196 = 1;
  *(_QWORD *)&v52 = 136315138;
  v190 = v52;
  v169 = MEMORY[0x24BEE4AD8] + 8;
  v187 = v23;
  v56 = v194;
  v183 = v43;
  do
  {
    if (v55 >= *(_QWORD *)(v43 + 16))
      __break(1u);
    v57 = *(_QWORD *)(v35 + 72);
    v191 = v55;
    sub_23F3578B0(v181 + v57 * v55, v186, &qword_256E6D340);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v54, v182, v31);
    sub_23F357D24();
    v58 = sub_23F357D60();
    if (sub_23F35785C(v53, 1, v58) == 1)
    {
      sub_23F3579A4(v53, &qword_256E6D400);
      v59 = sub_23F357E14();
      sub_23F357868(v195, 1, 1, v59);
LABEL_72:
      v134 = v21;
      v135 = v56;
      v136 = v180;
      sub_23F357CDC();
      v137 = v54;
      v138 = v179;
      (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v179, v137, v31);
      v139 = sub_23F357CE8();
      v140 = sub_23F357F88();
      if (os_log_type_enabled(v139, v140))
      {
        v141 = swift_slowAlloc();
        v142 = swift_slowAlloc();
        *(_QWORD *)&v204 = v142;
        *(_DWORD *)v141 = v190;
        sub_23F3578DC(&qword_256E6D410, (uint64_t (*)(uint64_t))MEMORY[0x24BE55B10], MEMORY[0x24BE55B08]);
        v143 = sub_23F357CD0();
        *(_QWORD *)(v141 + 4) = sub_23F356FB0(v143, v144, (uint64_t *)&v204);
        swift_bridgeObjectRelease();
        v145 = *(void (**)(char *, uint64_t))(v135 + 8);
        v145(v138, v193);
        _os_log_impl(&dword_23F34B000, v139, v140, "Unable to convert eventPayload into ToolsRetrieved event: %s", (uint8_t *)v141, 0xCu);
        swift_arrayDestroy();
        v146 = v142;
        v31 = v193;
        MEMORY[0x242669F10](v146, -1, -1);
        v147 = v141;
        v53 = (uint64_t)v172;
        MEMORY[0x242669F10](v147, -1, -1);

        (*(void (**)(char *, uint64_t))(v198 + 8))(v136, v199);
        v145(v137, v31);
      }
      else
      {

        v148 = *(void (**)(char *, uint64_t))(v135 + 8);
        v148(v138, v31);
        (*(void (**)(char *, uint64_t))(v198 + 8))(v136, v199);
        v148(v137, v31);
      }
      v54 = v137;
      v35 = v184;
      v43 = v183;
      v56 = v135;
      v21 = v134;
      v23 = v187;
      goto LABEL_76;
    }
    v60 = v195;
    sub_23F357D54();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 8))(v53, v58);
    v61 = sub_23F357E14();
    if (sub_23F35785C(v60, 1, v61) == 1)
      goto LABEL_72;
    v62 = v160;
    sub_23F3578B0(v195, v160, &qword_256E6D408);
    v63 = *(_QWORD *)(v61 - 8);
    v64 = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 88))(v62, v61);
    if (v64 != v158)
    {
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v61);
      goto LABEL_72;
    }
    (*(void (**)(uint64_t, uint64_t))(v63 + 96))(v62, v61);
    (*(void (**)(char *, uint64_t, uint64_t))(v162 + 32))(v161, v62, v163);
    sub_23F357EB0();
    v66 = v65;
    v67 = sub_23F357EBC();
    v68 = *(_QWORD *)(v67 + 16);
    if (v68)
    {
      v69 = (*(unsigned __int8 *)(v197 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v197 + 80);
      v155 = v67;
      v70 = v67 + v69;
      v196 = *(_QWORD *)(v197 + 72);
      v200 = *(void (**)(char *, unint64_t, uint64_t))(v197 + 16);
      v71 = v188;
      v72 = (uint64_t)v189;
      v73 = v192;
      while (1)
      {
        v200(v23, v70, v73);
        sub_23F357DC0();
        v74 = sub_23F357DB4();
        if (sub_23F35785C(v72, 1, v74) == 1)
        {
          sub_23F3579A4(v72, &qword_256E6D3F0);
          v75 = sub_23F357D9C();
          sub_23F357868(v201, 1, 1, v75);
LABEL_34:
          sub_23F357CDC();
          v200(v21, (unint64_t)v23, v73);
          v98 = sub_23F357CE8();
          v99 = v23;
          v100 = v21;
          v101 = sub_23F357F88();
          if (os_log_type_enabled(v98, v101))
          {
            v102 = swift_slowAlloc();
            v103 = swift_slowAlloc();
            *(_QWORD *)&v204 = v103;
            *(_DWORD *)v102 = v190;
            sub_23F3578DC(&qword_256E6D418, (uint64_t (*)(uint64_t))MEMORY[0x24BE561A0], MEMORY[0x24BE56198]);
            v104 = sub_23F357CD0();
            *(_QWORD *)(v102 + 4) = sub_23F356FB0(v104, v105, (uint64_t *)&v204);
            swift_bridgeObjectRelease();
            v106 = *(void (**)(char *, uint64_t))(v197 + 8);
            v106(v100, v73);
            _os_log_impl(&dword_23F34B000, v98, v101, "ToolsRetrieved event does not contain a implementation defiintion: %s", (uint8_t *)v102, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x242669F10](v103, -1, -1);
            v107 = v102;
            v72 = (uint64_t)v189;
            v71 = v188;
            MEMORY[0x242669F10](v107, -1, -1);

            (*(void (**)(char *, uint64_t))(v198 + 8))(v71, v199);
            v106(v99, v73);
          }
          else
          {

            v108 = *(void (**)(char *, uint64_t))(v197 + 8);
            v108(v100, v73);
            (*(void (**)(char *, uint64_t))(v198 + 8))(v71, v199);
            v108(v99, v73);
          }
          v21 = v100;
          v23 = v99;
          v56 = v194;
          goto LABEL_38;
        }
        v76 = v201;
        sub_23F357DA8();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 8))(v72, v74);
        v77 = sub_23F357D9C();
        v78 = v76;
        v73 = v192;
        if (sub_23F35785C(v78, 1, v77) == 1)
          goto LABEL_34;
        v79 = v175;
        sub_23F3578B0(v201, v175, &qword_256E6D3F8);
        v80 = *(_QWORD *)(v77 - 8);
        v81 = (*(uint64_t (**)(uint64_t, uint64_t))(v80 + 88))(v79, v77);
        if (v81 != v173)
        {
          (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v77);
          v73 = v192;
          goto LABEL_34;
        }
        (*(void (**)(uint64_t, uint64_t))(v80 + 96))(v79, v77);
        (*(void (**)(char *, uint64_t, uint64_t))(v178 + 32))(v177, v79, v176);
        v82 = v164;
        sub_23F357C88();
        sub_23F3578DC(&qword_256E6D420, (uint64_t (*)(uint64_t))MEMORY[0x24BEB96E0], MEMORY[0x24BEB96C8]);
        v168 = v83;
        v84 = v174;
        v85 = sub_23F357CB8();
        if (v84)
        {
          (*(void (**)(char *, uint64_t))(v165 + 8))(v82, v166);
          v170 = v84;
        }
        else
        {
          v110 = v86;
          v111 = v85;
          (*(void (**)(char *, uint64_t))(v165 + 8))(v82, v166);
          v112 = (void *)objc_opt_self();
          v113 = v110;
          v114 = (void *)sub_23F357BE0();
          *(_QWORD *)&v204 = 0;
          v115 = objc_msgSend(v112, sel_JSONObjectWithData_options_error_, v114, 0, &v204);

          if (v115)
          {
            v168 = v111;
            v170 = v113;
            v174 = 0;
            v116 = (id)v204;
            sub_23F357FB8();
            swift_unknownObjectRelease();
            sub_23F34D6BC(&qword_256E6D428);
            if ((swift_dynamicCast() & 1) != 0)
            {
              v117 = v202;
              v21 = v167;
              if (*(_QWORD *)(v202 + 16)
                && (v118 = sub_23F357718(25705, 0xE200000000000000), (v119 & 1) != 0)
                && (sub_23F357874(*(_QWORD *)(v117 + 56) + 32 * v118, (uint64_t)&v204), (swift_dynamicCast() & 1) != 0))
              {
                v154 = v202;
                v153 = v203;
              }
              else
              {
                v154 = 0;
                v153 = 0;
              }
              if (*(_QWORD *)(v117 + 16)
                && (v122 = sub_23F357718(1701667182, 0xE400000000000000), (v123 & 1) != 0)
                && (sub_23F357874(*(_QWORD *)(v117 + 56) + 32 * v122, (uint64_t)&v204), (swift_dynamicCast() & 1) != 0))
              {
                v124 = v203;
                v152 = v202;
              }
              else
              {
                v152 = 0;
                v124 = 0;
              }
              if (*(_QWORD *)(v117 + 16)
                && (v125 = sub_23F357718(0x657079546C6F6F74, 0xE800000000000000), (v126 & 1) != 0))
              {
                sub_23F357874(*(_QWORD *)(v117 + 56) + 32 * v125, (uint64_t)&v204);
              }
              else
              {
                v204 = 0u;
                v205 = 0u;
              }
              swift_bridgeObjectRelease();
              if (*((_QWORD *)&v205 + 1))
              {
                if ((swift_dynamicCast() & 1) != 0)
                {
                  v127 = v202;
                  v128 = v203;
LABEL_66:
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v156 = sub_23F356798(0, *((_QWORD *)v156 + 2) + 1, 1, (uint64_t)v156);
                  v130 = *((_QWORD *)v156 + 2);
                  v129 = *((_QWORD *)v156 + 3);
                  if (v130 >= v129 >> 1)
                    v156 = sub_23F356798((char *)(v129 > 1), v130 + 1, 1, (uint64_t)v156);
                  v131 = v156;
                  *((_QWORD *)v156 + 2) = v130 + 1;
                  v132 = &v131[48 * v130];
                  v133 = v153;
                  *((_QWORD *)v132 + 4) = v154;
                  *((_QWORD *)v132 + 5) = v133;
                  *((_QWORD *)v132 + 6) = v152;
                  *((_QWORD *)v132 + 7) = v124;
                  *((_QWORD *)v132 + 8) = v127;
                  *((_QWORD *)v132 + 9) = v128;
                  sub_23F34F120(v168, (unint64_t)v170);
                  (*(void (**)(char *, uint64_t))(v178 + 8))(v177, v176);
                  v73 = v192;
                  (*(void (**)(char *, uint64_t))(v197 + 8))(v23, v192);
                  v71 = v188;
                  v72 = (uint64_t)v189;
                  goto LABEL_38;
                }
              }
              else
              {
                sub_23F3579A4((uint64_t)&v204, &qword_256E6D430);
              }
              v127 = 0;
              v128 = 0;
              goto LABEL_66;
            }
            sub_23F34F120(v168, (unint64_t)v170);
            (*(void (**)(char *, uint64_t))(v178 + 8))(v177, v176);
            v73 = v192;
            (*(void (**)(char *, uint64_t))(v197 + 8))(v23, v192);
            goto LABEL_42;
          }
          v120 = (id)v204;
          v121 = (void *)sub_23F357BD4();

          v170 = v121;
          swift_willThrow();
          sub_23F34F120(v111, (unint64_t)v113);
        }
        v174 = 0;
        sub_23F357CDC();
        v87 = v178;
        v88 = v159;
        v89 = v177;
        v90 = v176;
        (*(void (**)(char *, char *, uint64_t))(v178 + 16))(v159, v177, v176);
        v91 = sub_23F357CE8();
        v92 = sub_23F357F94();
        if (os_log_type_enabled(v91, v92))
        {
          v93 = swift_slowAlloc();
          v94 = swift_slowAlloc();
          *(_QWORD *)&v204 = v94;
          *(_DWORD *)v93 = v190;
          v95 = sub_23F357CD0();
          *(_QWORD *)(v93 + 4) = sub_23F356FB0(v95, v96, (uint64_t *)&v204);
          swift_bridgeObjectRelease();
          v97 = *(void (**)(char *, uint64_t))(v178 + 8);
          v97(v88, v90);
          _os_log_impl(&dword_23F34B000, v91, v92, "Unable to get jsonData tool implementation defintion: %s", (uint8_t *)v93, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x242669F10](v94, -1, -1);
          MEMORY[0x242669F10](v93, -1, -1);

          (*(void (**)(char *, uint64_t))(v198 + 8))(v171, v199);
          v97(v177, v90);
        }
        else
        {

          v109 = *(void (**)(char *, uint64_t))(v87 + 8);
          v109(v88, v90);
          (*(void (**)(char *, uint64_t))(v198 + 8))(v171, v199);
          v109(v89, v90);
        }
        v23 = v187;
        v73 = v192;
        (*(void (**)(char *, uint64_t))(v197 + 8))(v187, v192);
        v71 = v188;
LABEL_42:
        v72 = (uint64_t)v189;
        v21 = v167;
LABEL_38:
        sub_23F3579A4(v201, &qword_256E6D3F8);
        v70 += v196;
        if (!--v68)
        {
          swift_bridgeObjectRelease();
          v53 = (uint64_t)v172;
          v31 = v193;
          v35 = v184;
          goto LABEL_79;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_79:
    LODWORD(v200) = v66;
    (*(void (**)(char *, uint64_t))(v162 + 8))(v161, v163);
    v54 = v157;
    (*(void (**)(char *, uint64_t))(v56 + 8))(v157, v31);
    v196 = 0;
    v43 = v183;
LABEL_76:
    v149 = v191 + 1;
    sub_23F3579A4(v195, &qword_256E6D408);
    v55 = v149;
  }
  while (v149 != v185);
  swift_release();
  v150 = v196;
LABEL_81:
  LOBYTE(v204) = v150 & 1;
  return v156;
}

void sub_23F3561C0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v4 = sub_23F357CF4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_eventBody);
  if (v8)
  {
    v9 = v8;
    swift_beginAccess();
    v10 = v9;
    MEMORY[0x242669AA8]();
    sub_23F356680(*(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFF8) + 0x10));
    sub_23F357F7C();
    sub_23F357F64();
    swift_endAccess();

  }
  else
  {
    sub_23F357CDC();
    v11 = sub_23F357CE8();
    v12 = sub_23F357F94();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23F34B000, v11, v12, "Receiving SageTranscriptEvent Biome events with no eventBody", v13, 2u);
      MEMORY[0x242669F10](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_23F35632C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t TranscriptContextBuilder.deinit()
{
  uint64_t v0;

  sub_23F350490();
  return v0;
}

uint64_t TranscriptContextBuilder.__deallocating_deinit()
{
  sub_23F350490();
  sub_23F357B50();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TranscriptContextBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for TranscriptContextBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TranscriptContextBuilder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_23F3563E0@<X0>(uint64_t a1@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v2 = sub_23F357C28();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  sub_23F350454();
  v6 = v5 - v4;
  v7 = sub_23F357C70();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_23F350454();
  v11 = v10 - v9;
  v12 = sub_23F357C7C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  sub_23F350454();
  v16 = v15 - v14;
  v17 = sub_23F34D6BC(&qword_256E6D4C0);
  MEMORY[0x24BDAC7A8](v17);
  sub_23F357B38();
  sub_23F357C64();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BDCF258], v7);
  sub_23F357C1C();
  sub_23F357C58();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
  result = sub_23F35785C(v1, 1, v2);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, v1, v2);
  __break(1u);
  return result;
}

id sub_23F356580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  void *v5;
  void *v6;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = v5;
  v12 = sub_23F357C28();
  v13 = 0;
  if (sub_23F35785C(a1, 1, v12) != 1)
  {
    v13 = (void *)sub_23F357C04();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  if (sub_23F35785C(a2, 1, v12) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_23F357C04();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a2, v12);
  }
  v15 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

uint64_t sub_23F356680(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_23F357F70();
  return result;
}

char *sub_23F3566AC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_23F34D6BC(&qword_256E6D450);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_23F356DD8((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23F356A64(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_23F356798(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_23F34D6BC(&qword_256E6D438);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_23F356F24((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23F356B58(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_23F35688C(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_23F34D6BC(&qword_256E6D338);
  v10 = *(_QWORD *)(sub_23F34D6BC(&qword_256E6D340) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_23F357FE8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_23F34D6BC(&qword_256E6D340) - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_23F356E5C(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23F356C54(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_23F356A64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_23F358000();
  __break(1u);
  return result;
}

uint64_t sub_23F356B58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_23F358000();
  __break(1u);
  return result;
}

uint64_t sub_23F356C54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_23F34D6BC(&qword_256E6D340) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_23F358000();
  __break(1u);
  return result;
}

char *sub_23F356D78(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_23F357B60();
    __src = (char *)sub_23F357B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_23F356DD8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23F358000();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_23F356E5C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    sub_23F357B60();
    result = sub_23F357B10();
    __break(1u);
  }
  else if (a3 < a1
         || (result = sub_23F34D6BC(&qword_256E6D340), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_23F34D6BC(&qword_256E6D340);
    sub_23F357B78();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    sub_23F357B78();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_23F356F24(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_23F358000();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

uint64_t sub_23F356FB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_23F357080(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23F357874((uint64_t)v12, *a3);
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
      sub_23F357874((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_23F34F208((uint64_t)v12);
  return v7;
}

uint64_t sub_23F357080(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23F3571D4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_23F357FAC();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_23F357298(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_23F357FDC();
    if (!v8)
    {
      result = sub_23F357FE8();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_23F3571D4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23F358000();
  __break(1u);
  return result;
}

uint64_t sub_23F357298(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23F35732C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_23F357500(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_23F357500((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23F35732C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_23F357F4C();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_23F35749C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_23F357FC4();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_23F358000();
  __break(1u);
LABEL_14:
  result = sub_23F357FE8();
  __break(1u);
  return result;
}

_QWORD *sub_23F35749C(uint64_t a1, uint64_t a2)
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
  sub_23F34D6BC(&qword_256E6D440);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23F357500(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_23F34D6BC(&qword_256E6D440);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_23F357698(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23F3575D4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_23F3575D4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_23F358000();
  __break(1u);
  return result;
}

char *sub_23F357698(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_23F358000();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_23F357718(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23F358084();
  sub_23F357F40();
  v4 = sub_23F35809C();
  return sub_23F35777C(a1, a2, v4);
}

unint64_t sub_23F35777C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23F358048() & 1) == 0)
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
      while (!v14 && (sub_23F358048() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23F35785C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_23F357868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23F357874(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_23F3578B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23F357B28(a1, a2, a3);
  sub_23F357B98(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_23F35039C();
}

void sub_23F3578DC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x242669EB0](a3, v5), a1);
  }
  sub_23F35039C();
}

uint64_t sub_23F357918(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_eventType);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_23F357F10();

  return v3;
}

void sub_23F357978(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_23F357B28(a1, a2, a3);
  sub_23F357B98(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_23F35039C();
}

void sub_23F3579A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23F34D6BC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_23F35039C();
}

uint64_t sub_23F3579DC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_23F357BEC();

  return v3;
}

uint64_t sub_23F357A3C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

unint64_t sub_23F357A80()
{
  unint64_t result;

  result = qword_256E6D4D0;
  if (!qword_256E6D4D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256E6D4D0);
  }
  return result;
}

uint64_t sub_23F357ABC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23F34F120(a1, a2);
  return a1;
}

uint64_t sub_23F357AD0()
{
  sub_23F350490();
  sub_23F357B50();
  return swift_deallocObject();
}

uint64_t sub_23F357AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23F357AF8()
{
  return swift_release();
}

void sub_23F357B00(void *a1)
{
  uint64_t v1;

  sub_23F3561C0(a1, v1);
}

uint64_t sub_23F357B10()
{
  return sub_23F358000();
}

uint64_t sub_23F357B28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_23F34D6BC(a3);
}

uint64_t sub_23F357B50()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F357B78()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23F357B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23F357868(a1, a2, 1, v2);
}

uint64_t sub_23F357B98@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void *sub_23F357BA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

uint64_t sub_23F357BB0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23F357BBC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23F357BC8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23F357BD4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23F357BE0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23F357BEC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23F357BF8()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_23F357C04()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23F357C10()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23F357C1C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23F357C28()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23F357C34()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_23F357C40()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23F357C4C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23F357C58()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23F357C64()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23F357C70()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23F357C7C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23F357C88()
{
  return MEMORY[0x24BE5BFA8]();
}

uint64_t sub_23F357C94()
{
  return MEMORY[0x24BE5BFB0]();
}

uint64_t sub_23F357CA0()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_23F357CAC()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_23F357CB8()
{
  return MEMORY[0x24BE5C198]();
}

uint64_t sub_23F357CC4()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_23F357CD0()
{
  return MEMORY[0x24BE5C1E0]();
}

uint64_t sub_23F357CDC()
{
  return MEMORY[0x24BE57EF8]();
}

uint64_t sub_23F357CE8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23F357CF4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23F357D00()
{
  return MEMORY[0x24BE54AD0]();
}

uint64_t sub_23F357D0C()
{
  return MEMORY[0x24BE54AD8]();
}

uint64_t sub_23F357D18()
{
  return MEMORY[0x24BE54AE8]();
}

uint64_t sub_23F357D24()
{
  return MEMORY[0x24BE55AE0]();
}

uint64_t sub_23F357D30()
{
  return MEMORY[0x24BE55AF0]();
}

uint64_t sub_23F357D3C()
{
  return MEMORY[0x24BE55AF8]();
}

uint64_t sub_23F357D48()
{
  return MEMORY[0x24BE55B10]();
}

uint64_t sub_23F357D54()
{
  return MEMORY[0x24BE56060]();
}

uint64_t sub_23F357D60()
{
  return MEMORY[0x24BE56068]();
}

uint64_t sub_23F357D6C()
{
  return MEMORY[0x24BE56080]();
}

uint64_t sub_23F357D78()
{
  return MEMORY[0x24BE56088]();
}

uint64_t sub_23F357D84()
{
  return MEMORY[0x24BE56150]();
}

uint64_t sub_23F357D90()
{
  return MEMORY[0x24BE56158]();
}

uint64_t sub_23F357D9C()
{
  return MEMORY[0x24BE56168]();
}

uint64_t sub_23F357DA8()
{
  return MEMORY[0x24BE56178]();
}

uint64_t sub_23F357DB4()
{
  return MEMORY[0x24BE56180]();
}

uint64_t sub_23F357DC0()
{
  return MEMORY[0x24BE56190]();
}

uint64_t sub_23F357DCC()
{
  return MEMORY[0x24BE561A0]();
}

uint64_t sub_23F357DD8()
{
  return MEMORY[0x24BE56218]();
}

uint64_t sub_23F357DE4()
{
  return MEMORY[0x24BE56220]();
}

uint64_t sub_23F357DF0()
{
  return MEMORY[0x24BE56230]();
}

uint64_t sub_23F357DFC()
{
  return MEMORY[0x24BE56238]();
}

uint64_t sub_23F357E08()
{
  return MEMORY[0x24BE56248]();
}

uint64_t sub_23F357E14()
{
  return MEMORY[0x24BE56280]();
}

uint64_t sub_23F357E20()
{
  return MEMORY[0x24BE56318]();
}

uint64_t sub_23F357E2C()
{
  return MEMORY[0x24BE56350]();
}

uint64_t sub_23F357E38()
{
  return MEMORY[0x24BE56358]();
}

uint64_t sub_23F357E44()
{
  return MEMORY[0x24BE56398]();
}

uint64_t sub_23F357E50()
{
  return MEMORY[0x24BE563A0]();
}

uint64_t sub_23F357E5C()
{
  return MEMORY[0x24BE563B0]();
}

uint64_t sub_23F357E68()
{
  return MEMORY[0x24BE563B8]();
}

uint64_t sub_23F357E74()
{
  return MEMORY[0x24BE563C8]();
}

uint64_t sub_23F357E80()
{
  return MEMORY[0x24BE563D8]();
}

uint64_t sub_23F357E8C()
{
  return MEMORY[0x24BE563E8]();
}

uint64_t sub_23F357E98()
{
  return MEMORY[0x24BE56418]();
}

uint64_t sub_23F357EA4()
{
  return MEMORY[0x24BE56510]();
}

uint64_t sub_23F357EB0()
{
  return MEMORY[0x24BE56588]();
}

uint64_t sub_23F357EBC()
{
  return MEMORY[0x24BE56590]();
}

uint64_t sub_23F357EC8()
{
  return MEMORY[0x24BE56598]();
}

uint64_t sub_23F357ED4()
{
  return MEMORY[0x24BE565F0]();
}

uint64_t sub_23F357EE0()
{
  return MEMORY[0x24BE56610]();
}

uint64_t sub_23F357EEC()
{
  return MEMORY[0x24BE56618]();
}

uint64_t sub_23F357EF8()
{
  return MEMORY[0x24BEB96E0]();
}

uint64_t sub_23F357F04()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23F357F10()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23F357F1C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23F357F28()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23F357F34()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23F357F40()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23F357F4C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23F357F58()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23F357F64()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23F357F70()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23F357F7C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23F357F88()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23F357F94()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23F357FA0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23F357FAC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23F357FB8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23F357FC4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23F357FD0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23F357FDC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23F357FE8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23F357FF4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23F358000()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23F35800C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_23F358018()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23F358024()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_23F358030()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23F35803C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23F358048()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23F358054()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23F358060()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23F35806C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23F358078()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23F358084()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23F358090()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23F35809C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23F3580A8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23F3580B4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23F3580C0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23F3580CC()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x24BED84E8]();
}

uint64_t MobileGestalt_copy_marketingNameString_obj()
{
  return MEMORY[0x24BED8520]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

