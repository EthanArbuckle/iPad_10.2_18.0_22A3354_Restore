id _MCCLogSystem()
{
  if (_MCCLogSystem_onceToken[0] != -1)
    dispatch_once(_MCCLogSystem_onceToken, &__block_literal_global);
  return (id)_MCCLogSystem_log;
}

uint64_t BlackPearlLevels.init(modelMetadata:senderModelMetadata:tsModelMetadata:version:threshold:bloomFilterData:domainLookupFile:tsSubjectLookupFile:tsSenderLookupFile:catLookupFile:personalDomainLookupFile:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X3>, __int128 *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v36;

  v36 = *a5;
  v33 = a5[2];
  v34 = a5[1];
  v32 = a5[3];
  v18 = *((_QWORD *)a5 + 8);
  v19 = *((_QWORD *)a5 + 9);
  v20 = *((_QWORD *)a5 + 10);
  sub_240B2C85C(a1, a9, type metadata accessor for BlackPearlModel);
  v21 = (int *)type metadata accessor for BlackPearlLevels();
  sub_240B2C85C(a2, a9 + v21[5], type metadata accessor for BlackPearlModel);
  sub_240B2C85C(a3, a9 + v21[6], type metadata accessor for BlackPearlModel);
  v22 = (_OWORD *)(a9 + v21[7]);
  v23 = a4[9];
  v22[8] = a4[8];
  v22[9] = v23;
  v22[10] = a4[10];
  *(_OWORD *)((char *)v22 + 169) = *(_OWORD *)((char *)a4 + 169);
  v24 = a4[5];
  v22[4] = a4[4];
  v22[5] = v24;
  v25 = a4[7];
  v22[6] = a4[6];
  v22[7] = v25;
  v26 = a4[1];
  *v22 = *a4;
  v22[1] = v26;
  v27 = a4[3];
  v22[2] = a4[2];
  v22[3] = v27;
  v28 = a9 + v21[8];
  *(_OWORD *)v28 = v36;
  *(_OWORD *)(v28 + 16) = v34;
  *(_OWORD *)(v28 + 32) = v33;
  *(_OWORD *)(v28 + 48) = v32;
  *(_QWORD *)(v28 + 64) = v18;
  *(_QWORD *)(v28 + 72) = v19;
  *(_QWORD *)(v28 + 80) = v20;
  sub_240B2C85C(a6, a9 + v21[9], type metadata accessor for BloomFilterData);
  v29 = a9 + v21[10];
  v30 = sub_240B5FF14();
  *(_QWORD *)&v36 = *(_QWORD *)(*(_QWORD *)(v30 - 8) + 32);
  ((void (*)(uint64_t, uint64_t, uint64_t))v36)(v29, a7, v30);
  ((void (*)(uint64_t, uint64_t, uint64_t))v36)(a9 + v21[11], a8, v30);
  ((void (*)(uint64_t, uint64_t, uint64_t))v36)(a9 + v21[12], a10, v30);
  ((void (*)(uint64_t, uint64_t, uint64_t))v36)(a9 + v21[13], a11, v30);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v36)(a9 + v21[14], a12, v30);
}

uint64_t type metadata accessor for BlackPearlLevels()
{
  uint64_t result;

  result = qword_25435F058;
  if (!qword_25435F058)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240B2C85C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void __swiftcall BlackPearlLevels.getThreshold()(MCCKitCategorization::BlackPearlThreshold *__return_ptr retstr)
{
  uint64_t v1;
  uint64_t v3;
  Swift::Double v4;
  __int128 v5;
  __int128 v6;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 32);
  v4 = *(double *)(v3 + 64);
  v5 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)&retstr->thresholdCommerce = *(_OWORD *)v3;
  *(_OWORD *)&retstr->thresholdEmployee = v5;
  v6 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)&retstr->thresholdP2C = *(_OWORD *)(v3 + 32);
  *(_OWORD *)&retstr->thresholdTS = v6;
  retstr->thresholdCorpEmployee = v4;
  *(_OWORD *)&retstr->tsSenderMaxTokens = *(_OWORD *)(v3 + 72);
}

uint64_t BlackPearlLevels.getmodelMetadata()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_240B2CB18(v1, a1, type metadata accessor for BlackPearlModel);
}

uint64_t BlackPearlLevels.getsenderModelMetadata()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for BlackPearlLevels();
  return sub_240B2CB18(v1 + *(int *)(v3 + 20), a1, type metadata accessor for BlackPearlModel);
}

uint64_t BlackPearlLevels.gettsModelMetadata()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for BlackPearlLevels();
  return sub_240B2CB18(v1 + *(int *)(v3 + 24), a1, type metadata accessor for BlackPearlModel);
}

void __swiftcall BlackPearlLevels.getVersion()(MCCKitCategorization::BlackPearlVersion *__return_ptr retstr)
{
  uint64_t v1;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  Swift::String_optional v6;
  __int128 v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String_optional v10;
  __int128 v11;
  Swift::String_optional v12;
  Swift::String v13;
  __int128 v14;
  Swift::String v15;
  __int128 v16;
  Swift::String v17;
  _OWORD v18[2];
  Swift::String v19;
  __int128 v20;
  Swift::String v21;
  __int128 v22;
  Swift::String_optional v23;
  __int128 v24;
  Swift::String_optional v25;
  __int128 v26;
  _OWORD v27[2];

  v3 = (_OWORD *)(v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  v4 = v3[9];
  v5 = v3[7];
  v25 = (Swift::String_optional)v3[8];
  v26 = v4;
  v6 = (Swift::String_optional)v3[9];
  v27[0] = v3[10];
  *(_OWORD *)((char *)v27 + 9) = *(_OWORD *)((char *)v3 + 169);
  v7 = v3[5];
  v9 = (Swift::String)v3[3];
  v21 = (Swift::String)v3[4];
  v8 = v21;
  v22 = v7;
  v10 = (Swift::String_optional)v3[5];
  v11 = v3[7];
  v23 = (Swift::String_optional)v3[6];
  v12 = v23;
  v24 = v11;
  v13 = (Swift::String)v3[1];
  v14 = v3[3];
  v19 = (Swift::String)v3[2];
  v15 = v19;
  v20 = v14;
  v16 = v3[1];
  v18[0] = *v3;
  v17 = (Swift::String)v18[0];
  v18[1] = v16;
  retstr->blackPearlRolloutFactorPackId = v25;
  retstr->blackPearlRolloutId = v6;
  *(_OWORD *)&retstr->blackPearlCategorizationVersion.value.major = v3[10];
  *(_OWORD *)((char *)&retstr->blackPearlCategorizationVersion.value.minor + 1) = *(_OWORD *)((char *)v3 + 169);
  retstr->blackPearlBreakthroughVersion = v8;
  retstr->blackPearlExperimentId = v10;
  retstr->blackPearlExperimentTreatmentId = v12;
  *(_OWORD *)&retstr->blackPearlExperimentDeploymentId = v5;
  retstr->blackPearlModelVersion = v17;
  retstr->blackPearlSenderModelVersion = v13;
  retstr->blackPearlTSModelVersion = v15;
  retstr->blackPearlFinalRuleVersion = v9;
  sub_240B2CA34((uint64_t)v18);
}

uint64_t sub_240B2CA34(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t BlackPearlLevels.getbloomFilterData()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for BlackPearlLevels();
  return sub_240B2CB18(v1 + *(int *)(v3 + 36), a1, type metadata accessor for BloomFilterData);
}

uint64_t sub_240B2CB18(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t BlackPearlLevels.getdomainLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 40);
  v4 = sub_240B5FF14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t BlackPearlLevels.gettsSubjectLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 44);
  v4 = sub_240B5FF14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t BlackPearlLevels.gettsSenderLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 48);
  v4 = sub_240B5FF14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t BlackPearlLevels.getcatLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 52);
  v4 = sub_240B5FF14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t BlackPearlLevels.getPersonalDomainLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 56);
  v4 = sub_240B5FF14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t dispatch thunk of static ModelProtocol.assetDir.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static ModelProtocol.modelPackageFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static ModelProtocol.modelSenderPackageFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static ModelProtocol.modelVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static ModelProtocol.senderVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static ModelProtocol.tsVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static ModelProtocol.ruleVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of static ModelProtocol.breakthroughVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static ModelProtocol.commerceBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of static ModelProtocol.promotionsBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of static ModelProtocol.socialBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of static ModelProtocol.transactionBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of static ModelProtocol.newsBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of static ModelProtocol.othersBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of static ModelProtocol.nerBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of static ModelProtocol.domainLookupFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSubjectLookupFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSenderLookupFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdCommerceFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdEmployeeFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdPersonalFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdP2CFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdCorpEmployeeFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 184))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdSenderFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdTSFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdCategoryTSFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdEmployeeNewsFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 216))();
}

uint64_t dispatch thunk of static ModelProtocol.modelName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 224))();
}

uint64_t dispatch thunk of static ModelProtocol.senderModelName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of static ModelProtocol.modelTSPackageFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 240))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSenderMaxTokensFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 248))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSubjectMaxTokensFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of ModelProtocol.blackPearlLevels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 264))();
}

uint64_t dispatch thunk of ModelProtocol.blackPearlLevels.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 272))();
}

uint64_t dispatch thunk of ModelProtocol.blackPearlLevels.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 280))();
}

uint64_t dispatch thunk of ModelProtocol.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 288))();
}

uint64_t dispatch thunk of ModelProtocol.getBlackPearlLevels()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 296))();
}

uint64_t dispatch thunk of ModelProtocol.subscribe()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of ModelProtocol.needImmediateDownloadCheck()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 312))();
}

uint64_t dispatch thunk of ModelProtocol.runImmediateDownloadAsync(retries:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 320))();
}

uint64_t dispatch thunk of static ModelProtocol.compileModel(modelPath:modelName:modelVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 328))();
}

ValueMetadata *type metadata accessor for BlackPearlFactors()
{
  return &type metadata for BlackPearlFactors;
}

char *initializeBufferWithCopyOfBuffer for BlackPearlLevels(uint64_t *a1, uint64_t *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  char *v53;
  char *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  char *v59;
  char *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  int *v66;
  uint64_t v67;
  uint64_t v69;
  int *v70;
  void (*v71)(char *, char *, uint64_t);

  v4 = (char *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v67 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (char *)(v67 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = (int *)type metadata accessor for BlackPearlModel(0);
    v10 = v9[6];
    v11 = &v4[v10];
    v12 = (char *)a2 + v10;
    v13 = sub_240B5FF14();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v71 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v14(&v4[v9[7]], (char *)a2 + v9[7], v13);
    v15 = v9[8];
    v16 = *(void **)((char *)a2 + v15);
    *(_QWORD *)&v4[v15] = v16;
    v17 = a3[5];
    v70 = a3;
    v18 = &v4[v17];
    v19 = (char *)a2 + v17;
    v20 = *(uint64_t *)((char *)a2 + v17 + 8);
    *(_QWORD *)v18 = *(uint64_t *)((char *)a2 + v17);
    *((_QWORD *)v18 + 1) = v20;
    v21 = *(uint64_t *)((char *)a2 + v17 + 24);
    *((_QWORD *)v18 + 2) = *(uint64_t *)((char *)a2 + v17 + 16);
    *((_QWORD *)v18 + 3) = v21;
    v22 = v9[6];
    v23 = &v18[v22];
    v24 = &v19[v22];
    v25 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v71(v23, v24, v13);
    v71(&v18[v9[7]], &v19[v9[7]], v13);
    v26 = v9[8];
    v27 = *(void **)&v19[v26];
    *(_QWORD *)&v18[v26] = v27;
    v28 = v70[6];
    v29 = &v4[v28];
    v30 = (char *)a2 + v28;
    v31 = *(uint64_t *)((char *)a2 + v28 + 8);
    *(_QWORD *)v29 = *(uint64_t *)((char *)a2 + v28);
    *((_QWORD *)v29 + 1) = v31;
    v32 = *(uint64_t *)((char *)a2 + v28 + 24);
    *((_QWORD *)v29 + 2) = *(uint64_t *)((char *)a2 + v28 + 16);
    *((_QWORD *)v29 + 3) = v32;
    v33 = v9[6];
    v34 = &v29[v33];
    v35 = &v30[v33];
    v36 = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v69 = v13;
    v71(v34, v35, v13);
    v71(&v29[v9[7]], &v30[v9[7]], v13);
    v37 = v9[8];
    v38 = *(void **)&v30[v37];
    *(_QWORD *)&v29[v37] = v38;
    v39 = v70[7];
    v40 = v70[8];
    v41 = &v4[v39];
    v42 = (char *)a2 + v39;
    v43 = *((_QWORD *)v42 + 1);
    *(_QWORD *)v41 = *(_QWORD *)v42;
    *((_QWORD *)v41 + 1) = v43;
    v44 = *((_QWORD *)v42 + 3);
    *((_QWORD *)v41 + 2) = *((_QWORD *)v42 + 2);
    *((_QWORD *)v41 + 3) = v44;
    v45 = *((_QWORD *)v42 + 5);
    *((_QWORD *)v41 + 4) = *((_QWORD *)v42 + 4);
    *((_QWORD *)v41 + 5) = v45;
    v46 = *((_QWORD *)v42 + 7);
    *((_QWORD *)v41 + 6) = *((_QWORD *)v42 + 6);
    *((_QWORD *)v41 + 7) = v46;
    v47 = *((_QWORD *)v42 + 9);
    *((_QWORD *)v41 + 8) = *((_QWORD *)v42 + 8);
    *((_QWORD *)v41 + 9) = v47;
    v48 = *((_QWORD *)v42 + 11);
    *((_QWORD *)v41 + 10) = *((_QWORD *)v42 + 10);
    *((_QWORD *)v41 + 11) = v48;
    v49 = *((_QWORD *)v42 + 13);
    *((_QWORD *)v41 + 12) = *((_QWORD *)v42 + 12);
    *((_QWORD *)v41 + 13) = v49;
    *((_OWORD *)v41 + 7) = *((_OWORD *)v42 + 7);
    v50 = *((_QWORD *)v42 + 17);
    *((_QWORD *)v41 + 16) = *((_QWORD *)v42 + 16);
    *((_QWORD *)v41 + 17) = v50;
    v51 = *((_QWORD *)v42 + 19);
    *((_QWORD *)v41 + 18) = *((_QWORD *)v42 + 18);
    *((_QWORD *)v41 + 19) = v51;
    v52 = *((_OWORD *)v42 + 10);
    *(_OWORD *)(v41 + 169) = *(_OWORD *)(v42 + 169);
    *((_OWORD *)v41 + 10) = v52;
    v53 = &v4[v40];
    v54 = (char *)a2 + v40;
    v55 = *((_OWORD *)v54 + 3);
    *((_OWORD *)v53 + 2) = *((_OWORD *)v54 + 2);
    *((_OWORD *)v53 + 3) = v55;
    *((_OWORD *)v53 + 4) = *((_OWORD *)v54 + 4);
    *((_QWORD *)v53 + 10) = *((_QWORD *)v54 + 10);
    v56 = *(_OWORD *)v54;
    v57 = *((_OWORD *)v54 + 1);
    v58 = v70[9];
    v59 = &v4[v58];
    v60 = (char *)a2 + v58;
    *(_OWORD *)v53 = v56;
    *((_OWORD *)v53 + 1) = v57;
    v61 = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v71(v59, v60, v69);
    v62 = type metadata accessor for BloomFilterData(0);
    *(_QWORD *)&v59[*(int *)(v62 + 20)] = *(_QWORD *)&v60[*(int *)(v62 + 20)];
    v63 = *(int *)(v62 + 24);
    v64 = &v59[v63];
    v65 = &v60[v63];
    swift_bridgeObjectRetain();
    v71(v64, v65, v69);
    v66 = v70;
    v71(&v4[v70[10]], (char *)a2 + v70[10], v69);
    v71(&v4[v66[11]], (char *)a2 + v66[11], v69);
    v71(&v4[v66[12]], (char *)a2 + v66[12], v69);
    v71(&v4[v66[13]], (char *)a2 + v66[13], v69);
    v71(&v4[v66[14]], (char *)a2 + v66[14], v69);
  }
  return v4;
}

uint64_t destroy for BlackPearlLevels(uint64_t a1, int *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for BlackPearlModel(0);
  v5 = a1 + v4[6];
  v6 = sub_240B5FF14();
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v12(v5, v6);
  v12(a1 + v4[7], v6);

  v7 = a1 + a2[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12(v7 + v4[6], v6);
  v12(v7 + v4[7], v6);

  v8 = a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12(v8 + v4[6], v6);
  v12(v8 + v4[7], v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = a1 + a2[9];
  v12(v9, v6);
  v10 = type metadata accessor for BloomFilterData(0);
  swift_bridgeObjectRelease();
  v12(v9 + *(int *)(v10 + 24), v6);
  v12(a1 + a2[10], v6);
  v12(a1 + a2[11], v6);
  v12(a1 + a2[12], v6);
  v12(a1 + a2[13], v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v12)(a1 + a2[14], v6);
}

char *initializeWithCopy for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  char *v52;
  char *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  char *v58;
  char *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  int *v65;
  uint64_t v67;
  void (*v69)(char *, char *, uint64_t);

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  v8 = (int *)type metadata accessor for BlackPearlModel(0);
  v9 = v8[6];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_240B5FF14();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v69 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v13(&a1[v8[7]], &a2[v8[7]], v12);
  v14 = v8[8];
  v15 = *(void **)&a2[v14];
  *(_QWORD *)&a1[v14] = v15;
  v16 = a3[5];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = *(_QWORD *)&a2[v16 + 8];
  *(_QWORD *)v17 = *(_QWORD *)&a2[v16];
  *((_QWORD *)v17 + 1) = v19;
  v20 = *(_QWORD *)&a2[v16 + 24];
  *((_QWORD *)v17 + 2) = *(_QWORD *)&a2[v16 + 16];
  *((_QWORD *)v17 + 3) = v20;
  v21 = v8[6];
  v22 = &v17[v21];
  v23 = &v18[v21];
  v24 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v69(v22, v23, v12);
  v69(&v17[v8[7]], &v18[v8[7]], v12);
  v25 = v8[8];
  v26 = *(void **)&v18[v25];
  *(_QWORD *)&v17[v25] = v26;
  v27 = a3[6];
  v28 = &a1[v27];
  v29 = &a2[v27];
  v30 = *(_QWORD *)&a2[v27 + 8];
  *(_QWORD *)v28 = *(_QWORD *)&a2[v27];
  *((_QWORD *)v28 + 1) = v30;
  v31 = *(_QWORD *)&a2[v27 + 24];
  *((_QWORD *)v28 + 2) = *(_QWORD *)&a2[v27 + 16];
  *((_QWORD *)v28 + 3) = v31;
  v32 = v8[6];
  v33 = &v28[v32];
  v34 = &v29[v32];
  v35 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v67 = v12;
  v69(v33, v34, v12);
  v69(&v28[v8[7]], &v29[v8[7]], v12);
  v36 = v8[8];
  v37 = *(void **)&v29[v36];
  *(_QWORD *)&v28[v36] = v37;
  v38 = a3[7];
  v39 = a3[8];
  v40 = &a1[v38];
  v41 = &a2[v38];
  v42 = *((_QWORD *)v41 + 1);
  *(_QWORD *)v40 = *(_QWORD *)v41;
  *((_QWORD *)v40 + 1) = v42;
  v43 = *((_QWORD *)v41 + 3);
  *((_QWORD *)v40 + 2) = *((_QWORD *)v41 + 2);
  *((_QWORD *)v40 + 3) = v43;
  v44 = *((_QWORD *)v41 + 5);
  *((_QWORD *)v40 + 4) = *((_QWORD *)v41 + 4);
  *((_QWORD *)v40 + 5) = v44;
  v45 = *((_QWORD *)v41 + 7);
  *((_QWORD *)v40 + 6) = *((_QWORD *)v41 + 6);
  *((_QWORD *)v40 + 7) = v45;
  v46 = *((_QWORD *)v41 + 9);
  *((_QWORD *)v40 + 8) = *((_QWORD *)v41 + 8);
  *((_QWORD *)v40 + 9) = v46;
  v47 = *((_QWORD *)v41 + 11);
  *((_QWORD *)v40 + 10) = *((_QWORD *)v41 + 10);
  *((_QWORD *)v40 + 11) = v47;
  v48 = *((_QWORD *)v41 + 13);
  *((_QWORD *)v40 + 12) = *((_QWORD *)v41 + 12);
  *((_QWORD *)v40 + 13) = v48;
  *((_OWORD *)v40 + 7) = *((_OWORD *)v41 + 7);
  v49 = *((_QWORD *)v41 + 17);
  *((_QWORD *)v40 + 16) = *((_QWORD *)v41 + 16);
  *((_QWORD *)v40 + 17) = v49;
  v50 = *((_QWORD *)v41 + 19);
  *((_QWORD *)v40 + 18) = *((_QWORD *)v41 + 18);
  *((_QWORD *)v40 + 19) = v50;
  v51 = *((_OWORD *)v41 + 10);
  *(_OWORD *)(v40 + 169) = *(_OWORD *)(v41 + 169);
  *((_OWORD *)v40 + 10) = v51;
  v52 = &a1[v39];
  v53 = &a2[v39];
  v54 = *((_OWORD *)v53 + 3);
  *((_OWORD *)v52 + 2) = *((_OWORD *)v53 + 2);
  *((_OWORD *)v52 + 3) = v54;
  *((_OWORD *)v52 + 4) = *((_OWORD *)v53 + 4);
  *((_QWORD *)v52 + 10) = *((_QWORD *)v53 + 10);
  v55 = *(_OWORD *)v53;
  v56 = *((_OWORD *)v53 + 1);
  v57 = a3[9];
  v58 = &a1[v57];
  v59 = &a2[v57];
  *(_OWORD *)v52 = v55;
  *((_OWORD *)v52 + 1) = v56;
  v60 = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v69(v58, v59, v67);
  v61 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v58[*(int *)(v61 + 20)] = *(_QWORD *)&v59[*(int *)(v61 + 20)];
  v62 = *(int *)(v61 + 24);
  v63 = &v58[v62];
  v64 = &v59[v62];
  swift_bridgeObjectRetain();
  v69(v63, v64, v67);
  v65 = a3;
  v69(&a1[a3[10]], &a2[a3[10]], v67);
  v69(&a1[v65[11]], &a2[v65[11]], v67);
  v69(&a1[v65[12]], &a2[v65[12]], v67);
  v69(&a1[v65[13]], &a2[v65[13]], v67);
  v69(&a1[v65[14]], &a2[v65[14]], v67);
  return a1;
}

char *assignWithCopy for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  char *v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (int *)type metadata accessor for BlackPearlModel(0);
  v7 = v6[6];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_240B5FF14();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(&a1[v6[7]], &a2[v6[7]], v10);
  v12 = v6[8];
  v13 = *(void **)&a1[v12];
  v14 = *(void **)&a2[v12];
  *(_QWORD *)&a1[v12] = v14;
  v15 = v14;

  v16 = a3[5];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)&a2[v16];
  *((_QWORD *)v17 + 1) = *(_QWORD *)&a2[v16 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  *((_QWORD *)v17 + 3) = *((_QWORD *)v18 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11(&v17[v6[6]], &v18[v6[6]], v10);
  v11(&v17[v6[7]], &v18[v6[7]], v10);
  v19 = v6[8];
  v20 = *(void **)&v17[v19];
  v21 = *(void **)&v18[v19];
  *(_QWORD *)&v17[v19] = v21;
  v22 = v21;

  v23 = a3[6];
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)v24 = *(_QWORD *)&a2[v23];
  *((_QWORD *)v24 + 1) = *(_QWORD *)&a2[v23 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v24 + 2) = *((_QWORD *)v25 + 2);
  *((_QWORD *)v24 + 3) = *((_QWORD *)v25 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11(&v24[v6[6]], &v25[v6[6]], v10);
  v11(&v24[v6[7]], &v25[v6[7]], v10);
  v26 = v6[8];
  v27 = *(void **)&v24[v26];
  v28 = *(void **)&v25[v26];
  *(_QWORD *)&v24[v26] = v28;
  v29 = v28;

  v30 = a3[7];
  v31 = &a1[v30];
  v32 = &a2[v30];
  *(_QWORD *)v31 = *(_QWORD *)&a2[v30];
  *((_QWORD *)v31 + 1) = *(_QWORD *)&a2[v30 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 2) = *((_QWORD *)v32 + 2);
  *((_QWORD *)v31 + 3) = *((_QWORD *)v32 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 4) = *((_QWORD *)v32 + 4);
  *((_QWORD *)v31 + 5) = *((_QWORD *)v32 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 6) = *((_QWORD *)v32 + 6);
  *((_QWORD *)v31 + 7) = *((_QWORD *)v32 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 8) = *((_QWORD *)v32 + 8);
  *((_QWORD *)v31 + 9) = *((_QWORD *)v32 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 10) = *((_QWORD *)v32 + 10);
  *((_QWORD *)v31 + 11) = *((_QWORD *)v32 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 12) = *((_QWORD *)v32 + 12);
  *((_QWORD *)v31 + 13) = *((_QWORD *)v32 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 14) = *((_QWORD *)v32 + 14);
  *((_QWORD *)v31 + 15) = *((_QWORD *)v32 + 15);
  *((_QWORD *)v31 + 16) = *((_QWORD *)v32 + 16);
  *((_QWORD *)v31 + 17) = *((_QWORD *)v32 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v31 + 18) = *((_QWORD *)v32 + 18);
  *((_QWORD *)v31 + 19) = *((_QWORD *)v32 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33 = *((_OWORD *)v32 + 10);
  *(_OWORD *)(v31 + 169) = *(_OWORD *)(v32 + 169);
  *((_OWORD *)v31 + 10) = v33;
  v34 = a3[8];
  v35 = &a1[v34];
  v36 = &a2[v34];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
  *((_QWORD *)v35 + 2) = *((_QWORD *)v36 + 2);
  *((_QWORD *)v35 + 3) = *((_QWORD *)v36 + 3);
  *((_QWORD *)v35 + 4) = *((_QWORD *)v36 + 4);
  *((_QWORD *)v35 + 5) = *((_QWORD *)v36 + 5);
  *((_QWORD *)v35 + 6) = *((_QWORD *)v36 + 6);
  *((_QWORD *)v35 + 7) = *((_QWORD *)v36 + 7);
  *((_QWORD *)v35 + 8) = *((_QWORD *)v36 + 8);
  *((_QWORD *)v35 + 9) = *((_QWORD *)v36 + 9);
  *((_QWORD *)v35 + 10) = *((_QWORD *)v36 + 10);
  v37 = a3[9];
  v38 = &a1[v37];
  v39 = &a2[v37];
  v11(&a1[v37], &a2[v37], v10);
  v40 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v38[*(int *)(v40 + 20)] = *(_QWORD *)&v39[*(int *)(v40 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11(&v38[*(int *)(v40 + 24)], &v39[*(int *)(v40 + 24)], v10);
  v11(&a1[a3[10]], &a2[a3[10]], v10);
  v11(&a1[a3[11]], &a2[a3[11]], v10);
  v11(&a1[a3[12]], &a2[a3[12]], v10);
  v11(&a1[a3[13]], &a2[a3[13]], v10);
  v11(&a1[a3[14]], &a2[a3[14]], v10);
  return a1;
}

char *initializeWithTake for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char *v31;
  char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  v7 = (int *)type metadata accessor for BlackPearlModel(0);
  v8 = v7[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_240B5FF14();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(&a1[v7[7]], &a2[v7[7]], v11);
  *(_QWORD *)&a1[v7[8]] = *(_QWORD *)&a2[v7[8]];
  v13 = a3[5];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(_OWORD *)&a2[v13 + 16];
  *(_OWORD *)v14 = *(_OWORD *)&a2[v13];
  *((_OWORD *)v14 + 1) = v16;
  v12(&a1[v13 + v7[6]], &a2[v13 + v7[6]], v11);
  v12(&v14[v7[7]], &v15[v7[7]], v11);
  *(_QWORD *)&v14[v7[8]] = *(_QWORD *)&v15[v7[8]];
  v17 = a3[6];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *(_OWORD *)&a2[v17 + 16];
  *(_OWORD *)v18 = *(_OWORD *)&a2[v17];
  *((_OWORD *)v18 + 1) = v20;
  v12(&a1[v17 + v7[6]], &a2[v17 + v7[6]], v11);
  v12(&v18[v7[7]], &v19[v7[7]], v11);
  *(_QWORD *)&v18[v7[8]] = *(_QWORD *)&v19[v7[8]];
  v21 = a3[7];
  v22 = a3[8];
  v23 = &a1[v21];
  v24 = &a2[v21];
  v25 = *((_OWORD *)v24 + 1);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v25;
  v26 = *((_OWORD *)v24 + 3);
  *((_OWORD *)v23 + 2) = *((_OWORD *)v24 + 2);
  *((_OWORD *)v23 + 3) = v26;
  v27 = *((_OWORD *)v24 + 7);
  *((_OWORD *)v23 + 6) = *((_OWORD *)v24 + 6);
  *((_OWORD *)v23 + 7) = v27;
  v28 = *((_OWORD *)v24 + 5);
  *((_OWORD *)v23 + 4) = *((_OWORD *)v24 + 4);
  *((_OWORD *)v23 + 5) = v28;
  *(_OWORD *)(v23 + 169) = *(_OWORD *)(v24 + 169);
  v29 = *((_OWORD *)v24 + 10);
  v30 = *((_OWORD *)v24 + 8);
  *((_OWORD *)v23 + 9) = *((_OWORD *)v24 + 9);
  *((_OWORD *)v23 + 10) = v29;
  *((_OWORD *)v23 + 8) = v30;
  v31 = &a1[v22];
  v32 = &a2[v22];
  v33 = *((_OWORD *)v32 + 1);
  *(_OWORD *)v31 = *(_OWORD *)v32;
  *((_OWORD *)v31 + 1) = v33;
  *((_QWORD *)v31 + 10) = *((_QWORD *)v32 + 10);
  v34 = *((_OWORD *)v32 + 4);
  v36 = *((_OWORD *)v32 + 2);
  v35 = *((_OWORD *)v32 + 3);
  v37 = a3[9];
  v38 = &a1[v37];
  v39 = &a2[v37];
  *((_OWORD *)v31 + 3) = v35;
  *((_OWORD *)v31 + 4) = v34;
  *((_OWORD *)v31 + 2) = v36;
  v12(&a1[v37], &a2[v37], v11);
  v40 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v38[*(int *)(v40 + 20)] = *(_QWORD *)&v39[*(int *)(v40 + 20)];
  v12(&v38[*(int *)(v40 + 24)], &v39[*(int *)(v40 + 24)], v11);
  v12(&a1[a3[10]], &a2[a3[10]], v11);
  v12(&a1[a3[11]], &a2[a3[11]], v11);
  v12(&a1[a3[12]], &a2[a3[12]], v11);
  v12(&a1[a3[13]], &a2[a3[13]], v11);
  v12(&a1[a3[14]], &a2[a3[14]], v11);
  return a1;
}

char *assignWithTake for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  char *v32;
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
  char *v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  char *v48;
  char *v49;
  uint64_t v50;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = (int *)type metadata accessor for BlackPearlModel(0);
  v9 = v8[6];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_240B5FF14();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  v13(&a1[v8[7]], &a2[v8[7]], v12);
  v14 = v8[8];
  v15 = *(void **)&a1[v14];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];

  v16 = a3[5];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = *(_QWORD *)&a2[v16 + 8];
  *(_QWORD *)v17 = *(_QWORD *)&a2[v16];
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v20 = *((_QWORD *)v18 + 3);
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  *((_QWORD *)v17 + 3) = v20;
  swift_bridgeObjectRelease();
  v13(&v17[v8[6]], &v18[v8[6]], v12);
  v13(&v17[v8[7]], &v18[v8[7]], v12);
  v21 = v8[8];
  v22 = *(void **)&v17[v21];
  *(_QWORD *)&v17[v21] = *(_QWORD *)&v18[v21];

  v23 = a3[6];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = *(_QWORD *)&a2[v23 + 8];
  *(_QWORD *)v24 = *(_QWORD *)&a2[v23];
  *((_QWORD *)v24 + 1) = v26;
  swift_bridgeObjectRelease();
  v27 = *((_QWORD *)v25 + 3);
  *((_QWORD *)v24 + 2) = *((_QWORD *)v25 + 2);
  *((_QWORD *)v24 + 3) = v27;
  swift_bridgeObjectRelease();
  v13(&v24[v8[6]], &v25[v8[6]], v12);
  v13(&v24[v8[7]], &v25[v8[7]], v12);
  v28 = v8[8];
  v29 = *(void **)&v24[v28];
  *(_QWORD *)&v24[v28] = *(_QWORD *)&v25[v28];

  v30 = a3[7];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = *(_QWORD *)&a2[v30 + 8];
  *(_QWORD *)v31 = *(_QWORD *)&a2[v30];
  *((_QWORD *)v31 + 1) = v33;
  swift_bridgeObjectRelease();
  v34 = *((_QWORD *)v32 + 3);
  *((_QWORD *)v31 + 2) = *((_QWORD *)v32 + 2);
  *((_QWORD *)v31 + 3) = v34;
  swift_bridgeObjectRelease();
  v35 = *((_QWORD *)v32 + 5);
  *((_QWORD *)v31 + 4) = *((_QWORD *)v32 + 4);
  *((_QWORD *)v31 + 5) = v35;
  swift_bridgeObjectRelease();
  v36 = *((_QWORD *)v32 + 7);
  *((_QWORD *)v31 + 6) = *((_QWORD *)v32 + 6);
  *((_QWORD *)v31 + 7) = v36;
  swift_bridgeObjectRelease();
  v37 = *((_QWORD *)v32 + 9);
  *((_QWORD *)v31 + 8) = *((_QWORD *)v32 + 8);
  *((_QWORD *)v31 + 9) = v37;
  swift_bridgeObjectRelease();
  v38 = *((_QWORD *)v32 + 11);
  *((_QWORD *)v31 + 10) = *((_QWORD *)v32 + 10);
  *((_QWORD *)v31 + 11) = v38;
  swift_bridgeObjectRelease();
  v39 = *((_QWORD *)v32 + 13);
  *((_QWORD *)v31 + 12) = *((_QWORD *)v32 + 12);
  *((_QWORD *)v31 + 13) = v39;
  swift_bridgeObjectRelease();
  *((_OWORD *)v31 + 7) = *((_OWORD *)v32 + 7);
  v40 = *((_QWORD *)v32 + 17);
  *((_QWORD *)v31 + 16) = *((_QWORD *)v32 + 16);
  *((_QWORD *)v31 + 17) = v40;
  swift_bridgeObjectRelease();
  v41 = *((_QWORD *)v32 + 19);
  *((_QWORD *)v31 + 18) = *((_QWORD *)v32 + 18);
  *((_QWORD *)v31 + 19) = v41;
  swift_bridgeObjectRelease();
  *((_OWORD *)v31 + 10) = *((_OWORD *)v32 + 10);
  *(_OWORD *)(v31 + 169) = *(_OWORD *)(v32 + 169);
  v42 = a3[8];
  v43 = a3[9];
  v44 = &a1[v42];
  v45 = &a2[v42];
  v46 = *((_OWORD *)v45 + 1);
  *(_OWORD *)v44 = *(_OWORD *)v45;
  *((_OWORD *)v44 + 1) = v46;
  v47 = *((_OWORD *)v45 + 3);
  *((_OWORD *)v44 + 2) = *((_OWORD *)v45 + 2);
  *((_OWORD *)v44 + 3) = v47;
  *((_QWORD *)v44 + 8) = *((_QWORD *)v45 + 8);
  *(_OWORD *)(v44 + 72) = *(_OWORD *)(v45 + 72);
  v48 = &a1[v43];
  v49 = &a2[v43];
  v13(&a1[v43], &a2[v43], v12);
  v50 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v48[*(int *)(v50 + 20)] = *(_QWORD *)&v49[*(int *)(v50 + 20)];
  swift_bridgeObjectRelease();
  v13(&v48[*(int *)(v50 + 24)], &v49[*(int *)(v50 + 24)], v12);
  v13(&a1[a3[10]], &a2[a3[10]], v12);
  v13(&a1[a3[11]], &a2[a3[11]], v12);
  v13(&a1[a3[12]], &a2[a3[12]], v12);
  v13(&a1[a3[13]], &a2[a3[13]], v12);
  v13(&a1[a3[14]], &a2[a3[14]], v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlLevels()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B2E14C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for BlackPearlModel(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v13 = type metadata accessor for BloomFilterData(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v15 = a3[9];
    }
    else
    {
      v8 = sub_240B5FF14();
      v14 = *(_QWORD *)(v8 - 8);
      v15 = a3[10];
    }
    v10 = a1 + v15;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[7] + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for BlackPearlLevels()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B2E228(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = type metadata accessor for BlackPearlModel(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[7] + 8) = (a2 - 1);
      return result;
    }
    v13 = type metadata accessor for BloomFilterData(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[9];
    }
    else
    {
      v10 = sub_240B5FF14();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[10];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_240B2E2F4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for BlackPearlModel(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for BloomFilterData(319);
    if (v2 <= 0x3F)
    {
      result = sub_240B5FF14();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_240B2E3B4(uint64_t a1, uint64_t a2)
{
  return sub_240B2E4FC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_240B2E3C0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_240B600DC();
  *a2 = 0;
  return result;
}

uint64_t sub_240B2E434(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_240B600E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_240B2E4B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_240B600F4();
  v2 = sub_240B600D0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_240B2E4F0(uint64_t a1, uint64_t a2)
{
  return sub_240B2E4FC(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_240B2E4FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_240B600F4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_240B2E538()
{
  sub_240B600F4();
  sub_240B60148();
  return swift_bridgeObjectRelease();
}

uint64_t sub_240B2E578()
{
  uint64_t v0;

  sub_240B600F4();
  sub_240B60628();
  sub_240B60148();
  v0 = sub_240B60640();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_240B2E5EC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_240B2E5F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_240B600F4();
  v2 = v1;
  if (v0 == sub_240B600F4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_240B605A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *sub_240B2E67C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_240B2E688@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_240B600D0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_240B2E6CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_240B600F4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for URLResourceKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25435F0C0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25435F0C0);
  }
}

uint64_t sub_240B2E748()
{
  sub_240B2E820(&qword_257088728, (uint64_t)&unk_240B60D08);
  sub_240B2E820(&qword_257088730, (uint64_t)&unk_240B60CA8);
  return sub_240B604D8();
}

uint64_t sub_240B2E7B4()
{
  return sub_240B2E820(&qword_257088710, (uint64_t)&unk_240B60C6C);
}

uint64_t sub_240B2E7D8()
{
  return sub_240B2E820(&qword_257088718, (uint64_t)&unk_240B60C40);
}

uint64_t sub_240B2E7FC()
{
  return sub_240B2E820(&qword_257088720, (uint64_t)&unk_240B60CDC);
}

uint64_t sub_240B2E820(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey();
    result = MEMORY[0x24268A8B8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_240B2E864()
{
  uint64_t v0;
  char *v1;
  uint64_t inited;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25435EFF8);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435F108);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_240B60DA0;
  v3 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC60];
  v4 = v3;
  sub_240B33EE4(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey();
  swift_arrayDestroy();
  sub_240B5FE84();
  swift_bridgeObjectRelease();
  v5 = sub_240B5FE30();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v1, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v1, 1, v5) == 1)
  {
    sub_240B34F40((uint64_t)v1, &qword_25435EFF8);
  }
  else
  {
    v8 = sub_240B5FE24();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v1, v5);
    if (v8 != 2)
      return v8 & 1;
  }
  return 0;
}

unint64_t static TrialLoader.assetDir.getter()
{
  return 0xD000000000000010;
}

unint64_t static TrialLoader.modelTSPackageFactor.getter()
{
  return 0xD000000000000018;
}

unint64_t static TrialLoader.modelVersionFactor.getter()
{
  return 0xD000000000000016;
}

unint64_t static TrialLoader.senderVersionFactor.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static TrialLoader.tsVersionFactor.getter()
{
  return 0xD000000000000018;
}

unint64_t static TrialLoader.modelPackageFactor.getter()
{
  return 0xD000000000000016;
}

unint64_t static TrialLoader.modelSenderPackageFactor.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static TrialLoader.ruleVersionFactor.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static TrialLoader.breakthroughVersionFactor.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t static TrialLoader.commerceBloomFilterFactor.getter()
{
  return 0xD000000000000013;
}

unint64_t static TrialLoader.promotionsBloomFilterFactor.getter()
{
  return 0xD000000000000015;
}

unint64_t static TrialLoader.socialBloomFilterFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.transactionBloomFilterFactor.getter()
{
  return 0xD000000000000017;
}

uint64_t static TrialLoader.newsBloomFilterFactor.getter()
{
  return 0x6F6F6C427377654ELL;
}

unint64_t static TrialLoader.othersBloomFilterFactor.getter()
{
  return 0xD000000000000011;
}

uint64_t static TrialLoader.nerBloomFilterFactor.getter()
{
  return 0x6D6F6F6C4252454ELL;
}

uint64_t static TrialLoader.domainLookupFactor.getter()
{
  return 0x6F4C6E69616D6F44;
}

uint64_t static TrialLoader.tsSubjectLookupFactor.getter()
{
  return 0x63656A6275535354;
}

uint64_t static TrialLoader.tsSenderLookupFactor.getter()
{
  return 0x7265646E65535354;
}

uint64_t static TrialLoader.catLookupFactor.getter()
{
  return 0x756B6F6F4C544143;
}

unint64_t static TrialLoader.thresholdCommerceFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.thresholdEmployeeFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.thresholdPersonalFactor.getter()
{
  return 0xD000000000000011;
}

uint64_t static TrialLoader.thresholdP2CFactor.getter()
{
  return 0x6C6F687365726854;
}

unint64_t static TrialLoader.thresholdCorpEmployeeFactor.getter()
{
  return 0xD000000000000015;
}

uint64_t static TrialLoader.thresholdSenderFactor.getter()
{
  return 0x6C6F687365726854;
}

uint64_t static TrialLoader.thresholdTSFactor.getter()
{
  return 0x6C6F687365726854;
}

unint64_t static TrialLoader.thresholdCategoryTSFactor.getter()
{
  return 0xD000000000000013;
}

uint64_t static TrialLoader.modelName.getter()
{
  return 0x6165506B63616C42;
}

unint64_t static TrialLoader.senderModelName.getter()
{
  return 0xD000000000000010;
}

uint64_t static TrialLoader.tsModelName.getter()
{
  return 0x6165506B63616C42;
}

unint64_t static TrialLoader.thresholdEmployeeNewsFactor.getter()
{
  return 0xD000000000000015;
}

unint64_t static TrialLoader.tsSenderMaxTokensFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.tsSubjectMaxTokensFactor.getter()
{
  return 0xD000000000000012;
}

unint64_t static TrialLoader.personalDomainLookupFactor.getter()
{
  return 0xD000000000000014;
}

unint64_t static TrialLoader.categorizationVersionFactor.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_240B2EE38(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  type metadata accessor for BlackPearlLevels();
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240B2EF30(a1, (uint64_t)v5);
  v6 = *a2 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_240B2EFCC((uint64_t)v5, v6);
  return swift_endAccess();
}

uint64_t sub_240B2EEE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  return sub_240B2EF30(v3, a1);
}

uint64_t sub_240B2EF30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_240B2EF74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_240B2EFCC(a1, v3);
  return swift_endAccess();
}

uint64_t sub_240B2EFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_240B2F010())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t TrialLoader.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  TrialLoader.init()();
  return v0;
}

uint64_t TrialLoader.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t result;
  _DWORD v18[4];
  unint64_t v19;
  unint64_t v20;

  v1 = type metadata accessor for BlackPearlTrialLevels();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (_QWORD *)((char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 312);
  *(_QWORD *)(v0 + 16) = v7;
  sub_240B598C4(v7, v3);
  sub_240B2EF30((uint64_t)v3 + *(int *)(v1 + 20), (uint64_t)v6);
  sub_240B33464((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for BlackPearlTrialLevels);
  sub_240B2F340((uint64_t)v6, v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels);
  v8 = *(id *)(v0 + 16);
  v9 = (void *)sub_240B600D0();
  v10 = (void *)sub_240B600D0();
  v11 = objc_msgSend(v8, sel_levelForFactor_withNamespaceName_, v9, v10);

  if (v11 && (v12 = objc_msgSend(v11, sel_stringValue), v11, v12))
  {
    v13 = sub_240B600F4();
    v15 = v14;

    v16 = (uint64_t *)(v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_forceDownloadOnLaunch);
    *v16 = v13;
    v16[1] = v15;
    return v0;
  }
  else
  {
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_240B6043C();
    swift_bridgeObjectRelease();
    v19 = 0xD000000000000024;
    v20 = 0x8000000240B62B40;
    v18[3] = 312;
    sub_240B60598();
    sub_240B60184();
    swift_bridgeObjectRelease();
    sub_240B60184();
    sub_240B60184();
    result = sub_240B60490();
    __break(1u);
  }
  return result;
}

uint64_t sub_240B2F340(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t TrialLoader.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  os_log_type_t v25;
  NSObject *log;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  v3 = type metadata accessor for BlackPearlModel(0);
  v4 = *(int *)(v3 + 32);
  v5 = *(void **)(v2 + v4);
  *(_QWORD *)(v2 + v4) = 0;

  v6 = type metadata accessor for BlackPearlLevels();
  v7 = v2 + *(int *)(v6 + 24);
  v8 = *(int *)(v3 + 32);
  v9 = *(void **)(v7 + v8);
  *(_QWORD *)(v7 + v8) = 0;

  v10 = v2 + *(int *)(v6 + 20);
  v11 = *(int *)(v3 + 32);
  v12 = *(void **)(v10 + v11);
  *(_QWORD *)(v10 + v11) = 0;

  if (qword_25435F0A8 != -1)
    swift_once();
  v13 = sub_240B60088();
  __swift_project_value_buffer(v13, (uint64_t)qword_25435F2B8);
  swift_retain_n();
  v14 = sub_240B60070();
  v15 = sub_240B60328();
  if (os_log_type_enabled(v14, v15))
  {
    v25 = v15;
    log = v14;
    v16 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412802;
    v18 = *(void **)(v2 + *(int *)(v3 + 32));
    if (v18)
      v19 = v18;
    sub_240B603AC();
    *v17 = v18;
    swift_release_n();
    *(_WORD *)(v16 + 12) = 2112;
    v20 = *(void **)(v2 + *(int *)(v6 + 20) + *(int *)(v3 + 32));
    if (v20)
      v21 = v20;
    sub_240B603AC();
    v17[1] = v20;
    swift_release_n();
    *(_WORD *)(v16 + 22) = 2112;
    v22 = *(void **)(v2 + *(int *)(v6 + 24) + *(int *)(v3 + 32));
    if (v22)
      v23 = v22;
    sub_240B603AC();
    v17[2] = v22;
    swift_release_n();
    _os_log_impl(&dword_240B2B000, log, v25, "Destroyed trial-loader model  %@, %@, %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v17, -1, -1);
    MEMORY[0x24268A954](v16, -1, -1);

  }
  else
  {

    swift_release_n();
  }

  sub_240B33464(v2, (uint64_t (*)(_QWORD))type metadata accessor for BlackPearlLevels);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t TrialLoader.__deallocating_deinit()
{
  TrialLoader.deinit();
  return swift_deallocClassInstance();
}

void sub_240B2F72C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v1 = v0;
  if (qword_25435F0A8 != -1)
    swift_once();
  v2 = sub_240B60088();
  __swift_project_value_buffer(v2, (uint64_t)qword_25435F2B8);
  v3 = sub_240B60070();
  v4 = sub_240B6031C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_240B2B000, v3, v4, "Subscribing to Trial updates", v5, 2u);
    MEMORY[0x24268A954](v5, -1, -1);
  }

  v6 = *(void **)(v1 + 16);
  v7 = (void *)sub_240B600D0();
  v10[4] = sub_240B334E0;
  v10[5] = v1;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_240B2FA88;
  v10[3] = &block_descriptor;
  v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  v9 = objc_msgSend(v6, sel_addUpdateHandlerForNamespaceName_usingBlock_, v7, v8);
  _Block_release(v8);
  swift_unknownObjectRelease();

}

uint64_t sub_240B2F8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;

  v3 = type metadata accessor for BlackPearlTrialLevels();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25435F0A8 != -1)
    swift_once();
  v9 = sub_240B60088();
  __swift_project_value_buffer(v9, (uint64_t)qword_25435F2B8);
  v10 = sub_240B60070();
  v11 = sub_240B6031C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_240B2B000, v10, v11, "Refreshing trial factors with new levels", v12, 2u);
    MEMORY[0x24268A954](v12, -1, -1);
  }

  v13 = *(void **)(a2 + 16);
  objc_msgSend(v13, sel_refresh);
  sub_240B598C4(v13, v5);
  sub_240B2EF30((uint64_t)v5 + *(int *)(v3 + 20), (uint64_t)v8);
  sub_240B33464((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for BlackPearlTrialLevels);
  v14 = a2 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_240B2EFCC((uint64_t)v8, v14);
  return swift_endAccess();
}

uint64_t sub_240B2FA88(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_240B2FAD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  os_log_type_t v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  id v45[4];

  v1 = v0;
  v45[3] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = type metadata accessor for BlackPearlTrialLevels();
  MEMORY[0x24BDAC7A8](v2);
  v43 = (uint64_t *)((char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25435F0A8 != -1)
    swift_once();
  v7 = sub_240B60088();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_25435F2B8);
  v9 = sub_240B60070();
  v10 = sub_240B6031C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (void *)swift_slowAlloc();
    v45[0] = v12;
    *(_DWORD *)v11 = 136315138;
    v44 = sub_240B335B4(0xD000000000000012, 0x8000000240B62740, (uint64_t *)v45);
    sub_240B603AC();
    _os_log_impl(&dword_240B2B000, v9, v10, "Initiating immediate model download for namespace %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v12, -1, -1);
    MEMORY[0x24268A954](v11, -1, -1);
  }

  sub_240B35010((uint64_t)&unk_251108970);
  swift_arrayDestroy();
  v13 = *(void **)(v1 + 16);
  v14 = (void *)sub_240B602C8();
  swift_bridgeObjectRelease();
  v45[0] = 0;
  v15 = objc_msgSend(v13, sel_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error_, v14, 1, v45);

  if ((_DWORD)v15)
  {
    v16 = v45[0];
    v42 = v8;
    v17 = sub_240B60070();
    v18 = sub_240B6031C();
    if (os_log_type_enabled(v17, v18))
    {
      v41 = v6;
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = (void *)swift_slowAlloc();
      v45[0] = v20;
      *(_DWORD *)v19 = 136315138;
      v44 = sub_240B335B4(0xD000000000000012, 0x8000000240B62740, (uint64_t *)v45);
      v6 = v41;
      sub_240B603AC();
      _os_log_impl(&dword_240B2B000, v17, v18, "Completed immediate model download for namespace %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268A954](v20, -1, -1);
      MEMORY[0x24268A954](v19, -1, -1);
    }

    objc_msgSend(v13, sel_refresh);
    v21 = v13;
    v22 = v43;
    sub_240B598C4(v21, v43);
    sub_240B2EF30((uint64_t)v22 + *(int *)(v2 + 20), (uint64_t)v6);
    sub_240B33464((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for BlackPearlTrialLevels);
    v23 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
    swift_beginAccess();
    sub_240B2EFCC((uint64_t)v6, v23);
    swift_endAccess();
    v24 = sub_240B60070();
    v25 = sub_240B6031C();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = (void *)swift_slowAlloc();
      v45[0] = v27;
      *(_DWORD *)v26 = 136315138;
      v44 = sub_240B335B4(0xD000000000000012, 0x8000000240B62740, (uint64_t *)v45);
      sub_240B603AC();
      _os_log_impl(&dword_240B2B000, v24, v25, "Refresh completed for namespace %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268A954](v27, -1, -1);
      MEMORY[0x24268A954](v26, -1, -1);
    }
    goto LABEL_13;
  }
  v28 = v45[0];
  v29 = (void *)sub_240B5FE3C();

  swift_willThrow();
  v30 = v29;
  v31 = v29;
  v24 = sub_240B60070();
  v32 = sub_240B60334();
  if (!os_log_type_enabled(v24, v32))
  {

LABEL_13:
    return v15;
  }
  v33 = swift_slowAlloc();
  v34 = (_QWORD *)swift_slowAlloc();
  v35 = (void *)swift_slowAlloc();
  v45[0] = v35;
  *(_DWORD *)v33 = 136315394;
  v44 = sub_240B335B4(0xD000000000000012, 0x8000000240B62740, (uint64_t *)v45);
  sub_240B603AC();
  *(_WORD *)(v33 + 12) = 2112;
  v36 = v29;
  v37 = v15;
  v38 = _swift_stdlib_bridgeErrorToNSError();
  v44 = v38;
  sub_240B603AC();
  *v34 = v38;
  v15 = v37;

  _os_log_impl(&dword_240B2B000, v24, v32, "Failed immediate model download for namespace %s error %@", (uint8_t *)v33, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
  swift_arrayDestroy();
  MEMORY[0x24268A954](v34, -1, -1);
  swift_arrayDestroy();
  MEMORY[0x24268A954](v35, -1, -1);
  MEMORY[0x24268A954](v33, -1, -1);

  return v15;
}

uint64_t sub_240B301D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;
  char v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;

  v1 = sub_240B5FF98();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  if (*(_QWORD *)(v5 + *(int *)(type metadata accessor for BlackPearlLevels() + 28) + 152))
    return 0;
  if (sub_240B60118() == 0x64656C62616E65 && v7 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = sub_240B605A4();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      if (sub_240B60118() == 0x65646F6D676E616CLL && v10 == 0xED0000796C6E6F6CLL)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v12 = sub_240B605A4();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
          return 0;
      }
      sub_240B5FF8C();
      v13 = sub_240B5FF80();
      v15 = v14;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v13 == 28261 && v15 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v17 = sub_240B605A4();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
          return 1;
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_240B30400(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  char v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint32_t v33;
  uint64_t v34;
  os_log_type_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  int v42;
  uint64_t v43;

  v3 = sub_240B5FF98();
  v39 = *(_QWORD *)(v3 - 8);
  v40 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v38 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = 0;
  if (a1 < 1)
  {
LABEL_24:
    sub_240B33500();
    swift_allocError();
    *v24 = 2;
    swift_willThrow();
  }
  else
  {
    v5 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
    swift_beginAccess();
    swift_beginAccess();
    v6 = type metadata accessor for BlackPearlLevels();
    v7 = v5 + 152;
    *(_QWORD *)&v8 = 134217984;
    v41 = v8;
    while (1)
    {
      if (*(_QWORD *)(v7 + *(int *)(v6 + 28)))
        goto LABEL_30;
      if (sub_240B60118() == 0x64656C62616E65 && v9 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v11 = sub_240B605A4();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0)
        {
          if (sub_240B60118() == 0x65646F6D676E616CLL && v12 == 0xED0000796C6E6F6CLL)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v13 = sub_240B605A4();
            swift_bridgeObjectRelease();
            if ((v13 & 1) == 0)
              goto LABEL_30;
          }
          v14 = v38;
          sub_240B5FF8C();
          v15 = sub_240B5FF80();
          v17 = v16;
          (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v40);
          if (v15 == 28261 && v17 == 0xE200000000000000)
          {
            swift_bridgeObjectRelease();
LABEL_30:
            if (qword_25435F0A8 == -1)
            {
LABEL_31:
              v34 = sub_240B60088();
              __swift_project_value_buffer(v34, (uint64_t)qword_25435F2B8);
              v26 = sub_240B60070();
              v35 = sub_240B6031C();
              if (!os_log_type_enabled(v26, v35))
                goto LABEL_34;
              v28 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v28 = 0;
              v29 = "Skipping immediate download";
              v30 = v26;
              v31 = v35;
              v32 = v28;
              v33 = 2;
              goto LABEL_33;
            }
LABEL_37:
            swift_once();
            goto LABEL_31;
          }
          v18 = sub_240B605A4();
          swift_bridgeObjectRelease();
          if ((v18 & 1) != 0)
            goto LABEL_30;
        }
      }
      if ((sub_240B2FAD0() & 1) != 0)
        break;
      if (qword_25435F0A8 != -1)
        swift_once();
      v19 = sub_240B60088();
      __swift_project_value_buffer(v19, (uint64_t)qword_25435F2B8);
      v20 = sub_240B60070();
      v21 = sub_240B60334();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = swift_slowAlloc();
        *(_DWORD *)v22 = v41;
        *(_QWORD *)(v22 + 4) = v43;
        _os_log_impl(&dword_240B2B000, v20, v21, "Attempt %ld failed", (uint8_t *)v22, 0xCu);
        MEMORY[0x24268A954](v22, -1, -1);
      }

      v23 = v43 + 1;
      if (__OFADD__(v43, 1))
      {
        __break(1u);
        goto LABEL_37;
      }
      ++v43;
      if (v23 >= a1)
        goto LABEL_24;
    }
    if (qword_25435F0A8 != -1)
      swift_once();
    v25 = sub_240B60088();
    __swift_project_value_buffer(v25, (uint64_t)qword_25435F2B8);
    v26 = sub_240B60070();
    v27 = sub_240B6031C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v28 = 67109120;
      v42 = 1;
      sub_240B603AC();
      v29 = "Completed immediate download status=%{BOOL}d";
      v30 = v26;
      v31 = v27;
      v32 = v28;
      v33 = 8;
LABEL_33:
      _os_log_impl(&dword_240B2B000, v30, v31, v29, v32, v33);
      MEMORY[0x24268A954](v28, -1, -1);
    }
LABEL_34:

  }
  return 1;
}

uint64_t sub_240B308F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088748);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_240B6028C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v3;
  v11[5] = a1;
  v11[6] = a2;
  v11[7] = a3;
  swift_retain();
  swift_retain();
  sub_240B30C58((uint64_t)v9, (uint64_t)&unk_257088758, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_240B309D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  return swift_task_switch();
}

uint64_t sub_240B309F4()
{
  uint64_t v0;
  void (*v1)(__int16 *);
  __int16 v3[5];

  sub_240B30400(*(_QWORD *)(v0 + 32));
  v1 = *(void (**)(__int16 *))(v0 + 40);
  v3[0] = 1;
  v1(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_240B30C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_240B6028C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_240B60280();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_240B34F40(a1, &qword_257088748);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_240B60274();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_240B30DA4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  char *v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  id v30;
  char *v31;
  uint8_t *v32;
  uint8_t *v33;
  void *v34;
  id v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  void *v39;
  unsigned int v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  id v60;
  void *v61;
  _QWORD *v62;
  char *v63;
  _QWORD v64[2];
  _QWORD *v65;
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  id v72[2];

  v72[1] = *(id *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_240B5FF14();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v64 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v64 - v12;
  v71 = 1;
  v70 = 1;
  v14 = container_system_group_path_for_identifier();
  if (v14)
  {
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF48]), sel_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_, v14, 1, 0);
    v16 = (void *)sub_240B600D0();
    v17 = objc_msgSend(v15, sel_URLByAppendingPathComponent_isDirectory_, v16, 1);

    if (!v17)
    {
      v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      v19(v3, 1, 1, v4);
      goto LABEL_11;
    }
    v68 = v15;
    sub_240B5FED8();

    v18 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v18(v3, v11, v4);
    v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v19(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      v15 = v68;
LABEL_11:
      sub_240B34F40((uint64_t)v3, &qword_25435F000);
      if (qword_25435F0A8 != -1)
        swift_once();
      v27 = sub_240B60088();
      __swift_project_value_buffer(v27, (uint64_t)qword_25435F2B8);
      v28 = sub_240B60070();
      v29 = sub_240B60334();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = v15;
        v31 = a1;
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_240B2B000, v28, v29, "Failed to determine path to blackpearl cache", v32, 2u);
        v33 = v32;
        a1 = v31;
        v15 = v30;
        MEMORY[0x24268A954](v33, -1, -1);
      }

      return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v19)(a1, 1, 1, v4);
    }
    v66 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v19;
    v67 = a1;
    v18(v13, v3, v4);
    v34 = (void *)objc_opt_self();
    v35 = objc_msgSend(v34, sel_defaultManager);
    sub_240B5FEE4();
    v36 = (void *)sub_240B600D0();
    swift_bridgeObjectRelease();
    v37 = objc_msgSend(v35, sel_fileExistsAtPath_isDirectory_, v36, &v71);

    if ((v37 & 1) == 0)
    {
      v38 = objc_msgSend(v34, sel_defaultManager);
      v39 = (void *)sub_240B5FEA8();
      v72[0] = 0;
      v40 = objc_msgSend(v38, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v39, 1, 0, v72);

      if (!v40)
      {
        v52 = v72[0];
        v53 = (void *)sub_240B5FE3C();

        swift_willThrow();
        if (qword_25435F0A8 != -1)
          swift_once();
        v54 = sub_240B60088();
        __swift_project_value_buffer(v54, (uint64_t)qword_25435F2B8);
        v55 = v53;
        v56 = v53;
        v57 = sub_240B60070();
        v58 = sub_240B60334();
        if (os_log_type_enabled(v57, v58))
        {
          v59 = (uint8_t *)swift_slowAlloc();
          v65 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v59 = 138412290;
          v60 = v53;
          v61 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v72[0] = v61;
          sub_240B603AC();
          v62 = v65;
          *v65 = v61;

          _os_log_impl(&dword_240B2B000, v57, v58, "Failed to create directory BlackPearl/mlmodelc %@", v59, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
          swift_arrayDestroy();
          MEMORY[0x24268A954](v62, -1, -1);
          MEMORY[0x24268A954](v59, -1, -1);

        }
        else
        {

        }
        v63 = v67;

        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
        v50 = v63;
        v51 = 1;
        return v66((uint64_t)v50, v51, 1, v4);
      }
      v41 = v72[0];
    }
    if (qword_25435F0A8 != -1)
      swift_once();
    v42 = sub_240B60088();
    __swift_project_value_buffer(v42, (uint64_t)qword_25435F2B8);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v13, v4);
    v43 = sub_240B60070();
    v44 = sub_240B60328();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v65 = (_QWORD *)swift_slowAlloc();
      v72[0] = v65;
      *(_DWORD *)v45 = 136315138;
      v64[1] = v45 + 4;
      sub_240B34E98();
      v46 = sub_240B60598();
      v69 = sub_240B335B4(v46, v47, (uint64_t *)v72);
      sub_240B603AC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      _os_log_impl(&dword_240B2B000, v43, v44, "Container path %s", v45, 0xCu);
      v48 = v65;
      swift_arrayDestroy();
      MEMORY[0x24268A954](v48, -1, -1);
      MEMORY[0x24268A954](v45, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }

    v49 = v67;
    v18(v67, v13, v4);
    v50 = v49;
    v51 = 0;
    return v66((uint64_t)v50, v51, 1, v4);
  }
  if (qword_25435F0A8 != -1)
    swift_once();
  v20 = sub_240B60088();
  __swift_project_value_buffer(v20, (uint64_t)qword_25435F2B8);
  v21 = sub_240B60070();
  v22 = sub_240B60334();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = a1;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_240B2B000, v21, v22, "Container path not found or entitled to the process", v24, 2u);
    v25 = v24;
    a1 = v23;
    MEMORY[0x24268A954](v25, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
}

uint64_t static TrialLoader.compileModel(modelPath:modelName:modelVersion:)@<X0>(uint64_t a1@<X0>, void (*a2)(_QWORD, _QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, _QWORD *a7@<X8>)
{
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int (*v44)(_QWORD, _QWORD, _QWORD);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(_QWORD, _QWORD, _QWORD);
  char *v49;
  _QWORD *v50;
  char *v51;
  void (*v52)(char *, uint64_t);
  id v53;
  void (*v54)(_QWORD, _QWORD, _QWORD);
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  char *v63;
  _QWORD *v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint8_t *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void (*v84)(void);
  void (*v85)(char *, uint64_t, uint64_t);
  char *v86;
  uint64_t v87;
  uint64_t *v88;
  unint64_t v89;
  id v90;
  uint64_t v91;
  int *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t result;
  uint64_t v97;
  id v98;
  id v99;
  int *v100;
  char *v101;
  char *v102;
  void (*v103)(char *, uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  _QWORD *v115;
  _QWORD *v116;
  uint64_t v117;
  char *v118;
  uint64_t *v119;
  char *v120;
  _QWORD *v121;
  uint64_t v122;
  void (*v123)(_QWORD, _QWORD);
  uint64_t v124;
  unint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;

  v129 = a5;
  v122 = a1;
  v123 = a2;
  v126 = a7;
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0C8);
  v10 = MEMORY[0x24BDAC7A8](v117);
  v119 = (uint64_t *)((char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = MEMORY[0x24BDAC7A8](v10);
  v116 = (uint64_t *)((char *)&v107 - v13);
  MEMORY[0x24BDAC7A8](v12);
  v118 = (char *)&v107 - v14;
  v115 = (_QWORD *)sub_240B5FE6C();
  v114 = *(v115 - 1);
  MEMORY[0x24BDAC7A8](v115);
  v113 = (char *)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_240B5FF14();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v120 = (char *)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v110 = (char *)&v107 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v109 = (char *)&v107 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v111 = (char *)&v107 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v128 = (uint64_t)&v107 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v107 - v28;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v108 = (uint64_t)&v107 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v121 = (uint64_t *)((char *)&v107 - v34);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v107 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v130 = (uint64_t)&v107 - v38;
  v133 = 95;
  v134 = 0xE100000000000000;
  v127 = a3;
  v131 = a3;
  v132 = a4;
  v124 = a4;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v39;
  sub_240B60178();
  v133 = v129;
  v134 = a6;
  v125 = a6;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v40;
  sub_240B60178();
  v41 = v17;
  swift_bridgeObjectRelease();
  v42 = v131;
  v43 = v132;
  type metadata accessor for TrialLoader();
  sub_240B30DA4(v37);
  v44 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v17 + 48);
  if (v44(v37, 1, v16) == 1)
  {
    swift_bridgeObjectRelease();
    sub_240B34F40((uint64_t)v37, &qword_25435F000);
    v45 = 1;
    v46 = v130;
  }
  else
  {
    v133 = v42;
    v134 = v43;
    v47 = v114;
    v48 = v44;
    v49 = v113;
    v50 = v115;
    (*(void (**)(char *, _QWORD, _QWORD *))(v114 + 104))(v113, *MEMORY[0x24BDCD7A0], v115);
    sub_240B34A2C();
    sub_240B5FF08();
    v51 = v49;
    v44 = v48;
    (*(void (**)(char *, _QWORD *))(v47 + 8))(v51, v50);
    swift_bridgeObjectRelease();
    v52 = *(void (**)(char *, uint64_t))(v41 + 8);
    v52(v37, v16);
    v46 = v130;
    sub_240B5FEC0();
    v52(v29, v16);
    v45 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v46, v45, 1, v16);
  sub_240B5FE90();
  v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
  objc_msgSend(v53, sel_setComputeUnits_, 0);
  objc_msgSend(v53, sel_setExperimentalMLE5BNNSGraphBackendUsage_, 0);
  v54 = (void (*)(_QWORD, _QWORD, _QWORD))v121;
  sub_240B33B88(v46, (uint64_t)v121);
  v55 = v41;
  if (v44(v54, 1, v16) == 1)
  {
    v56 = v41;
    sub_240B34F40((uint64_t)v54, &qword_25435F000);
  }
  else
  {
    v57 = sub_240B2E864();
    v56 = v55;
    v123 = *(void (**)(_QWORD, _QWORD))(v55 + 8);
    v123(v54, v16);
    if (qword_25435F0A8 != -1)
      swift_once();
    v58 = sub_240B60088();
    v122 = __swift_project_value_buffer(v58, (uint64_t)qword_25435F2B8);
    v59 = sub_240B60070();
    v60 = sub_240B60328();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v61 = 67109120;
      v46 = v130;
      LODWORD(v133) = v57 & 1;
      sub_240B603AC();
      _os_log_impl(&dword_240B2B000, v59, v60, "Compile model exists %{BOOL}d", v61, 8u);
      MEMORY[0x24268A954](v61, -1, -1);
    }

    if ((v57 & 1) != 0)
    {
      v62 = v108;
      sub_240B33B88(v46, v108);
      if (v44(v62, 1, v16) == 1)
      {
        sub_240B34F40(v62, &qword_25435F000);
        result = sub_240B60490();
        __break(1u);
      }
      else
      {
        v63 = v111;
        v115 = *(_QWORD **)(v56 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v115)(v111, v62, v16);
        v64 = *(_QWORD **)(v56 + 16);
        v65 = v109;
        v121 = v64;
        ((void (*)(char *, char *, uint64_t))v64)(v109, v63, v16);
        v66 = sub_240B60070();
        v67 = sub_240B6031C();
        if (os_log_type_enabled(v66, v67))
        {
          v68 = (uint8_t *)swift_slowAlloc();
          v69 = swift_slowAlloc();
          v133 = v69;
          *(_DWORD *)v68 = 136315138;
          v70 = sub_240B5FE78();
          v131 = sub_240B335B4(v70, v71, &v133);
          v63 = v111;
          sub_240B603AC();
          swift_bridgeObjectRelease();
          v123(v65, v16);
          _os_log_impl(&dword_240B2B000, v66, v67, "Using complied Model from cache %s", v68, 0xCu);
          swift_arrayDestroy();
          v72 = v69;
          v46 = v130;
          MEMORY[0x24268A954](v72, -1, -1);
          MEMORY[0x24268A954](v68, -1, -1);
        }
        else
        {
          v123(v65, v16);
        }

        sub_240B349F0();
        v97 = (uint64_t)v110;
        ((void (*)(char *, char *, uint64_t))v121)(v110, v63, v16);
        v98 = v53;
        v99 = sub_240B34110(v97, (uint64_t)v98);

        sub_240B34F40(v46, &qword_25435F000);
        v100 = (int *)type metadata accessor for BlackPearlModel(0);
        v101 = (char *)v126;
        v102 = v63;
        v103 = (void (*)(char *, uint64_t, uint64_t))v115;
        ((void (*)(char *, char *, uint64_t))v115)((char *)v126 + v100[6], v102, v16);
        v103(&v101[v100[7]], v128, v16);
        v104 = v100[8];
        v105 = v124;
        v106 = v125;
        *(_QWORD *)v101 = v127;
        *((_QWORD *)v101 + 1) = v105;
        *((_QWORD *)v101 + 2) = v129;
        *((_QWORD *)v101 + 3) = v106;
        *(_QWORD *)&v101[v104] = v99;
        swift_bridgeObjectRetain();
        return swift_bridgeObjectRetain();
      }
      return result;
    }
  }
  if (qword_25435F0A8 != -1)
    swift_once();
  v73 = sub_240B60088();
  __swift_project_value_buffer(v73, (uint64_t)qword_25435F2B8);
  v74 = sub_240B60070();
  v75 = sub_240B6031C();
  v76 = v56;
  if (os_log_type_enabled(v74, v75))
  {
    v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v77 = 0;
    _os_log_impl(&dword_240B2B000, v74, v75, "Compiled model not found in cache", v77, 2u);
    MEMORY[0x24268A954](v77, -1, -1);
  }

  v78 = v124;
  _s20MCCKitCategorization11TrialLoaderC16cleanCachedModel9modelNameySS_tFZ_0(v127, v124);
  v80 = v117;
  v79 = v118;
  v81 = v128;
  v82 = v130;
  v83 = (void *)static TrialLoader.compileAndCacheModel(config:packageURL:compiledModelCachePath:)(&v118[*(int *)(v117 + 48)], v53, v128, v130);

  sub_240B34F40(v82, &qword_25435F000);
  *v79 = v83;
  v130 = (uint64_t)v116 + *(int *)(v80 + 48);
  *v116 = v83;
  v84 = *(void (**)(void))(v76 + 16);
  v84();
  v112 = v76;
  v85 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 32);
  v86 = v120;
  v85(v120, v81, v16);
  v87 = *(int *)(v80 + 48);
  v88 = v119;
  v128 = (uint64_t)v119 + v87;
  *v119 = (uint64_t)v83;
  v84();
  swift_bridgeObjectRetain();
  v89 = v125;
  swift_bridgeObjectRetain();
  v90 = v83;
  sub_240B34F40((uint64_t)v79, &qword_25435F0C8);
  v91 = *v88;
  v92 = (int *)type metadata accessor for BlackPearlModel(0);
  v93 = v92[8];
  v94 = (char *)v126;
  *v126 = v127;
  *((_QWORD *)v94 + 1) = v78;
  v95 = v130;
  *((_QWORD *)v94 + 2) = v129;
  *((_QWORD *)v94 + 3) = v89;
  v85(&v94[v92[6]], v95, v16);
  v85(&v94[v92[7]], (uint64_t)v86, v16);
  *(_QWORD *)&v94[v93] = v91;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v112 + 8))(v128, v16);
}

uint64_t static TrialLoader.compileAndCacheModel(config:packageURL:compiledModelCachePath:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void (*v29)(char *, char *, uint64_t);
  id v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  char *v38;
  char *v39;
  uint8_t *v40;
  uint8_t *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint8_t *v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t result;
  char *v49;
  id v50;
  char v51;
  uint64_t v52;
  char *v53;
  NSObject *v54;
  char *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  unint64_t v59;
  void (*v60)(char *, uint64_t);
  uint8_t *v61;
  void *v62;
  char *v63;
  id v64;
  uint64_t v65;
  uint8_t *v66;
  uint8_t *v67;
  void *v68;
  char *v69;
  char *v70;
  id v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  id v76[3];

  v73 = a1;
  v74 = a4;
  v76[2] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v66 - v9;
  v11 = sub_240B5FF14();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v72 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v66 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v70 = (char *)&v66 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v66 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v66 - v22;
  v24 = (void *)objc_opt_self();
  v25 = (void *)sub_240B5FEA8();
  v76[0] = 0;
  v26 = objc_msgSend(v24, sel_compileModelAtURL_error_, v25, v76);

  v27 = v76[0];
  if (!v26)
  {
    v64 = v76[0];
    v65 = sub_240B5FE3C();

    swift_willThrow();
    v76[0] = 0;
    v76[1] = (id)0xE000000000000000;
    sub_240B6043C();
    sub_240B60184();
    v75 = v65;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088760);
    sub_240B60478();
    result = sub_240B60490();
    __break(1u);
    return result;
  }
  sub_240B5FED8();
  v28 = v27;

  sub_240B349F0();
  v29 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v29(v21, v23, v11);
  v30 = a2;
  v71 = sub_240B34110((uint64_t)v21, (uint64_t)v30);

  v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v32 = v74;
  v33 = &qword_25435F000;
  if (v31((char *)v74, 1, v11) == 1)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v34 = sub_240B60088();
    __swift_project_value_buffer(v34, (uint64_t)qword_25435F2B8);
    v35 = sub_240B60070();
    v36 = sub_240B60334();
    v37 = os_log_type_enabled(v35, v36);
    v39 = v72;
    v38 = v73;
    if (v37)
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_240B2B000, v35, v36, "Compiled Model Caching path is nil, returning non cached instance", v40, 2u);
      v41 = v40;
      v32 = v74;
      MEMORY[0x24268A954](v41, -1, -1);
    }

  }
  else
  {
    sub_240B33B88(v32, (uint64_t)v10);
    if (v31(v10, 1, v11) == 1)
    {
      sub_240B34F40((uint64_t)v10, &qword_25435F000);
      v39 = v72;
      v38 = v73;
      goto LABEL_11;
    }
    v49 = v70;
    (*(void (**)(void))(v12 + 32))();
    v50 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v51 = sub_240B33BD0();

    if ((v51 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v49, v11);
      v39 = v72;
      v38 = v73;
    }
    else
    {
      if (qword_25435F0A8 != -1)
        swift_once();
      v52 = sub_240B60088();
      __swift_project_value_buffer(v52, (uint64_t)qword_25435F2B8);
      v53 = v69;
      v29(v69, v49, v11);
      v54 = sub_240B60070();
      v55 = v49;
      v56 = sub_240B60334();
      if (os_log_type_enabled(v54, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc();
        v68 = (void *)swift_slowAlloc();
        v76[0] = v68;
        v67 = v57;
        *(_DWORD *)v57 = 136315138;
        v66 = v57 + 4;
        v58 = sub_240B5FE78();
        v75 = sub_240B335B4(v58, v59, (uint64_t *)v76);
        sub_240B603AC();
        swift_bridgeObjectRelease();
        v60 = *(void (**)(char *, uint64_t))(v12 + 8);
        v60(v53, v11);
        v61 = v67;
        _os_log_impl(&dword_240B2B000, v54, v56, "Failed to copy model to permanent cache path %s", v67, 0xCu);
        v62 = v68;
        swift_arrayDestroy();
        MEMORY[0x24268A954](v62, -1, -1);
        MEMORY[0x24268A954](v61, -1, -1);

        v63 = v70;
      }
      else
      {

        v60 = *(void (**)(char *, uint64_t))(v12 + 8);
        v60(v53, v11);
        v63 = v55;
      }
      v60(v63, v11);
      v38 = v73;
      v32 = v74;
      v39 = v72;
    }
  }
  v33 = &qword_25435F000;
LABEL_11:
  if (v33[21] != -1)
    swift_once();
  v42 = sub_240B60088();
  __swift_project_value_buffer(v42, (uint64_t)qword_25435F2B8);
  v43 = sub_240B60070();
  v44 = sub_240B6031C();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_240B2B000, v43, v44, "Complied Model at runtime as no cache exists", v45, 2u);
    v46 = v45;
    v32 = v74;
    MEMORY[0x24268A954](v46, -1, -1);
  }

  sub_240B33B88(v32, (uint64_t)v8);
  v47 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v47(v39, v23, v11);
  if (v31(v8, 1, v11) == 1)
  {
    v47(v38, v39, v11);
    sub_240B34F40((uint64_t)v8, &qword_25435F000);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v39, v11);
    v47(v38, v8, v11);
  }
  return (uint64_t)v71;
}

unint64_t sub_240B32AD4()
{
  return 0xD000000000000010;
}

unint64_t sub_240B32AF0()
{
  return 0xD000000000000016;
}

unint64_t sub_240B32B0C()
{
  return 0xD00000000000001CLL;
}

unint64_t sub_240B32B28()
{
  return 0xD000000000000016;
}

unint64_t sub_240B32B44()
{
  return 0xD00000000000001CLL;
}

unint64_t sub_240B32B60()
{
  return 0xD000000000000018;
}

unint64_t sub_240B32B7C()
{
  return 0xD00000000000001ALL;
}

unint64_t sub_240B32B98()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_240B32BB4()
{
  return 0xD000000000000013;
}

unint64_t sub_240B32BD0()
{
  return 0xD000000000000015;
}

unint64_t sub_240B32BEC()
{
  return 0xD000000000000011;
}

unint64_t sub_240B32C08()
{
  return 0xD000000000000017;
}

uint64_t sub_240B32C24()
{
  return 0x6F6F6C427377654ELL;
}

unint64_t sub_240B32C48()
{
  return 0xD000000000000011;
}

uint64_t sub_240B32C64()
{
  return 0x6D6F6F6C4252454ELL;
}

uint64_t sub_240B32C88()
{
  return 0x6F4C6E69616D6F44;
}

uint64_t sub_240B32CA8()
{
  return 0x63656A6275535354;
}

uint64_t sub_240B32CCC()
{
  return 0x7265646E65535354;
}

unint64_t sub_240B32CF0()
{
  return 0xD000000000000011;
}

unint64_t sub_240B32D0C()
{
  return 0xD000000000000011;
}

unint64_t sub_240B32D28()
{
  return 0xD000000000000011;
}

uint64_t sub_240B32D44()
{
  return 0x6C6F687365726854;
}

unint64_t sub_240B32D64()
{
  return 0xD000000000000015;
}

uint64_t sub_240B32D80()
{
  return 0x6C6F687365726854;
}

uint64_t sub_240B32DA4()
{
  return 0x6C6F687365726854;
}

unint64_t sub_240B32DC4()
{
  return 0xD000000000000013;
}

unint64_t sub_240B32DE0()
{
  return 0xD000000000000015;
}

uint64_t sub_240B32DFC()
{
  return 0x6165506B63616C42;
}

unint64_t sub_240B32E18()
{
  return 0xD000000000000010;
}

unint64_t sub_240B32E34()
{
  return 0xD000000000000018;
}

unint64_t sub_240B32E50()
{
  return 0xD000000000000011;
}

unint64_t sub_240B32E6C()
{
  return 0xD000000000000012;
}

uint64_t sub_240B32E88@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  return sub_240B2EF30(v3, a1);
}

uint64_t sub_240B32EDC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_240B2EFCC(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_240B32F38())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_240B32F80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  type metadata accessor for TrialLoader();
  v2 = swift_allocObject();
  result = TrialLoader.init()();
  *a1 = v2;
  return result;
}

void sub_240B32FBC()
{
  sub_240B2F72C();
}

uint64_t sub_240B32FDC()
{
  return sub_240B301D8() & 1;
}

uint64_t sub_240B33000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088748);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  v11 = sub_240B6028C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v10;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = a3;
  swift_retain();
  swift_retain();
  sub_240B30C58((uint64_t)v9, (uint64_t)&unk_257088770, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_240B330E4@<X0>(uint64_t a1@<X0>, void (*a2)(_QWORD, _QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  return static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(a1, a2, a3, a4, a5, a6, a7);
}

BOOL static TrialLoader.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TrialLoader.Error.hash(into:)()
{
  return sub_240B60634();
}

uint64_t TrialLoader.Error.hashValue.getter()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

BOOL sub_240B33178(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_240B3318C()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

uint64_t sub_240B331D0()
{
  return sub_240B60634();
}

uint64_t sub_240B331F8()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

uint64_t sub_240B33258(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_240B33268(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_240B3329C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_240B332BC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_240B332DC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_240B33340;
  return v6(a1);
}

uint64_t sub_240B33340()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_BYTE **sub_240B3338C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_240B3339C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_240B603AC();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_240B33464(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24268A8A0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_240B334E0(uint64_t a1)
{
  uint64_t v1;

  return sub_240B2F8C0(a1, v1);
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

unint64_t sub_240B33500()
{
  unint64_t result;

  result = qword_257088740;
  if (!qword_257088740)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for TrialLoader.Error, &type metadata for TrialLoader.Error);
    atomic_store(result, (unint64_t *)&qword_257088740);
  }
  return result;
}

uint64_t sub_240B33544(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_240B335B4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_240B603AC();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_240B335B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_240B33684(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_240B34F00((uint64_t)v12, *a3);
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
      sub_240B34F00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_240B33684(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240B603B8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_240B3383C(a5, a6);
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
  v8 = sub_240B60460();
  if (!v8)
  {
    sub_240B60484();
    __break(1u);
LABEL_17:
    result = sub_240B604CC();
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

uint64_t sub_240B3383C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_240B3FF54(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_240B338D0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_240B338D0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_240B338D0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088788);
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
  result = sub_240B604CC();
  __break(1u);
  return result;
}

void *sub_240B33A1C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_240B604CC();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_240B33AB0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_240B33ADC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_240B351B0;
  *(_OWORD *)(v4 + 40) = v5;
  *(_QWORD *)(v4 + 24) = v2;
  *(_QWORD *)(v4 + 32) = v3;
  return swift_task_switch();
}

uint64_t type metadata accessor for TrialLoader()
{
  uint64_t result;

  result = qword_25435F028;
  if (!qword_25435F028)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240B33B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_240B33BD0()
{
  void *v0;
  id v1;
  void *v2;
  unsigned int v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_defaultManager);
  sub_240B5FEF0();
  v2 = (void *)sub_240B600D0();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_fileExistsAtPath_, v2);

  if (v3)
  {
    v4 = objc_msgSend(v0, sel_defaultManager);
    v5 = (void *)sub_240B5FEA8();
    v20 = 0;
    v6 = objc_msgSend(v4, sel_removeItemAtURL_error_, v5, &v20);

    v7 = v20;
    if (!v6)
      goto LABEL_6;
    v8 = v20;
  }
  v9 = objc_msgSend(v0, sel_defaultManager);
  v10 = (void *)sub_240B5FEA8();
  v11 = (void *)sub_240B5FEA8();
  v20 = 0;
  v12 = objc_msgSend(v9, sel_copyItemAtURL_toURL_error_, v10, v11, &v20);

  v7 = v20;
  if (v12)
  {
    v13 = v20;
    return 1;
  }
LABEL_6:
  v15 = v7;
  v16 = (void *)sub_240B5FE3C();

  swift_willThrow();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088778);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_240B60DA0;
  v20 = 0;
  v21 = 0xE000000000000000;
  sub_240B6043C();
  sub_240B60184();
  sub_240B5FF14();
  sub_240B34E98();
  sub_240B60598();
  sub_240B60184();
  swift_bridgeObjectRelease();
  sub_240B60184();
  sub_240B60598();
  sub_240B60184();
  swift_bridgeObjectRelease();
  sub_240B60184();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088760);
  sub_240B60478();
  v18 = v20;
  v19 = v21;
  *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v17 + 32) = v18;
  *(_QWORD *)(v17 + 40) = v19;
  sub_240B60610();

  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_240B33EE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0E0);
    v3 = sub_240B60424();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_240B600F4();
      sub_240B60628();
      v7 = v6;
      sub_240B60148();
      v8 = sub_240B60640();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_240B600F4();
        v17 = v16;
        if (v15 == sub_240B600F4() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_240B605A4();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_240B600F4();
          v24 = v23;
          if (v22 == sub_240B600F4() && v24 == v25)
            goto LABEL_3;
          v27 = sub_240B605A4();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

id sub_240B34110(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_240B5FEA8();
  v13[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_240B5FF14();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_240B5FE3C();

    swift_willThrow();
    v11 = sub_240B5FF14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

void _s20MCCKitCategorization11TrialLoaderC16cleanCachedModel9modelNameySS_tFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unsigned int (*v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(char *, uint64_t);
  os_log_type_t v47;
  uint8_t *v48;
  void *v49;
  void (*v50)(char *, uint64_t);
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  _QWORD *v59;
  id v60;
  void *v61;
  id v62;
  char *v63;
  void (*v64)(char *, uint64_t);
  _QWORD v65[2];
  char *v66;
  uint64_t v67;
  __int128 v68;
  uint8_t *v69;
  unsigned int (*v70)(_QWORD, _QWORD, _QWORD);
  char *v71;
  char *v72;
  char *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, char *, uint64_t);
  uint64_t v78;
  id v79;
  void (*v80)(char *, unint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  id v83[4];

  v83[2] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v65 - v8;
  v10 = sub_240B5FF14();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v73 = (char *)v65 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v65 - v17;
  v79 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  type metadata accessor for TrialLoader();
  sub_240B30DA4(v9);
  v19 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v11 + 48);
  if (v19(v9, 1, v10) == 1)
  {

    sub_240B34F40((uint64_t)v9, &qword_25435F000);
  }
  else
  {
    v77 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v77(v18, v9, v10);
    v20 = (void *)sub_240B5FEA8();
    v83[0] = 0;
    v21 = objc_msgSend(v79, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v20, 0, 0, v83);

    v22 = v83[0];
    if (v21)
    {
      v72 = v14;
      v66 = v18;
      v74 = (_QWORD *)v11;
      v23 = sub_240B60244();
      v24 = v22;

      v83[0] = (id)95;
      v83[1] = (id)0xE100000000000000;
      v81 = a1;
      v82 = a2;
      swift_bridgeObjectRetain();
      v81 = sub_240B60214();
      v82 = v25;
      sub_240B60178();
      v78 = v82;
      v27 = *(_QWORD *)(v23 + 16);
      v65[1] = v23;
      if (v27)
      {
        v28 = v74;
        v29 = v23 + ((*((unsigned __int8 *)v28 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v28 + 80));
        v75 = v74[9];
        v76 = v81;
        v80 = (void (*)(char *, unint64_t, uint64_t))v74[2];
        *(_QWORD *)&v26 = 136315138;
        v68 = v26;
        v67 = MEMORY[0x24BEE4AD8] + 8;
        v30 = v73;
        v70 = v19;
        v71 = v7;
        v80(v7, v29, v10);
        while (1)
        {
          v31 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v28[7];
          v31(v7, 0, 1, v10);
          if (v19(v7, 1, v10) == 1)
            break;
          v77(v30, v7, v10);
          sub_240B5FE9C();
          v32 = sub_240B601F0();
          swift_bridgeObjectRelease();
          if ((v32 & 1) != 0)
          {
            v33 = (void *)sub_240B5FEA8();
            v83[0] = 0;
            v34 = objc_msgSend(v79, sel_removeItemAtURL_error_, v33, v83);

            if (!v34)
            {
              v62 = v83[0];
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v63 = v30;
              v52 = (void *)sub_240B5FE3C();

              swift_willThrow();
              v64 = (void (*)(char *, uint64_t))v28[1];
              v64(v63, v10);
              v64(v66, v10);
              goto LABEL_19;
            }
            v35 = v10;
            v36 = qword_25435F0A8;
            v37 = v83[0];
            if (v36 != -1)
              swift_once();
            v38 = sub_240B60088();
            __swift_project_value_buffer(v38, (uint64_t)qword_25435F2B8);
            v39 = v72;
            v80(v72, (unint64_t)v30, v35);
            v40 = sub_240B60070();
            v41 = sub_240B6031C();
            if (os_log_type_enabled(v40, v41))
            {
              v42 = swift_slowAlloc();
              v43 = (void *)swift_slowAlloc();
              v83[0] = v43;
              *(_DWORD *)v42 = v68;
              v69 = (uint8_t *)v42;
              v44 = sub_240B5FEF0();
              *(_QWORD *)(v42 + 4) = sub_240B335B4(v44, v45, (uint64_t *)v83);
              swift_bridgeObjectRelease();
              v28 = v74;
              v46 = (void (*)(char *, uint64_t))v74[1];
              v46(v39, v35);
              v47 = v41;
              v48 = v69;
              _os_log_impl(&dword_240B2B000, v40, v47, "Cleaned old model from cache : %s", v69, 0xCu);
              swift_arrayDestroy();
              v49 = v43;
              v30 = v73;
              MEMORY[0x24268A954](v49, -1, -1);
              MEMORY[0x24268A954](v48, -1, -1);

              v46(v30, v35);
            }
            else
            {

              v28 = v74;
              v50 = (void (*)(char *, uint64_t))v74[1];
              v50(v39, v35);
              v50(v30, v35);
            }
            v10 = v35;
            v19 = v70;
            v7 = v71;
          }
          else
          {
            ((void (*)(char *, uint64_t))v28[1])(v30, v10);
          }
          v29 += v75;
          if (!--v27)
            goto LABEL_24;
          v80(v7, v29, v10);
        }
      }
      else
      {
        v28 = v74;
        v31 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v74[7];
LABEL_24:
        v31(v7, 1, 1, v10);
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v28[1])(v66, v10);
    }
    else
    {
      v51 = v83[0];
      v52 = (void *)sub_240B5FE3C();

      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v10);
LABEL_19:
      if (qword_25435F0A8 != -1)
        swift_once();
      v53 = sub_240B60088();
      __swift_project_value_buffer(v53, (uint64_t)qword_25435F2B8);
      v54 = v52;
      v55 = v52;
      v56 = sub_240B60070();
      v57 = sub_240B60334();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc();
        v59 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v58 = 138412290;
        v60 = v52;
        v61 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v83[0] = v61;
        sub_240B603AC();
        *v59 = v61;

        _os_log_impl(&dword_240B2B000, v56, v57, "Failed old model cache cleanup : %@", v58, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
        swift_arrayDestroy();
        MEMORY[0x24268A954](v59, -1, -1);
        MEMORY[0x24268A954](v58, -1, -1);

      }
      else
      {

      }
    }
  }
}

unint64_t sub_240B349F0()
{
  unint64_t result;

  result = qword_25435F0D0;
  if (!qword_25435F0D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25435F0D0);
  }
  return result;
}

unint64_t sub_240B34A2C()
{
  unint64_t result;

  result = qword_25435F0B0;
  if (!qword_25435F0B0)
  {
    result = MEMORY[0x24268A8B8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25435F0B0);
  }
  return result;
}

unint64_t sub_240B34A74()
{
  unint64_t result;

  result = qword_257088768;
  if (!qword_257088768)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for TrialLoader.Error, &type metadata for TrialLoader.Error);
    atomic_store(result, (unint64_t *)&qword_257088768);
  }
  return result;
}

uint64_t sub_240B34ABC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  return sub_240B2EF30(v3, a2);
}

uint64_t sub_240B34B14()
{
  return type metadata accessor for TrialLoader();
}

uint64_t sub_240B34B1C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for TrialLoader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TrialLoader.blackPearlLevels.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of TrialLoader.blackPearlLevels.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of TrialLoader.blackPearlLevels.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of TrialLoader.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of TrialLoader.subscribe()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of TrialLoader.needImmediateDownloadCheck()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of TrialLoader.runImmediateDownload(retries:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))() & 1;
}

uint64_t dispatch thunk of TrialLoader.runImmediateDownloadAsync(retries:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of TrialLoader.getBlackPearlLevels()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TrialLoader.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TrialLoader.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B34D14 + 4 * byte_240B60DF5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240B34D48 + 4 * byte_240B60DF0[v4]))();
}

uint64_t sub_240B34D48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B34D50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B34D58);
  return result;
}

uint64_t sub_240B34D64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B34D6CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240B34D70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B34D78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B34D84(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_240B34D90(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialLoader.Error()
{
  return &type metadata for TrialLoader.Error;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_240B34DE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_240B34E50;
  *(_OWORD *)(v4 + 40) = v5;
  *(_QWORD *)(v4 + 24) = v2;
  *(_QWORD *)(v4 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_240B34E50()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_240B34E98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257088780;
  if (!qword_257088780)
  {
    v1 = sub_240B5FF14();
    result = MEMORY[0x24268A8B8](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_257088780);
  }
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

uint64_t sub_240B34F00(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_240B34F40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240B34F7C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_240B34FA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_240B34E50;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257088790 + dword_257088790))(a1, v4);
}

uint64_t sub_240B35010(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0D8);
    v3 = sub_240B60424();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_240B60628();
      swift_bridgeObjectRetain();
      sub_240B60148();
      result = sub_240B60640();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_240B605A4(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_240B605A4();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

BOOL static TrialDeploymentType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TrialDeploymentType.hash(into:)()
{
  return sub_240B60634();
}

uint64_t TrialDeploymentType.hashValue.getter()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

unint64_t sub_240B3523C()
{
  unint64_t result;

  result = qword_2570887A0;
  if (!qword_2570887A0)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for TrialDeploymentType, &type metadata for TrialDeploymentType);
    atomic_store(result, (unint64_t *)&qword_2570887A0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TrialDeploymentType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B352CC + 4 * byte_240B60F85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240B35300 + 4 * byte_240B60F80[v4]))();
}

uint64_t sub_240B35300(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B35308(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B35310);
  return result;
}

uint64_t sub_240B3531C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B35324);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240B35328(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B35330(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TrialDeploymentType()
{
  return &type metadata for TrialDeploymentType;
}

uint64_t TokenMapDataFrame.__allocating_init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  TokenMapDataFrame.init(withFileAtPath:)(a1);
  return v2;
}

uint64_t TokenMapDataFrame.init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;

  v2 = v1;
  v33 = sub_240B5FF14();
  v30 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v4 = sub_240B6010C();
  MEMORY[0x24BDAC7A8](v4);
  v31 = v2;
  *(_QWORD *)(v2 + 16) = MEMORY[0x24BEE4B00];
  v5 = (_QWORD *)(v2 + 16);
  sub_240B60100();
  v32 = a1;
  v6 = sub_240B600C4();
  v8 = sub_240B356EC(0x7FFFFFFFFFFFFFFFLL, 1, v6, v7);
  v9 = sub_240B35BBC(v8);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v11 = 0;
    v12 = (uint64_t *)(v9 + 40);
    while (1)
    {
      v14 = *(v12 - 1);
      v13 = *v12;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v16 = (_QWORD *)*v5;
      v34 = (_QWORD *)*v5;
      *v5 = 0x8000000000000000;
      v18 = sub_240B35E68(v14, v13);
      v19 = v16[2];
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
        break;
      v22 = v17;
      if (v16[3] >= v21)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_240B374DC();
      }
      else
      {
        sub_240B36238(v21, isUniquelyReferenced_nonNull_native);
        v23 = sub_240B35E68(v14, v13);
        if ((v22 & 1) != (v24 & 1))
          goto LABEL_17;
        v18 = v23;
      }
      ++v11;
      if ((v22 & 1) != 0)
      {
        *(_QWORD *)(v34[7] + 8 * v18) = v11;
      }
      else
      {
        v34[(v18 >> 6) + 8] |= 1 << v18;
        v25 = (uint64_t *)(v34[6] + 16 * v18);
        *v25 = v14;
        v25[1] = v13;
        *(_QWORD *)(v34[7] + 8 * v18) = v11;
        v26 = v34[2];
        v27 = __OFADD__(v26, 1);
        v28 = v26 + 1;
        if (v27)
          goto LABEL_16;
        v34[2] = v28;
        swift_bridgeObjectRetain();
      }
      v12 += 2;
      *v5 = v34;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      if (v10 == v11)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    sub_240B605D4();
    __break(1u);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v13, v32, v33);
    sub_240B6043C();
    swift_bridgeObjectRelease();
    sub_240B34E98();
    sub_240B60598();
    sub_240B60184();
    swift_bridgeObjectRelease();
    result = sub_240B60490();
    __break(1u);
  }
  else
  {
LABEL_14:
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v33);
    swift_bridgeObjectRelease();
    return v31;
  }
  return result;
}

uint64_t sub_240B356EC(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t result;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v45;

  if (a1 < 0)
  {
LABEL_50:
    result = sub_240B60484();
    __break(1u);
  }
  else
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = MEMORY[0x24BEE4AF8];
    v9 = swift_allocObject();
    v10 = v9;
    *(_QWORD *)(v9 + 16) = 15;
    v11 = HIBYTE(a4) & 0xF;
    if (a1)
    {
      v12 = (a4 & 0x2000000000000000) != 0 ? HIBYTE(a4) & 0xF : a3 & 0xFFFFFFFFFFFFLL;
      if (v12)
      {
        v41 = a1;
        v45 = 4 * v12;
        v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v14 = 15;
        v15 = 15;
        v42 = (_QWORD *)a3;
        v43 = v9;
        while (1)
        {
          v16 = sub_240B60208();
          v18 = v17;
          if (!((v17 & 0x2000000000000000) != 0 ? HIBYTE(v17) & 0xF : v16 & 0xFFFFFFFFFFFFLL))
            break;
          if ((v17 & 0x1000000000000000) != 0)
          {
            v20 = sub_240B60430();
          }
          else
          {
            if ((v17 & 0x2000000000000000) == 0 && (v16 & 0x1000000000000000) == 0)
              sub_240B60460();
            v20 = sub_240B6046C();
          }
          v4 = v20;
          swift_bridgeObjectRelease();
          if ((v4 - 14) > 0xFFFFFFFB || (v4 - 8232) < 2 || (_DWORD)v4 == 133)
          {
            if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
            {
              v14 = sub_240B60160();
              *(_QWORD *)(v10 + 16) = v14;
              v15 = v14;
            }
            else
            {
              if (v14 >> 14 < v15 >> 14)
                goto LABEL_49;
              v21 = a4;
              v22 = sub_240B60220();
              v24 = v23;
              v26 = v25;
              v4 = v27;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v13 = sub_240B3F7EC(0, v13[2] + 1, 1, v13);
              v28 = v13;
              v29 = v13[2];
              v30 = v28;
              v31 = v28[3];
              if (v29 >= v31 >> 1)
                v30 = sub_240B3F7EC((_QWORD *)(v31 > 1), v29 + 1, 1, v30);
              v30[2] = v29 + 1;
              v32 = &v30[4 * v29];
              v13 = v30;
              v32[4] = v22;
              v32[5] = v24;
              v32[6] = v26;
              v32[7] = v4;
              *(_QWORD *)(v8 + 16) = v30;
              a4 = v21;
              a3 = (unint64_t)v42;
              v15 = sub_240B60160();
              v10 = v43;
              *(_QWORD *)(v43 + 16) = v15;
              v14 = v15;
              if (v13[2] == v41)
              {
LABEL_38:
                if (v45 == v15 >> 14 && (a2 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_46;
                }
                if (v45 < v15 >> 14)
                {
LABEL_49:
                  sub_240B60484();
                  __break(1u);
                  goto LABEL_50;
                }
                a3 = (unint64_t)v13;
                v15 = sub_240B60220();
                v18 = v34;
                v13 = v35;
                v4 = v36;
                swift_bridgeObjectRelease();
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
                {
LABEL_43:
                  v38 = *(_QWORD *)(a3 + 16);
                  v37 = *(_QWORD *)(a3 + 24);
                  if (v38 >= v37 >> 1)
                    a3 = (unint64_t)sub_240B3F7EC((_QWORD *)(v37 > 1), v38 + 1, 1, (_QWORD *)a3);
                  *(_QWORD *)(a3 + 16) = v38 + 1;
                  v39 = (_QWORD *)(a3 + 32 * v38);
                  v39[4] = v15;
                  v39[5] = v18;
                  v39[6] = v13;
                  v39[7] = v4;
                  v13 = (_QWORD *)a3;
                  *(_QWORD *)(v8 + 16) = a3;
                  goto LABEL_46;
                }
LABEL_48:
                a3 = (unint64_t)sub_240B3F7EC(0, *(_QWORD *)(a3 + 16) + 1, 1, (_QWORD *)a3);
                goto LABEL_43;
              }
            }
          }
          else
          {
            v14 = sub_240B60160();
          }
          if (v45 == v14 >> 14)
            goto LABEL_38;
        }
        __break(1u);
        goto LABEL_48;
      }
    }
    if ((a4 & 0x2000000000000000) == 0)
      v11 = a3 & 0xFFFFFFFFFFFFLL;
    v33 = 7;
    if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0)
      v33 = 11;
    sub_240B5432C(v33 | (v11 << 16), v9, a2 & 1, v8);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v8 + 16);
LABEL_46:
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return (uint64_t)v13;
  }
  return result;
}

uint64_t sub_240B35BBC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_240B4CC6C(0, v1, 0);
    v2 = v16;
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = *(v4 - 3);
      v6 = *(v4 - 2);
      v7 = *(v4 - 1);
      v8 = *v4;
      swift_bridgeObjectRetain();
      v9 = MEMORY[0x242689FE8](v5, v6, v7, v8);
      v11 = v10;
      swift_bridgeObjectRelease();
      v13 = *(_QWORD *)(v16 + 16);
      v12 = *(_QWORD *)(v16 + 24);
      if (v13 >= v12 >> 1)
        sub_240B4CC6C(v12 > 1, v13 + 1, 1);
      *(_QWORD *)(v16 + 16) = v13 + 1;
      v14 = v16 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_240B35CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 16);
  if (!*(_QWORD *)(v5 + 16))
    return 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_240B35E68(a1, a2);
  if ((v7 & 1) != 0)
    v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
  else
    v8 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t TokenMapDataFrame.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TokenMapDataFrame.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_240B35DA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  type metadata accessor for TokenMapDataFrame();
  v4 = swift_allocObject();
  result = TokenMapDataFrame.init(withFileAtPath:)(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_240B35DE8(uint64_t a1, uint64_t a2)
{
  return sub_240B35CB8(a1, a2);
}

unint64_t sub_240B35E0C(unsigned __int8 a1)
{
  uint64_t v2;

  sub_240B60628();
  sub_240B60634();
  v2 = sub_240B60640();
  return sub_240B370A4(a1, v2);
}

unint64_t sub_240B35E68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_240B60628();
  sub_240B60148();
  v4 = sub_240B60640();
  return sub_240B37144(a1, a2, v4);
}

unint64_t sub_240B35ECC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_240B6061C();
  return sub_240B37224(a1, v2);
}

uint64_t sub_240B35EFC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;

  v3 = v2;
  v40 = sub_240B5FF14();
  v5 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0E8);
  result = sub_240B604B4();
  v10 = result;
  if (*(_QWORD *)(v8 + 16))
  {
    v35 = v2;
    v11 = 0;
    v12 = *(_QWORD *)(v8 + 64);
    v38 = (_QWORD *)(v8 + 64);
    v13 = 1 << *(_BYTE *)(v8 + 32);
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v15 = v14 & v12;
    v37 = (unint64_t)(v13 + 63) >> 6;
    v16 = result + 64;
    v36 = a2;
    v17 = 16;
    if ((a2 & 1) != 0)
      v17 = 32;
    v39 = v17;
    while (1)
    {
      if (v15)
      {
        v19 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v20 = v19 | (v11 << 6);
      }
      else
      {
        v21 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v38;
        if (v21 >= v37)
          goto LABEL_33;
        v22 = v38[v21];
        ++v11;
        if (!v22)
        {
          v11 = v21 + 1;
          if (v21 + 1 >= v37)
            goto LABEL_33;
          v22 = v38[v11];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v37)
            {
LABEL_33:
              if ((v36 & 1) == 0)
              {
                result = swift_release();
                v3 = v35;
                goto LABEL_40;
              }
              v33 = 1 << *(_BYTE *)(v8 + 32);
              if (v33 >= 64)
                bzero(v38, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v38 = -1 << v33;
              v3 = v35;
              *(_QWORD *)(v8 + 16) = 0;
              break;
            }
            v22 = v38[v23];
            if (!v22)
            {
              while (1)
              {
                v11 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v11 >= v37)
                  goto LABEL_33;
                v22 = v38[v11];
                ++v23;
                if (v22)
                  goto LABEL_23;
              }
            }
            v11 = v23;
          }
        }
LABEL_23:
        v15 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v11 << 6);
      }
      v24 = *(_BYTE *)(*(_QWORD *)(v8 + 48) + v20);
      v25 = *(_QWORD *)(v5 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + v39))(v7, *(_QWORD *)(v8 + 56) + v25 * v20, v40);
      sub_240B60628();
      sub_240B60634();
      result = sub_240B60640();
      v26 = -1 << *(_BYTE *)(v10 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        v18 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v16 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_BYTE *)(*(_QWORD *)(v10 + 48) + v18) = v24;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 56) + v25 * v18, v7, v40);
      ++*(_QWORD *)(v10 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v10;
  return result;
}

uint64_t sub_240B36238(uint64_t a1, char a2)
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
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0F0);
  v37 = a2;
  v6 = sub_240B604B4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
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
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_240B60628();
    sub_240B60148();
    result = sub_240B60640();
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
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
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

uint64_t sub_240B36540(uint64_t a1, char a2)
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
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  char v35;
  __int128 v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887C0);
  v35 = a2;
  result = sub_240B604B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v34 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
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
        if (v20 >= v33)
          goto LABEL_33;
        v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v33)
            goto LABEL_33;
          v21 = v34[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v34 = -1 << v32;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v33)
                  goto LABEL_33;
                v21 = v34[v8];
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
      v27 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v19);
      v28 = *(_QWORD *)(v5 + 56) + 40 * v19;
      v29 = *(_QWORD *)v28;
      v36 = *(_OWORD *)(v28 + 8);
      v30 = *(_BYTE *)(v28 + 24);
      v31 = *(_QWORD *)(v28 + 32);
      if ((v35 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_240B60628();
      sub_240B60634();
      result = sub_240B60640();
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
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v16) = v27;
      v17 = *(_QWORD *)(v7 + 56) + 40 * v16;
      *(_QWORD *)v17 = v29;
      *(_OWORD *)(v17 + 8) = v36;
      *(_BYTE *)(v17 + 24) = v30;
      *(_QWORD *)(v17 + 32) = v31;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_240B3684C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887B8);
  result = sub_240B604B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_240B6061C();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_240B36AF0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887B0);
  result = sub_240B604B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = 1 << *(_BYTE *)(v5 + 32);
    v34 = v3;
    v35 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v35)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v35)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v35);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v35)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(void **)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        v31 = v30;
      result = sub_240B6061C();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_240B36DA0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887A8);
  v37 = a2;
  v6 = sub_240B604B4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_240B60628();
    sub_240B60148();
    result = sub_240B60640();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_240B370A4(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_240B37144(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_240B605A4() & 1) == 0)
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
      while (!v14 && (sub_240B605A4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_240B37224(uint64_t a1, uint64_t a2)
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
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void *sub_240B372C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = sub_240B5FF14();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0E8);
  v23 = v0;
  v5 = *v0;
  v6 = sub_240B604A8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      v11 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v24 + 8 * v11);
      if (!v20)
        break;
    }
LABEL_25:
    v14 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_12:
    v17 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16);
    v18 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v18, v1);
    *(_BYTE *)(*(_QWORD *)(v7 + 48) + v16) = v17;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v18, v4, v1);
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_240B374DC()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0F0);
  v2 = *v0;
  v3 = sub_240B604A8();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for TokenMapDataFrame()
{
  return objc_opt_self();
}

uint64_t method lookup function for TokenMapDataFrame()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TokenMapDataFrame.__allocating_init(withFileAtPath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TokenMapDataFrame.lookup(domain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

void *sub_240B376E4()
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
  char v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887C0);
  v2 = *v0;
  v3 = sub_240B604A8();
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
    v16 = *(_QWORD *)(v2 + 56) + 40 * v15;
    v17 = *(_QWORD *)v16;
    v18 = *(_BYTE *)(v16 + 24);
    v19 = *(_QWORD *)(v16 + 32);
    v20 = *(_OWORD *)(v16 + 8);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v21 = *(_QWORD *)(v4 + 56) + 40 * v15;
    *(_QWORD *)v21 = v17;
    *(_OWORD *)(v21 + 8) = v20;
    *(_BYTE *)(v21 + 24) = v18;
    *(_QWORD *)(v21 + 32) = v19;
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

void *sub_240B378A8()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887B8);
  v2 = *v0;
  v3 = sub_240B604A8();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_240B37A34()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887B0);
  v2 = *v0;
  v3 = sub_240B604A8();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_240B37BD4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887A8);
  v2 = *v0;
  v3 = sub_240B604A8();
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

uint64_t sub_240B37D80()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_240B37DA4()
{
  return swift_deallocObject();
}

_QWORD *sub_240B37DB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[3] = 0xD000000000000016;
  v0[4] = 0x8000000240B62810;
  v0[5] = 0xD00000000000001CLL;
  v0[6] = 0x8000000240B62830;
  v0[7] = 0xD000000000000018;
  v0[8] = 0x8000000240B62850;
  v0[9] = 0xD00000000000001ALL;
  v0[10] = 0x8000000240B628B0;
  v0[11] = 0xD00000000000001DLL;
  v0[12] = 0x8000000240B628D0;
  v0[13] = 0xD000000000000016;
  v0[14] = 0x8000000240B631F0;
  v0[15] = 0xD00000000000001FLL;
  v0[16] = 0x8000000240B63210;
  v0[17] = 0xD000000000000020;
  v0[18] = 0x8000000240B63230;
  v0[19] = 0xD00000000000001DLL;
  v0[20] = 0x8000000240B63260;
  v0[21] = 0xD00000000000001DLL;
  v0[22] = 0x8000000240B63280;
  v0[23] = 0xD000000000000013;
  v0[24] = 0x8000000240B632A0;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
  v5 = (void *)sub_240B600D0();
  v6 = objc_msgSend(v4, sel_containerURLForSecurityApplicationGroupIdentifier_, v5);

  if (v6)
  {
    sub_240B5FED8();

    v7 = sub_240B5FF14();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 0, 1, v7);
  }
  else
  {
    v8 = sub_240B5FF14();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  sub_240B34F40((uint64_t)v3, &qword_25435F000);
  v9 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v10 = (void *)sub_240B600D0();
  v11 = objc_msgSend(v9, sel_initWithSuiteName_, v10);

  v0[2] = v11;
  return v0;
}

void sub_240B38030(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;

  v2 = *(void **)(v1 + 16);
  if (v2)
  {
    v26 = a1[11];
    v27 = a1[13];
    v28 = a1[14];
    v29 = a1[15];
    v30 = a1[17];
    v31 = a1[19];
    v3 = v2;
    v4 = (void *)sub_240B600D0();
    v5 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v4, v5);

    v6 = (void *)sub_240B600D0();
    v7 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v6, v7);

    v8 = (void *)sub_240B600D0();
    v9 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v8, v9);

    v10 = (void *)sub_240B600D0();
    v11 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v10, v11);

    v12 = (void *)sub_240B600D0();
    v13 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v12, v13);

    if (v26)
      v14 = sub_240B600D0();
    else
      v14 = 0;
    v18 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v14, v18);
    swift_unknownObjectRelease();

    if (v27)
      v19 = sub_240B600D0();
    else
      v19 = 0;
    v20 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v19, v20);
    swift_unknownObjectRelease();

    v21 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setInteger_forKey_, v28, v21);

    v22 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setInteger_forKey_, v29, v22);

    if (v30)
      v23 = sub_240B600D0();
    else
      v23 = 0;
    v24 = (void *)sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v23, v24);
    swift_unknownObjectRelease();

    if (v31)
      v25 = sub_240B600D0();
    else
      v25 = 0;
    v32 = sub_240B600D0();
    objc_msgSend(v3, sel_setObject_forKey_, v25);

    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v15 = sub_240B60088();
    __swift_project_value_buffer(v15, (uint64_t)qword_25435F2B8);
    v32 = sub_240B60070();
    v16 = sub_240B60334();
    if (os_log_type_enabled(v32, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_240B2B000, v32, v16, "Failed to load user defaults for suite group.com.apple.mail", v17, 2u);
      MEMORY[0x24268A954](v17, -1, -1);
    }
  }

}

void sub_240B38414(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];

  v7 = *(void **)(v3 + 16);
  if (v7)
  {
    v8 = (void *)sub_240B600D0();
    v9 = objc_msgSend(v7, sel_valueForKey_, v8);

    if (v9)
    {
      sub_240B60400();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v15, 0, sizeof(v15));
    }
    sub_240B38714((uint64_t)v15, (uint64_t)&v16);
    if (*((_QWORD *)&v17 + 1))
    {
      sub_240B3875C(&v16, v18);
      sub_240B3875C(v18, (_OWORD *)a3);
      return;
    }
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_240B34F40((uint64_t)&v16, &qword_2570887C8);
  if (qword_25435F0A8 != -1)
    swift_once();
  v10 = sub_240B60088();
  __swift_project_value_buffer(v10, (uint64_t)qword_25435F2B8);
  swift_bridgeObjectRetain_n();
  v11 = sub_240B60070();
  v12 = sub_240B60334();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    *(_QWORD *)&v18[0] = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v16 = sub_240B335B4(a1, a2, (uint64_t *)v18);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_240B2B000, v11, v12, "Unable to find the value for key: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v14, -1, -1);
    MEMORY[0x24268A954](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE0D00];
  *(_QWORD *)a3 = 16718;
  *(_QWORD *)(a3 + 8) = 0xE200000000000000;
}

uint64_t BlackPearlSharedDefaults.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BlackPearlSharedDefaults.__deallocating_deinit()
{
  BlackPearlSharedDefaults.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_240B38714(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570887C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_240B3875C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for BlackPearlSharedDefaults()
{
  return objc_opt_self();
}

uint64_t method lookup function for BlackPearlSharedDefaults()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BlackPearlSharedDefaults.setBlackPearlTrialState(blackpearlVersion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of BlackPearlSharedDefaults.getValue(key:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

Swift::Void __swiftcall BlackPearlModel.destroy()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(int *)(type metadata accessor for BlackPearlModel(0) + 32);

  *(_QWORD *)(v0 + v1) = 0;
}

uint64_t type metadata accessor for BlackPearlModel(uint64_t a1)
{
  return sub_240B3A6D8(a1, (uint64_t *)&unk_25435F038);
}

uint64_t BlackPearlModel.init(name:version:compilePath:modelPath:model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  int *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t result;

  v16 = (int *)type metadata accessor for BlackPearlModel(0);
  v17 = v16[8];
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  v18 = (char *)a8 + v16[6];
  v19 = sub_240B5FF14();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
  v20(v18, a5, v19);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v20)((char *)a8 + v16[7], a6, v19);
  *(_QWORD *)((char *)a8 + v17) = a7;
  return result;
}

void __swiftcall BlackPearlVersion.init(modelVersion:senderModelVersion:tsModelVersion:finalRuleVersion:breakthroughVersion:blackPearlExperimentId:blackPearlExperimentTreatmentId:blackPearlExperimentDeploymentId:blackPearlRolloutDeploymentId:blackPearlRolloutFactorPackId:blackPearlRolloutId:blackPearlCategorizationVersion:)(MCCKitCategorization::BlackPearlVersion *__return_ptr retstr, Swift::String modelVersion, Swift::String senderModelVersion, Swift::String tsModelVersion, Swift::String finalRuleVersion, Swift::String breakthroughVersion, Swift::String_optional blackPearlExperimentId, Swift::String_optional blackPearlExperimentTreatmentId, Swift::Int blackPearlExperimentDeploymentId, Swift::Int blackPearlRolloutDeploymentId, Swift::String_optional blackPearlRolloutFactorPackId, Swift::String_optional blackPearlRolloutId, Swift::String blackPearlCategorizationVersion)
{
  uint64_t countAndFlagsBits;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  Swift::Int v21;
  __int128 v22;
  void *object;
  __int128 v24;
  Swift::Int v25;
  char v26;

  object = finalRuleVersion._object;
  countAndFlagsBits = finalRuleVersion._countAndFlagsBits;
  v14 = tsModelVersion._object;
  v15 = tsModelVersion._countAndFlagsBits;
  v16 = senderModelVersion._object;
  v17 = senderModelVersion._countAndFlagsBits;
  v18 = modelVersion._object;
  v19 = modelVersion._countAndFlagsBits;
  sub_240B3899C(blackPearlCategorizationVersion._countAndFlagsBits, (unint64_t)blackPearlCategorizationVersion._object, (uint64_t)&v24);
  v21 = v25;
  v22 = v24;
  LOBYTE(v24) = v26;
  retstr->blackPearlModelVersion._countAndFlagsBits = v19;
  retstr->blackPearlModelVersion._object = v18;
  retstr->blackPearlSenderModelVersion._countAndFlagsBits = v17;
  retstr->blackPearlSenderModelVersion._object = v16;
  retstr->blackPearlTSModelVersion._countAndFlagsBits = v15;
  retstr->blackPearlTSModelVersion._object = v14;
  retstr->blackPearlFinalRuleVersion._countAndFlagsBits = countAndFlagsBits;
  retstr->blackPearlFinalRuleVersion._object = object;
  retstr->blackPearlBreakthroughVersion = breakthroughVersion;
  retstr->blackPearlExperimentId = blackPearlExperimentId;
  retstr->blackPearlExperimentTreatmentId = blackPearlExperimentTreatmentId;
  *(_OWORD *)&retstr->blackPearlExperimentDeploymentId = *(_OWORD *)&blackPearlExperimentDeploymentId;
  retstr->blackPearlRolloutFactorPackId = blackPearlRolloutFactorPackId;
  retstr->blackPearlRolloutId = blackPearlRolloutId;
  *(_OWORD *)&retstr->blackPearlCategorizationVersion.value.major = v22;
  retstr->blackPearlCategorizationVersion.value.patch = v21;
  retstr->blackPearlCategorizationVersion.is_nil = v24;
}

uint64_t sub_240B3899C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int16 v12;
  unsigned __int8 *v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int16 v21;
  unsigned __int8 *v22;
  char v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  char v32;
  uint64_t result;
  _QWORD v34[4];
  _QWORD v35[2];

  v35[0] = 46;
  v35[1] = 0xE100000000000000;
  v34[2] = v35;
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B3D984, (uint64_t)v34, a1, a2);
  swift_bridgeObjectRelease();
  if (v6[2] != 3)
    goto LABEL_19;
  v7 = v6[4];
  v8 = v6[5];
  if (!((v8 ^ (unint64_t)v7) >> 14))
    goto LABEL_19;
  v10 = v6[6];
  v9 = v6[7];
  v11 = sub_240B3CAD0(v6[4], v6[5], v10, v9, 10);
  if ((v12 & 0x100) != 0)
  {
    swift_bridgeObjectRetain();
    v13 = sub_240B3C2A8(v7, v8, v10, v9, 10);
    v15 = v14;
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
    if ((v12 & 1) != 0)
      goto LABEL_19;
    v13 = (unsigned __int8 *)v11;
  }
  if (v6[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_23;
  }
  v16 = v6[8];
  v17 = v6[9];
  if (!((v17 ^ (unint64_t)v16) >> 14))
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v19 = v6[10];
  v18 = v6[11];
  v20 = sub_240B3CAD0(v6[8], v6[9], v19, v18, 10);
  if ((v21 & 0x100) == 0)
  {
    if ((v21 & 1) == 0)
    {
      v22 = (unsigned __int8 *)v20;
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  v22 = sub_240B3C2A8(v16, v17, v19, v18, 10);
  v24 = v23;
  swift_bridgeObjectRelease();
  if ((v24 & 1) != 0)
    goto LABEL_19;
LABEL_13:
  if (v6[2] < 3uLL)
  {
LABEL_23:
    __break(1u);
    goto LABEL_19;
  }
  v25 = v6[12];
  v26 = v6[13];
  v28 = v6[14];
  v27 = v6[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!((v26 ^ v25) >> 14))
    goto LABEL_19;
  v29 = sub_240B3CAD0(v25, v26, v28, v27, 10);
  if ((v30 & 0x100) != 0)
    v29 = (uint64_t)sub_240B3C2A8(v25, v26, v28, v27, 10);
  v31 = v29;
  v32 = v30;
  result = swift_bridgeObjectRelease();
  if ((v32 & 1) == 0)
  {
    *(_QWORD *)a3 = v13;
    *(_QWORD *)(a3 + 8) = v22;
    *(_QWORD *)(a3 + 16) = v31;
    *(_BYTE *)(a3 + 24) = 0;
    return result;
  }
LABEL_20:
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 24) = 1;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlModelVersion()()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  v1 = *v0;
  v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlSenderModelVersion()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlTSModelVersion()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlFinalRuleVersion()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(void **)(v0 + 56);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlBreakthroughVersion()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(void **)(v0 + 72);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::Int __swiftcall BlackPearlVersion.getBlackPearlDeploymentId()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlTreatmentId()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String_optional result;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(void **)(v0 + 104);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result.value._object = v4;
  result.value._countAndFlagsBits = v3;
  return result;
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlExperimentId()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String_optional result;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(void **)(v0 + 88);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result.value._object = v4;
  result.value._countAndFlagsBits = v3;
  return result;
}

Swift::Int __swiftcall BlackPearlVersion.getBlackPearlRolloutDeploymentId()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlRolloutFactorPackId()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String_optional result;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(void **)(v0 + 136);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result.value._object = v4;
  result.value._countAndFlagsBits = v3;
  return result;
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlRolloutId()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String_optional result;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void **)(v0 + 152);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  result.value._object = v4;
  result.value._countAndFlagsBits = v3;
  return result;
}

Swift::Bool __swiftcall BlackPearlVersion.isCatModelInMLModelFormat()()
{
  return sub_240B601FC();
}

Swift::Bool __swiftcall BlackPearlVersion.isSenderModelInMLModelFormat()()
{
  return sub_240B601FC();
}

Swift::Bool __swiftcall BlackPearlVersion.isTSModelInMLModelFormat()()
{
  return sub_240B601FC();
}

MCCKitCategorization::BlackPearlCategorizationVersion_optional __swiftcall BlackPearlVersion.getBlackPearlCategorizationVersion()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  MCCKitCategorization::BlackPearlCategorizationVersion_optional result;

  v2 = *(_QWORD *)(v1 + 176);
  v3 = *(_BYTE *)(v1 + 184);
  *(_OWORD *)v0 = *(_OWORD *)(v1 + 160);
  *(_QWORD *)(v0 + 16) = v2;
  *(_BYTE *)(v0 + 24) = v3;
  return result;
}

uint64_t sub_240B38DE8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240B38E24 + 4 * byte_240B61170[a1]))(0xD000000000000016, 0x8000000240B632E0);
}

uint64_t sub_240B38E24()
{
  uint64_t v0;

  return v0 - 1;
}

uint64_t sub_240B38EE4()
{
  unsigned __int8 *v0;

  return sub_240B38DE8(*v0);
}

uint64_t sub_240B38EEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B3CFC4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B38F10()
{
  return 0;
}

void sub_240B38F1C(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_240B38F28()
{
  sub_240B39374();
  return sub_240B60664();
}

uint64_t sub_240B38F50()
{
  sub_240B39374();
  return sub_240B60670();
}

uint64_t BlackPearlVersion.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  int v44;
  char v45;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570887D0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v37 = *(_QWORD *)(v1 + 24);
  v38 = v7;
  v8 = *(_QWORD *)(v1 + 32);
  v35 = *(_QWORD *)(v1 + 40);
  v36 = v8;
  v9 = *(_QWORD *)(v1 + 48);
  v33 = *(_QWORD *)(v1 + 56);
  v34 = v9;
  v10 = *(_QWORD *)(v1 + 72);
  v31 = *(_QWORD *)(v1 + 64);
  v32 = v10;
  v11 = *(_QWORD *)(v1 + 80);
  v29 = *(_QWORD *)(v1 + 88);
  v30 = v11;
  v12 = *(_QWORD *)(v1 + 96);
  v27 = *(_QWORD *)(v1 + 104);
  v28 = v12;
  v13 = *(_QWORD *)(v1 + 112);
  v25 = *(_QWORD *)(v1 + 120);
  v26 = v13;
  v14 = *(_QWORD *)(v1 + 136);
  v23 = *(_QWORD *)(v1 + 128);
  v24 = v14;
  v22 = *(_QWORD *)(v1 + 144);
  v21 = *(_QWORD *)(v1 + 152);
  v18 = *(_QWORD *)(v1 + 160);
  v19 = *(_QWORD *)(v1 + 168);
  v20 = *(_QWORD *)(v1 + 176);
  v44 = *(unsigned __int8 *)(v1 + 184);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B39374();
  sub_240B60658();
  LOBYTE(v40) = 0;
  v15 = v39;
  sub_240B60550();
  if (!v15)
  {
    LOBYTE(v40) = 1;
    sub_240B60550();
    LOBYTE(v40) = 2;
    sub_240B60550();
    v39 = v4;
    LOBYTE(v40) = 3;
    sub_240B60550();
    LOBYTE(v40) = 4;
    sub_240B60550();
    LOBYTE(v40) = 5;
    sub_240B60538();
    LOBYTE(v40) = 6;
    sub_240B60538();
    LOBYTE(v40) = 7;
    sub_240B60568();
    LOBYTE(v40) = 8;
    sub_240B60568();
    LOBYTE(v40) = 9;
    sub_240B60538();
    LOBYTE(v40) = 10;
    sub_240B60538();
    v40 = v18;
    v41 = v19;
    v42 = v20;
    v43 = v44;
    v45 = 11;
    sub_240B393B8();
    sub_240B60544();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_240B39374()
{
  unint64_t result;

  result = qword_2570887D8;
  if (!qword_2570887D8)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61644, &type metadata for BlackPearlVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570887D8);
  }
  return result;
}

unint64_t sub_240B393B8()
{
  unint64_t result;

  result = qword_2570887E0;
  if (!qword_2570887E0)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for BlackPearlCategorizationVersion, &type metadata for BlackPearlCategorizationVersion);
    atomic_store(result, (unint64_t *)&qword_2570887E0);
  }
  return result;
}

uint64_t BlackPearlVersion.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  _QWORD *v65;
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
  _OWORD v76[2];
  _QWORD v77[23];
  char v78;
  __int128 v79;
  uint64_t v80;
  char v81;
  char v82;
  char v83;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570887E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v65 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_240B39374();
  sub_240B6064C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v65);
  LOBYTE(v77[0]) = 0;
  v10 = sub_240B604FC();
  v12 = v11;
  LOBYTE(v77[0]) = 1;
  swift_bridgeObjectRetain();
  v58 = sub_240B604FC();
  v59 = v10;
  LOBYTE(v77[0]) = 2;
  v14 = v13;
  swift_bridgeObjectRetain();
  v15 = sub_240B604FC();
  v64 = v14;
  v57 = v15;
  LOBYTE(v77[0]) = 3;
  v17 = v16;
  swift_bridgeObjectRetain();
  v18 = sub_240B604FC();
  v63 = v17;
  v56 = v18;
  LOBYTE(v77[0]) = 4;
  v20 = v19;
  swift_bridgeObjectRetain();
  v21 = sub_240B604FC();
  v62 = v20;
  v55 = v21;
  LOBYTE(v77[0]) = 5;
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_240B604E4();
  v61 = v23;
  v54 = v24;
  LOBYTE(v77[0]) = 6;
  v26 = v25;
  swift_bridgeObjectRetain();
  v27 = sub_240B604E4();
  v60 = v26;
  v53 = v27;
  LOBYTE(v77[0]) = 7;
  v29 = v28;
  swift_bridgeObjectRetain();
  v50 = sub_240B60514();
  v52 = v29;
  LOBYTE(v77[0]) = 8;
  v49 = sub_240B60514();
  LOBYTE(v77[0]) = 9;
  v48 = sub_240B604E4();
  v51 = v30;
  LOBYTE(v77[0]) = 10;
  swift_bridgeObjectRetain();
  v47 = sub_240B604E4();
  v32 = v31;
  v83 = 11;
  sub_240B39D1C();
  swift_bridgeObjectRetain();
  sub_240B604F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v45 = *((_QWORD *)&v79 + 1);
  v46 = v79;
  v44 = v80;
  v82 = v81;
  *(_QWORD *)&v66 = v59;
  *((_QWORD *)&v66 + 1) = v12;
  v33 = v64;
  *(_QWORD *)&v67 = v58;
  *((_QWORD *)&v67 + 1) = v64;
  *(_QWORD *)&v68 = v57;
  *((_QWORD *)&v68 + 1) = v63;
  v34 = v61;
  *(_QWORD *)&v69 = v56;
  *((_QWORD *)&v69 + 1) = v62;
  *(_QWORD *)&v70 = v55;
  *((_QWORD *)&v70 + 1) = v61;
  *(_QWORD *)&v71 = v54;
  *((_QWORD *)&v71 + 1) = v60;
  *(_QWORD *)&v72 = v53;
  *((_QWORD *)&v72 + 1) = v52;
  *(_QWORD *)&v73 = v50;
  *((_QWORD *)&v73 + 1) = v49;
  *(_QWORD *)&v74 = v48;
  *((_QWORD *)&v74 + 1) = v51;
  *(_QWORD *)&v75 = v47;
  *((_QWORD *)&v75 + 1) = v32;
  v76[0] = v79;
  *(_QWORD *)&v76[1] = v80;
  BYTE8(v76[1]) = v81;
  sub_240B2CA34((uint64_t)&v66);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v35 = v52;
  swift_bridgeObjectRelease();
  v36 = v51;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v37 = v75;
  a2[8] = v74;
  a2[9] = v37;
  a2[10] = v76[0];
  *(_OWORD *)((char *)a2 + 169) = *(_OWORD *)((char *)v76 + 9);
  v38 = v71;
  a2[4] = v70;
  a2[5] = v38;
  v39 = v73;
  a2[6] = v72;
  a2[7] = v39;
  v40 = v67;
  *a2 = v66;
  a2[1] = v40;
  v41 = v69;
  a2[2] = v68;
  a2[3] = v41;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v65);
  v77[0] = v59;
  v77[1] = v12;
  v77[2] = v58;
  v77[3] = v33;
  v77[4] = v57;
  v77[5] = v63;
  v77[6] = v56;
  v77[7] = v62;
  v77[8] = v55;
  v77[9] = v34;
  v77[10] = v54;
  v77[11] = v60;
  v77[12] = v53;
  v77[13] = v35;
  v77[14] = v50;
  v77[15] = v49;
  v77[16] = v48;
  v77[17] = v36;
  v77[18] = v47;
  v77[19] = v32;
  v77[20] = v46;
  v77[21] = v45;
  v77[22] = v44;
  v78 = v82;
  return sub_240B39D60((uint64_t)v77);
}

unint64_t sub_240B39D1C()
{
  unint64_t result;

  result = qword_2570887F0;
  if (!qword_2570887F0)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for BlackPearlCategorizationVersion, &type metadata for BlackPearlCategorizationVersion);
    atomic_store(result, (unint64_t *)&qword_2570887F0);
  }
  return result;
}

uint64_t sub_240B39D60(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_240B39E08@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return BlackPearlVersion.init(from:)(a1, a2);
}

uint64_t sub_240B39E1C(_QWORD *a1)
{
  return BlackPearlVersion.encode(to:)(a1);
}

void __swiftcall BlackPearlThreshold.init(thresholdCommerce:thresholdEmployeeNews:thresholdEmployee:thresholdPersonal:thresholdP2C:thresholdSender:thresholdTS:thresholdCategoryTS:thresholdCorpEmployee:tsSenderMaxTokens:tsSubjectMaxTokens:)(MCCKitCategorization::BlackPearlThreshold *__return_ptr retstr, Swift::Double thresholdCommerce, Swift::Double thresholdEmployeeNews, Swift::Double thresholdEmployee, Swift::Double thresholdPersonal, Swift::Double thresholdP2C, Swift::Double thresholdSender, Swift::Double thresholdTS, Swift::Double thresholdCategoryTS, Swift::Double thresholdCorpEmployee, Swift::Int tsSenderMaxTokens, Swift::Int tsSubjectMaxTokens)
{
  retstr->thresholdCommerce = thresholdCommerce;
  retstr->thresholdEmployeeNews = thresholdEmployeeNews;
  retstr->thresholdEmployee = thresholdEmployee;
  retstr->thresholdPersonal = thresholdPersonal;
  retstr->thresholdP2C = thresholdP2C;
  retstr->thresholdSender = thresholdSender;
  retstr->thresholdTS = thresholdTS;
  retstr->thresholdCategoryTS = thresholdCategoryTS;
  retstr->thresholdCorpEmployee = thresholdCorpEmployee;
  retstr->tsSenderMaxTokens = tsSenderMaxTokens;
  retstr->tsSubjectMaxTokens = tsSubjectMaxTokens;
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdCommerce()()
{
  Swift::Double *v0;

  return *v0;
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdEmployeeNews()()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

Swift::Double __swiftcall BlackPearlThreshold.getthresholdEmployee()()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdPersonal()()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdP2C()()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdSender()()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdTS()()
{
  uint64_t v0;

  return *(double *)(v0 + 48);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdCategoryTS()()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdCorpEmployee()()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

Swift::Int __swiftcall BlackPearlThreshold.getTSSenderMaxTokens()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

Swift::Int __swiftcall BlackPearlThreshold.getTSSubjectMaxTokens()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t sub_240B39EA8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_240B39EE0 + 4 * byte_240B6117C[a1]))(0xD000000000000011, 0x8000000240B63470);
}

uint64_t sub_240B39EE0(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_240B39F90()
{
  unsigned __int8 *v0;

  return sub_240B39EA8(*v0);
}

uint64_t sub_240B39F98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B3D400(a1, a2);
  *a3 = result;
  return result;
}

void sub_240B39FBC(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_240B39FC8()
{
  sub_240B3A2DC();
  return sub_240B60664();
}

uint64_t sub_240B39FF0()
{
  sub_240B3A2DC();
  return sub_240B60670();
}

uint64_t BlackPearlThreshold.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[3];
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570887F8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[2] = *(_QWORD *)(v1 + 8);
  v9[1] = *(_QWORD *)(v1 + 72);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B3A2DC();
  sub_240B60658();
  v20 = 0;
  sub_240B6055C();
  if (!v2)
  {
    v19 = 1;
    sub_240B6055C();
    v18 = 2;
    sub_240B6055C();
    v17 = 3;
    sub_240B6055C();
    v16 = 4;
    sub_240B6055C();
    v15 = 5;
    sub_240B6055C();
    v14 = 6;
    sub_240B6055C();
    v13 = 7;
    sub_240B6055C();
    v12 = 8;
    sub_240B6055C();
    v11 = 9;
    sub_240B60568();
    v10 = 10;
    sub_240B60568();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_240B3A2DC()
{
  unint64_t result;

  result = qword_257088800;
  if (!qword_257088800)
  {
    result = MEMORY[0x24268A8B8](&unk_240B615F4, &type metadata for BlackPearlThreshold.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088800);
  }
  return result;
}

uint64_t BlackPearlThreshold.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088808);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B3A2DC();
  sub_240B6064C();
  if (!v2)
  {
    v41 = 0;
    sub_240B60508();
    v10 = v9;
    v40 = 1;
    sub_240B60508();
    v12 = v11;
    v39 = 2;
    sub_240B60508();
    v14 = v13;
    v38 = 3;
    sub_240B60508();
    v16 = v15;
    v37 = 4;
    sub_240B60508();
    v18 = v17;
    v36 = 5;
    sub_240B60508();
    v20 = v19;
    v35 = 6;
    sub_240B60508();
    v22 = v21;
    v34 = 7;
    sub_240B60508();
    v30 = v23;
    v33 = 8;
    sub_240B60508();
    v25 = v24;
    v32 = 9;
    v27 = sub_240B60514();
    v31 = 10;
    v28 = sub_240B60514();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
    a2[1] = v12;
    a2[2] = v14;
    a2[3] = v16;
    a2[4] = v18;
    a2[5] = v20;
    v29 = v30;
    a2[6] = v22;
    a2[7] = v29;
    a2[8] = v25;
    a2[9] = v27;
    a2[10] = v28;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_240B3A60C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return BlackPearlThreshold.init(from:)(a1, a2);
}

uint64_t sub_240B3A620(_QWORD *a1)
{
  return BlackPearlThreshold.encode(to:)(a1);
}

uint64_t BloomFilterData.init(commerceFilePath:subCategoryFilePath:nerFilePath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  void (*v11)(uint64_t, uint64_t, uint64_t);

  v8 = sub_240B5FF14();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
  v11(a4, a1, v8);
  v9 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)(a4 + *(int *)(v9 + 20)) = a2;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a4 + *(int *)(v9 + 24), a3, v8);
}

uint64_t type metadata accessor for BloomFilterData(uint64_t a1)
{
  return sub_240B3A6D8(a1, (uint64_t *)&unk_25435F048);
}

uint64_t sub_240B3A6D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t BloomFilterData.getCommerceFilePath()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_240B5FF14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t BloomFilterData.getSubCategoryFilePath()()
{
  type metadata accessor for BloomFilterData(0);
  return swift_bridgeObjectRetain();
}

uint64_t BloomFilterData.getNerFilePath()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BloomFilterData(0) + 24);
  v4 = sub_240B5FF14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

Swift::String __swiftcall BlackPearlCategorizationVersion.getVersionString()()
{
  void *v0;
  uint64_t v1;
  void *v2;
  Swift::String result;
  uint64_t v4;
  void *v5;

  v4 = sub_240B60598();
  v5 = v0;
  sub_240B60184();
  sub_240B60598();
  sub_240B60184();
  swift_bridgeObjectRelease();
  sub_240B60184();
  sub_240B60598();
  sub_240B60184();
  swift_bridgeObjectRelease();
  v1 = v4;
  v2 = v5;
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getMajorVersion()()
{
  Swift::Int *v0;

  return *v0;
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getMinorVersion()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getPatchVersion()()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_240B3A898()
{
  char *v0;

  return *(_QWORD *)&aMajor_0[8 * *v0];
}

uint64_t sub_240B3A8B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B3D848(a1, a2);
  *a3 = result;
  return result;
}

void sub_240B3A8D4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_240B3A8E0()
{
  sub_240B3AA7C();
  return sub_240B60664();
}

uint64_t sub_240B3A908()
{
  sub_240B3AA7C();
  return sub_240B60670();
}

uint64_t BlackPearlCategorizationVersion.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];
  char v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088810);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 8);
  v10[0] = *(_QWORD *)(v1 + 16);
  v10[1] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B3AA7C();
  sub_240B60658();
  v13 = 0;
  sub_240B60568();
  if (!v2)
  {
    v12 = 1;
    sub_240B60568();
    v11 = 2;
    sub_240B60568();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_240B3AA7C()
{
  unint64_t result;

  result = qword_257088818;
  if (!qword_257088818)
  {
    result = MEMORY[0x24268A8B8](&unk_240B615A4, &type metadata for BlackPearlCategorizationVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088818);
  }
  return result;
}

uint64_t BlackPearlCategorizationVersion.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088820);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B3AA7C();
  sub_240B6064C();
  if (!v2)
  {
    v16 = 0;
    v9 = sub_240B60514();
    v15 = 1;
    v11 = sub_240B60514();
    v14 = 2;
    v12 = sub_240B60514();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_240B3AC34@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return BlackPearlCategorizationVersion.init(from:)(a1, a2);
}

uint64_t sub_240B3AC48(_QWORD *a1)
{
  return BlackPearlCategorizationVersion.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for BlackPearlVersion(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BlackPearlVersion()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BlackPearlVersion(uint64_t a1, uint64_t a2)
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
  __int128 v12;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v10;
  v11 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v11;
  v12 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
  *(_OWORD *)(a1 + 160) = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BlackPearlVersion(uint64_t a1, uint64_t a2)
{
  __int128 v4;

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
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
  *(_OWORD *)(a1 + 160) = v4;
  return a1;
}

__n128 __swift_memcpy185_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  result = (__n128)a2[8];
  v9 = a2[9];
  v10 = a2[10];
  *(_OWORD *)(a1 + 169) = *(__int128 *)((char *)a2 + 169);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for BlackPearlVersion(uint64_t a1, uint64_t a2)
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
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  v11 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v12;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlVersion(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 185))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BlackPearlVersion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 184) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 185) = 1;
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
    *(_BYTE *)(result + 185) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlVersion()
{
  return &type metadata for BlackPearlVersion;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BlackPearlThreshold(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 88))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BlackPearlThreshold(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 88) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlThreshold()
{
  return &type metadata for BlackPearlThreshold;
}

char *initializeBufferWithCopyOfBuffer for BloomFilterData(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_240B5FF14();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    v9 = *(int *)(a3 + 24);
    *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v10 = &a1[v9];
    v11 = (char *)a2 + v9;
    swift_bridgeObjectRetain();
    v8(v10, v11, v7);
  }
  return a1;
}

uint64_t destroy for BloomFilterData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_240B5FF14();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 24), v4);
}

uint64_t initializeWithCopy for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_240B5FF14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v9 = a1 + v8;
  v10 = a2 + v8;
  swift_bridgeObjectRetain();
  v7(v9, v10, v6);
  return a1;
}

uint64_t assignWithCopy for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_240B5FF14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t initializeWithTake for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_240B5FF14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v7(a1 + v8, a2 + v8, v6);
  return a1;
}

uint64_t assignWithTake for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_240B5FF14();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B3B4DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_240B5FF14();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilterData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B3B564(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_240B5FF14();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_240B3B5DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240B5FF14();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for BlackPearlModel(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = *((_QWORD *)a2 + 3);
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 3) = v8;
    v9 = a3[6];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_240B5FF14();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v13(&v4[a3[7]], &a2[a3[7]], v12);
    v14 = a3[8];
    v15 = *(void **)&a2[v14];
    *(_QWORD *)&v4[v14] = v15;
    v16 = v15;
  }
  return v4;
}

void destroy for BlackPearlModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_240B5FF14();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[7], v5);

}

char *initializeWithCopy for BlackPearlModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  void *v14;
  id v15;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_240B5FF14();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v12(&a1[a3[7]], &a2[a3[7]], v11);
  v13 = a3[8];
  v14 = *(void **)&a2[v13];
  *(_QWORD *)&a1[v13] = v14;
  v15 = v14;
  return a1;
}

char *assignWithCopy for BlackPearlModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_240B5FF14();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  v11 = a3[8];
  v12 = *(void **)&a1[v11];
  v13 = *(void **)&a2[v11];
  *(_QWORD *)&a1[v11] = v13;
  v14 = v13;

  return a1;
}

char *initializeWithTake for BlackPearlModel(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  v7 = a3[6];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_240B5FF14();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[7]], &a2[a3[7]], v10);
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  return a1;
}

char *assignWithTake for BlackPearlModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  void *v14;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_240B5FF14();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v12(&a1[a3[7]], &a2[a3[7]], v11);
  v13 = a3[8];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B3BAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_240B5FF14();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for BlackPearlModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B3BB38(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_240B5FF14();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_240B3BBAC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240B5FF14();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BlackPearlCategorizationVersion(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BlackPearlCategorizationVersion(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BlackPearlCategorizationVersion()
{
  return &type metadata for BlackPearlCategorizationVersion;
}

uint64_t storeEnumTagSinglePayload for BlackPearlCategorizationVersion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B3BCE8 + 4 * byte_240B6118C[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240B3BD1C + 4 * byte_240B61187[v4]))();
}

uint64_t sub_240B3BD1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3BD24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B3BD2CLL);
  return result;
}

uint64_t sub_240B3BD38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B3BD40);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240B3BD44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3BD4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlCategorizationVersion.CodingKeys()
{
  return &type metadata for BlackPearlCategorizationVersion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for BlackPearlThreshold.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
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
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BlackPearlThreshold.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B3BE44 + 4 * byte_240B61196[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_240B3BE78 + 4 * byte_240B61191[v4]))();
}

uint64_t sub_240B3BE78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3BE80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B3BE88);
  return result;
}

uint64_t sub_240B3BE94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B3BE9CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_240B3BEA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3BEA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlThreshold.CodingKeys()
{
  return &type metadata for BlackPearlThreshold.CodingKeys;
}

uint64_t getEnumTagSinglePayload for BlackPearlVersion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BlackPearlVersion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_240B3BFA0 + 4 * byte_240B611A0[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_240B3BFD4 + 4 * byte_240B6119B[v4]))();
}

uint64_t sub_240B3BFD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3BFDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B3BFE4);
  return result;
}

uint64_t sub_240B3BFF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B3BFF8);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_240B3BFFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3C004(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlVersion.CodingKeys()
{
  return &type metadata for BlackPearlVersion.CodingKeys;
}

unint64_t sub_240B3C024()
{
  unint64_t result;

  result = qword_257088828;
  if (!qword_257088828)
  {
    result = MEMORY[0x24268A8B8](&unk_240B6140C, &type metadata for BlackPearlVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088828);
  }
  return result;
}

unint64_t sub_240B3C06C()
{
  unint64_t result;

  result = qword_257088830;
  if (!qword_257088830)
  {
    result = MEMORY[0x24268A8B8](&unk_240B614C4, &type metadata for BlackPearlThreshold.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088830);
  }
  return result;
}

unint64_t sub_240B3C0B4()
{
  unint64_t result;

  result = qword_257088838;
  if (!qword_257088838)
  {
    result = MEMORY[0x24268A8B8](&unk_240B6157C, &type metadata for BlackPearlCategorizationVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088838);
  }
  return result;
}

unint64_t sub_240B3C0FC()
{
  unint64_t result;

  result = qword_257088840;
  if (!qword_257088840)
  {
    result = MEMORY[0x24268A8B8](&unk_240B614EC, &type metadata for BlackPearlCategorizationVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088840);
  }
  return result;
}

unint64_t sub_240B3C144()
{
  unint64_t result;

  result = qword_257088848;
  if (!qword_257088848)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61514, &type metadata for BlackPearlCategorizationVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088848);
  }
  return result;
}

unint64_t sub_240B3C18C()
{
  unint64_t result;

  result = qword_257088850;
  if (!qword_257088850)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61434, &type metadata for BlackPearlThreshold.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088850);
  }
  return result;
}

unint64_t sub_240B3C1D4()
{
  unint64_t result;

  result = qword_257088858;
  if (!qword_257088858)
  {
    result = MEMORY[0x24268A8B8](&unk_240B6145C, &type metadata for BlackPearlThreshold.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088858);
  }
  return result;
}

unint64_t sub_240B3C21C()
{
  unint64_t result;

  result = qword_257088860;
  if (!qword_257088860)
  {
    result = MEMORY[0x24268A8B8](&unk_240B6137C, &type metadata for BlackPearlVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088860);
  }
  return result;
}

unint64_t sub_240B3C264()
{
  unint64_t result;

  result = qword_257088868;
  if (!qword_257088868)
  {
    result = MEMORY[0x24268A8B8](&unk_240B613A4, &type metadata for BlackPearlVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088868);
  }
  return result;
}

unsigned __int8 *sub_240B3C2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_240B3D9A0();
  swift_bridgeObjectRetain();
  v7 = sub_240B60214();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_240B3C614();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_240B60460();
  }
LABEL_7:
  v13 = sub_240B3C398(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_240B3C398(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

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
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
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
              v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12)))
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
      goto LABEL_66;
    }
    if (a2)
    {
      v23 = a3 + 48;
      v24 = a3 + 55;
      v25 = a3 + 87;
      if (a3 > 10)
      {
        v23 = 58;
      }
      else
      {
        v25 = 97;
        v24 = 65;
      }
      if (result)
      {
        v26 = 0;
        do
        {
          v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v13 = 0;
              if (v27 < 0x61 || v27 >= v25)
                return (unsigned __int8 *)v13;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
            return 0;
          v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v15 = a2 - 1;
  if (a2 == 1)
    return 0;
  v16 = a3 + 48;
  v17 = a3 + 55;
  v18 = a3 + 87;
  if (a3 > 10)
  {
    v16 = 58;
  }
  else
  {
    v18 = 97;
    v17 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v19 = result + 1;
  do
  {
    v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        v13 = 0;
        if (v20 < 0x61 || v20 >= v18)
          return (unsigned __int8 *)v13;
        v21 = -87;
      }
      else
      {
        v21 = -55;
      }
    }
    else
    {
      v21 = -48;
    }
    v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21)))
      return 0;
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_240B3C614()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_240B60220();
  v4 = sub_240B3C690(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_240B3C690(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_240B3C7D4(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_240B400C8(v9, 0);
      v12 = sub_240B3C8C0((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x242689FF4](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x242689FF4);
LABEL_9:
      sub_240B60460();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x242689FF4]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_240B3C7D4(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_240B545E4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_240B545E4(a2, a3, a4);
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
    return sub_240B601C0();
  }
  __break(1u);
  return result;
}

unint64_t sub_240B3C8C0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_240B545E4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_240B601CC();
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
          result = sub_240B60460();
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
    result = sub_240B545E4(v12, a6, a7);
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
    v12 = sub_240B601A8();
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

uint64_t sub_240B3CAD0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  char v13;
  _QWORD v14[2];
  char v15;

  if ((a4 & 0x1000000000000000) != 0)
  {
    result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_240B60460();
  }
  result = sub_240B3CBA0((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_240B3CBA0(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  uint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unsigned int v36;
  char v37;
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  unsigned int v43;
  char v44;
  uint64_t v45;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_240B545E4(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_95;
  result = sub_240B601C0();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_240B545E4(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_240B545E4(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_91;
  if (v17 < a3 >> 16)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  result = sub_240B601C0();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_90;
  }
  if (v18 < v15)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v31 = a6 + 48;
        v32 = a6 + 55;
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v31 = 58;
        }
        else
        {
          v33 = 97;
          v32 = 65;
        }
        if (v19)
        {
          v24 = 0;
          v34 = v19 + 1;
          v35 = result - 1;
          do
          {
            v36 = *v34;
            if (v36 < 0x30 || v36 >= v31)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                v29 = 0;
                if (v36 < 0x61 || v36 >= v33)
                  return v29;
                v37 = -87;
              }
              else
              {
                v37 = -55;
              }
            }
            else
            {
              v37 = -48;
            }
            v38 = v24 * a6;
            if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
              return 0;
            v24 = v38 + (v36 + v37);
            if (__OFADD__(v38, (v36 + v37)))
              return 0;
            ++v34;
            --v35;
          }
          while (v35);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_94;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v39 = a6 + 48;
      v40 = a6 + 55;
      v41 = a6 + 87;
      if (a6 > 10)
      {
        v39 = 58;
      }
      else
      {
        v41 = 97;
        v40 = 65;
      }
      if (v19)
      {
        v42 = 0;
        do
        {
          v43 = *v19;
          if (v43 < 0x30 || v43 >= v39)
          {
            if (v43 < 0x41 || v43 >= v40)
            {
              v29 = 0;
              if (v43 < 0x61 || v43 >= v41)
                return v29;
              v44 = -87;
            }
            else
            {
              v44 = -55;
            }
          }
          else
          {
            v44 = -48;
          }
          v45 = v42 * a6;
          if ((unsigned __int128)(v42 * (__int128)a6) >> 64 != (v42 * a6) >> 63)
            return 0;
          v42 = v45 + (v43 + v44);
          if (__OFADD__(v45, (v43 + v44)))
            return 0;
          ++v19;
          --result;
        }
        while (result);
        return v45 + (v43 + v44);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 48;
      v22 = a6 + 55;
      v23 = a6 + 87;
      if (a6 > 10)
      {
        v21 = 58;
      }
      else
      {
        v23 = 97;
        v22 = 65;
      }
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              if (v27 < 0x61 || v27 >= v23)
                return v29;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v30 = v24 * a6;
          if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
            return 0;
          v24 = v30 - (v27 + v28);
          if (__OFSUB__(v30, (v27 + v28)))
            return 0;
          ++v25;
          if (!--v26)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_240B3CFC4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000016 && a2 == 0x8000000240B632E0 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000240B63300 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000240B63320 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000240B63340 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000240B63360 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000240B63380 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x8000000240B633A0 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x8000000240B633C0 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000240B633F0 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000240B63410 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000240B63430 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x8000000240B63450)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v5 = sub_240B605A4();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_240B3D400(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000240B63470 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000240B63490 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000240B634B0 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000240B634D0 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6F687365726874 && a2 == 0xEC00000043325064 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C6F687365726874 && a2 == 0xEF7265646E655364 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C6F687365726874 && a2 == 0xEB00000000535464 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000240B634F0 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000240B63510 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000240B63530 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000240B63550)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    v5 = sub_240B605A4();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 10;
    else
      return 11;
  }
}

uint64_t sub_240B3D848(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x726F6A616DLL && a2 == 0xE500000000000000;
  if (v2 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6E696DLL && a2 == 0xE500000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6863746170 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_240B605A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_240B3D984(_QWORD *a1)
{
  uint64_t v1;

  return sub_240B5678C(a1, *(_QWORD **)(v1 + 16)) & 1;
}

unint64_t sub_240B3D9A0()
{
  unint64_t result;

  result = qword_257088870;
  if (!qword_257088870)
  {
    result = MEMORY[0x24268A8B8](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_257088870);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BitMap(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BitMap()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for BitMap(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for BitMap(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitMap(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BitMap(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BitMap()
{
  return &type metadata for BitMap;
}

uint64_t sub_240B3DB5C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;

  v11 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088878);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B3DDF8();
  sub_240B60658();
  v15 = a2;
  v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088888);
  sub_240B3E1CC(&qword_257088890, MEMORY[0x24BEE4268], MEMORY[0x24BEE12A0]);
  sub_240B60574();
  if (!v3)
  {
    v13 = 1;
    sub_240B60568();
    v12 = 2;
    sub_240B60568();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_240B3DCE0()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7374656B637562;
  if (*v0 != 1)
    v1 = 0x6E6F697469736F70;
  if (*v0)
    return v1;
  else
    return 0x70614D746962;
}

uint64_t sub_240B3DD3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B3DE80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B3DD60()
{
  sub_240B3DDF8();
  return sub_240B60664();
}

uint64_t sub_240B3DD88()
{
  sub_240B3DDF8();
  return sub_240B60670();
}

uint64_t sub_240B3DDB0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_240B3DFD8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_240B3DDDC(_QWORD *a1)
{
  uint64_t *v1;

  return sub_240B3DB5C(a1, *v1, v1[1]);
}

unint64_t sub_240B3DDF8()
{
  unint64_t result;

  result = qword_257088880;
  if (!qword_257088880)
  {
    result = MEMORY[0x24268A8B8](&unk_240B617F0, &type metadata for BitMap.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257088880);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24268A8AC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_240B3DE80(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x70614D746962 && a2 == 0xE600000000000000;
  if (v2 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7374656B637562 && a2 == 0xE700000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697469736F70 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_240B605A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_240B3DFD8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[8];
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088898);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_240B3DDF8();
  sub_240B6064C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088888);
    v9[7] = 0;
    sub_240B3E1CC(&qword_2570888A0, MEMORY[0x24BEE4290], MEMORY[0x24BEE12D0]);
    sub_240B60520();
    v7 = v10;
    v9[6] = 1;
    swift_bridgeObjectRetain();
    sub_240B60514();
    v9[5] = 2;
    sub_240B60514();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_240B3E1CC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257088888);
    v8 = a2;
    result = MEMORY[0x24268A8B8](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BitMap.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B3E278 + 4 * byte_240B616B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240B3E2AC + 4 * asc_240B616B0[v4]))();
}

uint64_t sub_240B3E2AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3E2B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B3E2BCLL);
  return result;
}

uint64_t sub_240B3E2C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B3E2D0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240B3E2D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B3E2DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BitMap.CodingKeys()
{
  return &type metadata for BitMap.CodingKeys;
}

unint64_t sub_240B3E2FC()
{
  unint64_t result;

  result = qword_2570888A8;
  if (!qword_2570888A8)
  {
    result = MEMORY[0x24268A8B8](&unk_240B617C8, &type metadata for BitMap.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570888A8);
  }
  return result;
}

unint64_t sub_240B3E344()
{
  unint64_t result;

  result = qword_2570888B0;
  if (!qword_2570888B0)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61738, &type metadata for BitMap.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570888B0);
  }
  return result;
}

unint64_t sub_240B3E38C()
{
  unint64_t result;

  result = qword_2570888B8;
  if (!qword_2570888B8)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61760, &type metadata for BitMap.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570888B8);
  }
  return result;
}

uint64_t sub_240B3E3D4(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_240B60484();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_240B60268();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_240B3E48C(unsigned int a1, unint64_t a2)
{
  uint64_t result;
  unsigned int *v5;
  unint64_t v6;
  int32x4_t v7;
  int32x4_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_240B60484();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = sub_240B60268();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unsigned int *)(result + 32);
  if (a2 < 8)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFF8;
  v5 += a2 & 0xFFFFFFFFFFFFFFF8;
  v7 = vdupq_n_s32(a1);
  v8 = (int32x4_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 8;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

uint64_t sub_240B3E574(unint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_240B60484();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = sub_240B60268();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  v7 = vdupq_n_s64(a1);
  v8 = (int64x2_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

void BloomFilter.init(numHashFunction:numBuckets:)(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  size_t v7;
  uint64_t v8;

  if ((a2 & 7) != 0)
  {
    sub_240B60490();
    __break(1u);
LABEL_10:
    sub_240B60484();
    __break(1u);
    return;
  }
  v5 = a2 + 7;
  if (a2 >= 0)
    v5 = a2;
  if (a2 <= -8)
    goto LABEL_10;
  v7 = v5 >> 3;
  if ((unint64_t)a2 < 8)
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v8 = sub_240B60268();
    *(_QWORD *)(v8 + 16) = v7;
    bzero((void *)(v8 + 32), v7);
  }
  *(_QWORD *)a3 = v8;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = v7;
  *(_BYTE *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = a2;
}

uint64_t sub_240B3E794()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x46687361486D756ELL;
  if (*v0 != 1)
    v1 = 0x656B6375426D756ELL;
  if (*v0)
    return v1;
  else
    return 0x70614D746962;
}

uint64_t sub_240B3E7FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_240B40270(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_240B3E820()
{
  sub_240B3E9EC();
  return sub_240B60664();
}

uint64_t sub_240B3E848()
{
  sub_240B3E9EC();
  return sub_240B60670();
}

uint64_t BloomFilter.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  char v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570888C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  v8 = *((_QWORD *)v1 + 2);
  v14 = *((unsigned __int8 *)v1 + 24);
  v10[1] = *((_QWORD *)v1 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B3E9EC();
  sub_240B60658();
  v12 = v11;
  v13 = v8;
  v15 = 0;
  sub_240B3EA30();
  sub_240B60574();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_240B60580();
    LOBYTE(v12) = 2;
    sub_240B60568();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_240B3E9EC()
{
  unint64_t result;

  result = qword_2570888C8;
  if (!qword_2570888C8)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61984, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570888C8);
  }
  return result;
}

unint64_t sub_240B3EA30()
{
  unint64_t result;

  result = qword_2570888D0;
  if (!qword_2570888D0)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61704, &type metadata for BitMap);
    atomic_store(result, (unint64_t *)&qword_2570888D0);
  }
  return result;
}

uint64_t BloomFilter.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570888D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_240B3E9EC();
  sub_240B6064C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v21 = 0;
  sub_240B3EC5C();
  sub_240B60520();
  v9 = v17;
  v16 = v18;
  v10 = v19;
  LOBYTE(v17) = 1;
  swift_bridgeObjectRetain();
  v20 = sub_240B6052C();
  v15 = v10;
  LOBYTE(v17) = 2;
  v11 = sub_240B60514();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = v16;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v13;
  *(_QWORD *)(a2 + 16) = v15;
  *(_BYTE *)(a2 + 24) = v20;
  *(_QWORD *)(a2 + 32) = v11;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_240B3EC5C()
{
  unint64_t result;

  result = qword_2570888E0;
  if (!qword_2570888E0)
  {
    result = MEMORY[0x24268A8B8](&unk_240B616DC, &type metadata for BitMap);
    atomic_store(result, (unint64_t *)&qword_2570888E0);
  }
  return result;
}

uint64_t sub_240B3ECA0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return BloomFilter.init(from:)(a1, a2);
}

uint64_t sub_240B3ECB4(_QWORD *a1)
{
  return BloomFilter.encode(to:)(a1);
}

Swift::Void __swiftcall BloomFilter.put(object:)(Swift::String object)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t countAndFlagsBits;
  int v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t i;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char **v20;

  v4 = object._object;
  countAndFlagsBits = object._countAndFlagsBits;
  v6 = *(unsigned __int8 *)(v2 + 24);
  v7 = *(_QWORD *)(v2 + 32);
  v8 = *(char **)v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = sub_240B3FF54(countAndFlagsBits, (unint64_t)v4);
  swift_bridgeObjectRelease();
  v10 = (_QWORD *)_s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v9, 0);
  swift_release();
  if ((v7 & 0x8000000000000000) != 0 || (i = HIDWORD(v7)) != 0)
  {
    sub_240B60484();
    __break(1u);
  }
  else
  {
    if (!(_DWORD)v7)
      goto LABEL_28;
    v3 = v10 % v7;
    v10 = sub_240B3F904(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v1 = v10[2];
    i = v10[3];
    v9 = v1 + 1;
    if (v1 >= i >> 1)
      goto LABEL_29;
    while (1)
    {
      v10[2] = v9;
      v10[v1 + 4] = v3;
      if (v6)
      {
        LODWORD(v9) = 0;
        do
        {
          v9 = (v9 + 1);
          swift_bridgeObjectRetain();
          v12 = sub_240B3FF54(countAndFlagsBits, (unint64_t)v4);
          swift_bridgeObjectRelease();
          v3 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v12, v9);
          swift_release();
          v1 = v10[2];
          v13 = v10[3];
          if (v1 >= v13 >> 1)
            v10 = sub_240B3F904((_QWORD *)(v13 > 1), v1 + 1, 1, v10);
          v10[2] = v1 + 1;
          v10[v1 + 4] = v3 % v7;
        }
        while (v6 != (_DWORD)v9);
      }
      swift_bridgeObjectRelease();
      v4 = (void *)v10[2];
      if (!v4)
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_240B4012C((uint64_t)v8);
      for (i = 0; ; ++i)
      {
        v14 = (void *)(i + 1);
        if (__OFADD__(i, 1))
          break;
        v15 = v10[i + 4];
        v16 = v15 + 7;
        if (v15 >= 0)
          v16 = v10[i + 4];
        v17 = v15 - (v16 & 0xFFFFFFFFFFFFFFF8);
        if (v17 >= 1)
          v18 = 2 << (v17 - 1);
        else
          v18 = 2uLL >> (1 - v17);
        if (v15 < -7)
          goto LABEL_26;
        v19 = v16 >> 3;
        if (v19 >= *((_QWORD *)v8 + 2))
          goto LABEL_27;
        v8[v19 + 32] |= v18;
        if (v14 == v4)
        {
          swift_bridgeObjectRelease();
          *v20 = v8;
          return;
        }
      }
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      v10 = sub_240B3F904((_QWORD *)(i > 1), v9, 1, v10);
    }
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall BloomFilter.putAll(list:)(Swift::OpaquePointer list)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  unint64_t v43;
  unint64_t v44;

  v38 = *((_QWORD *)list._rawValue + 2);
  if (v38)
  {
    v2 = *(char **)v1;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_58:
      v2 = sub_240B4012C((uint64_t)v2);
    v3 = 0;
    *(_QWORD *)v1 = v2;
    v44 = *(_QWORD *)(v1 + 32);
    v36 = (_QWORD *)v1;
    v42 = *(unsigned __int8 *)(v1 + 24);
    v1 = 3864292196;
    while (1)
    {
      v4 = v3 + 1;
      if (__OFADD__(v3, 1))
        goto LABEL_56;
      v5 = (uint64_t *)((char *)list._rawValue + 16 * v3 + 32);
      v7 = *v5;
      v6 = v5[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v41 = v7;
      v8 = sub_240B3FF54(v7, v6);
      v43 = v6;
      swift_bridgeObjectRelease();
      v9 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v8, 0);
      swift_release();
      if ((v44 & 0x8000000000000000) != 0 || HIDWORD(v44))
      {
        while (1)
        {
LABEL_59:
          sub_240B60484();
          __break(1u);
        }
      }
      if (!(_DWORD)v44)
        goto LABEL_57;
      v10 = sub_240B3F904(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v12 = v10[2];
      v11 = v10[3];
      v39 = v4;
      v40 = (uint64_t)v2;
      if (v12 >= v11 >> 1)
        v10 = sub_240B3F904((_QWORD *)(v11 > 1), v12 + 1, 1, v10);
      v10[2] = v12 + 1;
      v10[v12 + 4] = v9 % v44;
      if (v42)
        break;
LABEL_34:
      v2 = (char *)v40;
      swift_bridgeObjectRelease();
      v28 = v10[2];
      if (v28)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v2 = sub_240B4012C(v40);
        v29 = 0;
        while (1)
        {
          v30 = v29 + 1;
          if (__OFADD__(v29, 1))
            break;
          v31 = v10[v29 + 4];
          v32 = v31 + 7;
          if (v31 >= 0)
            v32 = v10[v29 + 4];
          v33 = v31 - (v32 & 0xFFFFFFFFFFFFFFF8);
          if (v33 >= 1)
            v34 = 2 << (v33 - 1);
          else
            v34 = 2uLL >> (1 - v33);
          if (v31 < -7)
            goto LABEL_54;
          v35 = v32 >> 3;
          if (v35 >= *((_QWORD *)v2 + 2))
            goto LABEL_55;
          v2[v35 + 32] |= v34;
          ++v29;
          if (v30 == v28)
            goto LABEL_47;
        }
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
LABEL_47:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = v39;
      if (v39 == v38)
        goto LABEL_50;
    }
    v13 = 0;
    while (1)
    {
      ++v13;
      v2 = (char *)v43;
      swift_bridgeObjectRetain();
      v14 = sub_240B3FF54(v41, v43);
      swift_bridgeObjectRelease();
      v15 = *(_QWORD *)(v14 + 16);
      v16 = v13;
      if (v15 >= 4)
        break;
LABEL_19:
      v20 = v15 & 0x7FFFFFFFFFFFFFFCLL;
      if ((v15 & 0x7FFFFFFFFFFFFFFCLL) < v15)
      {
        v21 = *(_QWORD *)(v14 + 16) & 3;
        if ((v15 & 3) != 0)
        {
          v22 = v20 + v21 - 1;
          if (v22 >= (uint64_t)v15)
            goto LABEL_52;
          v23 = v14 + 32;
          v24 = *(unsigned __int8 *)(v14 + 32 + v21 - 1 + v20);
          if (v21 != 1)
          {
            if (v22 >= (uint64_t)v15)
              goto LABEL_52;
            v24 = *(unsigned __int8 *)(v23 + v21 - 2 + v20) | (v24 << 8);
            if (v21 != 2)
            {
              if (v22 >= (uint64_t)v15)
              {
LABEL_52:
                __break(1u);
                goto LABEL_53;
              }
              v24 = *(unsigned __int8 *)(v21 + v20 + v23 - 3) | (v24 << 8);
            }
          }
        }
        else
        {
          v24 = 0;
        }
        v16 ^= 461845907 * ((380141568 * v24) | ((-862048943 * v24) >> 17));
      }
      if (HIDWORD(v15))
        goto LABEL_59;
      swift_release();
      v26 = v10[2];
      v25 = v10[3];
      if (v26 >= v25 >> 1)
        v10 = sub_240B3F904((_QWORD *)(v25 > 1), v26 + 1, 1, v10);
      v27 = -2048144789 * (v16 ^ v15 ^ ((v16 ^ v15) >> 16));
      v10[2] = v26 + 1;
      v10[v26 + 4] = ((-1028477387 * (v27 ^ (v27 >> 13))) ^ ((-1028477387 * (v27 ^ (v27 >> 13))) >> 16))
                   % v44;
      if (v13 == v42)
        goto LABEL_34;
    }
    v17 = 0;
    v18 = (v15 + 3) >> 2;
    v16 = v13;
    while (v18 && v17 + 1 < v15 && v17 + 2 < v15 && v17 + 3 < v15)
    {
      HIDWORD(v19) = (461845907
                    * ((380141568 * *(_DWORD *)(v14 + 32 + v17)) | ((-862048943
                                                                                 * *(_DWORD *)(v14 + 32 + v17)) >> 17))) ^ v16;
      LODWORD(v19) = HIDWORD(v19);
      v16 = 5 * (v19 >> 19) - 430675100;
      --v18;
      v17 += 4;
      if (4 * (v15 >> 2) == v17)
        goto LABEL_19;
    }
    __break(1u);
LABEL_50:
    swift_bridgeObjectRelease();
    *v36 = v2;
  }
}

Swift::Bool __swiftcall BloomFilter.mayContain(object:)(Swift::String object)
{
  uint64_t *v1;
  int64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t countAndFlagsBits;
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  BOOL v31;
  Swift::Bool result;

  v4 = object._object;
  countAndFlagsBits = object._countAndFlagsBits;
  v6 = *v1;
  v7 = *((unsigned __int8 *)v1 + 24);
  v8 = v1[4];
  swift_bridgeObjectRetain();
  v9 = sub_240B3FF54(countAndFlagsBits, (unint64_t)v4);
  swift_bridgeObjectRelease();
  v10 = (_QWORD *)_s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v9, 0);
  swift_release();
  if ((v8 & 0x8000000000000000) == 0)
  {
    v11 = HIDWORD(v8);
    if (!HIDWORD(v8))
    {
      if (!(_DWORD)v8)
        goto LABEL_37;
      v9 = v10 % v8;
      v10 = sub_240B3F904(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v3 = v10[2];
      v11 = v10[3];
      v2 = v3 + 1;
      if (v3 >= (unint64_t)v11 >> 1)
        goto LABEL_38;
      while (1)
      {
        v10[2] = v2;
        v10[v3 + 4] = v9;
        if (v7)
        {
          LODWORD(v3) = 0;
          do
          {
            v3 = (v3 + 1);
            swift_bridgeObjectRetain();
            v12 = sub_240B3FF54(countAndFlagsBits, (unint64_t)v4);
            swift_bridgeObjectRelease();
            v13 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v12, v3);
            swift_release();
            v9 = v10[2];
            v14 = v10[3];
            v2 = v9 + 1;
            if (v9 >= v14 >> 1)
              v10 = sub_240B3F904((_QWORD *)(v14 > 1), v9 + 1, 1, v10);
            v10[2] = v2;
            v10[v9 + 4] = v13 % v8;
          }
          while (v7 != (_DWORD)v3);
        }
        v15 = v10[4];
        v11 = v15 + 7;
        if (v15 >= 0)
          v11 = v10[4];
        v16 = v15 - (v11 & 0xFFFFFFFFFFFFFFF8);
        if (v16 >= 1)
          v17 = 2 << (v16 - 1);
        else
          v17 = 2uLL >> (1 - v16);
        if (v15 < -7)
          goto LABEL_35;
        v18 = v11 >> 3;
        v11 = *(_QWORD *)(v6 + 16);
        if (v18 < v11)
          break;
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        v10 = sub_240B3F904((_QWORD *)((unint64_t)v11 > 1), v2, 1, v10);
      }
      v11 = v6 + 32;
      v19 = *(_BYTE *)(v6 + 32 + v18) & v17;
      v9 = v19 != 0;
      if (v19)
        v20 = v2 == 1;
      else
        v20 = 1;
      if (v20)
      {
LABEL_34:
        swift_bridgeObjectRelease();
        return v9;
      }
      v21 = v2 - 2;
      v22 = v10 + 5;
      while (1)
      {
        v24 = *v22++;
        v23 = v24;
        v25 = v24 + 7;
        if (v24 >= 0)
          v25 = v23;
        v26 = v23 - (v25 & 0xFFFFFFFFFFFFFFF8);
        v27 = v26 >= 1 ? 2 << (v26 - 1) : 2uLL >> (1 - v26);
        if (v23 < -7)
          break;
        v28 = v25 >> 3;
        if (v28 >= *(_QWORD *)(v6 + 16))
          goto LABEL_36;
        v29 = *(_BYTE *)(v11 + v28) & v27;
        v9 = v29 != 0;
        v31 = v21-- != 0;
        if (!v29 || !v31)
          goto LABEL_34;
      }
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  result = sub_240B60484();
  __break(1u);
  return result;
}

_QWORD *sub_240B3F7EC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25435F110);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_240B40180(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_240B3F8F8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_240B3FB3C(a1, a2, a3, a4, &qword_257088788);
}

_QWORD *sub_240B3F904(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088918);
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
    sub_240B40738(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_240B3FA10(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0F8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
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
    sub_240B40820(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_240B3FB30(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_240B3FB3C(a1, a2, a3, a4, &qword_257088910);
}

char *sub_240B3FB3C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = *((_QWORD *)a4 + 3);
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = *((_QWORD *)a4 + 2);
    if (v8 <= v9)
      v10 = *((_QWORD *)a4 + 2);
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (char *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      *((_QWORD *)v11 + 2) = v9;
      *((_QWORD *)v11 + 3) = 2 * v12 - 64;
      v13 = v11 + 32;
      if ((v6 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[v9 + 32])
          memmove(v13, a4 + 32, v9);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_240B4092C(0, v9, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_240B3FC30(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088908);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_240B40A10(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_240B3FD3C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088900);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_240B40A10(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_240B3FE48(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25435F100);
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
    sub_240B40AF8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_240B3FF54(uint64_t a1, unint64_t a2)
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
      v3 = sub_240B400C8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_240B60448();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_240B60484();
      __break(1u);
LABEL_10:
      v2 = sub_240B6019C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_240B604CC();
    __break(1u);
LABEL_14:
    result = sub_240B60484();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_240B400C8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088788);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_240B4012C(uint64_t a1)
{
  return sub_240B3FB3C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1, &qword_257088788);
}

char *sub_240B40158(uint64_t a1)
{
  return sub_240B3FC30(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_240B4016C(_QWORD *a1)
{
  return sub_240B3F904(0, a1[2], 0, a1);
}

uint64_t sub_240B40180(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B40270(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x70614D746962 && a2 == 0xE600000000000000;
  if (v2 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x46687361486D756ELL && a2 == 0xEF6E6F6974636E75 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656B6375426D756ELL && a2 == 0xEA00000000007374)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_240B605A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t initializeWithCopy for BloomFilter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BloomFilter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
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

uint64_t assignWithTake for BloomFilter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilter(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter()
{
  return &type metadata for BloomFilter;
}

uint64_t storeEnumTagSinglePayload for BloomFilter.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B405E0 + 4 * byte_240B61845[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_240B40614 + 4 * byte_240B61840[v4]))();
}

uint64_t sub_240B40614(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B4061C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B40624);
  return result;
}

uint64_t sub_240B40630(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B40638);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_240B4063C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B40644(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.CodingKeys()
{
  return &type metadata for BloomFilter.CodingKeys;
}

unint64_t sub_240B40664()
{
  unint64_t result;

  result = qword_2570888E8;
  if (!qword_2570888E8)
  {
    result = MEMORY[0x24268A8B8](&unk_240B6195C, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570888E8);
  }
  return result;
}

unint64_t sub_240B406AC()
{
  unint64_t result;

  result = qword_2570888F0;
  if (!qword_2570888F0)
  {
    result = MEMORY[0x24268A8B8](&unk_240B618CC, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570888F0);
  }
  return result;
}

unint64_t sub_240B406F4()
{
  unint64_t result;

  result = qword_2570888F8;
  if (!qword_2570888F8)
  {
    result = MEMORY[0x24268A8B8](&unk_240B618F4, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2570888F8);
  }
  return result;
}

char *sub_240B40738(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B40820(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25435F018);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_240B604CC();
  __break(1u);
  return result;
}

char *sub_240B4092C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_240B604CC();
  __break(1u);
  return result;
}

char *sub_240B40A10(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B40AF8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t LanguageDetection.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LanguageDetection.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t _s20MCCKitCategorization17LanguageDetectionC7english4textSbSS_tFZ_0()
{
  id v0;
  void *v1;
  uint64_t result;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  void *v23;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDFD50]), sel_init);
  v1 = (void *)sub_240B600D0();
  objc_msgSend(v0, sel_processString_, v1);

  v23 = v0;
  result = sub_240B60340();
  v3 = result;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_21:
    v15 = *(double *)(*(_QWORD *)(v3 + 56) + 8 * v11);
    v16 = sub_240B600F4();
    v18 = v17;
    if (v16 == sub_240B600F4() && v18 == v19)
    {
      result = swift_bridgeObjectRelease_n();
    }
    else
    {
      v21 = sub_240B605A4();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v21 & 1) == 0 && v15 > 0.95)
      {
        v22 = 0;
LABEL_29:

        swift_release();
        return v22;
      }
    }
  }
  v12 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 >= v9)
    goto LABEL_28;
  v13 = *(_QWORD *)(v5 + 8 * v12);
  ++v4;
  if (v13)
    goto LABEL_20;
  v4 = v12 + 1;
  if (v12 + 1 >= v9)
    goto LABEL_28;
  v13 = *(_QWORD *)(v5 + 8 * v4);
  if (v13)
    goto LABEL_20;
  v4 = v12 + 2;
  if (v12 + 2 >= v9)
    goto LABEL_28;
  v13 = *(_QWORD *)(v5 + 8 * v4);
  if (v13)
  {
LABEL_20:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_21;
  }
  v14 = v12 + 3;
  if (v14 >= v9)
  {
LABEL_28:
    v22 = 1;
    goto LABEL_29;
  }
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      goto LABEL_28;
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_20;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LanguageDetection()
{
  return objc_opt_self();
}

uint64_t method lookup function for LanguageDetection()
{
  return swift_lookUpClassMethod();
}

uint64_t static BloomFilterSerDe.writeToFile(input:path:)(uint64_t *a1, uint64_t a2, unint64_t a3)
{
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
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v32)(uint64_t, uint64_t, uint64_t);
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  unint64_t v35;
  _QWORD v37[4];
  unint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v37 - v9;
  v11 = sub_240B5FF14();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[2];
  if (__OFADD__(v15, 1))
  {
    __break(1u);
LABEL_14:
    swift_once();
    goto LABEL_5;
  }
  v16 = *a1;
  v17 = *((_BYTE *)a1 + 24);
  v46 = sub_240B41FF8(v15 + 1);
  v47 = v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570889B8);
  v44 = v19;
  v45 = sub_240B4208C();
  LOBYTE(v42) = v17;
  LOBYTE(v41) = *(_BYTE *)__swift_project_boxed_opaque_existential_1(&v42, v19);
  sub_240B5FF38();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v42);
  if (*(_QWORD *)(v16 + 16))
    sub_240B5FF44();
  v39 = v10;
  if (qword_25435F0A8 != -1)
    goto LABEL_14;
LABEL_5:
  v20 = sub_240B60088();
  __swift_project_value_buffer(v20, (uint64_t)qword_25435F2B8);
  v21 = v46;
  v22 = v47;
  swift_bridgeObjectRetain();
  sub_240B420D8(v21, v22);
  swift_bridgeObjectRetain();
  sub_240B420D8(v21, v22);
  v23 = sub_240B60070();
  v24 = sub_240B6031C();
  if (os_log_type_enabled(v23, v24))
  {
    v37[1] = v14;
    v38 = v22 >> 62;
    v25 = swift_slowAlloc();
    v37[0] = swift_slowAlloc();
    v42 = v37[0];
    *(_DWORD *)v25 = 136315394;
    swift_bridgeObjectRetain();
    v37[2] = a2;
    v41 = sub_240B335B4(a2, a3, &v42);
    sub_240B603AC();
    v37[3] = a3;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 12) = 2048;
    __asm { BR              X9 }
  }
  sub_240B4211C(v21, v22);
  swift_bridgeObjectRelease_n();
  sub_240B4211C(v21, v22);

  v26 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v27 = objc_msgSend(v26, sel_URLsForDirectory_inDomains_, 9, 1);

  v28 = sub_240B60244();
  v30 = (uint64_t)v39;
  v29 = (uint64_t)v40;
  if (*(_QWORD *)(v28 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v40, v28 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v11);
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v31(v29, 0, 1, v11);
  }
  else
  {
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v31((uint64_t)v40, 1, 1, v11);
  }
  swift_bridgeObjectRelease();
  v32 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (v32(v29, 1, v11) == 1)
  {
    sub_240B42160(v29);
    v31(v30, 1, 1, v11);
    goto LABEL_16;
  }
  sub_240B5FEB4();
  v33 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v33(v29, v11);
  v31(v30, 0, 1, v11);
  if (v32(v30, 1, v11) == 1)
  {
LABEL_16:
    sub_240B42160(v30);
    v42 = 0;
    v43 = 0xE000000000000000;
    sub_240B6043C();
    swift_bridgeObjectRelease();
    v42 = 0xD00000000000001FLL;
    v43 = 0x8000000240B63870;
    sub_240B60184();
    sub_240B60490();
    __break(1u);
    JUMPOUT(0x240B41544);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, v30, v11);
  swift_beginAccess();
  v34 = v46;
  v35 = v47;
  sub_240B420D8(v46, v47);
  sub_240B5FF50();
  sub_240B4211C(v34, v35);
  v33((uint64_t)v14, v11);
  return sub_240B4211C(v46, v47);
}

uint64_t static BloomFilterSerDe.readFromBundle(name:fileExtension:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t ObjCClassFromMetadata;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t result;
  _QWORD v30[5];
  unint64_t v31;
  unint64_t v32;

  v30[4] = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_240B5FF14();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v30 - v17;
  type metadata accessor for BloomFilterSerDe();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v20 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v30[0] = a1;
  v30[1] = a2;
  v21 = v20;
  v22 = (void *)sub_240B600D0();
  v30[2] = a3;
  v30[3] = a4;
  v23 = (void *)sub_240B600D0();
  v24 = objc_msgSend(v21, sel_URLForResource_withExtension_, v22, v23);

  if (v24)
  {
    sub_240B5FED8();

    v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v25(v11, v16, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v25(v18, v11, v12);
      v26 = sub_240B5FF20();
      v28 = v27;
      sub_240B418A4(v26, v27);
      sub_240B4211C(v26, v28);

      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_240B42160((uint64_t)v11);
  v31 = 0;
  v32 = 0xE000000000000000;
  sub_240B6043C();
  swift_bridgeObjectRelease();
  v31 = 0xD000000000000018;
  v32 = 0x8000000240B638B0;
  sub_240B60184();
  sub_240B60184();
  sub_240B60184();
  result = sub_240B60490();
  __break(1u);
  return result;
}

void sub_240B418A4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t static BloomFilterSerDe.readFromFile(path:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v21 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v21 - v5;
  v7 = sub_240B5FF14();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager, v21);
  v12 = objc_msgSend(v11, sel_URLsForDirectory_inDomains_, 9, 1);

  v13 = sub_240B60244();
  if (*(_QWORD *)(v13 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v4, v13 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v14(v4, 0, 1, v7);
  }
  else
  {
    v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v14(v4, 1, 1, v7);
  }
  swift_bridgeObjectRelease();
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v15(v4, 1, v7) == 1)
  {
    sub_240B42160((uint64_t)v4);
    v14(v6, 1, 1, v7);
  }
  else
  {
    sub_240B5FEB4();
    v16 = *(void (**)(char *, uint64_t))(v8 + 8);
    v16(v4, v7);
    v14(v6, 0, 1, v7);
    if (v15(v6, 1, v7) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      v17 = sub_240B5FF20();
      v19 = v18;
      sub_240B418A4(v17, v18);
      sub_240B4211C(v17, v19);
      return ((uint64_t (*)(char *, uint64_t))v16)(v10, v7);
    }
  }
  sub_240B42160((uint64_t)v6);
  v22 = 0;
  v23 = 0xE000000000000000;
  sub_240B6043C();
  swift_bridgeObjectRelease();
  v22 = 0xD00000000000001ELL;
  v23 = 0x8000000240B63900;
  sub_240B60184();
  result = sub_240B60490();
  __break(1u);
  return result;
}

uint64_t static BloomFilterSerDe.readFromFile(withFilePath:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v2 = sub_240B5FF14();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - v5;
  if ((sub_240B5FECC() & 1) != 0)
  {
    v7 = sub_240B5FF20();
    v9 = v8;
    sub_240B418A4(v7, v8);
    return sub_240B4211C(v7, v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
    v12 = 0;
    v13 = 0xE000000000000000;
    sub_240B6043C();
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000018;
    v13 = 0x8000000240B638B0;
    sub_240B34E98();
    sub_240B60598();
    sub_240B60184();
    swift_bridgeObjectRelease();
    result = sub_240B60490();
    __break(1u);
  }
  return result;
}

uint64_t BloomFilterSerDe.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BloomFilterSerDe.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_240B41FF8(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result < 15)
    {
      return 0;
    }
    else
    {
      sub_240B5FDE8();
      swift_allocObject();
      sub_240B5FDDC();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_240B5FF2C();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_240B4208C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2570889C0;
  if (!qword_2570889C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2570889B8);
    result = MEMORY[0x24268A8B8](MEMORY[0x24BDD06A0], v1);
    atomic_store(result, (unint64_t *)&qword_2570889C0);
  }
  return result;
}

uint64_t sub_240B420D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_240B4211C(uint64_t a1, unint64_t a2)
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

uint64_t sub_240B42160(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for BloomFilterSerDe()
{
  return objc_opt_self();
}

uint64_t method lookup function for BloomFilterSerDe()
{
  return swift_lookUpClassMethod();
}

void sub_240B421CC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_240B42204()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_240B3E3D4(0, BYTE6(v0));
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v1 = (uint64_t)sub_240B3F8F8(0, *(_QWORD *)(v1 + 16), 0, (char *)v1);
  swift_bridgeObjectRetain();
  sub_240B5FF68();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_240B422B0()
{
  sub_240B3E3D4(0, 0);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    JUMPOUT(0x240B42270);
  JUMPOUT(0x240B42258);
}

uint64_t SenderBloomFilterBuilder.__allocating_init(csvFilePath:probabilityOfFalsePositives:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(double *)(result + 32) = a3;
  return result;
}

uint64_t SenderBloomFilterBuilder.init(csvFilePath:probabilityOfFalsePositives:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  *(double *)(v3 + 32) = a3;
  return v3;
}

uint64_t sub_240B42348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t result;
  void (*v24)(_QWORD *, _QWORD);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  unsigned int v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  int v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unsigned int v63;
  unsigned int v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  unint64_t v70;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  _QWORD *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unsigned __int8 v85;
  int v86;
  unint64_t v87;
  uint64_t v88;
  _BOOL8 v89;
  uint64_t v90;
  unint64_t v91;
  int v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  BOOL v99;
  uint64_t v100;
  unint64_t v101;
  char v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  int v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(char *, char *, uint64_t);
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  _QWORD v126[3];
  uint64_t v127;
  uint64_t v128;

  v128 = sub_240B5FFB0();
  v123 = *(_QWORD *)(v128 - 8);
  v0 = MEMORY[0x24BDAC7A8](v128);
  v122 = (char *)&v103 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v0);
  v121 = (char *)&v103 - v2;
  v3 = sub_240B5FFD4();
  v119 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570889C8);
  v6 = MEMORY[0x24BDAC7A8](v118);
  v8 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v103 - v9;
  v11 = sub_240B60004();
  v112 = *(_QWORD *)(v11 - 8);
  v113 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v103 - v15;
  sub_240B436A4((uint64_t)&v103 - v15);
  sub_240B5FFF8();
  __swift_project_boxed_opaque_existential_1(v126, v127);
  sub_240B60034();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v126);
  v111 = v14;
  v117 = sub_240B42F1C();
  v110 = v16;
  sub_240B5FFE0();
  v17 = v119;
  v120 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
  v120(v8, v5, v3);
  sub_240B447DC();
  sub_240B602D4();
  v119 = *(_QWORD *)(v17 + 8);
  ((void (*)(char *, uint64_t))v119)(v5, v3);
  v18 = v118;
  *(_QWORD *)&v8[*(int *)(v118 + 36)] = v126[0];
  sub_240B44824((uint64_t)v8, (uint64_t)v10);
  v19 = &v10[*(int *)(v18 + 36)];
  v20 = *(_QWORD *)v19;
  sub_240B602EC();
  if (v20 == v126[0])
  {
LABEL_2:
    sub_240B34F40((uint64_t)v10, &qword_2570889C8);
    v21 = *(void (**)(char *, uint64_t))(v112 + 8);
    v22 = v113;
    v21(v111, v113);
    v21(v110, v22);
    return v117;
  }
  v118 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    v24 = (void (*)(_QWORD *, _QWORD))sub_240B60304();
    v25 = v123;
    v26 = v121;
    v27 = v128;
    (*(void (**)(char *))(v123 + 16))(v121);
    v24(v126, 0);
    v120(v5, v10, v3);
    sub_240B602F8();
    ((void (*)(char *, uint64_t))v119)(v5, v3);
    v28 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v29 = v122;
    v28(v122, v26, v27);
    sub_240B5FFBC();
    if (!v127)
      goto LABEL_42;
    if ((swift_dynamicCast() & 1) != 0)
      break;
LABEL_43:
    (*(void (**)(char *, uint64_t))(v123 + 8))(v29, v128);
LABEL_44:
    v67 = *(_QWORD *)v19;
    sub_240B602EC();
    if (v67 == v126[0])
      goto LABEL_2;
  }
  v30 = v124;
  v31 = v125;
  sub_240B5FFBC();
  if (!v127)
  {
    swift_bridgeObjectRelease();
LABEL_42:
    sub_240B34F40((uint64_t)v126, &qword_2570887C8);
    goto LABEL_43;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  v115 = v30;
  v32 = v124 + 2;
  if ((unint64_t)(v124 + 2) >= 9)
  {
LABEL_52:
    (*(void (**)(char *, uint64_t))(v123 + 8))(v29, v128);
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  v114 = v31;
  v33 = v117;
  if (!*(_QWORD *)(v117 + 16))
    goto LABEL_48;
  v34 = sub_240B35E0C(v32);
  v33 = v117;
  if ((v35 & 1) == 0
    || (v36 = *(_QWORD *)(v117 + 56) + 40 * v34,
        v106 = *(_QWORD *)(v36 + 8),
        v37 = *(_QWORD *)(v36 + 16),
        v109 = *(unsigned __int8 *)(v36 + 24),
        v38 = *(_QWORD *)(v36 + 32),
        (v39 = (char *)swift_bridgeObjectRetain()) == 0))
  {
LABEL_48:
    swift_bridgeObjectRelease();
    v68 = sub_240B35E0C(v32);
    if ((v69 & 1) != 0)
    {
      v70 = v68;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v126[0] = v33;
      v72 = v33;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_240B376E4();
        v72 = v126[0];
      }
      v117 = v72;
      sub_240B44208(v70, v72);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    goto LABEL_52;
  }
  v104 = v37;
  v105 = v32;
  v107 = v39;
  swift_bridgeObjectRetain();
  v40 = v114;
  swift_bridgeObjectRetain();
  v41 = sub_240B3FF54(v115, v40);
  swift_bridgeObjectRelease();
  v42 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v41, 0);
  swift_release();
  if ((v38 & 0x8000000000000000) != 0 || HIDWORD(v38))
    goto LABEL_87;
  if (!(_DWORD)v38)
    goto LABEL_84;
  v43 = sub_240B3F904(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v45 = v43[2];
  v44 = v43[3];
  v116 = v43;
  if (v45 >= v44 >> 1)
    v116 = sub_240B3F904((_QWORD *)(v44 > 1), v45 + 1, 1, v116);
  v108 = v38;
  v46 = v116;
  v116[2] = v45 + 1;
  v46[v45 + 4] = v42 % v38;
  if (!v109)
  {
LABEL_53:
    swift_bridgeObjectRelease();
    v73 = v116[2];
    if (v73)
    {
      v74 = swift_isUniquelyReferenced_nonNull_native();
      v29 = v122;
      if ((v74 & 1) == 0)
        v107 = sub_240B4012C((uint64_t)v107);
      v75 = 0;
      v76 = v116 + 4;
      v77 = v107;
      while (1)
      {
        v78 = v75 + 1;
        if (__OFADD__(v75, 1))
          goto LABEL_81;
        v79 = v76[v75];
        v80 = v79 + 7;
        if (v79 >= 0)
          v80 = v76[v75];
        v81 = v79 - (v80 & 0xFFFFFFFFFFFFFFF8);
        if (v81 >= 1)
          v82 = 2 << (v81 - 1);
        else
          v82 = 2uLL >> (1 - v81);
        if (v79 < -7)
          goto LABEL_82;
        v83 = v80 >> 3;
        if (v83 >= *((_QWORD *)v77 + 2))
          goto LABEL_83;
        v77[v83 + 32] |= v82;
        ++v75;
        if (v78 == v73)
          goto LABEL_68;
      }
    }
    v29 = v122;
LABEL_68:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v84 = v117;
    LODWORD(v116) = swift_isUniquelyReferenced_nonNull_native();
    v126[0] = v84;
    v85 = v105;
    v87 = sub_240B35E0C(v105);
    v88 = *(_QWORD *)(v84 + 16);
    v89 = (v86 & 1) == 0;
    v90 = v88 + v89;
    if (__OFADD__(v88, v89))
      goto LABEL_85;
    if (*(_QWORD *)(v84 + 24) >= v90)
    {
      if ((v116 & 1) == 0)
      {
        v101 = v87;
        v102 = v86;
        sub_240B376E4();
        LOBYTE(v86) = v102;
        v87 = v101;
      }
    }
    else
    {
      LODWORD(v117) = v86;
      sub_240B36540(v90, (char)v116);
      v91 = sub_240B35E0C(v85);
      v92 = v86 & 1;
      LOBYTE(v86) = v117;
      if ((v117 & 1) != v92)
        goto LABEL_88;
      v87 = v91;
    }
    v93 = (_QWORD *)v126[0];
    if ((v86 & 1) != 0)
    {
      v94 = *(_QWORD *)(v126[0] + 56) + 40 * v87;
      swift_bridgeObjectRelease();
      v95 = v106;
      *(_QWORD *)v94 = v107;
      *(_QWORD *)(v94 + 8) = v95;
      *(_QWORD *)(v94 + 16) = v104;
      *(_BYTE *)(v94 + 24) = v109;
      *(_QWORD *)(v94 + 32) = v108;
    }
    else
    {
      *(_QWORD *)(v126[0] + 8 * (v87 >> 6) + 64) |= 1 << v87;
      *(_BYTE *)(v93[6] + v87) = v105;
      v96 = v93[7] + 40 * v87;
      v97 = v106;
      *(_QWORD *)v96 = v107;
      *(_QWORD *)(v96 + 8) = v97;
      *(_QWORD *)(v96 + 16) = v104;
      *(_BYTE *)(v96 + 24) = v109;
      *(_QWORD *)(v96 + 32) = v108;
      v98 = v93[2];
      v99 = __OFADD__(v98, 1);
      v100 = v98 + 1;
      if (v99)
        goto LABEL_86;
      v93[2] = v100;
    }
    v117 = (uint64_t)v93;
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  v47 = 0;
  while (1)
  {
    ++v47;
    v48 = v114;
    swift_bridgeObjectRetain();
    v49 = sub_240B3FF54(v115, v48);
    swift_bridgeObjectRelease();
    v50 = *(_QWORD *)(v49 + 16);
    v51 = v47;
    if (v50 >= 4)
      break;
LABEL_26:
    v55 = v50 & 0x7FFFFFFFFFFFFFFCLL;
    if ((v50 & 0x7FFFFFFFFFFFFFFCLL) < v50)
    {
      v56 = *(_QWORD *)(v49 + 16) & 3;
      if ((v50 & 3) != 0)
      {
        v57 = v55 + v56 - 1;
        if (v57 >= (uint64_t)v50)
          goto LABEL_80;
        v58 = v49 + 32;
        v59 = *(unsigned __int8 *)(v49 + 32 + v56 - 1 + v55);
        if (v56 != 1)
        {
          if (v57 >= (uint64_t)v50)
            goto LABEL_80;
          v59 = *(unsigned __int8 *)(v58 + v56 - 2 + v55) | (v59 << 8);
          if (v56 != 2)
          {
            if (v57 >= (uint64_t)v50)
              goto LABEL_80;
            v59 = *(unsigned __int8 *)(v56 + v55 + v58 - 3) | (v59 << 8);
          }
        }
      }
      else
      {
        v59 = 0;
      }
      v51 ^= 461845907 * ((380141568 * v59) | ((-862048943 * v59) >> 17));
    }
    if (HIDWORD(v50))
      goto LABEL_87;
    swift_release();
    v61 = v116[2];
    v60 = v116[3];
    v62 = v61 + 1;
    if (v61 >= v60 >> 1)
    {
      v103 = v61 + 1;
      v66 = sub_240B3F904((_QWORD *)(v60 > 1), v61 + 1, 1, v116);
      v62 = v103;
      v116 = v66;
    }
    v63 = -2048144789 * (v51 ^ v50 ^ ((v51 ^ v50) >> 16));
    v64 = v108;
    v65 = v116;
    v116[2] = v62;
    v65[v61 + 4] = ((-1028477387 * (v63 ^ (v63 >> 13))) ^ ((-1028477387 * (v63 ^ (v63 >> 13))) >> 16)) % v64;
    if (v47 == v109)
      goto LABEL_53;
  }
  v52 = 0;
  v53 = (v50 + 3) >> 2;
  v51 = v47;
  while (v53 && v52 + 1 < v50 && v52 + 2 < v50 && v52 + 3 < v50)
  {
    HIDWORD(v54) = (461845907
                  * ((380141568 * *(_DWORD *)(v49 + 32 + v52)) | ((-862048943 * *(_DWORD *)(v49 + 32 + v52)) >> 17))) ^ v51;
    LODWORD(v54) = HIDWORD(v54);
    v51 = 5 * (v54 >> 19) - 430675100;
    --v53;
    v52 += 4;
    if (4 * (v50 >> 2) == v52)
      goto LABEL_26;
  }
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  sub_240B60484();
  __break(1u);
LABEL_88:
  result = sub_240B605D4();
  __break(1u);
  return result;
}

uint64_t sub_240B42F1C()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t result;
  uint64_t v20;
  void (*v21)(uint64_t *, _QWORD);
  void (*v22)(char *);
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  char *v46;
  uint64_t *v47;
  unint64_t v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  _QWORD v64[3];
  char v65;
  uint64_t v66;

  v0 = sub_240B5FFB0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v59 = (char *)&v43 - v5;
  v6 = sub_240B5FFD4();
  v57 = *(_QWORD *)(v6 - 8);
  v7 = v57;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570889C8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v43 - v14;
  sub_240B5FFE0();
  v58 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v58(v13, v9, v6);
  sub_240B447DC();
  sub_240B602D4();
  v57 = *(_QWORD *)(v57 + 8);
  ((void (*)(char *, uint64_t))v57)(v9, v6);
  *(_QWORD *)&v13[*(int *)(v10 + 36)] = v64[0];
  sub_240B44824((uint64_t)v13, (uint64_t)v15);
  v16 = &v15[*(int *)(v10 + 36)];
  v17 = *(_QWORD *)v16;
  sub_240B602EC();
  if (v17 == v61)
  {
    v54 = MEMORY[0x24BEE4B00];
LABEL_3:
    sub_240B34F40((uint64_t)v15, &qword_2570889C8);
    return v54;
  }
  v47 = &v61;
  v54 = MEMORY[0x24BEE4B00];
  v46 = (char *)&v60 + 1;
  v56 = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v18 = 136315906;
  v45 = v18;
  while (1)
  {
    v21 = (void (*)(uint64_t *, _QWORD))sub_240B60304();
    v22 = *(void (**)(char *))(v1 + 16);
    v23 = v1;
    v24 = v59;
    v22(v59);
    v21(&v61, 0);
    v58(v9, v15, v6);
    sub_240B602F8();
    ((void (*)(char *, uint64_t))v57)(v9, v6);
    v25 = v0;
    v26 = v23;
    v27 = *(void (**)(char *, char *))(v23 + 32);
    v28 = v25;
    v27(v4, v24);
    sub_240B5FFBC();
    if (!v63)
    {
      sub_240B34F40((uint64_t)&v61, &qword_2570887C8);
      v1 = v26;
LABEL_6:
      v0 = v28;
      goto LABEL_7;
    }
    v1 = v26;
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_6;
    v0 = v28;
    if ((unint64_t)(v60 + 2) <= 8)
    {
      v55 = v60 + 2;
      sub_240B5FFBC();
      if (!v63)
      {
        sub_240B34F40((uint64_t)&v61, &qword_2570887C8);
        goto LABEL_7;
      }
      if ((swift_dynamicCast() & 1) != 0)
        break;
    }
LABEL_7:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    v20 = *(_QWORD *)v16;
    sub_240B602EC();
    if (v20 == v61)
      goto LABEL_3;
  }
  v50 = v60;
  sub_240B43F10(v60);
  v53 = v29;
  v52 = v30;
  v61 = 0;
  v62 = 0xE000000000000000;
  LOBYTE(v60) = v55;
  sub_240B60478();
  v31 = v62;
  v48 = v61;
  if (qword_25435F0A8 != -1)
    swift_once();
  v32 = sub_240B60088();
  __swift_project_value_buffer(v32, (uint64_t)qword_25435F2B8);
  swift_bridgeObjectRetain();
  v33 = sub_240B60070();
  v34 = sub_240B6031C();
  v51 = v33;
  v49 = v34;
  if (os_log_type_enabled(v33, v34))
  {
    v35 = swift_slowAlloc();
    v44 = swift_slowAlloc();
    v61 = v44;
    *(_DWORD *)v35 = v45;
    v43 = v35 + 4;
    swift_bridgeObjectRetain();
    v60 = sub_240B335B4(v48, v31, &v61);
    v48 = v31;
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v35 + 12) = 2048;
    v60 = v50;
    sub_240B603AC();
    *(_WORD *)(v35 + 22) = 2048;
    v60 = v53;
    sub_240B603AC();
    *(_WORD *)(v35 + 32) = 256;
    LOBYTE(v60) = v52;
    sub_240B603AC();
    _os_log_impl(&dword_240B2B000, v51, (os_log_type_t)v49, "Building BF for %s count %ld buckets %ld and hashes %hhu", (uint8_t *)v35, 0x23u);
    v36 = v44;
    swift_arrayDestroy();
    MEMORY[0x24268A954](v36, -1, -1);
    MEMORY[0x24268A954](v35, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v37 = v53;
  if ((v53 & 7) == 0)
  {
    v38 = v53 + 7;
    if (v53 >= 0)
      v38 = v53;
    if (v53 <= -8)
      goto LABEL_27;
    v39 = v38 >> 3;
    v40 = MEMORY[0x24BEE4AF8];
    if ((unint64_t)v53 >= 8)
    {
      v40 = sub_240B60268();
      *(_QWORD *)(v40 + 16) = v39;
      bzero((void *)(v40 + 32), v39);
      v37 = v53;
    }
    v64[0] = v40;
    v64[1] = v37;
    v64[2] = v39;
    v65 = v52;
    v66 = v37;
    v41 = v54;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v61 = v41;
    sub_240B44684((uint64_t)v64, v55, isUniquelyReferenced_nonNull_native);
    v54 = v61;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_240B60490();
  __break(1u);
LABEL_27:
  result = sub_240B60484();
  __break(1u);
  return result;
}

uint64_t sub_240B436A4@<X0>(uint64_t a1@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint8_t *v33;
  char *v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;

  v49 = a1;
  v1 = sub_240B5FFD4();
  v40 = *(_QWORD *)(v1 - 8);
  v41 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v39 = (char *)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_240B60004();
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v51 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_240B5FE6C();
  v47 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v46 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_240B5FF14();
  v8 = *(_QWORD *)(v56 - 8);
  v9 = MEMORY[0x24BDAC7A8](v56);
  v45 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v55 = (char *)&v38 - v11;
  v12 = sub_240B60064();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_240B60028();
  v54 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v43 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v38 - v19;
  v42 = sub_240B46904();
  sub_240B474B4((uint64_t)&unk_251108A60);
  swift_arrayDestroy();
  sub_240B474B4((uint64_t)&unk_251108AC0);
  v21 = v8;
  swift_arrayDestroy();
  v22 = v56;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDF5FB8], v12);
  v23 = v55;
  sub_240B6001C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v44, 1, 1, v22);
  (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v46, *MEMORY[0x24BDCD7A0], v50);
  swift_bridgeObjectRetain();
  sub_240B5FEFC();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v45, v23, v22);
  v24 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  v25 = v49;
  v50 = (uint64_t)v20;
  v24(v43, v20, v16);
  sub_240B47174(MEMORY[0x24BEE4AF8]);
  sub_240B5FFA4();
  if (qword_25435F0A8 != -1)
    swift_once();
  v26 = sub_240B60088();
  __swift_project_value_buffer(v26, (uint64_t)qword_25435F2B8);
  v27 = v51;
  v28 = v52;
  v29 = v53;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v51, v25, v53);
  v30 = sub_240B60070();
  v31 = sub_240B6031C();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v49 = v21;
    v33 = v32;
    v48 = v16;
    *(_DWORD *)v32 = 134217984;
    v34 = v39;
    sub_240B5FFE0();
    v35 = sub_240B5FFC8();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v41);
    v16 = v48;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
    v57 = v35;
    sub_240B603AC();
    _os_log_impl(&dword_240B2B000, v30, v31, "Number of rows: %ld", v33, 0xCu);
    v36 = v33;
    v21 = v49;
    MEMORY[0x24268A954](v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
  }

  (*(void (**)(char *, uint64_t))(v21 + 8))(v55, v56);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v54 + 8))(v50, v16);
}

uint64_t SenderBloomFilterBuilder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SenderBloomFilterBuilder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_240B43F10(uint64_t a1)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;

  if (a1 == 0x8000000000000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  v3 = ceil(log(*(long double *)(v1 + 32)) * (double)-a1 / 0.480453014);
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v4 = (uint64_t)v3;
  if ((uint64_t)v3 <= 0)
    v5 = -(-(uint64_t)v3 & 7);
  else
    v5 = (uint64_t)v3 & 7;
  if (__OFADD__(v4, 8 - v5))
    goto LABEL_17;
  v6 = ceil((double)v4 / (double)a1 * 0.693147181);
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v6 <= -1.0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v6 >= 256.0)
LABEL_20:
    __break(1u);
}

unint64_t sub_240B44028(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_240B6040C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_240B60628();
        sub_240B60634();
        result = sub_240B60640();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v9 < v8)
          goto LABEL_11;
LABEL_12:
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_BYTE *)(v10 + v3);
        v12 = (_BYTE *)(v10 + v6);
        if (v3 != v6 || v11 >= v12 + 1)
          *v11 = *v12;
        v13 = *(_QWORD *)(a2 + 56);
        v14 = *(_QWORD *)(*(_QWORD *)(sub_240B5FF14() - 8) + 72);
        v15 = v14 * v3;
        result = v13 + v14 * v3;
        v16 = v14 * v6;
        v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v15 == v16)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v9 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v9)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_240B44208(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_240B6040C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_240B60628();
        sub_240B60634();
        result = sub_240B60640();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_BYTE *)(v12 + v3);
          v14 = (_BYTE *)(v12 + v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = v15 + 40 * v3;
          v17 = (__int128 *)(v15 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= (unint64_t)v17 + 40))
          {
            v9 = *v17;
            v10 = v17[1];
            *(_QWORD *)(v16 + 32) = *((_QWORD *)v17 + 4);
            *(_OWORD *)v16 = v9;
            *(_OWORD *)(v16 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_240B443CC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_240B6040C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_240B6061C();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_240B44560(uint64_t a1, char a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_240B35E0C(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = sub_240B5FF14();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_240B4486C(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_240B372C0();
      goto LABEL_7;
    }
    sub_240B35EFC(v13, a3 & 1);
    v20 = sub_240B35E0C(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_240B4486C(v10, a2, a1, v16);
    }
  }
  result = sub_240B605D4();
  __break(1u);
  return result;
}

uint64_t sub_240B44684(uint64_t a1, unsigned __int8 a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v8 = *v3;
  v10 = sub_240B35E0C(a2);
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
    result = (uint64_t)sub_240B376E4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_240B44948(a1, v16[7] + 40 * v10);
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    v18 = v16[7] + 40 * v10;
    v19 = *(_OWORD *)a1;
    v20 = *(_OWORD *)(a1 + 16);
    *(_QWORD *)(v18 + 32) = *(_QWORD *)(a1 + 32);
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    v21 = v16[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return result;
    }
    goto LABEL_14;
  }
  sub_240B36540(result, a3 & 1);
  result = sub_240B35E0C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_240B44948(a1, v16[7] + 40 * v10);
    goto LABEL_11;
  }
LABEL_15:
  result = sub_240B605D4();
  __break(1u);
  return result;
}

unint64_t sub_240B447DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2570889D0;
  if (!qword_2570889D0)
  {
    v1 = sub_240B5FFD4();
    result = MEMORY[0x24268A8B8](MEMORY[0x24BDF5D20], v1);
    atomic_store(result, (unint64_t *)&qword_2570889D0);
  }
  return result;
}

uint64_t sub_240B44824(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570889C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_240B4486C(unint64_t a1, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  v7 = a4[7];
  v8 = sub_240B5FF14();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

uint64_t type metadata accessor for SenderBloomFilterBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for SenderBloomFilterBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SenderBloomFilterBuilder.__allocating_init(csvFilePath:probabilityOfFalsePositives:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SenderBloomFilterBuilder.build()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t sub_240B44948(uint64_t a1, uint64_t a2)
{
  assignWithTake for BloomFilter(a2, a1);
  return a2;
}

uint64_t DecisionRequest.senderName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.senderEmail.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.senderEmail.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*DecisionRequest.senderEmail.modify())()
{
  return nullsub_1;
}

uint64_t DecisionRequest.receiverEmail.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.emailSubject.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.isUnsubscribeHeaderPresent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t DecisionRequest.isSenderVIP.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t DecisionRequest.isSenderInAddressBook.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t DecisionRequest.isSenderRecentContact.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 67);
}

uint64_t DecisionRequest.isSenderPrimary.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 68);
}

uint64_t DecisionRequest.isNonPersonalAccount.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 69);
}

uint64_t DecisionRequest.localRuleCategory.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value._countAndFlagsBits = 0;
  retstr->receiverEmail.value._object = 0;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  *(_WORD *)&retstr->isSenderRecentContact = 0;
  retstr->isNonPersonalAccount = 0;
  retstr->localRuleCategory.value._countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:receiverEmail:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::String receiverEmail)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value = receiverEmail;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  *(_WORD *)&retstr->isSenderRecentContact = 0;
  retstr->isNonPersonalAccount = 0;
  retstr->localRuleCategory.value._countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::Bool isSenderRecentContact, Swift::Bool isSenderPrimary)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value._countAndFlagsBits = 0;
  retstr->receiverEmail.value._object = 0;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  retstr->isSenderRecentContact = isSenderRecentContact;
  *(_WORD *)&retstr->isSenderPrimary = isSenderPrimary;
  retstr->localRuleCategory.value._countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::Bool isSenderRecentContact, Swift::Bool isSenderPrimary, Swift::Bool isNonPersonalAccount)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value._countAndFlagsBits = 0;
  retstr->receiverEmail.value._object = 0;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  retstr->isSenderRecentContact = isSenderRecentContact;
  retstr->isSenderPrimary = isSenderPrimary;
  retstr->isNonPersonalAccount = isNonPersonalAccount;
  retstr->localRuleCategory.value._countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:receiverEmail:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::String receiverEmail, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::Bool isSenderRecentContact, Swift::Bool isSenderPrimary, Swift::Bool isNonPersonalAccount)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value = receiverEmail;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  retstr->isSenderRecentContact = isSenderRecentContact;
  retstr->isSenderPrimary = isSenderPrimary;
  retstr->isNonPersonalAccount = isNonPersonalAccount;
  retstr->localRuleCategory.value._countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

uint64_t destroy for DecisionRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DecisionRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_BYTE *)(a1 + 69) = *(_BYTE *)(a2 + 69);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DecisionRequest(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  *(_BYTE *)(a1 + 67) = *(_BYTE *)(a2 + 67);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_BYTE *)(a1 + 69) = *(_BYTE *)(a2 + 69);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DecisionRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  *(_BYTE *)(a1 + 67) = *(_BYTE *)(a2 + 67);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_BYTE *)(a1 + 69) = *(_BYTE *)(a2 + 69);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DecisionRequest(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DecisionRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DecisionRequest()
{
  return &type metadata for DecisionRequest;
}

uint64_t sub_240B44F1C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_240B44F4C(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_240B44F88())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t MCCNLP.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  MCCNLP.init()();
  return v0;
}

uint64_t MCCNLP.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD *v37;
  _OWORD *v38;
  uint64_t result;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  char v53;
  uint64_t v54;
  _OWORD v55[3];
  unint64_t v56;
  id v57;

  v1 = sub_240B5FF14();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for BlackPearlLevels();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  v9 = sub_240B46010(0x100000000000001ALL, 0x8000000240B63A30, 0);
  v55[0] = xmmword_240B61B50;
  v55[1] = xmmword_240B61B60;
  v55[2] = xmmword_240B61B70;
  v56 = 0x8000000240B63A30;
  v57 = v9;
  v10 = type metadata accessor for TrialLoader();
  swift_allocObject();
  v11 = TrialLoader.init()();
  *(_QWORD *)(v0 + 56) = v10;
  *(_QWORD *)(v0 + 64) = &protocol witness table for TrialLoader;
  *(_QWORD *)(v0 + 32) = v11;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 32), v10);
  *(_BYTE *)(v0 + 16) = (sub_240B32FDC() & 1) == 0;
  v12 = *(_QWORD *)(v0 + 56);
  v13 = *(_QWORD *)(v0 + 64);
  v50 = v0;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 32), v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 296))(v12, v13);
  v14 = v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  sub_240B2F340((uint64_t)v7, v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels);
  swift_beginAccess();
  v15 = v5[9];
  *(_QWORD *)&v45 = type metadata accessor for BloomFilterData(0);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v16(v4, v14 + v15 + *(int *)(v45 + 24), v1);
  type metadata accessor for NERRule();
  v17 = swift_allocObject();
  type metadata accessor for BloomFilterSerDe();
  v48 = v7;
  static BloomFilterSerDe.readFromFile(withFilePath:)((uint64_t)v4);
  v18 = *(void (**)(char *, uint64_t))(v2 + 8);
  v18(v4, v1);
  v19 = v53;
  v20 = v54;
  v49 = v17;
  *(_QWORD *)(v17 + 16) = v51;
  *(_OWORD *)(v17 + 24) = v52;
  *(_BYTE *)(v17 + 40) = v19;
  *(_QWORD *)(v17 + 48) = v20;
  v16(v4, v14 + v5[10], v1);
  type metadata accessor for DomainMapDataFrame();
  swift_allocObject();
  v47 = DomainMapDataFrame.init(withFileAtPath:)((uint64_t)v4);
  v16(v4, v14 + v5[11], v1);
  type metadata accessor for TokenMapDataFrame();
  swift_allocObject();
  v46 = TokenMapDataFrame.init(withFileAtPath:)((uint64_t)v4);
  v16(v4, v14 + v5[12], v1);
  swift_allocObject();
  v44 = TokenMapDataFrame.init(withFileAtPath:)((uint64_t)v4);
  v16(v4, v14 + v5[13], v1);
  swift_allocObject();
  v43 = TokenMapDataFrame.init(withFileAtPath:)((uint64_t)v4);
  v16(v4, v14 + v5[9], v1);
  type metadata accessor for CommerceSenderRule();
  v21 = swift_allocObject();
  static BloomFilterSerDe.readFromFile(withFilePath:)((uint64_t)v4);
  v18(v4, v1);
  v22 = v53;
  v23 = v54;
  *(_QWORD *)(v21 + 16) = v51;
  *(_OWORD *)(v21 + 24) = v52;
  *(_BYTE *)(v21 + 40) = v22;
  *(_QWORD *)(v21 + 48) = v23;
  type metadata accessor for GuaranteeListRule();
  v24 = swift_allocObject();
  v25 = swift_bridgeObjectRetain();
  v26 = sub_240B49B54(v25);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v24 + 16) = v26;
  v16(v4, v14 + v5[14], v1);
  swift_allocObject();
  v27 = DomainMapDataFrame.init(withFileAtPath:)((uint64_t)v4);
  v28 = v50;
  *(_QWORD *)(v50 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_personalDomains) = v27;
  v29 = v14 + v5[8];
  v45 = *(_OWORD *)v29;
  v42 = *(_OWORD *)(v29 + 16);
  v41 = *(_OWORD *)(v29 + 32);
  v40 = *(_OWORD *)(v29 + 48);
  v30 = *(_QWORD *)(v29 + 64);
  v31 = *(_QWORD *)(v29 + 72);
  v32 = *(_QWORD *)(v29 + 80);
  type metadata accessor for FinalRule();
  v33 = swift_allocObject();
  v34 = v42;
  *(_OWORD *)(v33 + 16) = v45;
  *(_OWORD *)(v33 + 32) = v34;
  v35 = v40;
  *(_OWORD *)(v33 + 48) = v41;
  *(_OWORD *)(v33 + 64) = v35;
  *(_QWORD *)(v33 + 80) = v30;
  *(_QWORD *)(v33 + 88) = v31;
  *(_QWORD *)(v33 + 96) = v32;
  v36 = (uint64_t)v48;
  sub_240B2EF30(v14, (uint64_t)v48);
  type metadata accessor for DecisionStrategy();
  v37 = (_OWORD *)swift_allocObject();
  v38 = sub_240B460E8(v55, v36, v49, v47, v46, v44, v43, v21, v24, v33, v37);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  result = v28;
  *(_QWORD *)(v28 + 24) = v38;
  return result;
}

uint64_t MCCNLP.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  os_log_type_t v25;
  NSObject *log;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  v3 = type metadata accessor for BlackPearlModel(0);
  v4 = *(int *)(v3 + 32);
  v5 = *(void **)(v2 + v4);
  *(_QWORD *)(v2 + v4) = 0;

  v6 = type metadata accessor for BlackPearlLevels();
  v7 = v2 + *(int *)(v6 + 24);
  v8 = *(int *)(v3 + 32);
  v9 = *(void **)(v7 + v8);
  *(_QWORD *)(v7 + v8) = 0;

  v10 = v2 + *(int *)(v6 + 20);
  v11 = *(int *)(v3 + 32);
  v12 = *(void **)(v10 + v11);
  *(_QWORD *)(v10 + v11) = 0;

  if (qword_25435F0A8 != -1)
    swift_once();
  v13 = sub_240B60088();
  __swift_project_value_buffer(v13, (uint64_t)qword_25435F2B8);
  swift_retain_n();
  v14 = sub_240B60070();
  v15 = sub_240B60328();
  if (os_log_type_enabled(v14, v15))
  {
    v25 = v15;
    log = v14;
    v16 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412802;
    v18 = *(void **)(v2 + *(int *)(v3 + 32));
    if (v18)
      v19 = v18;
    sub_240B603AC();
    *v17 = v18;
    swift_release_n();
    *(_WORD *)(v16 + 12) = 2112;
    v20 = *(void **)(v2 + *(int *)(v6 + 20) + *(int *)(v3 + 32));
    if (v20)
      v21 = v20;
    sub_240B603AC();
    v17[1] = v20;
    swift_release_n();
    *(_WORD *)(v16 + 22) = 2112;
    v22 = *(void **)(v2 + *(int *)(v6 + 24) + *(int *)(v3 + 32));
    if (v22)
      v23 = v22;
    sub_240B603AC();
    v17[2] = v22;
    swift_release_n();
    _os_log_impl(&dword_240B2B000, log, v25, "Destroyed MCCNLP model  %@, %@, %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v17, -1, -1);
    MEMORY[0x24268A954](v16, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1 + 32);
  sub_240B46490(v2);
  swift_release();
  return v1;
}

uint64_t MCCNLP.__deallocating_deinit()
{
  MCCNLP.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_240B459C8@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  __int128 v25;

  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_QWORD *)a1 + 3);
  v4 = *((_QWORD *)a1 + 6);
  v5 = *((_QWORD *)a1 + 7);
  v6 = *((_BYTE *)a1 + 64);
  v7 = *((_BYTE *)a1 + 65);
  v8 = *((_BYTE *)a1 + 66);
  v9 = *((_BYTE *)a1 + 67);
  v10 = *((_BYTE *)a1 + 68);
  v11 = *((_BYTE *)a1 + 69);
  v13 = *a1;
  v14 = v2;
  v15 = v3;
  v16 = a1[2];
  v17 = v4;
  v18 = v5;
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v24 = v11;
  v25 = *(__int128 *)((char *)a1 + 72);
  return sub_240B4E8B0((uint64_t *)&v13, a2);
}

uint64_t sub_240B45A4C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = v0[7];
  v5 = v0[8];
  __swift_project_boxed_opaque_existential_1(v0 + 4, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 296))(v4, v5);
  v6 = (uint64_t)v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  sub_240B2EFCC((uint64_t)v3, v6);
  return swift_endAccess();
}

uint64_t sub_240B45B10@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];

  v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  v4 = (_OWORD *)(v3 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  v5 = v4[8];
  v6 = v4[10];
  v29 = v4[9];
  v7 = v29;
  v30[0] = v6;
  *(_OWORD *)((char *)v30 + 9) = *(_OWORD *)((char *)v4 + 169);
  v8 = v4[5];
  v10 = v4[3];
  v24 = v4[4];
  v9 = v24;
  v25 = v8;
  v11 = v4[5];
  v26 = v4[6];
  v12 = v4[6];
  v13 = v4[8];
  v27 = v4[7];
  v14 = v27;
  v28 = v13;
  v15 = v4[1];
  v16 = v4[3];
  v22 = v4[2];
  v17 = v22;
  v23 = v16;
  v18 = v4[1];
  v21[0] = *v4;
  v19 = v21[0];
  v21[1] = v18;
  a1[8] = v5;
  a1[9] = v7;
  a1[10] = v4[10];
  *(_OWORD *)((char *)a1 + 169) = *(_OWORD *)((char *)v4 + 169);
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v19;
  a1[1] = v15;
  a1[2] = v17;
  a1[3] = v10;
  return sub_240B2CA34((uint64_t)v21);
}

uint64_t sub_240B45BE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t (*)(char *), _QWORD *, uint64_t, uint64_t);

  v1 = v0[7];
  v2 = v0[8];
  __swift_project_boxed_opaque_existential_1(v0 + 4, v1);
  v3 = *(void (**)(uint64_t, uint64_t (*)(char *), _QWORD *, uint64_t, uint64_t))(v2 + 320);
  swift_retain();
  v3(3, sub_240B464CC, v0, v1, v2);
  return swift_release();
}

uint64_t sub_240B45C54(char *a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  _BYTE *v9;
  uint64_t result;
  uint64_t v11;

  v3 = *a1;
  if ((a1[1] & 1) != 0)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v4 = sub_240B60088();
    __swift_project_value_buffer(v4, (uint64_t)qword_25435F2B8);
    v5 = sub_240B60070();
    v6 = sub_240B60334();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      sub_240B33500();
      swift_allocError();
      *v9 = v3;
      v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_240B603AC();
      *v8 = v11;
      _os_log_impl(&dword_240B2B000, v5, v6, "Failed model download %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
      swift_arrayDestroy();
      MEMORY[0x24268A954](v8, -1, -1);
      MEMORY[0x24268A954](v7, -1, -1);
    }

    result = swift_beginAccess();
    *(_BYTE *)(a2 + 16) = 0;
  }
  else
  {
    result = swift_beginAccess();
    *(_BYTE *)(a2 + 16) = v3 & 1;
  }
  return result;
}

uint64_t sub_240B45E18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = sub_240B50FC4(a1, a2);
  swift_bridgeObjectRelease();
  return v2;
}

BOOL sub_240B45E48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  v0 = sub_240B60118();
  v2 = sub_240B46E38(v0, v1);
  v4 = v3;
  swift_bridgeObjectRelease();
  return (v4 & 1) == 0 && v2 > 0;
}

uint64_t sub_240B45E9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _BYTE *v10;
  uint64_t v11;

  v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  result = type metadata accessor for BlackPearlLevels();
  v5 = v3 + *(int *)(result + 28);
  if ((*(_BYTE *)(v5 + 184) & 1) != 0)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v6 = sub_240B60088();
    __swift_project_value_buffer(v6, (uint64_t)qword_25435F2B8);
    v7 = sub_240B60070();
    v8 = sub_240B60334();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_240B2B000, v7, v8, "BlackPearl Categorization version is nil", v9, 2u);
      MEMORY[0x24268A954](v9, -1, -1);
    }

    sub_240B464D4();
    swift_allocError();
    *v10 = 1;
    return swift_willThrow();
  }
  else
  {
    v11 = *(_QWORD *)(v5 + 176);
    *(_OWORD *)a1 = *(_OWORD *)(v5 + 160);
    *(_QWORD *)(a1 + 16) = v11;
  }
  return result;
}

BOOL sub_240B45FF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id sub_240B46010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_240B600D0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_240B5FE3C();

    swift_willThrow();
  }
  return v6;
}

_OWORD *sub_240B460E8(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _OWORD *a11)
{
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  id v21;
  id v22;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[6];

  v28[3] = type metadata accessor for DomainMapDataFrame();
  v28[4] = &protocol witness table for DomainMapDataFrame;
  v28[0] = a4;
  v18 = type metadata accessor for TokenMapDataFrame();
  v27[3] = v18;
  v27[4] = &protocol witness table for TokenMapDataFrame;
  v26[4] = &protocol witness table for TokenMapDataFrame;
  v27[0] = a5;
  v26[3] = v18;
  v25[4] = &protocol witness table for TokenMapDataFrame;
  v26[0] = a6;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMaxSeqLen) = 256;
  v25[3] = v18;
  v25[0] = a7;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nonCommerceCategories) = &unk_251108B78;
  v19 = a1[1];
  a11[1] = *a1;
  a11[2] = v19;
  v20 = a1[3];
  a11[3] = a1[2];
  a11[4] = v20;
  sub_240B2EF30(a2, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels);
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nerRule) = a3;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_commerceSenderRule) = a8;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_guaranteeList) = a9;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_finalRule) = a10;
  sub_240B468C0((uint64_t)v28, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
  sub_240B468C0((uint64_t)v27, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
  sub_240B468C0((uint64_t)v26, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
  sub_240B468C0((uint64_t)v25, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  objc_allocWithZone(MEMORY[0x24BDD1798]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_privateRelayRegex) = sub_240B46010(0xD000000000000041, 0x8000000240B63B30, 1);
  v21 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  v22 = sub_240B46010(0x775C5E5B7C2B775CLL, 0xEB000000005D735CLL, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
  sub_240B46490(a2);
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsRegex) = v22;
  return a11;
}

uint64_t sub_240B46490(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240B464CC(char *a1)
{
  uint64_t v1;

  return sub_240B45C54(a1, v1);
}

unint64_t sub_240B464D4()
{
  unint64_t result;

  result = qword_257088A90;
  if (!qword_257088A90)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61CC8, &type metadata for MCCNLP.Error);
    atomic_store(result, (unint64_t *)&qword_257088A90);
  }
  return result;
}

uint64_t sub_240B46518@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_240B4655C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_240B4659C()
{
  return type metadata accessor for MCCNLP();
}

uint64_t type metadata accessor for MCCNLP()
{
  uint64_t result;

  result = qword_25435E480;
  if (!qword_25435E480)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240B465E0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MCCNLP()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MCCNLP.isModelPresetLoaded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MCCNLP.isModelPresetLoaded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of MCCNLP.isModelPresetLoaded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MCCNLP.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of MCCNLP.predictCommerceEmail(decisionRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of MCCNLP.refresh()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of MCCNLP.getBlackPearlModelVersions()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of MCCNLP.scheduleImmediateDownload()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of MCCNLP.getIABCategoryID(domain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of MCCNLP.isPersonalEmail(domain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of MCCNLP.getBlackPearlCatVersion()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t getEnumTagSinglePayload for MCCNLP.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MCCNLP.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B467E8 + 4 * byte_240B61B85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240B4681C + 4 * byte_240B61B80[v4]))();
}

uint64_t sub_240B4681C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B46824(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B4682CLL);
  return result;
}

uint64_t sub_240B46838(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B46840);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240B46844(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B4684C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_240B46858(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MCCNLP.Error()
{
  return &type metadata for MCCNLP.Error;
}

unint64_t sub_240B4687C()
{
  unint64_t result;

  result = qword_257088A98;
  if (!qword_257088A98)
  {
    result = MEMORY[0x24268A8B8](&unk_240B61CA0, &type metadata for MCCNLP.Error);
    atomic_store(result, (unint64_t *)&qword_257088A98);
  }
  return result;
}

uint64_t sub_240B468C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_240B46904()
{
  uint64_t v0;

  v0 = sub_240B474B4((uint64_t)&unk_2511089A0);
  swift_arrayDestroy();
  return v0;
}

uint64_t DomainMapDataFrame.__allocating_init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  DomainMapDataFrame.init(withFileAtPath:)(a1);
  return v2;
}

uint64_t DomainMapDataFrame.init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  char *v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  char *v30;
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
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v2 = sub_240B60040();
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v36 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_240B5FF14();
  v35 = *(_QWORD *)(v41 - 8);
  v4 = MEMORY[0x24BDAC7A8](v41);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v30 = (char *)&v29 - v7;
  v8 = sub_240B60004();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v31 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_240B60064();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_240B60028();
  v42 = *(_QWORD *)(v34 - 8);
  v14 = MEMORY[0x24BDAC7A8](v34);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v29 - v17;
  v39 = a1;
  if ((sub_240B5FE60() & 1) != 0)
  {
    sub_240B474B4((uint64_t)&unk_2511089A0);
    swift_arrayDestroy();
    sub_240B474B4((uint64_t)&unk_251108A60);
    swift_arrayDestroy();
    sub_240B474B4((uint64_t)&unk_251108AC0);
    swift_arrayDestroy();
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDF5FB8], v10);
    sub_240B6001C();
    v19 = v35;
    v20 = v39;
    v21 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v30, v39, v41);
    v22 = v34;
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v16, v18, v34);
    sub_240B47174(MEMORY[0x24BEE4AF8]);
    v23 = v31;
    sub_240B5FFA4();
    v24 = v40;
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v40 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe, v23, v33);
    swift_beginAccess();
    v26 = v36;
    v25 = v37;
    v27 = v38;
    (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v36, *MEMORY[0x24BDF5EF8], v38);
    sub_240B5FFEC();
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v22);
    return v24;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v6, v39, v41);
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_240B6043C();
    swift_bridgeObjectRelease();
    v43 = 0xD000000000000014;
    v44 = 0x8000000240B63C30;
    sub_240B34E98();
    sub_240B60598();
    sub_240B60184();
    swift_bridgeObjectRelease();
    result = sub_240B60490();
    __break(1u);
  }
  return result;
}

uint64_t sub_240B46E38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v22 = a1;
  v23 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F010);
  v20 = *(_QWORD *)(v3 - 8);
  v21 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_240B60004();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F008);
  v10 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v2 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe;
  swift_beginAccess();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v9, v13, v6);
  sub_240B60010();
  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  v16 = sub_240B47650((uint64_t)v12, v22, v23);
  if ((v17 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v24);
  }
  else
  {
    v14(v9, v13, v6);
    sub_240B60010();
    v15(v9, v6);
    v18 = v21;
    sub_240B60058();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v18);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v24);
    return v25;
  }
  return v16;
}

uint64_t sub_240B47058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_240B47650(a1, a2, a3);
}

uint64_t DomainMapDataFrame.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe;
  v2 = sub_240B60004();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t DomainMapDataFrame.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe;
  v2 = sub_240B60004();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_240B47104@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  type metadata accessor for DomainMapDataFrame();
  v4 = swift_allocObject();
  result = DomainMapDataFrame.init(withFileAtPath:)(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_240B47150(uint64_t a1, uint64_t a2)
{
  return sub_240B46E38(a1, a2);
}

unint64_t sub_240B47174(uint64_t a1)
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
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088AA0);
  v6 = sub_240B604C0();
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
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_240B4794C(v12, (uint64_t)v5);
    v14 = *v5;
    v15 = v5[1];
    result = sub_240B4730C(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = sub_240B60064();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18, v9, v21);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
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

unint64_t sub_240B4730C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_240B60628();
  sub_240B60148();
  v4 = sub_240B60640();
  return sub_240B47370(a1, a2, v4);
}

unint64_t sub_240B47370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_240B605A4() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_240B605A4() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_240B605A4() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_240B474B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0D8);
    v3 = sub_240B60424();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = (uint64_t *)(v6 + 16 * v4);
      v9 = *v7;
      v8 = v7[1];
      sub_240B60628();
      swift_bridgeObjectRetain();
      sub_240B60148();
      result = sub_240B60640();
      v11 = -1 << *(_BYTE *)(v3 + 32);
      v12 = result & ~v11;
      v13 = v12 >> 6;
      v14 = *(_QWORD *)(v5 + 8 * (v12 >> 6));
      v15 = 1 << v12;
      if (((1 << v12) & v14) != 0)
      {
        v16 = *(_QWORD *)(v3 + 48);
        v17 = (_QWORD *)(v16 + 16 * v12);
        v18 = *v17 == v9 && v17[1] == v8;
        if (v18 || (result = sub_240B605A4(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v19 = ~v11;
        while (1)
        {
          v12 = (v12 + 1) & v19;
          v13 = v12 >> 6;
          v14 = *(_QWORD *)(v5 + 8 * (v12 >> 6));
          v15 = 1 << v12;
          if ((v14 & (1 << v12)) == 0)
            break;
          v20 = (_QWORD *)(v16 + 16 * v12);
          if (*v20 != v9 || v20[1] != v8)
          {
            result = sub_240B605A4();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v13) = v15 | v14;
      v22 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v12);
      *v22 = v9;
      v22[1] = v8;
      v23 = *(_QWORD *)(v3 + 16);
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v25;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_240B47650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25435F008);
  v5 = sub_240B6004C();
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      if (__OFSUB__(v6, v7))
      {
        __break(1u);
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
      v8 = v7 + (v6 - v7) / 2;
      if (__OFADD__(v7, (v6 - v7) / 2))
        goto LABEL_22;
      sub_240B60058();
      if (!v16)
        break;
      if (v15 == a2 && v16 == a3 || (sub_240B605A4() & 1) != 0)
        goto LABEL_14;
      v9 = sub_240B605A4();
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
      {
        v7 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
LABEL_14:
          swift_bridgeObjectRelease();
          return v8;
        }
        v8 = v6;
      }
      v6 = v8;
      if (v7 >= v8)
        return 0;
    }
    if (qword_25435F0A8 == -1)
      goto LABEL_16;
LABEL_23:
    swift_once();
LABEL_16:
    v10 = sub_240B60088();
    __swift_project_value_buffer(v10, (uint64_t)qword_25435F2B8);
    v11 = sub_240B60070();
    v12 = sub_240B60334();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_240B2B000, v11, v12, "Index out of bound, returning nil", v13, 2u);
      MEMORY[0x24268A954](v13, -1, -1);
    }

  }
  return 0;
}

uint64_t sub_240B47838()
{
  return type metadata accessor for DomainMapDataFrame();
}

uint64_t type metadata accessor for DomainMapDataFrame()
{
  uint64_t result;

  result = qword_25435F078;
  if (!qword_25435F078)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240B4787C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_240B60004();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DomainMapDataFrame()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DomainMapDataFrame.__allocating_init(withFileAtPath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of DomainMapDataFrame.lookup(domain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of DomainMapDataFrame.binarySearch(cols:key:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t sub_240B4794C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

MCCKitCategorization::Category_optional __swiftcall Category.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = rawValue + 2;
  if ((unint64_t)(rawValue + 2) >= 9)
    v2 = 9;
  *v1 = v2;
  return (MCCKitCategorization::Category_optional)rawValue;
}

void static Category.getCategory(for:)(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v3 = sub_240B60124();
  v4 = v2;
  if (v3 == 0x4C414E4F53524550 && v2 == 0xE800000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 2;
  }
  else if (v3 == 0x4F49544F4D4F5250 && v4 == 0xEA0000000000534ELL || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 3;
  }
  else if (v3 == 0x4C4149434F53 && v4 == 0xE600000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 4;
  }
  else if (v3 == 0x544341534E415254 && v4 == 0xEC000000534E4F49 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 5;
  }
  else if (v3 == 1398228302 && v4 == 0xE400000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 6;
  }
  else
  {
    if (v3 == 0x53524548544FLL && v4 == 0xE600000000000000 || (sub_240B605A4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v3 == 0xD000000000000014 && v4 == 0x8000000240B63CB0 || (sub_240B605A4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 0;
        goto LABEL_5;
      }
      if (v3 == 0x41535F504F4ELL && v4 == 0xE600000000000000 || (sub_240B605A4() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v5 = 8;
        goto LABEL_5;
      }
      if (v3 == 0x524F525245 && v4 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        v5 = 1;
        goto LABEL_5;
      }
      v6 = sub_240B605A4();
      swift_bridgeObjectRelease();
      if ((v6 & 1) != 0)
      {
        v5 = 1;
        goto LABEL_5;
      }
      if (qword_25435F0A8 != -1)
        swift_once();
      v7 = sub_240B60088();
      __swift_project_value_buffer(v7, (uint64_t)qword_25435F2B8);
      swift_bridgeObjectRetain_n();
      v8 = sub_240B60070();
      v9 = sub_240B60334();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        v11 = swift_slowAlloc();
        v14 = v11;
        *(_DWORD *)v10 = 136315138;
        v12 = sub_240B60124();
        sub_240B335B4(v12, v13, &v14);
        sub_240B603AC();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_240B2B000, v8, v9, "Invalid category key: %s", v10, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24268A954](v11, -1, -1);
        MEMORY[0x24268A954](v10, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    v5 = 7;
  }
LABEL_5:
  *a1 = v5;
}

uint64_t static Category.getCategoryText(for:)(unsigned __int8 *a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_240B47F18 + 4 * byte_240B61D70[*a1]))(0x4C414E4F53524550, 0xE800000000000000);
}

unint64_t sub_240B47F18()
{
  return 0xD000000000000014;
}

uint64_t sub_240B47F34()
{
  return 0x524F525245;
}

uint64_t sub_240B47F48()
{
  return 0x4F49544F4D4F5250;
}

uint64_t sub_240B47F64()
{
  return 0x4C4149434F53;
}

uint64_t sub_240B47F78()
{
  return 0x544341534E415254;
}

uint64_t sub_240B47F98()
{
  return 1398228302;
}

uint64_t sub_240B47FA8()
{
  return 0x53524548544FLL;
}

uint64_t sub_240B47FBC()
{
  return 0x41535F504F4ELL;
}

void *static Category.allCases.getter()
{
  return &unk_251108B20;
}

uint64_t Category.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 - 2;
}

uint64_t sub_240B47FE8()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

uint64_t sub_240B4802C()
{
  return sub_240B60634();
}

uint64_t sub_240B48058()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

MCCKitCategorization::Category_optional sub_240B48098(Swift::Int *a1)
{
  return Category.init(rawValue:)(*a1);
}

void sub_240B480A0(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 - 2;
}

void sub_240B480B0(_QWORD *a1@<X8>)
{
  *a1 = &unk_251108B20;
}

unint64_t sub_240B480C4()
{
  unint64_t result;

  result = qword_25435F098;
  if (!qword_25435F098)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for Category, &type metadata for Category);
    atomic_store(result, (unint64_t *)&qword_25435F098);
  }
  return result;
}

unint64_t sub_240B4810C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257088AA8;
  if (!qword_257088AA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257088AB0);
    result = MEMORY[0x24268A8B8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257088AA8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Category(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Category(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_240B48234 + 4 * byte_240B61D7E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_240B48268 + 4 * byte_240B61D79[v4]))();
}

uint64_t sub_240B48268(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B48270(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B48278);
  return result;
}

uint64_t sub_240B48284(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B4828CLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_240B48290(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B48298(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Category()
{
  return &type metadata for Category;
}

id HashingVectorizer.init(charNgramLow:charNgramHigh:tokenNgramLow:tokenNgramHigh:buckets:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  id v12;
  id result;

  v12 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  result = sub_240B46010(0x100000000000001ALL, 0x8000000240B63A30, 0);
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  a6[5] = 0x100000000000001ALL;
  a6[6] = 0x8000000240B63A30;
  a6[7] = result;
  return result;
}

uint64_t sub_240B48404(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v11;
  _QWORD *v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v11 = (_QWORD *)(a8 + 16);
  swift_beginAccess();
  v12 = *(_QWORD **)(a8 + 16);
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a8 + 16) = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v12 = sub_240B3FE48(0, v12[2] + 1, 1, v12);
    *v11 = v12;
  }
  v15 = v12[2];
  v14 = v12[3];
  if (v15 >= v14 >> 1)
  {
    v12 = sub_240B3FE48((_QWORD *)(v14 > 1), v15 + 1, 1, v12);
    *v11 = v12;
  }
  v16 = 0xE000000000000000;
  if (a2)
  {
    v16 = a2;
    v17 = a1;
  }
  else
  {
    v17 = 0;
  }
  v12[2] = v15 + 1;
  v18 = &v12[2 * v15];
  v18[4] = v17;
  v18[5] = v16;
  return swift_endAccess();
}

uint64_t sub_240B484F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;

  v34 = result;
  v6 = a2 - 1;
  if (__OFSUB__(a2, 1))
    goto LABEL_41;
  if (__OFSUB__(a3, 1))
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (a3 - 1 >= a4)
    v7 = a4;
  else
    v7 = a3 - 1;
  if (v7 < v6)
    goto LABEL_43;
  if (v6 == v7)
    return result;
  v33 = *(_QWORD *)(v5 + 32);
  if (v33)
  {
    v9 = a2;
    while (1)
    {
      if (v9 - 1 >= v7)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      if (v6 < 0)
        goto LABEL_36;
      if ((unint64_t)(v9 - 1) >= *(_QWORD *)(*(_QWORD *)v34 + 16))
        goto LABEL_37;
      v10 = *(unsigned int *)(*(_QWORD *)v34 + 4 * v9 + 28);
      if ((v10 & 1) != 0)
        v11 = 1;
      else
        v11 = -1;
      v12 = (uint64_t)(v10 >> 1) % v33;
      v13 = *a5;
      v14 = *(_QWORD *)(*a5 + 16);
      if (v14)
      {
        v15 = sub_240B35ECC(v12);
        if ((v16 & 1) != 0)
          v14 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v15);
        else
          v14 = 0;
      }
      v17 = v14 + v11;
      if (__OFADD__(v14, v11))
        goto LABEL_38;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v19 = *a5;
      v35 = (_QWORD *)*a5;
      *a5 = 0x8000000000000000;
      v21 = sub_240B35ECC(v12);
      v22 = *(_QWORD *)(v19 + 16);
      v23 = (v20 & 1) == 0;
      v24 = v22 + v23;
      if (__OFADD__(v22, v23))
        goto LABEL_39;
      v25 = v20;
      if (*(_QWORD *)(v19 + 24) >= v24)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v28 = v35;
          if ((v20 & 1) != 0)
            goto LABEL_11;
        }
        else
        {
          sub_240B378A8();
          v28 = v35;
          if ((v25 & 1) != 0)
            goto LABEL_11;
        }
      }
      else
      {
        sub_240B3684C(v24, isUniquelyReferenced_nonNull_native);
        v26 = sub_240B35ECC(v12);
        if ((v25 & 1) != (v27 & 1))
          goto LABEL_45;
        v21 = v26;
        v28 = v35;
        if ((v25 & 1) != 0)
        {
LABEL_11:
          *(_QWORD *)(v28[7] + 8 * v21) = v17;
          goto LABEL_12;
        }
      }
      v28[(v21 >> 6) + 8] |= 1 << v21;
      v29 = 8 * v21;
      *(_QWORD *)(v28[6] + v29) = v12;
      *(_QWORD *)(v28[7] + v29) = v17;
      v30 = v28[2];
      v31 = __OFADD__(v30, 1);
      v32 = v30 + 1;
      if (v31)
        goto LABEL_40;
      v28[2] = v32;
LABEL_12:
      *a5 = (uint64_t)v28;
      result = swift_bridgeObjectRelease();
      if (v7 + 1 == ++v9)
        return result;
    }
  }
LABEL_44:
  __break(1u);
LABEL_45:
  result = sub_240B605D4();
  __break(1u);
  return result;
}

uint64_t sub_240B48738(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;

  v8 = *v3;
  v7 = v3[1];
  v9 = v3[4];
  swift_bridgeObjectRetain();
  v10 = sub_240B60154();
  if (v10)
  {
    v11 = v10;
    v50 = sub_240B492D4(v10, 0);
    swift_bridgeObjectRetain();
    v12 = sub_240B4921C(&v54, v50 + 4, v11, a1, a2);
    swift_bridgeObjectRelease();
    if (v12 != (_QWORD *)v11)
      goto LABEL_57;
    swift_bridgeObjectRelease();
    if (v7 >= v8)
      goto LABEL_4;
  }
  else
  {
    swift_bridgeObjectRelease();
    v50 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v7 >= v8)
    {
LABEL_4:
      if (v8 == v7)
        return swift_release();
      v49 = v50[2];
      v14 = MEMORY[0x24BEE4AF8];
      v48 = v7;
      while (1)
      {
        if (v8 >= v7)
          goto LABEL_53;
        v15 = v49 - v8;
        if (__OFSUB__(v49, v8))
          goto LABEL_54;
        v16 = __OFADD__(v15, 1);
        v17 = v15 + 1;
        if (v16)
          goto LABEL_55;
        if (v17 > 0)
          break;
LABEL_7:
        ++v8;
        v7 = v48;
        if (v8 == v48)
          return swift_release();
      }
      if (v9)
      {
        v18 = 0;
        v19 = v50 + 5;
        v51 = v17;
        v52 = v8;
        while (1)
        {
          v54 = v14;
          v20 = v18 + v8;
          if (__OFADD__(v18, v8))
            goto LABEL_47;
          if (v20 < (uint64_t)v18)
            goto LABEL_48;
          if (v18 != v20)
          {
            v21 = v50[2];
            v22 = v18 < v21 && v20 <= (uint64_t)v21;
            v23 = v19;
            if (!v22)
              goto LABEL_51;
            do
            {
              v24 = *(v23 - 1);
              v25 = *v23;
              swift_bridgeObjectRetain();
              sub_240B4DB30(v24, v25);
              v23 += 2;
              --v8;
            }
            while (v8);
            v14 = v54;
          }
          v26 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v14, 0);
          swift_bridgeObjectRelease();
          if ((v26 & 1) != 0)
            v27 = 1;
          else
            v27 = -1;
          v28 = (v26 >> 1) % v9;
          v29 = *a3;
          v30 = *(_QWORD *)(*a3 + 16);
          if (v30)
          {
            v31 = sub_240B35ECC(v28);
            if ((v32 & 1) != 0)
              v30 = *(_QWORD *)(*(_QWORD *)(v29 + 56) + 8 * v31);
            else
              v30 = 0;
          }
          v33 = v30 + v27;
          if (__OFADD__(v30, v27))
            goto LABEL_49;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v35 = *a3;
          v53 = (_QWORD *)*a3;
          *a3 = 0x8000000000000000;
          v37 = sub_240B35ECC(v28);
          v38 = *(_QWORD *)(v35 + 16);
          v39 = (v36 & 1) == 0;
          v40 = v38 + v39;
          if (__OFADD__(v38, v39))
            goto LABEL_50;
          v41 = v36;
          if (*(_QWORD *)(v35 + 24) >= v40)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v44 = v53;
              if ((v36 & 1) != 0)
                goto LABEL_14;
            }
            else
            {
              sub_240B378A8();
              v44 = v53;
              if ((v41 & 1) != 0)
                goto LABEL_14;
            }
          }
          else
          {
            sub_240B3684C(v40, isUniquelyReferenced_nonNull_native);
            v42 = sub_240B35ECC(v28);
            if ((v41 & 1) != (v43 & 1))
              goto LABEL_58;
            v37 = v42;
            v44 = v53;
            if ((v41 & 1) != 0)
            {
LABEL_14:
              *(_QWORD *)(v44[7] + 8 * v37) = v33;
              goto LABEL_15;
            }
          }
          v44[(v37 >> 6) + 8] |= 1 << v37;
          v45 = 8 * v37;
          *(_QWORD *)(v44[6] + v45) = v28;
          *(_QWORD *)(v44[7] + v45) = v33;
          v46 = v44[2];
          v16 = __OFADD__(v46, 1);
          v47 = v46 + 1;
          if (v16)
            goto LABEL_52;
          v44[2] = v47;
LABEL_15:
          ++v18;
          *a3 = (uint64_t)v44;
          swift_bridgeObjectRelease();
          v19 += 2;
          v8 = v52;
          v14 = MEMORY[0x24BEE4AF8];
          if (v18 == v51)
            goto LABEL_7;
        }
      }
      goto LABEL_56;
    }
  }
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
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  result = sub_240B605D4();
  __break(1u);
  return result;
}

uint64_t sub_240B48AA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD v34[5];

  v4 = v3[3];
  v32 = v3[2];
  v5 = (void *)v3[7];
  v6 = sub_240B60154();
  v7 = (void *)sub_240B600D0();
  v8 = (void *)sub_240B600D0();
  v9 = objc_msgSend(v5, sel_stringByReplacingMatchesInString_options_range_withTemplate_, v7, 0, 0, v6, v8);

  v10 = sub_240B600F4();
  v12 = v11;

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = MEMORY[0x24BEE4AF8];
  v14 = (uint64_t *)(v13 + 16);
  v15 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v15 = v10;
  v16 = 11;
  if (((v12 >> 60) & ((v10 & 0x800000000000000) == 0)) == 0)
    v16 = 7;
  v34[1] = 15;
  v34[2] = v16 | (v15 << 16);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088AB8);
  sub_240B34A2C();
  sub_240B49374();
  sub_240B603DC();
  swift_bridgeObjectRelease();
  swift_release();
  swift_beginAccess();
  v17 = *v14;
  swift_bridgeObjectRetain();
  swift_release();
  result = sub_240B3E48C(0, v4);
  v19 = result;
  v34[0] = result;
  v20 = *(_QWORD *)(v17 + 16);
  if (v20)
  {
    v21 = 0;
    while (v21 < *(_QWORD *)(v17 + 16))
    {
      v22 = (uint64_t *)(v17 + 32 + 16 * v21);
      v23 = *v22;
      v24 = v22[1];
      swift_bridgeObjectRetain();
      v25 = sub_240B3FF54(v23, v24);
      v26 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v25, 0);
      swift_bridgeObjectRelease();
      swift_release();
      if (v4 > 2)
      {
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_240B40158(v19);
          v19 = result;
        }
        v27 = v4;
        while (1)
        {
          v28 = v27 - 1;
          if (v4 <= v27 - 1)
            break;
          v29 = *(_QWORD *)(v19 + 16);
          if (v27 - 3 >= v29)
            goto LABEL_25;
          if (v27 - 2 >= v29)
            goto LABEL_26;
          v30 = v19 + 4 * v27;
          LODWORD(v31) = v26 ^ __ROR4__(*(_DWORD *)(v30 + 20), 9);
          HIDWORD(v31) = v31;
          *(_DWORD *)(v30 + 24) = (v31 >> 5) + v26;
          v27 = v28;
          if (v28 == 2)
            goto LABEL_9;
        }
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        break;
      }
LABEL_9:
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) != 0)
      {
        if (!*(_QWORD *)(v19 + 16))
          goto LABEL_28;
      }
      else
      {
        result = (uint64_t)sub_240B40158(v19);
        v19 = result;
        if (!*(_QWORD *)(result + 16))
          goto LABEL_28;
      }
      ++v21;
      *(_DWORD *)(v19 + 32) = v26;
      v34[0] = v19;
      result = sub_240B484F0((uint64_t)v34, v32, v4, v21, a3);
      if (v21 == v20)
        goto LABEL_23;
    }
    __break(1u);
LABEL_28:
    __break(1u);
  }
  else
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_240B48DF8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD *v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v1 = *(_QWORD *)(v0 + 32);
  v22 = sub_240B5E6FC(MEMORY[0x24BEE4AF8]);
  v2 = sub_240B60118();
  v4 = v3;
  sub_240B48738(v2, v3, (uint64_t *)&v22);
  sub_240B48AA8(v2, v4, (uint64_t *)&v22);
  swift_bridgeObjectRelease();
  result = sub_240B3E574(0, v1);
  v6 = (_QWORD *)result;
  v7 = 0;
  v8 = v22;
  v9 = 1 << *(_BYTE *)(v22 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v22 + 64;
  v12 = v10 & *(_QWORD *)(v22 + 64);
  v13 = (unint64_t)(v9 + 63) >> 6;
  if (!v12)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v7 << 6); ; i = __clz(__rbit64(v17)) + (v7 << 6))
  {
    v19 = 8 * i;
    v20 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    v21 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + v19);
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
    {
      if ((v20 & 0x8000000000000000) != 0)
        goto LABEL_25;
    }
    else
    {
      result = (uint64_t)sub_240B4016C(v6);
      v6 = (_QWORD *)result;
      if ((v20 & 0x8000000000000000) != 0)
      {
LABEL_25:
        __break(1u);
LABEL_26:
        swift_release();
        return (uint64_t)v6;
      }
    }
    if (v20 >= v6[2])
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    v6[v20 + 4] = v21;
    if (v12)
      goto LABEL_4;
LABEL_5:
    v16 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_28;
    if (v16 >= v13)
      goto LABEL_26;
    v17 = *(_QWORD *)(v11 + 8 * v16);
    ++v7;
    if (!v17)
    {
      v7 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_26;
      v17 = *(_QWORD *)(v11 + 8 * v7);
      if (!v17)
      {
        v7 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_26;
        v17 = *(_QWORD *)(v11 + 8 * v7);
        if (!v17)
          break;
      }
    }
LABEL_18:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_26;
  v17 = *(_QWORD *)(v11 + 8 * v18);
  if (v17)
  {
    v7 = v18;
    goto LABEL_18;
  }
  while (1)
  {
    v7 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v7 >= v13)
      goto LABEL_26;
    v17 = *(_QWORD *)(v11 + 8 * v7);
    ++v18;
    if (v17)
      goto LABEL_18;
  }
LABEL_29:
  __break(1u);
  return result;
}

void destroy for HashingVectorizer(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for HashingVectorizer(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  void *v4;
  id v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v4 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for HashingVectorizer(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[7];
  v5 = (void *)a1[7];
  a1[7] = v4;
  v6 = v4;

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

uint64_t assignWithTake for HashingVectorizer(uint64_t a1, _OWORD *a2)
{
  __int128 v4;
  void *v5;

  v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = a2[2];
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for HashingVectorizer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HashingVectorizer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HashingVectorizer()
{
  return &type metadata for HashingVectorizer;
}

_QWORD *sub_240B4921C(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v5 = result;
  v6 = HIBYTE(a5) & 0xF;
  v12 = a4;
  v13 = a5;
  if ((a5 & 0x2000000000000000) == 0)
    v6 = a4 & 0xFFFFFFFFFFFFLL;
  v14 = v6;
  if (!a2)
  {
    v7 = 0;
LABEL_14:
    *v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (_QWORD *)v7;
  }
  v7 = a3;
  if (!a3)
    goto LABEL_14;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = a2;
    v9 = 0;
    while (1)
    {
      v10 = sub_240B60190();
      if (!v11)
        break;
      ++v9;
      *v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    v7 = v9;
LABEL_13:
    v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

_QWORD *sub_240B492D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088AC8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_240B49348()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_240B4936C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  return sub_240B48404(a1, a2, a3, a4, a5, a6, a7, v7);
}

unint64_t sub_240B49374()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257088AC0;
  if (!qword_257088AC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257088AB8);
    result = MEMORY[0x24268A8B8](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_257088AC0);
  }
  return result;
}

uint64_t GuaranteeListRule.__allocating_init(fromBloomFilterFiles:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = swift_allocObject();
  v3 = sub_240B49B54(a1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = v3;
  return v2;
}

uint64_t GuaranteeListRule.init(fromBloomFilterFiles:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = sub_240B49B54(a1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  return v1;
}

void sub_240B49450(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  int v50;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;

  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    LOBYTE(v4) = 9;
    goto LABEL_53;
  }
  v44 = a3;
  v7 = v4 + 32;
  swift_bridgeObjectRetain();
  v8 = 0;
  v9 = 3432918353;
  v10 = 461845907;
  v49 = a2;
  v45 = v4;
  v42 = v4 + 32;
  v43 = v5;
LABEL_3:
  if (v8 >= *(_QWORD *)(v4 + 16))
    goto LABEL_57;
  v11 = v7 + 48 * v8;
  v50 = *(unsigned __int8 *)(v11 + 24);
  v52 = *(_QWORD *)(v11 + 32);
  v46 = *(_BYTE *)(v11 + 40);
  v47 = *(_QWORD *)v11;
  v48 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = sub_240B3FF54(a1, a2);
  swift_bridgeObjectRelease();
  v13 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v12, 0);
  swift_release();
  if ((v52 & 0x8000000000000000) != 0 || HIDWORD(v52))
  {
    while (1)
    {
LABEL_60:
      sub_240B60484();
      __break(1u);
    }
  }
  if (!(_DWORD)v52)
  {
LABEL_58:
    __break(1u);
LABEL_59:
    swift_once();
    goto LABEL_48;
  }
  v14 = sub_240B3F904(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v16 = v14[2];
  v15 = v14[3];
  v17 = v16 + 1;
  if (v16 >= v15 >> 1)
    v14 = sub_240B3F904((_QWORD *)(v15 > 1), v16 + 1, 1, v14);
  v14[2] = v17;
  v14[v16 + 4] = v13 % v52;
  if (v50)
  {
    v18 = 0;
    do
    {
      ++v18;
      swift_bridgeObjectRetain();
      v19 = sub_240B3FF54(a1, a2);
      swift_bridgeObjectRelease();
      v4 = *(_QWORD *)(v19 + 16);
      v20 = v18;
      if (v4 >= 4)
      {
        v21 = 0;
        v22 = (v4 + 3) >> 2;
        v20 = v18;
        do
        {
          if (!v22 || v21 + 1 >= v4 || v21 + 2 >= v4 || v21 + 3 >= v4)
          {
            __break(1u);
            goto LABEL_51;
          }
          HIDWORD(v23) = (461845907
                        * ((380141568 * *(_DWORD *)(v19 + 32 + v21)) | ((-862048943
                                                                                     * *(_DWORD *)(v19 + 32 + v21)) >> 17))) ^ v20;
          LODWORD(v23) = HIDWORD(v23);
          v20 = 5 * (v23 >> 19) - 430675100;
          --v22;
          v21 += 4;
        }
        while (4 * (v4 >> 2) != v21);
      }
      v24 = v4 & 0x7FFFFFFFFFFFFFFCLL;
      if ((v4 & 0x7FFFFFFFFFFFFFFCLL) < v4)
      {
        v25 = *(_QWORD *)(v19 + 16) & 3;
        if ((v4 & 3) != 0)
        {
          v26 = v24 + v25 - 1;
          if (v26 >= (uint64_t)v4)
            goto LABEL_54;
          v27 = v19 + 32;
          v28 = *(unsigned __int8 *)(v19 + 32 + v25 - 1 + v24);
          if (v25 != 1)
          {
            if (v26 >= (uint64_t)v4)
              goto LABEL_54;
            v28 = *(unsigned __int8 *)(v27 + v25 - 2 + v24) | (v28 << 8);
            if (v25 != 2)
            {
              if (v26 >= (uint64_t)v4)
              {
LABEL_54:
                __break(1u);
LABEL_55:
                __break(1u);
LABEL_56:
                __break(1u);
LABEL_57:
                __break(1u);
                goto LABEL_58;
              }
              v28 = *(unsigned __int8 *)(v25 + v24 + v27 - 3) | (v28 << 8);
            }
          }
        }
        else
        {
          v28 = 0;
        }
        v20 ^= 461845907 * ((380141568 * v28) | ((-862048943 * v28) >> 17));
      }
      if (HIDWORD(v4))
        goto LABEL_60;
      swift_release();
      v30 = v14[2];
      v29 = v14[3];
      v17 = v30 + 1;
      if (v30 >= v29 >> 1)
        v14 = sub_240B3F904((_QWORD *)(v29 > 1), v30 + 1, 1, v14);
      v31 = -2048144789 * (v20 ^ v4 ^ ((v20 ^ v4) >> 16));
      v14[2] = v17;
      v14[v30 + 4] = ((-1028477387 * (v31 ^ (v31 >> 13))) ^ ((-1028477387 * (v31 ^ (v31 >> 13))) >> 16))
                   % v52;
      a2 = v49;
    }
    while (v18 != v50);
  }
  v32 = 0;
  LOBYTE(v4) = v47;
  v8 = v48 + 1;
  do
  {
    v33 = v14[v32 + 4];
    v34 = v33 + 7;
    if (v33 >= 0)
      v34 = v14[v32 + 4];
    v35 = v33 - (v34 & 0xFFFFFFFFFFFFFFF8);
    if (v35 >= 1)
      v36 = 2 << (v35 - 1);
    else
      v36 = 2uLL >> (1 - v35);
    if (v33 < -7)
      goto LABEL_55;
    v37 = v34 >> 3;
    if (v37 >= *(_QWORD *)(v47 + 16))
      goto LABEL_56;
    if ((*(_BYTE *)(v47 + 32 + v37) & v36) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v7 = v42;
      v4 = v45;
      if (v8 == v43)
      {
        swift_bridgeObjectRelease();
        LOBYTE(v4) = 9;
        goto LABEL_52;
      }
      goto LABEL_3;
    }
    ++v32;
  }
  while (v17 != v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v53 = 0;
  v54 = 0xE000000000000000;
  LOBYTE(v4) = v46;
  sub_240B60478();
  a2 = v53;
  v9 = v54;
  if (qword_25435F0A8 != -1)
    goto LABEL_59;
LABEL_48:
  v38 = sub_240B60088();
  __swift_project_value_buffer(v38, (uint64_t)qword_25435F2B8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v10 = sub_240B60070();
  v39 = sub_240B6031C();
  if (os_log_type_enabled((os_log_t)v10, v39))
  {
    v40 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v53 = v41;
    *(_DWORD *)v40 = 136315394;
    swift_bridgeObjectRetain();
    sub_240B335B4(a1, v49, &v53);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v40 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_240B335B4(a2, v9, &v53);
    LOBYTE(v4) = v46;
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_240B2B000, (os_log_t)v10, v39, "Sender %s detected in %s bloom filter", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v41, -1, -1);
    MEMORY[0x24268A954](v40, -1, -1);

    goto LABEL_52;
  }
LABEL_51:

  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
LABEL_52:
  a3 = v44;
LABEL_53:
  *a3 = v4;
}

uint64_t GuaranteeListRule.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t GuaranteeListRule.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

_QWORD *sub_240B49B54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _UNKNOWN **v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v25;
  unint64_t v26;
  _QWORD *result;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned __int8 v39;
  uint64_t v40;
  char v41;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_240B5FF14();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 9;
  v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v10 = &off_251108000;
  v11 = &byte_251108B40;
  v31 = v4;
  v32 = a1;
  v29 = v8;
  v30 = v5;
  while (1)
  {
    v15 = *v11++;
    v14 = v15;
    if (v15 == 2)
      goto LABEL_3;
    if (v14 < 2 || *((unsigned __int8 *)v10 + 2929) == v14)
      goto LABEL_3;
    if (!*(_QWORD *)(a1 + 16))
      break;
    v17 = sub_240B35E0C(v14);
    if ((v18 & 1) == 0)
      break;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v4, *(_QWORD *)(a1 + 56) + *(_QWORD *)(v6 + 72) * v17, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
      goto LABEL_18;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    type metadata accessor for BloomFilterSerDe();
    static BloomFilterSerDe.readFromFile(withFilePath:)((uint64_t)v8);
    v19 = v36;
    v20 = v37;
    v21 = v38;
    v22 = v39;
    v23 = v40;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = v22;
    v33 = v23;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v35 = sub_240B3FA10(0, v35[2] + 1, 1, v35);
    v26 = v35[2];
    v25 = v35[3];
    if (v26 >= v25 >> 1)
      v35 = sub_240B3FA10((_QWORD *)(v25 > 1), v26 + 1, 1, v35);
    v12 = v35;
    v35[2] = v26 + 1;
    v13 = &v12[6 * v26];
    v13[4] = v19;
    v13[5] = v20;
    v13[6] = v21;
    *((_BYTE *)v13 + 56) = v34;
    v13[8] = v33;
    *((_BYTE *)v13 + 72) = v14;
    v8 = v29;
    v5 = v30;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v29, v30);
    v4 = v31;
    a1 = v32;
    v10 = &off_251108000;
LABEL_3:
    if (!--v9)
      return v35;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
LABEL_18:
  sub_240B42160((uint64_t)v4);
  v36 = 0;
  v37 = 0xE000000000000000;
  sub_240B6043C();
  sub_240B60184();
  v41 = v14;
  sub_240B60478();
  result = (_QWORD *)sub_240B60490();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for GuaranteeListRule()
{
  return objc_opt_self();
}

uint64_t method lookup function for GuaranteeListRule()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GuaranteeListRule.__allocating_init(fromBloomFilterFiles:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_240B49EB8()
{
  uint64_t v0;

  v0 = sub_240B60088();
  __swift_allocate_value_buffer(v0, qword_25435F2B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25435F2B8);
  swift_bridgeObjectRetain();
  return sub_240B6007C();
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

uint64_t static MurmurHash3.getMurmurHash3(text:seed:)(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRetain();
  v6 = sub_240B3FF54(a1, a2);
  swift_bridgeObjectRelease();
  v7 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v6, a3);
  swift_release();
  return v7;
}

unint64_t sub_240B49FF4(unint64_t result, uint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  BOOL v4;
  unint64_t v5;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = v2 >= result;
  v5 = v2 - result;
  v4 = v5 != 0 && v3;
  if (!v3)
    v5 = 0;
  if (!v4 || v5 == 1 || v5 == 2)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!__OFADD__(result, 3))
  {
    if (v5 != 3)
      return *(unsigned __int8 *)(a2 + 32 + result) | (*(unsigned __int8 *)(result + a2 + 32 + 1) << 8) | (*(unsigned __int8 *)(result + a2 + 32 + 2) << 16) | (*(unsigned __int8 *)(a2 + 32 + result + 3) << 24);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(uint64_t a1, int a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4 >= 4)
  {
    v5 = 0;
    do
    {
      v6 = sub_240B49FF4(v5, a1);
      HIDWORD(v7) = (461845907 * ((380141568 * v6) | ((-862048943 * v6) >> 17))) ^ a2;
      LODWORD(v7) = HIDWORD(v7);
      a2 = 5 * (v7 >> 19) - 430675100;
      v5 += 4;
    }
    while (4 * (v4 >> 2) != v5);
  }
  v8 = v4 & 0x7FFFFFFFFFFFFFFCLL;
  if ((v4 & 0x7FFFFFFFFFFFFFFCLL) < v4)
  {
    v9 = v4 & 3;
    if ((v4 & 3) != 0)
    {
      v10 = a1 + 32;
      v11 = *(unsigned __int8 *)(a1 + 32 + v9 - 1 + v8);
      if (v9 != 1)
      {
        v11 = *(unsigned __int8 *)(v10 + v9 - 2 + v8) | (v11 << 8);
        if (v9 != 2)
          v11 = *(unsigned __int8 *)(v9 + v8 + v10 - 3) | (v11 << 8);
      }
    }
    else
    {
      v11 = 0;
    }
    a2 ^= 461845907 * ((380141568 * v11) | ((-862048943 * v11) >> 17));
  }
  if (HIDWORD(v4))
  {
    result = sub_240B60484();
    __break(1u);
  }
  else
  {
    v12 = -2048144789 * (a2 ^ v4 ^ ((a2 ^ v4) >> 16));
    return (-1028477387 * (v12 ^ (v12 >> 13))) ^ ((-1028477387 * (v12 ^ (v12 >> 13))) >> 16);
  }
  return result;
}

ValueMetadata *type metadata accessor for MurmurHash3()
{
  return &type metadata for MurmurHash3;
}

uint64_t dispatch thunk of DomainMap.init(withFileAtPath:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DomainMap.lookup(domain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t DecisionResult.commerce.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t DecisionResult.timesensitive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

void DecisionResult.subCategory.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 2);
}

void DecisionResult.subCategoryTS.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 3);
}

double DecisionResult.score.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double DecisionResult.senderScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double DecisionResult.tsScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double DecisionResult.tsCategoryScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

uint64_t DecisionResult.reasonCodes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DecisionResult.blackPearlVersion.getter@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];

  v2 = v1[12];
  v3 = v1[10];
  v24 = v1[11];
  v25 = v2;
  v4 = v1[12];
  v26[0] = v1[13];
  *(_OWORD *)((char *)v26 + 9) = *(_OWORD *)((char *)v1 + 217);
  v5 = v1[8];
  v7 = v1[6];
  v20 = v1[7];
  v6 = v20;
  v21 = v5;
  v8 = v1[8];
  v9 = v1[10];
  v22 = v1[9];
  v10 = v22;
  v23 = v9;
  v11 = v1[4];
  v17[0] = v1[3];
  v17[1] = v11;
  v12 = v1[6];
  v14 = v1[3];
  v13 = v1[4];
  v18 = v1[5];
  v15 = v18;
  v19 = v12;
  a1[8] = v24;
  a1[9] = v4;
  a1[10] = v1[13];
  *(_OWORD *)((char *)a1 + 169) = *(_OWORD *)((char *)v1 + 217);
  a1[4] = v6;
  a1[5] = v8;
  a1[6] = v10;
  a1[7] = v3;
  *a1 = v14;
  a1[1] = v13;
  a1[2] = v15;
  a1[3] = v7;
  return sub_240B2CA34((uint64_t)v17);
}

double static DecisionResultBuilder.buildErrorResult()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_240B4A320((uint64_t)&unk_251108CF0, a1).n128_u64[0];
  return result;
}

double static DecisionResultBuilder.buildCategorizationNotReadyResult()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_240B4A320((uint64_t)&unk_251108D18, a1).n128_u64[0];
  return result;
}

__n128 sub_240B4A320@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  __n128 result;
  __n128 v11;
  uint64_t v12;
  unsigned __int8 v13;

  sub_240B3899C(0x312D2E312D2E312DLL, 0xE800000000000000, (uint64_t)&v11);
  v4 = v12;
  result = v11;
  v11.n128_u8[0] = v13;
  *(_DWORD *)a2 = 16842752;
  __asm { FMOV            V1.2D, #-1.0 }
  *(_OWORD *)(a2 + 8) = _Q1;
  *(_OWORD *)(a2 + 24) = _Q1;
  *(_QWORD *)(a2 + 40) = a1;
  *(_QWORD *)(a2 + 48) = 16718;
  *(_QWORD *)(a2 + 56) = 0xE200000000000000;
  *(_QWORD *)(a2 + 64) = 16718;
  *(_QWORD *)(a2 + 72) = 0xE200000000000000;
  *(_QWORD *)(a2 + 80) = 16718;
  *(_QWORD *)(a2 + 88) = 0xE200000000000000;
  *(_QWORD *)(a2 + 96) = 16718;
  *(_QWORD *)(a2 + 104) = 0xE200000000000000;
  *(_QWORD *)(a2 + 112) = 16718;
  *(_QWORD *)(a2 + 120) = 0xE200000000000000;
  *(_OWORD *)(a2 + 128) = xmmword_240B61FB0;
  *(_OWORD *)(a2 + 144) = xmmword_240B61FB0;
  *(_QWORD *)(a2 + 160) = -1;
  *(_QWORD *)(a2 + 168) = -1;
  *(_OWORD *)(a2 + 176) = xmmword_240B61FB0;
  *(_OWORD *)(a2 + 192) = xmmword_240B61FB0;
  *(__n128 *)(a2 + 208) = result;
  *(_QWORD *)(a2 + 224) = v4;
  *(_BYTE *)(a2 + 232) = v11.n128_u8[0];
  return result;
}

uint64_t static DecisionResultBuilder.buildXpcResult(info:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  void (**v5)(char *, uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  Swift::Int v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t result;
  void *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  void (**v47)(char *, uint64_t);
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  void (**v78)(char *, uint64_t);
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  unint64_t v88;
  void *v89;
  unint64_t v90;
  void *v91;
  unint64_t v92;
  void *v93;
  unint64_t v94;
  void *v95;
  unint64_t v96;
  void *v97;
  unint64_t v98;
  int v99;
  int v100;
  void (**v101)(char *, uint64_t);
  uint64_t v102;
  int v103;
  int v104;
  void *v105;
  unint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;

  v4 = sub_240B5FE54();
  v5 = *(void (***)(char *, uint64_t))(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v8;
  swift_bridgeObjectRetain();
  v9 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  v101 = v5;
  if (v9)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  v102 = v4;
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v10 = 0;
LABEL_10:
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v11;
  swift_bridgeObjectRetain();
  v12 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v12)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v13 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v13 = 0;
LABEL_19:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v14;
  swift_bridgeObjectRetain();
  v15 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v15)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    swift_dynamicCast();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  static Category.getCategory(for:)((char *)&v109);
  swift_bridgeObjectRelease();
  v104 = v109;
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v16;
  swift_bridgeObjectRetain();
  v17 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v17)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v18 = (Swift::Int)v105;
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v18 = -1;
LABEL_34:
  CategoryTS.init(rawValue:)(v18);
  v103 = v109;
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v19;
  swift_bridgeObjectRetain();
  v20 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v21 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v21 = 0;
LABEL_43:
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v22;
  swift_bridgeObjectRetain();
  v23 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v23)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v24 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v24 = 0;
LABEL_52:
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v25;
  swift_bridgeObjectRetain();
  v26 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v26)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v27 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_61;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v27 = 0;
LABEL_61:
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v28;
  swift_bridgeObjectRetain();
  v29 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v29)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v30 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_70;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v30 = 0;
LABEL_70:
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v31;
  swift_bridgeObjectRetain();
  v32 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  result = swift_unknownObjectRelease();
  if (!v32)
  {
    __break(1u);
    return result;
  }
  v99 = v13;
  sub_240B60400();
  swift_unknownObjectRelease();
  sub_240B3875C(&v107, &v109);
  sub_240B4BA80();
  swift_dynamicCast();
  v34 = v105;
  sub_240B6034C();
  swift_bridgeObjectRelease();

  sub_240B5FE48();
  v100 = v10;
  v35 = (char *)MEMORY[0x24BEE4AF8];
  while (v111)
  {
    sub_240B3875C(&v109, &v107);
    if (swift_dynamicCast())
    {
      v36 = (uint64_t)v105;
      v37 = v106;
    }
    else
    {
      v37 = 0xE400000000000000;
      v36 = 1162760014;
    }
    ReasonCode.init(rawValue:)(*(Swift::String *)&v36);
    if (v107 == 30)
      v38 = 14;
    else
      v38 = v107;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v35 = sub_240B3FB30(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
    v40 = *((_QWORD *)v35 + 2);
    v39 = *((_QWORD *)v35 + 3);
    if (v40 >= v39 >> 1)
      v35 = sub_240B3FB30((char *)(v39 > 1), v40 + 1, 1, v35);
    *((_QWORD *)v35 + 2) = v40 + 1;
    v35[v40 + 32] = v38;
    sub_240B5FE48();
  }
  v101[1](v7, v102);
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v41;
  swift_bridgeObjectRetain();
  v42 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v42)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v43 = (uint64_t)v105;
      v44 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_92;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v43 = 0;
  v44 = 0xE000000000000000;
LABEL_92:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v45;
  swift_bridgeObjectRetain();
  v46 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v46)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v47 = (void (**)(char *, uint64_t))v105;
      v98 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_101;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v47 = 0;
  v98 = 0xE000000000000000;
LABEL_101:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v48;
  swift_bridgeObjectRetain();
  v49 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v49)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v97 = v105;
      v96 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_110;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v97 = 0;
  v96 = 0xE000000000000000;
LABEL_110:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v50;
  swift_bridgeObjectRetain();
  v51 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v51)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v95 = v105;
      v94 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_119;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v95 = 0;
  v94 = 0xE000000000000000;
LABEL_119:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v52;
  swift_bridgeObjectRetain();
  v53 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v53)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v93 = v105;
      v92 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_128;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v93 = 0;
  v92 = 0xE000000000000000;
LABEL_128:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v54;
  swift_bridgeObjectRetain();
  v55 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v55)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v91 = v105;
      v90 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_137;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v91 = 0;
  v90 = 0xE000000000000000;
LABEL_137:
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v56;
  swift_bridgeObjectRetain();
  v57 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v57)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v87 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_146;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v87 = 0;
LABEL_146:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v58;
  swift_bridgeObjectRetain();
  v59 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v59)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v89 = v105;
      v88 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_155;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v89 = 0;
  v88 = 0xE000000000000000;
LABEL_155:
  *(_QWORD *)&v109 = sub_240B600F4();
  *((_QWORD *)&v109 + 1) = v60;
  swift_bridgeObjectRetain();
  v61 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v61)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  v102 = v43;
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v86 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_164;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v86 = 0;
LABEL_164:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v62;
  swift_bridgeObjectRetain();
  v63 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v63)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  v101 = v47;
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v64 = v105;
      v65 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_173;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v64 = 0;
  v65 = 0xE000000000000000;
LABEL_173:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v66;
  swift_bridgeObjectRetain();
  v67 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v67)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v68 = v105;
      v69 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_182;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
  }
  v68 = 0;
  v69 = 0xE000000000000000;
LABEL_182:
  *(_QWORD *)&v107 = sub_240B600F4();
  *((_QWORD *)&v107 + 1) = v70;
  swift_bridgeObjectRetain();
  v71 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_240B605C8());
  swift_unknownObjectRelease();
  if (v71)
  {
    sub_240B60400();
    swift_unknownObjectRelease();
  }
  else
  {
    v107 = 0u;
    v108 = 0u;
  }
  sub_240B38714((uint64_t)&v107, (uint64_t)&v109);
  if (!v111)
  {
    swift_bridgeObjectRelease();
    sub_240B4BA40((uint64_t)&v109);
LABEL_190:
    v72 = 0;
    v73 = 0xE000000000000000;
    goto LABEL_191;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_190;
  }
  v72 = (uint64_t)v105;
  v73 = v106;
  swift_bridgeObjectRelease();
LABEL_191:
  if (v103 == 9)
    v74 = 1;
  else
    v74 = v103;
  result = sub_240B3899C(v72, v73, (uint64_t)&v109);
  v75 = v110;
  v76 = v109;
  LOBYTE(v109) = v111;
  *(_BYTE *)a2 = v100;
  *(_BYTE *)(a2 + 1) = v99;
  *(_BYTE *)(a2 + 2) = v104;
  *(_BYTE *)(a2 + 3) = v74;
  *(_QWORD *)(a2 + 8) = v21;
  *(_QWORD *)(a2 + 16) = v24;
  *(_QWORD *)(a2 + 24) = v27;
  *(_QWORD *)(a2 + 32) = v30;
  v77 = v102;
  *(_QWORD *)(a2 + 40) = v35;
  *(_QWORD *)(a2 + 48) = v77;
  v78 = v101;
  *(_QWORD *)(a2 + 56) = v44;
  *(_QWORD *)(a2 + 64) = v78;
  v79 = v97;
  *(_QWORD *)(a2 + 72) = v98;
  *(_QWORD *)(a2 + 80) = v79;
  v80 = v95;
  *(_QWORD *)(a2 + 88) = v96;
  *(_QWORD *)(a2 + 96) = v80;
  v81 = v93;
  *(_QWORD *)(a2 + 104) = v94;
  *(_QWORD *)(a2 + 112) = v81;
  v82 = v91;
  *(_QWORD *)(a2 + 120) = v92;
  *(_QWORD *)(a2 + 128) = v82;
  v83 = v89;
  *(_QWORD *)(a2 + 136) = v90;
  *(_QWORD *)(a2 + 144) = v83;
  v84 = v87;
  *(_QWORD *)(a2 + 152) = v88;
  *(_QWORD *)(a2 + 160) = v84;
  *(_QWORD *)(a2 + 168) = v86;
  *(_QWORD *)(a2 + 176) = v64;
  *(_QWORD *)(a2 + 184) = v65;
  *(_QWORD *)(a2 + 192) = v68;
  *(_QWORD *)(a2 + 200) = v69;
  *(_OWORD *)(a2 + 208) = v76;
  *(_QWORD *)(a2 + 224) = v75;
  *(_BYTE *)(a2 + 232) = v109;
  return result;
}

uint64_t sub_240B4BA40(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2570887C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_240B4BA80()
{
  unint64_t result;

  result = qword_257088AE0;
  if (!qword_257088AE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257088AE0);
  }
  return result;
}

uint64_t DecisionResultBuilder.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DecisionResultBuilder.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t destroy for DecisionResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DecisionResult(uint64_t a1, uint64_t a2)
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

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v3;
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  v6 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v6;
  v7 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v7;
  v8 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v8;
  v9 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v9;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  v10 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v10;
  v11 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v11;
  *(_OWORD *)(a1 + 217) = *(_OWORD *)(a2 + 217);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DecisionResult(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_BYTE *)(a1 + 3) = *(_BYTE *)(a2 + 3);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 217) = *(_OWORD *)(a2 + 217);
  *(_OWORD *)(a1 + 208) = v4;
  return a1;
}

__n128 __swift_memcpy233_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  __int128 v11;
  __int128 v12;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  v7 = a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  result = (__n128)a2[11];
  v11 = a2[12];
  v12 = a2[13];
  *(_OWORD *)(a1 + 217) = *(__int128 *)((char *)a2 + 217);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t assignWithTake for DecisionResult(uint64_t a1, uint64_t a2)
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

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_WORD *)(a1 + 2) = *(_WORD *)(a2 + 2);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v10;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  v11 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v12;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 217) = *(_OWORD *)(a2 + 217);
  return a1;
}

uint64_t getEnumTagSinglePayload for DecisionResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 233))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DecisionResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 232) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 233) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 233) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DecisionResult()
{
  return &type metadata for DecisionResult;
}

uint64_t type metadata accessor for DecisionResultBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for DecisionResultBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t _s20MCCKitCategorization7NERRuleC18nerBloomFilterPathAC10Foundation3URLV_tcfC_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int128 v6;
  char v7;
  uint64_t v8;

  v2 = swift_allocObject();
  type metadata accessor for BloomFilterSerDe();
  static BloomFilterSerDe.readFromFile(withFilePath:)(a1);
  v3 = sub_240B5FF14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  *(_QWORD *)(v2 + 16) = v5;
  *(_OWORD *)(v2 + 24) = v6;
  *(_BYTE *)(v2 + 40) = v7;
  *(_QWORD *)(v2 + 48) = v8;
  return v2;
}

__n128 FinalRule.__allocating_init(thresholds:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __n128 result;

  v2 = swift_allocObject();
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  *(_QWORD *)(v2 + 80) = v3;
  result = *(__n128 *)(a1 + 72);
  *(__n128 *)(v2 + 88) = result;
  return result;
}

uint64_t _s20MCCKitCategorization7NERRuleC18nerBloomFilterPathAC10Foundation3URLV_tcfc_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  __int128 v6;
  char v7;
  uint64_t v8;

  type metadata accessor for BloomFilterSerDe();
  static BloomFilterSerDe.readFromFile(withFilePath:)(a1);
  v3 = sub_240B5FF14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  *(_QWORD *)(v1 + 16) = v5;
  *(_OWORD *)(v1 + 24) = v6;
  *(_BYTE *)(v1 + 40) = v7;
  *(_QWORD *)(v1 + 48) = v8;
  return v1;
}

uint64_t CommerceSenderRule.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t _s20MCCKitCategorization7NERRuleCfD_0()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_240B4C220()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_240B4C248 + 4 * byte_240B62050[*v0]))();
}

void sub_240B4C248(_QWORD *a1@<X8>)
{
  *a1 = 7761767;
  a1[1] = 0xE300000000000000;
}

void sub_240B4C25C(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1937204590;
  a1[1] = v1;
}

void sub_240B4C26C(_QWORD *a1@<X8>)
{
  *a1 = 0x726568746FLL;
  a1[1] = 0xE500000000000000;
}

uint64_t FinalRule.init(thresholds:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 32) = v3;
  v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 64) = v4;
  *(_QWORD *)(v1 + 80) = v2;
  *(_OWORD *)(v1 + 88) = *(_OWORD *)(a1 + 72);
  return v1;
}

void sub_240B4C2AC(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;
  char v5;

  if ((unint64_t)(a2 - 430) >= 0xFFFFFFFFFFFFFFF7)
    v2 = 2;
  else
    v2 = 3;
  if ((unint64_t)(a2 - 406) >= 0xE)
    v3 = v2;
  else
    v3 = 1;
  if ((unint64_t)(a2 - 380) < 3 || a2 == -1)
    v5 = 0;
  else
    v5 = v3;
  __asm { BR              X11 }
}

uint64_t sub_240B4C344()
{
  char *v0;
  uint64_t v1;
  double v2;
  uint64_t result;
  char v4;

  if (*(double *)(v1 + 16) < v2)
  {
    result = 0;
    v4 = 14;
  }
  else
  {
    result = 1;
    v4 = 22;
  }
  *v0 = v4;
  return result;
}

uint64_t FinalRule.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FinalRule.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NERRule()
{
  return objc_opt_self();
}

uint64_t method lookup function for NERRule()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for CommerceSenderRule()
{
  return objc_opt_self();
}

uint64_t method lookup function for CommerceSenderRule()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CommerceSenderRule.__allocating_init(commerceBloomFilterURL:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for FinalRule()
{
  return objc_opt_self();
}

uint64_t method lookup function for FinalRule()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FinalRule.__allocating_init(thresholds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t ReasonCode.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_240B4C538 + 4 * byte_240B62100[*v0]))(5854019, 0xE300000000000000);
}

uint64_t sub_240B4C538@<X0>(uint64_t a1@<X8>)
{
  return a1 + 1806;
}

uint64_t sub_240B4C540()
{
  return 4541768;
}

uint64_t sub_240B4C550@<X0>(uint64_t a1@<X8>)
{
  return a1 + 2556;
}

uint64_t sub_240B4C558()
{
  return 4408658;
}

uint64_t sub_240B4C564()
{
  return 5261654;
}

uint64_t sub_240B4C574()
{
  return 5132099;
}

uint64_t sub_240B4C584()
{
  return 4805200;
}

uint64_t sub_240B4C594()
{
  return 4805196;
}

uint64_t sub_240B4C5A0()
{
  return 4411980;
}

uint64_t sub_240B4C5B0()
{
  return 5521731;
}

uint64_t sub_240B4C5BC()
{
  return 5260622;
}

uint64_t sub_240B4C5C8()
{
  return 5129550;
}

uint64_t sub_240B4C5D4()
{
  return 5195086;
}

uint64_t sub_240B4C5E4()
{
  return 1162760014;
}

uint64_t sub_240B4C5F4()
{
  return 5002069;
}

uint64_t sub_240B4C600()
{
  return 5852231;
}

uint64_t sub_240B4C60C()
{
  return 5262675;
}

uint64_t sub_240B4C61C()
{
  return 4410707;
}

MCCKitCategorization::ReasonCode_optional __swiftcall ReasonCode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  MCCKitCategorization::ReasonCode_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_240B605BC();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 12;
  switch(v3)
  {
    case 0:
      goto LABEL_14;
    case 1:
      v5 = 1;
      goto LABEL_14;
    case 2:
      v5 = 2;
      goto LABEL_14;
    case 3:
      v5 = 3;
      goto LABEL_14;
    case 4:
      v5 = 4;
      goto LABEL_14;
    case 5:
      v5 = 5;
      goto LABEL_14;
    case 6:
      v5 = 6;
      goto LABEL_14;
    case 7:
      v5 = 7;
      goto LABEL_14;
    case 8:
      v5 = 8;
      goto LABEL_14;
    case 9:
      v5 = 9;
      goto LABEL_14;
    case 10:
      v5 = 10;
      goto LABEL_14;
    case 11:
      v5 = 11;
LABEL_14:
      v6 = v5;
      break;
    case 12:
      break;
    case 13:
      v6 = 13;
      break;
    case 14:
      v6 = 14;
      break;
    case 15:
      v6 = 15;
      break;
    case 16:
      v6 = 16;
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    case 22:
      v6 = 22;
      break;
    case 23:
      v6 = 23;
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    case 29:
      v6 = 29;
      break;
    default:
      v6 = 30;
      break;
  }
  *v2 = v6;
  return result;
}

uint64_t static ReasonCode.getStringReason(reasonCodes:)(uint64_t a1)
{
  int64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_240B4CC6C(0, v1, 0);
    __asm { BR              X9 }
  }
  return *(_QWORD *)(a1 + 16);
}

void *static ReasonCode.allCases.getter()
{
  return &unk_251109030;
}

uint64_t sub_240B4CB0C()
{
  return sub_240B4DA9C();
}

uint64_t sub_240B4CB18()
{
  sub_240B60628();
  ReasonCode.rawValue.getter();
  sub_240B60148();
  swift_bridgeObjectRelease();
  return sub_240B60640();
}

uint64_t sub_240B4CB7C()
{
  ReasonCode.rawValue.getter();
  sub_240B60148();
  return swift_bridgeObjectRelease();
}

uint64_t sub_240B4CBCC()
{
  sub_240B60628();
  ReasonCode.rawValue.getter();
  sub_240B60148();
  swift_bridgeObjectRelease();
  return sub_240B60640();
}

MCCKitCategorization::ReasonCode_optional sub_240B4CC2C(Swift::String *a1)
{
  return ReasonCode.init(rawValue:)(*a1);
}

uint64_t sub_240B4CC38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = ReasonCode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_240B4CC5C(_QWORD *a1@<X8>)
{
  *a1 = &unk_251109030;
}

uint64_t sub_240B4CC6C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_240B5465C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

unint64_t sub_240B4CC8C()
{
  unint64_t result;

  result = qword_257088B90;
  if (!qword_257088B90)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for ReasonCode, &type metadata for ReasonCode);
    atomic_store(result, (unint64_t *)&qword_257088B90);
  }
  return result;
}

uint64_t sub_240B4CCD0()
{
  return sub_240B4CCFC(&qword_257088B98, &qword_257088BA0, MEMORY[0x24BEE12E0]);
}

uint64_t sub_240B4CCFC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24268A8B8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReasonCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE3)
    goto LABEL_17;
  if (a2 + 29 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 29) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 29;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 29;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 29;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1E;
  v8 = v6 - 30;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ReasonCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 29 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 29) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE2)
    return ((uint64_t (*)(void))((char *)&loc_240B4CE18 + 4 * byte_240B6215F[v4]))();
  *a1 = a2 + 29;
  return ((uint64_t (*)(void))((char *)sub_240B4CE4C + 4 * byte_240B6215A[v4]))();
}

uint64_t sub_240B4CE4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B4CE54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B4CE5CLL);
  return result;
}

uint64_t sub_240B4CE68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B4CE70);
  *(_BYTE *)result = a2 + 29;
  return result;
}

uint64_t sub_240B4CE74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B4CE7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReasonCode()
{
  return &type metadata for ReasonCode;
}

uint64_t sub_240B4CE98(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_240B547C4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_240B4CEB4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_240B54AB4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_240B4CED0(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_240B5432C(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_240B60208();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_240B60160();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_240B60160();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_240B60220();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_240B3F7EC(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_240B3F7EC((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_240B60160();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_240B60220();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_240B3F7EC(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_240B3F7EC((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_240B60484();
  __break(1u);
LABEL_42:
  result = sub_240B60484();
  __break(1u);
  return result;
}

uint64_t sub_240B4D36C(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD v47[4];

  v47[3] = a4;
  if (a1 < 0)
    goto LABEL_35;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = a5;
  if (!a1 || (v45 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_240B54484(a6, v44, a2 & 1, v10);
    swift_bridgeObjectRelease();
    a6 = *(_QWORD *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    swift_release();
    return a6;
  }
  v35 = a1;
  v36 = v10;
  v43 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v12 = a5;
  v13 = a5;
  v40 = a5;
  while (1)
  {
    v47[0] = sub_240B60394();
    v47[1] = v14;
    v15 = a3(v47);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a6;
    }
    v16 = v15;
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      break;
    v12 = sub_240B60388();
LABEL_9:
    if (v45 == v12 >> 14)
      goto LABEL_24;
  }
  if (v13 >> 14 == v12 >> 14 && (a2 & 1) != 0)
  {
    v12 = sub_240B60388();
    *(_QWORD *)(v44 + 16) = v12;
    v13 = v12;
    v40 = v12;
    goto LABEL_9;
  }
  if (v12 >> 14 < v13 >> 14)
    goto LABEL_34;
  v17 = sub_240B603A0();
  v39 = v18;
  v41 = v17;
  v37 = v20;
  v38 = v19;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v43 = sub_240B3F7EC(0, v43[2] + 1, 1, v43);
  v22 = v43[2];
  v21 = v43[3];
  if (v22 >= v21 >> 1)
    v43 = sub_240B3F7EC((_QWORD *)(v21 > 1), v22 + 1, 1, v43);
  v43[2] = v22 + 1;
  v23 = &v43[4 * v22];
  v23[4] = v41;
  v23[5] = v39;
  v23[6] = v38;
  v23[7] = v37;
  *(_QWORD *)(v36 + 16) = v43;
  v24 = sub_240B60388();
  v12 = v24;
  *(_QWORD *)(v44 + 16) = v24;
  if (v43[2] != v35)
  {
    v13 = v24;
    v40 = v24;
    goto LABEL_9;
  }
  v40 = v24;
  v13 = v24;
LABEL_24:
  if (v45 == v13 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
LABEL_33:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  if (v45 >= v40 >> 14)
  {
    v25 = sub_240B603A0();
    v27 = v26;
    v29 = v28;
    v31 = v30;
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      a6 = (unint64_t)sub_240B3F7EC(0, v43[2] + 1, 1, v43);
    v33 = *(_QWORD *)(a6 + 16);
    v32 = *(_QWORD *)(a6 + 24);
    if (v33 >= v32 >> 1)
      a6 = (unint64_t)sub_240B3F7EC((_QWORD *)(v32 > 1), v33 + 1, 1, (_QWORD *)a6);
    *(_QWORD *)(a6 + 16) = v33 + 1;
    v34 = (_QWORD *)(a6 + 32 * v33);
    v34[4] = v25;
    v34[5] = v27;
    v34[6] = v29;
    v34[7] = v31;
    *(_QWORD *)(v36 + 16) = a6;
    goto LABEL_33;
  }
LABEL_34:
  sub_240B60484();
  __break(1u);
LABEL_35:
  result = sub_240B60484();
  __break(1u);
  return result;
}

_OWORD *DecisionStrategy.__allocating_init(hashing:blackPearlLevels:nerRule:domainMap:tsSubjectMap:tsSenderMap:catMap:commerceSenderRule:guaranteeList:finalRule:)(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v32;

  v14 = *(_QWORD *)(a4 + 24);
  v27 = *(_QWORD *)(a4 + 32);
  v28 = __swift_mutable_project_boxed_opaque_existential_1(a4, v14);
  v15 = *(_QWORD *)(a5 + 24);
  v25 = *(_QWORD *)(a5 + 32);
  v26 = __swift_mutable_project_boxed_opaque_existential_1(a5, v15);
  v16 = *(_QWORD *)(a6 + 24);
  v17 = *(_QWORD *)(a6 + 32);
  v24 = __swift_mutable_project_boxed_opaque_existential_1(a6, v16);
  v18 = *(_QWORD *)(a7 + 24);
  v19 = *(_QWORD *)(a7 + 32);
  v20 = __swift_mutable_project_boxed_opaque_existential_1(a7, v18);
  *(_QWORD *)&v23 = v25;
  *((_QWORD *)&v23 + 1) = v19;
  v21 = sub_240B5716C(a1, a2, a3, v28, v26, v24, v20, a8, a9, a10, v32, v15, v18, v14, v16, v23, v27, v17);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a7);
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(a5);
  __swift_destroy_boxed_opaque_existential_0(a4);
  return v21;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void sub_240B4D980(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_240B4D9C0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_240B4DA0C + 4 * byte_240B622E4[a2]))(7761767);
}

uint64_t sub_240B4DA0C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 7761767 && v1 == 0xE300000000000000)
    v2 = 1;
  else
    v2 = sub_240B605A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_240B4DA9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = ReasonCode.rawValue.getter();
  v2 = v1;
  if (v0 == ReasonCode.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_240B605A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_240B4DB30(uint64_t result, unint64_t a2)
{
  char **v2;
  uint64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if ((a2 & 0x1000000000000000) != 0)
  {
    result = sub_240B6019C();
    v3 = result;
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v3 = HIBYTE(a2) & 0xF;
  }
  else
  {
    v3 = result & 0xFFFFFFFFFFFFLL;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
  }
  else
  {
    isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    *v2 = v4;
    if (!(_DWORD)isUniquelyReferenced_nonNull_native || *((_QWORD *)v4 + 3) >> 1 < v6)
    {
      if (v5 <= v6)
        v8 = v5 + v3;
      else
        v8 = v5;
      v4 = sub_240B3F8F8(isUniquelyReferenced_nonNull_native, v8, 1, v4);
      *v2 = v4;
    }
    swift_bridgeObjectRetain();
    result = sub_240B60448();
    if ((v9 & 1) != 0)
      goto LABEL_22;
    v10 = result;
    result = swift_bridgeObjectRelease_n();
    if (v10 >= v3)
    {
      if (v10 < 1)
      {
LABEL_17:
        *v2 = v4;
        return result;
      }
      v11 = *((_QWORD *)v4 + 2);
      v12 = __OFADD__(v11, v10);
      v13 = v11 + v10;
      if (!v12)
      {
        *((_QWORD *)v4 + 2) = v13;
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_240B4DC58(uint64_t a1)
{
  char **v1;
  unint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_240B3FD3C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = &v3[4 * v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[4 * v8] && (unint64_t)v10 < a1 + 32 + 4 * v8)
    goto LABEL_24;
  memcpy(v10, (const void *)(a1 + 32), 4 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = *((_QWORD *)v3 + 2);
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    *((_QWORD *)v3 + 2) = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B4DDA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_240B3F904(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + 8 * v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), 8 * v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B4DEE4(uint64_t a1)
{
  char **v1;
  int64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_240B3FB30(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v11 = *((_QWORD *)v3 + 2);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *((_QWORD *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t PredictionRequest.senderEmail.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PredictionRequest.senderEmail.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PredictionRequest.senderEmail.modify())()
{
  return nullsub_1;
}

uint64_t PredictionRequest.receiverEmail.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PredictionRequest.emailSubject.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PredictionRequest.isUnsubscribeHeaderPresent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

double PredictionRequest.senderScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 56);
}

void PredictionRequest.senderModelResult.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 64);
}

uint64_t PredictionRequest.isHME.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 65);
}

void __swiftcall PredictionRequest.init(senderEmail:receiverEmail:emailSubject:isUnsubscribeHeaderPresent:senderScore:senderModelResult:isHME:)(MCCKitCategorization::PredictionRequest *__return_ptr retstr, Swift::String senderEmail, Swift::String receiverEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Double senderScore, MCCKitCategorization::ReasonCode senderModelResult, Swift::Bool isHME)
{
  MCCKitCategorization::ReasonCode v8;

  v8 = *(_BYTE *)senderModelResult;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail = receiverEmail;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->senderScore = senderScore;
  retstr->senderModelResult = v8;
  retstr->isHME = isHME;
}

void __swiftcall PredictionRequest.init(decisionRequest:originalSender:isHME:senderScore:senderModelResult:)(MCCKitCategorization::PredictionRequest *__return_ptr retstr, MCCKitCategorization::DecisionRequest *decisionRequest, Swift::String originalSender, Swift::Bool isHME, Swift::Double senderScore, MCCKitCategorization::ReasonCode senderModelResult)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v11;
  Swift::Bool isUnsubscribeHeaderPresent;
  MCCKitCategorization::ReasonCode v13;
  uint64_t v14;
  void *v15;

  object = decisionRequest->receiverEmail.value._object;
  countAndFlagsBits = decisionRequest->emailSubject._countAndFlagsBits;
  v11 = decisionRequest->emailSubject._object;
  isUnsubscribeHeaderPresent = decisionRequest->isUnsubscribeHeaderPresent;
  v13 = *(_BYTE *)senderModelResult;
  if (object)
  {
    v14 = decisionRequest->receiverEmail.value._countAndFlagsBits;
    v15 = object;
  }
  else
  {
    v14 = 0;
    v15 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->senderEmail = originalSender;
  retstr->receiverEmail._countAndFlagsBits = v14;
  retstr->receiverEmail._object = v15;
  retstr->emailSubject._countAndFlagsBits = countAndFlagsBits;
  retstr->emailSubject._object = v11;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->senderScore = senderScore;
  retstr->senderModelResult = v13;
  retstr->isHME = isHME;
}

_OWORD *DecisionStrategy.init(hashing:blackPearlLevels:nerRule:domainMap:tsSubjectMap:tsSenderMap:catMap:commerceSenderRule:guaranteeList:finalRule:)(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
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
  _OWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _OWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  uint64_t v48;
  uint64_t v49;

  v48 = a8;
  v44 = a2;
  v45 = a3;
  v42 = a9;
  v43 = a1;
  v49 = a4;
  v13 = *(_QWORD *)(a4 + 24);
  v40 = *(_QWORD *)(a4 + 32);
  v41 = a10;
  v14 = __swift_mutable_project_boxed_opaque_existential_1(a4, v13);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  v46 = a5;
  v18 = *(_QWORD *)(a5 + 24);
  v38 = *(_QWORD *)(a5 + 32);
  v19 = __swift_mutable_project_boxed_opaque_existential_1(a5, v18);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v22 + 16))(v21);
  v39 = a6;
  v23 = *(_QWORD *)(a6 + 24);
  v37 = *(_QWORD *)(a6 + 32);
  v24 = __swift_mutable_project_boxed_opaque_existential_1(a6, v23);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v27 + 16))(v26);
  v28 = *(_QWORD *)(a7 + 24);
  v29 = *(_QWORD *)(a7 + 32);
  v30 = __swift_mutable_project_boxed_opaque_existential_1(a7, v28);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v36 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v33 + 16))(v32);
  v34 = sub_240B56D98(v43, v44, v45, (uint64_t)v16, (uint64_t)v21, (uint64_t)v26, (uint64_t)v32, v48, v42, v41, v47, v18, v28, v13, v23, v38, v29, v40, v37);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a7);
  __swift_destroy_boxed_opaque_existential_0(v39);
  __swift_destroy_boxed_opaque_existential_0(v46);
  __swift_destroy_boxed_opaque_existential_0(v49);
  return v34;
}

uint64_t DecisionStrategy.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  os_log_type_t v25;
  NSObject *log;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  v3 = type metadata accessor for BlackPearlModel(0);
  v4 = *(int *)(v3 + 32);
  v5 = *(void **)(v2 + v4);
  *(_QWORD *)(v2 + v4) = 0;

  v6 = type metadata accessor for BlackPearlLevels();
  v7 = v2 + *(int *)(v6 + 20);
  v8 = *(int *)(v3 + 32);
  v9 = *(void **)(v7 + v8);
  *(_QWORD *)(v7 + v8) = 0;

  v10 = v2 + *(int *)(v6 + 24);
  v11 = *(int *)(v3 + 32);
  v12 = *(void **)(v10 + v11);
  *(_QWORD *)(v10 + v11) = 0;

  if (qword_25435F0A8 != -1)
    swift_once();
  v13 = sub_240B60088();
  __swift_project_value_buffer(v13, (uint64_t)qword_25435F2B8);
  swift_retain_n();
  v14 = sub_240B60070();
  v15 = sub_240B60328();
  if (os_log_type_enabled(v14, v15))
  {
    v25 = v15;
    log = v14;
    v16 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412802;
    v18 = *(void **)(v2 + *(int *)(v3 + 32));
    if (v18)
      v19 = v18;
    sub_240B603AC();
    *v17 = v18;
    swift_release_n();
    *(_WORD *)(v16 + 12) = 2112;
    v20 = *(void **)(v2 + *(int *)(v6 + 20) + *(int *)(v3 + 32));
    if (v20)
      v21 = v20;
    sub_240B603AC();
    v17[1] = v20;
    swift_release_n();
    *(_WORD *)(v16 + 22) = 2112;
    v22 = *(void **)(v2 + *(int *)(v6 + 24) + *(int *)(v3 + 32));
    if (v22)
      v23 = v22;
    sub_240B603AC();
    v17[2] = v22;
    swift_release_n();
    _os_log_impl(&dword_240B2B000, log, v25, "Destroyed DecisionStrategy model  %@, %@, %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v17, -1, -1);
    MEMORY[0x24268A954](v16, -1, -1);

  }
  else
  {

    swift_release_n();
  }

  swift_bridgeObjectRelease();
  sub_240B46490(v2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t DecisionStrategy.__deallocating_deinit()
{
  DecisionStrategy.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_240B4E8B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  __int128 *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char v62;
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
  _OWORD v74[2];
  _QWORD v75[8];
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE v84[248];

  v2 = a1[2];
  v3 = a1[3];
  v5 = a1[4];
  v4 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v8 = *((_BYTE *)a1 + 64);
  v9 = *((_BYTE *)a1 + 65);
  v10 = *((_BYTE *)a1 + 66);
  v11 = *((_BYTE *)a1 + 67);
  v12 = *((_BYTE *)a1 + 68);
  v13 = *((unsigned __int8 *)a1 + 69);
  v15 = a1[9];
  v14 = a1[10];
  v57 = a1[1];
  v58 = *a1;
  v75[0] = *a1;
  v75[1] = v57;
  v60 = v3;
  v61 = v2;
  v75[2] = v2;
  v75[3] = v3;
  v75[4] = v5;
  v75[5] = v4;
  v75[6] = v7;
  v75[7] = v6;
  v76 = v8;
  v77 = v9;
  v55 = v11;
  v56 = v10;
  v78 = v10;
  v79 = v11;
  v80 = v12;
  v81 = v13;
  v82 = v15;
  v83 = v14;
  v54 = v14;
  sub_240B502B0((uint64_t)v75, (uint64_t)v84);
  sub_240B59520((uint64_t)v84, (uint64_t)v75, &qword_257088BA8);
  sub_240B59520((uint64_t)v75, (uint64_t)v84, &qword_257088BA8);
  if (sub_240B57368((uint64_t)v84) != 1)
    return sub_240B59520((uint64_t)v75, a2, &qword_257088BA8);
  *(_QWORD *)&v64 = v58;
  *((_QWORD *)&v64 + 1) = v57;
  *(_QWORD *)&v65 = v61;
  *((_QWORD *)&v65 + 1) = v60;
  *(_QWORD *)&v66 = v5;
  *((_QWORD *)&v66 + 1) = v4;
  *(_QWORD *)&v67 = v7;
  *((_QWORD *)&v67 + 1) = v6;
  LOBYTE(v68) = v8;
  BYTE1(v68) = v9;
  BYTE2(v68) = v56;
  BYTE3(v68) = v55;
  BYTE4(v68) = v12;
  BYTE5(v68) = v13;
  *((_QWORD *)&v68 + 1) = v15;
  *(_QWORD *)&v69 = v54;
  v16 = sub_240B57380((unsigned __int8 *)&v64);
  if ((v17 & 1) != 0)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v18 = sub_240B60088();
    __swift_project_value_buffer(v18, (uint64_t)qword_25435F2B8);
    v19 = sub_240B60070();
    v20 = sub_240B6031C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_240B2B000, v19, v20, "Returning categorization result for CVR sender", v21, 2u);
      MEMORY[0x24268A954](v21, -1, -1);
    }

    v22 = v59 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    v23 = (__int128 *)(v22 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    v24 = v23[9];
    v26 = v23[7];
    v72 = v23[8];
    v25 = v72;
    v73 = v24;
    v27 = v23[9];
    v74[0] = v23[10];
    *(_OWORD *)((char *)v74 + 9) = *(__int128 *)((char *)v23 + 169);
    v28 = v23[5];
    v30 = v23[3];
    v68 = v23[4];
    v29 = v68;
    v69 = v28;
    v31 = v23[5];
    v32 = v23[7];
    v70 = v23[6];
    v33 = v70;
    v71 = v32;
    v34 = v23[1];
    v35 = v23[3];
    v66 = v23[2];
    v36 = v66;
    v67 = v35;
    v37 = v23[1];
    v64 = *v23;
    v38 = v64;
    v65 = v37;
    *(_DWORD *)a2 = 117571584;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a2 + 8) = _Q0;
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v25;
    *(_OWORD *)(a2 + 192) = v27;
    *(_OWORD *)(a2 + 208) = v23[10];
    *(_OWORD *)(a2 + 217) = *(__int128 *)((char *)v23 + 169);
    *(_OWORD *)(a2 + 112) = v29;
    *(_OWORD *)(a2 + 128) = v31;
    *(_OWORD *)(a2 + 144) = v33;
    *(_OWORD *)(a2 + 160) = v26;
    *(_OWORD *)(a2 + 48) = v38;
    *(_OWORD *)(a2 + 64) = v34;
    *(_QWORD *)(a2 + 40) = v16;
    *(_OWORD *)(a2 + 80) = v36;
    *(_OWORD *)(a2 + 96) = v30;
    return sub_240B2CA34((uint64_t)&v64);
  }
  else
  {
    v45 = v13;
    swift_bridgeObjectRelease();
    v46 = sub_240B52520(v61, v60);
    v48 = v47;
    v62 = v49;
    sub_240B52024((char *)&v64, v46, v47);
    v51 = v64;
    if (v4)
      v52 = v5;
    else
      v52 = 0;
    if (v4)
      v53 = v4;
    else
      v53 = 0xE000000000000000;
    *(_QWORD *)&v64 = v46;
    *((_QWORD *)&v64 + 1) = v48;
    *(_QWORD *)&v65 = v52;
    *((_QWORD *)&v65 + 1) = v53;
    *(_QWORD *)&v66 = v7;
    *((_QWORD *)&v66 + 1) = v6;
    LOBYTE(v67) = v8;
    *((_QWORD *)&v67 + 1) = v50;
    LOBYTE(v68) = v51;
    BYTE1(v68) = v62 & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v45)
      sub_240B4FC7C((uint64_t)&v64, a2);
    else
      sub_240B4EEAC((uint64_t)&v64, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

char *sub_240B4EC90(uint64_t a1, void *a2, char a3, char a4)
{
  Swift::String v8;
  uint64_t v9;
  char v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v17;
  unint64_t v18;

  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = a1;
  v8._object = a2;
  BloomFilter.mayContain(object:)(v8);
  swift_bridgeObjectRelease();
  if (ReasonCode.rawValue.getter() == 5854019 && v9 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v11 = sub_240B3FB30(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v13 = *((_QWORD *)v11 + 2);
    v12 = *((_QWORD *)v11 + 3);
    v14 = v13 + 1;
    if (v13 >= v12 >> 1)
      v11 = sub_240B3FB30((char *)(v12 > 1), v13 + 1, 1, v11);
    v15 = 0;
    goto LABEL_8;
  }
  v10 = sub_240B605A4();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
    goto LABEL_5;
  if ((a3 & 1) != 0)
  {
    v15 = 1;
    v11 = sub_240B3FB30(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v13 = *((_QWORD *)v11 + 2);
    v17 = *((_QWORD *)v11 + 3);
    v14 = v13 + 1;
    if (v13 >= v17 >> 1)
    {
      v15 = 1;
      v11 = sub_240B3FB30((char *)(v17 > 1), v13 + 1, 1, v11);
    }
  }
  else
  {
    if ((a4 & 1) == 0)
      return (char *)MEMORY[0x24BEE4AF8];
    v11 = sub_240B3FB30(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v13 = *((_QWORD *)v11 + 2);
    v18 = *((_QWORD *)v11 + 3);
    v14 = v13 + 1;
    if (v13 >= v18 >> 1)
      v11 = sub_240B3FB30((char *)(v18 > 1), v13 + 1, 1, v11);
    v15 = 2;
  }
LABEL_8:
  *((_QWORD *)v11 + 2) = v14;
  v11[v13 + 32] = v15;
  return v11;
}

void sub_240B4EEAC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  char *v13;
  char v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  __int128 *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  char v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  char *v80;
  uint64_t v81;
  __int128 *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  uint64_t v103;
  __int128 *v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _OWORD *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  os_log_type_t v134;
  uint8_t *v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  char v142;
  uint64_t v143;
  char v144;
  uint64_t v145[2];
  _OWORD v146[2];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _OWORD v155[2];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _OWORD v166[2];
  char *v167;

  v3 = v2;
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 40);
  v143 = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_BYTE *)(a1 + 65);
  v167 = (char *)MEMORY[0x24BEE4AF8];
  v13 = sub_240B4EC90(v5, (void *)v6, v10, v12);
  v15 = v14;
  sub_240B4DEE4((uint64_t)v13);
  if ((v15 & 1) == 0)
  {
    v16 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0)
      v16 = v5 & 0xFFFFFFFFFFFFLL;
    if (v16)
    {
      v17 = sub_240B57864(v5, v6);
      v19 = sub_240B50FC4(v17, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v19 = -1;
    }
    v20 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0)
      v20 = v7 & 0xFFFFFFFFFFFFLL;
    if (v20)
    {
      v21 = sub_240B57864(v7, v8);
      sub_240B50FC4(v21, v22);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    sub_240B4C2AC((uint64_t)&v156, v19);
    if ((v23 & 1) != 0)
    {
      v24 = v156;
      v25 = v167;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v25 = sub_240B3FB30(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
      v27 = *((_QWORD *)v25 + 2);
      v26 = *((_QWORD *)v25 + 3);
      if (v27 >= v26 >> 1)
        v25 = sub_240B3FB30((char *)(v26 > 1), v27 + 1, 1, v25);
      *((_QWORD *)v25 + 2) = v27 + 1;
      v25[v27 + 32] = v24;
      if (qword_25435F0A8 != -1)
        swift_once();
      v28 = sub_240B60088();
      __swift_project_value_buffer(v28, (uint64_t)qword_25435F2B8);
      v29 = sub_240B60070();
      v30 = sub_240B6031C();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_240B2B000, v29, v30, "Returning categorization result for non commerce sender", v31, 2u);
        MEMORY[0x24268A954](v31, -1, -1);
      }

      v32 = v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
      v33 = (__int128 *)(v32 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
      v34 = v33[9];
      v36 = v33[7];
      v164 = v33[8];
      v35 = v164;
      v165 = v34;
      v37 = v33[9];
      v166[0] = v33[10];
      *(_OWORD *)((char *)v166 + 9) = *(__int128 *)((char *)v33 + 169);
      v38 = v33[5];
      v40 = v33[3];
      v160 = v33[4];
      v39 = v160;
      v161 = v38;
      v41 = v33[5];
      v42 = v33[7];
      v162 = v33[6];
      v43 = v162;
      v163 = v42;
      v44 = v33[1];
      v46 = v33[2];
      v45 = v33[3];
      v158 = v46;
      v159 = v45;
      v47 = v33[1];
      v156 = *v33;
      v48 = v156;
      v157 = v47;
      *(_DWORD *)a2 = 117571584;
      *(_QWORD *)(a2 + 16) = v11;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)(a2 + 24) = _Q0;
      *(_OWORD *)(a2 + 176) = v35;
      *(_OWORD *)(a2 + 192) = v37;
      *(_OWORD *)(a2 + 208) = v33[10];
      *(_OWORD *)(a2 + 217) = *(__int128 *)((char *)v33 + 169);
      *(_OWORD *)(a2 + 112) = v39;
      *(_OWORD *)(a2 + 128) = v41;
      *(_OWORD *)(a2 + 144) = v43;
      *(_OWORD *)(a2 + 160) = v36;
      *(_OWORD *)(a2 + 48) = v48;
      *(_OWORD *)(a2 + 64) = v44;
      *(_QWORD *)(a2 + 8) = 0x3FF0000000000000;
LABEL_51:
      *(_QWORD *)(a2 + 40) = v25;
LABEL_52:
      *(_OWORD *)(a2 + 80) = v46;
      *(_OWORD *)(a2 + 96) = v40;
      sub_240B2CA34((uint64_t)&v156);
      return;
    }
  }
  if ((v9 & 0x2000000000000000) == 0)
  {
    v54 = v143;
    if ((v143 & 0xFFFFFFFFFFFFLL) != 0)
      goto LABEL_23;
LABEL_37:
    if (qword_25435F0A8 != -1)
      swift_once();
    v76 = sub_240B60088();
    __swift_project_value_buffer(v76, (uint64_t)qword_25435F2B8);
    v77 = sub_240B60070();
    v78 = sub_240B6031C();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v79 = 0;
      _os_log_impl(&dword_240B2B000, v77, v78, "Returning categorization result for empty subject", v79, 2u);
      MEMORY[0x24268A954](v79, -1, -1);
    }

    v80 = v167;
    v81 = v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    v82 = (__int128 *)(v81 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    v83 = v82[9];
    v85 = v82[7];
    v164 = v82[8];
    v84 = v164;
    v165 = v83;
    v86 = v82[9];
    v166[0] = v82[10];
    *(_OWORD *)((char *)v166 + 9) = *(__int128 *)((char *)v82 + 169);
    v87 = v82[5];
    v40 = v82[3];
    v160 = v82[4];
    v88 = v160;
    v161 = v87;
    v89 = v82[5];
    v90 = v82[7];
    v162 = v82[6];
    v91 = v162;
    v163 = v90;
    v92 = v82[1];
    v46 = v82[2];
    v93 = v82[3];
    v158 = v46;
    v159 = v93;
    v94 = v82[1];
    v156 = *v82;
    v95 = v156;
    v157 = v94;
    *(_DWORD *)a2 = 117899264;
    *(_QWORD *)(a2 + 16) = v11;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v84;
    *(_OWORD *)(a2 + 192) = v86;
    *(_OWORD *)(a2 + 208) = v82[10];
    *(_OWORD *)(a2 + 217) = *(__int128 *)((char *)v82 + 169);
    *(_OWORD *)(a2 + 112) = v88;
    *(_OWORD *)(a2 + 128) = v89;
    *(_OWORD *)(a2 + 144) = v91;
    *(_OWORD *)(a2 + 160) = v85;
    *(_OWORD *)(a2 + 48) = v95;
    *(_OWORD *)(a2 + 64) = v92;
    *(_QWORD *)(a2 + 8) = 0x3FF0000000000000;
    *(_QWORD *)(a2 + 40) = v80;
    goto LABEL_52;
  }
  v54 = v143;
  if ((v9 & 0xF00000000000000) == 0)
    goto LABEL_37;
LABEL_23:
  if ((_s20MCCKitCategorization17LanguageDetectionC7english4textSbSS_tFZ_0() & 1) == 0)
  {
    v25 = v167;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_240B3FB30(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
    v98 = *((_QWORD *)v25 + 2);
    v97 = *((_QWORD *)v25 + 3);
    if (v98 >= v97 >> 1)
      v25 = sub_240B3FB30((char *)(v97 > 1), v98 + 1, 1, v25);
    *((_QWORD *)v25 + 2) = v98 + 1;
    v25[v98 + 32] = 15;
    if (qword_25435F0A8 != -1)
      swift_once();
    v99 = sub_240B60088();
    __swift_project_value_buffer(v99, (uint64_t)qword_25435F2B8);
    v100 = sub_240B60070();
    v101 = sub_240B6031C();
    if (os_log_type_enabled(v100, v101))
    {
      v102 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v102 = 0;
      _os_log_impl(&dword_240B2B000, v100, v101, "Returning categorization result for unsupported language", v102, 2u);
      MEMORY[0x24268A954](v102, -1, -1);
    }

    v103 = v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    v104 = (__int128 *)(v103 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    v105 = v104[9];
    v107 = v104[7];
    v164 = v104[8];
    v106 = v164;
    v165 = v105;
    v108 = v104[9];
    v166[0] = v104[10];
    *(_OWORD *)((char *)v166 + 9) = *(__int128 *)((char *)v104 + 169);
    v109 = v104[5];
    v40 = v104[3];
    v160 = v104[4];
    v110 = v160;
    v161 = v109;
    v111 = v104[5];
    v112 = v104[7];
    v162 = v104[6];
    v113 = v162;
    v163 = v112;
    v114 = v104[1];
    v46 = v104[2];
    v115 = v104[3];
    v158 = v46;
    v159 = v115;
    v116 = v104[1];
    v156 = *v104;
    v117 = v156;
    v157 = v116;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(a2 + 8) = _Q0;
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v106;
    *(_OWORD *)(a2 + 192) = v108;
    *(_OWORD *)(a2 + 208) = v104[10];
    *(_OWORD *)(a2 + 217) = *(__int128 *)((char *)v104 + 169);
    *(_OWORD *)(a2 + 112) = v110;
    *(_OWORD *)(a2 + 128) = v111;
    *(_OWORD *)(a2 + 144) = v113;
    *(_OWORD *)(a2 + 160) = v107;
    *(_OWORD *)(a2 + 48) = v117;
    *(_OWORD *)(a2 + 64) = v114;
    *(_DWORD *)a2 = 0;
    goto LABEL_51;
  }
  sub_240B503E4(&v156, v5, v6, v54, (void *)v9);
  v56 = v55;
  v142 = v156;
  v57 = v167;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v57 = sub_240B3FB30(0, *((_QWORD *)v57 + 2) + 1, 1, v57);
  v59 = *((_QWORD *)v57 + 2);
  v58 = *((_QWORD *)v57 + 3);
  if (v59 >= v58 >> 1)
    v57 = sub_240B3FB30((char *)(v58 > 1), v59 + 1, 1, v57);
  *((_QWORD *)v57 + 2) = v59 + 1;
  v57[v59 + 32] = 10;
  v167 = v57;
  sub_240B49450(v5, v6, &v156);
  v60 = v156;
  if (v156 != 9)
  {
    v62 = *((_QWORD *)v57 + 2);
    v61 = *((_QWORD *)v57 + 3);
    if (v62 >= v61 >> 1)
      v57 = sub_240B3FB30((char *)(v61 > 1), v62 + 1, 1, v57);
    *((_QWORD *)v57 + 2) = v62 + 1;
    v57[v62 + 32] = 16;
    v167 = v57;
    v142 = v60;
  }
  *(_QWORD *)&v146[0] = 0;
  *((_QWORD *)&v146[0] + 1) = 0xE000000000000000;
  v63 = v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  v64 = type metadata accessor for BlackPearlLevels();
  v65 = (__int128 *)(v63 + *(int *)(v64 + 28));
  v66 = v65[9];
  v164 = v65[8];
  v165 = v66;
  v166[0] = v65[10];
  *(_OWORD *)((char *)v166 + 9) = *(__int128 *)((char *)v65 + 169);
  v67 = v65[5];
  v160 = v65[4];
  v161 = v67;
  v68 = v65[7];
  v162 = v65[6];
  v163 = v68;
  v69 = v65[1];
  v156 = *v65;
  v157 = v69;
  v70 = v65[3];
  v158 = v65[2];
  v159 = v70;
  sub_240B60478();
  sub_240B53F38(v5, v6, v143, (void *)v9, (uint64_t)&v156);
  v71 = v156;
  v72 = *((_QWORD *)&v156 + 1);
  v73 = v157;
  v144 = BYTE8(v157);
  if (BYTE8(v157) == 1)
  {
    v75 = *((_QWORD *)v57 + 2);
    v74 = *((_QWORD *)v57 + 3);
    if (v75 >= v74 >> 1)
      v57 = sub_240B3FB30((char *)(v74 > 1), v75 + 1, 1, v57);
    *((_QWORD *)v57 + 2) = v75 + 1;
    v57[v75 + 32] = 19;
    v167 = v57;
  }
  v119 = (_OWORD *)(v63 + *(int *)(v64 + 28));
  v120 = v119[8];
  v121 = v119[10];
  v154 = v119[9];
  v155[0] = v121;
  *(_OWORD *)((char *)v155 + 9) = *(_OWORD *)((char *)v119 + 169);
  v122 = v119[5];
  v123 = v119[3];
  v149 = v119[4];
  v150 = v122;
  v124 = v119[5];
  v151 = v119[6];
  v125 = v119[6];
  v126 = v119[8];
  v152 = v119[7];
  v153 = v126;
  v127 = v119[1];
  v146[0] = *v119;
  v146[1] = v127;
  v128 = v119[3];
  v130 = *v119;
  v129 = v119[1];
  v147 = v119[2];
  v148 = v128;
  v164 = v120;
  v165 = v154;
  v166[0] = v119[10];
  *(_OWORD *)((char *)v166 + 9) = *(_OWORD *)((char *)v119 + 169);
  v160 = v149;
  v161 = v124;
  v162 = v125;
  v163 = v152;
  v156 = v130;
  v157 = v129;
  v158 = v147;
  v159 = v123;
  v145[0] = 0;
  v145[1] = 0xE000000000000000;
  sub_240B2CA34((uint64_t)v146);
  sub_240B6043C();
  sub_240B60184();
  sub_240B60598();
  sub_240B60184();
  swift_bridgeObjectRelease();
  sub_240B60184();
  sub_240B60184();
  swift_bridgeObjectRelease();
  sub_240B60184();
  sub_240B60598();
  sub_240B60184();
  swift_bridgeObjectRelease();
  sub_240B60184();
  sub_240B602B0();
  sub_240B60184();
  sub_240B602B0();
  sub_240B60184();
  sub_240B602B0();
  sub_240B60184();
  sub_240B602B0();
  sub_240B60184();
  sub_240B60184();
  sub_240B60184();
  v131 = swift_bridgeObjectRetain();
  MEMORY[0x24268A108](v131, &type metadata for ReasonCode);
  sub_240B60184();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240B60184();
  sub_240B60184();
  swift_bridgeObjectRelease();
  if (qword_25435F0A8 != -1)
    swift_once();
  v132 = sub_240B60088();
  __swift_project_value_buffer(v132, (uint64_t)qword_25435F2B8);
  swift_bridgeObjectRetain();
  v133 = sub_240B60070();
  v134 = sub_240B6031C();
  if (os_log_type_enabled(v133, v134))
  {
    v135 = (uint8_t *)swift_slowAlloc();
    v136 = swift_slowAlloc();
    v145[0] = v136;
    *(_DWORD *)v135 = 136315138;
    swift_bridgeObjectRetain();
    sub_240B335B4(0, 0xE000000000000000, v145);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_240B2B000, v133, v134, "%s", v135, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v136, -1, -1);
    MEMORY[0x24268A954](v135, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_BYTE *)a2 = 1;
  *(_BYTE *)(a2 + 1) = v144;
  *(_BYTE *)(a2 + 2) = v142;
  *(_BYTE *)(a2 + 3) = v71;
  *(_QWORD *)(a2 + 8) = v56;
  *(_QWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 24) = v72;
  *(_QWORD *)(a2 + 32) = v73;
  *(_QWORD *)(a2 + 40) = v57;
  v137 = v165;
  *(_OWORD *)(a2 + 176) = v164;
  *(_OWORD *)(a2 + 192) = v137;
  *(_OWORD *)(a2 + 208) = v166[0];
  *(_OWORD *)(a2 + 217) = *(_OWORD *)((char *)v166 + 9);
  v138 = v161;
  *(_OWORD *)(a2 + 112) = v160;
  *(_OWORD *)(a2 + 128) = v138;
  v139 = v163;
  *(_OWORD *)(a2 + 144) = v162;
  *(_OWORD *)(a2 + 160) = v139;
  v140 = v157;
  *(_OWORD *)(a2 + 48) = v156;
  *(_OWORD *)(a2 + 64) = v140;
  v141 = v159;
  *(_OWORD *)(a2 + 80) = v158;
  *(_OWORD *)(a2 + 96) = v141;
}

void sub_240B4FC7C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  __int128 *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  char v63;
  char v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _OWORD v82[3];

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v66 = *(_QWORD *)(a1 + 40);
  v67 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_BYTE *)(a1 + 64);
  v64 = *(_BYTE *)(a1 + 65);
  v65 = *(_BYTE *)(a1 + 48);
  v70 = *(_QWORD *)a1;
  v69 = *(_QWORD *)(a1 + 8);
  sub_240B57864(*(_QWORD *)a1, v69);
  v7 = sub_240B60118();
  v9 = v8;
  swift_bridgeObjectRelease();
  v68 = v3;
  sub_240B57864(v3, v4);
  v10 = sub_240B60118();
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = sub_240B3FB30(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v15 = *((_QWORD *)v13 + 2);
  v14 = *((_QWORD *)v13 + 3);
  if (v15 >= v14 >> 1)
    v13 = sub_240B3FB30((char *)(v14 > 1), v15 + 1, 1, v13);
  *((_QWORD *)v13 + 2) = v15 + 1;
  v13[v15 + 32] = 29;
  if (v7 == v10 && v9 == v12 || (sub_240B605A4() & 1) != 0)
    goto LABEL_9;
  sub_240B50FC4(v7, v9);
  v17 = v16;
  v19 = v18;
  sub_240B50FC4(v10, v12);
  if (v17 == v21 && v19 == v20)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v63 = sub_240B605A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v63 & 1) != 0)
  {
LABEL_10:
    v23 = *((_QWORD *)v13 + 2);
    v22 = *((_QWORD *)v13 + 3);
    if (v23 >= v22 >> 1)
      v13 = sub_240B3FB30((char *)(v22 > 1), v23 + 1, 1, v13);
    *((_QWORD *)v13 + 2) = v23 + 1;
    v13[v23 + 32] = v6;
    LOBYTE(v72) = v6;
    if (ReasonCode.rawValue.getter() == 5262675 && v24 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v25 = sub_240B605A4();
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
        if (qword_25435F0A8 != -1)
          swift_once();
        v48 = sub_240B60088();
        __swift_project_value_buffer(v48, (uint64_t)qword_25435F2B8);
        v49 = sub_240B60070();
        v50 = sub_240B6031C();
        if (os_log_type_enabled(v49, v50))
        {
          v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_240B2B000, v49, v50, "Returning NOP categorization result for SA sender", v51, 2u);
          MEMORY[0x24268A954](v51, -1, -1);
        }

        v52 = v71 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
        v31 = (__int128 *)(v52 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
        v33 = v31[8];
        v53 = v31[9];
        v34 = v31[7];
        v80 = v33;
        v81 = v53;
        v35 = v31[9];
        v82[0] = v31[10];
        *(_OWORD *)((char *)v82 + 9) = *(__int128 *)((char *)v31 + 169);
        v37 = v31[4];
        v54 = v31[5];
        v38 = v31[3];
        v76 = v37;
        v77 = v54;
        v39 = v31[5];
        v41 = v31[6];
        v55 = v31[7];
        v78 = v41;
        v79 = v55;
        v42 = v31[1];
        v44 = v31[2];
        v56 = v31[3];
        v74 = v44;
        v75 = v56;
        v57 = v31[1];
        v46 = *v31;
        v72 = *v31;
        v73 = v57;
        v47 = 101187584;
        goto LABEL_26;
      }
    }
    if (qword_25435F0A8 != -1)
      swift_once();
    v26 = sub_240B60088();
    __swift_project_value_buffer(v26, (uint64_t)qword_25435F2B8);
    v27 = sub_240B60070();
    v28 = sub_240B6031C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_240B2B000, v27, v28, "Returning NOP categorization result for person", v29, 2u);
      MEMORY[0x24268A954](v29, -1, -1);
    }

    v30 = v71 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    v31 = (__int128 *)(v30 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    v33 = v31[8];
    v32 = v31[9];
    v34 = v31[7];
    v80 = v33;
    v81 = v32;
    v35 = v31[9];
    v82[0] = v31[10];
    *(_OWORD *)((char *)v82 + 9) = *(__int128 *)((char *)v31 + 169);
    v37 = v31[4];
    v36 = v31[5];
    v38 = v31[3];
    v76 = v37;
    v77 = v36;
    v39 = v31[5];
    v41 = v31[6];
    v40 = v31[7];
    v78 = v41;
    v79 = v40;
    v42 = v31[1];
    v44 = v31[2];
    v43 = v31[3];
    v74 = v44;
    v75 = v43;
    v45 = v31[1];
    v46 = *v31;
    v72 = *v31;
    v73 = v45;
    v47 = 100794368;
LABEL_26:
    *(_DWORD *)a2 = v47;
    *(_QWORD *)(a2 + 16) = v5;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v33;
    *(_OWORD *)(a2 + 192) = v35;
    *(_OWORD *)(a2 + 208) = v31[10];
    *(_OWORD *)(a2 + 217) = *(__int128 *)((char *)v31 + 169);
    *(_OWORD *)(a2 + 112) = v37;
    *(_OWORD *)(a2 + 128) = v39;
    *(_OWORD *)(a2 + 144) = v41;
    *(_OWORD *)(a2 + 160) = v34;
    *(_OWORD *)(a2 + 48) = v46;
    *(_OWORD *)(a2 + 64) = v42;
    *(_QWORD *)(a2 + 8) = 0x3FF0000000000000;
    *(_QWORD *)(a2 + 40) = v13;
    *(_OWORD *)(a2 + 80) = v44;
    *(_OWORD *)(a2 + 96) = v38;
    sub_240B2CA34((uint64_t)&v72);
    return;
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)&v72 = v70;
  *((_QWORD *)&v72 + 1) = v69;
  *(_QWORD *)&v73 = v68;
  *((_QWORD *)&v73 + 1) = v4;
  *(_QWORD *)&v74 = v67;
  *((_QWORD *)&v74 + 1) = v66;
  LOBYTE(v75) = v65;
  *((_QWORD *)&v75 + 1) = v5;
  LOBYTE(v76) = v6;
  BYTE1(v76) = v64;
  sub_240B4EEAC((uint64_t)&v72, a2);
}

uint64_t sub_240B501F8@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];

  v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  v4 = (_OWORD *)(v3 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  v5 = v4[9];
  v6 = v4[7];
  v27 = v4[8];
  v28 = v5;
  v7 = v4[9];
  v29[0] = v4[10];
  *(_OWORD *)((char *)v29 + 9) = *(_OWORD *)((char *)v4 + 169);
  v8 = v4[5];
  v10 = v4[3];
  v23 = v4[4];
  v9 = v23;
  v24 = v8;
  v11 = v4[5];
  v12 = v4[7];
  v25 = v4[6];
  v13 = v25;
  v26 = v12;
  v14 = v4[1];
  v15 = v4[3];
  v21 = v4[2];
  v16 = v21;
  v22 = v15;
  v17 = v4[1];
  v20[0] = *v4;
  v18 = v20[0];
  v20[1] = v17;
  a1[8] = v27;
  a1[9] = v7;
  a1[10] = v4[10];
  *(_OWORD *)((char *)a1 + 169) = *(_OWORD *)((char *)v4 + 169);
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v13;
  a1[7] = v6;
  *a1 = v18;
  a1[1] = v14;
  a1[2] = v16;
  a1[3] = v10;
  return sub_240B2CA34((uint64_t)v20);
}

uint64_t sub_240B502B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  _BYTE v14[24];
  __int128 v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  unint64_t v37;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = *(_QWORD *)(a1 + 16) & 0xFFFFFFFFFFFFLL;
  if (v4
    && (*(_QWORD *)v14 = *(_QWORD *)(a1 + 16),
        *(_QWORD *)&v14[8] = v3,
        v36 = 64,
        v37 = 0xE100000000000000,
        sub_240B34A2C(),
        (sub_240B603F4() & 1) != 0))
  {
    sub_240B596F0(v14);
  }
  else
  {
    sub_240B3899C(0x312D2E312D2E312DLL, 0xE800000000000000, (uint64_t)v14);
    v5 = *(_QWORD *)&v14[16];
    v6 = v15;
    v7 = *(_OWORD *)v14;
    LOBYTE(v36) = v15;
    *(_DWORD *)v14 = 16842752;
    __asm { FMOV            V1.2D, #-1.0 }
    *(_OWORD *)&v14[8] = _Q1;
    v15 = _Q1;
    v16 = &unk_251108BC8;
    v17 = 16718;
    v18 = 0xE200000000000000;
    v19 = 16718;
    v20 = 0xE200000000000000;
    v21 = 16718;
    v22 = 0xE200000000000000;
    v23 = 16718;
    v24 = 0xE200000000000000;
    v25 = 16718;
    v26 = 0xE200000000000000;
    v27 = xmmword_240B61FB0;
    v28 = xmmword_240B61FB0;
    v29 = -1;
    v30 = -1;
    v31 = xmmword_240B61FB0;
    v32 = xmmword_240B61FB0;
    v33 = v7;
    v34 = v5;
    v35 = v6;
    nullsub_1(v14);
  }
  return sub_240B59520((uint64_t)v14, a2, &qword_257088BA8);
}

void sub_240B503E4(_BYTE *a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t inited;
  id v16;
  id v17;
  unint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _OWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  _QWORD *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  _QWORD *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  id v66;
  void *v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  _QWORD *v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  _BYTE *v80;
  void *v81;
  uint64_t v82;
  _QWORD *v83;
  _OWORD v84[10];
  _OWORD v85[2];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v11 = v5 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  v12 = *(void **)(v11 + *(int *)(type metadata accessor for BlackPearlModel(0) + 32));
  if (!v12)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v62 = sub_240B60088();
    __swift_project_value_buffer(v62, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_240B2B000, v63, v64, "Model creation failed", v65, 2u);
      MEMORY[0x24268A954](v65, -1, -1);
    }

    goto LABEL_34;
  }
  v13 = v12;
  v14 = (void *)sub_240B58040(a4, a5, a2, a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088BD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_240B60DA0;
  *(_QWORD *)(inited + 32) = 120;
  *(_QWORD *)(inited + 40) = 0xE100000000000000;
  *(_QWORD *)(inited + 72) = sub_240B595EC(0, &qword_257088BE0);
  *(_QWORD *)(inited + 48) = v14;
  v16 = v14;
  sub_240B5AB20(inited);
  v17 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  v18 = 0;
  v19 = sub_240B54150();
  *(_QWORD *)&v84[0] = 0;
  v20 = objc_msgSend(v13, sel_predictionFromFeatures_error_, v19, v84);
  if (!v20)
  {
    v66 = *(id *)&v84[0];
    v67 = (void *)sub_240B5FE3C();

    swift_willThrow();
    if (qword_25435F0A8 != -1)
      swift_once();
    v68 = sub_240B60088();
    __swift_project_value_buffer(v68, (uint64_t)qword_25435F2B8);
    v69 = v67;
    v70 = sub_240B60070();
    v71 = sub_240B60334();
    if (os_log_type_enabled(v70, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc();
      v73 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v72 = 138412290;
      v74 = v67;
      v75 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v84[0] = v75;
      sub_240B603AC();
      *v73 = v75;

      _os_log_impl(&dword_240B2B000, v70, v71, "Model execution failed %@", v72, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
      swift_arrayDestroy();
      MEMORY[0x24268A954](v73, -1, -1);
      MEMORY[0x24268A954](v72, -1, -1);
    }
    else
    {

    }
    goto LABEL_34;
  }
  v21 = v20;
  v22 = *(id *)&v84[0];
  v23 = (void *)sub_240B600D0();
  v24 = objc_msgSend(v21, sel_featureValueForName_, v23);

  if (!v24)
    goto LABEL_34;
  v25 = (_OWORD *)(v11 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  v26 = v25[8];
  v27 = v25[10];
  v84[9] = v25[9];
  v85[0] = v27;
  *(_OWORD *)((char *)v85 + 9) = *(_OWORD *)((char *)v25 + 169);
  v28 = v25[5];
  v84[4] = v25[4];
  v84[5] = v28;
  v29 = v25[7];
  v84[6] = v25[6];
  v84[7] = v29;
  v84[8] = v26;
  v30 = v25[3];
  v84[2] = v25[2];
  v84[3] = v30;
  v31 = v25[1];
  v84[0] = *v25;
  v84[1] = v31;
  sub_240B2CA34((uint64_t)v84);
  v32 = sub_240B601FC();
  sub_240B39D60((uint64_t)v84);
  v81 = v24;
  if ((v32 & 1) != 0)
  {
    v33 = objc_msgSend(v24, sel_dictionaryValue);
    sub_240B595EC(0, &qword_257088BB8);
    v34 = sub_240B600A0();

    v35 = sub_240B590F8(v34);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v36 = objc_msgSend(v24, sel_multiArrayValue);
  if (!v36)
  {
LABEL_34:
    sub_240B60490();
    __break(1u);
    return;
  }
  v37 = v36;
  v35 = sub_240B58834(v36);

LABEL_8:
  swift_bridgeObjectRetain_n();
  v38 = sub_240B550D0(v35);
  swift_bridgeObjectRelease();
  v83 = v38;
  sub_240B54E1C(&v83);
  swift_bridgeObjectRelease();
  v39 = v83;
  if (!v83[2])
  {
    __break(1u);
    goto LABEL_21;
  }
  v77 = v19;
  v18 = v83[5];
  v82 = v83[4];
  v40 = qword_25435F0A8;
  swift_bridgeObjectRetain();
  if (v40 != -1)
LABEL_21:
    swift_once();
  v41 = sub_240B60088();
  __swift_project_value_buffer(v41, (uint64_t)qword_25435F2B8);
  swift_retain();
  v42 = sub_240B60070();
  v43 = sub_240B60328();
  v79 = v13;
  v80 = a1;
  v78 = v16;
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v76 = v18;
    v45 = (_QWORD *)swift_slowAlloc();
    v83 = v45;
    *(_DWORD *)v44 = 136315138;
    swift_retain();
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088BB0);
    v47 = MEMORY[0x24268A108](v39, v46);
    v49 = v48;
    swift_release();
    sub_240B335B4(v47, v49, (uint64_t *)&v83);
    sub_240B603AC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_240B2B000, v42, v43, "Sorted Category: %s", v44, 0xCu);
    swift_arrayDestroy();
    v50 = v45;
    v18 = v76;
    MEMORY[0x24268A954](v50, -1, -1);
    MEMORY[0x24268A954](v44, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_bridgeObjectRetain_n();
  v51 = sub_240B60070();
  v52 = sub_240B60328();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = swift_slowAlloc();
    v54 = (_QWORD *)swift_slowAlloc();
    v83 = v54;
    *(_DWORD *)v53 = 136315394;
    swift_bridgeObjectRetain();
    sub_240B335B4(v82, v18, (uint64_t *)&v83);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v53 + 12) = 2048;
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_240B2B000, v51, v52, "Top Category: %s Value %f ", (uint8_t *)v53, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v54, -1, -1);
    MEMORY[0x24268A954](v53, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v55 = sub_240B60070();
  v56 = sub_240B6031C();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    v58 = (_QWORD *)swift_slowAlloc();
    v83 = v58;
    *(_DWORD *)v57 = 136315138;
    swift_bridgeObjectRetain();
    v59 = sub_240B600AC();
    v61 = v60;
    swift_bridgeObjectRelease();
    sub_240B335B4(v59, v61, (uint64_t *)&v83);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_240B2B000, v55, v56, "Category Scores: %s ", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v58, -1, -1);
    MEMORY[0x24268A954](v57, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  static Category.getCategory(for:)((char *)&v83);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  *v80 = (_BYTE)v83;
}

unint64_t sub_240B50ED8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;

  v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v4 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  v7 = 4 * v4;
  v8 = 15;
  while (sub_240B60208() != a1 || v9 != a2)
  {
    v10 = sub_240B605A4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v8;
    v8 = sub_240B60160();
    if (v7 == v8 >> 14)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_240B50FC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE v19[16];
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v21 = 46;
  v22 = 0xE100000000000000;
  v20 = &v21;
  swift_bridgeObjectRetain();
  result = sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)v19, a1, a2);
  v6 = result;
  v7 = *(_QWORD *)(result + 16);
  if (v7)
  {
    v8 = 0;
    v18 = result + 32;
    v9 = (_QWORD *)(v2 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
    while (*(_QWORD *)(v6 + 16) >= v7)
    {
      v21 = v6;
      v22 = v18;
      v23 = v8;
      v24 = (2 * v7) | 1;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088C10);
      sub_240B4CCFC(&qword_257088C18, &qword_257088C10, MEMORY[0x24BEE2180]);
      sub_240B59668();
      v10 = sub_240B6022C();
      v12 = v11;
      swift_bridgeObjectRelease();
      v14 = v9[3];
      v13 = v9[4];
      __swift_project_boxed_opaque_existential_1(v9, v14);
      v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16))(v10, v12, v14, v13);
      if ((v16 & 1) == 0)
      {
        v17 = v15;
        swift_bridgeObjectRelease();
        return v17;
      }
      ++v8;
      result = swift_bridgeObjectRelease();
      if (v7 == v8)
        goto LABEL_6;
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return 0;
  }
  return result;
}

_QWORD *sub_240B51188(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  char v54[16];
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v5 = sub_240B5FDD0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_240B57864(a1, a2);
  v11 = v10;
  v60 = 64;
  v61 = 0xE100000000000000;
  v55 = &v60;
  swift_bridgeObjectRetain();
  result = (_QWORD *)sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)v54, a1, a2);
  if (!result[2])
  {
LABEL_18:
    __break(1u);
    return result;
  }
  v48 = v5;
  v49 = v2;
  v46 = v8;
  v47 = v6;
  v13 = result[4];
  v14 = result[5];
  v15 = result[6];
  v16 = result[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v50 = MEMORY[0x242689FE8](v13, v14, v15, v16);
  v51 = v17;
  v18 = swift_bridgeObjectRelease();
  v60 = 46;
  v61 = 0xE100000000000000;
  MEMORY[0x24BDAC7A8](v18);
  v42 = &v60;
  swift_bridgeObjectRetain();
  result = (_QWORD *)sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)&v40, v9, v11);
  v19 = result;
  v20 = result[2];
  v21 = v9;
  if (v20)
  {
    v44 = v9;
    v45 = v11;
    v22 = 0;
    v52 = (2 * v20) | 1;
    v53 = result + 4;
    v23 = (_QWORD *)(v49 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
    while (v19[2] >= v20)
    {
      v60 = (uint64_t)v19;
      v61 = (unint64_t)v53;
      v62 = v22;
      v63 = v52;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088C10);
      sub_240B4CCFC(&qword_257088C18, &qword_257088C10, MEMORY[0x24BEE2180]);
      sub_240B59668();
      v24 = sub_240B6022C();
      v26 = v25;
      swift_bridgeObjectRelease();
      v27 = v23[3];
      v28 = v23[4];
      __swift_project_boxed_opaque_existential_1(v23, v27);
      (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v28 + 16))(v24, v26, v27, v28);
      if ((v29 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
      ++v22;
      result = (_QWORD *)swift_bridgeObjectRelease();
      if (v20 == v22)
      {
        swift_bridgeObjectRelease();
        v24 = 0;
        v26 = 0xE000000000000000;
LABEL_10:
        v11 = v45;
        v21 = v44;
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  v24 = 0;
  v26 = 0xE000000000000000;
LABEL_11:
  v30 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0)
    v30 = v24 & 0xFFFFFFFFFFFFLL;
  if (v30)
  {
    v60 = v50;
    v61 = v51;
    swift_bridgeObjectRetain();
    sub_240B60184();
    swift_bridgeObjectRelease();
    v31 = v60;
    v32 = v61;
    v60 = v21;
    v61 = v11;
    v58 = v24;
    v59 = v26;
    v56 = 0;
    v57 = 0xE000000000000000;
    v33 = sub_240B34A2C();
    v34 = MEMORY[0x24BEE0D00];
    v42 = (uint64_t *)v33;
    v43 = v33;
    v40 = MEMORY[0x24BEE0D00];
    v41 = v33;
    v35 = sub_240B603E8();
    v37 = v36;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v60 = v35;
    v61 = v37;
    v58 = 46;
    v59 = 0xE100000000000000;
    v56 = 32;
    v57 = 0xE100000000000000;
    v42 = (uint64_t *)v33;
    v43 = v33;
    v40 = v34;
    v41 = v33;
    sub_240B603E8();
    swift_bridgeObjectRelease();
    v60 = v31;
    v61 = v32;
    swift_bridgeObjectRetain();
    sub_240B60184();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v38 = v46;
    sub_240B5FDAC();
    v39 = sub_240B603D0();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v48);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (_QWORD *)v50;
  }
  return (_QWORD *)v39;
}

uint64_t sub_240B515EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  float v4;
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t i;
  void *v47;
  id v48;
  uint64_t v49;
  __objc2_ivar *v50;
  id v51;
  void *v52;
  char v53;
  id v54;
  void *v55;
  unint64_t v56;
  char isUniquelyReferenced_nonNull_native;
  char v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  char v64;
  unint64_t v65;
  char v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  void *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t result;
  void *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char v92[16];
  _OWORD *v93;
  uint64_t v94;
  uint64_t v95;
  _OWORD v96[3];
  unint64_t v97;
  void *v98;

  v5 = v3;
  sub_240B51188(a1, a2);
  v9 = v8;
  v11 = *(_QWORD *)(v2 + 64);
  v10 = *(void **)(v2 + 72);
  v12 = *(_OWORD *)(v2 + 32);
  v96[0] = *(_OWORD *)(v2 + 16);
  v96[1] = v12;
  v96[2] = *(_OWORD *)(v2 + 48);
  v97 = v11;
  v98 = v10;
  swift_bridgeObjectRetain();
  v13 = v10;
  v14 = sub_240B48DF8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v96[0] = 64;
  *((_QWORD *)&v96[0] + 1) = 0xE100000000000000;
  v93 = v96;
  swift_bridgeObjectRetain();
  v87 = a1;
  v88 = a2;
  v15 = sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)v92, a1, a2);
  if (*(_QWORD *)(v15 + 16) < 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_240B59624();
    swift_allocError();
    *v16 = 0;
    swift_willThrow();
    return (uint64_t)v9;
  }
  v17 = v5;
  swift_bridgeObjectRetain();
  v18 = sub_240B6037C();
  v20 = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v96[0] = v18;
  *((_QWORD *)&v96[0] + 1) = v20;
  if (!*(_QWORD *)(v15 + 16))
  {
LABEL_63:
    __break(1u);
LABEL_64:
    swift_once();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = sub_240B6037C();
  v23 = v22;
  swift_bridgeObjectRelease();
  v94 = v21;
  v95 = v23;
  sub_240B34A2C();
  LOBYTE(v21) = sub_240B603F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v21 & 1) != 0)
    v4 = 1.0;
  else
    v4 = 0.0;
  v11 = MEMORY[0x24BEE4AF8];
  v90 = sub_240B5E7D0(MEMORY[0x24BEE4AF8]);
  if (qword_25435F0A8 != -1)
    goto LABEL_64;
LABEL_8:
  v24 = sub_240B60088();
  __swift_project_value_buffer(v24, (uint64_t)qword_25435F2B8);
  swift_bridgeObjectRetain();
  v25 = sub_240B60070();
  v26 = sub_240B60328();
  v86 = (void *)v17;
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v27 = 134217984;
    *(_QWORD *)&v96[0] = *(_QWORD *)(v14 + 16);
    sub_240B603AC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_240B2B000, v25, v26, "SenderHashingSize: %ld", v27, 0xCu);
    MEMORY[0x24268A954](v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v28 = *(_QWORD *)(v14 + 16);
  if (v28)
  {
    *(_QWORD *)&v96[0] = v11;
    sub_240B4CEB4(0, v28, 0);
    v29 = 0;
    v11 = *(_QWORD *)&v96[0];
    v30 = *(_QWORD *)(*(_QWORD *)&v96[0] + 16);
    do
    {
      v31 = *(_QWORD *)(v14 + 8 * v29 + 32);
      *(_QWORD *)&v96[0] = v11;
      v32 = *(_QWORD *)(v11 + 24);
      if (v30 >= v32 >> 1)
      {
        sub_240B4CEB4(v32 > 1, v30 + 1, 1);
        v11 = *(_QWORD *)&v96[0];
      }
      ++v29;
      *(_QWORD *)(v11 + 16) = v30 + 1;
      *(float *)(v11 + 4 * v30++ + 32) = (float)v31;
    }
    while (v28 != v29);
  }
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v11 = (unint64_t)sub_240B3FD3C(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
  v34 = *(_QWORD *)(v11 + 16);
  v33 = *(_QWORD *)(v11 + 24);
  if (v34 >= v33 >> 1)
    v11 = (unint64_t)sub_240B3FD3C((char *)(v33 > 1), v34 + 1, 1, (char *)v11);
  *(_QWORD *)(v11 + 16) = v34 + 1;
  *(float *)(v11 + 4 * v34 + 32) = v4;
  v35 = HIBYTE(v88) & 0xF;
  if ((v88 & 0x2000000000000000) == 0)
    v35 = v87 & 0xFFFFFFFFFFFFLL;
  if (v35)
  {
    v36 = sub_240B57864(v87, v88);
    v38 = sub_240B50FC4(v36, v37);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v39 = (char *)v11;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_24;
  }
  else
  {
    swift_bridgeObjectRetain();
    v38 = -1;
    v39 = (char *)v11;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_24;
  }
  v39 = sub_240B3FD3C(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
LABEL_24:
  v41 = *((_QWORD *)v39 + 2);
  v40 = *((_QWORD *)v39 + 3);
  if (v41 >= v40 >> 1)
    v39 = sub_240B3FD3C((char *)(v40 > 1), v41 + 1, 1, v39);
  *((_QWORD *)v39 + 2) = v41 + 1;
  *(float *)&v39[4 * v41 + 32] = (float)v38;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088BE8);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_240B62510;
  v17 = sub_240B595EC(0, &qword_257088BB8);
  *(_QWORD *)(v42 + 32) = sub_240B60358();
  *(_QWORD *)(v42 + 40) = sub_240B60358();
  *(_QWORD *)&v96[0] = v42;
  sub_240B6025C();
  v43 = *(_QWORD *)&v96[0];
  v44 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
  v45 = sub_240B54234(v43, 65600);
  if (v86)
  {
LABEL_68:

    goto LABEL_69;
  }
  v9 = v45;
  v88 = 0;
  if (v45)
  {
    v14 = *((_QWORD *)v39 + 2);
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        v47 = (void *)sub_240B602BC();
        objc_msgSend(v9, sel_setObject_atIndexedSubscript_, v47, i);

      }
    }
    swift_bridgeObjectRelease();
    v48 = objc_msgSend(v9, sel_count);
    v11 = (unint64_t)v48 - 1;
    if (__OFSUB__(v48, 1))
    {
      __break(1u);
    }
    else if ((v11 & 0x8000000000000000) == 0)
    {
      v49 = 0;
      v50 = &stru_25110B000;
      v89 = v17;
      while (1)
      {
        v51 = objc_msgSend(v9, *(SEL *)&v50[48].align, v49);
        v52 = (void *)sub_240B60358();
        v53 = sub_240B60364();

        if ((v53 & 1) == 0)
        {
          v54 = objc_msgSend(v9, *(SEL *)&v50[48].align, v49);
          if (v54)
          {
            v14 = (uint64_t)v54;
            v17 = (uint64_t)v50;
            v55 = v9;
            v56 = v11;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)&v96[0] = v90;
            v11 = sub_240B35ECC(v49);
            v59 = *(_QWORD *)(v90 + 16);
            v60 = (v58 & 1) == 0;
            v61 = v59 + v60;
            if (__OFADD__(v59, v60))
              goto LABEL_61;
            v62 = v58;
            if (*(_QWORD *)(v90 + 24) >= v61)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                sub_240B37A34();
            }
            else
            {
              sub_240B36AF0(v61, isUniquelyReferenced_nonNull_native);
              v63 = sub_240B35ECC(v49);
              if ((v62 & 1) != (v64 & 1))
                goto LABEL_67;
              v11 = v63;
            }
            v71 = *(_QWORD **)&v96[0];
            v90 = *(_QWORD *)&v96[0];
            if ((v62 & 1) != 0)
            {
              v72 = *(_QWORD *)(*(_QWORD *)&v96[0] + 56);

              *(_QWORD *)(v72 + 8 * v11) = v14;
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)&v96[0] + 8 * (v11 >> 6) + 64) |= 1 << v11;
              *(_QWORD *)(v71[6] + 8 * v11) = v49;
              *(_QWORD *)(v71[7] + 8 * v11) = v14;
              v73 = v71[2];
              v74 = __OFADD__(v73, 1);
              v75 = v73 + 1;
              if (v74)
                goto LABEL_62;
              v71[2] = v75;
            }
            swift_bridgeObjectRelease();
            v11 = v56;
            v9 = v55;
            v50 = (__objc2_ivar *)v17;
            v17 = v89;
          }
          else
          {
            v65 = sub_240B35ECC(v49);
            if ((v66 & 1) != 0)
            {
              v67 = v65;
              v68 = swift_isUniquelyReferenced_nonNull_native();
              *(_QWORD *)&v96[0] = v90;
              v69 = v90;
              if ((v68 & 1) == 0)
              {
                sub_240B37A34();
                v69 = *(_QWORD *)&v96[0];
              }
              v70 = *(void **)(*(_QWORD *)(v69 + 56) + 8 * v67);
              v90 = v69;
              sub_240B443CC(v67, v69);

              swift_bridgeObjectRelease();
            }
          }
        }
        if (v11 == v49)
          break;
        v74 = __OFADD__(v49++, 1);
        if (v74)
        {
          __break(1u);
LABEL_61:
          __break(1u);
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
      }
      swift_bridgeObjectRetain_n();
      v76 = sub_240B54E84(v90);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v96[0] = v76;
      sub_240B54DB4((_QWORD **)v96);
      swift_bridgeObjectRelease();
      v77 = *(_QWORD *)&v96[0];
      swift_bridgeObjectRelease();
      swift_retain();
      v78 = sub_240B60070();
      v79 = sub_240B60328();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        v91 = swift_slowAlloc();
        *(_QWORD *)&v96[0] = v91;
        *(_DWORD *)v80 = 136315138;
        swift_retain();
        v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088BF8);
        v82 = MEMORY[0x24268A108](v77, v81);
        v84 = v83;
        swift_release();
        v94 = sub_240B335B4(v82, v84, (uint64_t *)v96);
        sub_240B603AC();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_240B2B000, v78, v79, "Sender input: %s", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24268A954](v91, -1, -1);
        MEMORY[0x24268A954](v80, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      return (uint64_t)v9;
    }
    __break(1u);
LABEL_67:
    sub_240B605D4();
    __break(1u);
    goto LABEL_68;
  }
LABEL_69:
  sub_240B60490();
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

void sub_240B52024(char *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t inited;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  char v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  void *v38;
  NSObject *v39;
  id v40[12];

  v40[11] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  v9 = type metadata accessor for BlackPearlLevels();
  v10 = v8 + *(int *)(v9 + 20);
  v11 = *(void **)(v10 + *(int *)(type metadata accessor for BlackPearlModel(0) + 32));
  if (!v11)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v34 = sub_240B60088();
    __swift_project_value_buffer(v34, (uint64_t)qword_25435F2B8);
    v35 = sub_240B60070();
    v36 = sub_240B60334();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_240B2B000, v35, v36, "Could not create sender model", v37, 2u);
      MEMORY[0x24268A954](v37, -1, -1);
    }

LABEL_23:
    sub_240B60490();
    __break(1u);
    return;
  }
  v12 = v11;
  v13 = sub_240B515EC(a2, a3);
  if (v4)
  {

    return;
  }
  v14 = (void *)v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088BD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_240B60DA0;
  *(_QWORD *)(inited + 32) = 120;
  *(_QWORD *)(inited + 40) = 0xE100000000000000;
  *(_QWORD *)(inited + 72) = sub_240B595EC(0, &qword_257088BE0);
  *(_QWORD *)(inited + 48) = v14;
  v16 = v14;
  sub_240B5AB20(inited);
  v17 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  v18 = sub_240B54150();
  v40[0] = 0;
  v19 = objc_msgSend(v12, sel_predictionFromFeatures_error_, v18, v40);
  if (!v19)
  {
    v32 = v40[0];
    sub_240B5FE3C();

    swift_willThrow();
    return;
  }
  v20 = v19;
  v39 = v16;
  v21 = v40[0];
  v22 = (void *)sub_240B600D0();
  v23 = objc_msgSend(v20, sel_featureValueForName_, v22);

  if (!v23)
    goto LABEL_23;
  v24 = objc_msgSend(v23, sel_multiArrayValue);

  if (!v24)
    goto LABEL_23;
  v25 = objc_msgSend(v24, sel_objectAtIndexedSubscript_, 0);

  if (!v25)
    goto LABEL_23;
  sub_240B60298();
  v27 = v26;
  if (qword_25435F0A8 != -1)
    swift_once();
  v28 = sub_240B60088();
  __swift_project_value_buffer(v28, (uint64_t)qword_25435F2B8);
  v29 = sub_240B60070();
  v30 = sub_240B6031C();
  if (os_log_type_enabled(v29, v30))
  {
    v38 = v18;
    v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v31 = 134217984;
    v40[0] = v27;
    sub_240B603AC();
    _os_log_impl(&dword_240B2B000, v29, v30, "Sender Scores: %f", v31, 0xCu);
    MEMORY[0x24268A954](v31, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    v29 = v25;
    v12 = v18;
    v25 = v39;
  }

  if (*(double *)(v8 + *(int *)(v9 + 32) + 40) >= *(double *)&v27)
    v33 = 17;
  else
    v33 = 18;
  *a1 = v33;
}

uint64_t sub_240B52520(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v37;
  _BYTE v38[16];
  _QWORD *v39;
  _QWORD v40[2];

  v40[0] = 64;
  v40[1] = 0xE100000000000000;
  v39 = v40;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)v38, a1, a2);
  if (v5[2] <= 1uLL)
  {
    swift_bridgeObjectRelease();
    sub_240B59624();
    v6 = (void *)swift_allocError();
    *v7 = 0;
    swift_willThrow();
    if (qword_25435F0A8 != -1)
      swift_once();
    v21 = sub_240B60088();
    __swift_project_value_buffer(v21, (uint64_t)qword_25435F2B8);
    v22 = v6;
    v23 = v6;
    v24 = sub_240B60070();
    v25 = sub_240B60334();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v26 = 138412290;
      v28 = v6;
      v29 = _swift_stdlib_bridgeErrorToNSError();
      v40[0] = v29;
      sub_240B603AC();
      *v27 = v29;

      _os_log_impl(&dword_240B2B000, v24, v25, "Failed to resolve private relay email %@", v26, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088738);
      swift_arrayDestroy();
      MEMORY[0x24268A954](v27, -1, -1);
      MEMORY[0x24268A954](v26, -1, -1);

    }
    else
    {

    }
    goto LABEL_20;
  }
  v37 = v2;
  v8 = v5[4];
  v9 = v5[5];
  v11 = v5[6];
  v10 = v5[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = MEMORY[0x242689FE8](v8, v9, v11, v10);
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = sub_240B601D8();
  swift_bridgeObjectRelease();
  if (sub_240B6037C() == 0xD000000000000018 && v16 == 0x8000000240B64190)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v17 = sub_240B605A4();
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
    goto LABEL_7;
  v30 = v15;
  v31 = sub_240B6037C();
  v33 = v32;
  swift_bridgeObjectRelease();
  if (v31 == 0x632E64756F6C6369 && v33 == 0xEA00000000006D6FLL)
  {
    swift_bridgeObjectRelease();
    v15 = v30;
  }
  else
  {
    v35 = sub_240B605A4();
    swift_bridgeObjectRelease();
    v15 = v30;
    if ((v35 & 1) == 0)
      goto LABEL_19;
  }
LABEL_8:
  v18 = *(void **)(v37 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_privateRelayRegex);
  v19 = (void *)sub_240B600D0();
  v20 = objc_msgSend(v18, sel_firstMatchInString_options_range_, v19, 0, 0, v15);

  if (!v20)
  {
LABEL_19:
    swift_bridgeObjectRelease();
LABEL_20:
    swift_bridgeObjectRetain();
    return a1;
  }
  v34 = sub_240B575A0(v12, v14);
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t sub_240B529C4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (result < 0)
    goto LABEL_30;
  v2 = a2;
  if (!result)
    return v2;
  v3 = *(_QWORD *)(a2 + 16);
  if (!v3)
  {
    v30 = MEMORY[0x24BEE4AF8];
LABEL_25:
    swift_bridgeObjectRelease();
    swift_release();
    return v30;
  }
  v4 = 0;
  v5 = 0;
  v6 = (uint64_t *)(a2 + 56);
  v28 = v3 - 1;
  v7 = MEMORY[0x24BEE4AF8];
  v30 = MEMORY[0x24BEE4AF8];
  v27 = result;
  do
  {
    v13 = *(v6 - 1);
    v12 = *v6;
    v14 = *(_QWORD *)(v7 + 16);
    v31 = *(v6 - 2);
    v32 = *(v6 - 3);
    if (v14 < result)
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_240B4CE98(0, v14 + 1, 1);
      v9 = *(_QWORD *)(v7 + 16);
      v8 = *(_QWORD *)(v7 + 24);
      if (v9 >= v8 >> 1)
        sub_240B4CE98(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v7 + 16) = v9 + 1;
      v10 = (_QWORD *)(v7 + 32 * v9);
      v10[4] = v32;
      v10[5] = v31;
      v10[6] = v13;
      v10[7] = v12;
      result = v27;
      v11 = a2;
LABEL_8:
      if (v28 == v4)
        goto LABEL_25;
      goto LABEL_9;
    }
    if (v5 >= v14)
      goto LABEL_28;
    v26 = v5;
    v15 = (_QWORD *)(v7 + 32 * v5);
    v16 = v15[4];
    v17 = v15[5];
    v18 = v15[6];
    v19 = v15[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v21 = v30;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_240B4CE98(0, *(_QWORD *)(v30 + 16) + 1, 1);
      v21 = v30;
    }
    v23 = *(_QWORD *)(v21 + 16);
    v22 = *(_QWORD *)(v21 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_240B4CE98(v22 > 1, v23 + 1, 1);
      v21 = v30;
    }
    *(_QWORD *)(v21 + 16) = v23 + 1;
    v30 = v21;
    v24 = (_QWORD *)(v21 + 32 * v23);
    v24[4] = v16;
    v24[5] = v17;
    v24[6] = v18;
    v24[7] = v19;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_240B56750(v7);
      v7 = result;
    }
    v11 = a2;
    if (v26 >= *(_QWORD *)(v7 + 16))
      goto LABEL_29;
    v25 = (_QWORD *)(v7 + 32 * v26);
    swift_bridgeObjectRelease();
    v25[4] = v32;
    v25[5] = v31;
    v25[6] = v13;
    v25[7] = v12;
    v5 = v26 + 1;
    result = v27;
    if ((uint64_t)(v26 + 1) < v27)
      goto LABEL_8;
    if (v28 == v4)
      goto LABEL_25;
    v5 = 0;
LABEL_9:
    ++v4;
    v6 += 4;
  }
  while (v4 < *(_QWORD *)(v11 + 16));
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_240B52C54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v3 = v2;
  v6 = sub_240B5FDD0();
  v51 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = a1;
  v57 = a2;
  v54 = 2843740;
  v55 = 0xE300000000000000;
  v52 = 0x737469676964;
  v53 = 0xE600000000000000;
  sub_240B34A2C();
  v9 = sub_240B603E8();
  v11 = *(void **)(v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsRegex);
  v12 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v12 = v9;
  v13 = 7;
  if (((v10 >> 60) & ((v9 & 0x800000000000000) == 0)) != 0)
    v13 = 11;
  v56 = 15;
  v57 = v13 | (v12 << 16);
  v54 = v9;
  v55 = v10;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088AB8);
  sub_240B4CCFC((unint64_t *)&qword_257088AC0, &qword_257088AB8, MEMORY[0x24BEE1BC0]);
  v14 = sub_240B60370();
  v16 = v15;
  v17 = (void *)sub_240B600D0();
  v18 = objc_msgSend(v11, sel_matchesInString_options_range_, v17, 0, v14, v16);

  sub_240B595EC(0, &qword_257088BF0);
  v19 = sub_240B60244();

  swift_bridgeObjectRetain();
  v20 = sub_240B56BE4(v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v56 = v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088B80);
  v48 = sub_240B4CCFC(&qword_257088B88, &qword_257088B80, MEMORY[0x24BEE12B0]);
  v49 = v21;
  v22 = sub_240B600B8();
  v24 = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v56 = v22;
  v57 = v24;
  v54 = 95;
  v55 = 0xE100000000000000;
  v52 = 2121504;
  v53 = 0xE300000000000000;
  v25 = sub_240B603E8();
  v27 = v26;
  swift_bridgeObjectRelease();
  v56 = v25;
  v57 = v27;
  sub_240B5FDAC();
  v28 = sub_240B603C4();
  v29 = *(void (**)(char *, uint64_t))(v51 + 8);
  v50 = v8;
  v51 = v6;
  v47 = v29;
  v29(v8, v6);
  swift_bridgeObjectRelease();
  v30 = *(_QWORD *)(v28 + 16);
  if (v30)
  {
    v31 = (uint64_t *)(v28 + 40);
    v32 = MEMORY[0x24BEE4AF8];
    do
    {
      v36 = *(v31 - 1);
      v37 = *v31;
      v38 = HIBYTE(*v31) & 0xF;
      if ((*v31 & 0x2000000000000000) == 0)
        v38 = v36 & 0xFFFFFFFFFFFFLL;
      if (v38)
      {
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v56 = v32;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_240B4CC6C(0, *(_QWORD *)(v32 + 16) + 1, 1);
          v32 = v56;
        }
        v34 = *(_QWORD *)(v32 + 16);
        v33 = *(_QWORD *)(v32 + 24);
        if (v34 >= v33 >> 1)
        {
          sub_240B4CC6C(v33 > 1, v34 + 1, 1);
          v32 = v56;
        }
        *(_QWORD *)(v32 + 16) = v34 + 1;
        v35 = v32 + 16 * v34;
        *(_QWORD *)(v35 + 32) = v36;
        *(_QWORD *)(v35 + 40) = v37;
      }
      v31 += 2;
      --v30;
    }
    while (v30);
  }
  else
  {
    v32 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v56 = v32;
  v40 = sub_240B600B8();
  v42 = v41;
  swift_release();
  v56 = v40;
  v57 = v42;
  v43 = v50;
  sub_240B5FDAC();
  v44 = sub_240B603D0();
  v47(v43, v51);
  swift_bridgeObjectRelease();
  return v44;
}

int64_t sub_240B530E0(int64_t result, uint64_t a2)
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

id sub_240B53124(uint64_t a1, uint64_t a2, uint64_t a3, id a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t inited;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  id v43;
  void *v44;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  _BYTE v54[16];
  uint64_t *v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;

  v6 = v5;
  v59 = *MEMORY[0x24BDAC8D0];
  v11 = v4 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  v12 = type metadata accessor for BlackPearlLevels();
  v13 = v11 + *(int *)(v12 + 24);
  v14 = *(void **)(v13 + *(int *)(type metadata accessor for BlackPearlModel(0) + 32));
  if (v14)
  {
    v56 = v14;
    v15 = sub_240B52C50(a3, a4);
    v17 = v16;
    v57 = 32;
    v58 = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v15);
    v55 = &v57;
    swift_bridgeObjectRetain();
    v18 = v15;
    v19 = v6;
    v20 = sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)v54, v18, v17);
    swift_bridgeObjectRelease();
    swift_retain();
    v21 = sub_240B58AA0(v20, v4, &OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
    v22 = v19;
    swift_bridgeObjectRelease();
    swift_release();
    v23 = sub_240B52C50(a1, a2);
    v25 = v24;
    v57 = 32;
    v58 = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v23);
    v55 = &v57;
    swift_bridgeObjectRetain();
    v26 = v23;
    v27 = v22;
    v28 = sub_240B4CED0(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)v54, v26, v25);
    swift_bridgeObjectRelease();
    swift_retain();
    v29 = sub_240B58AA0(v28, v4, &OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
    swift_bridgeObjectRelease();
    swift_release();
    a4 = (id)sub_240B57EE0((uint64_t)v21, *(_QWORD *)(v11 + *(int *)(v12 + 32) + 80));
    swift_bridgeObjectRelease();
    v30 = sub_240B57EE0((uint64_t)v29, *(_QWORD *)(v11 + *(int *)(v12 + 32) + 72));
    swift_bridgeObjectRelease();
    v31 = (void *)sub_240B58C3C((uint64_t)a4, *(_QWORD *)(v11 + *(int *)(v12 + 32) + 80));
    swift_bridgeObjectRelease();
    v32 = (void *)sub_240B58C3C(v30, *(_QWORD *)(v11 + *(int *)(v12 + 32) + 72));
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088BD8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_240B62520;
    *(_QWORD *)(inited + 32) = 0x6275735F78;
    *(_QWORD *)(inited + 40) = 0xE500000000000000;
    v34 = sub_240B595EC(0, &qword_257088BE0);
    *(_QWORD *)(inited + 48) = v31;
    *(_QWORD *)(inited + 72) = v34;
    *(_QWORD *)(inited + 80) = 0x6E65735F78;
    *(_QWORD *)(inited + 120) = v34;
    *(_QWORD *)(inited + 88) = 0xE500000000000000;
    *(_QWORD *)(inited + 96) = v32;
    v35 = v31;
    v36 = v32;
    sub_240B5AB20(inited);
    v37 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
    v38 = sub_240B54150();
    if (v27)
    {

    }
    else
    {
      v46 = v38;
      v57 = 0;
      v47 = v56;
      v48 = objc_msgSend(v56, sel_predictionFromFeatures_error_, v38, &v57);
      a4 = (id)v57;
      if (v48)
      {
        v49 = v48;
        v50 = (id)v57;
        v51 = (void *)sub_240B600D0();
        a4 = objc_msgSend(v49, sel_featureValueForName_, v51);

        if (!a4)
        {
          v53 = objc_allocWithZone(MEMORY[0x24BDD1540]);
          a4 = (id)sub_240B600D0();
          objc_msgSend(v53, sel_initWithDomain_code_userInfo_, a4, 1, 0);

          swift_willThrow();
        }

        swift_unknownObjectRelease();
      }
      else
      {
        v52 = (id)v57;
        sub_240B5FE3C();

        swift_willThrow();
      }
    }
  }
  else
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v39 = sub_240B60088();
    __swift_project_value_buffer(v39, (uint64_t)qword_25435F2B8);
    v40 = sub_240B60070();
    v41 = sub_240B60334();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_240B2B000, v40, v41, "Failed to create TS model", v42, 2u);
      MEMORY[0x24268A954](v42, -1, -1);
    }

    v43 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v44 = (void *)sub_240B600D0();
    objc_msgSend(v43, sel_initWithDomain_code_userInfo_, v44, 2, 0);

    swift_willThrow();
  }
  return a4;
}

uint64_t sub_240B53704@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  char v19;
  unint64_t v20;
  double v21;
  char v22;
  unint64_t v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  double *v31;
  double *v32;
  unint64_t v33;
  double v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  double *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  double *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  double *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t result;
  double v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  _OWORD v65[10];
  _OWORD v66[3];

  v5 = v2 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  v60 = type metadata accessor for BlackPearlLevels();
  v61 = v5;
  v6 = (_OWORD *)(v5 + *(int *)(v60 + 28));
  v7 = v6[8];
  v8 = v6[10];
  v65[9] = v6[9];
  v66[0] = v8;
  *(_OWORD *)((char *)v66 + 9) = *(_OWORD *)((char *)v6 + 169);
  v9 = v6[5];
  v65[4] = v6[4];
  v65[5] = v9;
  v10 = v6[7];
  v65[6] = v6[6];
  v65[7] = v10;
  v65[8] = v7;
  v11 = v6[3];
  v65[2] = v6[2];
  v65[3] = v11;
  v12 = v6[1];
  v65[0] = *v6;
  v65[1] = v12;
  sub_240B2CA34((uint64_t)v65);
  LOBYTE(v5) = sub_240B601FC();
  sub_240B39D60((uint64_t)v65);
  if ((v5 & 1) != 0)
  {
    v13 = objc_msgSend(a1, sel_dictionaryValue);
    sub_240B595EC(0, &qword_257088BB8);
    v14 = sub_240B600A0();

    v15 = sub_240B590F8(v14);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v15 + 16))
      goto LABEL_3;
LABEL_13:
    v17 = 0.0;
    v18 = 0.0;
LABEL_14:
    v21 = 0.0;
    goto LABEL_15;
  }
  v25 = objc_msgSend(a1, sel_multiArrayValue);
  if (!v25)
  {
LABEL_35:
    result = sub_240B60490();
    __break(1u);
    return result;
  }
  v26 = v25;
  v15 = sub_240B58E8C(v25);

  if (!*(_QWORD *)(v15 + 16))
    goto LABEL_13;
LABEL_3:
  v16 = sub_240B35E68(0x5354544F4ELL, 0xE500000000000000);
  v17 = 0.0;
  v18 = 0.0;
  if ((v19 & 1) != 0)
    v18 = *(double *)(*(_QWORD *)(v15 + 56) + 8 * v16);
  if (!*(_QWORD *)(v15 + 16))
    goto LABEL_14;
  v20 = sub_240B35E68(0x544341534E415254, 0xEC000000534E4F49);
  v21 = 0.0;
  if ((v22 & 1) != 0)
    v17 = *(double *)(*(_QWORD *)(v15 + 56) + 8 * v20);
  if (*(_QWORD *)(v15 + 16))
  {
    v23 = sub_240B35E68(0x544F4E524548544FLL, 0xEA00000000005354);
    if ((v24 & 1) != 0)
      v21 = *(double *)(*(_QWORD *)(v15 + 56) + 8 * v23);
  }
LABEL_15:
  if (qword_25435F0A8 != -1)
    swift_once();
  v27 = sub_240B60088();
  __swift_project_value_buffer(v27, (uint64_t)qword_25435F2B8);
  v28 = sub_240B60070();
  v29 = sub_240B60328();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v30 = 134217984;
    v64 = *(double **)&v18;
    sub_240B603AC();
    _os_log_impl(&dword_240B2B000, v28, v29, "NOTTS Score: %f", v30, 0xCu);
    MEMORY[0x24268A954](v30, -1, -1);
  }

  swift_bridgeObjectRetain_n();
  v31 = (double *)sub_240B550D0(v15);
  swift_bridgeObjectRelease();
  v64 = v31;
  sub_240B54E1C((_QWORD **)&v64);
  swift_bridgeObjectRelease();
  v32 = v64;
  if (!*((_QWORD *)v64 + 2))
  {
    __break(1u);
    swift_release();
    __break(1u);
    goto LABEL_35;
  }
  v33 = *((_QWORD *)v64 + 5);
  v62 = a2;
  v63 = *((_QWORD *)v64 + 4);
  v34 = v64[6];
  swift_bridgeObjectRetain();
  swift_retain();
  v35 = sub_240B60070();
  v36 = sub_240B60328();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = (double *)swift_slowAlloc();
    v64 = v38;
    *(_DWORD *)v37 = 136315138;
    swift_retain();
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_257088BB0);
    v40 = v33;
    v41 = MEMORY[0x24268A108](v32, v39);
    v43 = v42;
    swift_release();
    v44 = v41;
    v33 = v40;
    sub_240B335B4(v44, v43, (uint64_t *)&v64);
    sub_240B603AC();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_240B2B000, v35, v36, "Sorted TS Category: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v38, -1, -1);
    MEMORY[0x24268A954](v37, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_bridgeObjectRetain_n();
  v45 = sub_240B60070();
  v46 = sub_240B60328();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = swift_slowAlloc();
    v48 = (double *)swift_slowAlloc();
    v64 = v48;
    *(_DWORD *)v47 = 136315394;
    swift_bridgeObjectRetain();
    sub_240B335B4(v63, v33, (uint64_t *)&v64);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v47 + 12) = 2048;
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_240B2B000, v45, v46, "Top TS Category: %s Value %f ", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v48, -1, -1);
    MEMORY[0x24268A954](v47, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  v49 = sub_240B60070();
  v50 = sub_240B6031C();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = (double *)swift_slowAlloc();
    v64 = v52;
    *(_DWORD *)v51 = 136315138;
    swift_bridgeObjectRetain();
    v53 = sub_240B600AC();
    v55 = v54;
    swift_bridgeObjectRelease();
    sub_240B335B4(v53, v55, (uint64_t *)&v64);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_240B2B000, v49, v50, "Category TS Scores: %s ", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24268A954](v52, -1, -1);
    MEMORY[0x24268A954](v51, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  static CategoryTS.getCategory(for:)((char *)&v64);
  result = swift_bridgeObjectRelease();
  v57 = 1.0 - v18;
  v59 = v64 <= 5u
     && (v58 = v61 + *(int *)(v60 + 32), *(double *)(v58 + 56) < v34)
     && *(double *)(v58 + 48) < v57;
  *(_BYTE *)v62 = (_BYTE)v64;
  *(double *)(v62 + 8) = v57 - v17 - v21;
  *(double *)(v62 + 16) = v34;
  *(_BYTE *)(v62 + 24) = v59;
  return result;
}

__n128 sub_240B53F38@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  id v6;
  char v7;
  __n128 result;
  uint64_t v9;
  __n128 v10;
  char v11;

  v6 = sub_240B53124(a1, a2, a3, a4);
  sub_240B53704(v6, (uint64_t)&v9);

  v7 = v11;
  result = v10;
  *(_BYTE *)a5 = v9;
  *(__n128 *)(a5 + 8) = result;
  *(_BYTE *)(a5 + 24) = v7;
  return result;
}

id sub_240B54150()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_240B60094();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_240B5FE3C();

    swift_willThrow();
  }
  return v2;
}

id sub_240B54234(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  sub_240B595EC(0, &qword_257088BB8);
  v4 = (void *)sub_240B60238();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v5 = objc_msgSend(v2, sel_initWithShape_dataType_error_, v4, a2, v9);

  if (v5)
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    sub_240B5FE3C();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_240B5432C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_240B60220();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_240B3F7EC(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_240B3F7EC((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_240B60484();
  __break(1u);
  return result;
}

uint64_t sub_240B54484(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_240B603A0();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_240B3F7EC(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_240B3F7EC((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_240B60484();
  __break(1u);
  return result;
}

uint64_t sub_240B545E4(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_240B601E4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24268A06C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_240B5465C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435F100);
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
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B547C4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25435F110);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B5492C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088C08);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088BF8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B54AB4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088900);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B54C10(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088BC8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088BB0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B54DB4(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_240B56764(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_240B551C4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_240B54E1C(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_240B56778(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_240B55894(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_240B54E84(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088C08);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_240B567E0(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_240B59598();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_240B54F68(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088918);
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
  result = sub_240B604CC();
  __break(1u);
  return result;
}

_QWORD *sub_240B550D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088BC8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  v5 = sub_240B569E0((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_240B59598();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_240B551C4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
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
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  char v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *__dst;

  v3 = a1[1];
  result = sub_240B6058C();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v85 = 0;
      v86 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v88 = *(_QWORD *)(v86 + 16 * i);
        v89 = v85;
        do
        {
          if (v88 >= *(_QWORD *)(v86 + v89))
            break;
          if (!v86)
            goto LABEL_140;
          v90 = (_QWORD *)(v86 + v89);
          v91 = *(_QWORD *)(v86 + v89 + 24);
          *(_OWORD *)(v86 + v89 + 16) = *(_OWORD *)(v86 + v89);
          *v90 = v88;
          v90[1] = v91;
          v89 -= 16;
        }
        while (v89 != -16);
        v85 += 16;
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
  v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v92 = v12;
      v103 = v9;
      if (v13 >= 2)
      {
        v93 = *v101;
        do
        {
          v94 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v93)
            goto LABEL_144;
          v95 = v92;
          v96 = *(_QWORD *)&v92[16 * v94 + 32];
          v97 = *(_QWORD *)&v92[16 * v13 + 24];
          sub_240B55FAC((char *)(v93 + 16 * v96), (char *)(v93 + 16 * *(_QWORD *)&v92[16 * v13 + 16]), v93 + 16 * v97, __dst);
          if (v1)
            break;
          if (v97 < v96)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v95 = sub_240B5673C((uint64_t)v95);
          if (v94 >= *((_QWORD *)v95 + 2))
            goto LABEL_133;
          v98 = &v95[16 * v94 + 32];
          *(_QWORD *)v98 = v96;
          *((_QWORD *)v98 + 1) = v97;
          v99 = *((_QWORD *)v95 + 2);
          if (v13 > v99)
            goto LABEL_134;
          memmove(&v95[16 * v13 + 16], &v95[16 * v13 + 32], 16 * (v99 - v13));
          v92 = v95;
          *((_QWORD *)v95 + 2) = v99 - 1;
          v13 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v103 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088BF8);
    v8 = sub_240B60268();
    *(_QWORD *)(v8 + 16) = v7;
    v103 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v102 = *a1 + 32;
  v100 = *a1 - 16;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v104 = v6;
  v105 = v3;
  v106 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(_QWORD *)(v11 + 16 * v10);
      v16 = 16 * v14;
      v17 = *(_QWORD *)(v11 + 16 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v18 = (uint64_t *)(v102 + 16 * v14);
        v19 = v15;
        while (1)
        {
          v21 = *v18;
          v18 += 2;
          v20 = v21;
          if (v15 < v17 == v21 >= v19)
            break;
          ++v10;
          v19 = v20;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v22 = 16 * v10;
          v23 = v10;
          v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11)
                goto LABEL_143;
              v25 = v11 + v22;
              v26 = *(_QWORD *)(v11 + v16);
              v27 = *(_QWORD *)(v11 + v16 + 8);
              *(_OWORD *)(v11 + v16) = *(_OWORD *)(v11 + v22 - 16);
              *(_QWORD *)(v25 - 16) = v26;
              *(_QWORD *)(v25 - 8) = v27;
            }
            ++v24;
            v22 -= 16;
            v16 += 16;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v28 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v28 >= v3)
      v28 = v3;
    if (v28 < v14)
      break;
    if (v10 != v28)
    {
      v29 = v100 + 16 * v10;
      do
      {
        v30 = *(_QWORD *)(v11 + 16 * v10);
        v31 = v14;
        v32 = v29;
        do
        {
          if (v30 >= *(_QWORD *)v32)
            break;
          if (!v11)
            goto LABEL_141;
          v33 = *(_QWORD *)(v32 + 24);
          *(_OWORD *)(v32 + 16) = *(_OWORD *)v32;
          *(_QWORD *)v32 = v30;
          *(_QWORD *)(v32 + 8) = v33;
          v32 -= 16;
          ++v31;
        }
        while (v10 != v31);
        ++v10;
        v29 += 16;
      }
      while (v10 != v28);
      v10 = v28;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_240B564E0(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v35 = *((_QWORD *)v12 + 2);
    v34 = *((_QWORD *)v12 + 3);
    v13 = v35 + 1;
    v11 = v106;
    if (v35 >= v34 >> 1)
    {
      v84 = sub_240B564E0((char *)(v34 > 1), v35 + 1, 1, v12);
      v11 = v106;
      v12 = v84;
    }
    *((_QWORD *)v12 + 2) = v13;
    v36 = v12 + 32;
    v37 = &v12[16 * v35 + 32];
    *(_QWORD *)v37 = v14;
    *((_QWORD *)v37 + 1) = v10;
    if (v35)
    {
      while (1)
      {
        v38 = v13 - 1;
        if (v13 >= 4)
        {
          v43 = &v36[16 * v13];
          v44 = *((_QWORD *)v43 - 8);
          v45 = *((_QWORD *)v43 - 7);
          v49 = __OFSUB__(v45, v44);
          v46 = v45 - v44;
          if (v49)
            goto LABEL_119;
          v48 = *((_QWORD *)v43 - 6);
          v47 = *((_QWORD *)v43 - 5);
          v49 = __OFSUB__(v47, v48);
          v41 = v47 - v48;
          v42 = v49;
          if (v49)
            goto LABEL_120;
          v50 = v13 - 2;
          v51 = &v36[16 * v13 - 32];
          v53 = *(_QWORD *)v51;
          v52 = *((_QWORD *)v51 + 1);
          v49 = __OFSUB__(v52, v53);
          v54 = v52 - v53;
          if (v49)
            goto LABEL_122;
          v49 = __OFADD__(v41, v54);
          v55 = v41 + v54;
          if (v49)
            goto LABEL_125;
          if (v55 >= v46)
          {
            v73 = &v36[16 * v38];
            v75 = *(_QWORD *)v73;
            v74 = *((_QWORD *)v73 + 1);
            v49 = __OFSUB__(v74, v75);
            v76 = v74 - v75;
            if (v49)
              goto LABEL_129;
            v66 = v41 < v76;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v67 = *((_QWORD *)v12 + 4);
            v68 = *((_QWORD *)v12 + 5);
            v49 = __OFSUB__(v68, v67);
            v60 = v68 - v67;
            v61 = v49;
            goto LABEL_77;
          }
          v40 = *((_QWORD *)v12 + 4);
          v39 = *((_QWORD *)v12 + 5);
          v49 = __OFSUB__(v39, v40);
          v41 = v39 - v40;
          v42 = v49;
        }
        if ((v42 & 1) != 0)
          goto LABEL_121;
        v50 = v13 - 2;
        v56 = &v36[16 * v13 - 32];
        v58 = *(_QWORD *)v56;
        v57 = *((_QWORD *)v56 + 1);
        v59 = __OFSUB__(v57, v58);
        v60 = v57 - v58;
        v61 = v59;
        if (v59)
          goto LABEL_124;
        v62 = &v36[16 * v38];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v49 = __OFSUB__(v63, v64);
        v65 = v63 - v64;
        if (v49)
          goto LABEL_127;
        if (__OFADD__(v60, v65))
          goto LABEL_128;
        if (v60 + v65 >= v41)
        {
          v66 = v41 < v65;
LABEL_83:
          if (v66)
            v38 = v50;
          goto LABEL_85;
        }
LABEL_77:
        if ((v61 & 1) != 0)
          goto LABEL_123;
        v69 = &v36[16 * v38];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v49 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v49)
          goto LABEL_126;
        if (v72 < v60)
          goto LABEL_15;
LABEL_85:
        v77 = v38 - 1;
        if (v38 - 1 >= v13)
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
        if (!v11)
          goto LABEL_142;
        v78 = v12;
        v79 = &v36[16 * v77];
        v80 = *(_QWORD *)v79;
        v81 = &v36[16 * v38];
        v82 = *((_QWORD *)v81 + 1);
        sub_240B55FAC((char *)(v11 + 16 * *(_QWORD *)v79), (char *)(v11 + 16 * *(_QWORD *)v81), v11 + 16 * v82, __dst);
        if (v1)
          goto LABEL_93;
        if (v82 < v80)
          goto LABEL_116;
        if (v38 > *((_QWORD *)v78 + 2))
          goto LABEL_117;
        *(_QWORD *)v79 = v80;
        *(_QWORD *)&v36[16 * v77 + 8] = v82;
        v83 = *((_QWORD *)v78 + 2);
        if (v38 >= v83)
          goto LABEL_118;
        v12 = v78;
        v13 = v83 - 1;
        memmove(&v36[16 * v38], v81 + 16, 16 * (v83 - 1 - v38));
        *((_QWORD *)v78 + 2) = v83 - 1;
        v11 = v106;
        if (v83 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v104;
    v3 = v105;
    if (v10 >= v105)
    {
      v9 = v103;
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
  result = sub_240B60484();
  __break(1u);
  return result;
}

uint64_t sub_240B55894(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
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
  double *v31;
  double v32;
  uint64_t v33;
  double *v34;
  double v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  unint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double *__dst;

  v3 = a1[1];
  result = sub_240B6058C();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v88 = *a1;
      v89 = *a1 + 16;
      v90 = -1;
      for (i = 1; i != v3; ++i)
      {
        v92 = *(double *)(v88 + 24 * i + 16);
        v93 = v90;
        v94 = v89;
        do
        {
          if (*(double *)v94 >= v92)
            break;
          if (!v88)
            goto LABEL_141;
          v95 = *(_QWORD *)(v94 + 8);
          v96 = *(_QWORD *)(v94 + 16);
          *(_OWORD *)(v94 + 8) = *(_OWORD *)(v94 - 16);
          *(_QWORD *)(v94 + 24) = *(_QWORD *)v94;
          *(_QWORD *)(v94 - 16) = v95;
          *(_QWORD *)(v94 - 8) = v96;
          *(double *)v94 = v92;
          v94 -= 24;
        }
        while (!__CFADD__(v93++, 1));
        v89 += 24;
        --v90;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v6 = result;
  v106 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_103:
      v98 = v12;
      v108 = v9;
      if (v13 >= 2)
      {
        v99 = *v106;
        do
        {
          v100 = v13 - 2;
          if (v13 < 2)
            goto LABEL_132;
          if (!v99)
            goto LABEL_145;
          v101 = v98;
          v102 = *(_QWORD *)&v98[16 * v100 + 32];
          v103 = *(_QWORD *)&v98[16 * v13 + 24];
          sub_240B56224((double *)(v99 + 24 * v102), (double *)(v99 + 24 * *(_QWORD *)&v98[16 * v13 + 16]), v99 + 24 * v103, __dst);
          if (v1)
            break;
          if (v103 < v102)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v101 = sub_240B5673C((uint64_t)v101);
          if (v100 >= *((_QWORD *)v101 + 2))
            goto LABEL_134;
          v104 = &v101[16 * v100 + 32];
          *(_QWORD *)v104 = v102;
          *((_QWORD *)v104 + 1) = v103;
          v105 = *((_QWORD *)v101 + 2);
          if (v13 > v105)
            goto LABEL_135;
          memmove(&v101[16 * v13 + 16], &v101[16 * v13 + 32], 16 * (v105 - v13));
          v98 = v101;
          *((_QWORD *)v101 + 2) = v105 - 1;
          v13 = v105 - 1;
        }
        while (v105 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v108 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v108 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088BB0);
    v8 = sub_240B60268();
    *(_QWORD *)(v8 + 16) = v7;
    v108 = v8;
    __dst = (double *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v107 = *a1 + 64;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v109 = v6;
  v110 = v3;
  v111 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(double *)(v11 + 24 * v10 + 16);
      v16 = *(double *)(v11 + 24 * v14 + 16);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (double *)(v107 + 24 * v14);
        v18 = v15;
        while (1)
        {
          v19 = v18;
          v18 = *v17;
          if (v16 < v15 == v19 >= *v17)
            break;
          ++v10;
          v17 += 3;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14)
          goto LABEL_138;
        if (v14 < v10)
        {
          v20 = 24 * v10;
          v21 = 24 * v14;
          v22 = v10;
          v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11)
                goto LABEL_144;
              v24 = v11 + v21;
              v25 = v11 + v20;
              v26 = *(_QWORD *)(v11 + v21);
              v27 = *(_QWORD *)(v11 + v21 + 8);
              v28 = *(_QWORD *)(v11 + v21 + 16);
              v29 = *(_QWORD *)(v11 + v20 - 8);
              *(_OWORD *)v24 = *(_OWORD *)(v11 + v20 - 24);
              *(_QWORD *)(v24 + 16) = v29;
              *(_QWORD *)(v25 - 24) = v26;
              *(_QWORD *)(v25 - 16) = v27;
              *(_QWORD *)(v25 - 8) = v28;
            }
            ++v23;
            v20 -= 24;
            v21 += 24;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_136;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v30 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_139;
    if (v30 >= v3)
      v30 = v3;
    if (v30 < v14)
      break;
    if (v10 != v30)
    {
      v31 = (double *)(v11 + 24 * v10);
      do
      {
        v32 = *(double *)(v11 + 24 * v10 + 16);
        v33 = v14;
        v34 = v31;
        do
        {
          if (*(v34 - 1) >= v32)
            break;
          if (!v11)
            goto LABEL_142;
          v35 = *v34;
          v36 = *((_QWORD *)v34 + 1);
          *(_OWORD *)v34 = *(_OWORD *)(v34 - 3);
          v34[2] = *(v34 - 1);
          *((_QWORD *)v34 - 2) = v36;
          *(v34 - 1) = v32;
          *(v34 - 3) = v35;
          v34 -= 3;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 3;
      }
      while (v10 != v30);
      v10 = v30;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_131;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_240B564E0(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v38 = *((_QWORD *)v12 + 2);
    v37 = *((_QWORD *)v12 + 3);
    v13 = v38 + 1;
    v11 = v111;
    if (v38 >= v37 >> 1)
    {
      v87 = sub_240B564E0((char *)(v37 > 1), v38 + 1, 1, v12);
      v11 = v111;
      v12 = v87;
    }
    *((_QWORD *)v12 + 2) = v13;
    v39 = v12 + 32;
    v40 = &v12[16 * v38 + 32];
    *(_QWORD *)v40 = v14;
    *((_QWORD *)v40 + 1) = v10;
    if (v38)
    {
      while (1)
      {
        v41 = v13 - 1;
        if (v13 >= 4)
        {
          v46 = &v39[16 * v13];
          v47 = *((_QWORD *)v46 - 8);
          v48 = *((_QWORD *)v46 - 7);
          v52 = __OFSUB__(v48, v47);
          v49 = v48 - v47;
          if (v52)
            goto LABEL_120;
          v51 = *((_QWORD *)v46 - 6);
          v50 = *((_QWORD *)v46 - 5);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_121;
          v53 = v13 - 2;
          v54 = &v39[16 * v13 - 32];
          v56 = *(_QWORD *)v54;
          v55 = *((_QWORD *)v54 + 1);
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_123;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_126;
          if (v58 >= v49)
          {
            v76 = &v39[16 * v41];
            v78 = *(_QWORD *)v76;
            v77 = *((_QWORD *)v76 + 1);
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_130;
            v69 = v44 < v79;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v70 = *((_QWORD *)v12 + 4);
            v71 = *((_QWORD *)v12 + 5);
            v52 = __OFSUB__(v71, v70);
            v63 = v71 - v70;
            v64 = v52;
            goto LABEL_77;
          }
          v43 = *((_QWORD *)v12 + 4);
          v42 = *((_QWORD *)v12 + 5);
          v52 = __OFSUB__(v42, v43);
          v44 = v42 - v43;
          v45 = v52;
        }
        if ((v45 & 1) != 0)
          goto LABEL_122;
        v53 = v13 - 2;
        v59 = &v39[16 * v13 - 32];
        v61 = *(_QWORD *)v59;
        v60 = *((_QWORD *)v59 + 1);
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_125;
        v65 = &v39[16 * v41];
        v67 = *(_QWORD *)v65;
        v66 = *((_QWORD *)v65 + 1);
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_128;
        if (__OFADD__(v63, v68))
          goto LABEL_129;
        if (v63 + v68 >= v44)
        {
          v69 = v44 < v68;
LABEL_83:
          if (v69)
            v41 = v53;
          goto LABEL_85;
        }
LABEL_77:
        if ((v64 & 1) != 0)
          goto LABEL_124;
        v72 = &v39[16 * v41];
        v74 = *(_QWORD *)v72;
        v73 = *((_QWORD *)v72 + 1);
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_127;
        if (v75 < v63)
          goto LABEL_15;
LABEL_85:
        v80 = v41 - 1;
        if (v41 - 1 >= v13)
        {
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
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v11)
          goto LABEL_143;
        v81 = v12;
        v82 = &v39[16 * v80];
        v83 = *(_QWORD *)v82;
        v84 = &v39[16 * v41];
        v85 = *((_QWORD *)v84 + 1);
        sub_240B56224((double *)(v11 + 24 * *(_QWORD *)v82), (double *)(v11 + 24 * *(_QWORD *)v84), v11 + 24 * v85, __dst);
        if (v1)
          goto LABEL_93;
        if (v85 < v83)
          goto LABEL_117;
        if (v41 > *((_QWORD *)v81 + 2))
          goto LABEL_118;
        *(_QWORD *)v82 = v83;
        *(_QWORD *)&v39[16 * v80 + 8] = v85;
        v86 = *((_QWORD *)v81 + 2);
        if (v41 >= v86)
          goto LABEL_119;
        v12 = v81;
        v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((_QWORD *)v81 + 2) = v86 - 1;
        v11 = v111;
        if (v86 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v109;
    v3 = v110;
    if (v10 >= v110)
    {
      v9 = v108;
      goto LABEL_103;
    }
  }
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
  __break(1u);
LABEL_146:
  result = sub_240B60484();
  __break(1u);
  return result;
}

uint64_t sub_240B55FAC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  char *v22;
  char *v23;
  char *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v16 = &v4[16 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v17 = (char *)(a3 - 16);
        v18 = v6;
        while (1)
        {
          v19 = v17 + 16;
          v20 = *((_QWORD *)v18 - 2);
          v18 -= 16;
          if (*((_QWORD *)v16 - 2) >= v20)
          {
            v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16)
              *(_OWORD *)v17 = *((_OWORD *)v16 - 1);
            v18 = v6;
            v16 -= 16;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v19 != v6 || v17 >= v6)
              *(_OWORD *)v17 = *(_OWORD *)v18;
            v24 = v18;
            if (v18 <= v7)
              goto LABEL_42;
          }
          v17 -= 16;
          v6 = v18;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_240B565D8((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_240B604CC();
  __break(1u);
  return result;
}

uint64_t sub_240B56224(double *__src, double *a2, unint64_t a3, double *__dst)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  double *v13;
  double *v14;
  double *v15;
  __int128 v16;
  double *v17;
  unint64_t v18;
  double *v19;
  double *v20;
  __int128 v21;
  __int128 v22;
  uint64_t result;
  char *v24;
  double *v25;
  double *v26;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = ((char *)a2 - (char *)__src) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  v26 = __src;
  v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[3 * v11] <= __dst)
        memmove(__dst, a2, 24 * v11);
      v17 = &v4[3 * v11];
      v24 = (char *)v17;
      v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        v18 = a3 - 24;
        do
        {
          v19 = (double *)(v18 + 24);
          if (*(v6 - 1) >= *(v17 - 1))
          {
            v24 = (char *)(v17 - 3);
            if (v19 < v17 || v18 >= (unint64_t)v17 || v19 != v17)
            {
              v22 = *(_OWORD *)(v17 - 3);
              *(double *)(v18 + 16) = *(v17 - 1);
              *(_OWORD *)v18 = v22;
            }
            v20 = v6;
            v17 -= 3;
            if (v6 <= v7)
              break;
          }
          else
          {
            v20 = v6 - 3;
            if (v19 != v6 || v18 >= (unint64_t)v6)
            {
              v21 = *(_OWORD *)v20;
              *(double *)(v18 + 16) = *(v6 - 1);
              *(_OWORD *)v18 = v21;
            }
            v26 = v6 - 3;
            if (v20 <= v7)
              break;
          }
          v18 -= 24;
          v6 = v20;
        }
        while (v17 > v4);
      }
LABEL_40:
      sub_240B56680((void **)&v26, (const void **)&v25, &v24);
      return 1;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[3 * v9] <= __dst)
      memmove(__dst, __src, 24 * v9);
    v12 = &v4[3 * v9];
    v24 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      v13 = v4;
      while (1)
      {
        if (v13[2] >= v6[2])
        {
          v4 = v13 + 3;
          v15 = v13;
          v14 = v6;
          if (v7 == v13)
          {
            v13 += 3;
            if (v7 < v4)
              goto LABEL_18;
          }
          else
          {
            v13 += 3;
          }
        }
        else
        {
          v14 = v6 + 3;
          v15 = v6;
          if (v7 == v6 && v7 < v14)
            goto LABEL_18;
        }
        v16 = *(_OWORD *)v15;
        v7[2] = v15[2];
        *(_OWORD *)v7 = v16;
LABEL_18:
        v7 += 3;
        if (v13 < v12)
        {
          v6 = v14;
          if ((unint64_t)v14 < a3)
            continue;
        }
        v25 = v4;
        v26 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  result = sub_240B604CC();
  __break(1u);
  return result;
}

char *sub_240B564E0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257088BD0);
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

char *sub_240B565D8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_240B604CC();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_240B56680(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -24)
  {
    result = (char *)sub_240B604CC();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
      return (char *)memmove(result, v3, 24 * v6);
  }
  return result;
}

char *sub_240B5673C(uint64_t a1)
{
  return sub_240B564E0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_240B56750(uint64_t a1)
{
  return sub_240B547C4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_240B56764(_QWORD *a1)
{
  return sub_240B5492C(0, a1[2], 0, a1);
}

uint64_t sub_240B56778(_QWORD *a1)
{
  return sub_240B54C10(0, a1[2], 0, a1);
}

uint64_t sub_240B5678C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_240B605A4() & 1;
}

_QWORD *sub_240B567E0(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  id v21;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    v11 += 2;
    result = v20;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_240B569E0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    v22 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_240B56BE4(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      return v3;
    v18 = MEMORY[0x24BEE4AF8];
    result = sub_240B4CC6C(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v18;
    v16 = v1 & 0xC000000000000001;
    v17 = v1;
    while (v2 != v5)
    {
      if (v16)
        v6 = (id)MEMORY[0x24268A30C](v5, v1);
      else
        v6 = *(id *)(v1 + 8 * v5 + 32);
      v7 = v6;
      objc_msgSend(v6, sel_range);
      sub_240B60310();
      if ((v8 & 1) != 0)
      {

        v10 = 0;
        v12 = 0xE000000000000000;
      }
      else
      {
        v9 = sub_240B60220();
        v10 = MEMORY[0x242689FE8](v9);
        v12 = v11;

        swift_bridgeObjectRelease();
      }
      v14 = *(_QWORD *)(v18 + 16);
      v13 = *(_QWORD *)(v18 + 24);
      if (v14 >= v13 >> 1)
        sub_240B4CC6C(v13 > 1, v14 + 1, 1);
      ++v5;
      *(_QWORD *)(v18 + 16) = v14 + 1;
      v15 = v18 + 16 * v14;
      *(_QWORD *)(v15 + 32) = v10;
      *(_QWORD *)(v15 + 40) = v12;
      v1 = v17;
      if (v2 == v5)
        return v3;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v2 = sub_240B6049C();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

_OWORD *sub_240B56D98(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _OWORD *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  id v30;
  uint64_t v37[5];
  uint64_t v38[5];
  uint64_t v39[5];
  uint64_t v40[6];

  v40[3] = a14;
  v40[4] = a18;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 32))(boxed_opaque_existential_1, a4, a14);
  v39[3] = a12;
  v39[4] = a16;
  v23 = __swift_allocate_boxed_opaque_existential_1(v39);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a12 - 8) + 32))(v23, a5, a12);
  v38[3] = a15;
  v38[4] = a19;
  v24 = __swift_allocate_boxed_opaque_existential_1(v38);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a15 - 8) + 32))(v24, a6, a15);
  v37[3] = a13;
  v37[4] = a17;
  v25 = __swift_allocate_boxed_opaque_existential_1(v37);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a13 - 8) + 32))(v25, a7, a13);
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMaxSeqLen) = 256;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nonCommerceCategories) = &unk_251108BA0;
  v26 = a1[1];
  a11[1] = *a1;
  a11[2] = v26;
  v27 = a1[3];
  a11[3] = a1[2];
  a11[4] = v27;
  sub_240B2EF30(a2, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels);
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nerRule) = a3;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_commerceSenderRule) = a8;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_guaranteeList) = a9;
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_finalRule) = a10;
  sub_240B468C0((uint64_t)v40, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
  sub_240B468C0((uint64_t)v39, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
  sub_240B468C0((uint64_t)v38, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
  sub_240B468C0((uint64_t)v37, (uint64_t)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  v28 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_privateRelayRegex) = sub_240B46010(0xD000000000000041, 0x8000000240B63B30, 1);
  v29 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  v30 = sub_240B46010(0x775C5E5B7C2B775CLL, 0xEB000000005D735CLL, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
  sub_240B46490(a2);
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsRegex) = v30;
  return a11;
}

_OWORD *sub_240B5716C(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16, uint64_t a17, uint64_t a18)
{
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  _OWORD *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v48 = a3;
  v49 = a8;
  v38 = a5;
  v39 = a6;
  v46 = a1;
  v47 = a2;
  v45 = a9;
  v43 = a7;
  v44 = a10;
  v42 = a16;
  v40 = a18;
  v41 = a17;
  v18 = *(_QWORD *)(a13 - 8);
  v36 = a4;
  v37 = v18;
  v19 = MEMORY[0x24BDAC7A8](a1);
  v35 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(a15 - 8);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(a12 - 8);
  v26 = MEMORY[0x24BDAC7A8](v22);
  v28 = (char *)&v34 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = *(_QWORD *)(a14 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)&v34 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DecisionStrategy();
  v34 = (_OWORD *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v31, v36, a14);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v38, a12);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v24, v39, a15);
  v32 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v35, v43, a13);
  return sub_240B56D98(v46, v47, v48, (uint64_t)v31, (uint64_t)v28, (uint64_t)v24, v32, v49, v45, v44, v34, a12, a13, a14, a15, v42, *((uint64_t *)&v42 + 1), v41, v40);
}

uint64_t sub_240B57368(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

char *sub_240B57380(unsigned __int8 *a1)
{
  int v1;
  int v2;
  int v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v1 = a1[65];
  v2 = a1[66];
  v3 = a1[68];
  if ((a1[67] & 1) != 0)
  {
    v4 = sub_240B3FB30(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v6 = *((_QWORD *)v4 + 2);
    v5 = *((_QWORD *)v4 + 3);
    if (v6 >= v5 >> 1)
      v4 = sub_240B3FB30((char *)(v5 > 1), v6 + 1, 1, v4);
    *((_QWORD *)v4 + 2) = v6 + 1;
    v4[v6 + 32] = 4;
    if (!v2)
    {
      if (!v3)
        goto LABEL_6;
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  v4 = (char *)MEMORY[0x24BEE4AF8];
  if ((v2 & 1) != 0)
  {
LABEL_9:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v4 = sub_240B3FB30(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
    v8 = *((_QWORD *)v4 + 2);
    v7 = *((_QWORD *)v4 + 3);
    if (v8 >= v7 >> 1)
      v4 = sub_240B3FB30((char *)(v7 > 1), v8 + 1, 1, v4);
    *((_QWORD *)v4 + 2) = v8 + 1;
    v4[v8 + 32] = 6;
    if (!v3)
    {
LABEL_6:
      if (!v1)
        return v4;
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if ((v3 & 1) == 0)
  {
    if ((v1 & 1) == 0)
      return v4;
    goto LABEL_23;
  }
LABEL_16:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_240B3FB30(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
  v10 = *((_QWORD *)v4 + 2);
  v9 = *((_QWORD *)v4 + 3);
  if (v10 >= v9 >> 1)
    v4 = sub_240B3FB30((char *)(v9 > 1), v10 + 1, 1, v4);
  *((_QWORD *)v4 + 2) = v10 + 1;
  v4[v10 + 32] = 4;
  if (v1)
  {
LABEL_23:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v4 = sub_240B3FB30(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
    v12 = *((_QWORD *)v4 + 2);
    v11 = *((_QWORD *)v4 + 3);
    if (v12 >= v11 >> 1)
      v4 = sub_240B3FB30((char *)(v11 > 1), v12 + 1, 1, v4);
    *((_QWORD *)v4 + 2) = v12 + 1;
    v4[v12 + 32] = 5;
  }
  return v4;
}

uint64_t sub_240B575A0(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _BYTE *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _QWORD v18[6];
  uint64_t v19;
  unint64_t v20;

  v19 = a1;
  v20 = a2;
  v18[4] = 1601462623;
  v18[5] = 0xE400000000000000;
  sub_240B596AC();
  v2 = (_QWORD *)sub_240B602E0();
  v3 = v2;
  if (v2[2] > 1uLL)
  {
    v6 = v2[4];
    v7 = v2[5];
    v8 = v2[6];
    v9 = v2[7];
    swift_bridgeObjectRetain();
    v10 = MEMORY[0x242689FE8](v6, v7, v8, v9);
    v12 = v11;
    result = swift_bridgeObjectRelease();
    if (v3[2] < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v13 = v3[8];
      v14 = v3[9];
      swift_bridgeObjectRetain();
      v15 = swift_bridgeObjectRelease();
      v19 = 95;
      v20 = 0xE100000000000000;
      MEMORY[0x24BDAC7A8](v15);
      v18[2] = &v19;
      swift_bridgeObjectRetain();
      v16 = sub_240B4D36C(0x7FFFFFFFFFFFFFFFLL, 1, sub_240B595A0, (uint64_t)v18, v13, v14);
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v16 + 16) > 2uLL)
      {
        v19 = sub_240B529C4(2, v16);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257088C30);
        sub_240B4CCFC(&qword_257088C38, &qword_257088C30, MEMORY[0x24BEE12C8]);
        sub_240B59668();
        sub_240B6022C();
        v19 = v10;
        v20 = v12;
        swift_bridgeObjectRetain();
        sub_240B60184();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_240B60184();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v19;
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_240B59624();
        swift_allocError();
        *v17 = 1;
        swift_willThrow();
        return swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_240B59624();
    swift_allocError();
    *v4 = 0;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_240B57864(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  unint64_t result;
  uint64_t v7;

  v3 = a1;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4
    || (sub_240B34A2C(), (sub_240B603F4() & 1) == 0)
    || (sub_240B50ED8(64, 0xE100000000000000, v3, a2), (v5 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    return v3;
  }
  result = sub_240B6016C();
  if (4 * v4 >= result >> 14)
  {
    v7 = sub_240B60220();
    v3 = MEMORY[0x242689FE8](v7);
    swift_bridgeObjectRelease();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t destroy for PredictionRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PredictionRequest(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PredictionRequest(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

__n128 __swift_memcpy66_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PredictionRequest(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

uint64_t getEnumTagSinglePayload for PredictionRequest(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 66))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PredictionRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 66) = 1;
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
    *(_BYTE *)(result + 66) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PredictionRequest()
{
  return &type metadata for PredictionRequest;
}

uint64_t sub_240B57C04()
{
  return type metadata accessor for DecisionStrategy();
}

uint64_t type metadata accessor for DecisionStrategy()
{
  uint64_t result;

  result = qword_25435F068;
  if (!qword_25435F068)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240B57C48()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t method lookup function for DecisionStrategy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DecisionStrategy.__allocating_init(hashing:blackPearlLevels:nerRule:domainMap:tsSubjectMap:tsSenderMap:catMap:commerceSenderRule:guaranteeList:finalRule:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of DecisionStrategy.predictEmail(decisionRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of DecisionStrategy.predictCommerceEmail(predictionRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of DecisionStrategy.predictEnterpriseEmail(predictionRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of DecisionStrategy.getBlackPearlModelVersions()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

_QWORD *sub_240B57D58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v13;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v13 = (_QWORD *)(a2 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  v3 = swift_bridgeObjectRetain() + 40;
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = v13[4];
    __swift_project_boxed_opaque_existential_1(v13, v13[3]);
    sub_240B60118();
    swift_bridgeObjectRetain();
    v6 = sub_240B60214();
    v7 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v6);
    v9 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_240B3F904(0, v4[2] + 1, 1, v4);
      v11 = v4[2];
      v10 = v4[3];
      if (v11 >= v10 >> 1)
        v4 = sub_240B3F904((_QWORD *)(v10 > 1), v11 + 1, 1, v4);
      v4[2] = v11 + 1;
      v4[v11 + 4] = v7;
    }
    v3 += 16;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_240B57EE0(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = __OFSUB__(a2, v3);
  v5 = a2 - v3;
  if ((v5 < 0) ^ v4 | (v5 == 0))
  {
    if (v5 < 0 != v4)
    {
      v7 = sub_240B530E0(a2, a1);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      if ((v12 & 1) != 0)
      {
        sub_240B605B0();
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRetain();
        v16 = swift_dynamicCastClass();
        if (!v16)
        {
          swift_unknownObjectRelease();
          v16 = MEMORY[0x24BEE4AF8];
        }
        v17 = *(_QWORD *)(v16 + 16);
        swift_release();
        if (__OFSUB__(v13 >> 1, v11))
        {
          __break(1u);
        }
        else if (v17 == (v13 >> 1) - v11)
        {
          v2 = swift_dynamicCastClass();
          swift_unknownObjectRelease();
          if (!v2)
          {
            swift_unknownObjectRelease();
            return MEMORY[0x24BEE4AF8];
          }
          return v2;
        }
        swift_unknownObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      v14 = sub_240B54F68(v7, v9, v11, v13);
      swift_unknownObjectRelease();
      return v14;
    }
    swift_bridgeObjectRetain();
  }
  else
  {
    v18 = sub_240B3E574(0, v5);
    v6 = swift_bridgeObjectRetain();
    sub_240B4DDA0(v6);
    return v18;
  }
  return v2;
}

uint64_t sub_240B58040(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  void (*v7)(char *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  id v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t result;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  void (*v85)(char *, uint64_t);
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  _OWORD v91[3];
  uint64_t v92;
  void *v93;

  v83 = a3;
  v84 = a4;
  v89 = sub_240B5FDD0();
  v7 = *(void (**)(char *, uint64_t))(v89 - 8);
  v8 = MEMORY[0x24BDAC7A8](v89);
  v10 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v80 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v88 = (char *)&v80 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v86 = v4;
  v87 = (char *)&v80 - v16;
  v17 = *(_QWORD *)(v4 + 64);
  v18 = *(void **)(v4 + 72);
  v19 = *(_OWORD *)(v4 + 32);
  v91[0] = *(_OWORD *)(v4 + 16);
  v91[1] = v19;
  v91[2] = *(_OWORD *)(v4 + 48);
  v92 = v17;
  v93 = v18;
  swift_bridgeObjectRetain();
  v20 = v18;
  v21 = sub_240B48DF8();

  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(v21 + 16);
  if (v22)
  {
    v81 = a1;
    v82 = a2;
    v85 = v7;
    *(_QWORD *)&v91[0] = MEMORY[0x24BEE4AF8];
    sub_240B4CEB4(0, v22, 0);
    v23 = 0;
    v24 = *(_QWORD *)&v91[0];
    v25 = *(_QWORD *)(*(_QWORD *)&v91[0] + 16);
    do
    {
      v26 = *(_QWORD *)(v21 + 8 * v23 + 32);
      *(_QWORD *)&v91[0] = v24;
      v27 = *(_QWORD *)(v24 + 24);
      if (v25 >= v27 >> 1)
      {
        sub_240B4CEB4(v27 > 1, v25 + 1, 1);
        v24 = *(_QWORD *)&v91[0];
      }
      ++v23;
      *(_QWORD *)(v24 + 16) = v25 + 1;
      *(float *)(v24 + 4 * v25++ + 32) = (float)v26;
    }
    while (v22 != v23);
    swift_bridgeObjectRelease();
    v7 = v85;
    a1 = v81;
    a2 = v82;
  }
  else
  {
    swift_bridgeObjectRelease();
    v24 = MEMORY[0x24BEE4AF8];
  }
  sub_240B5FDA0();
  sub_240B5FD94();
  sub_240B5FDC4();
  *(_QWORD *)&v91[0] = a1;
  *((_QWORD *)&v91[0] + 1) = a2;
  sub_240B5FD88();
  sub_240B5FDB8();
  v28 = (void (*)(char *, uint64_t))*((_QWORD *)v7 + 1);
  v29 = v89;
  v28(v10, v89);
  sub_240B34A2C();
  v30 = sub_240B603C4();
  v85 = v28;
  v28(v13, v29);
  v31 = *(_QWORD *)(v30 + 16);
  v32 = MEMORY[0x24BEE4AF8];
  if (v31)
  {
    v33 = (uint64_t *)(v30 + 40);
    do
    {
      v38 = *(v33 - 1);
      v37 = *v33;
      v39 = HIBYTE(*v33) & 0xF;
      if ((*v33 & 0x2000000000000000) == 0)
        v39 = v38 & 0xFFFFFFFFFFFFLL;
      if (v39)
      {
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v91[0] = v32;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_240B4CC6C(0, *(_QWORD *)(v32 + 16) + 1, 1);
          v32 = *(_QWORD *)&v91[0];
        }
        v35 = *(_QWORD *)(v32 + 16);
        v34 = *(_QWORD *)(v32 + 24);
        if (v35 >= v34 >> 1)
        {
          sub_240B4CC6C(v34 > 1, v35 + 1, 1);
          v32 = *(_QWORD *)&v91[0];
        }
        *(_QWORD *)(v32 + 16) = v35 + 1;
        v36 = v32 + 16 * v35;
        *(_QWORD *)(v36 + 32) = v38;
        *(_QWORD *)(v36 + 40) = v37;
      }
      v33 += 2;
      --v31;
    }
    while (v31);
  }
  swift_bridgeObjectRelease();
  v41 = v86;
  swift_retain();
  v42 = 0;
  v43 = sub_240B57D58(v32, v41);
  swift_release();
  swift_release();
  if (qword_25435F0A8 != -1)
    swift_once();
  v44 = sub_240B60088();
  __swift_project_value_buffer(v44, (uint64_t)qword_25435F2B8);
  swift_bridgeObjectRetain_n();
  v45 = sub_240B60070();
  v46 = sub_240B60328();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v82 = 0;
    v49 = v48;
    *(_QWORD *)&v91[0] = v48;
    *(_DWORD *)v47 = 136315138;
    v50 = swift_bridgeObjectRetain();
    v51 = MEMORY[0x24268A108](v50, MEMORY[0x24BEE1768]);
    v53 = v52;
    swift_bridgeObjectRelease();
    v90 = sub_240B335B4(v51, v53, (uint64_t *)v91);
    sub_240B603AC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_240B2B000, v45, v46, "LSTM Token IDs: %s", v47, 0xCu);
    swift_arrayDestroy();
    v42 = v82;
    MEMORY[0x24268A954](v49, -1, -1);
    MEMORY[0x24268A954](v47, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v54 = sub_240B57EE0((uint64_t)v43, 256);
  swift_bridgeObjectRelease();
  v55 = *(_QWORD *)(v54 + 16);
  if (v55)
  {
    *(_QWORD *)&v91[0] = MEMORY[0x24BEE4AF8];
    sub_240B4CEB4(0, v55, 0);
    v56 = 0;
    v57 = *(_QWORD *)&v91[0];
    v58 = *(_QWORD *)(*(_QWORD *)&v91[0] + 16);
    do
    {
      v59 = *(_QWORD *)(v54 + 8 * v56 + 32);
      *(_QWORD *)&v91[0] = v57;
      v60 = *(_QWORD *)(v57 + 24);
      if (v58 >= v60 >> 1)
      {
        sub_240B4CEB4(v60 > 1, v58 + 1, 1);
        v57 = *(_QWORD *)&v91[0];
      }
      ++v56;
      *(_QWORD *)(v57 + 16) = v58 + 1;
      *(float *)(v57 + 4 * v58++ + 32) = (float)v59;
    }
    while (v55 != v56);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v57 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)&v91[0] = v57;
  sub_240B4DC58(v24);
  v61 = *(_QWORD *)&v91[0];
  v62 = HIBYTE(v84) & 0xF;
  if ((v84 & 0x2000000000000000) == 0)
    v62 = v83 & 0xFFFFFFFFFFFFLL;
  if (v62)
  {
    v63 = sub_240B57864(v83, v84);
    v65 = sub_240B50FC4(v63, v64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v66 = (char *)v61;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_35;
  }
  else
  {
    swift_bridgeObjectRetain();
    v65 = -1;
    v66 = (char *)v61;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_35;
  }
  v66 = sub_240B3FD3C(0, *(_QWORD *)(v61 + 16) + 1, 1, (char *)v61);
LABEL_35:
  v68 = *((_QWORD *)v66 + 2);
  v67 = *((_QWORD *)v66 + 3);
  if (v68 >= v67 >> 1)
    v66 = sub_240B3FD3C((char *)(v67 > 1), v68 + 1, 1, v66);
  *((_QWORD *)v66 + 2) = v68 + 1;
  *(float *)&v66[4 * v68 + 32] = (float)v65;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088BE8);
  v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_240B62510;
  sub_240B595EC(0, &qword_257088BB8);
  *(_QWORD *)(v69 + 32) = sub_240B60358();
  *(_QWORD *)(v69 + 40) = sub_240B60358();
  *(_QWORD *)&v91[0] = v69;
  sub_240B6025C();
  v70 = *(_QWORD *)&v91[0];
  v71 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
  v72 = sub_240B54234(v70, 65600);
  if (v42)
  {

    goto LABEL_46;
  }
  v73 = v72;
  if (!v72)
  {
LABEL_46:
    result = sub_240B60490();
    __break(1u);
    return result;
  }
  v74 = *((_QWORD *)v66 + 2);
  if (v74)
  {
    for (i = 0; i != v74; ++i)
    {
      v76 = (void *)sub_240B602BC();
      objc_msgSend(v73, sel_setObject_atIndexedSubscript_, v76, i);

    }
  }
  swift_bridgeObjectRelease();
  v77 = v89;
  v78 = v85;
  v85(v88, v89);
  v78(v87, v77);
  return (uint64_t)v73;
}

uint64_t sub_240B58834(void *a1)
{
  _QWORD *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t result;

  v2 = (_QWORD *)sub_240B5AC54(MEMORY[0x24BEE4AF8]);
  v3 = objc_msgSend(a1, sel_count);
  if (__OFSUB__(v3, 1))
    goto LABEL_22;
  if ((((unint64_t)v3 - 1) & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, 0);
    objc_msgSend(v5, sel_doubleValue);
    v7 = v6;

    v8 = (uint64_t *)&unk_251108C18;
    v9 = 1;
    while (1)
    {
      v11 = *(v8 - 1);
      v10 = *v8;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v14 = sub_240B35E68(v11, v10);
      v15 = v2[2];
      v16 = (v13 & 1) == 0;
      v17 = v15 + v16;
      if (__OFADD__(v15, v16))
      {
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
        break;
      }
      v18 = v13;
      if (v2[3] >= v17)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v13 & 1) == 0)
            goto LABEL_13;
        }
        else
        {
          sub_240B37BD4();
          if ((v18 & 1) == 0)
            goto LABEL_13;
        }
      }
      else
      {
        sub_240B36DA0(v17, isUniquelyReferenced_nonNull_native);
        v19 = sub_240B35E68(v11, v10);
        if ((v18 & 1) != (v20 & 1))
          goto LABEL_24;
        v14 = v19;
        if ((v18 & 1) == 0)
        {
LABEL_13:
          v2[(v14 >> 6) + 8] |= 1 << v14;
          v21 = (uint64_t *)(v2[6] + 16 * v14);
          *v21 = v11;
          v21[1] = v10;
          *(_QWORD *)(v2[7] + 8 * v14) = v7;
          v22 = v2[2];
          v23 = __OFADD__(v22, 1);
          v24 = v22 + 1;
          if (v23)
            goto LABEL_21;
          v2[2] = v24;
          swift_bridgeObjectRetain();
          goto LABEL_15;
        }
      }
      *(_QWORD *)(v2[7] + 8 * v14) = v7;
LABEL_15:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v4 == (id)v9)
        goto LABEL_19;
      v8 += 2;
      v25 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, v9);
      objc_msgSend(v25, sel_doubleValue);
      v7 = v26;

      if (v9++ >= 5)
      {
        __break(1u);
LABEL_19:
        swift_arrayDestroy();
        return (uint64_t)v2;
      }
    }
  }
  __break(1u);
LABEL_24:
  result = sub_240B605D4();
  __break(1u);
  return result;
}

_QWORD *sub_240B58AA0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v14;
  _QWORD *v15;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = (_QWORD *)(a2 + *a3);
  v4 = swift_bridgeObjectRetain() + 56;
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v15 = v5;
    v6 = v14[4];
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    swift_bridgeObjectRetain();
    sub_240B6037C();
    v7 = sub_240B60214();
    v8 = (*(uint64_t (**)(uint64_t))(v6 + 16))(v7);
    v10 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
      v5 = v15;
    }
    else
    {
      v5 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_240B3F904(0, v15[2] + 1, 1, v15);
      v12 = v5[2];
      v11 = v5[3];
      if (v12 >= v11 >> 1)
        v5 = sub_240B3F904((_QWORD *)(v11 > 1), v12 + 1, 1, v5);
      v5[2] = v12 + 1;
      v5[v12 + 4] = v8;
    }
    v4 += 32;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_240B58C3C(uint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  id v17;
  double v18;
  id v19;
  uint64_t result;
  uint64_t v21;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_240B4CEB4(0, v3, 0);
    v4 = v21;
    v6 = (uint64_t *)(a1 + 32);
    v7 = *(_QWORD *)(v21 + 16);
    do
    {
      v9 = *v6++;
      v8 = v9;
      v10 = *(_QWORD *)(v21 + 24);
      if (v7 >= v10 >> 1)
        sub_240B4CEB4(v10 > 1, v7 + 1, 1);
      *(_QWORD *)(v21 + 16) = v7 + 1;
      *(float *)(v21 + 4 * v7++ + 32) = (float)v8;
      --v3;
    }
    while (v3);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088BE8);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_240B62510;
  sub_240B595EC(0, &qword_257088BB8);
  *(_QWORD *)(v11 + 32) = sub_240B60358();
  *(_QWORD *)(v11 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a2);
  sub_240B6025C();
  v12 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
  v13 = sub_240B54234(v11, 65600);
  if (v13)
  {
    v14 = *(_QWORD *)(v4 + 16);
    if (v14)
    {
      for (i = 0; i != v14; ++i)
      {
        v16 = *(_DWORD *)(v4 + 32 + 4 * i);
        v17 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
        LODWORD(v18) = v16;
        v19 = objc_msgSend(v17, sel_initWithFloat_, v18);
        objc_msgSend(v13, sel_setObject_atIndexedSubscript_, v19, i);

      }
    }
    swift_bridgeObjectRelease();
    return (uint64_t)v13;
  }
  else
  {
    result = sub_240B60490();
    __break(1u);
  }
  return result;
}

uint64_t sub_240B58E8C(void *a1)
{
  _QWORD *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t result;

  v2 = (_QWORD *)sub_240B5AC54(MEMORY[0x24BEE4AF8]);
  v3 = objc_msgSend(a1, sel_count);
  if (__OFSUB__(v3, 1))
    goto LABEL_22;
  if ((((unint64_t)v3 - 1) & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, 0);
    objc_msgSend(v5, sel_doubleValue);
    v7 = v6;

    v8 = (uint64_t *)&unk_251108C88;
    v9 = 1;
    while (1)
    {
      v11 = *(v8 - 1);
      v10 = *v8;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v14 = sub_240B35E68(v11, v10);
      v15 = v2[2];
      v16 = (v13 & 1) == 0;
      v17 = v15 + v16;
      if (__OFADD__(v15, v16))
      {
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
        break;
      }
      v18 = v13;
      if (v2[3] >= v17)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v13 & 1) == 0)
            goto LABEL_13;
        }
        else
        {
          sub_240B37BD4();
          if ((v18 & 1) == 0)
            goto LABEL_13;
        }
      }
      else
      {
        sub_240B36DA0(v17, isUniquelyReferenced_nonNull_native);
        v19 = sub_240B35E68(v11, v10);
        if ((v18 & 1) != (v20 & 1))
          goto LABEL_24;
        v14 = v19;
        if ((v18 & 1) == 0)
        {
LABEL_13:
          v2[(v14 >> 6) + 8] |= 1 << v14;
          v21 = (uint64_t *)(v2[6] + 16 * v14);
          *v21 = v11;
          v21[1] = v10;
          *(_QWORD *)(v2[7] + 8 * v14) = v7;
          v22 = v2[2];
          v23 = __OFADD__(v22, 1);
          v24 = v22 + 1;
          if (v23)
            goto LABEL_21;
          v2[2] = v24;
          swift_bridgeObjectRetain();
          goto LABEL_15;
        }
      }
      *(_QWORD *)(v2[7] + 8 * v14) = v7;
LABEL_15:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v4 == (id)v9)
        goto LABEL_19;
      v8 += 2;
      v25 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, v9);
      objc_msgSend(v25, sel_doubleValue);
      v7 = v26;

      if (v9++ >= 7)
      {
        __break(1u);
LABEL_19:
        swift_arrayDestroy();
        return (uint64_t)v2;
      }
    }
  }
  __break(1u);
LABEL_24:
  result = sub_240B605D4();
  __break(1u);
  return result;
}

uint64_t sub_240B590F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  _QWORD *v15;
  char isUniquelyReferenced_nonNull_native;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t result;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  void *v45;

  v33 = sub_240B5AC54(MEMORY[0x24BEE4AF8]);
  v32 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  v31 = v5 - 1;
  swift_bridgeObjectRetain();
  v34 = 0;
  if (!v4)
    goto LABEL_8;
LABEL_6:
  v6 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  v7 = v6 | (v34 << 6);
LABEL_7:
  sub_240B594E4(*(_QWORD *)(a1 + 48) + 40 * v7, (uint64_t)&v39);
  *((_QWORD *)&v41 + 1) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v7);
  v8 = *((id *)&v41 + 1);
  while (1)
  {
    sub_240B59520((uint64_t)&v39, (uint64_t)&v42, &qword_257088BC0);
    if (!*((_QWORD *)&v43 + 1))
    {
      swift_release();
      return v33;
    }
    v39 = v42;
    v40 = v43;
    v12 = v45;
    *(_QWORD *)&v41 = v44;
    sub_240B60418();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v37 = 0;
      v38 = 1;
      MEMORY[0x24268A15C](v12, &v37);
      if ((v38 & 1) != 0)
      {
        swift_bridgeObjectRelease();

        sub_240B59564((uint64_t)&v39);
      }
      else
      {
        v13 = a1;
        v14 = v5;
        v15 = v37;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v37 = (_QWORD *)v33;
        v18 = sub_240B35E68(v35, v36);
        v19 = *(_QWORD *)(v33 + 16);
        v20 = (v17 & 1) == 0;
        v21 = v19 + v20;
        if (__OFADD__(v19, v20))
          goto LABEL_45;
        v22 = v17;
        if (*(_QWORD *)(v33 + 24) >= v21)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_240B37BD4();
        }
        else
        {
          sub_240B36DA0(v21, isUniquelyReferenced_nonNull_native);
          v23 = sub_240B35E68(v35, v36);
          if ((v22 & 1) != (v24 & 1))
            goto LABEL_48;
          v18 = v23;
        }
        v25 = v37;
        v33 = (unint64_t)v37;
        if ((v22 & 1) != 0)
        {
          *(_QWORD *)(v37[7] + 8 * v18) = v15;
        }
        else
        {
          v37[(v18 >> 6) + 8] |= 1 << v18;
          v26 = (uint64_t *)(v25[6] + 16 * v18);
          *v26 = v35;
          v26[1] = v36;
          *(_QWORD *)(v25[7] + 8 * v18) = v15;
          v27 = v25[2];
          v28 = __OFADD__(v27, 1);
          v29 = v27 + 1;
          if (v28)
            goto LABEL_46;
          v25[2] = v29;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_240B59564((uint64_t)&v39);
        v5 = v14;
        a1 = v13;
      }
      if (v4)
        goto LABEL_6;
    }
    else
    {

      sub_240B59564((uint64_t)&v39);
      if (v4)
        goto LABEL_6;
    }
LABEL_8:
    v9 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v9 < v5)
    {
      v10 = *(_QWORD *)(v32 + 8 * v9);
      if (v10)
        goto LABEL_11;
      v11 = v34 + 2;
      ++v34;
      if (v9 + 1 < v5)
      {
        v10 = *(_QWORD *)(v32 + 8 * v11);
        if (v10)
          goto LABEL_14;
        v34 = v9 + 1;
        if (v9 + 2 < v5)
        {
          v10 = *(_QWORD *)(v32 + 8 * (v9 + 2));
          if (v10)
          {
            v9 += 2;
            goto LABEL_11;
          }
          v11 = v9 + 3;
          v34 = v9 + 2;
          if (v9 + 3 < v5)
          {
            v10 = *(_QWORD *)(v32 + 8 * v11);
            if (!v10)
            {
              while (1)
              {
                v9 = v11 + 1;
                if (__OFADD__(v11, 1))
                  goto LABEL_47;
                if (v9 >= v5)
                {
                  v34 = v31;
                  goto LABEL_25;
                }
                v10 = *(_QWORD *)(v32 + 8 * v9);
                ++v11;
                if (v10)
                  goto LABEL_11;
              }
            }
LABEL_14:
            v9 = v11;
LABEL_11:
            v4 = (v10 - 1) & v10;
            v7 = __clz(__rbit64(v10)) + (v9 << 6);
            v34 = v9;
            goto LABEL_7;
          }
        }
      }
    }
LABEL_25:
    v4 = 0;
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
  }
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  result = sub_240B605D4();
  __break(1u);
  return result;
}

uint64_t sub_240B594E4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_240B59520(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_240B59564(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_240B59598()
{
  return swift_release();
}

uint64_t sub_240B595A0(_QWORD *a1)
{
  return sub_240B59754(a1) & 1;
}

uint64_t sub_240B595B8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_240B595DC()
{
  return swift_deallocObject();
}

uint64_t sub_240B595EC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_240B59624()
{
  unint64_t result;

  result = qword_257088C00;
  if (!qword_257088C00)
  {
    result = MEMORY[0x24268A8B8](&unk_240B62460, &type metadata for DecisionStrategy.Error);
    atomic_store(result, (unint64_t *)&qword_257088C00);
  }
  return result;
}

unint64_t sub_240B59668()
{
  unint64_t result;

  result = qword_257088C20;
  if (!qword_257088C20)
  {
    result = MEMORY[0x24268A8B8](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_257088C20);
  }
  return result;
}

unint64_t sub_240B596AC()
{
  unint64_t result;

  result = qword_257088C28;
  if (!qword_257088C28)
  {
    result = MEMORY[0x24268A8B8](MEMORY[0x24BEE0D40], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257088C28);
  }
  return result;
}

double sub_240B596F0(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 217) = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
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

uint64_t sub_240B59754(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_240B605A4() & 1;
}

uint64_t storeEnumTagSinglePayload for DecisionStrategy.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_240B597F4 + 4 * byte_240B622ED[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_240B59828 + 4 * byte_240B622E8[v4]))();
}

uint64_t sub_240B59828(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B59830(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B59838);
  return result;
}

uint64_t sub_240B59844(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B5984CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_240B59850(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B59858(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DecisionStrategy.Error()
{
  return &type metadata for DecisionStrategy.Error;
}

unint64_t sub_240B5987C()
{
  unint64_t result;

  result = qword_257088C40;
  if (!qword_257088C40)
  {
    result = MEMORY[0x24268A8B8](&unk_240B62438, &type metadata for DecisionStrategy.Error);
    atomic_store(result, (unint64_t *)&qword_257088C40);
  }
  return result;
}

uint64_t sub_240B598C4@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
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
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void (*v26)(_QWORD, _QWORD);
  void (*v27)(_QWORD, _QWORD);
  void (*v28)(_QWORD, _QWORD);
  void (*v29)(_QWORD, _QWORD);
  void (*v30)(_QWORD, _QWORD);
  uint64_t v31;
  void (*v32)(_QWORD, _QWORD);
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void (*v39)(_QWORD, _QWORD);
  void (*v40)(_QWORD, _QWORD);
  void (*v41)(_QWORD, _QWORD);
  void (*v42)(_QWORD, _QWORD);
  void (*v43)(_QWORD, _QWORD);
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void (*v50)(_QWORD, _QWORD);
  void (*v51)(_QWORD, _QWORD);
  void (*v52)(_QWORD, _QWORD);
  void (*v53)(_QWORD, _QWORD);
  void (*v54)(_QWORD, _QWORD);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  uint64_t v94;
  int *v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(uint64_t, char *, uint64_t);
  uint64_t result;
  uint64_t v109;
  uint64_t v110;
  id v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  unint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  unint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  void (*v132)(_QWORD, _QWORD);
  _QWORD v133[2];
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _OWORD v145[2];
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _OWORD v153[3];

  v114 = sub_240B5FF14();
  v4 = *(_QWORD *)(v114 - 8);
  v5 = MEMORY[0x24BDAC7A8](v114);
  v115 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v116 = (char *)&v109 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v117 = (char *)&v109 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v118 = (char *)&v109 - v11;
  v12 = type metadata accessor for BloomFilterData(0);
  MEMORY[0x24BDAC7A8](v12);
  v122 = (uint64_t)&v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for BlackPearlModel(0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v121 = (uint64_t *)((char *)&v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = MEMORY[0x24BDAC7A8](v15);
  v125 = (uint64_t *)((char *)&v109 - v18);
  MEMORY[0x24BDAC7A8](v17);
  v128 = (uint64_t *)((char *)&v109 - v19);
  type metadata accessor for BlackPearlSharedDefaults();
  swift_allocObject();
  *a2 = sub_240B37DB4();
  swift_retain();
  static BlackPearlTrialLevels.buildVersion(trialClient:)(a1, (uint64_t)v133);
  v152 = v144;
  v153[0] = v145[0];
  *(_OWORD *)((char *)v153 + 9) = *(_OWORD *)((char *)v145 + 9);
  v148 = v140;
  v149 = v141;
  v150 = v142;
  v151 = v143;
  v146 = v138;
  v147 = v139;
  v126 = v133[1];
  v127 = v133[0];
  v123 = v135;
  v124 = v134;
  v119 = v137;
  v120 = v136;
  v145[0] = v153[0];
  *(_OWORD *)((char *)v145 + 9) = *(_OWORD *)((char *)v153 + 9);
  sub_240B38030(v133);
  swift_release();
  v20 = (void *)sub_240B600D0();
  v130 = "P";
  v21 = (void *)sub_240B600D0();
  v22 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v20, v21);

  if (!v22)
    goto LABEL_34;
  v23 = objc_msgSend(v22, sel_directoryValue);

  if (!v23)
  {
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
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v24 = objc_msgSend(v23, sel_path);

  if (!v24)
    goto LABEL_34;
  v112 = a2;
  v113 = v4;
  v25 = sub_240B600F4();
  v27 = v26;

  v133[0] = 47;
  v133[1] = 0xE100000000000000;
  v131 = v25;
  v132 = v27;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v28;
  sub_240B60178();
  swift_bridgeObjectRelease();
  strcpy((char *)v133, "BlackPearl");
  BYTE3(v133[1]) = 0;
  HIDWORD(v133[1]) = -369098752;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v29;
  sub_240B60178();
  swift_bridgeObjectRelease();
  strcpy((char *)v133, ".mlpackage");
  BYTE3(v133[1]) = 0;
  HIDWORD(v133[1]) = -369098752;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v30;
  sub_240B60178();
  swift_bridgeObjectRelease();
  v31 = v131;
  v32 = v132;
  v129 = type metadata accessor for TrialLoader();
  static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(v31, v32, 0x6165506B63616C42, 0xEA00000000006C72, v127, v126, v128);
  swift_bridgeObjectRelease();
  v33 = (void *)sub_240B600D0();
  v34 = (void *)sub_240B600D0();
  v35 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v33, v34);

  if (!v35)
    goto LABEL_34;
  v36 = objc_msgSend(v35, sel_directoryValue);

  if (!v36)
    goto LABEL_27;
  v37 = objc_msgSend(v36, sel_path);

  if (!v37)
    goto LABEL_34;
  v38 = sub_240B600F4();
  v40 = v39;

  v133[0] = 47;
  v133[1] = 0xE100000000000000;
  v131 = v38;
  v132 = v40;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v41;
  sub_240B60178();
  swift_bridgeObjectRelease();
  v133[0] = 0xD000000000000010;
  v133[1] = 0x8000000240B62A30;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v42;
  sub_240B60178();
  swift_bridgeObjectRelease();
  strcpy((char *)v133, ".mlpackage");
  BYTE3(v133[1]) = 0;
  HIDWORD(v133[1]) = -369098752;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v43;
  sub_240B60178();
  swift_bridgeObjectRelease();
  static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(v131, v132, 0xD000000000000010, 0x8000000240B62A30, v124, v123, v125);
  swift_bridgeObjectRelease();
  v44 = (void *)sub_240B600D0();
  v45 = (void *)sub_240B600D0();
  v46 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v44, v45);

  if (!v46)
    goto LABEL_34;
  v47 = objc_msgSend(v46, sel_directoryValue);

  if (!v47)
    goto LABEL_28;
  v48 = objc_msgSend(v47, sel_path);

  if (!v48)
    goto LABEL_34;
  v49 = sub_240B600F4();
  v51 = v50;

  v133[0] = 47;
  v133[1] = 0xE100000000000000;
  v131 = v49;
  v132 = v51;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v52;
  sub_240B60178();
  swift_bridgeObjectRelease();
  strcpy((char *)v133, "BlackPearlTS");
  BYTE5(v133[1]) = 0;
  HIWORD(v133[1]) = -5120;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v53;
  sub_240B60178();
  swift_bridgeObjectRelease();
  strcpy((char *)v133, ".mlpackage");
  BYTE3(v133[1]) = 0;
  HIDWORD(v133[1]) = -369098752;
  swift_bridgeObjectRetain();
  v131 = sub_240B60214();
  v132 = v54;
  sub_240B60178();
  swift_bridgeObjectRelease();
  static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(v131, v132, 0x6165506B63616C42, 0xEC00000053546C72, v120, v119, v121);
  swift_bridgeObjectRelease();
  static BlackPearlTrialLevels.buildThresholds(trialClient:)(a1, v133);
  v55 = v133[0];
  v56 = v133[1];
  v57 = v134;
  v58 = v135;
  v59 = v136;
  v60 = v137;
  v61 = v138;
  v63 = *((_QWORD *)&v139 + 1);
  v129 = v139;
  v62 = v140;
  static BlackPearlTrialLevels.buildBloomFilters(trialClient:)(a1, v122);
  v64 = (void *)sub_240B600D0();
  v65 = (void *)sub_240B600D0();
  v66 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v64, v65);

  if (!v66)
    goto LABEL_34;
  v67 = objc_msgSend(v66, sel_fileValue);
  if (!v67)
    goto LABEL_29;
  v68 = v67;
  v69 = objc_msgSend(v67, sel_path);

  if (!v69)
    goto LABEL_34;
  v111 = v66;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v70 = (void *)sub_240B600D0();
  v71 = (void *)sub_240B600D0();
  v72 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v70, v71);

  if (!v72)
    goto LABEL_34;
  v73 = objc_msgSend(v72, sel_fileValue);
  if (!v73)
    goto LABEL_30;
  v74 = v73;
  v75 = objc_msgSend(v73, sel_path);

  if (!v75)
    goto LABEL_34;
  v110 = v62;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v76 = (void *)sub_240B600D0();
  v77 = (void *)sub_240B600D0();
  v78 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v76, v77);

  if (!v78)
    goto LABEL_34;
  v79 = objc_msgSend(v78, sel_fileValue);
  if (!v79)
    goto LABEL_31;
  v80 = v79;
  v81 = objc_msgSend(v79, sel_path);

  if (!v81)
    goto LABEL_34;
  v109 = v63;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v82 = (void *)sub_240B600D0();
  v83 = (void *)sub_240B600D0();
  v84 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v82, v83);

  if (!v84)
    goto LABEL_34;
  v85 = objc_msgSend(v84, sel_fileValue);
  if (!v85)
    goto LABEL_32;
  v86 = v85;
  v87 = objc_msgSend(v85, sel_path);

  if (!v87)
    goto LABEL_34;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v88 = (void *)sub_240B600D0();
  v89 = (void *)sub_240B600D0();
  v90 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v88, v89);

  if (!v90)
    goto LABEL_34;
  v91 = objc_msgSend(v90, sel_fileValue);
  if (!v91)
    goto LABEL_33;
  v92 = v91;
  v93 = objc_msgSend(v91, sel_path);

  if (v93)
  {
    sub_240B600F4();

    v94 = (uint64_t)v112 + *(int *)(type metadata accessor for BlackPearlTrialLevels() + 20);
    v95 = (int *)type metadata accessor for BlackPearlLevels();
    sub_240B5FE90();
    swift_bridgeObjectRelease();

    sub_240B2C85C((uint64_t)v128, v94, type metadata accessor for BlackPearlModel);
    sub_240B2C85C((uint64_t)v125, v94 + v95[5], type metadata accessor for BlackPearlModel);
    sub_240B2C85C((uint64_t)v121, v94 + v95[6], type metadata accessor for BlackPearlModel);
    v96 = v94 + v95[7];
    v97 = v126;
    *(_QWORD *)v96 = v127;
    *(_QWORD *)(v96 + 8) = v97;
    v98 = v123;
    *(_QWORD *)(v96 + 16) = v124;
    *(_QWORD *)(v96 + 24) = v98;
    v99 = v119;
    *(_QWORD *)(v96 + 32) = v120;
    *(_QWORD *)(v96 + 40) = v99;
    v100 = v153[0];
    *(_OWORD *)(v96 + 144) = v152;
    *(_OWORD *)(v96 + 160) = v100;
    *(_OWORD *)(v96 + 169) = *(_OWORD *)((char *)v153 + 9);
    v101 = v149;
    *(_OWORD *)(v96 + 80) = v148;
    *(_OWORD *)(v96 + 96) = v101;
    v102 = v151;
    *(_OWORD *)(v96 + 112) = v150;
    *(_OWORD *)(v96 + 128) = v102;
    v103 = v147;
    *(_OWORD *)(v96 + 48) = v146;
    *(_OWORD *)(v96 + 64) = v103;
    v104 = v94 + v95[8];
    *(_QWORD *)v104 = v55;
    *(_QWORD *)(v104 + 8) = v56;
    *(_QWORD *)(v104 + 16) = v57;
    *(_QWORD *)(v104 + 24) = v58;
    *(_QWORD *)(v104 + 32) = v59;
    *(_QWORD *)(v104 + 40) = v60;
    *(_OWORD *)(v104 + 48) = v61;
    *(_QWORD *)(v104 + 64) = v129;
    v105 = v110;
    *(_QWORD *)(v104 + 72) = v109;
    *(_QWORD *)(v104 + 80) = v105;
    sub_240B2C85C(v122, v94 + v95[9], type metadata accessor for BloomFilterData);
    v106 = v114;
    v107 = *(void (**)(uint64_t, char *, uint64_t))(v113 + 32);
    v107(v94 + v95[10], v118, v114);
    v107(v94 + v95[11], v117, v106);
    v107(v94 + v95[12], v116, v106);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v107)(v94 + v95[13], v115, v106);
  }
LABEL_34:
  result = sub_240B60490();
  __break(1u);
  return result;
}

uint64_t BlackPearlTrialLevels.getBlackPearlLevels()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlTrialLevels() + 20);
  return sub_240B2EF30(v3, a1);
}

uint64_t type metadata accessor for BlackPearlTrialLevels()
{
  uint64_t result;

  result = qword_25435F088;
  if (!qword_25435F088)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_240B5A958(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_240B5FF14();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_240B42160(a1);
    v13 = sub_240B35E0C(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = *v3;
      v22 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_240B372C0();
        v17 = v22;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_240B44028(v15, v17);
      *v3 = v17;
      swift_bridgeObjectRelease();
      v18 = 0;
    }
    else
    {
      v18 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v18, 1, v9);
    return sub_240B42160((uint64_t)v8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_240B44560((uint64_t)v12, a2, v19);
    *v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_240B5AB20(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088C48);
  v2 = sub_240B604C0();
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
    sub_240B5E8C4(v6, (uint64_t)&v15, &qword_257088C50);
    v7 = v15;
    v8 = v16;
    result = sub_240B35E68(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_240B3875C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_240B5AC54(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887A8);
  v2 = (_QWORD *)sub_240B604C0();
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
    result = sub_240B35E68(v5, v6);
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

void static BlackPearlTrialLevels.buildVersion(trialClient:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t *v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  __int128 v84;
  uint64_t v85;
  char v86;

  v4 = (void *)sub_240B600D0();
  v5 = objc_msgSend(a1, sel_experimentIdentifiersWithNamespaceName_, v4);

  v6 = (void *)sub_240B600D0();
  v83 = objc_msgSend(a1, sel_rolloutIdentifiersWithNamespaceName_, v6);

  v7 = (void *)sub_240B600D0();
  v8 = (void *)sub_240B600D0();
  v9 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v7, v8);

  if (!v9 || (v10 = objc_msgSend(v9, sel_stringValue), v9, !v10))
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v57 = sub_240B60088();
    __swift_project_value_buffer(v57, (uint64_t)qword_25435F2B8);
    v58 = sub_240B60070();
    v59 = sub_240B60334();
    if (!os_log_type_enabled(v58, v59))
      goto LABEL_44;
    v60 = "Model version not found";
    goto LABEL_43;
  }
  v81 = sub_240B600F4();
  v82 = v11;

  v12 = (void *)sub_240B600D0();
  v13 = (void *)sub_240B600D0();
  v14 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v12, v13);

  if (!v14 || (v15 = objc_msgSend(v14, sel_stringValue), v14, !v15))
  {
    swift_bridgeObjectRelease();
    if (qword_25435F0A8 != -1)
      swift_once();
    v61 = sub_240B60088();
    __swift_project_value_buffer(v61, (uint64_t)qword_25435F2B8);
    v58 = sub_240B60070();
    v59 = sub_240B60334();
    if (!os_log_type_enabled(v58, v59))
      goto LABEL_44;
    v60 = "Sender Model Version not found";
    goto LABEL_43;
  }
  v79 = sub_240B600F4();
  v80 = v16;

  v17 = (void *)sub_240B600D0();
  v18 = (void *)sub_240B600D0();
  v19 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v17, v18);

  if (!v19 || (v20 = objc_msgSend(v19, sel_stringValue), v19, !v20))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25435F0A8 != -1)
      swift_once();
    v62 = sub_240B60088();
    __swift_project_value_buffer(v62, (uint64_t)qword_25435F2B8);
    v58 = sub_240B60070();
    v59 = sub_240B60334();
    if (!os_log_type_enabled(v58, v59))
      goto LABEL_44;
    v60 = "TS Model Version not found";
    goto LABEL_43;
  }
  v77 = sub_240B600F4();
  v78 = v21;

  v22 = (void *)sub_240B600D0();
  v23 = (void *)sub_240B600D0();
  v24 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v22, v23);

  if (!v24 || (v25 = objc_msgSend(v24, sel_stringValue), v24, !v25))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25435F0A8 != -1)
      swift_once();
    v63 = sub_240B60088();
    __swift_project_value_buffer(v63, (uint64_t)qword_25435F2B8);
    v58 = sub_240B60070();
    v59 = sub_240B60334();
    if (!os_log_type_enabled(v58, v59))
      goto LABEL_44;
    v60 = "Rule Version not found";
    goto LABEL_43;
  }
  v75 = sub_240B600F4();
  v76 = v26;

  v27 = (void *)sub_240B600D0();
  v28 = (void *)sub_240B600D0();
  v29 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v27, v28);

  if (!v29 || (v30 = objc_msgSend(v29, sel_stringValue), v29, !v30))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25435F0A8 != -1)
      swift_once();
    v64 = sub_240B60088();
    __swift_project_value_buffer(v64, (uint64_t)qword_25435F2B8);
    v58 = sub_240B60070();
    v59 = sub_240B60334();
    if (!os_log_type_enabled(v58, v59))
      goto LABEL_44;
    v60 = "BreakThrough version not found";
    goto LABEL_43;
  }
  v73 = sub_240B600F4();
  v74 = v31;

  v32 = (void *)sub_240B600D0();
  v33 = (void *)sub_240B600D0();
  v34 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v32, v33);

  if (v34)
  {
    v35 = objc_msgSend(v34, sel_stringValue);

    if (v35)
    {
      v36 = sub_240B600F4();
      v71 = v37;
      v72 = v36;

      v38 = v83;
      if (v5)
      {
        v39 = objc_msgSend(v5, sel_experimentId);
        v40 = sub_240B600F4();
        v69 = v41;
        v70 = v40;

        v42 = objc_msgSend(v5, sel_treatmentId);
        v68 = sub_240B600F4();
        v44 = v43;

        v45 = (int)objc_msgSend(v5, sel_deploymentId);
        if (v83)
        {
LABEL_15:
          v46 = (int)objc_msgSend(v83, sel_deploymentId);
          v47 = objc_msgSend(v83, sel_factorPackId);
          v48 = sub_240B600F4();
          v50 = v49;

          v51 = objc_msgSend(v83, sel_rolloutId);
          v52 = sub_240B600F4();
          v54 = v53;

          v38 = v83;
LABEL_18:
          sub_240B3899C(v72, v71, (uint64_t)&v84);

          v55 = v85;
          v56 = v84;
          LOBYTE(v84) = v86;
          *(_QWORD *)a2 = v81;
          *(_QWORD *)(a2 + 8) = v82;
          *(_QWORD *)(a2 + 16) = v79;
          *(_QWORD *)(a2 + 24) = v80;
          *(_QWORD *)(a2 + 32) = v77;
          *(_QWORD *)(a2 + 40) = v78;
          *(_QWORD *)(a2 + 48) = v75;
          *(_QWORD *)(a2 + 56) = v76;
          *(_QWORD *)(a2 + 64) = v73;
          *(_QWORD *)(a2 + 72) = v74;
          *(_QWORD *)(a2 + 80) = v70;
          *(_QWORD *)(a2 + 88) = v69;
          *(_QWORD *)(a2 + 96) = v68;
          *(_QWORD *)(a2 + 104) = v44;
          *(_QWORD *)(a2 + 112) = v45;
          *(_QWORD *)(a2 + 120) = v46;
          *(_QWORD *)(a2 + 128) = v48;
          *(_QWORD *)(a2 + 136) = v50;
          *(_QWORD *)(a2 + 144) = v52;
          *(_QWORD *)(a2 + 152) = v54;
          *(_OWORD *)(a2 + 160) = v56;
          *(_QWORD *)(a2 + 176) = v55;
          *(_BYTE *)(a2 + 184) = v84;
          return;
        }
      }
      else
      {
        v68 = 0;
        v69 = 0;
        v44 = 0;
        v70 = 0;
        v45 = -1;
        if (v83)
          goto LABEL_15;
      }
      v52 = 0;
      v54 = 0;
      v48 = 0;
      v50 = 0;
      v46 = -1;
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_25435F0A8 != -1)
    swift_once();
  v65 = sub_240B60088();
  __swift_project_value_buffer(v65, (uint64_t)qword_25435F2B8);
  v58 = sub_240B60070();
  v59 = sub_240B60334();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = "Categorization version not found";
LABEL_43:
    v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v66 = 0;
    _os_log_impl(&dword_240B2B000, v58, v59, v60, v66, 2u);
    MEMORY[0x24268A954](v66, -1, -1);
  }
LABEL_44:

  sub_240B33500();
  swift_allocError();
  *v67 = 1;
  swift_willThrow();

  sub_240B6043C();
  sub_240B60184();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088760);
  sub_240B60478();
  sub_240B60490();
  __break(1u);
}

void static BlackPearlTrialLevels.buildThresholds(trialClient:)(void *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t *v76;
  _BYTE *v77;
  uint64_t v78;

  v4 = (void *)sub_240B600D0();
  v5 = (void *)sub_240B600D0();
  v6 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v4, v5);

  if (!v6)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v62 = sub_240B60088();
    __swift_project_value_buffer(v62, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "Threshold Commerce not found";
    goto LABEL_57;
  }
  objc_msgSend(v6, sel_doubleValue);
  v8 = v7;

  v9 = (void *)sub_240B600D0();
  v10 = (void *)sub_240B600D0();
  v11 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v9, v10);

  if (!v11)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v66 = sub_240B60088();
    __swift_project_value_buffer(v66, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "ThresholdEmployeeNews value not found";
    goto LABEL_57;
  }
  objc_msgSend(v11, sel_doubleValue);
  v13 = v12;

  v14 = (void *)sub_240B600D0();
  v15 = (void *)sub_240B600D0();
  v16 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v14, v15);

  if (!v16)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v67 = sub_240B60088();
    __swift_project_value_buffer(v67, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "ThresholdEmployee value not found";
    goto LABEL_57;
  }
  objc_msgSend(v16, sel_doubleValue);
  v18 = v17;

  v19 = (void *)sub_240B600D0();
  v20 = (void *)sub_240B600D0();
  v21 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v19, v20);

  if (!v21)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v68 = sub_240B60088();
    __swift_project_value_buffer(v68, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "ThresholdPersonal value not found";
    goto LABEL_57;
  }
  objc_msgSend(v21, sel_doubleValue);
  v23 = v22;

  v24 = (void *)sub_240B600D0();
  v25 = (void *)sub_240B600D0();
  v26 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v24, v25);

  if (!v26)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v69 = sub_240B60088();
    __swift_project_value_buffer(v69, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "ThresholdP2C values ";
    goto LABEL_57;
  }
  objc_msgSend(v26, sel_doubleValue);
  v28 = v27;

  v29 = (void *)sub_240B600D0();
  v30 = (void *)sub_240B600D0();
  v31 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v29, v30);

  if (!v31)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v70 = sub_240B60088();
    __swift_project_value_buffer(v70, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "ThresholdCorpEmployee not found";
    goto LABEL_57;
  }
  objc_msgSend(v31, sel_doubleValue);
  v33 = v32;

  v34 = (void *)sub_240B600D0();
  v35 = (void *)sub_240B600D0();
  v36 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v34, v35);

  if (!v36)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v71 = sub_240B60088();
    __swift_project_value_buffer(v71, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "Threshold Sender is not found";
    goto LABEL_57;
  }
  v78 = v33;
  v37 = v28;
  v38 = v23;
  v39 = v18;
  v40 = v13;
  objc_msgSend(v36, sel_doubleValue);
  v42 = v41;

  v43 = (void *)sub_240B600D0();
  v44 = (void *)sub_240B600D0();
  v45 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v43, v44);

  if (!v45)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v72 = sub_240B60088();
    __swift_project_value_buffer(v72, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "Threshold TS is not found";
    goto LABEL_57;
  }
  v46 = v8;
  objc_msgSend(v45, sel_doubleValue);
  v48 = v47;

  v49 = (void *)sub_240B600D0();
  v50 = (void *)sub_240B600D0();
  v51 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v49, v50);

  if (!v51)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v73 = sub_240B60088();
    __swift_project_value_buffer(v73, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "Threshold Category TS is not found";
    goto LABEL_57;
  }
  objc_msgSend(v51, sel_doubleValue);
  v53 = v52;

  v54 = (void *)sub_240B600D0();
  v55 = (void *)sub_240B600D0();
  v56 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v54, v55);

  if (!v56)
  {
    if (qword_25435F0A8 != -1)
      swift_once();
    v74 = sub_240B60088();
    __swift_project_value_buffer(v74, (uint64_t)qword_25435F2B8);
    v63 = sub_240B60070();
    v64 = sub_240B60334();
    if (!os_log_type_enabled(v63, v64))
      goto LABEL_58;
    v65 = "Sender Max Tokens is not found";
    goto LABEL_57;
  }
  v57 = objc_msgSend(v56, sel_longValue);

  v58 = (void *)sub_240B600D0();
  v59 = (void *)sub_240B600D0();
  v60 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v58, v59);

  if (v60)
  {
    v61 = objc_msgSend(v60, sel_longValue);

    *a2 = v46;
    a2[1] = v40;
    a2[2] = v39;
    a2[3] = v38;
    a2[4] = v37;
    a2[5] = v42;
    a2[6] = v48;
    a2[7] = v53;
    a2[8] = v78;
    a2[9] = v57;
    a2[10] = v61;
    return;
  }
  if (qword_25435F0A8 != -1)
    swift_once();
  v75 = sub_240B60088();
  __swift_project_value_buffer(v75, (uint64_t)qword_25435F2B8);
  v63 = sub_240B60070();
  v64 = sub_240B60334();
  if (os_log_type_enabled(v63, v64))
  {
    v65 = "Subject Max Tokens is not found";
LABEL_57:
    v76 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v76 = 0;
    _os_log_impl(&dword_240B2B000, v63, v64, v65, v76, 2u);
    MEMORY[0x24268A954](v76, -1, -1);
  }
LABEL_58:

  sub_240B33500();
  swift_allocError();
  *v77 = 1;
  swift_willThrow();
  sub_240B6043C();
  sub_240B60184();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088760);
  sub_240B60478();
  sub_240B60490();
  __break(1u);
}

uint64_t static BlackPearlTrialLevels.buildBloomFilters(trialClient:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  char *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  _BYTE *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;

  v72 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_240B5FF14();
  v73 = *(_QWORD *)(v6 - 8);
  v74 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_240B5D00C(MEMORY[0x24BEE4AF8]);
  v9 = (void *)sub_240B600D0();
  v10 = (void *)sub_240B600D0();
  v11 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v9, v10);

  if (!v11)
    goto LABEL_30;
  v12 = objc_msgSend(v11, sel_fileValue);

  if (!v12)
  {
    __break(1u);
    goto LABEL_24;
  }
  v13 = objc_msgSend(v12, sel_path);

  if (!v13)
  {
LABEL_30:
    if (qword_25435F0A8 != -1)
      swift_once();
    v49 = sub_240B60088();
    __swift_project_value_buffer(v49, (uint64_t)qword_25435F2B8);
    v50 = sub_240B60070();
    v51 = sub_240B60334();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_240B2B000, v50, v51, "Commerce Bloom filter file is missing", v52, 2u);
      MEMORY[0x24268A954](v52, -1, -1);
    }

    sub_240B33500();
    v53 = swift_allocError();
    *v54 = 1;
    swift_willThrow();
    goto LABEL_62;
  }
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_240B600D0();
  v15 = (void *)sub_240B600D0();
  v16 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v14, v15);

  if (!v16)
  {
LABEL_35:
    if (qword_25435F0A8 != -1)
      swift_once();
    v55 = sub_240B60088();
    __swift_project_value_buffer(v55, (uint64_t)qword_25435F2B8);
    v56 = sub_240B60070();
    v57 = sub_240B60334();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_240B2B000, v56, v57, "Promotional Bloom filter file is missing", v58, 2u);
      MEMORY[0x24268A954](v58, -1, -1);
    }

    sub_240B33500();
    v53 = swift_allocError();
    *v59 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v8, v74);
    goto LABEL_62;
  }
  v17 = objc_msgSend(v16, sel_fileValue);

  if (!v17)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v18 = objc_msgSend(v17, sel_path);

  if (!v18)
    goto LABEL_35;
  v71 = v8;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v73 + 56);
  v19(v5, 0, 1, v74);
  sub_240B5A958((uint64_t)v5, 3);
  v20 = (void *)sub_240B600D0();
  v21 = (void *)sub_240B600D0();
  v22 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v20, v21);

  if (!v22)
  {
LABEL_40:
    if (qword_25435F0A8 != -1)
      swift_once();
    v60 = sub_240B60088();
    __swift_project_value_buffer(v60, (uint64_t)qword_25435F2B8);
    v61 = sub_240B60070();
    v62 = sub_240B60334();
    if (!os_log_type_enabled(v61, v62))
      goto LABEL_61;
    v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v63 = 0;
    v64 = "Social Bloom filter file is missing";
    goto LABEL_60;
  }
  v23 = objc_msgSend(v22, sel_fileValue);

  if (!v23)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v24 = objc_msgSend(v23, sel_path);

  if (!v24)
    goto LABEL_40;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v19(v5, 0, 1, v74);
  sub_240B5A958((uint64_t)v5, 4);
  v25 = (void *)sub_240B600D0();
  v26 = (void *)sub_240B600D0();
  v27 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v25, v26);

  if (!v27)
  {
LABEL_44:
    if (qword_25435F0A8 != -1)
      swift_once();
    v65 = sub_240B60088();
    __swift_project_value_buffer(v65, (uint64_t)qword_25435F2B8);
    v61 = sub_240B60070();
    v62 = sub_240B60334();
    if (!os_log_type_enabled(v61, v62))
      goto LABEL_61;
    v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v63 = 0;
    v64 = "Transaction Bloomfilter file path not found";
    goto LABEL_60;
  }
  v28 = objc_msgSend(v27, sel_fileValue);

  if (!v28)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v29 = objc_msgSend(v28, sel_path);

  if (!v29)
    goto LABEL_44;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v19(v5, 0, 1, v74);
  sub_240B5A958((uint64_t)v5, 5);
  v30 = (void *)sub_240B600D0();
  v31 = (void *)sub_240B600D0();
  v32 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v30, v31);

  if (!v32)
  {
LABEL_48:
    if (qword_25435F0A8 != -1)
      swift_once();
    v66 = sub_240B60088();
    __swift_project_value_buffer(v66, (uint64_t)qword_25435F2B8);
    v61 = sub_240B60070();
    v62 = sub_240B60334();
    if (!os_log_type_enabled(v61, v62))
      goto LABEL_61;
    v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v63 = 0;
    v64 = "News bloomfilter file path not found";
    goto LABEL_60;
  }
  v33 = objc_msgSend(v32, sel_fileValue);

  if (!v33)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v34 = objc_msgSend(v33, sel_path);

  if (!v34)
    goto LABEL_48;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v19(v5, 0, 1, v74);
  sub_240B5A958((uint64_t)v5, 6);
  v35 = (void *)sub_240B600D0();
  v36 = (void *)sub_240B600D0();
  v37 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v35, v36);

  if (!v37)
  {
LABEL_52:
    if (qword_25435F0A8 != -1)
      swift_once();
    v67 = sub_240B60088();
    __swift_project_value_buffer(v67, (uint64_t)qword_25435F2B8);
    v61 = sub_240B60070();
    v62 = sub_240B60334();
    if (!os_log_type_enabled(v61, v62))
      goto LABEL_61;
    v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v63 = 0;
    v64 = "Others bloomfilter file path not found";
    goto LABEL_60;
  }
  v38 = objc_msgSend(v37, sel_fileValue);

  if (!v38)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v39 = objc_msgSend(v38, sel_path);

  if (!v39)
    goto LABEL_52;
  sub_240B600F4();

  sub_240B5FE90();
  swift_bridgeObjectRelease();
  v19(v5, 0, 1, v74);
  sub_240B5A958((uint64_t)v5, 7);
  v40 = (void *)sub_240B600D0();
  v41 = (void *)sub_240B600D0();
  v42 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v40, v41);

  v43 = v71;
  if (v42)
  {
    v44 = objc_msgSend(v42, sel_fileValue);

    if (v44)
    {
      v45 = objc_msgSend(v44, sel_path);

      if (v45)
      {
        sub_240B600F4();

        v46 = type metadata accessor for BloomFilterData(0);
        v47 = v72;
        sub_240B5FE90();
        swift_bridgeObjectRelease();
        result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v73 + 32))(v47, v43, v74);
        *(_QWORD *)(v47 + *(int *)(v46 + 20)) = v78;
        return result;
      }
      goto LABEL_56;
    }
    goto LABEL_29;
  }
LABEL_56:
  if (qword_25435F0A8 != -1)
    swift_once();
  v68 = sub_240B60088();
  __swift_project_value_buffer(v68, (uint64_t)qword_25435F2B8);
  v61 = sub_240B60070();
  v62 = sub_240B60334();
  if (!os_log_type_enabled(v61, v62))
    goto LABEL_61;
  v63 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v63 = 0;
  v64 = "NER bloom filer file path not found";
LABEL_60:
  _os_log_impl(&dword_240B2B000, v61, v62, v64, v63, 2u);
  MEMORY[0x24268A954](v63, -1, -1);
LABEL_61:

  sub_240B33500();
  v53 = swift_allocError();
  *v69 = 1;
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v71, v74);
LABEL_62:
  v76 = 0;
  v77 = 0xE000000000000000;
  sub_240B6043C();
  sub_240B60184();
  v75 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257088760);
  sub_240B60478();
  result = sub_240B60490();
  __break(1u);
  return result;
}

void __swiftcall BlackPearlTrialLevels.getThresholds()(MCCKitCategorization::BlackPearlThreshold *__return_ptr retstr)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  Swift::Double v5;
  __int128 v6;
  __int128 v7;

  v3 = v1 + *(int *)(type metadata accessor for BlackPearlTrialLevels() + 20);
  v4 = v3 + *(int *)(type metadata accessor for BlackPearlLevels() + 32);
  v5 = *(double *)(v4 + 64);
  v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)&retstr->thresholdCommerce = *(_OWORD *)v4;
  *(_OWORD *)&retstr->thresholdEmployee = v6;
  v7 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)&retstr->thresholdP2C = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&retstr->thresholdTS = v7;
  retstr->thresholdCorpEmployee = v5;
  *(_OWORD *)&retstr->tsSenderMaxTokens = *(_OWORD *)(v4 + 72);
}

unint64_t sub_240B5D00C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  _QWORD *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0A0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (unsigned __int8 *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25435F0E8);
    v7 = (_QWORD *)sub_240B604C0();
    v8 = &v5[*(int *)(v2 + 48)];
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_240B5E8C4(v9, (uint64_t)v5, &qword_25435F0A0);
      v11 = *v5;
      result = sub_240B35E0C(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v7[6] + result) = v11;
      v15 = v7[7];
      v16 = sub_240B5FF14();
      result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v8, v16);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
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

uint64_t *initializeBufferWithCopyOfBuffer for BlackPearlTrialLevels(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  char *v53;
  char *v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  char *v58;
  char *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  int *v65;
  uint64_t *v66;
  uint64_t *v68;
  uint64_t v69;
  void (*v70)(char *, char *, uint64_t);
  char *v71;
  int *v72;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v66 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (char *)a2 + v6;
    v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    *v7 = *(uint64_t *)((char *)a2 + v6);
    v7[1] = v9;
    v10 = *(uint64_t *)((char *)a2 + v6 + 24);
    v7[2] = *(uint64_t *)((char *)a2 + v6 + 16);
    v7[3] = v10;
    v11 = (int *)type metadata accessor for BlackPearlModel(0);
    v12 = v11[6];
    v71 = (char *)v7 + v12;
    v13 = &v8[v12];
    v69 = sub_240B5FF14();
    v14 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v69 - 8) + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v70 = (void (*)(char *, char *, uint64_t))v14;
    v14(v71, v13, v69);
    v14((char *)v7 + v11[7], &v8[v11[7]], v69);
    v15 = v11[8];
    v16 = *(void **)&v8[v15];
    *(_QWORD *)((char *)v7 + v15) = v16;
    v72 = (int *)type metadata accessor for BlackPearlLevels();
    v17 = v72[5];
    v18 = (_QWORD *)((char *)v7 + v17);
    v68 = a1;
    v19 = &v8[v17];
    v20 = *(_QWORD *)&v8[v17 + 8];
    *v18 = *(_QWORD *)&v8[v17];
    v18[1] = v20;
    v21 = *(_QWORD *)&v8[v17 + 24];
    v18[2] = *(_QWORD *)&v8[v17 + 16];
    v18[3] = v21;
    v22 = v11[6];
    v23 = (char *)v18 + v22;
    v24 = &v19[v22];
    v25 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v70(v23, v24, v69);
    v70((char *)v18 + v11[7], &v19[v11[7]], v69);
    v26 = v11[8];
    v27 = *(void **)&v19[v26];
    *(_QWORD *)((char *)v18 + v26) = v27;
    v28 = v72[6];
    v29 = (_QWORD *)((char *)v7 + v28);
    v30 = &v8[v28];
    v31 = *(_QWORD *)&v8[v28 + 8];
    *v29 = *(_QWORD *)&v8[v28];
    v29[1] = v31;
    v32 = *(_QWORD *)&v8[v28 + 24];
    v29[2] = *(_QWORD *)&v8[v28 + 16];
    v29[3] = v32;
    v33 = v11[6];
    v34 = (char *)v29 + v33;
    v35 = &v30[v33];
    v36 = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v70(v34, v35, v69);
    v70((char *)v29 + v11[7], &v30[v11[7]], v69);
    v37 = v11[8];
    v38 = *(void **)&v30[v37];
    *(_QWORD *)((char *)v29 + v37) = v38;
    v39 = v72[7];
    v40 = (char *)v7 + v39;
    v41 = &v8[v39];
    v42 = *((_QWORD *)v41 + 1);
    *(_QWORD *)v40 = *(_QWORD *)v41;
    *((_QWORD *)v40 + 1) = v42;
    v43 = *((_QWORD *)v41 + 3);
    *((_QWORD *)v40 + 2) = *((_QWORD *)v41 + 2);
    *((_QWORD *)v40 + 3) = v43;
    v44 = *((_QWORD *)v41 + 5);
    *((_QWORD *)v40 + 4) = *((_QWORD *)v41 + 4);
    *((_QWORD *)v40 + 5) = v44;
    v45 = *((_QWORD *)v41 + 7);
    *((_QWORD *)v40 + 6) = *((_QWORD *)v41 + 6);
    *((_QWORD *)v40 + 7) = v45;
    v46 = *((_QWORD *)v41 + 9);
    *((_QWORD *)v40 + 8) = *((_QWORD *)v41 + 8);
    *((_QWORD *)v40 + 9) = v46;
    v47 = *((_QWORD *)v41 + 11);
    *((_QWORD *)v40 + 10) = *((_QWORD *)v41 + 10);
    *((_QWORD *)v40 + 11) = v47;
    v48 = *((_QWORD *)v41 + 13);
    *((_QWORD *)v40 + 12) = *((_QWORD *)v41 + 12);
    *((_QWORD *)v40 + 13) = v48;
    *((_OWORD *)v40 + 7) = *((_OWORD *)v41 + 7);
    v49 = *((_QWORD *)v41 + 17);
    *((_QWORD *)v40 + 16) = *((_QWORD *)v41 + 16);
    *((_QWORD *)v40 + 17) = v49;
    v50 = *((_QWORD *)v41 + 19);
    *((_QWORD *)v40 + 18) = *((_QWORD *)v41 + 18);
    *((_QWORD *)v40 + 19) = v50;
    v51 = *((_OWORD *)v41 + 10);
    *(_OWORD *)(v40 + 169) = *(_OWORD *)(v41 + 169);
    *((_OWORD *)v40 + 10) = v51;
    v52 = v72[8];
    v53 = (char *)v7 + v52;
    v54 = &v8[v52];
    v55 = *((_OWORD *)v54 + 3);
    *((_OWORD *)v53 + 2) = *((_OWORD *)v54 + 2);
    *((_OWORD *)v53 + 3) = v55;
    *((_OWORD *)v53 + 4) = *((_OWORD *)v54 + 4);
    *((_QWORD *)v53 + 10) = *((_QWORD *)v54 + 10);
    v56 = *((_OWORD *)v54 + 1);
    *(_OWORD *)v53 = *(_OWORD *)v54;
    *((_OWORD *)v53 + 1) = v56;
    v57 = v72[9];
    v58 = (char *)v7 + v57;
    v59 = &v8[v57];
    v60 = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v70(v58, v59, v69);
    v61 = type metadata accessor for BloomFilterData(0);
    *(_QWORD *)&v58[*(int *)(v61 + 20)] = *(_QWORD *)&v59[*(int *)(v61 + 20)];
    v62 = *(int *)(v61 + 24);
    v63 = &v58[v62];
    v64 = &v59[v62];
    swift_bridgeObjectRetain();
    v70(v63, v64, v69);
    v65 = v72;
    v66 = v68;
    v70((char *)v7 + v65[10], &v8[v65[10]], v69);
    v70((char *)v7 + v65[11], &v8[v65[11]], v69);
    v70((char *)v7 + v65[12], &v8[v65[12]], v69);
    v70((char *)v7 + v65[13], &v8[v65[13]], v69);
    v70((char *)v7 + v65[14], &v8[v65[14]], v69);
  }
  return v66;
}

uint64_t destroy for BlackPearlTrialLevels(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v14)(uint64_t, uint64_t);

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for BlackPearlModel(0);
  v6 = v4 + v5[6];
  v7 = sub_240B5FF14();
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v14(v6, v7);
  v14(v4 + v5[7], v7);

  v8 = (int *)type metadata accessor for BlackPearlLevels();
  v9 = v4 + v8[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14(v9 + v5[6], v7);
  v14(v9 + v5[7], v7);

  v10 = v4 + v8[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14(v10 + v5[6], v7);
  v14(v10 + v5[7], v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = v4 + v8[9];
  v14(v11, v7);
  v12 = type metadata accessor for BloomFilterData(0);
  swift_bridgeObjectRelease();
  v14(v11 + *(int *)(v12 + 24), v7);
  v14(v4 + v8[10], v7);
  v14(v4 + v8[11], v7);
  v14(v4 + v8[12], v7);
  v14(v4 + v8[13], v7);
  return ((uint64_t (*)(uint64_t, uint64_t))v14)(v4 + v8[14], v7);
}

_QWORD *initializeWithCopy for BlackPearlTrialLevels(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  id v35;
  uint64_t v36;
  void *v37;
  int *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  char *v53;
  char *v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  char *v58;
  char *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v67;
  void (*v68)(char *, char *, uint64_t);
  int *v69;

  *a1 = *a2;
  v3 = *(int *)(a3 + 20);
  v4 = (char *)a1 + v3;
  v5 = (char *)a2 + v3;
  v6 = *(_QWORD *)((char *)a2 + v3 + 8);
  *(_QWORD *)v4 = *(_QWORD *)((char *)a2 + v3);
  *((_QWORD *)v4 + 1) = v6;
  v7 = *(_QWORD *)((char *)a2 + v3 + 24);
  *((_QWORD *)v4 + 2) = *(_QWORD *)((char *)a2 + v3 + 16);
  *((_QWORD *)v4 + 3) = v7;
  v8 = (int *)type metadata accessor for BlackPearlModel(0);
  v9 = v8[6];
  v10 = &v4[v9];
  v11 = &v5[v9];
  v12 = sub_240B5FF14();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v67 = v12;
  v68 = v13;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v13(&v4[v8[7]], &v5[v8[7]], v12);
  v14 = v8[8];
  v15 = *(void **)&v5[v14];
  *(_QWORD *)&v4[v14] = v15;
  v69 = (int *)type metadata accessor for BlackPearlLevels();
  v16 = v69[5];
  v17 = &v4[v16];
  v18 = &v5[v16];
  v19 = *(_QWORD *)&v5[v16 + 8];
  *(_QWORD *)v17 = *(_QWORD *)&v5[v16];
  *((_QWORD *)v17 + 1) = v19;
  v20 = *(_QWORD *)&v5[v16 + 24];
  *((_QWORD *)v17 + 2) = *(_QWORD *)&v5[v16 + 16];
  *((_QWORD *)v17 + 3) = v20;
  v21 = v8[6];
  v22 = &v17[v21];
  v23 = &v18[v21];
  v24 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v68(v22, v23, v67);
  v68(&v17[v8[7]], &v18[v8[7]], v67);
  v25 = v8[8];
  v26 = *(void **)&v18[v25];
  *(_QWORD *)&v17[v25] = v26;
  v27 = v69[6];
  v28 = &v4[v27];
  v29 = &v5[v27];
  v30 = *(_QWORD *)&v5[v27 + 8];
  *(_QWORD *)v28 = *(_QWORD *)&v5[v27];
  *((_QWORD *)v28 + 1) = v30;
  v31 = *(_QWORD *)&v5[v27 + 24];
  *((_QWORD *)v28 + 2) = *(_QWORD *)&v5[v27 + 16];
  *((_QWORD *)v28 + 3) = v31;
  v32 = v8[6];
  v33 = &v28[v32];
  v34 = &v29[v32];
  v35 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v68(v33, v34, v67);
  v68(&v28[v8[7]], &v29[v8[7]], v67);
  v36 = v8[8];
  v37 = *(void **)&v29[v36];
  *(_QWORD *)&v28[v36] = v37;
  v38 = v69;
  v39 = v69[7];
  v40 = &v4[v39];
  v41 = &v5[v39];
  v42 = *((_QWORD *)v41 + 1);
  *(_QWORD *)v40 = *(_QWORD *)v41;
  *((_QWORD *)v40 + 1) = v42;
  v43 = *((_QWORD *)v41 + 3);
  *((_QWORD *)v40 + 2) = *((_QWORD *)v41 + 2);
  *((_QWORD *)v40 + 3) = v43;
  v44 = *((_QWORD *)v41 + 5);
  *((_QWORD *)v40 + 4) = *((_QWORD *)v41 + 4);
  *((_QWORD *)v40 + 5) = v44;
  v45 = *((_QWORD *)v41 + 7);
  *((_QWORD *)v40 + 6) = *((_QWORD *)v41 + 6);
  *((_QWORD *)v40 + 7) = v45;
  v46 = *((_QWORD *)v41 + 9);
  *((_QWORD *)v40 + 8) = *((_QWORD *)v41 + 8);
  *((_QWORD *)v40 + 9) = v46;
  v47 = *((_QWORD *)v41 + 11);
  *((_QWORD *)v40 + 10) = *((_QWORD *)v41 + 10);
  *((_QWORD *)v40 + 11) = v47;
  v48 = *((_QWORD *)v41 + 13);
  *((_QWORD *)v40 + 12) = *((_QWORD *)v41 + 12);
  *((_QWORD *)v40 + 13) = v48;
  *((_OWORD *)v40 + 7) = *((_OWORD *)v41 + 7);
  v49 = *((_QWORD *)v41 + 17);
  *((_QWORD *)v40 + 16) = *((_QWORD *)v41 + 16);
  *((_QWORD *)v40 + 17) = v49;
  v50 = *((_QWORD *)v41 + 19);
  *((_QWORD *)v40 + 18) = *((_QWORD *)v41 + 18);
  *((_QWORD *)v40 + 19) = v50;
  v51 = *((_OWORD *)v41 + 10);
  *(_OWORD *)(v40 + 169) = *(_OWORD *)(v41 + 169);
  *((_OWORD *)v40 + 10) = v51;
  v52 = v69[8];
  v53 = &v4[v52];
  v54 = &v5[v52];
  v55 = *((_OWORD *)v54 + 3);
  *((_OWORD *)v53 + 2) = *((_OWORD *)v54 + 2);
  *((_OWORD *)v53 + 3) = v55;
  *((_OWORD *)v53 + 4) = *((_OWORD *)v54 + 4);
  *((_QWORD *)v53 + 10) = *((_QWORD *)v54 + 10);
  v56 = *((_OWORD *)v54 + 1);
  *(_OWORD *)v53 = *(_OWORD *)v54;
  *((_OWORD *)v53 + 1) = v56;
  v57 = v69[9];
  v58 = &v4[v57];
  v59 = &v5[v57];
  v60 = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v68(v58, v59, v67);
  v61 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v58[*(int *)(v61 + 20)] = *(_QWORD *)&v59[*(int *)(v61 + 20)];
  v62 = *(int *)(v61 + 24);
  v63 = &v58[v62];
  v64 = &v59[v62];
  swift_bridgeObjectRetain();
  v68(v63, v64, v67);
  v68(&v4[v38[10]], &v5[v38[10]], v67);
  v68(&v4[v38[11]], &v5[v38[11]], v67);
  v68(&v4[v38[12]], &v5[v38[12]], v67);
  v68(&v4[v38[13]], &v5[v38[13]], v67);
  v68(&v4[v38[14]], &v5[v38[14]], v67);
  return a1;
}

_QWORD *assignWithCopy for BlackPearlTrialLevels(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  int *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  char *v35;
  char *v36;
  __int128 v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)v7 = *(_QWORD *)((char *)a2 + v6);
  *((_QWORD *)v7 + 1) = *(_QWORD *)((char *)a2 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
  *((_QWORD *)v7 + 3) = *((_QWORD *)v8 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = (int *)type metadata accessor for BlackPearlModel(0);
  v10 = v9[6];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_240B5FF14();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v14(&v7[v9[7]], &v8[v9[7]], v13);
  v15 = v9[8];
  v16 = *(void **)&v7[v15];
  v17 = *(void **)&v8[v15];
  *(_QWORD *)&v7[v15] = v17;
  v18 = v17;

  v19 = (int *)type metadata accessor for BlackPearlLevels();
  v20 = v19[5];
  v21 = &v7[v20];
  v22 = &v8[v20];
  *(_QWORD *)v21 = *(_QWORD *)&v8[v20];
  *((_QWORD *)v21 + 1) = *(_QWORD *)&v8[v20 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
  *((_QWORD *)v21 + 3) = *((_QWORD *)v22 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14(&v21[v9[6]], &v22[v9[6]], v13);
  v14(&v21[v9[7]], &v22[v9[7]], v13);
  v23 = v9[8];
  v24 = *(void **)&v21[v23];
  v25 = *(void **)&v22[v23];
  *(_QWORD *)&v21[v23] = v25;
  v26 = v25;

  v27 = v19[6];
  v28 = &v7[v27];
  v29 = &v8[v27];
  *(_QWORD *)v28 = *(_QWORD *)&v8[v27];
  *((_QWORD *)v28 + 1) = *(_QWORD *)&v8[v27 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v28 + 2) = *((_QWORD *)v29 + 2);
  *((_QWORD *)v28 + 3) = *((_QWORD *)v29 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14(&v28[v9[6]], &v29[v9[6]], v13);
  v14(&v28[v9[7]], &v29[v9[7]], v13);
  v30 = v9[8];
  v31 = *(void **)&v28[v30];
  v32 = *(void **)&v29[v30];
  *(_QWORD *)&v28[v30] = v32;
  v33 = v32;

  v34 = v19[7];
  v35 = &v7[v34];
  v36 = &v8[v34];
  *(_QWORD *)v35 = *(_QWORD *)&v8[v34];
  *((_QWORD *)v35 + 1) = *(_QWORD *)&v8[v34 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 2) = *((_QWORD *)v36 + 2);
  *((_QWORD *)v35 + 3) = *((_QWORD *)v36 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 4) = *((_QWORD *)v36 + 4);
  *((_QWORD *)v35 + 5) = *((_QWORD *)v36 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 6) = *((_QWORD *)v36 + 6);
  *((_QWORD *)v35 + 7) = *((_QWORD *)v36 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 8) = *((_QWORD *)v36 + 8);
  *((_QWORD *)v35 + 9) = *((_QWORD *)v36 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 10) = *((_QWORD *)v36 + 10);
  *((_QWORD *)v35 + 11) = *((_QWORD *)v36 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 12) = *((_QWORD *)v36 + 12);
  *((_QWORD *)v35 + 13) = *((_QWORD *)v36 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 14) = *((_QWORD *)v36 + 14);
  *((_QWORD *)v35 + 15) = *((_QWORD *)v36 + 15);
  *((_QWORD *)v35 + 16) = *((_QWORD *)v36 + 16);
  *((_QWORD *)v35 + 17) = *((_QWORD *)v36 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v35 + 18) = *((_QWORD *)v36 + 18);
  *((_QWORD *)v35 + 19) = *((_QWORD *)v36 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = *((_OWORD *)v36 + 10);
  *(_OWORD *)(v35 + 169) = *(_OWORD *)(v36 + 169);
  *((_OWORD *)v35 + 10) = v37;
  v38 = v19[8];
  v39 = &v7[v38];
  v40 = &v8[v38];
  *(_QWORD *)v39 = *(_QWORD *)v40;
  *((_QWORD *)v39 + 1) = *((_QWORD *)v40 + 1);
  *((_QWORD *)v39 + 2) = *((_QWORD *)v40 + 2);
  *((_QWORD *)v39 + 3) = *((_QWORD *)v40 + 3);
  *((_QWORD *)v39 + 4) = *((_QWORD *)v40 + 4);
  *((_QWORD *)v39 + 5) = *((_QWORD *)v40 + 5);
  *((_QWORD *)v39 + 6) = *((_QWORD *)v40 + 6);
  *((_QWORD *)v39 + 7) = *((_QWORD *)v40 + 7);
  *((_QWORD *)v39 + 8) = *((_QWORD *)v40 + 8);
  *((_QWORD *)v39 + 9) = *((_QWORD *)v40 + 9);
  *((_QWORD *)v39 + 10) = *((_QWORD *)v40 + 10);
  v41 = v19[9];
  v42 = &v7[v41];
  v43 = &v8[v41];
  v14(&v7[v41], &v8[v41], v13);
  v44 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v42[*(int *)(v44 + 20)] = *(_QWORD *)&v43[*(int *)(v44 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14(&v42[*(int *)(v44 + 24)], &v43[*(int *)(v44 + 24)], v13);
  v14(&v7[v19[10]], &v8[v19[10]], v13);
  v14(&v7[v19[11]], &v8[v19[11]], v13);
  v14(&v7[v19[12]], &v8[v19[12]], v13);
  v14(&v7[v19[13]], &v8[v19[13]], v13);
  v14(&v7[v19[14]], &v8[v19[14]], v13);
  return a1;
}

_QWORD *initializeWithTake for BlackPearlTrialLevels(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = *(_OWORD *)((char *)a2 + v4 + 16);
  *(_OWORD *)v5 = *(_OWORD *)((char *)a2 + v4);
  *((_OWORD *)v5 + 1) = v7;
  v8 = (int *)type metadata accessor for BlackPearlModel(0);
  v9 = v8[6];
  v10 = &v5[v9];
  v11 = &v6[v9];
  v12 = sub_240B5FF14();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  v13(&v5[v8[7]], &v6[v8[7]], v12);
  *(_QWORD *)&v5[v8[8]] = *(_QWORD *)&v6[v8[8]];
  v14 = (int *)type metadata accessor for BlackPearlLevels();
  v15 = v14[5];
  v16 = &v5[v15];
  v17 = &v6[v15];
  v18 = *(_OWORD *)&v6[v15 + 16];
  *(_OWORD *)v16 = *(_OWORD *)&v6[v15];
  *((_OWORD *)v16 + 1) = v18;
  v13(&v5[v15 + v8[6]], &v6[v15 + v8[6]], v12);
  v13(&v16[v8[7]], &v17[v8[7]], v12);
  *(_QWORD *)&v16[v8[8]] = *(_QWORD *)&v17[v8[8]];
  v19 = v14[6];
  v20 = &v5[v19];
  v21 = &v6[v19];
  v22 = *(_OWORD *)&v6[v19 + 16];
  *(_OWORD *)v20 = *(_OWORD *)&v6[v19];
  *((_OWORD *)v20 + 1) = v22;
  v13(&v5[v19 + v8[6]], &v6[v19 + v8[6]], v12);
  v13(&v20[v8[7]], &v21[v8[7]], v12);
  *(_QWORD *)&v20[v8[8]] = *(_QWORD *)&v21[v8[8]];
  v23 = v14[7];
  v24 = &v5[v23];
  v25 = &v6[v23];
  v26 = *((_OWORD *)v25 + 1);
  *(_OWORD *)v24 = *(_OWORD *)v25;
  *((_OWORD *)v24 + 1) = v26;
  v27 = *((_OWORD *)v25 + 3);
  *((_OWORD *)v24 + 2) = *((_OWORD *)v25 + 2);
  *((_OWORD *)v24 + 3) = v27;
  v28 = *((_OWORD *)v25 + 7);
  *((_OWORD *)v24 + 6) = *((_OWORD *)v25 + 6);
  *((_OWORD *)v24 + 7) = v28;
  v29 = *((_OWORD *)v25 + 5);
  *((_OWORD *)v24 + 4) = *((_OWORD *)v25 + 4);
  *((_OWORD *)v24 + 5) = v29;
  *(_OWORD *)(v24 + 169) = *(_OWORD *)(v25 + 169);
  v30 = *((_OWORD *)v25 + 10);
  v31 = *((_OWORD *)v25 + 8);
  *((_OWORD *)v24 + 9) = *((_OWORD *)v25 + 9);
  *((_OWORD *)v24 + 10) = v30;
  *((_OWORD *)v24 + 8) = v31;
  v32 = v14[8];
  v33 = &v5[v32];
  v34 = &v6[v32];
  v35 = *((_OWORD *)v34 + 3);
  *((_OWORD *)v33 + 2) = *((_OWORD *)v34 + 2);
  *((_OWORD *)v33 + 3) = v35;
  *((_OWORD *)v33 + 4) = *((_OWORD *)v34 + 4);
  *((_QWORD *)v33 + 10) = *((_QWORD *)v34 + 10);
  v36 = *((_OWORD *)v34 + 1);
  *(_OWORD *)v33 = *(_OWORD *)v34;
  *((_OWORD *)v33 + 1) = v36;
  v37 = v14[9];
  v38 = &v5[v37];
  v39 = &v6[v37];
  v13(&v5[v37], &v6[v37], v12);
  v40 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v38[*(int *)(v40 + 20)] = *(_QWORD *)&v39[*(int *)(v40 + 20)];
  v13(&v38[*(int *)(v40 + 24)], &v39[*(int *)(v40 + 24)], v12);
  v13(&v5[v14[10]], &v6[v14[10]], v12);
  v13(&v5[v14[11]], &v6[v14[11]], v12);
  v13(&v5[v14[12]], &v6[v14[12]], v12);
  v13(&v5[v14[13]], &v6[v14[13]], v12);
  v13(&v5[v14[14]], &v6[v14[14]], v12);
  return a1;
}

_QWORD *assignWithTake for BlackPearlTrialLevels(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  void *v18;
  int *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char *v35;
  char *v36;
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
  char *v47;
  char *v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  *(_QWORD *)v7 = *(_QWORD *)((char *)a2 + v6);
  *((_QWORD *)v7 + 1) = v9;
  swift_bridgeObjectRelease();
  v10 = *((_QWORD *)v8 + 3);
  *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
  *((_QWORD *)v7 + 3) = v10;
  swift_bridgeObjectRelease();
  v11 = (int *)type metadata accessor for BlackPearlModel(0);
  v12 = v11[6];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = sub_240B5FF14();
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16(&v7[v11[7]], &v8[v11[7]], v15);
  v17 = v11[8];
  v18 = *(void **)&v7[v17];
  *(_QWORD *)&v7[v17] = *(_QWORD *)&v8[v17];

  v19 = (int *)type metadata accessor for BlackPearlLevels();
  v20 = v19[5];
  v21 = &v7[v20];
  v22 = &v8[v20];
  v23 = *(_QWORD *)&v8[v20 + 8];
  *(_QWORD *)v21 = *(_QWORD *)&v8[v20];
  *((_QWORD *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  v24 = *((_QWORD *)v22 + 3);
  *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
  *((_QWORD *)v21 + 3) = v24;
  swift_bridgeObjectRelease();
  v16(&v21[v11[6]], &v22[v11[6]], v15);
  v16(&v21[v11[7]], &v22[v11[7]], v15);
  v25 = v11[8];
  v26 = *(void **)&v21[v25];
  *(_QWORD *)&v21[v25] = *(_QWORD *)&v22[v25];

  v27 = v19[6];
  v28 = &v7[v27];
  v29 = &v8[v27];
  v30 = *(_QWORD *)&v8[v27 + 8];
  *(_QWORD *)v28 = *(_QWORD *)&v8[v27];
  *((_QWORD *)v28 + 1) = v30;
  swift_bridgeObjectRelease();
  v31 = *((_QWORD *)v29 + 3);
  *((_QWORD *)v28 + 2) = *((_QWORD *)v29 + 2);
  *((_QWORD *)v28 + 3) = v31;
  swift_bridgeObjectRelease();
  v16(&v28[v11[6]], &v29[v11[6]], v15);
  v16(&v28[v11[7]], &v29[v11[7]], v15);
  v32 = v11[8];
  v33 = *(void **)&v28[v32];
  *(_QWORD *)&v28[v32] = *(_QWORD *)&v29[v32];

  v34 = v19[7];
  v35 = &v7[v34];
  v36 = &v8[v34];
  v37 = *(_QWORD *)&v8[v34 + 8];
  *(_QWORD *)v35 = *(_QWORD *)&v8[v34];
  *((_QWORD *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  v38 = *((_QWORD *)v36 + 3);
  *((_QWORD *)v35 + 2) = *((_QWORD *)v36 + 2);
  *((_QWORD *)v35 + 3) = v38;
  swift_bridgeObjectRelease();
  v39 = *((_QWORD *)v36 + 5);
  *((_QWORD *)v35 + 4) = *((_QWORD *)v36 + 4);
  *((_QWORD *)v35 + 5) = v39;
  swift_bridgeObjectRelease();
  v40 = *((_QWORD *)v36 + 7);
  *((_QWORD *)v35 + 6) = *((_QWORD *)v36 + 6);
  *((_QWORD *)v35 + 7) = v40;
  swift_bridgeObjectRelease();
  v41 = *((_QWORD *)v36 + 9);
  *((_QWORD *)v35 + 8) = *((_QWORD *)v36 + 8);
  *((_QWORD *)v35 + 9) = v41;
  swift_bridgeObjectRelease();
  v42 = *((_QWORD *)v36 + 11);
  *((_QWORD *)v35 + 10) = *((_QWORD *)v36 + 10);
  *((_QWORD *)v35 + 11) = v42;
  swift_bridgeObjectRelease();
  v43 = *((_QWORD *)v36 + 13);
  *((_QWORD *)v35 + 12) = *((_QWORD *)v36 + 12);
  *((_QWORD *)v35 + 13) = v43;
  swift_bridgeObjectRelease();
  *((_OWORD *)v35 + 7) = *((_OWORD *)v36 + 7);
  v44 = *((_QWORD *)v36 + 17);
  *((_QWORD *)v35 + 16) = *((_QWORD *)v36 + 16);
  *((_QWORD *)v35 + 17) = v44;
  swift_bridgeObjectRelease();
  v45 = *((_QWORD *)v36 + 19);
  *((_QWORD *)v35 + 18) = *((_QWORD *)v36 + 18);
  *((_QWORD *)v35 + 19) = v45;
  swift_bridgeObjectRelease();
  *((_OWORD *)v35 + 10) = *((_OWORD *)v36 + 10);
  *(_OWORD *)(v35 + 169) = *(_OWORD *)(v36 + 169);
  v46 = v19[8];
  v47 = &v7[v46];
  v48 = &v8[v46];
  v49 = *((_OWORD *)v48 + 1);
  *(_OWORD *)v47 = *(_OWORD *)v48;
  *((_OWORD *)v47 + 1) = v49;
  v50 = *((_OWORD *)v48 + 3);
  *((_OWORD *)v47 + 2) = *((_OWORD *)v48 + 2);
  *((_OWORD *)v47 + 3) = v50;
  *((_QWORD *)v47 + 8) = *((_QWORD *)v48 + 8);
  *(_OWORD *)(v47 + 72) = *(_OWORD *)(v48 + 72);
  v51 = v19[9];
  v52 = &v7[v51];
  v53 = &v8[v51];
  v16(&v7[v51], &v8[v51], v15);
  v54 = type metadata accessor for BloomFilterData(0);
  *(_QWORD *)&v52[*(int *)(v54 + 20)] = *(_QWORD *)&v53[*(int *)(v54 + 20)];
  swift_bridgeObjectRelease();
  v16(&v52[*(int *)(v54 + 24)], &v53[*(int *)(v54 + 24)], v15);
  v16(&v7[v19[10]], &v8[v19[10]], v15);
  v16(&v7[v19[11]], &v8[v19[11]], v15);
  v16(&v7[v19[12]], &v8[v19[12]], v15);
  v16(&v7[v19[13]], &v8[v19[13]], v15);
  v16(&v7[v19[14]], &v8[v19[14]], v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlTrialLevels()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_240B5E588(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for BlackPearlLevels();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for BlackPearlTrialLevels()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_240B5E610(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for BlackPearlLevels();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_240B5E684()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_240B5E6FC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2570887B8);
    v3 = (_QWORD *)sub_240B604C0();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_240B35ECC(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(_QWORD *)(v3[6] + v9) = v5;
      *(_QWORD *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
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

unint64_t sub_240B5E7D0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  unint64_t result;
  char v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void **v13;
  void *v14;
  id v15;
  char v16;
  id v17;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2570887B0);
  v3 = (_QWORD *)sub_240B604C0();
  v4 = a1[4];
  v5 = (void *)a1[5];
  result = sub_240B35ECC(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    v17 = v5;
    return (unint64_t)v3;
  }
  v8 = (void **)(a1 + 7);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v4;
    *(_QWORD *)(v3[7] + v9) = v5;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v4 = (uint64_t)*(v8 - 1);
    v14 = *v8;
    v15 = v5;
    result = sub_240B35ECC(v4);
    v8 = v13;
    v5 = v14;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_240B5E8C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t CategoryTS.rawValue.getter()
{
  char *v0;

  return qword_240B626B0[*v0];
}

MCCKitCategorization::CategoryTS_optional __swiftcall CategoryTS.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;

  if ((unint64_t)(rawValue + 2) > 9)
    *v1 = 9;
  else
    *v1 = byte_240B626A6[rawValue + 2];
  return (MCCKitCategorization::CategoryTS_optional)rawValue;
}

void static CategoryTS.getCategory(for:)(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v3 = sub_240B60124();
  v4 = v2;
  if (v3 == 0x5241444E454C4143 && v2 == 0xE800000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 2;
  }
  else if (v3 == 5130566 && v4 == 0xE300000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 3;
  }
  else if (v3 == 0x59545245504F5250 && v4 == 0xE800000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 4;
  }
  else if (v3 == 0x4E49474F4CLL && v4 == 0xE500000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 5;
  }
  else if (v3 == 0x5354544F4ELL && v4 == 0xE500000000000000 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 6;
  }
  else if (v3 == 0x544F4E524548544FLL && v4 == 0xEA00000000005354 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 7;
  }
  else if (v3 == 0x544341534E415254 && v4 == 0xEC000000534E4F49 || (sub_240B605A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 8;
  }
  else
  {
    if ((v3 != 0xD000000000000014 || v4 != 0x8000000240B63CB0) && (sub_240B605A4() & 1) == 0)
    {
      if (v3 == 0x524F525245 && v4 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v6 = sub_240B605A4();
        swift_bridgeObjectRelease();
        if ((v6 & 1) == 0)
        {
          if (qword_25435F0A8 != -1)
            swift_once();
          v7 = sub_240B60088();
          __swift_project_value_buffer(v7, (uint64_t)qword_25435F2B8);
          swift_bridgeObjectRetain_n();
          v8 = sub_240B60070();
          v9 = sub_240B60334();
          if (os_log_type_enabled(v8, v9))
          {
            v10 = (uint8_t *)swift_slowAlloc();
            v11 = swift_slowAlloc();
            v14 = v11;
            *(_DWORD *)v10 = 136315138;
            v12 = sub_240B60124();
            sub_240B335B4(v12, v13, &v14);
            sub_240B603AC();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_240B2B000, v8, v9, "Invalid category key: %s", v10, 0xCu);
            v5 = 1;
            swift_arrayDestroy();
            MEMORY[0x24268A954](v11, -1, -1);
            MEMORY[0x24268A954](v10, -1, -1);

            goto LABEL_5;
          }

          swift_bridgeObjectRelease_n();
        }
      }
      v5 = 1;
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    v5 = 0;
  }
LABEL_5:
  *a1 = v5;
}

uint64_t static CategoryTS.getCategoryText(for:)(unsigned __int8 *a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_240B5EEB8 + 4 * byte_240B62570[*a1]))(0x5241444E454C4143, 0xE800000000000000);
}

unint64_t sub_240B5EEB8()
{
  return 0xD000000000000014;
}

uint64_t sub_240B5EED4()
{
  return 0x524F525245;
}

uint64_t sub_240B5EEE8()
{
  return 5130566;
}

uint64_t sub_240B5EEF8()
{
  return 0x59545245504F5250;
}

uint64_t sub_240B5EF0C()
{
  return 0x4E49474F4CLL;
}

uint64_t sub_240B5EF20()
{
  return 0x5354544F4ELL;
}

uint64_t sub_240B5EF34()
{
  return 0x544F4E524548544FLL;
}

uint64_t sub_240B5EF50()
{
  return 0x544341534E415254;
}

void *static CategoryTS.allCases.getter()
{
  return &unk_251109070;
}

BOOL sub_240B5EF7C(char *a1, char *a2)
{
  return qword_240B626B0[*a1] == qword_240B626B0[*a2];
}

uint64_t sub_240B5EFA0()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

uint64_t sub_240B5EFEC()
{
  return sub_240B60634();
}

uint64_t sub_240B5F020()
{
  sub_240B60628();
  sub_240B60634();
  return sub_240B60640();
}

MCCKitCategorization::CategoryTS_optional sub_240B5F068(Swift::Int *a1)
{
  return CategoryTS.init(rawValue:)(*a1);
}

void sub_240B5F070(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_240B626B0[*v1];
}

void sub_240B5F088(_QWORD *a1@<X8>)
{
  *a1 = &unk_251109070;
}

unint64_t sub_240B5F09C()
{
  unint64_t result;

  result = qword_257088C58;
  if (!qword_257088C58)
  {
    result = MEMORY[0x24268A8B8](&protocol conformance descriptor for CategoryTS, &type metadata for CategoryTS);
    atomic_store(result, (unint64_t *)&qword_257088C58);
  }
  return result;
}

unint64_t sub_240B5F0E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257088C60;
  if (!qword_257088C60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257088C68);
    result = MEMORY[0x24268A8B8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257088C60);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CategoryTS(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_240B5F17C + 4 * byte_240B6257E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_240B5F1B0 + 4 * byte_240B62579[v4]))();
}

uint64_t sub_240B5F1B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B5F1B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x240B5F1C0);
  return result;
}

uint64_t sub_240B5F1CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x240B5F1D4);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_240B5F1D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_240B5F1E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CategoryTS()
{
  return &type metadata for CategoryTS;
}

_QWORD *ModelProxy.__allocating_init(modelLocation:)(uint64_t a1, unint64_t a2)
{
  _QWORD *v4;
  id v5;

  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0x636C65646F6D6C6DLL;
  v4[3] = 0xE800000000000000;
  v4[4] = 0x6C65646F6D6C6DLL;
  v4[5] = 0xE700000000000000;
  v4[6] = a1;
  v4[7] = a2;
  swift_bridgeObjectRetain();
  v5 = sub_240B5F518(a1, a2);
  swift_bridgeObjectRelease();
  v4[8] = v5;
  return v4;
}

_QWORD *ModelProxy.init(modelLocation:)(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;

  v2[2] = 0x636C65646F6D6C6DLL;
  v2[3] = 0xE800000000000000;
  v2[4] = 0x6C65646F6D6C6DLL;
  v2[5] = 0xE700000000000000;
  v2[6] = a1;
  v2[7] = a2;
  swift_bridgeObjectRetain();
  v2[8] = sub_240B5F518(a1, a2);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_240B5F314(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_240B5F340()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  id v3;
  void *v4;

  v1 = v0[6];
  v2 = v0[7];
  swift_bridgeObjectRetain();
  v3 = sub_240B5F518(v1, v2);
  swift_bridgeObjectRelease();
  v4 = (void *)v0[8];
  v0[8] = v3;

}

id sub_240B5F38C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = (void *)sub_240B5FEA8();
  v11[0] = 0;
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_error_, v2, v11);

  v4 = v11[0];
  if (v3)
  {
    v5 = sub_240B5FF14();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7 = v4;
    v6(a1, v5);
  }
  else
  {
    v8 = v11[0];
    sub_240B5FE3C();

    swift_willThrow();
    v9 = sub_240B5FF14();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

id sub_240B5F4A0()
{
  uint64_t v0;

  return *(id *)(v0 + 64);
}

uint64_t ModelProxy.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ModelProxy.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

id sub_240B5F518(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t ObjCClassFromMetadata;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void (*v44)(char *, uint64_t);
  id v45;
  id v46;
  char *v47;
  uint64_t v48;
  void *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  id v55;
  unint64_t v56;
  uint64_t v57;
  id v58;
  unint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435F000);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_240B5FF14();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v52 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v53 = (char *)&v52 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v52 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v52 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v52 - v19;
  type metadata accessor for MCCNLP();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v22 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v54 = a1;
  v56 = a2;
  v23 = (void *)sub_240B600D0();
  v24 = (void *)sub_240B600D0();
  v55 = v22;
  v25 = objc_msgSend(v22, sel_URLForResource_withExtension_, v23, v24);

  if (!v25)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
LABEL_9:
    sub_240B42160((uint64_t)v6);
    if (qword_25435F0A8 != -1)
      swift_once();
    v33 = sub_240B60088();
    __swift_project_value_buffer(v33, (uint64_t)qword_25435F2B8);
    swift_bridgeObjectRetain_n();
    v34 = sub_240B60070();
    v35 = sub_240B60328();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (void *)swift_slowAlloc();
      v58 = v37;
      *(_DWORD *)v36 = 136315138;
      swift_bridgeObjectRetain();
      v38 = v54;
      v57 = sub_240B335B4(v54, v56, (uint64_t *)&v58);
      sub_240B603AC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_240B2B000, v34, v35, "Compiled model not found. Finding %s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24268A954](v37, -1, -1);
      MEMORY[0x24268A954](v36, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      v38 = v54;
    }
    v39 = (void *)sub_240B600D0();
    v40 = (void *)sub_240B600D0();
    v32 = v55;
    v41 = objc_msgSend(v55, sel_pathForResource_ofType_, v39, v40);

    if (v41)
    {
      sub_240B600F4();

      v42 = (void *)objc_opt_self();
      sub_240B5FE90();
      swift_bridgeObjectRelease();
      v43 = (void *)sub_240B5FEA8();
      v44 = *(void (**)(char *, uint64_t))(v8 + 8);
      v44(v18, v7);
      v58 = 0;
      v45 = objc_msgSend(v42, sel_compileModelAtURL_error_, v43, &v58);

      v46 = v58;
      if (v45)
      {
        v47 = v53;
        sub_240B5FED8();

        sub_240B349F0();
        v48 = (uint64_t)v52;
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v52, v47, v7);
        v31 = sub_240B5F38C(v48);
        v44(v47, v7);
        goto LABEL_17;
      }
      v50 = v46;
      v51 = sub_240B5FE3C();

      v38 = v51;
      swift_willThrow();
      v58 = 0;
      v59 = 0xE000000000000000;
      sub_240B6043C();
      sub_240B60184();
      sub_240B60184();
      sub_240B60184();
      v57 = v51;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088760);
      sub_240B60478();
    }
    else
    {
      v58 = 0;
      v59 = 0xE000000000000000;
      sub_240B6043C();
      swift_bridgeObjectRelease();
      v58 = (id)0xD00000000000001ELL;
      v59 = 0x8000000240B64420;
      sub_240B60184();
    }
    while (1)
    {
      sub_240B60490();
      __break(1u);
      v58 = 0;
      v59 = 0xE000000000000000;
      sub_240B6043C();
      sub_240B60184();
      sub_240B60184();
      sub_240B60184();
      v57 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257088760);
      sub_240B60478();
    }
  }
  sub_240B5FED8();

  v26 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v26(v6, v18, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    goto LABEL_9;
  v26(v20, v6, v7);
  if (qword_25435F0A8 != -1)
    swift_once();
  v27 = sub_240B60088();
  __swift_project_value_buffer(v27, (uint64_t)qword_25435F2B8);
  v28 = sub_240B60070();
  v29 = sub_240B60328();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_240B2B000, v28, v29, "Model already compiled", v30, 2u);
    MEMORY[0x24268A954](v30, -1, -1);
  }

  sub_240B349F0();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v15, v20, v7);
  v31 = sub_240B5F38C((uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v20, v7);
  v32 = v55;
LABEL_17:

  return v31;
}

uint64_t type metadata accessor for ModelProxy()
{
  return objc_opt_self();
}

uint64_t method lookup function for ModelProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ModelProxy.__allocating_init(modelLocation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ModelProxy.setModelLocation(modelLocation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ModelProxy.compileModel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ModelProxy.getModel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_240B5FD88()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_240B5FD94()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_240B5FDA0()
{
  return MEMORY[0x24BDCB6B0]();
}

uint64_t sub_240B5FDAC()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_240B5FDB8()
{
  return MEMORY[0x24BDCB6D8]();
}

uint64_t sub_240B5FDC4()
{
  return MEMORY[0x24BDCB730]();
}

uint64_t sub_240B5FDD0()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_240B5FDDC()
{
  return MEMORY[0x24BDCBBF8]();
}

uint64_t sub_240B5FDE8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_240B5FDF4()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_240B5FE00()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_240B5FE0C()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_240B5FE18()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_240B5FE24()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t sub_240B5FE30()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_240B5FE3C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_240B5FE48()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_240B5FE54()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_240B5FE60()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_240B5FE6C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_240B5FE78()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_240B5FE84()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_240B5FE90()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_240B5FE9C()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_240B5FEA8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_240B5FEB4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_240B5FEC0()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_240B5FECC()
{
  return MEMORY[0x24BDCD958]();
}

uint64_t sub_240B5FED8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_240B5FEE4()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_240B5FEF0()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_240B5FEFC()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_240B5FF08()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_240B5FF14()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_240B5FF20()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_240B5FF2C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_240B5FF38()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_240B5FF44()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_240B5FF50()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_240B5FF5C()
{
  return MEMORY[0x24BDCDD68]();
}

uint64_t sub_240B5FF68()
{
  return MEMORY[0x24BDCDDA8]();
}

uint64_t sub_240B5FF74()
{
  return MEMORY[0x24BDCDE70]();
}

uint64_t sub_240B5FF80()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_240B5FF8C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_240B5FF98()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_240B5FFA4()
{
  return MEMORY[0x24BDF5CA8]();
}

uint64_t sub_240B5FFB0()
{
  return MEMORY[0x24BDF5CD8]();
}

uint64_t sub_240B5FFBC()
{
  return MEMORY[0x24BDF5CF0]();
}

uint64_t sub_240B5FFC8()
{
  return MEMORY[0x24BDF5D00]();
}

uint64_t sub_240B5FFD4()
{
  return MEMORY[0x24BDF5D10]();
}

uint64_t sub_240B5FFE0()
{
  return MEMORY[0x24BDF5D30]();
}

uint64_t sub_240B5FFEC()
{
  return MEMORY[0x24BDF5D38]();
}

uint64_t sub_240B5FFF8()
{
  return MEMORY[0x24BDF5DD0]();
}

uint64_t sub_240B60004()
{
  return MEMORY[0x24BDF5DF0]();
}

uint64_t sub_240B60010()
{
  return MEMORY[0x24BDF5E10]();
}

uint64_t sub_240B6001C()
{
  return MEMORY[0x24BDF5E88]();
}

uint64_t sub_240B60028()
{
  return MEMORY[0x24BDF5E90]();
}

uint64_t sub_240B60034()
{
  return MEMORY[0x24BDF5EC8]();
}

uint64_t sub_240B60040()
{
  return MEMORY[0x24BDF5F00]();
}

uint64_t sub_240B6004C()
{
  return MEMORY[0x24BDF5F40]();
}

uint64_t sub_240B60058()
{
  return MEMORY[0x24BDF5FA8]();
}

uint64_t sub_240B60064()
{
  return MEMORY[0x24BDF5FC8]();
}

uint64_t sub_240B60070()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_240B6007C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_240B60088()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_240B60094()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_240B600A0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_240B600AC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_240B600B8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_240B600C4()
{
  return MEMORY[0x24BDCF870]();
}

uint64_t sub_240B600D0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_240B600DC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_240B600E8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_240B600F4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_240B60100()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_240B6010C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_240B60118()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_240B60124()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_240B60130()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_240B6013C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_240B60148()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_240B60154()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_240B60160()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_240B6016C()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_240B60178()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_240B60184()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_240B60190()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_240B6019C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_240B601A8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_240B601B4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_240B601C0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_240B601CC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_240B601D8()
{
  return MEMORY[0x24BEE0C90]();
}

uint64_t sub_240B601E4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_240B601F0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_240B601FC()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_240B60208()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_240B60214()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_240B60220()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_240B6022C()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_240B60238()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_240B60244()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_240B60250()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_240B6025C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_240B60268()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_240B60274()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_240B60280()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_240B6028C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_240B60298()
{
  return MEMORY[0x24BDCFC40]();
}

uint64_t sub_240B602A4()
{
  return MEMORY[0x24BDCFC68]();
}

uint64_t sub_240B602B0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_240B602BC()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_240B602C8()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_240B602D4()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_240B602E0()
{
  return MEMORY[0x24BEE7618]();
}

uint64_t sub_240B602EC()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_240B602F8()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_240B60304()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_240B60310()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_240B6031C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_240B60328()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_240B60334()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_240B60340()
{
  return MEMORY[0x24BEE5B38]();
}

uint64_t sub_240B6034C()
{
  return MEMORY[0x24BDD0158]();
}

uint64_t sub_240B60358()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_240B60364()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_240B60370()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_240B6037C()
{
  return MEMORY[0x24BEE1D50]();
}

uint64_t sub_240B60388()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_240B60394()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_240B603A0()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_240B603AC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_240B603B8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_240B603C4()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_240B603D0()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_240B603DC()
{
  return MEMORY[0x24BDD0550]();
}

uint64_t sub_240B603E8()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_240B603F4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_240B60400()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_240B6040C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_240B60418()
{
  return MEMORY[0x24BEE23B0]();
}

uint64_t sub_240B60424()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_240B60430()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_240B6043C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_240B60448()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_240B60454()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_240B60460()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_240B6046C()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_240B60478()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_240B60484()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_240B60490()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_240B6049C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_240B604A8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_240B604B4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_240B604C0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_240B604CC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_240B604D8()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_240B604E4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_240B604F0()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_240B604FC()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_240B60508()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_240B60514()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_240B60520()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_240B6052C()
{
  return MEMORY[0x24BEE33A8]();
}

uint64_t sub_240B60538()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_240B60544()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_240B60550()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_240B6055C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_240B60568()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_240B60574()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_240B60580()
{
  return MEMORY[0x24BEE34F8]();
}

uint64_t sub_240B6058C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_240B60598()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_240B605A4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_240B605B0()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_240B605BC()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_240B605C8()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_240B605D4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_240B605E0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_240B605EC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_240B605F8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_240B60604()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_240B60610()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_240B6061C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_240B60628()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_240B60634()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_240B60640()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_240B6064C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_240B60658()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_240B60664()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_240B60670()
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

