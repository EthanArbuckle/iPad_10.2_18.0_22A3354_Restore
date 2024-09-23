@implementation DiagnosticPipelineRapidServiceFunctionsClientObjc

- (int64_t)environment
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_environment);
}

- (DiagnosticPipelineRapidServiceFunctionsClientObjc)initWithEnvironment:(int64_t)a3
{
  return (DiagnosticPipelineRapidServiceFunctionsClientObjc *)DiagnosticPipelineRapidServiceFunctionsClient.init(environment:)(a3);
}

- (void)submitRapidPayloadWithBuildVariant:(id)a3 deviceCategory:(id)a4 deviceModel:(id)a5 platform:(id)a6 teamID:(id)a7 issueCategory:(id)a8 contextDictionaryData:(id)a9 requestTime:(unint64_t)a10 build:(id)a11 logType:(id)a12 logSize:(unint64_t)a13 fileName:(id)a14 uploadAttempts:(unsigned int)a15 payload:(id)a16 completionHandler:(id)aBlock
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  DiagnosticPipelineRapidServiceFunctionsClientObjc *v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
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
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v55 = _Block_copy(aBlock);
  v58 = sub_1DBBF80B4();
  v62 = v17;
  v57 = sub_1DBBF80B4();
  v61 = v18;
  v56 = sub_1DBBF80B4();
  v60 = v19;
  v54 = sub_1DBBF80B4();
  v59 = v20;
  v53 = sub_1DBBF80B4();
  v64 = v21;
  v52 = sub_1DBBF80B4();
  v63 = v22;
  v23 = a11;
  v24 = a12;
  v25 = a14;
  v26 = a16;
  v27 = self;
  if (a9)
  {
    v28 = a9;
    v51 = sub_1DBBF7F40();
    v30 = v29;

  }
  else
  {
    v51 = 0;
    v30 = 0xF000000000000000;
  }
  v31 = sub_1DBBF80B4();
  v33 = v32;

  v34 = sub_1DBBF80B4();
  v36 = v35;

  v37 = sub_1DBBF80B4();
  v39 = v38;

  v40 = sub_1DBBF7F40();
  v42 = v41;
  v50 = v41;

  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = v55;
  *((_QWORD *)&v49 + 1) = v37;
  *((_QWORD *)&v48 + 1) = v36;
  *(_QWORD *)&v49 = a13;
  *(_QWORD *)&v48 = v34;
  *((_QWORD *)&v47 + 1) = v31;
  *((_QWORD *)&v46 + 1) = v30;
  *(_QWORD *)&v47 = a10;
  *(_QWORD *)&v46 = v51;
  *(_QWORD *)&v45 = v52;
  *((_QWORD *)&v45 + 1) = v63;
  *(_QWORD *)&v44 = v53;
  *((_QWORD *)&v44 + 1) = v64;
  DiagnosticPipelineRapidServiceFunctionsClient.submitRapidPayload(buildVariant:deviceCategory:deviceModel:platform:teamID:issueCategory:contextDictionaryData:requestTime:build:logType:logSize:fileName:uploadAttempts:payload:completionHandler:)(v58, v62, v57, v61, v56, v60, v54, v59, v44, v45, v46, v47, v33, v48, v49, v39, a15, v40, v42,
    (uint64_t)sub_1DBBED61C,
    v43);
  swift_release();
  sub_1DBBED624(v40, v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DBBED668(v51, v30);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (DiagnosticPipelineRapidServiceFunctionsClientObjc)init
{
  DiagnosticPipelineRapidServiceFunctionsClientObjc *result;

  result = (DiagnosticPipelineRapidServiceFunctionsClientObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
