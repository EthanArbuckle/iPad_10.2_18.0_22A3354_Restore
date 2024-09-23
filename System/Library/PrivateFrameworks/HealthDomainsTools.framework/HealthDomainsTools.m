uint64_t static UsoEntity_common_HealthLog.with(healthLogName:areaType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(a1, a2, a3, a4, 0, 0, 0);
  MEMORY[0x220794594]();
  sub_21D94C658();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v5;
}

uint64_t variable initialization expression of DialogFlow.parameters()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of DialogFlow.snippets()
{
  return MEMORY[0x24BEE4AF8];
}

double variable initialization expression of FlowConfigModel.deviceState@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.aceService@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.aceServiceAsync@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.sharedContextService@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.outputPublisher@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.flowFinder@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double variable initialization expression of FlowConfigModel.networkStatusProvider@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of OutputFlow.rrEntities()
{
  return 0;
}

uint64_t _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v23 = a7;
  v22 = a1;
  v21 = sub_21D94C4E4();
  v10 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C904();
  swift_allocObject();
  v13 = sub_21D94C8F8();
  if (a2)
  {
    sub_21D94C610();
    v20 = a4;
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    v14 = MEMORY[0x2207945C4](v22, a2);
    v18 = v13;
    v19 = a3;
    v15 = v14;
    swift_bridgeObjectRetain();
    sub_21D94C4C0();
    sub_21D94C490();
    v13 = v18;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v21);
    v24 = v15;
    a4 = v20;
    sub_21D94C4FC();
    a3 = v19;
    swift_release();
  }
  if (a4)
  {
    _s12SiriOntology31UsoEntity_common_GeographicAreaC18HealthDomainsToolsE7builder8areaTypeAA0cd8Builder_e1_fG0CSSSg_tFZ_0(a3, a4);
    sub_21D94C8E0();
    swift_release();
  }
  if ((v23 & 1) != 0)
  {
    sub_21D94C994();
    swift_allocObject();
    sub_21D94C988();
    sub_21D94C8EC();
    swift_release();
  }
  return v13;
}

uint64_t static USOParse.startWorkout(_:appIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
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
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v61 = a3;
  v62 = a5;
  v8 = sub_21D94CEBC();
  v59 = *(_QWORD *)(v8 - 8);
  v60 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v58 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE20);
  MEMORY[0x24BDAC7A8](v10);
  v57 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE28);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21D94C394();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v56 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v55 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (void (*)(char *, char *, uint64_t))((char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_21D94C6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 1, 1, v30);
  v31 = sub_21D94C8BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v26, 1, 1, v31);
  v32 = sub_21D94C6C4();
  (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8)
                                                                                                  + 56))(v23, 1, 1, v32);
  v54 = v61;
  v55 = a1;
  v61 = a2;
  sub_21D94BB48(a1, a2, (uint64_t)v29, (uint64_t)v26, 0, 1, 0, 0, v23, v54, a4);
  sub_21D94CA84();
  swift_allocObject();
  v33 = sub_21D94CA78();
  sub_21D94C478();
  swift_release();
  sub_21D930660((uint64_t)v23, &qword_25538EE30);
  sub_21D930660((uint64_t)v26, &qword_25538EE38);
  sub_21D930660((uint64_t)v29, &qword_25538EE40);
  static Siri_Nlu_External_UserParse.with(task:hasCancelled:)(v33, 0, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_21D930660((uint64_t)v14, &qword_25538EE28);
    if (qword_25538EA88 != -1)
      swift_once();
    v34 = v60;
    v35 = __swift_project_value_buffer(v60, (uint64_t)static Logger.common);
    swift_beginAccess();
    v37 = v58;
    v36 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v58, v35, v34);
    v38 = v61;
    swift_bridgeObjectRetain_n();
    v39 = sub_21D94CEA4();
    v40 = sub_21D94D018();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v64 = v38;
      v65 = v42;
      *(_DWORD *)v41 = 136315138;
      v63 = v55;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE48);
      v43 = sub_21D94D06C();
      v63 = sub_21D930010(v43, v44, &v65);
      sub_21D94D078();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21D92C000, v39, v40, "Failed to create USOParse for workout task: %s", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207955E4](v42, -1, -1);
      MEMORY[0x2207955E4](v41, -1, -1);
      swift_release();

      (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v60);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v34);
    }
    v52 = v62;
    v53 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v52, 1, 1, v53);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v14, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v56, v20, v15);
    v45 = *MEMORY[0x24BE9C1C0];
    v46 = sub_21D94C34C();
    v47 = *(_QWORD *)(v46 - 8);
    v48 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 104))(v57, v45, v46);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v48, 0, 1, v46);
    v49 = v62;
    sub_21D94C334();
    swift_release();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
    v50 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 0, 1, v50);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220795548]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t static USOParse.pauseWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static USOParse.modifyWorkout(_:verb:)(a1, a2, 0, a3);
}

uint64_t static USOParse.modifyWorkout(_:verb:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v8 = sub_21D94CEBC();
  v45 = *(_QWORD *)(v8 - 8);
  v46 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE20);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE28);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21D94C394();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v41 - v21;
  v43 = a1;
  v23 = _s12SiriOntology7UsoTaskC18HealthDomainsToolsE13modifyWorkout_4verbAA0C37_VerbTemplateBuilder_ReferenceControlCyAA0c6Entitym8_common_I0CGSSSg_AD06ModifyidK0OtFZ_0(a1, a2, a3);
  static Siri_Nlu_External_UserParse.with(task:hasCancelled:)(v23, 0, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    v42 = a4;
    sub_21D930660((uint64_t)v15, &qword_25538EE28);
    if (qword_25538EA88 != -1)
      swift_once();
    v24 = v46;
    v25 = __swift_project_value_buffer(v46, (uint64_t)static Logger.common);
    swift_beginAccess();
    v26 = v44;
    v27 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v25, v24);
    swift_bridgeObjectRetain_n();
    v28 = sub_21D94CEA4();
    v29 = sub_21D94D018();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v48 = a2;
      v49 = v31;
      *(_DWORD *)v30 = 136315138;
      v41 = v30 + 4;
      v47 = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE48);
      v32 = sub_21D94D06C();
      v47 = sub_21D930010(v32, v33, &v49);
      sub_21D94D078();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21D92C000, v28, v29, "Failed to create USOParse for workout task: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207955E4](v31, -1, -1);
      MEMORY[0x2207955E4](v30, -1, -1);
      swift_release();

      (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v46);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v24);
    }
    v39 = v42;
    v40 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v39, 1, 1, v40);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
    v34 = *MEMORY[0x24BE9C1C0];
    v35 = sub_21D94C34C();
    v36 = *(_QWORD *)(v35 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v12, v34, v35);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v12, 0, 1, v35);
    sub_21D94C334();
    swift_release();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
    v37 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(a4, 0, 1, v37);
  }
}

uint64_t static USOParse.endWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static USOParse.modifyWorkout(_:verb:)(a1, a2, 1, a3);
}

uint64_t static USOParse.resumeWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static USOParse.modifyWorkout(_:verb:)(a1, a2, 2, a3);
}

uint64_t static USOParse.cancelWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_21D92F5A4(a1, a2, MEMORY[0x24BEA2950], MEMORY[0x24BEA2948], MEMORY[0x24BEA22F8], a3);
}

uint64_t static USOParse.noVerbWorkout(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_21D92F5A4(a1, a2, MEMORY[0x24BEA2990], MEMORY[0x24BEA2988], (void (*)(uint64_t))MEMORY[0x24BE9ED38], a3);
}

uint64_t sub_21D92F5A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(_QWORD)@<X2>, uint64_t (*a4)(void)@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
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
  char *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(_QWORD);
  uint64_t (*v64)(void);
  void (*v65)(uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v64 = a4;
  v65 = a5;
  v63 = a3;
  v66 = a6;
  v8 = sub_21D94CEBC();
  v61 = *(_QWORD *)(v8 - 8);
  v62 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v60 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE20);
  MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE28);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21D94C394();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v57 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v55 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (void (*)(char *, char *, uint64_t))((char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_21D94C6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 1, 1, v30);
  v31 = sub_21D94C8BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v26, 1, 1, v31);
  v32 = sub_21D94C6C4();
  (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8)
                                                                                                  + 56))(v23, 1, 1, v32);
  v56 = a1;
  v59 = a2;
  v33 = sub_21D94BB48(a1, a2, (uint64_t)v29, (uint64_t)v26, 0, 1, 0, 0, v23, 0, 0);
  sub_21D930660((uint64_t)v23, &qword_25538EE30);
  sub_21D930660((uint64_t)v26, &qword_25538EE38);
  sub_21D930660((uint64_t)v29, &qword_25538EE40);
  v63(0);
  swift_allocObject();
  v34 = v64();
  v65(v33);
  swift_release();
  static Siri_Nlu_External_UserParse.with(task:hasCancelled:)(v34, 1, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_21D930660((uint64_t)v14, &qword_25538EE28);
    if (qword_25538EA88 != -1)
      swift_once();
    v35 = v62;
    v36 = __swift_project_value_buffer(v62, (uint64_t)static Logger.common);
    swift_beginAccess();
    v38 = v60;
    v37 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v60, v36, v35);
    v39 = v59;
    swift_bridgeObjectRetain_n();
    v40 = sub_21D94CEA4();
    v41 = sub_21D94D018();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      v68 = v39;
      v69 = v43;
      *(_DWORD *)v42 = 136315138;
      v67 = v56;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE48);
      v44 = sub_21D94D06C();
      v67 = sub_21D930010(v44, v45, &v69);
      sub_21D94D078();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21D92C000, v40, v41, "Failed to create USOParse for workout task: %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207955E4](v43, -1, -1);
      MEMORY[0x2207955E4](v42, -1, -1);
      swift_release();

      (*(void (**)(char *, uint64_t))(v61 + 8))(v60, v62);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v35);
    }
    v53 = v66;
    v54 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v53, 1, 1, v54);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v14, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v57, v20, v15);
    v46 = *MEMORY[0x24BE9C1C0];
    v47 = sub_21D94C34C();
    v48 = *(_QWORD *)(v47 - 8);
    v49 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v48 + 104))(v58, v46, v47);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v49, 0, 1, v47);
    v50 = v66;
    sub_21D94C334();
    swift_release();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
    v51 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v50, 0, 1, v51);
  }
}

uint64_t static USOParse.accept()@<X0>(uint64_t a1@<X8>)
{
  return sub_21D92FBEC((Class *)0x24BEA3A30, "Failed to create USOParse for accepted UDA", a1);
}

uint64_t static USOParse.reject()@<X0>(uint64_t a1@<X8>)
{
  return sub_21D92FBEC((Class *)0x24BEA3A50, "Failed to create USOParse for reject UDA", a1);
}

uint64_t sub_21D92FBEC@<X0>(Class *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;

  v35 = a2;
  v36 = a3;
  v4 = sub_21D94CEBC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE20);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE28);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21D94C394();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v34 - v19;
  v21 = objc_msgSend(objc_allocWithZone(*a1), sel_init);
  sub_21D94C454();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    v22 = v36;
    sub_21D930660((uint64_t)v13, &qword_25538EE28);
    if (qword_25538EA88 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v4, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
    v24 = sub_21D94CEA4();
    v25 = sub_21D94D018();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_21D92C000, v24, v25, v35, v26, 2u);
      MEMORY[0x2207955E4](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v27 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v22, 1, 1, v27);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, v14);
    v29 = *MEMORY[0x24BE9C1C0];
    v30 = sub_21D94C34C();
    v31 = *(_QWORD *)(v30 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 104))(v10, v29, v30);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v10, 0, 1, v30);
    v32 = v36;
    sub_21D94C334();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
    v33 = sub_21D94C340();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
  }
}

uint64_t sub_21D92FF3C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21D92FF4C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21D92FF80(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21D92FFA0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_21D930010(v6, v7, a3);
  v8 = *a1 + 8;
  sub_21D94D078();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21D930010(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21D9300E0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21D9306D4((uint64_t)v12, *a3);
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
      sub_21D9306D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21D9300E0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21D94D084();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21D930298(a5, a6);
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
  v8 = sub_21D94D0F0();
  if (!v8)
  {
    sub_21D94D180();
    __break(1u);
LABEL_17:
    result = sub_21D94D1B0();
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

uint64_t sub_21D930298(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21D93032C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21D930504(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21D930504(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21D93032C(uint64_t a1, unint64_t a2)
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
      v3 = sub_21D9304A0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21D94D0CC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21D94D180();
      __break(1u);
LABEL_10:
      v2 = sub_21D94CF88();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21D94D1B0();
    __break(1u);
LABEL_14:
    result = sub_21D94D180();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21D9304A0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE50);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21D930504(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE50);
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
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

_BYTE **sub_21D930650(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_21D930660(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t sub_21D9306D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t DialogFlow.catId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DialogFlow.init(catId:wrapper:parameters:snippets:deviceState:aceService:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, __int128 *a6@<X5>, __int128 *a7@<X6>, _QWORD *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  sub_21D930780(a6, (uint64_t)(a8 + 5));
  return sub_21D930780(a7, (uint64_t)(a8 + 10));
}

uint64_t sub_21D930780(__int128 *a1, uint64_t a2)
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

uint64_t DialogFlow.on(input:)()
{
  return 1;
}

uint64_t DialogFlow.execute(completion:)(void (*a1)(char *), uint64_t a2)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  void (*v32)(char *, uint64_t);
  void **v33;
  void *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char *v49;
  id v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void **v70;
  void (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;
  void (**v73)(char *, void **, uint64_t);
  uint64_t v74;
  char *v75;
  void (*v76)(char *);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;

  v3 = v2;
  v77 = a2;
  v76 = a1;
  v67 = sub_21D94C2A4();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v65 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21D94C2BC();
  v73 = *(void (***)(char *, void **, uint64_t))(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  v7 = MEMORY[0x24BDAC7A8](v69);
  v70 = (void **)((char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v61 - v9;
  v11 = sub_21D94CEBC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v64 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v61 - v18;
  if (qword_25538EA88 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v11, (uint64_t)static Logger.common);
  swift_beginAccess();
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v72 = v20;
  v71 = v21;
  v21(v19, v20, v11);
  sub_21D93126C(v3, (uint64_t)&v80);
  v22 = sub_21D94CEA4();
  v23 = sub_21D94D00C();
  v24 = os_log_type_enabled(v22, v23);
  v68 = v12;
  v75 = v10;
  v74 = v11;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v62 = v17;
    v27 = v26;
    v79 = v26;
    v61 = v5;
    *(_DWORD *)v25 = 136315138;
    v29 = v80;
    v28 = v81;
    swift_bridgeObjectRetain();
    v78 = sub_21D930010(v29, v28, &v79);
    v11 = v74;
    v5 = v61;
    sub_21D94D078();
    swift_bridgeObjectRelease();
    sub_21D9312A0((uint64_t)&v80);
    _os_log_impl(&dword_21D92C000, v22, v23, "Executing dialog: %s", v25, 0xCu);
    swift_arrayDestroy();
    v30 = v27;
    v17 = v62;
    MEMORY[0x2207955E4](v30, -1, -1);
    v31 = v25;
    v10 = v75;
    MEMORY[0x2207955E4](v31, -1, -1);
  }
  else
  {
    sub_21D9312A0((uint64_t)&v80);
  }

  v32 = *(void (**)(char *, uint64_t))(v68 + 8);
  v32(v19, v11);
  sub_21D94CD54();
  v33 = v70;
  sub_21D9312CC((uint64_t)v10, (uint64_t)v70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v34 = *v33;
    v71(v17, v72, v11);
    sub_21D93126C(v3, (uint64_t)&v80);
    v35 = sub_21D94CEA4();
    v36 = sub_21D94D018();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v62 = v17;
      v39 = v38;
      v79 = v38;
      *(_DWORD *)v37 = 136315138;
      v40 = v32;
      v41 = v80;
      v42 = v81;
      swift_bridgeObjectRetain();
      v43 = v41;
      v32 = v40;
      v78 = sub_21D930010(v43, v42, &v79);
      v11 = v74;
      sub_21D94D078();
      swift_bridgeObjectRelease();
      sub_21D9312A0((uint64_t)&v80);
      _os_log_impl(&dword_21D92C000, v35, v36, "Failed to execute CAT: %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207955E4](v39, -1, -1);
      MEMORY[0x2207955E4](v37, -1, -1);

      v40(v62, v11);
    }
    else
    {
      sub_21D9312A0((uint64_t)&v80);

      v32(v17, v11);
    }
    v49 = v64;
    v71(v64, v72, v11);
    v50 = v34;
    v51 = v34;
    v52 = sub_21D94CEA4();
    v53 = sub_21D94D018();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      v79 = (uint64_t)v34;
      v80 = v55;
      *(_DWORD *)v54 = 136315138;
      v56 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE60);
      v57 = sub_21D94CF40();
      v73 = (void (**)(char *, void **, uint64_t))v32;
      v79 = sub_21D930010(v57, v58, &v80);
      sub_21D94D078();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21D92C000, v52, v53, "Error: %s", v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207955E4](v55, -1, -1);
      MEMORY[0x2207955E4](v54, -1, -1);

      ((void (*)(char *, uint64_t))v73)(v49, v74);
    }
    else
    {

      v32(v49, v11);
    }
    v59 = (uint64_t)v75;
    v60 = v65;
    sub_21D94C28C();
    v76(v60);

    (*(void (**)(char *, uint64_t))(v66 + 8))(v60, v67);
    return sub_21D931314(v59);
  }
  else
  {
    v44 = v63;
    v73[4](v63, v33, v5);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 64));
    sub_21D94C1B4();
    sub_21D94C238();
    swift_allocObject();
    sub_21D94C22C();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 64));
    sub_21D94C1B4();
    v45 = (void *)sub_21D94C220();
    swift_release();
    sub_21D931378(v3 + 80, (uint64_t)&v80);
    __swift_project_boxed_opaque_existential_1(&v80, v82);
    v46 = swift_allocObject();
    v47 = v77;
    *(_QWORD *)(v46 + 16) = v76;
    *(_QWORD *)(v46 + 24) = v47;
    sub_21D9313E8();
    swift_retain();
    sub_21D94C2D4();

    swift_release();
    ((void (*)(char *, uint64_t))v73[1])(v44, v5);
    sub_21D931314((uint64_t)v10);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)&v80);
  }
}

uint64_t sub_21D931060(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = sub_21D94C2A4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C28C();
  a2(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_21D9310EC()
{
  return 1;
}

uint64_t sub_21D9310F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D93115C;
  return sub_21D94C124();
}

uint64_t sub_21D93115C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_21D9311B0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D93121C;
  return sub_21D94C10C();
}

uint64_t sub_21D93121C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21D93126C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DialogFlow(a2, a1);
  return a2;
}

uint64_t sub_21D9312A0(uint64_t a1)
{
  destroy for DialogFlow(a1);
  return a1;
}

uint64_t sub_21D9312CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D931314(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
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

uint64_t sub_21D931378(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21D9313BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21D9313E0(uint64_t a1)
{
  uint64_t v1;

  return sub_21D931060(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t sub_21D9313E8()
{
  unint64_t result;

  result = qword_25538EE68[0];
  if (!qword_25538EE68[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_25538EE68);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DialogFlow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DialogFlow(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_0(a1 + 80);
}

uint64_t initializeWithCopy for DialogFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  __int128 v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v6 = a2 + 40;
  v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(a1 + 40, v6, v8);
  v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, a2 + 80);
  return a1;
}

_QWORD *assignWithCopy for DialogFlow(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
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

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for DialogFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_0(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for DialogFlow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DialogFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogFlow()
{
  return &type metadata for DialogFlow;
}

uint64_t static DialogCalendar.make(date:)()
{
  uint64_t v0;
  uint64_t v1;

  sub_21D94CD48();
  swift_allocObject();
  sub_21D94CD3C();
  sub_21D94BFF8();
  sub_21D94CD30();
  v0 = swift_release();
  v1 = MEMORY[0x220794CE4](v0);
  swift_release();
  return v1;
}

uint64_t static Siri_Nlu_External_UserParse.with(task:hasCancelled:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  void (*v29)(char *, char *);
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v46 = a2;
  v50 = a3;
  sub_21D94C3AC();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v42 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_21D94C3F4();
  v45 = *(_QWORD *)(v47 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v48 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_21D94C424();
  v49 = *(_QWORD *)(v44 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v43 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE80);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21D94C364();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v37 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE88);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F160);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_21D94D760;
  *(_QWORD *)(v23 + 32) = a1;
  v51 = v23;
  sub_21D94CFD0();
  v24 = v51;
  v25 = sub_21D94C520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v22, 1, 1, v25);
  swift_retain();
  MEMORY[0x2207944B0](v24, v22);
  swift_bridgeObjectRelease();
  sub_21D930660((uint64_t)v22, &qword_25538EE88);
  sub_21D94C460();
  v26 = v50;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
  sub_21D94C418();
  v38 = v19;
  v39 = v14;
  v27 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v40 = v13;
  v27(v17, v19, v13);
  sub_21D94C40C();
  v28 = v48;
  sub_21D94C3E8();
  v29 = *(void (**)(char *, char *))(v49 + 16);
  v41 = v9;
  v30 = v44;
  v29(v43, v9);
  sub_21D94C3D0();
  if ((v46 & 1) != 0)
  {
    sub_21D94C3A0();
    sub_21D94C3DC();
  }
  sub_21D94C388();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE90);
  v31 = v45;
  v32 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_21D94D770;
  v34 = v47;
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 16))(v33 + v32, v28, v47);
  sub_21D94C37C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v34);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v41, v30);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v40);
  v35 = sub_21D94C394();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v26, 0, 1, v35);
}

uint64_t GuardedFlow.init(mainFlow:guards:enforceProtectedHealthApp:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
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
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v8 = sub_21D94CEBC();
  v32 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21D94C0DC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v28 - v16;
  sub_21D931378(a1, a4);
  *(_QWORD *)(a4 + 40) = a2;
  if ((a3 & 1) == 0)
    return __swift_destroy_boxed_opaque_existential_0(a1);
  v30 = (unint64_t)"com.apple.Fitness";
  sub_21D94C0D0();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v31 = a1;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    a2 = sub_21D932598(0, *(_QWORD *)(a2 + 16) + 1, 1, a2);
  v20 = *(_QWORD *)(a2 + 16);
  v19 = *(_QWORD *)(a2 + 24);
  if (v20 >= v19 >> 1)
    a2 = sub_21D932598(v19 > 1, v20 + 1, 1, a2);
  *(_QWORD *)(a2 + 16) = v20 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(a2+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v20, v15, v11);
  *(_QWORD *)(a4 + 40) = a2;
  if (qword_25538EA68 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v8, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  v22 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v10, v21, v8);
  v23 = sub_21D94CEA4();
  v24 = sub_21D94D00C();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v34 = v26;
    v29 = v8;
    *(_DWORD *)v25 = 136315138;
    v33 = sub_21D930010(0xD000000000000010, v30 | 0x8000000000000000, &v34);
    sub_21D94D078();
    _os_log_impl(&dword_21D92C000, v23, v24, "Protected app check needed for %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v26, -1, -1);
    MEMORY[0x2207955E4](v25, -1, -1);

    __swift_destroy_boxed_opaque_existential_0(v31);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v29);
  }
  else
  {

    __swift_destroy_boxed_opaque_existential_0(v31);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

uint64_t GuardedFlow.on(input:)()
{
  return 1;
}

uint64_t GuardedFlow.execute(completion:)()
{
  sub_21D9328C4();
  return sub_21D94C0F4();
}

uint64_t GuardedFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[16] = a1;
  v2[17] = v1;
  v3 = sub_21D94CEBC();
  v2[18] = v3;
  v2[19] = *(_QWORD *)(v3 - 8);
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D9321F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (qword_25538EA88 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 152);
  v1 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v5 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  sub_21D932908(v4, v0 + 16);
  v6 = sub_21D94CEA4();
  v7 = sub_21D94D00C();
  v8 = os_log_type_enabled(v6, v7);
  v10 = *(_QWORD *)(v0 + 152);
  v9 = *(_QWORD *)(v0 + 160);
  v11 = *(_QWORD *)(v0 + 144);
  if (v8)
  {
    v22 = *(_QWORD *)(v0 + 152);
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v23 = v13;
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v0 + 112) = sub_21D930010(0x4664656472617547, 0xEB00000000776F6CLL, &v23);
    sub_21D94D078();
    *(_WORD *)(v12 + 12) = 2080;
    v21 = v11;
    v14 = sub_21D94C0DC();
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x220794F84](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 120) = sub_21D930010(v16, v18, &v23);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    sub_21D932958(v0 + 16);
    _os_log_impl(&dword_21D92C000, v6, v7, "Executing %s with guards: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v13, -1, -1);
    MEMORY[0x2207955E4](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v9, v21);
  }
  else
  {
    sub_21D932958(v0 + 16);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 136), *(_QWORD *)(*(_QWORD *)(v0 + 136) + 24));
  *(_QWORD *)(v0 + 88) = sub_21D94C0E8();
  *(_QWORD *)(v0 + 96) = sub_21D94C0AC();
  sub_21D94C0B8();
  sub_21D94C0C4();
  v19 = sub_21D94C118();
  swift_release();
  swift_release();
  *(_QWORD *)(v0 + 104) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEA8);
  sub_21D932984();
  sub_21D94C280();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D932548(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21D93121C;
  return GuardedFlow.execute()(a1);
}

uint64_t sub_21D932598(char a1, int64_t a2, char a3, unint64_t a4)
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
  unint64_t v17;
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
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538EED8);
  v10 = *(_QWORD *)(sub_21D94C0DC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_21D94D180();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_21D94C0DC() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21D932BDC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_21D9327A0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEC8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
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
    sub_21D932CF4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_21D9328C4()
{
  unint64_t result;

  result = qword_25538EE98;
  if (!qword_25538EE98)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for GuardedFlow, &type metadata for GuardedFlow);
    atomic_store(result, (unint64_t *)&qword_25538EE98);
  }
  return result;
}

uint64_t sub_21D932908(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_21D932958(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_21D932984()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25538EEB0[0];
  if (!qword_25538EEB0[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25538EEA8);
    result = MEMORY[0x220795560](MEMORY[0x24BE95F90], v1);
    atomic_store(result, qword_25538EEB0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220795554](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21D932A14(void (*a1)(void))
{
  a1();
  return sub_21D94D27C();
}

uint64_t destroy for GuardedFlow(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GuardedFlow(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for GuardedFlow(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

uint64_t assignWithTake for GuardedFlow(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for GuardedFlow(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GuardedFlow(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GuardedFlow()
{
  return &type metadata for GuardedFlow;
}

uint64_t sub_21D932BDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_21D94C0DC() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

uint64_t sub_21D932CF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538EED0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

uint64_t static UsoEntity_common_DurationComponent.builder(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_21D94CBA4();
  swift_allocObject();
  v5 = sub_21D94CB98();
  if (a1)
  {
    swift_retain();
    sub_21D94C7FC();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  return v5;
}

uint64_t static UsoEntity_common_DurationComponent.with(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v7;

  sub_21D94CBA4();
  swift_allocObject();
  v5 = sub_21D94CB98();
  if (a1)
  {
    swift_retain();
    sub_21D94C7FC();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  MEMORY[0x220794594](v5);
  sub_21D94C94C();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v7;
}

uint64_t LocationService.init(with:geocoder:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = sub_21D930780(a1, a3);
  *(_QWORD *)(a3 + 40) = a2;
  return result;
}

uint64_t LocationService.getCurrentLocation()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[14] = v0;
  v2 = sub_21D94CEBC();
  v1[15] = v2;
  v1[16] = *(_QWORD *)(v2 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D933004()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v1 = (_QWORD *)v0[14];
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81278]), sel_init);
  v0[19] = v2;
  objc_msgSend(v2, sel_setDesiredAccuracy_, *MEMORY[0x24BE81B58]);
  sub_21D9343E0(0, &qword_25538EEE8);
  v3 = (void *)sub_21D94D03C();
  objc_msgSend(v2, sel_setMaxAge_, v3);

  v4 = (void *)sub_21D94D03C();
  objc_msgSend(v2, sel_setSearchTimeout_, v4);

  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[20] = v5;
  sub_21D9343E0(0, &qword_25538EEF0);
  *v5 = v0;
  v5[1] = sub_21D933140;
  return sub_21D94C2F8();
}

uint64_t sub_21D933140(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 168) = a1;
  *(_QWORD *)(v3 + 176) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D9331AC()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  void *v20;
  void *v21;

  v1 = *(void **)(v0 + 168);
  objc_msgSend(v1, sel_latitude);
  v3 = v2;
  objc_msgSend(v1, sel_longitude);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, v3, v4);
  if (qword_25538EA88 != -1)
    swift_once();
  v6 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 128);
  v9 = __swift_project_value_buffer(v7, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
  v10 = v5;
  v11 = sub_21D94CEA4();
  v12 = sub_21D94D00C();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(void **)(v0 + 168);
  v15 = *(void **)(v0 + 152);
  if (v13)
  {
    v20 = *(void **)(v0 + 168);
    v21 = *(void **)(v0 + 152);
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412290;
    *(_QWORD *)(v0 + 104) = v10;
    v18 = v10;
    sub_21D94D078();
    *v17 = v10;

    _os_log_impl(&dword_21D92C000, v11, v12, "Fetched location: %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEF8);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v17, -1, -1);
    MEMORY[0x2207955E4](v16, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 120));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v10);
}

uint64_t sub_21D933414()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (qword_25538EA88 != -1)
    swift_once();
  v1 = *(void **)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 120);
  v5 = __swift_project_value_buffer(v4, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_21D94CEA4();
  v9 = sub_21D94D018();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 128);
  v12 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 120);
  if (v10)
  {
    v22 = *(_QWORD *)(v0 + 120);
    v20 = *(void **)(v0 + 152);
    v21 = *(_QWORD *)(v0 + 128);
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_getErrorValue();
    v17 = sub_21D94D210();
    *(_QWORD *)(v0 + 96) = sub_21D930010(v17, v18, &v23);
    sub_21D94D078();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21D92C000, v8, v9, "Error submitting SAGetRequestOrigin: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v16, -1, -1);
    MEMORY[0x2207955E4](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v12, v22);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t LocationService.getLocationCountryCode()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D9336C4;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_21D9336C4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 24) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D933720()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 24);
  if (!v1)
    goto LABEL_5;
  v2 = objc_msgSend(*(id *)(v0 + 24), sel_ISOcountryCode);

  if (!v2)
  {
    v1 = 0;
LABEL_5:
    v4 = 0;
    return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, v4);
  }
  v1 = (void *)sub_21D94CF34();
  v4 = v3;

  return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, v4);
}

uint64_t LocationService.getCurrentPlacemark()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1[31] = v0;
  v2 = sub_21D94CEBC();
  v1[32] = v2;
  v1[33] = *(_QWORD *)(v2 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v3 = (_QWORD *)swift_task_alloc();
  v1[37] = v3;
  *v3 = v1;
  v3[1] = sub_21D933830;
  return LocationService.getCurrentLocation()();
}

uint64_t sub_21D933830(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D93388C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 304);
  if (v1)
  {
    v2 = *(void **)(*(_QWORD *)(v0 + 248) + 40);
    *(_QWORD *)(v0 + 56) = v0 + 232;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_21D933A70;
    v3 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v4 = (_QWORD *)(v0 + 80);
    v4[1] = 0x40000000;
    v4[2] = sub_21D934178;
    v4[3] = &block_descriptor;
    v4[4] = v3;
    objc_msgSend(v2, sel_reverseGeocodeLocation_completionHandler_, v1, v4);
    return swift_continuation_await();
  }
  else
  {
    if (qword_25538EA88 != -1)
      swift_once();
    v6 = *(_QWORD *)(v0 + 280);
    v7 = *(_QWORD *)(v0 + 256);
    v8 = *(_QWORD *)(v0 + 264);
    v9 = __swift_project_value_buffer(v7, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
    v10 = sub_21D94CEA4();
    v11 = sub_21D94D018();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21D92C000, v10, v11, "Could not acquire location, so unable to determine placemark", v12, 2u);
      MEMORY[0x2207955E4](v12, -1, -1);
    }
    v13 = *(_QWORD *)(v0 + 280);
    v14 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 264);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_21D933A70()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 312) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21D933AD0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 232);
  if (qword_25538EA88 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  swift_bridgeObjectRetain_n();
  v6 = sub_21D94CEA4();
  v7 = sub_21D94D00C();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 288);
  v10 = *(_QWORD *)(v0 + 256);
  v11 = *(_QWORD *)(v0 + 264);
  if (v8)
  {
    v27 = *(_QWORD *)(v0 + 288);
    v26 = *(_QWORD *)(v0 + 264);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v28 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_21D9343E0(0, &qword_25538EF10);
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x220794F84](v15, v14);
    v25 = v10;
    v18 = v17;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 240) = sub_21D930010(v16, v18, &v28);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21D92C000, v6, v7, "Reverse geocoding returned placemarks: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v13, -1, -1);
    MEMORY[0x2207955E4](v12, -1, -1);

    result = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v27, v25);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
LABEL_13:
    v24 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease();

    v21 = 0;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v23 = sub_21D94D198();
  result = swift_bridgeObjectRelease();
  if (!v23)
    goto LABEL_13;
LABEL_8:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v20 = (id)MEMORY[0x220795098](0, v1);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v20 = *(id *)(v1 + 32);
LABEL_11:
    v21 = v20;
    v22 = *(void **)(v0 + 304);
    swift_bridgeObjectRelease();

LABEL_14:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(id))(v0 + 8))(v21);
  }
  __break(1u);
  return result;
}

uint64_t sub_21D933DD4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  swift_willThrow();
  if (qword_25538EA88 != -1)
    swift_once();
  v1 = *(void **)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 256);
  v5 = __swift_project_value_buffer(v4, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_21D94CEA4();
  v9 = sub_21D94D018();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 312);
  v13 = *(_QWORD *)(v0 + 264);
  v12 = *(_QWORD *)(v0 + 272);
  v14 = *(_QWORD *)(v0 + 256);
  if (v10)
  {
    v22 = *(_QWORD *)(v0 + 264);
    v20 = *(void **)(v0 + 304);
    v21 = *(_QWORD *)(v0 + 256);
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_getErrorValue();
    v17 = sub_21D94D210();
    *(_QWORD *)(v0 + 224) = sub_21D930010(v17, v18, &v23);
    sub_21D94D078();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21D92C000, v8, v9, "Error reverse geocoding: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v16, -1, -1);
    MEMORY[0x2207955E4](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v21);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t LocationService.getCurrentCity()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D934098;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_21D934098(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 24) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D9340F4()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 24);
  if (!v1)
    goto LABEL_5;
  v2 = objc_msgSend(*(id *)(v0 + 24), sel_locality);

  if (!v2)
  {
    v1 = 0;
LABEL_5:
    v4 = 0;
    return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, v4);
  }
  v1 = (void *)sub_21D94CF34();
  v4 = v3;

  return (*(uint64_t (**)(void *, uint64_t))(v0 + 8))(v1, v4);
}

uint64_t sub_21D934178(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE60);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_21D9343E0(0, &qword_25538EF10);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_21D94CFB8();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_21D934220()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D93115C;
  return LocationService.getCurrentLocation()();
}

uint64_t sub_21D934264()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D9336C4;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_21D9342A8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D934098;
  return LocationService.getCurrentPlacemark()();
}

uint64_t sub_21D9342EC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D934510;
  return LocationService.getCurrentPlacemark()();
}

void sub_21D934330(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_21D94D078();
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

uint64_t sub_21D9343E0(uint64_t a1, unint64_t *a2)
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

void destroy for LocationService(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);

}

uint64_t initializeWithCopy for LocationService(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  id v6;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = v5;
  return a1;
}

uint64_t *assignWithCopy for LocationService(uint64_t *a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  id v6;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v4 = (void *)a2[5];
  v5 = (void *)a1[5];
  a1[5] = (uint64_t)v4;
  v6 = v4;

  return a1;
}

uint64_t assignWithTake for LocationService(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  void *v6;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;

  return a1;
}

ValueMetadata *type metadata accessor for LocationService()
{
  return &type metadata for LocationService;
}

uint64_t FlowConfigModel.init(deviceState:aceService:aceServiceAsync:sharedContextService:outputPublisher:flowFinder:networkStatusProvider:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(a8 + 272) = 0;
  *(_OWORD *)(a8 + 256) = 0u;
  *(_OWORD *)(a8 + 208) = 0u;
  *(_OWORD *)(a8 + 224) = 0u;
  v12 = a8 + 40;
  v13 = a8 + 120;
  *(_OWORD *)(a8 + 176) = 0u;
  *(_OWORD *)(a8 + 192) = 0u;
  v14 = a8 + 200;
  *(_OWORD *)(a8 + 128) = 0u;
  *(_OWORD *)(a8 + 144) = 0u;
  *(_OWORD *)(a8 + 96) = 0u;
  *(_OWORD *)(a8 + 112) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)a8 = 0u;
  *(_OWORD *)(a8 + 240) = 0u;
  v15 = a8 + 240;
  *(_OWORD *)(a8 + 160) = 0u;
  v16 = a8 + 160;
  *(_OWORD *)(a8 + 80) = 0u;
  v17 = a8 + 80;
  sub_21D93463C(a1, a8, &qword_25538EF40);
  sub_21D93463C(a2, v12, &qword_25538EF48);
  sub_21D93463C(a3, v17, &qword_25538EF50);
  sub_21D93463C(a4, v13, &qword_25538EF58);
  sub_21D93463C(a5, v16, &qword_25538EF60);
  sub_21D93463C(a6, v14, &qword_25538EF68);
  return sub_21D93463C(a7, v15, &qword_25538EF70);
}

uint64_t sub_21D93463C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t FlowConfigModel.getDeviceState()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1, (uint64_t)&v4, &qword_25538EF40);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF40);
  return sub_21D94C31C();
}

uint64_t FlowConfigModel.getAceService()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 40, (uint64_t)&v4, &qword_25538EF48);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF48);
  return sub_21D94C1A8();
}

uint64_t FlowConfigModel.getAceServiceAsync()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 80, (uint64_t)&v4, &qword_25538EF50);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D94C19C();
  return sub_21D930660((uint64_t)&v4, &qword_25538EF50);
}

uint64_t FlowConfigModel.getSharedContextService()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 120, (uint64_t)&v4, &qword_25538EF58);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF58);
  return sub_21D94CE14();
}

uint64_t FlowConfigModel.getOutputPublisher()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 160, (uint64_t)&v4, &qword_25538EF60);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF60);
  return sub_21D94C304();
}

uint64_t FlowConfigModel.getFlowFinder()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7[2];

  sub_21D9349A4(v1 + 200, (uint64_t)&v5, &qword_25538EF68);
  if (v6)
  {
    sub_21D930780(&v5, (uint64_t)v7);
    return sub_21D930780(v7, (uint64_t)a1);
  }
  else
  {
    sub_21D930660((uint64_t)&v5, &qword_25538EF68);
    v4 = type metadata accessor for FlowFinder();
    result = swift_allocObject();
    a1[3] = v4;
    a1[4] = (uint64_t)&protocol witness table for FlowFinder;
    *a1 = result;
  }
  return result;
}

uint64_t FlowConfigModel.getNetworkStatusProvider()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  sub_21D9349A4(v1 + 240, (uint64_t)&v6, &qword_25538EF70);
  if (v7)
    return sub_21D930780(&v6, (uint64_t)a1);
  v4 = type metadata accessor for NetworkStatusProvider();
  v5 = swift_allocObject();
  a1[3] = v4;
  a1[4] = (uint64_t)&protocol witness table for NetworkStatusProvider;
  *a1 = v5;
  return sub_21D930660((uint64_t)&v6, &qword_25538EF70);
}

uint64_t sub_21D9349A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21D9349E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1, (uint64_t)&v4, &qword_25538EF40);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF40);
  return sub_21D94C31C();
}

uint64_t sub_21D934A50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 40, (uint64_t)&v4, &qword_25538EF48);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF48);
  return sub_21D94C1A8();
}

uint64_t sub_21D934AB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 80, (uint64_t)&v4, &qword_25538EF50);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D94C19C();
  return sub_21D930660((uint64_t)&v4, &qword_25538EF50);
}

uint64_t sub_21D934B20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 120, (uint64_t)&v4, &qword_25538EF58);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF58);
  return sub_21D94CE14();
}

uint64_t sub_21D934B88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;

  sub_21D9349A4(v1 + 160, (uint64_t)&v4, &qword_25538EF60);
  if (v5)
    return sub_21D930780(&v4, a1);
  sub_21D930660((uint64_t)&v4, &qword_25538EF60);
  return sub_21D94C304();
}

uint64_t sub_21D934BF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7[2];

  sub_21D9349A4(v1 + 200, (uint64_t)&v5, &qword_25538EF68);
  if (v6)
  {
    sub_21D930780(&v5, (uint64_t)v7);
    return sub_21D930780(v7, (uint64_t)a1);
  }
  else
  {
    sub_21D930660((uint64_t)&v5, &qword_25538EF68);
    v4 = type metadata accessor for FlowFinder();
    result = swift_allocObject();
    a1[3] = v4;
    a1[4] = (uint64_t)&protocol witness table for FlowFinder;
    *a1 = result;
  }
  return result;
}

uint64_t sub_21D934C84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  sub_21D9349A4(v1 + 240, (uint64_t)&v6, &qword_25538EF70);
  if (v7)
    return sub_21D930780(&v6, (uint64_t)a1);
  v4 = type metadata accessor for NetworkStatusProvider();
  v5 = swift_allocObject();
  a1[3] = v4;
  a1[4] = (uint64_t)&protocol witness table for NetworkStatusProvider;
  *a1 = v5;
  return sub_21D930660((uint64_t)&v6, &qword_25538EF70);
}

uint64_t destroy for FlowConfigModel(uint64_t result)
{
  _QWORD *v1;

  v1 = (_QWORD *)result;
  if (*(_QWORD *)(result + 24))
    result = __swift_destroy_boxed_opaque_existential_0(result);
  if (v1[8])
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 5));
  if (v1[13])
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 10));
  if (v1[18])
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 15));
  if (v1[23])
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 20));
  if (v1[28])
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 25));
  if (v1[33])
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)(v1 + 30));
  return result;
}

uint64_t initializeWithCopy for FlowConfigModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  _OWORD *v32;
  _OWORD *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v7 = (_OWORD *)(a1 + 40);
  v8 = (_OWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 64);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = v9;
    *(_QWORD *)(a1 + 72) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 56);
    *v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  v12 = (_OWORD *)(a1 + 80);
  v13 = (_OWORD *)(a2 + 80);
  v14 = *(_QWORD *)(a2 + 104);
  if (v14)
  {
    v15 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v14;
    *(_QWORD *)(a1 + 112) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
  }
  else
  {
    v16 = *(_OWORD *)(a2 + 96);
    *v12 = *v13;
    *(_OWORD *)(a1 + 96) = v16;
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  }
  v17 = (_OWORD *)(a1 + 120);
  v18 = (_OWORD *)(a2 + 120);
  v19 = *(_QWORD *)(a2 + 144);
  if (v19)
  {
    v20 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = v19;
    *(_QWORD *)(a1 + 152) = v20;
    (**(void (***)(_OWORD *, _OWORD *))(v19 - 8))(v17, v18);
  }
  else
  {
    v21 = *(_OWORD *)(a2 + 136);
    *v17 = *v18;
    *(_OWORD *)(a1 + 136) = v21;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  }
  v22 = (_OWORD *)(a1 + 160);
  v23 = (_OWORD *)(a2 + 160);
  v24 = *(_QWORD *)(a2 + 184);
  if (v24)
  {
    v25 = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 184) = v24;
    *(_QWORD *)(a1 + 192) = v25;
    (**(void (***)(_OWORD *, _OWORD *))(v24 - 8))(v22, v23);
  }
  else
  {
    v26 = *(_OWORD *)(a2 + 176);
    *v22 = *v23;
    *(_OWORD *)(a1 + 176) = v26;
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  }
  v27 = (_OWORD *)(a1 + 200);
  v28 = (_OWORD *)(a2 + 200);
  v29 = *(_QWORD *)(a2 + 224);
  if (v29)
  {
    v30 = *(_QWORD *)(a2 + 232);
    *(_QWORD *)(a1 + 224) = v29;
    *(_QWORD *)(a1 + 232) = v30;
    (**(void (***)(_OWORD *, _OWORD *))(v29 - 8))(v27, v28);
  }
  else
  {
    v31 = *(_OWORD *)(a2 + 216);
    *v27 = *v28;
    *(_OWORD *)(a1 + 216) = v31;
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  }
  v32 = (_OWORD *)(a1 + 240);
  v33 = (_OWORD *)(a2 + 240);
  v34 = *(_QWORD *)(a2 + 264);
  if (v34)
  {
    v35 = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 264) = v34;
    *(_QWORD *)(a1 + 272) = v35;
    (**(void (***)(_OWORD *, _OWORD *))(v34 - 8))(v32, v33);
  }
  else
  {
    v36 = *(_OWORD *)(a2 + 256);
    *v32 = *v33;
    *(_OWORD *)(a1 + 256) = v36;
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  }
  return a1;
}

uint64_t assignWithCopy for FlowConfigModel(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
    goto LABEL_8;
  }
  v5 = *a2;
  v6 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_8:
  v7 = *((_QWORD *)a2 + 8);
  if (*(_QWORD *)(a1 + 64))
  {
    if (v7)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  }
  else if (v7)
  {
    *(_QWORD *)(a1 + 64) = v7;
    *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, (uint64_t)a2 + 40);
    goto LABEL_15;
  }
  v8 = *(__int128 *)((char *)a2 + 40);
  v9 = *(__int128 *)((char *)a2 + 56);
  *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
  *(_OWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 56) = v9;
LABEL_15:
  v10 = *((_QWORD *)a2 + 13);
  if (*(_QWORD *)(a1 + 104))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
      goto LABEL_22;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 80);
  }
  else if (v10)
  {
    *(_QWORD *)(a1 + 104) = v10;
    *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 80, (uint64_t)(a2 + 5));
    goto LABEL_22;
  }
  v11 = a2[5];
  v12 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v11;
  *(_OWORD *)(a1 + 96) = v12;
LABEL_22:
  v13 = *((_QWORD *)a2 + 18);
  if (*(_QWORD *)(a1 + 144))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
      goto LABEL_29;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 120);
  }
  else if (v13)
  {
    *(_QWORD *)(a1 + 144) = v13;
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 120, (uint64_t)a2 + 120);
    goto LABEL_29;
  }
  v14 = *(__int128 *)((char *)a2 + 120);
  v15 = *(__int128 *)((char *)a2 + 136);
  *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
  *(_OWORD *)(a1 + 120) = v14;
  *(_OWORD *)(a1 + 136) = v15;
LABEL_29:
  v16 = *((_QWORD *)a2 + 23);
  if (*(_QWORD *)(a1 + 184))
  {
    if (v16)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)a2 + 20);
      goto LABEL_36;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 160);
  }
  else if (v16)
  {
    *(_QWORD *)(a1 + 184) = v16;
    *(_QWORD *)(a1 + 192) = *((_QWORD *)a2 + 24);
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 160, (uint64_t)(a2 + 10));
    goto LABEL_36;
  }
  v17 = a2[10];
  v18 = a2[11];
  *(_QWORD *)(a1 + 192) = *((_QWORD *)a2 + 24);
  *(_OWORD *)(a1 + 160) = v17;
  *(_OWORD *)(a1 + 176) = v18;
LABEL_36:
  v19 = *((_QWORD *)a2 + 28);
  if (*(_QWORD *)(a1 + 224))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 200), (uint64_t *)a2 + 25);
      goto LABEL_43;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 200);
  }
  else if (v19)
  {
    *(_QWORD *)(a1 + 224) = v19;
    *(_QWORD *)(a1 + 232) = *((_QWORD *)a2 + 29);
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 200, (uint64_t)a2 + 200);
    goto LABEL_43;
  }
  v20 = *(__int128 *)((char *)a2 + 200);
  v21 = *(__int128 *)((char *)a2 + 216);
  *(_QWORD *)(a1 + 232) = *((_QWORD *)a2 + 29);
  *(_OWORD *)(a1 + 200) = v20;
  *(_OWORD *)(a1 + 216) = v21;
LABEL_43:
  v22 = *((_QWORD *)a2 + 33);
  if (!*(_QWORD *)(a1 + 264))
  {
    if (v22)
    {
      *(_QWORD *)(a1 + 264) = v22;
      *(_QWORD *)(a1 + 272) = *((_QWORD *)a2 + 34);
      (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 240, (uint64_t)(a2 + 15));
      return a1;
    }
LABEL_49:
    v23 = a2[15];
    v24 = a2[16];
    *(_QWORD *)(a1 + 272) = *((_QWORD *)a2 + 34);
    *(_OWORD *)(a1 + 240) = v23;
    *(_OWORD *)(a1 + 256) = v24;
    return a1;
  }
  if (!v22)
  {
    __swift_destroy_boxed_opaque_existential_0(a1 + 240);
    goto LABEL_49;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)a2 + 30);
  return a1;
}

void *__swift_memcpy280_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x118uLL);
}

uint64_t assignWithTake for FlowConfigModel(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 64))
    __swift_destroy_boxed_opaque_existential_0(a1 + 40);
  v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 104))
    __swift_destroy_boxed_opaque_existential_0(a1 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 144))
    __swift_destroy_boxed_opaque_existential_0(a1 + 120);
  v7 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v7;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  if (*(_QWORD *)(a1 + 184))
    __swift_destroy_boxed_opaque_existential_0(a1 + 160);
  v8 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v8;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  if (*(_QWORD *)(a1 + 224))
    __swift_destroy_boxed_opaque_existential_0(a1 + 200);
  v9 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = v9;
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  if (*(_QWORD *)(a1 + 264))
    __swift_destroy_boxed_opaque_existential_0(a1 + 240);
  v10 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v10;
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlowConfigModel(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 280))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FlowConfigModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
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
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 280) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 280) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FlowConfigModel()
{
  return &type metadata for FlowConfigModel;
}

uint64_t static UsoEntity_common_WorkoutGoal.builder(definedValue:measurement:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21D94C6A0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C9C4();
  swift_allocObject();
  v11 = sub_21D94C9B8();
  sub_21D9349A4(a1, (uint64_t)v6, &qword_25538EE40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_21D930660((uint64_t)v6, &qword_25538EE40);
    if (!a2)
      return v11;
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  sub_21D94C9AC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (a2)
  {
LABEL_5:
    swift_retain();
    sub_21D94C8EC();
    swift_release();
  }
  return v11;
}

uint64_t static UsoEntity_common_WorkoutGoal.builder(definedValue:unitType:value:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_21D9357A8(a1, a2, a3, a4 & 1);
}

uint64_t static UsoEntity_common_WorkoutGoal.with(definedValue:measurement:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v13[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21D94C6A0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C9C4();
  swift_allocObject();
  v11 = sub_21D94C9B8();
  sub_21D9349A4(a1, (uint64_t)v6, &qword_25538EE40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_21D930660((uint64_t)v6, &qword_25538EE40);
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  sub_21D94C9AC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (a2)
  {
LABEL_5:
    swift_retain();
    sub_21D94C8EC();
    swift_release();
  }
LABEL_6:
  MEMORY[0x220794594](v11);
  sub_21D94C6AC();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v13[1];
}

uint64_t sub_21D9357A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  int v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  char *v30;

  v28 = a4;
  v27 = a3;
  v29 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v26 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - v8;
  v10 = sub_21D94C8BC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v30 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21D94C6A0();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C9C4();
  swift_allocObject();
  v20 = sub_21D94C9B8();
  sub_21D9349A4(a1, (uint64_t)v15, &qword_25538EE40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_21D930660((uint64_t)v15, &qword_25538EE40);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
    sub_21D94C9AC();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
  sub_21D9349A4(v29, (uint64_t)v9, &qword_25538EE38);
  v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  v22 = v30;
  if (v21 == 1)
  {
    sub_21D930660((uint64_t)v9, &qword_25538EE38);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v30, v9, v10);
    if ((v28 & 1) == 0)
    {
      v23 = (uint64_t)v26;
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v26, v22, v10);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
      sub_21D941470(v23, v27, 0);
      sub_21D930660(v23, &qword_25538EE38);
      swift_retain();
      sub_21D94C8EC();
      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v22, v10);
  }
  return v20;
}

uint64_t static UsoEntity_common_MeasurementComponent.builder(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_21D94CC28();
  swift_allocObject();
  v5 = sub_21D94CC1C();
  if (a1)
  {
    swift_retain();
    sub_21D94C7FC();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  return v5;
}

uint64_t static UsoEntity_common_MeasurementComponent.builder(unitType:value:)(uint64_t a1, uint64_t a2, char a3)
{
  return sub_21D935BE8(a1, a2, a3 & 1);
}

uint64_t static UsoEntity_common_MeasurementComponent.with(unit:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v7;

  sub_21D94CC28();
  swift_allocObject();
  v5 = sub_21D94CC1C();
  if (a1)
  {
    swift_retain();
    sub_21D94C7FC();
    swift_release();
  }
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  MEMORY[0x220794594](v5);
  sub_21D94CAB4();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v7;
}

uint64_t sub_21D935BE8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  int v26;

  v26 = a3;
  v25 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v23 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v23 - v11;
  v13 = sub_21D94C8BC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v23 - v18;
  sub_21D94CC28();
  swift_allocObject();
  v20 = sub_21D94CC1C();
  sub_21D935EA8(a1, (uint64_t)v12);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v21(v12, 1, v13) == 1)
  {
    sub_21D935EF0((uint64_t)v12);
    if ((v26 & 1) != 0)
      return v20;
    goto LABEL_8;
  }
  v24 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v24(v19, v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v10, v19, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
  sub_21D94CB38();
  swift_allocObject();
  sub_21D94CB2C();
  sub_21D935EA8((uint64_t)v10, (uint64_t)v7);
  if (v21(v7, 1, v13) == 1)
  {
    sub_21D935EF0((uint64_t)v7);
  }
  else
  {
    v24(v17, v7, v13);
    sub_21D94C880();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  sub_21D935EF0((uint64_t)v10);
  swift_retain();
  sub_21D94C7FC();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  if ((v26 & 1) == 0)
  {
LABEL_8:
    sub_21D94C7F0();
    swift_allocObject();
    sub_21D94C7E4();
    sub_21D94C7CC();
    sub_21D94C808();
    swift_release();
  }
  return v20;
}

uint64_t sub_21D935EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D935EF0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static UsoEntity_common_GeographicArea.with(areaType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  _s12SiriOntology31UsoEntity_common_GeographicAreaC18HealthDomainsToolsE7builder8areaTypeAA0cd8Builder_e1_fG0CSSSg_tFZ_0(a1, a2);
  MEMORY[0x220794594]();
  sub_21D94C844();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v3;
}

uint64_t _s12SiriOntology31UsoEntity_common_GeographicAreaC18HealthDomainsToolsE7builder8areaTypeAA0cd8Builder_e1_fG0CSSSg_tFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v4 = sub_21D94C4E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94CACC();
  swift_allocObject();
  v8 = sub_21D94CAC0();
  if (a2)
  {
    sub_21D94C610();
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    v9 = MEMORY[0x2207945C4](a1, a2);
    sub_21D94C4C0();
    sub_21D94C490();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v11[1] = v9;
    sub_21D94C4FC();
    swift_release();
  }
  return v8;
}

uint64_t static UsoEntity_common_MeasurementUnit.builder(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21D94C8BC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94CB38();
  swift_allocObject();
  v15 = sub_21D94CB2C();
  if (a2)
    sub_21D94C79C();
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  sub_21D935EA8(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_21D935EF0((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_21D94C880();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

uint64_t static UsoEntity_common_MeasurementUnit.with(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v17[2];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21D94C8BC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94CB38();
  swift_allocObject();
  v15 = sub_21D94CB2C();
  if (a2)
    sub_21D94C79C();
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  sub_21D935EA8(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_21D935EF0((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_21D94C880();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  MEMORY[0x220794594](v15);
  sub_21D94C8C8();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v17[1];
}

uint64_t currentIdiom(deviceState:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  char v11;
  unsigned int *v12;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_21D94C1FC() & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BEA8968];
LABEL_13:
    v5 = *v4;
    v6 = sub_21D94CCB8();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104);
    v8 = a2;
    v9 = v5;
    return v7(v8, v9, v6);
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_21D94C208() & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BEA8998];
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_21D94C1C0() & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BEA8970];
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_21D94C1CC() & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BEA8978];
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_21D94C1D8() & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BEA8988];
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_21D94C1F0() & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BEA8960];
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = sub_21D94C1E4();
  v6 = sub_21D94CCB8();
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104);
  if ((v11 & 1) != 0)
    v12 = (unsigned int *)MEMORY[0x24BEA8990];
  else
    v12 = (unsigned int *)MEMORY[0x24BEA89A8];
  v9 = *v12;
  v8 = a2;
  return v7(v8, v9, v6);
}

uint64_t static UsoEntity_common_Duration.builder(durationComponent:)(uint64_t a1)
{
  uint64_t v2;

  sub_21D94C874();
  swift_allocObject();
  v2 = sub_21D94C868();
  if (a1)
  {
    swift_retain();
    sub_21D94C730();
    swift_release();
  }
  return v2;
}

uint64_t static UsoEntity_common_Duration.with(durationComponent:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  sub_21D94C874();
  swift_allocObject();
  v2 = sub_21D94C868();
  if (a1)
  {
    swift_retain();
    sub_21D94C730();
    swift_release();
  }
  MEMORY[0x220794594](v2);
  sub_21D94C5E0();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v4;
}

uint64_t static UsoEntity_common_TimeUnit.builder(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF78);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21D94C5EC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C8B0();
  swift_allocObject();
  v15 = sub_21D94C8A4();
  if (a2)
    sub_21D94C79C();
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  sub_21D936850(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_21D936898((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_21D94C880();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

uint64_t sub_21D936850(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D936898(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static UsoEntity_common_TimeUnit.with(name:type:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v17[2];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF78);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21D94C5EC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C8B0();
  swift_allocObject();
  v15 = sub_21D94C8A4();
  if (a2)
    sub_21D94C79C();
  if (a3)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  sub_21D936850(a5, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_21D936898((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_21D94C880();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  MEMORY[0x220794594](v15);
  sub_21D94C5F8();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v17[1];
}

uint64_t Logger.common.unsafeMutableAddressor()
{
  return sub_21D936ABC(&qword_25538EA88, (uint64_t)static Logger.common);
}

uint64_t Logger.wellness.unsafeMutableAddressor()
{
  return sub_21D936ABC(&qword_25538EA68, (uint64_t)static Logger.wellness);
}

uint64_t sub_21D936ABC(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_21D94CEBC();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_21D936AFC()
{
  uint64_t result;

  sub_21D9377D8();
  result = sub_21D94D060();
  static Log.health = result;
  return result;
}

uint64_t *Log.health.unsafeMutableAddressor()
{
  if (qword_25538EA40 != -1)
    swift_once();
  return &static Log.health;
}

id static Log.health.getter()
{
  return sub_21D936EC4(&qword_25538EA40, (id *)&static Log.health);
}

uint64_t sub_21D936BB8()
{
  uint64_t result;

  sub_21D9377D8();
  result = sub_21D94D060();
  static Log.workout = result;
  return result;
}

uint64_t *Log.workout.unsafeMutableAddressor()
{
  if (qword_25538EA48 != -1)
    swift_once();
  return &static Log.workout;
}

id static Log.workout.getter()
{
  return sub_21D936EC4(&qword_25538EA48, (id *)&static Log.workout);
}

uint64_t sub_21D936C78()
{
  uint64_t result;

  sub_21D9377D8();
  result = sub_21D94D060();
  static Log.wellness = result;
  return result;
}

uint64_t *Log.wellness.unsafeMutableAddressor()
{
  if (qword_25538EA50 != -1)
    swift_once();
  return &static Log.wellness;
}

id static Log.wellness.getter()
{
  return sub_21D936EC4(&qword_25538EA50, (id *)&static Log.wellness);
}

uint64_t sub_21D936D38()
{
  uint64_t result;

  sub_21D9377D8();
  result = sub_21D94D060();
  static Log.emergency = result;
  return result;
}

uint64_t *Log.emergency.unsafeMutableAddressor()
{
  if (qword_25538EA58 != -1)
    swift_once();
  return &static Log.emergency;
}

id static Log.emergency.getter()
{
  return sub_21D936EC4(&qword_25538EA58, (id *)&static Log.emergency);
}

uint64_t sub_21D936DFC()
{
  uint64_t result;

  sub_21D9377D8();
  result = sub_21D94D060();
  static Log.common = result;
  return result;
}

uint64_t *Log.common.unsafeMutableAddressor()
{
  if (qword_25538EA60 != -1)
    swift_once();
  return &static Log.common;
}

id static Log.common.getter()
{
  return sub_21D936EC4(&qword_25538EA60, (id *)&static Log.common);
}

id sub_21D936EC4(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t sub_21D936EFC(uint64_t a1)
{
  return sub_21D9373F0(a1, static Logger.wellness, &qword_25538EA50, (id *)&static Log.wellness);
}

uint64_t static Logger.wellness.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21D93702C(&qword_25538EA68, (uint64_t)static Logger.wellness, a1);
}

uint64_t static Logger.wellness.setter(uint64_t a1)
{
  return sub_21D9370D0(a1, &qword_25538EA68, (uint64_t)static Logger.wellness);
}

uint64_t (*static Logger.wellness.modify())()
{
  uint64_t v0;

  if (qword_25538EA68 != -1)
    swift_once();
  v0 = sub_21D94CEBC();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21D936FD0(uint64_t a1)
{
  return sub_21D9373F0(a1, static Logger.health, &qword_25538EA40, (id *)&static Log.health);
}

uint64_t Logger.health.unsafeMutableAddressor()
{
  return sub_21D936ABC(&qword_25538EA70, (uint64_t)static Logger.health);
}

uint64_t static Logger.health.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21D93702C(&qword_25538EA70, (uint64_t)static Logger.health, a1);
}

uint64_t sub_21D93702C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_21D94CEBC();
  v6 = __swift_project_value_buffer(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t static Logger.health.setter(uint64_t a1)
{
  return sub_21D9370D0(a1, &qword_25538EA70, (uint64_t)static Logger.health);
}

uint64_t sub_21D9370D0(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*a2 != -1)
    swift_once();
  v5 = sub_21D94CEBC();
  v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*static Logger.health.modify())()
{
  uint64_t v0;

  if (qword_25538EA70 != -1)
    swift_once();
  v0 = sub_21D94CEBC();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.health);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21D9371EC(uint64_t a1)
{
  return sub_21D9373F0(a1, static Logger.emergency, &qword_25538EA58, (id *)&static Log.emergency);
}

uint64_t Logger.emergency.unsafeMutableAddressor()
{
  return sub_21D936ABC(&qword_25538EA78, (uint64_t)static Logger.emergency);
}

uint64_t static Logger.emergency.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21D93702C(&qword_25538EA78, (uint64_t)static Logger.emergency, a1);
}

uint64_t static Logger.emergency.setter(uint64_t a1)
{
  return sub_21D9370D0(a1, &qword_25538EA78, (uint64_t)static Logger.emergency);
}

uint64_t (*static Logger.emergency.modify())()
{
  uint64_t v0;

  if (qword_25538EA78 != -1)
    swift_once();
  v0 = sub_21D94CEBC();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.emergency);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21D9372DC(uint64_t a1)
{
  return sub_21D9373F0(a1, static Logger.workout, &qword_25538EA48, (id *)&static Log.workout);
}

uint64_t Logger.workout.unsafeMutableAddressor()
{
  return sub_21D936ABC(&qword_25538EA80, (uint64_t)static Logger.workout);
}

uint64_t static Logger.workout.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21D93702C(&qword_25538EA80, (uint64_t)static Logger.workout, a1);
}

uint64_t static Logger.workout.setter(uint64_t a1)
{
  return sub_21D9370D0(a1, &qword_25538EA80, (uint64_t)static Logger.workout);
}

uint64_t (*static Logger.workout.modify())()
{
  uint64_t v0;

  if (qword_25538EA80 != -1)
    swift_once();
  v0 = sub_21D94CEBC();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.workout);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21D9373CC(uint64_t a1)
{
  return sub_21D9373F0(a1, static Logger.common, &qword_25538EA60, (id *)&static Log.common);
}

uint64_t sub_21D9373F0(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4)
{
  uint64_t v7;
  id v8;

  v7 = sub_21D94CEBC();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v8 = *a4;
  return sub_21D94CEC8();
}

uint64_t static Logger.common.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21D93702C(&qword_25538EA88, (uint64_t)static Logger.common, a1);
}

uint64_t static Logger.common.setter(uint64_t a1)
{
  return sub_21D9370D0(a1, &qword_25538EA88, (uint64_t)static Logger.common);
}

uint64_t (*static Logger.common.modify())()
{
  uint64_t v0;

  if (qword_25538EA88 != -1)
    swift_once();
  v0 = sub_21D94CEBC();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21D937528(uint64_t a1)
{
  return sub_21D937640(a1, static Logger.cycleTracking);
}

uint64_t Logger.cycleTracking.unsafeMutableAddressor()
{
  return sub_21D936ABC(&qword_25538EA90, (uint64_t)static Logger.cycleTracking);
}

uint64_t static Logger.cycleTracking.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21D93702C(&qword_25538EA90, (uint64_t)static Logger.cycleTracking, a1);
}

uint64_t static Logger.cycleTracking.setter(uint64_t a1)
{
  return sub_21D9370D0(a1, &qword_25538EA90, (uint64_t)static Logger.cycleTracking);
}

uint64_t (*static Logger.cycleTracking.modify())()
{
  uint64_t v0;

  if (qword_25538EA90 != -1)
    swift_once();
  v0 = sub_21D94CEBC();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.cycleTracking);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_21D937624(uint64_t a1)
{
  return sub_21D937640(a1, static Logger.sleep);
}

uint64_t sub_21D937640(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21D94CEBC();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21D94CEB0();
}

uint64_t Logger.sleep.unsafeMutableAddressor()
{
  return sub_21D936ABC(&qword_25538EA98, (uint64_t)static Logger.sleep);
}

uint64_t static Logger.sleep.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21D93702C(&qword_25538EA98, (uint64_t)static Logger.sleep, a1);
}

uint64_t static Logger.sleep.setter(uint64_t a1)
{
  return sub_21D9370D0(a1, &qword_25538EA98, (uint64_t)static Logger.sleep);
}

uint64_t (*static Logger.sleep.modify())()
{
  uint64_t v0;

  if (qword_25538EA98 != -1)
    swift_once();
  v0 = sub_21D94CEBC();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.sleep);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
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

unint64_t sub_21D9377D8()
{
  unint64_t result;

  result = qword_25538EF80;
  if (!qword_25538EF80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25538EF80);
  }
  return result;
}

uint64_t static UsoEntity_common_MeasurementUnitType.builder(definedValue:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF88);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21D94CA60();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94CBF8();
  swift_allocObject();
  v9 = sub_21D94CBEC();
  sub_21D93793C(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_21D937984((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_21D94CBE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_21D93793C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D937984(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static UsoEntity_common_MeasurementUnitType.with(definedValue:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF88);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21D94CA60();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94CBF8();
  swift_allocObject();
  v9 = sub_21D94CBEC();
  sub_21D93793C(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_21D937984((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_21D94CBE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  MEMORY[0x220794594](v9);
  sub_21D94CA6C();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v11[1];
}

uint64_t UsoEntity_common_Number.asDouble.getter()
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
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t result;
  uint64_t v21;
  char v22;
  double v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  _BYTE *v42;
  char v43;
  void (*v44)(_BYTE *, uint64_t);
  double v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unsigned __int8 *v57;
  _BYTE v58[4];
  int v59;
  _BYTE *v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  _BYTE *v65;
  _BYTE *v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[3];

  v1 = v0;
  v2 = sub_21D94CEBC();
  v68 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v67 = &v58[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_21D94C574();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v64 = &v58[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF90);
  MEMORY[0x24BDAC7A8](v7);
  v66 = &v58[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF98);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v65 = &v58[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = &v58[-v13];
  MEMORY[0x24BDAC7A8](v12);
  v16 = &v58[-v15];
  sub_21D94C4A8();
  sub_21D94C5A4();
  sub_21D94C640();
  swift_release();
  if (v71[0])
  {
    v17 = sub_21D94C598();
    v19 = v18;
    swift_release();
    if ((v19 & 1) == 0)
    {
      *(double *)&result = (double)v17;
      return result;
    }
  }
  sub_21D94C4A8();
  sub_21D94C778();
  sub_21D94C640();
  swift_release();
  if (v71[0])
  {
    v21 = sub_21D94C754();
    if ((v22 & 1) != 0)
      v23 = 0.0;
    else
      v23 = (double)v21;
    v24 = sub_21D94C760();
    if ((v25 & 1) != 0)
    {
      swift_release();
    }
    else
    {
      v26 = v24;
      v27 = sub_21D94C76C();
      v29 = v28;
      swift_release();
      if ((v29 & 1) == 0)
      {
        *(double *)&result = v23 + (double)v26 / (double)v27;
        return result;
      }
    }
    goto LABEL_47;
  }
  v63 = v2;
  sub_21D94C4A8();
  v62 = sub_21D94C58C();
  sub_21D94C640();
  swift_release();
  if (!v71[0])
    goto LABEL_25;
  v30 = sub_21D94C580();
  if (!v31)
  {
    swift_release();
    goto LABEL_25;
  }
  v32 = v31;
  v70 = 0;
  MEMORY[0x24BDAC7A8](v30);
  *(_QWORD *)&v58[-16] = &v70;
  if ((v34 & 0x1000000000000000) != 0 || !(v32 & 0x2000000000000000 | v33 & 0x1000000000000000))
  {
    sub_21D94D0B4();
    swift_release();
    swift_bridgeObjectRelease();
    if ((v69 & 1) == 0)
      goto LABEL_25;
    return v70;
  }
  if ((v32 & 0x2000000000000000) == 0)
  {
    v60 = v58;
    v61 = v58;
    if ((v33 & 0x1000000000000000) != 0)
      v35 = (_BYTE *)((v32 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v35 = (_BYTE *)sub_21D94D0F0();
    sub_21D938490(v35, (BOOL *)v71);
    v36 = v71[0];
    swift_release();
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
      return v70;
    goto LABEL_25;
  }
  v71[0] = v33;
  v71[1] = v32 & 0xFFFFFFFFFFFFFFLL;
  if (v33 <= 0x20u && ((1 << v33) & 0x100003E01) != 0
    || (v57 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v59 = *v57;
  swift_release();
  swift_bridgeObjectRelease();
  if (!v59)
    return v70;
LABEL_25:
  sub_21D94C4A8();
  sub_21D94C928();
  sub_21D94C640();
  swift_release();
  v37 = v63;
  if (v71[0])
  {
    if (sub_21D94C910())
    {
      sub_21D94C4A8();
      swift_release();
    }
    sub_21D94C640();
    swift_release();
    if (!v71[0])
      goto LABEL_41;
    v62 = v71[0];
    sub_21D94C568();
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v14, *MEMORY[0x24BEA0558], v4);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
    v38 = *(int *)(v7 + 48);
    v39 = v66;
    v40 = (uint64_t)&v66[v38];
    sub_21D938400((uint64_t)v16, (uint64_t)v66);
    sub_21D938400((uint64_t)v14, v40);
    v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    if (v41((uint64_t)v39, 1, v4) == 1)
    {
      sub_21D930660((uint64_t)v14, &qword_25538EF98);
      v39 = v66;
      sub_21D930660((uint64_t)v16, &qword_25538EF98);
      if (v41(v40, 1, v4) == 1)
      {
        sub_21D930660((uint64_t)v39, &qword_25538EF98);
        goto LABEL_37;
      }
    }
    else
    {
      sub_21D938400((uint64_t)v39, (uint64_t)v65);
      if (v41(v40, 1, v4) != 1)
      {
        v42 = v64;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 32))(v64, v40, v4);
        sub_21D938448();
        v43 = sub_21D94CF1C();
        v44 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
        v44(v42, v4);
        sub_21D930660((uint64_t)v14, &qword_25538EF98);
        sub_21D930660((uint64_t)v16, &qword_25538EF98);
        v44(v65, v4);
        sub_21D930660((uint64_t)v39, &qword_25538EF98);
        if ((v43 & 1) != 0)
        {
LABEL_37:
          if (sub_21D94C5B0())
          {
            v45 = COERCE_DOUBLE(UsoEntity_common_Number.asDouble.getter());
            v47 = v46;
            swift_release();
            swift_release();
            swift_release();
            if ((v47 & 1) == 0)
            {
              *(double *)&result = v45 / 100.0;
              return result;
            }
            goto LABEL_42;
          }
        }
LABEL_40:
        swift_release();
LABEL_41:
        swift_release();
        goto LABEL_42;
      }
      sub_21D930660((uint64_t)v14, &qword_25538EF98);
      sub_21D930660((uint64_t)v16, &qword_25538EF98);
      (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v65, v4);
    }
    sub_21D930660((uint64_t)v39, &qword_25538EF90);
    goto LABEL_40;
  }
LABEL_42:
  if (qword_25538EA88 != -1)
    swift_once();
  v48 = __swift_project_value_buffer(v37, (uint64_t)static Logger.common);
  swift_beginAccess();
  v50 = v67;
  v49 = v68;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v68 + 16))(v67, v48, v37);
  swift_retain_n();
  v51 = sub_21D94CEA4();
  v52 = sub_21D94D018();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    v69 = v1;
    v70 = v54;
    *(_DWORD *)v53 = 136315138;
    sub_21D94C550();
    swift_retain();
    v55 = sub_21D94CF40();
    v69 = sub_21D930010(v55, v56, &v70);
    sub_21D94D078();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21D92C000, v51, v52, "UsoEntityCommonNumber#asDouble got unexpected number entityType %s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v54, -1, -1);
    MEMORY[0x2207955E4](v53, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v68 + 8))(v67, v37);
    *(double *)&result = 0.0;
    return result;
  }

  swift_release_n();
  (*(void (**)(_BYTE *, uint64_t))(v49 + 8))(v50, v37);
LABEL_47:
  *(double *)&result = 0.0;
  return result;
}

uint64_t sub_21D938400(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21D938448()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25538EFA0;
  if (!qword_25538EFA0)
  {
    v1 = sub_21D94C574();
    result = MEMORY[0x220795560](MEMORY[0x24BEA0578], v1);
    atomic_store(result, (unint64_t *)&qword_25538EFA0);
  }
  return result;
}

_BYTE *sub_21D938490@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t FlowFinder.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FlowFinder.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FlowFinder()
{
  return objc_opt_self();
}

uint64_t static UsoEntity_common_WorkoutClass.builder(name:duration:equipment:instructor:episodeNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;

  sub_21D94CA54();
  swift_allocObject();
  v13 = sub_21D94CA48();
  if (a2)
    sub_21D94C730();
  if (a3)
  {
    swift_retain();
    sub_21D94CA0C();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_21D94C79C();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_21D94C8E0();
    swift_release();
  }
  if (a9)
  {
    swift_retain();
    sub_21D94CA30();
    swift_release();
  }
  return v13;
}

uint64_t static UsoEntity_common_WorkoutClass.with(name:duration:equipment:instructor:episodeNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13;
  uint64_t v15;

  sub_21D94CA54();
  swift_allocObject();
  v13 = sub_21D94CA48();
  if (a2)
    sub_21D94C730();
  if (a3)
  {
    swift_retain();
    sub_21D94CA0C();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_21D94C79C();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_21D94C8E0();
    swift_release();
  }
  if (a9)
  {
    swift_retain();
    sub_21D94CA30();
    swift_release();
  }
  MEMORY[0x220794594](v13);
  sub_21D94C6D0();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v15;
}

Swift::String __swiftcall String.firstLetterCapitalized()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = sub_21D93879C(v0, v1, MEMORY[0x24BEE1D60]);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

Swift::String __swiftcall String.firstLetterLowerCase()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  Swift::String result;

  v2 = sub_21D93879C(v0, v1, MEMORY[0x24BEE1D50]);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_21D93879C(uint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRetain();
  v6 = sub_21D93892C(1);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = a3(v6, v8, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21D9389B4(1uLL, a1, a2);
  swift_bridgeObjectRelease();
  sub_21D938A50();
  swift_bridgeObjectRetain();
  sub_21D94CF70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t String.toDialogPhoneNumber.getter()
{
  uint64_t v0;

  sub_21D94CD18();
  swift_allocObject();
  sub_21D94CD0C();
  sub_21D94CD00();
  swift_release();
  v0 = sub_21D94CCF4();
  swift_release();
  return v0;
}

uint64_t sub_21D93892C(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21D94CF64();
    return sub_21D94CF94();
  }
  return result;
}

unint64_t sub_21D9389B4(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_21D94CF64();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_21D94CF94();
  }
  __break(1u);
  return result;
}

unint64_t sub_21D938A50()
{
  unint64_t result;

  result = qword_25538F048;
  if (!qword_25538F048)
  {
    result = MEMORY[0x220795560](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_25538F048);
  }
  return result;
}

uint64_t TaskLoggerNames.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21D938AD4 + 4 * byte_21D94D910[a1]))(0xD00000000000001CLL, 0x800000021D94E600);
}

uint64_t sub_21D938AD4()
{
  uint64_t v0;

  return v0 + 8;
}

void sub_21D938B38(char *a1)
{
  sub_21D938C44(*a1);
}

uint64_t sub_21D938B44(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 6778732;
    else
      v3 = 0x7972657571;
    if (v2 == 1)
      v4 = 0xE300000000000000;
    else
      v4 = 0xE500000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 6778732;
      else
        v6 = 0x7972657571;
      if (v5 == 1)
        v7 = 0xE300000000000000;
      else
        v7 = 0xE500000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE700000000000000;
    v3 = 0x6E776F6E6B6E75;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    v8 = sub_21D94D1EC();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_21D938C44(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_21D938C90(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_21D938D14 + 4 * byte_21D94D91C[a2]))(v2 + 8);
}

uint64_t sub_21D938D14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 + 8 && v2 == 0x800000021D94E620)
    v3 = 1;
  else
    v3 = sub_21D94D1EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_21D938DC8()
{
  char *v0;

  sub_21D938DD0(*v0);
}

void sub_21D938DD0(char a1)
{
  sub_21D94D24C();
  __asm { BR              X10 }
}

uint64_t sub_21D938E2C()
{
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

void sub_21D938EBC(uint64_t a1)
{
  char *v1;

  sub_21D938EC4(a1, *v1);
}

void sub_21D938EC4(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21D938F0C()
{
  sub_21D94CF58();
  return swift_bridgeObjectRelease();
}

void sub_21D938F84(uint64_t a1)
{
  char *v1;

  sub_21D938F8C(a1, *v1);
}

void sub_21D938F8C(uint64_t a1, char a2)
{
  sub_21D94D24C();
  __asm { BR              X10 }
}

uint64_t sub_21D938FE4()
{
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D939074@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18HealthDomainsTools15TaskLoggerNamesO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21D9390A0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = TaskLoggerNames.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t FederatedTaskKind.rawValue.getter(char a1)
{
  if (!a1)
    return 0x6E776F6E6B6E75;
  if (a1 == 1)
    return 6778732;
  return 0x7972657571;
}

uint64_t sub_21D939118(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21D938B44(*a1, *a2);
}

uint64_t sub_21D939124()
{
  sub_21D94D24C();
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D9391B8()
{
  sub_21D94CF58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D939228()
{
  sub_21D94D24C();
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D9392B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18HealthDomainsTools17FederatedTaskKindO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_21D9392E4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE700000000000000;
  v4 = 0xE300000000000000;
  v5 = 6778732;
  if (v2 != 1)
  {
    v5 = 0x7972657571;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E776F6E6B6E75;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

HealthDomainsTools::FlowTaskLogger __swiftcall FlowTaskLogger.init()()
{
  return 0;
}

Swift::Void __swiftcall FlowTaskLogger.taskStart()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D93938C@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(1, a1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

void FlowTaskLogger.task(_:)(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21D939468(int a1)
{
  uint64_t v1;

  sub_21D93A5C8(a1, v1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskCanceled()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D93953C@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(5, a1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskNeedsAuthorization()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939614@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(7, a1 + 8, 0x800000021D94E620, 3);
  return swift_bridgeObjectRelease();
}

uint64_t FlowTaskLogger.task(reason:)(uint64_t result, char a2)
{
  switch((int)result)
  {
    case 1:
      __asm { BR              X11 }
      return result;
    case 3:
      __asm { BR              X11 }
      return result;
    case 21:
      __asm { BR              X11 }
      return result;
    case 36:
      __asm { BR              X11 }
      return result;
    default:
      return result;
  }
}

void sub_21D93980C()
{
  JUMPOUT(0x21D93985CLL);
}

void sub_21D939828()
{
  JUMPOUT(0x21D9399A8);
}

void sub_21D939838()
{
  JUMPOUT(0x21D9399A8);
}

void sub_21D939848()
{
  JUMPOUT(0x21D939854);
}

void sub_21D939874()
{
  JUMPOUT(0x21D9398C4);
}

void sub_21D939890()
{
  JUMPOUT(0x21D9399A8);
}

void sub_21D9398A0()
{
  JUMPOUT(0x21D9399A8);
}

void sub_21D9398B0()
{
  JUMPOUT(0x21D9398BCLL);
}

void sub_21D9398DC()
{
  JUMPOUT(0x21D93992CLL);
}

void sub_21D9398F8()
{
  JUMPOUT(0x21D9399A8);
}

void sub_21D939908()
{
  JUMPOUT(0x21D9399A8);
}

void sub_21D939918()
{
  JUMPOUT(0x21D939924);
}

void sub_21D939944()
{
  JUMPOUT(0x21D939994);
}

uint64_t sub_21D939960()
{
  uint64_t v0;

  sub_21D93A5C8(26, v0 + 4, 0x800000021D94E660, 36);
  return swift_bridgeObjectRelease(0x800000021D94E660);
}

uint64_t sub_21D939970()
{
  uint64_t v0;

  sub_21D93A5C8(26, v0 + 6, 0x800000021D94E680, 36);
  return swift_bridgeObjectRelease(0x800000021D94E680);
}

void sub_21D939980()
{
  JUMPOUT(0x21D93998CLL);
}

Swift::Void __swiftcall FlowTaskLogger.taskCompleted()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939A0C@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(2, a1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskPartial()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939AE4@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(3, a1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskDisambiguate()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939BBC@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(10, a1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskFailed()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939C94@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(4, a1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.genericError()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939D6C@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(4, a1 + 8, 0x800000021D94E620, 21);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.success()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939E44@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(2, a1 + 8, 0x800000021D94E620, 1);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.unsupported()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939F1C@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(26, a1 + 8, 0x800000021D94E620, 36);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall FlowTaskLogger.taskUnsupported()()
{
  __asm { BR              X11 }
}

uint64_t sub_21D939FF4@<X0>(uint64_t a1@<X8>)
{
  sub_21D93A5C8(26, a1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

void FlowTaskLogger.task(_:name:)(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21D93A0D0(int a1)
{
  uint64_t v1;

  sub_21D93A5C8(a1, v1 + 8, 0x800000021D94E620, 0x100000000);
  return swift_bridgeObjectRelease();
}

uint64_t FlowTaskLogger.task(_:name:reason:)(int a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_21D93A5C8(a1, a2, a3, a4 | ((HIDWORD(a4) & 1) << 32));
}

Swift::Void __swiftcall FlowTaskLogger.federatedStats(kind:dataTypeString:)(HealthDomainsTools::FederatedTaskKind kind, Swift::String dataTypeString)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  object = dataTypeString._object;
  countAndFlagsBits = dataTypeString._countAndFlagsBits;
  v4 = kind;
  v5 = sub_21D94CEBC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25538EA68 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  swift_bridgeObjectRetain_n();
  v10 = sub_21D94CEA4();
  v11 = sub_21D94D00C();
  if (os_log_type_enabled(v10, v11))
  {
    v25 = countAndFlagsBits;
    v12 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v27 = v23;
    *(_DWORD *)v12 = 136315394;
    v24 = v4;
    if ((_BYTE)v4)
    {
      if (v4 == 1)
        v13 = 6778732;
      else
        v13 = 0x7972657571;
      if (v4 == 1)
        v14 = 0xE300000000000000;
      else
        v14 = 0xE500000000000000;
    }
    else
    {
      v14 = 0xE700000000000000;
      v13 = 0x6E776F6E6B6E75;
    }
    v26 = sub_21D930010(v13, v14, &v27);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    v26 = sub_21D930010(v25, (unint64_t)object, &v27);
    sub_21D94D078();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21D92C000, v10, v11, "Federated Task Log: %s for %s", (uint8_t *)v12, 0x16u);
    v4 = v23;
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v4, -1, -1);
    MEMORY[0x2207955E4](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    LOBYTE(v4) = v24;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v15 = dword_21D94DB74[(char)v4];
  v16 = objc_allocWithZone(MEMORY[0x24BE0C668]);
  swift_bridgeObjectRetain();
  v17 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_initWithAction_typeIdentifier_, v15, v17);

  v19 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
  swift_unknownObjectRelease();
  v20 = objc_msgSend(v19, sel_Health);
  swift_unknownObjectRelease();
  v21 = objc_msgSend(v20, sel_Federated);
  swift_unknownObjectRelease();
  v22 = objc_msgSend(v21, sel_source);
  objc_msgSend(v22, sel_sendEvent_, v18);

}

uint64_t _s18HealthDomainsTools15TaskLoggerNamesO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21D94D1BC();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t _s18HealthDomainsTools17FederatedTaskKindO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21D94D1BC();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_21D93A5C8(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];

  v25 = a2;
  v7 = sub_21D94CEBC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25538EA68 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v7, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  swift_bridgeObjectRetain_n();
  v12 = sub_21D94CEA4();
  v13 = sub_21D94D00C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v24 = a4;
    v15 = v14;
    v22 = swift_slowAlloc();
    v26 = v22;
    *(_DWORD *)v15 = 136315394;
    v16 = sub_21D94D030();
    v23 = a1;
    v27[0] = sub_21D930010(v16, v17, &v26);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    v27[0] = v25;
    v27[1] = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE48);
    v18 = sub_21D94D06C();
    v27[0] = sub_21D930010(v18, v19, &v26);
    sub_21D94D078();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21D92C000, v12, v13, "logging STC: %s in %s", (uint8_t *)v15, 0x16u);
    v20 = v22;
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v20, -1, -1);
    MEMORY[0x2207955E4](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_21D94C190();
  swift_bridgeObjectRetain();
  sub_21D94C184();
  sub_21D94C154();
  __swift_project_boxed_opaque_existential_1(v27, v27[3]);
  sub_21D94C160();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
}

unint64_t sub_21D93A908()
{
  unint64_t result;

  result = qword_25538F050;
  if (!qword_25538F050)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for TaskLoggerNames, &type metadata for TaskLoggerNames);
    atomic_store(result, (unint64_t *)&qword_25538F050);
  }
  return result;
}

unint64_t sub_21D93A950()
{
  unint64_t result;

  result = qword_25538F058;
  if (!qword_25538F058)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for FederatedTaskKind, &type metadata for FederatedTaskKind);
    atomic_store(result, (unint64_t *)&qword_25538F058);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_21D93A9AC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21D93A9B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskLoggerNames()
{
  return &type metadata for TaskLoggerNames;
}

uint64_t getEnumTagSinglePayload for FederatedTaskKind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FederatedTaskKind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21D93AAA8 + 4 * byte_21D94D9C3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21D93AADC + 4 * byte_21D94D9BE[v4]))();
}

uint64_t sub_21D93AADC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D93AAE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21D93AAECLL);
  return result;
}

uint64_t sub_21D93AAF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21D93AB00);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21D93AB04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D93AB0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FederatedTaskKind()
{
  return &type metadata for FederatedTaskKind;
}

uint64_t _s18HealthDomainsTools15TaskLoggerNamesOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s18HealthDomainsTools15TaskLoggerNamesOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21D93AC04 + 4 * byte_21D94D9CD[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21D93AC38 + 4 * byte_21D94D9C8[v4]))();
}

uint64_t sub_21D93AC38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D93AC40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21D93AC48);
  return result;
}

uint64_t sub_21D93AC54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21D93AC5CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21D93AC60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D93AC68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FlowTaskLogger()
{
  return &type metadata for FlowTaskLogger;
}

uint64_t static UsoEntity_common_ListPosition.builder(definedValue:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21D94C6C4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94CA00();
  swift_allocObject();
  v9 = sub_21D94C9F4();
  sub_21D93ADB0(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_21D93ADF8((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_21D94C880();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_21D93ADB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D93ADF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall NetworkStatusProvider.isNetworkingDisabled()()
{
  char v0;

  if ((_s18HealthDomainsTools21NetworkStatusProviderC9isOfflineSbyF_0() & 1) == 0)
    return 0;
  sub_21D94CCAC();
  sub_21D94CCA0();
  sub_21D94CC94();
  swift_release();
  v0 = sub_21D94CCC4();
  swift_release();
  return v0 & 1;
}

uint64_t NetworkStatusProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NetworkStatusProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_21D93AEBC()
{
  char v0;

  if ((_s18HealthDomainsTools21NetworkStatusProviderC9isOfflineSbyF_0() & 1) == 0)
    return 0;
  sub_21D94CCAC();
  sub_21D94CCA0();
  sub_21D94CC94();
  swift_release();
  v0 = sub_21D94CCC4();
  swift_release();
  return v0 & 1;
}

uint64_t static NetworkErrors.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t NetworkErrors.hash(into:)()
{
  return sub_21D94D258();
}

uint64_t NetworkErrors.hashValue.getter()
{
  sub_21D94D24C();
  sub_21D94D258();
  return sub_21D94D264();
}

uint64_t sub_21D93AF8C()
{
  sub_21D94D24C();
  sub_21D94D258();
  return sub_21D94D264();
}

uint64_t sub_21D93AFCC()
{
  return sub_21D94D258();
}

uint64_t sub_21D93AFF0()
{
  sub_21D94D24C();
  sub_21D94D258();
  return sub_21D94D264();
}

uint64_t _s18HealthDomainsTools21NetworkStatusProviderC9isOfflineSbyF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  _DWORD v18[2];

  v0 = sub_21D94CEBC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21D94CCDC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - v9;
  sub_21D94CCAC();
  sub_21D94CCA0();
  sub_21D94CC94();
  swift_release();
  sub_21D94CCE8();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BEA8D78], v4);
  v11 = sub_21D94CCD0();
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  if (qword_25538EA88 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v13, v0);
  v14 = sub_21D94CEA4();
  v15 = sub_21D94D00C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 67109120;
    v18[1] = v11 & 1;
    sub_21D94D078();
    _os_log_impl(&dword_21D92C000, v14, v15, "NetworkStatusProvider isOffline=%{BOOL}d", v16, 8u);
    MEMORY[0x2207955E4](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v11 & 1;
}

unint64_t sub_21D93B29C()
{
  unint64_t result;

  result = qword_25538F060;
  if (!qword_25538F060)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for NetworkErrors, &type metadata for NetworkErrors);
    atomic_store(result, (unint64_t *)&qword_25538F060);
  }
  return result;
}

uint64_t type metadata accessor for NetworkStatusProvider()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for NetworkErrors(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NetworkErrors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21D93B394 + 4 * byte_21D94DB90[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21D93B3B4 + 4 * byte_21D94DB95[v4]))();
}

_BYTE *sub_21D93B394(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21D93B3B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21D93B3BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21D93B3C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21D93B3CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21D93B3D4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21D93B3E0()
{
  return 0;
}

ValueMetadata *type metadata accessor for NetworkErrors()
{
  return &type metadata for NetworkErrors;
}

uint64_t sub_21D93B3F8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_21D94D138();
    v5 = v4;
    v6 = sub_21D94D174();
    v8 = MEMORY[0x220795110](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      sub_21D93C204(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_21D93C068(v3, v5, v2 != 0, a1);
    v9 = v13;
    sub_21D93C204(v3, v5, v2 != 0);
    return v9;
  }
  result = sub_21D93C210(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t findRemoteDevice(with:deviceResolutionService:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_21D94CCB8();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D93B564()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v6;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v1, *(_QWORD *)(v0 + 16), v3);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x24BEA8988] || v4 == *MEMORY[0x24BEA8990])
  {
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 24), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v6;
    *v6 = v0;
    v6[1] = sub_21D93B748;
    return sub_21D94CE74();
  }
  else if (v4 == *MEMORY[0x24BEA8960])
  {
    v8 = *(_QWORD **)(v0 + 24);
    sub_21D94CE98();
    v9 = (void *)sub_21D94CE8C();
    *(_QWORD *)(v0 + 64) = v9;
    __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F160);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_21D94D760;
    *(_QWORD *)(v10 + 32) = v9;
    v13 = v10;
    sub_21D94CFD0();
    *(_QWORD *)(v0 + 72) = v13;
    v11 = v9;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v12;
    *v12 = v0;
    v12[1] = sub_21D93B7B4;
    return sub_21D94CE80();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_21D93B748(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {

    a1 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_21D93B7B4(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)

  else
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_21D93B834()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 64);
  v2 = sub_21D93B3F8(*(_QWORD *)(v0 + 88));

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_21D93B890()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t isRemoteDeviceReachable(remoteDevice:aceService:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = a2;
  v3 = sub_21D94CEBC();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D93B954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;

  if (qword_25538EA80 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = __swift_project_value_buffer(v2, (uint64_t)static Logger.workout);
  *(_QWORD *)(v0 + 120) = v4;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 128) = v5;
  v5(v1, v4, v2);
  v6 = sub_21D94CEA4();
  v7 = sub_21D94D00C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21D92C000, v6, v7, "Checking to see if remote device is reachable", v8, 2u);
    MEMORY[0x2207955E4](v8, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 112);
  v10 = *(_QWORD *)(v0 + 72);
  v11 = *(_QWORD *)(v0 + 80);

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(_QWORD *)(v0 + 136) = v12;
  v12(v9, v10);
  v13 = sub_21D94CE5C();
  v15 = v14;
  swift_bridgeObjectRelease();
  v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v16 = v13 & 0xFFFFFFFFFFFFLL;
  if (v16)
  {
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 64), *(_QWORD *)(*(_QWORD *)(v0 + 64) + 24));
    *(_QWORD *)(v0 + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE814F0]), sel_init);
    sub_21D94CE5C();
    *(_QWORD *)(v0 + 152) = v17;
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v18;
    sub_21D9313E8();
    *v18 = v0;
    v18[1] = sub_21D93BC28;
    return sub_21D94C2EC();
  }
  else
  {
    v5(*(_QWORD *)(v0 + 96), v4, *(_QWORD *)(v0 + 72));
    v20 = sub_21D94CEA4();
    v21 = sub_21D94D018();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_21D92C000, v20, v21, "The assistantId for remote device was an empty string. Marking the device as unreachable", v22, 2u);
      MEMORY[0x2207955E4](v22, -1, -1);
    }

    (*(void (**)(_QWORD, _QWORD))(v0 + 136))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_21D93BC28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v3 = (_QWORD *)*v2;
  v3[21] = a1;
  v3[22] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    v4 = (void *)v3[18];
    swift_bridgeObjectRelease();

  }
  return swift_task_switch();
}

uint64_t sub_21D93BCA0()
{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  uint8_t *v6;
  id v7;
  NSObject *v8;
  _QWORD *v10;

  v1 = *(void **)(v0 + 168);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 128))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 72));
  v2 = v1;
  v3 = sub_21D94CEA4();
  v4 = sub_21D94D00C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(void **)(v0 + 168);
    v6 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    *(_QWORD *)(v0 + 48) = v5;
    v7 = v5;
    sub_21D94D078();
    *v10 = v5;

    _os_log_impl(&dword_21D92C000, v3, v4, "Pinged remote device and got response: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEF8);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v10, -1, -1);
    MEMORY[0x2207955E4](v6, -1, -1);
    v8 = *(NSObject **)(v0 + 168);
  }
  else
  {

    v8 = *(NSObject **)(v0 + 168);
    v3 = v8;
  }

  (*(void (**)(_QWORD, _QWORD))(v0 + 136))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_21D93BE60()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v1 = *(void **)(v0 + 176);
  v2 = *(void **)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 128);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRelease();

  v4(v5, v3, v6);
  v7 = v1;
  v8 = v1;
  v9 = sub_21D94CEA4();
  v10 = sub_21D94D018();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(void **)(v0 + 176);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v11;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v15;
    sub_21D94D078();
    *v13 = v15;

    _os_log_impl(&dword_21D92C000, v9, v10, "Unable to ping the remote device. Error: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEF8);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v13, -1, -1);
    MEMORY[0x2207955E4](v12, -1, -1);

  }
  else
  {
    v16 = *(void **)(v0 + 176);

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 136))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_21D93C048(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_21D93C068(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  char v7;
  id v8;
  void *v9;

  v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_21D94D144();
      sub_21D94CE68();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
    goto LABEL_10;
  if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a1) & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
LABEL_12:
    v8 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v5);
    return;
  }
  __break(1u);
LABEL_10:
  if (sub_21D94D15C() != *(_DWORD *)(a4 + 36))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_21D94D168();
  sub_21D94CE68();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  v5 = sub_21D944874((uint64_t)v9);
  v7 = v6;

  if ((v7 & 1) != 0)
    goto LABEL_12;
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

uint64_t sub_21D93C204(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_21D93C210(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t static UsoEntity_common_Integer.builder(name:value:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6;

  sub_21D94C7F0();
  swift_allocObject();
  v6 = sub_21D94C7E4();
  if (a2)
    sub_21D94C730();
  if ((a4 & 1) == 0)
    sub_21D94C7CC();
  return v6;
}

uint64_t static UsoEntity_common_Number.with(name:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  _s12SiriOntology23UsoEntity_common_NumberC18HealthDomainsToolsE7builder4name12definedValueAA0cd8Builder_e1_F0CSSSg_AC13DefinedValuesOSgtFZ_0(a1, a2, a3);
  MEMORY[0x220794594]();
  sub_21D94C550();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v4;
}

uint64_t static UsoEntity_common_Integer.with(name:value:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6;
  uint64_t v8;

  sub_21D94C7F0();
  swift_allocObject();
  v6 = sub_21D94C7E4();
  if (a2)
    sub_21D94C730();
  if ((a4 & 1) == 0)
    sub_21D94C7CC();
  MEMORY[0x220794594](v6);
  sub_21D94C5A4();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v8;
}

uint64_t static UsoEntity_common_Decimal.with(name:canonicalString:definedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  _s12SiriOntology24UsoEntity_common_DecimalC18HealthDomainsToolsE7builder4name15canonicalString12definedValueAA0cd8Builder_e1_F0CSSSg_AkC13DefinedValuesOSgtFZ_0(a1, a2, a3, a4, a5);
  MEMORY[0x220794594]();
  sub_21D94C58C();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v6;
}

uint64_t _s12SiriOntology23UsoEntity_common_NumberC18HealthDomainsToolsE7builder4name12definedValueAA0cd8Builder_e1_F0CSSSg_AC13DefinedValuesOSgtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F120);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21D94C544();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C748();
  swift_allocObject();
  v12 = sub_21D94C73C();
  if (a2)
    sub_21D94C730();
  sub_21D9349A4(a3, (uint64_t)v7, &qword_25538F120);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_21D930660((uint64_t)v7, &qword_25538F120);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    sub_21D94C724();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v12;
}

uint64_t _s12SiriOntology24UsoEntity_common_DecimalC18HealthDomainsToolsE7builder4name15canonicalString12definedValueAA0cd8Builder_e1_F0CSSSg_AkC13DefinedValuesOSgtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EF98);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21D94C574();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C7C0();
  swift_allocObject();
  v15 = sub_21D94C7B4();
  if (a2)
    sub_21D94C730();
  if (a4)
    sub_21D94C79C();
  sub_21D9349A4(a5, (uint64_t)v10, &qword_25538EF98);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_21D930660((uint64_t)v10, &qword_25538EF98);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_21D94C790();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

void __swiftcall DirectInvocationButton.init(label:payloadIdentifier:payloadUserData:)(HealthDomainsTools::DirectInvocationButton *__return_ptr retstr, Swift::String label, Swift::String payloadIdentifier, Swift::OpaquePointer payloadUserData)
{
  retstr->label = label;
  retstr->payloadIdentifier = payloadIdentifier;
  retstr->payloadUserData = payloadUserData;
}

uint64_t destroy for DirectInvocationButton()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for DirectInvocationButton(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for DirectInvocationButton(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for DirectInvocationButton(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for DirectInvocationButton(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DirectInvocationButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DirectInvocationButton()
{
  return &type metadata for DirectInvocationButton;
}

uint64_t isFitnessPlusSubscriber()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = sub_21D94CC70();
  v0[7] = v1;
  v0[8] = *(_QWORD *)(v1 - 8);
  v0[9] = swift_task_alloc();
  v2 = sub_21D94C094();
  v0[10] = v2;
  v0[11] = *(_QWORD *)(v2 - 8);
  v0[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D93CA24()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = v0[12];
  v3 = v0[8];
  v2 = v0[9];
  v4 = v0[7];
  sub_21D94C088();
  sub_21D94CC4C();
  sub_21D93CC80();
  sub_21D94D024();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE87648], v4);
  v5 = sub_21D94CC64();
  v6 = MEMORY[0x24BE87608];
  v0[5] = v5;
  v0[6] = v6;
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_21D94CC58();
  sub_21D94CC88();
  swift_allocObject();
  sub_21D94CC7C();
  sub_21D94D024();
  v7 = sub_21D94CC40();
  v0[13] = v7;
  v8 = swift_task_alloc();
  v0[14] = v8;
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[15] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_21D93CBBC;
  return sub_21D94D1E0();
}

uint64_t sub_21D93CBBC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D93CC18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v4 = *(unsigned __int8 *)(v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

unint64_t sub_21D93CC80()
{
  unint64_t result;

  result = qword_25538F130;
  if (!qword_25538F130)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25538F130);
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

uint64_t sub_21D93CCF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint8_t *v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t (*)(), uint64_t);
  uint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v30 = a3;
  v31 = a2;
  v33 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F138);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v32 = v5;
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F140);
  v34 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21D94CEBC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25538EA80 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v10, (uint64_t)static Logger.workout);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  v15 = sub_21D94CEA4();
  v16 = sub_21D94D00C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v29 = v9;
    v18 = v6;
    v19 = v3;
    v20 = v7;
    v21 = v17;
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_21D92C000, v15, v16, "Fetching Fitness+ subscription status", v17, 2u);
    v22 = v21;
    v7 = v20;
    v3 = v19;
    v6 = v18;
    v9 = v29;
    MEMORY[0x2207955E4](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_21D94CC34();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v33, v3);
  v23 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v24 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v24 + v23, v6, v3);
  v25 = (void (*)(uint64_t (*)(), uint64_t))sub_21D94C0A0();
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = sub_21D93D3CC;
  *(_QWORD *)(v26 + 24) = v24;
  swift_retain();
  v25(sub_21D93D438, v26);
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v9, v7);
}

uint64_t sub_21D93CFCC(uint64_t a1)
{
  uint64_t v1;

  return sub_21D93CCF8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_21D93CFD4(uint64_t a1, uint64_t a2)
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
  void **v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v30 = a2;
  v3 = sub_21D94CEBC();
  v29 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v28 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21D94C010();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21D94C07C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F148);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (void **)((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21D93D460(a1, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = *v15;
    if (qword_25538EA80 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v3, (uint64_t)static Logger.workout);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v28, v17, v3);
    v18 = v16;
    v19 = v16;
    v20 = sub_21D94CEA4();
    v21 = sub_21D94D018();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      v24 = v16;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v31 = v25;
      sub_21D94D078();
      *v23 = v25;

      _os_log_impl(&dword_21D92C000, v20, v21, "Error fetching Fitness+ subscription: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEF8);
      swift_arrayDestroy();
      MEMORY[0x2207955E4](v23, -1, -1);
      MEMORY[0x2207955E4](v22, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v3);
    LOBYTE(v31) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538F138);
    sub_21D94D000();

  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v10 + 32))(v12, v15, v9);
    sub_21D94C004();
    v26 = sub_21D94C070();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v32 = v26 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538F138);
    sub_21D94D000();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_21D93D368()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F138);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_21D93D3CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25538F138) - 8) + 80);
  sub_21D93CFD4(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_21D93D40C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_21D93D438()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_21D93D460(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

Swift::Double __swiftcall DispatchTimeInterval.toSeconds()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  int v6;
  double v8;
  double v9;
  uint64_t v10;

  v1 = v0;
  v2 = sub_21D94CEE0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BEE5420])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    return (double)*v5;
  }
  if (v6 == *MEMORY[0x24BEE5410])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    v8 = (double)*v5;
    v9 = 1000.0;
  }
  else if (v6 == *MEMORY[0x24BEE5408])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    v8 = (double)*v5;
    v9 = 100000.0;
  }
  else
  {
    if (v6 != *MEMORY[0x24BEE5400])
    {
      (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
      return 9.22337204e18;
    }
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v5, v2);
    v8 = (double)*v5;
    v9 = 100000000.0;
  }
  return v8 / v9;
}

uint64_t UsoEntity_common_App.appIdentifier.getter()
{
  uint64_t v0;
  const char *v1;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, unint64_t, uint64_t);
  uint64_t v32;
  char v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  unint64_t v42;
  uint64_t v43;
  void (*v44)(char *, unint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  char v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, uint64_t);
  char *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t, uint64_t);
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  unint64_t v69;
  char *v70;
  const char *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v0 = sub_21D94C4E4();
  v1 = *(const char **)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v70 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v68 = (char *)&v60 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v60 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v60 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v60 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v60 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F150);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v60 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v66 = (uint64_t)&v60 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v67 = (char *)&v60 - v26;
  v27 = sub_21D94C514();
  if (!v27)
    return 0;
  v28 = v27;
  v62 = v23;
  v63 = v27;
  v29 = *(_QWORD *)(v27 + 16);
  v64 = v20;
  v65 = v11;
  if (!v29)
  {
LABEL_17:
    v39 = (uint64_t)v67;
    v61 = (void (*)(char *, uint64_t, uint64_t, uint64_t))*((_QWORD *)v1 + 7);
    v61(v67, 1, 1, v0);
    goto LABEL_19;
  }
  v30 = v27 + ((*((unsigned __int8 *)v1 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v1 + 80));
  v69 = *((_QWORD *)v1 + 9);
  v71 = v1;
  v31 = (void (*)(char *, unint64_t, uint64_t))*((_QWORD *)v1 + 2);
  swift_bridgeObjectRetain();
  v32 = v29;
  while (1)
  {
    v31(v16, v30, v0);
    v35 = sub_21D94C4D8();
    if (!v36)
    {
      v31(v14, (unint64_t)v16, v0);
LABEL_15:
      v34 = (void (*)(char *, uint64_t))*((_QWORD *)v71 + 1);
      v34(v14, v0);
      goto LABEL_5;
    }
    if (v35 == 0x64695F6D657469 && v36 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      v31(v14, (unint64_t)v16, v0);
    }
    else
    {
      v37 = sub_21D94D1EC();
      swift_bridgeObjectRelease();
      v31(v14, (unint64_t)v16, v0);
      if ((v37 & 1) == 0)
        goto LABEL_15;
    }
    if (sub_21D94C4B4() == 0x746163696C707041 && v38 == 0xEC000000736E6F69)
      break;
    v33 = sub_21D94D1EC();
    swift_bridgeObjectRelease();
    v34 = (void (*)(char *, uint64_t))*((_QWORD *)v71 + 1);
    v34(v14, v0);
    if ((v33 & 1) != 0)
      goto LABEL_18;
LABEL_5:
    v34(v16, v0);
    v30 += v69;
    if (!--v32)
    {
      v28 = v63;
      swift_bridgeObjectRelease();
      v1 = v71;
      v20 = v64;
      v11 = v65;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  (*((void (**)(char *, uint64_t))v71 + 1))(v14, v0);
LABEL_18:
  v28 = v63;
  swift_bridgeObjectRelease();
  v1 = v71;
  v39 = (uint64_t)v67;
  (*((void (**)(void))v71 + 4))();
  v61 = (void (*)(char *, uint64_t, uint64_t, uint64_t))*((_QWORD *)v1 + 7);
  v61((char *)v39, 0, 1, v0);
  v20 = v64;
  v11 = v65;
LABEL_19:
  v40 = v66;
  sub_21D93DDB4(v39, v66);
  v41 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v1 + 6);
  if (v41(v40, 1, v0) != 1)
  {
    (*((void (**)(char *, uint64_t, uint64_t))v1 + 4))(v11, v40, v0);
    v58 = sub_21D94C4CC();
    (*((void (**)(char *, uint64_t))v1 + 1))(v11, v0);
    sub_21D93DDFC(v39);
    swift_bridgeObjectRelease();
    return v58;
  }
  sub_21D93DDFC(v39);
  if (!v29)
  {
    v56 = (uint64_t)v62;
    v61(v62, 1, 1, v0);
    goto LABEL_41;
  }
  v67 = (char *)v41;
  v42 = v28 + ((*((unsigned __int8 *)v1 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v1 + 80));
  v43 = *((_QWORD *)v1 + 9);
  v44 = (void (*)(char *, unint64_t, uint64_t))*((_QWORD *)v1 + 2);
  swift_bridgeObjectRetain();
  v71 = "isFitnessPlusSubscriber()";
  v69 = 0x800000021D94F1C0;
  while (2)
  {
    v44(v8, v42, v0);
    v45 = sub_21D94C4D8();
    v47 = v46;
    if (v46)
    {
      v48 = v68;
      if (v45 == 0x656D614E707061 && v46 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        v44(v48, (unint64_t)v8, v0);
        goto LABEL_30;
      }
      v49 = sub_21D94D1EC();
      swift_bridgeObjectRelease();
      v44(v48, (unint64_t)v8, v0);
      v47 = 0;
      if ((v49 & 1) != 0)
      {
LABEL_30:
        if (sub_21D94C4B4() == 0xD000000000000015 && v50 == v69)
        {
          swift_bridgeObjectRelease();
          v47 = 1;
        }
        else
        {
          v47 = sub_21D94D1EC();
          swift_bridgeObjectRelease();
        }
      }
    }
    else
    {
      v48 = v68;
      v44(v68, (unint64_t)v8, v0);
    }
    v51 = v48;
    v52 = (void (*)(char *, uint64_t))*((_QWORD *)v1 + 1);
    v52(v51, v0);
    v53 = v70;
    v44(v70, (unint64_t)v8, v0);
    if ((v47 & 1) != 0)
    {
      v74 = sub_21D94C4CC();
      v75 = v54;
      v72 = 46;
      v73 = 0xE100000000000000;
      sub_21D93DE3C();
      v55 = sub_21D94D090();
      swift_bridgeObjectRelease();
      v52(v70, v0);
      if ((v55 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v56 = (uint64_t)v62;
        (*((void (**)(char *, char *, uint64_t))v1 + 4))(v62, v8, v0);
        v57 = 0;
        v11 = v65;
        goto LABEL_39;
      }
    }
    else
    {
      v52(v53, v0);
    }
    v52(v8, v0);
    v42 += v43;
    if (--v29)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
  v57 = 1;
  v11 = v65;
  v56 = (uint64_t)v62;
LABEL_39:
  v20 = v64;
  v41 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v67;
  v61((char *)v56, v57, 1, v0);
LABEL_41:
  swift_bridgeObjectRelease();
  sub_21D93DDB4(v56, (uint64_t)v20);
  if (v41((uint64_t)v20, 1, v0) == 1)
  {
    sub_21D93DDFC(v56);
    return 0;
  }
  (*((void (**)(char *, char *, uint64_t))v1 + 4))(v11, v20, v0);
  v58 = sub_21D94C4CC();
  (*((void (**)(char *, uint64_t))v1 + 1))(v11, v0);
  sub_21D93DDFC(v56);
  return v58;
}

uint64_t sub_21D93DDB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D93DDFC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F150);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21D93DE3C()
{
  unint64_t result;

  result = qword_25538F158;
  if (!qword_25538F158)
  {
    result = MEMORY[0x220795560](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25538F158);
  }
  return result;
}

uint64_t makeConfirmationButtons(confirmButton:rejectButton:device:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;

  v6 = objc_allocWithZone(MEMORY[0x24BE99168]);
  swift_bridgeObjectRetain();
  v7 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithIdentifier_, v7);

  sub_21D93E3E8(*(_QWORD *)(a1 + 32));
  v9 = (void *)sub_21D94CEEC();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setUserData_, v9);

  v10 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  v11 = (void *)sub_21D94C214();
  v40 = v8;
  v12 = objc_msgSend(v10, sel_runSiriKitExecutorCommandWithContext_payload_, v11, v8);

  v13 = objc_allocWithZone(MEMORY[0x24BE99168]);
  swift_bridgeObjectRetain();
  v14 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithIdentifier_, v14);

  sub_21D93E3E8(*(_QWORD *)(a2 + 32));
  v16 = (void *)sub_21D94CEEC();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setUserData_, v16);

  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  v17 = (void *)sub_21D94C214();
  v38 = v15;
  v18 = objc_msgSend(v10, sel_runSiriKitExecutorCommandWithContext_payload_, v17, v15);

  v39 = v12;
  v19 = objc_msgSend(v10, sel_wrapCommandInStartLocalRequest_, v12);
  v37 = v18;
  v20 = objc_msgSend(v10, sel_wrapCommandInStartLocalRequest_, v18);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  v36 = sub_21D94C1E4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F160);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_21D94D760;
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_21D94D760;
  *(_QWORD *)(v22 + 32) = v19;
  v41 = v22;
  sub_21D94CFD0();
  v23 = objc_allocWithZone(MEMORY[0x24BE818A0]);
  v35 = v19;
  v24 = objc_msgSend(v23, sel_init);
  v25 = (void *)sub_21D94CF28();
  objc_msgSend(v24, sel_setLabel_, v25);

  swift_bridgeObjectRetain();
  if (v41 >> 62)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
    sub_21D94D18C();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21D94D1F8();
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
  v26 = (void *)sub_21D94CFAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v24, sel_setCommands_, v26);
  swift_bridgeObjectRelease();

  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_21D94D760;
  *(_QWORD *)(v27 + 32) = v20;
  v42 = v27;
  sub_21D94CFD0();
  v28 = objc_allocWithZone(MEMORY[0x24BE818A0]);
  v29 = v20;
  v30 = objc_msgSend(v28, sel_init);
  v31 = (void *)sub_21D94CF28();
  objc_msgSend(v30, sel_setLabel_, v31);

  swift_bridgeObjectRetain();
  if (v42 >> 62)
  {
    sub_21D94D18C();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21D94D1F8();
  }
  v32 = (void *)sub_21D94CFAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setCommands_, v32);
  swift_bridgeObjectRelease();

  v33 = sub_21D93E7AC(v24, v30, 0, v36 & 1);
  *(_QWORD *)(v21 + 32) = v33;
  sub_21D94CFD0();

  return v21;
}

uint64_t sub_21D93E3E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538F1E8);
    v2 = sub_21D94D1A4();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_21D9306D4(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21D93EBB0(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_21D93EBB0(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_21D93EBB0(v36, v37);
    sub_21D93EBB0(v37, &v33);
    result = sub_21D94D09C();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_21D93EBB0(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_21D93EBC0();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_21D93E7AC(id a1, void *a2, void *a3, char a4)
{
  id result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;

  if ((a4 & 1) == 0)
  {
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE818B0]), sel_init);
    v27 = objc_msgSend(a1, sel_label);
    objc_msgSend(v21, sel_setConfirmText_, v27);

    v28 = objc_msgSend(a1, sel_commands);
    objc_msgSend(v21, sel_setConfirmCommands_, v28);

    v29 = objc_msgSend(a2, sel_label);
    objc_msgSend(v21, sel_setDenyText_, v29);

    v30 = objc_msgSend(a2, sel_commands);
    objc_msgSend(v21, sel_setDenyCommands_, v30);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F160);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_21D94DD50;
    *(_QWORD *)(v31 + 32) = a1;
    *(_QWORD *)(v31 + 40) = a2;
    v38 = v31;
    sub_21D94CFD0();
    if (a3)
    {
      v32 = a1;
      v33 = a2;
      v34 = a3;
      MEMORY[0x220794F60]();
      if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_21D94CFDC();
      sub_21D94CFF4();
      sub_21D94CFD0();
    }
    else
    {
      v35 = a1;
      v36 = a2;
    }
    sub_21D9343E0(0, &qword_25538F170);
    v37 = (void *)sub_21D94CFAC();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setAllConfirmationOptions_, v37);

    return v21;
  }
  result = objc_msgSend(a1, sel_label);
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = result;
  v8 = sub_21D94CF34();
  v10 = v9;

  result = objc_msgSend(a1, sel_commands);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v11 = result;
  sub_21D9343E0(0, &qword_25538F178);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
  v12 = sub_21D94CFB8();

  v13 = SASTButtonItem.init(label:commands:centered:)(v8, v10, v12, 1);
  result = objc_msgSend(a2, sel_label);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v14 = result;
  v15 = sub_21D94CF34();
  v17 = v16;

  result = objc_msgSend(a2, sel_commands);
  if (result)
  {
    v18 = result;
    v19 = sub_21D94CFB8();

    v20 = SASTButtonItem.init(label:commands:centered:)(v15, v17, v19, 1);
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815E8]), sel_init);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F160);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_21D94DD50;
    *(_QWORD *)(v22 + 32) = v13;
    *(_QWORD *)(v22 + 40) = v20;
    sub_21D94CFD0();
    v23 = v13;
    v24 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538F1E0);
    v25 = (void *)sub_21D94CFAC();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setTemplateItems_, v25);

    return v21;
  }
LABEL_17:
  __break(1u);
  return result;
}

_OWORD *sub_21D93EBB0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21D93EBC0()
{
  return swift_release();
}

uint64_t static UsoEntity_common_App.with(appIdentifier:usoIdentifierNamespace:usoIdentifierAppBundleId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  _s12SiriOntology20UsoEntity_common_AppC18HealthDomainsToolsE7builder7appName0K10Identifier03usoM9Namespace0nmF8BundleIdAA0cd8Builder_e1_F0CSSSg_A3LtFZ_0(0, 0, a1, a2, a3, a4, a5);
  MEMORY[0x220794594]();
  sub_21D94C538();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v6;
}

uint64_t _s12SiriOntology20UsoEntity_common_AppC18HealthDomainsToolsE7builder7appName0K10Identifier03usoM9Namespace0nmF8BundleIdAA0cd8Builder_e1_F0CSSSg_A3LtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v19 = a7;
  v20 = a3;
  v21 = a5;
  v10 = sub_21D94C4E4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C67C();
  swift_allocObject();
  v14 = sub_21D94C670();
  if (a4)
  {
    sub_21D94C610();
    v18 = v10;
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = MEMORY[0x2207945C4](a1, a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21D94C4C0();
    sub_21D94C490();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v18);
    v22 = v15;
    sub_21D94C4FC();
    swift_release();
  }
  return v14;
}

uint64_t Date.startOfDay.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_21D94C058();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C040();
  sub_21D94C01C();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t Date.endOfDay.getter@<X0>(uint64_t a1@<X8>)
{
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
  char *v11;
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a1;
  v1 = sub_21D94C010();
  v2 = *(_QWORD *)(v1 - 8);
  v32 = v1;
  v33 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21D94C058();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v29 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F1F0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F1F8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F200);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_21D94BFB0();
  v29 = *(_QWORD *)(v21 - 8);
  v30 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v29 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v20, 1, 1, v5);
  v24 = sub_21D94C064();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v17, 1, 1, v24);
  sub_21D94BFA4();
  sub_21D94BF8C();
  sub_21D94BF98();
  sub_21D94C040();
  sub_21D94C040();
  sub_21D94C01C();
  v25 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25(v9, v5);
  sub_21D94C034();
  v26 = v32;
  v27 = v33;
  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v32);
  v25(v11, v5);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48))(v14, 1, v26);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v23, v30);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v31, v14, v26);
  }
  return result;
}

uint64_t Calendar.numberOfDaysBetween(_:and:)()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  os_log_type_t v26;
  uint64_t v27;
  char *v28;
  uint8_t *v29;
  uint64_t result;
  char v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  char v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v43 = sub_21D94CEBC();
  v47 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v1 = (char *)&v38 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_21D94BFB0();
  v45 = *(_QWORD *)(v2 - 8);
  v46 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v44 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v38 - v5;
  v7 = sub_21D94C010();
  v41 = *(_QWORD *)(v7 - 8);
  v42 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v38 - v11;
  sub_21D94C01C();
  sub_21D94C01C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538F208);
  v13 = sub_21D94C04C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_21D94D770;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v14 + 104))(v16 + v15, *MEMORY[0x24BDCF220], v13);
  sub_21D93F630(v16);
  swift_setDeallocating();
  v17 = v6;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v39 = v12;
  v40 = v10;
  sub_21D94C028();
  swift_bridgeObjectRelease();
  if (qword_25538EA68 != -1)
    swift_once();
  v18 = v43;
  v19 = __swift_project_value_buffer(v43, (uint64_t)static Logger.wellness);
  swift_beginAccess();
  v20 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v1, v19, v18);
  v21 = v44;
  v22 = v45;
  v23 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v44, v17, v46);
  v24 = sub_21D94CEA4();
  v25 = v17;
  v26 = sub_21D94D00C();
  v27 = v20;
  v28 = v25;
  if (os_log_type_enabled(v24, v26))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v29 = 134217984;
    result = sub_21D94BF80();
    if ((v31 & 1) != 0)
    {
LABEL_12:
      __break(1u);
      return result;
    }
    v32 = result;
    v33 = *(void (**)(char *, uint64_t))(v22 + 8);
    v33(v21, v23);
    v48 = v32;
    sub_21D94D078();
    _os_log_impl(&dword_21D92C000, v24, v26, "Number of days: %ld", v29, 0xCu);
    MEMORY[0x2207955E4](v29, -1, -1);
    v27 = v47;
  }
  else
  {
    v33 = *(void (**)(char *, uint64_t))(v22 + 8);
    v33(v21, v23);
  }

  (*(void (**)(char *, uint64_t))(v27 + 8))(v1, v18);
  result = sub_21D94BF80();
  if ((v34 & 1) != 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v35 = result;
  v33(v28, v23);
  v36 = *(void (**)(char *, uint64_t))(v41 + 8);
  v37 = v42;
  v36(v40, v42);
  v36(v39, v37);
  result = v35 + 1;
  if (__OFADD__(v35, 1))
  {
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

void *sub_21D93F574(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_21D94D1B0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_21D93F608@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_21D93F630(uint64_t a1)
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

  v2 = sub_21D94C04C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538F210);
    v10 = sub_21D94D0A8();
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
      sub_21D93F888(&qword_25538F218, MEMORY[0x24BDCF2A8]);
      v14 = sub_21D94CF04();
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
          sub_21D93F888(&qword_25538F220, MEMORY[0x24BDCF2C0]);
          v20 = sub_21D94CF1C();
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

uint64_t sub_21D93F888(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_21D94C04C();
    result = MEMORY[0x220795560](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static UsoEntity_common_WorkoutEquipment.builder(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_21D94CB68();
  swift_allocObject();
  v3 = sub_21D94CB5C();
  if (a2)
    sub_21D94C7FC();
  return v3;
}

uint64_t static UsoEntity_common_WorkoutEquipment.with(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  sub_21D94CB68();
  swift_allocObject();
  v3 = sub_21D94CB5C();
  if (a2)
    sub_21D94C7FC();
  MEMORY[0x220794594](v3);
  sub_21D94C934();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v5;
}

Swift::Bool __swiftcall App.isFirstParty()()
{
  uint64_t v0;
  char v1;

  sub_21D94CDFC();
  if (v0)
  {
    sub_21D93FA58();
    sub_21D93FA9C();
    v1 = sub_21D94CF10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = 0;
  }
  return v1 & 1;
}

unint64_t sub_21D93FA58()
{
  unint64_t result;

  result = qword_25538F228;
  if (!qword_25538F228)
  {
    result = MEMORY[0x220795560](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25538F228);
  }
  return result;
}

unint64_t sub_21D93FA9C()
{
  unint64_t result;

  result = qword_25538F230;
  if (!qword_25538F230)
  {
    result = MEMORY[0x220795560](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25538F230);
  }
  return result;
}

void *static HealthLogName.allCases.getter()
{
  return &unk_24E13CBC0;
}

uint64_t HealthLogName.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21D93FB28 + 4 * word_21D94DD80[a1]))(0xD000000000000010, 0x800000021D94E6E0);
}

uint64_t sub_21D93FB28()
{
  return 0x79726568637261;
}

uint64_t sub_21D93FB40(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_21D9401F0()
{
  return 0x7469667265746177;
}

uint64_t sub_21D940210()
{
  return 0x6C6F707265746177;
}

uint64_t sub_21D940250()
{
  return 0x7374756F6B726F77;
}

uint64_t sub_21D940268()
{
  return 0x6E696C7473657277;
}

uint64_t sub_21D9402A4()
{
  return 7239026;
}

uint64_t sub_21D9402B4()
{
  return 0x635F737269617473;
}

uint64_t sub_21D9402D8()
{
  return 1835628403;
}

uint64_t sub_21D9402E8()
{
  return 1802264951;
}

uint64_t sub_21D9402F8()
{
  return 0x6168636C65656877;
}

uint64_t sub_21D940318(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = HealthLogName.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == HealthLogName.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_21D94D1EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21D9403A0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21D94D24C();
  HealthLogName.rawValue.getter(v1);
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D940400()
{
  unsigned __int8 *v0;

  HealthLogName.rawValue.getter(*v0);
  sub_21D94CF58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D940440()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21D94D24C();
  HealthLogName.rawValue.getter(v1);
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D94049C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18HealthDomainsTools0A7LogNameO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21D9404C8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = HealthLogName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_21D9404F0(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E13CBC0;
}

Swift::String_optional __swiftcall vocabularyIdentifier(for:)(HealthDomainsTools::HealthLogName_optional a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;
  Swift::String_optional result;

  if (a1.value == HealthDomainsTools_HealthLogName_unknownDefault)
  {
    v1 = 0;
    v2 = 0;
  }
  else
  {
    v1 = sub_21D940600(a1.value);
    v2 = v4;
    if (qword_25538EAA0 != -1)
      swift_once();
    v5 = qword_255390540;
    swift_bridgeObjectRetain();
    v6 = sub_21D940684(a1.value, v5);
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      sub_21D94D0C0();
      swift_bridgeObjectRelease();
      sub_21D94CF7C();
      swift_bridgeObjectRelease();
      v1 = 0xD000000000000028;
      v2 = 0x800000021D94F260;
    }
  }
  v7 = v1;
  v8 = (void *)v2;
  result.value._object = v8;
  result.value._countAndFlagsBits = v7;
  return result;
}

uint64_t sub_21D940600(unsigned __int8 a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v5;

  v2 = 0x6E776F6E6B6E55;
  v3 = sub_21D9429E8((uint64_t)&unk_24E13CC38);
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = sub_21D9448A4(a1);
    if ((v5 & 1) != 0)
    {
      v2 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 16 * v4);
      swift_bridgeObjectRetain();
    }
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_21D940684(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v5 = HealthLogName.rawValue.getter(*(_BYTE *)(a2 + 32));
  v7 = v6;
  v8 = HealthLogName.rawValue.getter(a1);
  if (v5 == v8 && v7 == v9)
  {
LABEL_8:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v11 = v8;
  v12 = v9;
  v13 = sub_21D94D1EC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v15 = 33;
  while (1)
  {
    v16 = v15 - 31;
    if (__OFADD__(v15 - 32, 1))
      break;
    if (HealthLogName.rawValue.getter(*(_BYTE *)(a2 + v15)) == v11 && v17 == v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    v19 = sub_21D94D1EC();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      goto LABEL_7;
    ++v15;
    if (v16 == v2)
      goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_21D9407D0()
{
  qword_255390540 = (uint64_t)&unk_24E13D438;
}

uint64_t _s18HealthDomainsTools0A7LogNameO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21D94D204();
  swift_bridgeObjectRelease();
  if (v0 >= 0x54)
    return 84;
  else
    return v0;
}

unint64_t sub_21D940838()
{
  unint64_t result;

  result = qword_25538F238;
  if (!qword_25538F238)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for HealthLogName, &type metadata for HealthLogName);
    atomic_store(result, (unint64_t *)&qword_25538F238);
  }
  return result;
}

unint64_t sub_21D940880()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25538F240;
  if (!qword_25538F240)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25538F248);
    result = MEMORY[0x220795560](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25538F240);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HealthLogName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xAD)
    goto LABEL_17;
  if (a2 + 83 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 83) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 83;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 83;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 83;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x54;
  v8 = v6 - 84;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthLogName(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 83 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 83) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xAD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xAC)
    return ((uint64_t (*)(void))((char *)&loc_21D9409A8 + 4 * byte_21D94DE2D[v4]))();
  *a1 = a2 + 83;
  return ((uint64_t (*)(void))((char *)sub_21D9409DC + 4 * byte_21D94DE28[v4]))();
}

uint64_t sub_21D9409DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D9409E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21D9409ECLL);
  return result;
}

uint64_t sub_21D9409F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21D940A00);
  *(_BYTE *)result = a2 + 83;
  return result;
}

uint64_t sub_21D940A04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D940A0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HealthLogName()
{
  return &type metadata for HealthLogName;
}

id SASTButtonItem.init(label:commands:centered:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v5, sel_setCentered_, a4 & 1);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815D8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
  v7 = (void *)sub_21D94CFAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setCommands_, v7);

  objc_msgSend(v5, sel_setAction_, v6);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE818B8]), sel_init);
  v9 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setText_, v9);

  objc_msgSend(v5, sel_setDecoratedLabel_, v8);
  return v5;
}

id SASTCommandTemplateAction.init(commands:)()
{
  id v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
  v1 = (void *)sub_21D94CFAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCommands_, v1);

  return v0;
}

id SASTSideBySideButtonsItem.init(primaryButtonConfirmationOption:secondaryButtonConfirmationOption:)(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  id result;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v5 = *MEMORY[0x24BE82838];
  v6 = v4;
  objc_msgSend(v6, sel_setButtonsViewStyle_, v5);
  result = objc_msgSend(a1, sel_commands);
  if (result)
  {
    v8 = result;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
    sub_21D94CFB8();

    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815D8]), sel_init);
    v10 = (void *)sub_21D94CFAC();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setCommands_, v10);

    objc_msgSend(v6, sel_setPrimaryButtonAction_, v9);
    objc_msgSend(v6, sel_setPrimaryButtonEnabled_, 1);
    v11 = objc_msgSend(a1, sel_label);
    objc_msgSend(v6, sel_setPrimaryButtonLabel_, v11);

    v12 = (void *)sub_21D94C268();
    objc_msgSend(v6, sel_setPrimaryButtonTextColor_, v12);

    result = objc_msgSend(a2, sel_commands);
    if (result)
    {
      v13 = result;
      sub_21D94CFB8();

      v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815D8]), sel_init);
      v15 = (void *)sub_21D94CFAC();
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_setCommands_, v15);

      objc_msgSend(v6, sel_setSecondaryButtonAction_, v14);
      objc_msgSend(v6, sel_setSecondaryButtonEnabled_, 1);
      v16 = objc_msgSend(a2, sel_label);
      objc_msgSend(v6, sel_setSecondaryButtonLabel_, v16);

      return v6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id SASTCountdownTimerItem.init(sashTitle:commands:delay:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v7 = v6;
  swift_bridgeObjectRetain();
  if (a3 >> 62)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
    sub_21D94D18C();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21D94D1F8();
  }
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815D8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F2B0);
  v9 = (void *)sub_21D94CFAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setCommands_, v9);

  objc_msgSend(v6, sel_setAction_, v8);
  objc_msgSend(v6, sel_setActionDelayInSeconds_, a4);
  v10 = (void *)sub_21D94C268();
  objc_msgSend(v6, sel_setBodyBackgroundColor_, v10);

  v11 = (void *)sub_21D94C25C();
  objc_msgSend(v6, sel_setCountdownTextColor_, v11);

  v12 = (void *)sub_21D94C268();
  objc_msgSend(v6, sel_setHeaderBackgroundColor_, v12);

  v13 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setHeaderText_, v13);

  v14 = (void *)sub_21D94C250();
  objc_msgSend(v6, sel_setHeaderTextColor_, v14);

  return v6;
}

uint64_t SABaseCommand.asVCatString.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1)
    return 0;
  v2 = v1;
  v12[0] = 0;
  v3 = objc_msgSend((id)objc_opt_self(), sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v12);
  v4 = v12[0];
  if (!v3)
  {
    v9 = v4;
    v10 = (void *)sub_21D94BFBC();

    swift_willThrow();
    return 0;
  }
  v5 = sub_21D94BFEC();
  v7 = v6;

  sub_21D9411D8(v5, v7);
  v8 = sub_21D94BFE0();

  sub_21D94121C(v5, v7);
  sub_21D94121C(v5, v7);
  return v8;
}

uint64_t sub_21D9411D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_21D94121C(uint64_t a1, unint64_t a2)
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

id SAUIAppPunchOut.init(aceService:url:)(_QWORD *a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v5 = (void *)sub_21D94BFC8();
  objc_msgSend(v4, sel_setPunchOutUri_, v5);

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21D94C2C8();
  if (v6)
  {
    v7 = (void *)sub_21D94CF28();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, sel_setAceId_, v7);

  v8 = sub_21D94BFD4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a2, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v4;
}

uint64_t static UsoEntity_common_Measurement.builder(component:)(uint64_t a1)
{
  uint64_t v2;

  sub_21D94C994();
  swift_allocObject();
  v2 = sub_21D94C988();
  if (a1)
  {
    swift_retain();
    sub_21D94C730();
    swift_release();
  }
  return v2;
}

uint64_t static UsoEntity_common_Measurement.builder(unitType:value:)(uint64_t a1, uint64_t a2, char a3)
{
  return sub_21D941470(a1, a2, a3 & 1);
}

uint64_t static UsoEntity_common_Measurement.with(component:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  sub_21D94C994();
  swift_allocObject();
  v2 = sub_21D94C988();
  if (a1)
  {
    swift_retain();
    sub_21D94C730();
    swift_release();
  }
  MEMORY[0x220794594](v2);
  sub_21D94C694();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v4;
}

uint64_t sub_21D941470(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - v10;
  v12 = sub_21D94C8BC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C994();
  swift_allocObject();
  v16 = sub_21D94C988();
  sub_21D935EA8(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_21D935EF0((uint64_t)v11);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    if ((a3 & 1) == 0)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      sub_21D935BE8((uint64_t)v9, a2, 0);
      sub_21D935EF0((uint64_t)v9);
      swift_retain();
      sub_21D94C730();
      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  return v16;
}

uint64_t ServerFallbackFlow.on(input:)()
{
  return 1;
}

uint64_t ServerFallbackFlow.execute(completion:)()
{
  sub_21D941674();
  return sub_21D94C0F4();
}

unint64_t sub_21D941674()
{
  unint64_t result;

  result = qword_25538F2C0;
  if (!qword_25538F2C0)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for ServerFallbackFlow, &type metadata for ServerFallbackFlow);
    atomic_store(result, (unint64_t *)&qword_25538F2C0);
  }
  return result;
}

uint64_t ServerFallbackFlow.execute()(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[6] = a1;
  v2 = sub_21D94C13C();
  v1[7] = v2;
  v1[8] = *(_QWORD *)(v2 - 8);
  v1[9] = swift_task_alloc();
  v3 = sub_21D94CEBC();
  v1[10] = v3;
  v1[11] = *(_QWORD *)(v3 - 8);
  v1[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D941740()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  if (qword_25538EA88 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_21D94CEA4();
  v6 = sub_21D94D00C();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 96);
  v10 = *(_QWORD *)(v0 + 80);
  if (v7)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v17 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_21D930010(0xD000000000000012, 0x800000021D94DF20, &v17);
    sub_21D94D078();
    _os_log_impl(&dword_21D92C000, v5, v6, "Executing %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v12, -1, -1);
    MEMORY[0x2207955E4](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v14 = *(_QWORD *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 72);
  v15 = *(_QWORD *)(v0 + 56);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x24BE96F60], v15);
  sub_21D94C298();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D941964()
{
  return sub_21D94C0F4();
}

uint64_t sub_21D941978(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21D93121C;
  return ServerFallbackFlow.execute()(a1);
}

ValueMetadata *type metadata accessor for ServerFallbackFlow()
{
  return &type metadata for ServerFallbackFlow;
}

uint64_t static UsoTask.startWorkout(_:goalDefinedValue:goalUnitType:goalValue:areaType:sequenceLabel:appIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, void (*a9)(char *, char *, uint64_t), uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  sub_21D94BB48(a1, a2, a3, a4, a5, a6 & 1, a7, a8, a9, a10, a11);
  sub_21D94CA84();
  swift_allocObject();
  v11 = sub_21D94CA78();
  sub_21D94C478();
  swift_release();
  return v11;
}

uint64_t static UsoTask.cancelWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_21D94257C(a1, a2, MEMORY[0x24BEA2950], MEMORY[0x24BEA2948], MEMORY[0x24BEA22F8]);
}

uint64_t static UsoTask.noVerbWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_21D94257C(a1, a2, MEMORY[0x24BEA2990], MEMORY[0x24BEA2988], (void (*)(uint64_t))MEMORY[0x24BE9ED38]);
}

uint64_t static UsoTask.pauseWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_21D941ACC(a1, a2, (void (*)(_QWORD))MEMORY[0x24BEA26A8], MEMORY[0x24BEA26A0]);
}

uint64_t static UsoTask.endWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_21D941ACC(a1, a2, (void (*)(_QWORD))MEMORY[0x24BEA24D0], MEMORY[0x24BEA24C8]);
}

uint64_t sub_21D941ACC(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t (*a4)(void))
{
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (void (*)(char *, char *, uint64_t))((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_21D94C6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  v18 = sub_21D94C8BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v13, 1, 1, v18);
  v19 = sub_21D94C6C4();
  (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8)
                                                                                                  + 56))(v10, 1, 1, v19);
  sub_21D94BB48(a1, a2, (uint64_t)v16, (uint64_t)v13, 0, 1, 0, 0, v10, 0, 0);
  sub_21D930660((uint64_t)v10, &qword_25538EE30);
  sub_21D930660((uint64_t)v13, &qword_25538EE38);
  sub_21D930660((uint64_t)v16, &qword_25538EE40);
  a3(0);
  swift_allocObject();
  v20 = a4();
  sub_21D94CB74();
  swift_release();
  return v20;
}

uint64_t static UsoTask.resumeWorkout(_:)(uint64_t a1, uint64_t a2)
{
  return sub_21D941ACC(a1, a2, (void (*)(_QWORD))MEMORY[0x24BEA29B0], MEMORY[0x24BEA29A8]);
}

uint64_t static UsoTask.createHealthLog(_:measurementNeeded:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;

  _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(a1, a2, 0, 0, 0, 0, a3);
  sub_21D94CAE4();
  swift_allocObject();
  v3 = sub_21D94CAD8();
  sub_21D94C478();
  swift_release();
  return v3;
}

uint64_t static UsoTask.noVerbHealthLog(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v4 = sub_21D94C4E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D94C904();
  swift_allocObject();
  sub_21D94C8F8();
  if (a2)
  {
    sub_21D94C610();
    swift_allocObject();
    swift_bridgeObjectRetain_n();
    v8 = MEMORY[0x2207945C4](a1, a2);
    sub_21D94C4C0();
    sub_21D94C490();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v11[1] = v8;
    sub_21D94C4FC();
    swift_release();
  }
  sub_21D94CAFC();
  swift_allocObject();
  v9 = sub_21D94CAF0();
  sub_21D94C478();
  swift_release();
  return v9;
}

uint64_t UsoTaskBuilder.build()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE88);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F160);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21D94D760;
  *(_QWORD *)(v4 + 32) = v0;
  v12 = v4;
  sub_21D94CFD0();
  v5 = v12;
  v6 = sub_21D94C520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v3, 1, 1, v6);
  swift_retain();
  v7 = MEMORY[0x2207944B0](v5, v3);
  swift_bridgeObjectRelease();
  sub_21D930660((uint64_t)v3, &qword_25538EE88);
  v8 = MEMORY[0x2207944EC](v7);
  if (!(v8 >> 62))
  {
    result = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  result = sub_21D94D198();
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    v10 = MEMORY[0x220795098](0, v8);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v10 = *(_QWORD *)(v8 + 32);
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_release();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t UsoTaskBuilder.toProtobufUsoGraph()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE88);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25538F160);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_21D94D760;
  *(_QWORD *)(v6 + 32) = v1;
  v12 = v6;
  sub_21D94CFD0();
  v7 = v12;
  v8 = sub_21D94C520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  swift_retain();
  MEMORY[0x2207944B0](v7, v5);
  swift_bridgeObjectRelease();
  sub_21D930660((uint64_t)v5, &qword_25538EE88);
  sub_21D94C460();
  swift_release();
  v9 = sub_21D94C364();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 0, 1, v9);
}

BOOL static ModifyWorkoutTaskVerb.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t ModifyWorkoutTaskVerb.hash(into:)()
{
  return sub_21D94D258();
}

uint64_t ModifyWorkoutTaskVerb.hashValue.getter()
{
  sub_21D94D24C();
  sub_21D94D258();
  return sub_21D94D264();
}

BOOL sub_21D94223C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21D942250()
{
  sub_21D94D24C();
  sub_21D94D258();
  return sub_21D94D264();
}

uint64_t sub_21D942294()
{
  return sub_21D94D258();
}

uint64_t sub_21D9422BC()
{
  sub_21D94D24C();
  sub_21D94D258();
  return sub_21D94D264();
}

uint64_t _s12SiriOntology7UsoTaskC18HealthDomainsToolsE13modifyWorkout_4verbAA0C37_VerbTemplateBuilder_ReferenceControlCyAA0c6Entitym8_common_I0CGSSSg_AD06ModifyidK0OtFZ_0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (void (*)(char *, char *, uint64_t))((char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21D94C6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = sub_21D94C8BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  v17 = sub_21D94C6C4();
  (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8)
                                                                                                  + 56))(v8, 1, 1, v17);
  sub_21D94BB48(a1, a2, (uint64_t)v14, (uint64_t)v11, 0, 1, 0, 0, v8, 0, 0);
  sub_21D930660((uint64_t)v8, &qword_25538EE30);
  sub_21D930660((uint64_t)v11, &qword_25538EE38);
  sub_21D930660((uint64_t)v14, &qword_25538EE40);
  if (a3)
  {
    if (a3 == 1)
    {
      sub_21D94C970();
      swift_allocObject();
      v18 = sub_21D94C964();
    }
    else
    {
      sub_21D94CA9C();
      swift_allocObject();
      v18 = sub_21D94CA90();
    }
  }
  else
  {
    sub_21D94C9DC();
    swift_allocObject();
    v18 = sub_21D94C9D0();
  }
  v19 = v18;
  sub_21D94CB74();
  swift_release();
  return v19;
}

uint64_t sub_21D942544(uint64_t a1, uint64_t a2)
{
  return sub_21D94257C(a1, a2, MEMORY[0x24BEA2950], MEMORY[0x24BEA2948], MEMORY[0x24BEA22F8]);
}

uint64_t sub_21D942560(uint64_t a1, uint64_t a2)
{
  return sub_21D94257C(a1, a2, MEMORY[0x24BEA2990], MEMORY[0x24BEA2988], (void (*)(uint64_t))MEMORY[0x24BE9ED38]);
}

uint64_t sub_21D94257C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t (*a4)(void), void (*a5)(uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (void (*)(char *, char *, uint64_t))((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE38);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE40);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_21D94C6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  v20 = sub_21D94C8BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v15, 1, 1, v20);
  v21 = sub_21D94C6C4();
  (*(void (**)(void (*)(char *, char *, uint64_t), uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8)
                                                                                                  + 56))(v12, 1, 1, v21);
  v22 = sub_21D94BB48(a1, a2, (uint64_t)v18, (uint64_t)v15, 0, 1, 0, 0, v12, 0, 0);
  sub_21D930660((uint64_t)v12, &qword_25538EE30);
  sub_21D930660((uint64_t)v15, &qword_25538EE38);
  sub_21D930660((uint64_t)v18, &qword_25538EE40);
  a3(0);
  swift_allocObject();
  v23 = a4();
  a5(v22);
  swift_release();
  return v23;
}

unint64_t sub_21D942780()
{
  unint64_t result;

  result = qword_25538F2E0;
  if (!qword_25538F2E0)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for ModifyWorkoutTaskVerb, &type metadata for ModifyWorkoutTaskVerb);
    atomic_store(result, (unint64_t *)&qword_25538F2E0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ModifyWorkoutTaskVerb(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21D942810 + 4 * byte_21D94DFD5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21D942844 + 4 * byte_21D94DFD0[v4]))();
}

uint64_t sub_21D942844(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D94284C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21D942854);
  return result;
}

uint64_t sub_21D942860(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21D942868);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21D94286C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D942874(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModifyWorkoutTaskVerb()
{
  return &type metadata for ModifyWorkoutTaskVerb;
}

uint64_t USOIdentifierNamespace.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21D9428CC + 4 * aF[a1]))(0x4E74756F6B726F77, 0xEB00000000656D61);
}

uint64_t sub_21D9428CC()
{
  return 0x7974697669746361;
}

unint64_t sub_21D9428EC()
{
  return 0xD000000000000016;
}

uint64_t sub_21D942908()
{
  return 0x4C7373656E746966;
}

uint64_t sub_21D94292C()
{
  return 0x6F4C68746C616568;
}

uint64_t sub_21D942950()
{
  return 0x6E5568746C616568;
}

uint64_t sub_21D94296C()
{
  return 0x697461636964656DLL;
}

uint64_t sub_21D942990()
{
  return 0x6D6572757361656DLL;
}

uint64_t sub_21D9429B4()
{
  return 0x4E676F4C646F6F6DLL;
}

uint64_t sub_21D9429C8()
{
  return 0x4C6E6F69746F6D65;
}

unint64_t sub_21D9429E8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538F330);
  v2 = (_QWORD *)sub_21D94D1A4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_BYTE *)v4 - 16);
    v7 = *(v4 - 1);
    v6 = *v4;
    swift_bridgeObjectRetain();
    result = sub_21D9448A4(v5);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    v10 = (_QWORD *)(v2[7] + 16 * result);
    *v10 = v7;
    v10[1] = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_21D942AF4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538F328);
  v2 = (_QWORD *)sub_21D94D1A4();
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
    result = sub_21D944918(v5, v6);
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
    v4 += 3;
    v2[2] = v13;
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

uint64_t sub_21D942C08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = USOIdentifierNamespace.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == USOIdentifierNamespace.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_21D94D1EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21D942C90()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21D94D24C();
  USOIdentifierNamespace.rawValue.getter(v1);
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D942CF0()
{
  unsigned __int8 *v0;

  USOIdentifierNamespace.rawValue.getter(*v0);
  sub_21D94CF58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D942D30()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21D94D24C();
  USOIdentifierNamespace.rawValue.getter(v1);
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D942D8C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18HealthDomainsTools22USOIdentifierNamespaceO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21D942DB8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = USOIdentifierNamespace.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_QWORD *sub_21D942DE0(uint64_t a1, uint64_t a2)
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
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  int64_t v53;
  char *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  _QWORD v62[2];
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, unint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;

  v79 = a2;
  v81 = a1;
  v2 = sub_21D94CE2C();
  v77 = *(_QWORD *)(v2 - 8);
  v78 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21D94C448();
  v82 = *(_QWORD *)(v5 - 8);
  v83 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21D94C424();
  v73 = *(_QWORD *)(v8 - 8);
  v74 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v72 = (char *)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21D94C364();
  v70 = *(_QWORD *)(v10 - 8);
  v71 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v66 = (char *)v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = (void (*)(char *, unint64_t, uint64_t))sub_21D94C394();
  v12 = *((_QWORD *)v80 - 1);
  MEMORY[0x24BDAC7A8](v80);
  v14 = (char *)v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21D94C340();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_21D94C310();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v81, v19);
  if ((*(unsigned int (**)(char *, uint64_t))(v20 + 88))(v22, v19) == *MEMORY[0x24BE98E98])
  {
    (*(void (**)(char *, uint64_t))(v20 + 96))(v22, v19);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v22, v15);
    sub_21D94C328();
    v23 = sub_21D94C370();
    (*(void (**)(char *, void (*)(char *, unint64_t, uint64_t)))(v12 + 8))(v14, v80);
    v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v84 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v69 = *(_QWORD *)(v23 + 16);
    v65 = v15;
    v64 = v16;
    if (v69)
    {
      v63 = v18;
      v25 = *(_QWORD *)(sub_21D94C3F4() - 8);
      v26 = v23 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80));
      v67 = *(_QWORD *)(v25 + 72);
      v68 = v26;
      v62[1] = v23;
      swift_bridgeObjectRetain();
      v27 = 0;
      v29 = v78;
      v28 = v79;
      v30 = v77;
      v31 = v66;
      do
      {
        v32 = v72;
        sub_21D94C3C4();
        sub_21D94C400();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v32, v74);
        v33 = sub_21D94C358();
        v34 = *(_QWORD *)(v33 + 16);
        if (v34)
        {
          v75 = v33;
          v76 = v27;
          v35 = v82;
          v36 = v33 + ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80));
          swift_bridgeObjectRetain();
          v37 = *(_QWORD *)(v35 + 72);
          v80 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
          v81 = v37;
          v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
          v80(v7, v36, v83);
          while (1)
          {
            sub_21D94C43C();
            v39 = sub_21D94CE20();
            v41 = v40;
            (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v29);
            if (*(_QWORD *)(v28 + 16) && (v42 = sub_21D944918(v39, v41), (v43 & 1) != 0))
            {
              v44 = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v42);
              swift_bridgeObjectRelease();
              v45 = sub_21D94C430();
              v47 = v46;
              (*(void (**)(char *, uint64_t))(v82 + 8))(v7, v83);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v38 = sub_21D9327A0(0, v38[2] + 1, 1, v38);
              v49 = v38[2];
              v48 = v38[3];
              if (v49 >= v48 >> 1)
                v38 = sub_21D9327A0((_QWORD *)(v48 > 1), v49 + 1, 1, v38);
              v38[2] = v49 + 1;
              v50 = &v38[3 * v49];
              v50[4] = v44;
              v50[5] = v45;
              v50[6] = v47;
              v29 = v78;
              v28 = v79;
              v30 = v77;
            }
            else
            {
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v82 + 8))(v7, v83);
            }
            v36 += v81;
            if (!--v34)
              break;
            v80(v7, v36, v83);
          }
          swift_bridgeObjectRelease_n();
          v31 = v66;
          v27 = v76;
        }
        else
        {
          swift_bridgeObjectRelease();
          v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
        }
        ++v27;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v31, v71);
        sub_21D9451FC((uint64_t)v38);
      }
      while (v27 != v69);
      swift_bridgeObjectRelease_n();
      v51 = v84;
      v18 = v63;
      v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      swift_bridgeObjectRelease();
      v51 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v84 = v51;
    swift_bridgeObjectRetain();
    sub_21D945364(&v84);
    swift_bridgeObjectRelease();
    v52 = v84;
    v53 = v84[2];
    if (v53)
    {
      v54 = v18;
      v84 = v24;
      sub_21D944CD8(0, v53, 0);
      v24 = v84;
      v55 = v52 + 6;
      do
      {
        v57 = *(v55 - 1);
        v56 = *v55;
        v84 = v24;
        v58 = v24[2];
        v59 = v24[3];
        swift_bridgeObjectRetain();
        if (v58 >= v59 >> 1)
        {
          sub_21D944CD8(v59 > 1, v58 + 1, 1);
          v24 = v84;
        }
        v24[2] = v58 + 1;
        v60 = &v24[2 * v58];
        v60[4] = v57;
        v60[5] = v56;
        v55 += 3;
        --v53;
      }
      while (v53);
      swift_release();
      v18 = v54;
    }
    else
    {
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v64 + 8))(v18, v65);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v24;
}

BOOL hasMoodLoggingIdentifier(from:)(uint64_t a1)
{
  return sub_21D943400(a1, (uint64_t)&unk_24E13D570);
}

BOOL hasWorkoutIdentifier(from:)(uint64_t a1)
{
  return sub_21D943400(a1, (uint64_t)&unk_24E13D5C0);
}

BOOL sub_21D943400(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = sub_21D942AF4(a2);
  v4 = sub_21D942DE0(a1, v3);
  swift_bridgeObjectRelease();
  v5 = v4[2];
  swift_bridgeObjectRelease();
  return v5 != 0;
}

uint64_t isProbablyWorkout(from:requireWorkoutIdentifier:)(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  unint64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  char v48[24];
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v47 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F2E8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21D94C394();
  v40 = *(_QWORD *)(v6 - 8);
  v41 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21D94C3F4();
  v44 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v38 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21D94C340();
  v43 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v42 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21D94C310();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v38 - v17;
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v20 = a1;
  v19((char *)&v38 - v17, a1, v12);
  v45 = v8;
  v46 = v10;
  if ((v47 & 1) != 0)
  {
    v21 = sub_21D942AF4((uint64_t)&unk_24E13D610);
    v22 = v5;
    v23 = sub_21D942DE0((uint64_t)v18, v21);
    swift_bridgeObjectRelease();
    v24 = v23[2];
    v5 = v22;
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v13 + 8);
    v25(v18, v12);
    if (!v24)
      return 0;
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t))(v13 + 8);
    v25(v18, v12);
  }
  v19(v16, v20, v12);
  if ((*(unsigned int (**)(char *, uint64_t))(v13 + 88))(v16, v12) != *MEMORY[0x24BE98E98])
  {
    v25(v16, v12);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v13 + 96))(v16, v12);
  v27 = v42;
  v26 = v43;
  v28 = v46;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v16, v46);
  v29 = v39;
  sub_21D94C328();
  v30 = sub_21D94C370();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v29, v41);
  if (*(_QWORD *)(v30 + 16))
  {
    v32 = v44;
    v31 = v45;
    (*(void (**)(char *, unint64_t, uint64_t))(v44 + 16))(v5, v30 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80)), v45);
    v33 = 0;
  }
  else
  {
    v33 = 1;
    v32 = v44;
    v31 = v45;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v5, v33, 1, v31);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v5, 1, v31) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
    sub_21D930660((uint64_t)v5, &qword_25538F2E8);
    return 0;
  }
  v36 = v38;
  (*(void (**)(void))(v32 + 32))();
  v34 = sub_21D94C3B8();
  if (v34)
  {
    sub_21D94C5C8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v36, v31);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
    if (v49)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25538F300);
      if (swift_dynamicCast())
      {
        v37 = *((_QWORD *)&v51 + 1);
      }
      else
      {
        v37 = 0;
        v52 = 0;
        v50 = 0u;
        v51 = 0u;
      }
    }
    else
    {
      sub_21D930660((uint64_t)v48, &qword_25538F2F0);
      v37 = 0;
      v50 = 0u;
      v51 = 0u;
      v52 = 0;
    }
    v34 = v37 != 0;
    sub_21D930660((uint64_t)&v50, &qword_25538F2F8);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v36, v31);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  }
  return v34;
}

uint64_t getWorkoutName(from:fallback:)(uint64_t a1, int a2)
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
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t result;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = sub_21D94C4E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F150);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return 0;
  swift_retain();
  if (sub_21D94C5B0())
  {
    v11 = sub_21D94C514();
    swift_release();
    if (v11)
    {
      v33 = *(_QWORD *)(v11 + 16);
      if (v33)
      {
        v29 = v11;
        v30 = v10;
        v31 = a2;
        v32 = a1;
        v36 = v11 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        v12 = *(_QWORD *)(v5 + 72);
        v34 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
        v35 = v12;
        swift_bridgeObjectRetain();
        v13 = 0;
        while (2)
        {
          v34(v7, v36 + v35 * v13, v4);
          v14 = sub_21D94C4D8();
          if (v15)
            v16 = v14;
          else
            v16 = 0;
          if (v15)
            v17 = v15;
          else
            v17 = 0xE000000000000000;
          v18 = *(_QWORD *)"workoutName" == v16 && *(_QWORD *)"ame" == v17;
          if (v18 || (result = sub_21D94D1EC(), (result & 1) != 0))
          {
LABEL_27:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v10 = v30;
            (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v30, v7, v4);
            v24 = 0;
            LOBYTE(a2) = v31;
          }
          else
          {
            v20 = "Name";
            v21 = 1;
            do
            {
              v22 = v21 + 1;
              if (__OFADD__(v21, 1))
              {
                __break(1u);
                return result;
              }
              if (*((_QWORD *)v20 - 1) == v16 && *(_QWORD *)v20 == v17)
                goto LABEL_27;
              result = sub_21D94D1EC();
              if ((result & 1) != 0)
                goto LABEL_27;
              v20 += 16;
              ++v21;
            }
            while (v22 != 2);
            ++v13;
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
            if (v13 != v33)
              continue;
            swift_bridgeObjectRelease();
            v24 = 1;
            LOBYTE(a2) = v31;
            v10 = v30;
          }
          break;
        }
      }
      else
      {
        v24 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v24, 1, v4);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
      {
        sub_21D930660((uint64_t)v10, &qword_25538F150);
      }
      else
      {
        v25 = sub_21D94C4CC();
        v27 = v26;
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
        if ((v25 != 0x7374756F6B726F77 || v27 != 0xE800000000000000) && (sub_21D94D1EC() & 1) == 0)
        {
          swift_release();
          return v25;
        }
        swift_bridgeObjectRelease();
      }
    }
  }
  if (sub_21D94C5B0())
  {
    sub_21D94C49C();
    swift_release();
    if (v38)
    {
      v25 = v37;
      if (v37 == 0x7374756F6B726F77 && v38 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
        swift_release();
      }
      else
      {
        v28 = sub_21D94D1EC();
        swift_release();
        if ((v28 & 1) == 0 && (a2 & 1) != 0)
          return v25;
        swift_bridgeObjectRelease();
      }
      return 0;
    }
  }
  swift_release();
  return 0;
}

uint64_t getHealthDataTypeName(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  uint64_t result;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  uint64_t v29;
  unint64_t v30;

  v2 = sub_21D94C4E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F150);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_retain();
    v9 = sub_21D94C514();
    if (v9)
    {
      v27 = *(_QWORD *)(v9 + 16);
      if (v27)
      {
        v25 = v8;
        v26 = a1;
        v30 = v9 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
        v10 = *(_QWORD *)(v3 + 72);
        v28 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
        v29 = v10;
        v24[1] = v9;
        swift_bridgeObjectRetain();
        v11 = 0;
        while (2)
        {
          v28(v5, v30 + v29 * v11, v2);
          v12 = sub_21D94C4D8();
          if (v13)
            v14 = v12;
          else
            v14 = 0;
          if (v13)
            v15 = v13;
          else
            v15 = 0xE000000000000000;
          v16 = *(_QWORD *)"healthLogName" == v14 && *(_QWORD *)"gName" == v15;
          if (v16 || (result = sub_21D94D1EC(), (result & 1) != 0))
          {
LABEL_27:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v8 = v25;
            (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v25, v5, v2);
            v22 = 0;
          }
          else
          {
            v18 = "ogName";
            v19 = 1;
            do
            {
              v20 = v19 + 1;
              if (__OFADD__(v19, 1))
              {
                __break(1u);
                return result;
              }
              if (*((_QWORD *)v18 - 1) == v14 && *(_QWORD *)v18 == v15)
                goto LABEL_27;
              result = sub_21D94D1EC();
              if ((result & 1) != 0)
                goto LABEL_27;
              v18 += 16;
              ++v19;
            }
            while (v20 != 3);
            ++v11;
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
            if (v11 != v27)
              continue;
            swift_bridgeObjectRelease();
            v22 = 1;
            v8 = v25;
          }
          break;
        }
      }
      else
      {
        v22 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, v22, 1, v2);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
      {
        v23 = sub_21D94C4CC();
        swift_release();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
        return v23;
      }
      swift_release();
      sub_21D930660((uint64_t)v8, &qword_25538F150);
    }
    else
    {
      swift_arrayDestroy();
      swift_release();
    }
  }
  return 0;
}

uint64_t isExerciseRequest(in:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, unint64_t, uint64_t);
  uint64_t v28;
  unint64_t v29;

  v2 = sub_21D94C4E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F150);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    goto LABEL_22;
  swift_retain();
  v9 = sub_21D94C514();
  if (!v9)
  {
LABEL_21:
    swift_release();
LABEL_22:
    v18 = 0;
    return v18 & 1;
  }
  v26 = *(_QWORD *)(v9 + 16);
  if (v26)
  {
    v24 = v8;
    v25 = a1;
    v29 = v9 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    v27 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    v28 = v10;
    v23[1] = v9;
    swift_bridgeObjectRetain();
    v11 = 0;
    do
    {
      v27(v5, v29 + v28 * v11, v2);
      v12 = sub_21D94C4D8();
      if (v13)
        v14 = v12;
      else
        v14 = 0;
      if (v13)
        v15 = v13;
      else
        v15 = 0xE000000000000000;
      v16 = *(_QWORD *)"workoutName" == v14 && *(_QWORD *)"ame" == v15;
      if (v16 || (sub_21D94D1EC() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v8 = v24;
        (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v24, v5, v2);
        v17 = 0;
        goto LABEL_19;
      }
      ++v11;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    while (v11 != v26);
    swift_bridgeObjectRelease();
    v17 = 1;
    v8 = v24;
  }
  else
  {
    v17 = 1;
  }
LABEL_19:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, v17, 1, v2);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_21D930660((uint64_t)v8, &qword_25538F150);
    goto LABEL_21;
  }
  v20 = sub_21D94C4CC();
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  if (v20 == 0x6573696372657865 && v22 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    swift_release();
    v18 = 1;
  }
  else
  {
    v18 = sub_21D94D1EC();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v18 & 1;
}

uint64_t getMeasurementUnit(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
    v1 = sub_21D94CAA8();
  else
    v1 = 0;
  v2 = getMeasurementUnit(from:)(v1);
  swift_release();
  return v2;
}

{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v19[3];
  void (*v20)(char *, unint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_21D94C4E4();
  v22 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BEE4AF8];
  if (a1)
  {
    swift_retain();
    v6 = sub_21D94C514();
    if (v6)
    {
      v7 = sub_21D945FC0(v6, qword_24E13D720);
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      v8 = *(_QWORD *)(v7 + 16);
      if (v8)
      {
        v19[2] = a1;
        v23 = v5;
        sub_21D944CD8(0, v8, 0);
        v9 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
        v19[1] = v7;
        v10 = v7 + v9;
        v11 = *(_QWORD *)(v22 + 72);
        v20 = *(void (**)(char *, unint64_t, uint64_t))(v22 + 16);
        v21 = v11;
        do
        {
          v20(v4, v10, v2);
          v12 = sub_21D94C4CC();
          v14 = v13;
          (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v2);
          v5 = v23;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_21D944CD8(0, *(_QWORD *)(v5 + 16) + 1, 1);
            v5 = v23;
          }
          v16 = *(_QWORD *)(v5 + 16);
          v15 = *(_QWORD *)(v5 + 24);
          if (v16 >= v15 >> 1)
          {
            sub_21D944CD8(v15 > 1, v16 + 1, 1);
            v5 = v23;
          }
          *(_QWORD *)(v5 + 16) = v16 + 1;
          v17 = v5 + 16 * v16;
          *(_QWORD *)(v17 + 32) = v12;
          *(_QWORD *)(v17 + 40) = v14;
          v10 += v21;
          --v8;
        }
        while (v8);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_arrayDestroy();
    }
    swift_release();
  }
  return v5;
}

uint64_t getAreaType(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;

  v2 = sub_21D94C4E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F150);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return 0;
  swift_retain();
  if (!sub_21D94C5B0()
    || (v9 = sub_21D94C64C(), swift_release(), !v9)
    || (v10 = sub_21D94C514(), swift_release(), !v10))
  {
    swift_release();
    return 0;
  }
  v11 = *(_QWORD *)(v10 + 16);
  if (!v11)
  {
    v20 = 1;
    goto LABEL_19;
  }
  v21 = v10;
  v22 = v8;
  v12 = v10 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v13 = *(_QWORD *)(v3 + 72);
  v14 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  v24 = "outName";
  v23 = 0x800000021D94EBE0;
  while (1)
  {
    v14(v5, v12, v2);
    v16 = sub_21D94C4D8();
    if (!v17)
      goto LABEL_8;
    if (v16 == 0xD000000000000016 && v17 == v23)
      break;
    v15 = sub_21D94D1EC();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      goto LABEL_18;
LABEL_8:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v12 += v13;
    if (!--v11)
    {
      swift_bridgeObjectRelease();
      v20 = 1;
      v8 = v22;
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease();
LABEL_18:
  swift_bridgeObjectRelease();
  v8 = v22;
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v22, v5, v2);
  v20 = 0;
LABEL_19:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, v20, 1, v2);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    swift_release();
    sub_21D930660((uint64_t)v8, &qword_25538F150);
    return 0;
  }
  v18 = sub_21D94C4CC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return v18;
}

unint64_t sub_21D944874(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21D94D048();
  return sub_21D94497C(a1, v2);
}

unint64_t sub_21D9448A4(unsigned __int8 a1)
{
  uint64_t v2;

  sub_21D94D24C();
  HealthLogName.rawValue.getter(a1);
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  v2 = sub_21D94D264();
  return sub_21D944A84(a1, v2);
}

unint64_t sub_21D944918(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21D94D24C();
  sub_21D94CF58();
  v4 = sub_21D94D264();
  return sub_21D944BF8(a1, a2, v4);
}

unint64_t sub_21D94497C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_21D94CE68();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_21D94D054();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_21D94D054();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_21D944A84(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = HealthLogName.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v2 + 48) + v5));
    v9 = v8;
    if (v7 == HealthLogName.rawValue.getter(a1) && v9 == v10)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v12 = sub_21D94D1EC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
    {
      v13 = ~v4;
      v5 = (v5 + 1) & v13;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v14 = HealthLogName.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v2 + 48) + v5));
          v16 = v15;
          if (v14 == HealthLogName.rawValue.getter(a1) && v16 == v17)
            break;
          v19 = sub_21D94D1EC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v19 & 1) == 0)
          {
            v5 = (v5 + 1) & v13;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_21D944BF8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21D94D1EC() & 1) == 0)
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
      while (!v14 && (sub_21D94D1EC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21D944CD8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21D944D10(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21D944CF4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21D94501C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21D944D10(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538F310);
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
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

uint64_t sub_21D944E78(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEC8);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EED0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

uint64_t sub_21D94501C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538F318);
  v10 = *(_QWORD *)(sub_21D94C4E4() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_21D94C4E4() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

uint64_t sub_21D9451FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
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
  v3 = sub_21D9327A0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  v9 = (unint64_t)&v3[3 * v8 + 4];
  if (a1 + 32 < v9 + 24 * v2 && v9 < a1 + 32 + 24 * v2)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25538EED0);
  swift_arrayInitWithCopy();
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
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

uint64_t sub_21D945364(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_21D945F64(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_21D9453CC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_21D9453CC(uint64_t *a1)
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
  uint64_t *v17;
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
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  uint64_t i;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *__dst;

  v3 = a1[1];
  result = sub_21D94D1C8();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v88 = 0;
      v89 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v91 = *(_QWORD *)(v89 + 24 * i);
        v92 = v88;
        do
        {
          v93 = v89 + v92;
          if (v91 >= *(_QWORD *)(v89 + v92))
            break;
          if (!v89)
            goto LABEL_140;
          v94 = (_QWORD *)(v89 + v92);
          v95 = *(_QWORD *)(v89 + v92 + 32);
          v96 = *(_QWORD *)(v89 + v92 + 40);
          *(_OWORD *)(v89 + v92 + 24) = *(_OWORD *)v93;
          *(_QWORD *)(v89 + v92 + 40) = *(_QWORD *)(v93 + 16);
          *v94 = v91;
          v94[1] = v95;
          v94[2] = v96;
          v92 -= 24;
        }
        while (v92 != -24);
        v88 += 24;
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
  v106 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v97 = v12;
      v108 = v9;
      if (v13 >= 2)
      {
        v98 = *v106;
        do
        {
          v99 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v98)
            goto LABEL_144;
          v100 = v97;
          v101 = *(_QWORD *)&v97[16 * v99 + 32];
          v102 = *(_QWORD *)&v97[16 * v13 + 24];
          sub_21D945AE8((char *)(v98 + 24 * v101), (char *)(v98 + 24 * *(_QWORD *)&v97[16 * v13 + 16]), v98 + 24 * v102, __dst);
          if (v1)
            break;
          if (v102 < v101)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v100 = sub_21D945F50((uint64_t)v100);
          if (v99 >= *((_QWORD *)v100 + 2))
            goto LABEL_133;
          v103 = &v100[16 * v99 + 32];
          *(_QWORD *)v103 = v101;
          *((_QWORD *)v103 + 1) = v102;
          v104 = *((_QWORD *)v100 + 2);
          if (v13 > v104)
            goto LABEL_134;
          memmove(&v100[16 * v13 + 16], &v100[16 * v13 + 32], 16 * (v104 - v13));
          v97 = v100;
          *((_QWORD *)v100 + 2) = v104 - 1;
          v13 = v104 - 1;
        }
        while (v104 > 2);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EED0);
    v8 = sub_21D94CFE8();
    *(_QWORD *)(v8 + 16) = v7;
    v108 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v107 = *a1 + 48;
  v105 = *a1 - 24;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v109 = v6;
  v110 = v3;
  v111 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(_QWORD *)(v11 + 24 * v10);
      v16 = *(_QWORD *)(v11 + 24 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (uint64_t *)(v107 + 24 * v14);
        v18 = v15;
        while (1)
        {
          v20 = *v17;
          v17 += 3;
          v19 = v20;
          if (v15 < v16 == v20 >= v18)
            break;
          ++v10;
          v18 = v19;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v21 = 24 * v10;
          v22 = 24 * v14;
          v23 = v10;
          v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11)
                goto LABEL_143;
              v25 = v11 + v22;
              v26 = v11 + v21;
              v27 = *(_QWORD *)(v11 + v22 + 16);
              v28 = *(_OWORD *)(v11 + v22);
              v29 = *(_QWORD *)(v11 + v21 - 8);
              *(_OWORD *)v25 = *(_OWORD *)(v11 + v21 - 24);
              *(_QWORD *)(v25 + 16) = v29;
              *(_OWORD *)(v26 - 24) = v28;
              *(_QWORD *)(v26 - 8) = v27;
            }
            ++v24;
            v21 -= 24;
            v22 += 24;
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
    v30 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v30 >= v3)
      v30 = v3;
    if (v30 < v14)
      break;
    if (v10 != v30)
    {
      v31 = v105 + 24 * v10;
      do
      {
        v32 = *(_QWORD *)(v11 + 24 * v10);
        v33 = v14;
        v34 = v31;
        do
        {
          if (v32 >= *(_QWORD *)v34)
            break;
          if (!v11)
            goto LABEL_141;
          v35 = *(_QWORD *)(v34 + 32);
          v36 = *(_QWORD *)(v34 + 40);
          *(_OWORD *)(v34 + 24) = *(_OWORD *)v34;
          *(_QWORD *)(v34 + 40) = *(_QWORD *)(v34 + 16);
          *(_QWORD *)v34 = v32;
          *(_QWORD *)(v34 + 8) = v35;
          *(_QWORD *)(v34 + 16) = v36;
          v34 -= 24;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 24;
      }
      while (v10 != v30);
      v10 = v30;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_21D945D9C(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v38 = *((_QWORD *)v12 + 2);
    v37 = *((_QWORD *)v12 + 3);
    v13 = v38 + 1;
    v11 = v111;
    if (v38 >= v37 >> 1)
    {
      v87 = sub_21D945D9C((char *)(v37 > 1), v38 + 1, 1, v12);
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
            goto LABEL_119;
          v51 = *((_QWORD *)v46 - 6);
          v50 = *((_QWORD *)v46 - 5);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_120;
          v53 = v13 - 2;
          v54 = &v39[16 * v13 - 32];
          v56 = *(_QWORD *)v54;
          v55 = *((_QWORD *)v54 + 1);
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_122;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_125;
          if (v58 >= v49)
          {
            v76 = &v39[16 * v41];
            v78 = *(_QWORD *)v76;
            v77 = *((_QWORD *)v76 + 1);
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_129;
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
          goto LABEL_121;
        v53 = v13 - 2;
        v59 = &v39[16 * v13 - 32];
        v61 = *(_QWORD *)v59;
        v60 = *((_QWORD *)v59 + 1);
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_124;
        v65 = &v39[16 * v41];
        v67 = *(_QWORD *)v65;
        v66 = *((_QWORD *)v65 + 1);
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_127;
        if (__OFADD__(v63, v68))
          goto LABEL_128;
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
          goto LABEL_123;
        v72 = &v39[16 * v41];
        v74 = *(_QWORD *)v72;
        v73 = *((_QWORD *)v72 + 1);
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_126;
        if (v75 < v63)
          goto LABEL_15;
LABEL_85:
        v80 = v41 - 1;
        if (v41 - 1 >= v13)
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
        v81 = v12;
        v82 = &v39[16 * v80];
        v83 = *(_QWORD *)v82;
        v84 = &v39[16 * v41];
        v85 = *((_QWORD *)v84 + 1);
        sub_21D945AE8((char *)(v11 + 24 * *(_QWORD *)v82), (char *)(v11 + 24 * *(_QWORD *)v84), v11 + 24 * v85, __dst);
        if (v1)
          goto LABEL_93;
        if (v85 < v83)
          goto LABEL_116;
        if (v41 > *((_QWORD *)v81 + 2))
          goto LABEL_117;
        *(_QWORD *)v82 = v83;
        *(_QWORD *)&v39[16 * v80 + 8] = v85;
        v86 = *((_QWORD *)v81 + 2);
        if (v41 >= v86)
          goto LABEL_118;
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
  result = sub_21D94D180();
  __break(1u);
  return result;
}

uint64_t sub_21D945AE8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t result;
  char *v24;
  char *v25;
  char *v26;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  v26 = __src;
  v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[24 * v11] <= __dst)
        memmove(__dst, a2, 24 * v11);
      v16 = &v4[24 * v11];
      v24 = v16;
      v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        v17 = a3 - 24;
        v18 = v6;
        while (1)
        {
          v19 = (char *)(v17 + 24);
          v20 = *((_QWORD *)v18 - 3);
          v18 -= 24;
          if (*((_QWORD *)v16 - 3) >= v20)
          {
            v24 = v16 - 24;
            if (v19 < v16 || v17 >= (unint64_t)v16 || v19 != v16)
            {
              v22 = *(_OWORD *)(v16 - 24);
              *(_QWORD *)(v17 + 16) = *((_QWORD *)v16 - 1);
              *(_OWORD *)v17 = v22;
            }
            v18 = v6;
            v16 -= 24;
            if (v6 <= v7)
              goto LABEL_38;
          }
          else
          {
            if (v19 != v6 || v17 >= (unint64_t)v6)
            {
              v21 = *(_OWORD *)v18;
              *(_QWORD *)(v17 + 16) = *((_QWORD *)v18 + 2);
              *(_OWORD *)v17 = v21;
            }
            v26 = v18;
            if (v18 <= v7)
              goto LABEL_38;
          }
          v17 -= 24;
          v6 = v18;
          if (v16 <= v4)
            goto LABEL_38;
        }
      }
      goto LABEL_38;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst)
      memmove(__dst, __src, 24 * v9);
    v12 = &v4[24 * v9];
    v24 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      do
      {
        if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        {
          if (v7 != v4)
          {
            v15 = *(_OWORD *)v4;
            *((_QWORD *)v7 + 2) = *((_QWORD *)v4 + 2);
            *(_OWORD *)v7 = v15;
          }
          v4 += 24;
          v25 = v4;
          v13 = v6;
        }
        else
        {
          v13 = v6 + 24;
          if (v7 < v6 || v7 >= v13 || v7 != v6)
          {
            v14 = *(_OWORD *)v6;
            *((_QWORD *)v7 + 2) = *((_QWORD *)v6 + 2);
            *(_OWORD *)v7 = v14;
          }
        }
        v7 += 24;
        if (v4 >= v12)
          break;
        v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      v26 = v7;
    }
LABEL_38:
    sub_21D945E94((void **)&v26, (const void **)&v25, &v24);
    return 1;
  }
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

char *sub_21D945D9C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538F320);
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

char *sub_21D945E94(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -24)
  {
    result = (char *)sub_21D94D1B0();
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

char *sub_21D945F50(uint64_t a1)
{
  return sub_21D945D9C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21D945F64(_QWORD *a1)
{
  return sub_21D944E78(0, a1[2], 0, a1);
}

uint64_t _s18HealthDomainsTools22USOIdentifierNamespaceO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21D94D1BC();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA)
    return 10;
  else
    return v0;
}

uint64_t sub_21D945FC0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;

  v5 = sub_21D94C4E4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v38 = (char *)&v29 - v9;
  result = MEMORY[0x24BEE4AF8];
  v39 = MEMORY[0x24BEE4AF8];
  v34 = *(_QWORD *)(a1 + 16);
  if (!v34)
    return result;
  v29 = v2;
  v11 = 0;
  v12 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v13 = *(_QWORD *)(v6 + 72);
  v36 = a2;
  v37 = v13;
  v31 = v12;
  v33 = a1 + v12;
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v30 = a2 + 7;
  while (1)
  {
    v14 = v5;
    v32(v38, v33 + v37 * v11, v5);
    v15 = sub_21D94C4D8();
    v17 = v16 ? v15 : 0;
    v18 = v16 ? v16 : 0xE000000000000000;
    v19 = a2[2];
    if (v19)
    {
      v20 = a2[4] == v17 && a2[5] == v18;
      if (v20 || (result = sub_21D94D1EC(), (result & 1) != 0))
      {
LABEL_17:
        swift_bridgeObjectRelease();
        v21 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
        v5 = v14;
        v21(v35, v38, v14);
        v22 = v39;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21D944CF4(0, *(_QWORD *)(v22 + 16) + 1, 1);
          v22 = v39;
        }
        v24 = *(_QWORD *)(v22 + 16);
        v23 = *(_QWORD *)(v22 + 24);
        if (v24 >= v23 >> 1)
        {
          sub_21D944CF4(v23 > 1, v24 + 1, 1);
          v22 = v39;
        }
        *(_QWORD *)(v22 + 16) = v24 + 1;
        v21((char *)(v22 + v31 + v24 * v37), v35, v14);
        v39 = v22;
        a2 = v36;
        goto LABEL_4;
      }
      a2 = v36;
      if (v19 != 1)
        break;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    v5 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v38, v14);
LABEL_4:
    if (++v11 == v34)
      return v39;
  }
  v25 = v30;
  v26 = 1;
  while (1)
  {
    v27 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (*(v25 - 1) == v17 && *v25 == v18)
      goto LABEL_17;
    result = sub_21D94D1EC();
    if ((result & 1) != 0)
      goto LABEL_17;
    v25 += 2;
    ++v26;
    v20 = v27 == v19;
    a2 = v36;
    if (v20)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

unint64_t sub_21D94625C()
{
  unint64_t result;

  result = qword_25538F308;
  if (!qword_25538F308)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for USOIdentifierNamespace, &type metadata for USOIdentifierNamespace);
    atomic_store(result, (unint64_t *)&qword_25538F308);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for USOIdentifierNamespace(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for USOIdentifierNamespace(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_21D94637C + 4 * byte_21D94E09F[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_21D9463B0 + 4 * byte_21D94E09A[v4]))();
}

uint64_t sub_21D9463B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D9463B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21D9463C0);
  return result;
}

uint64_t sub_21D9463CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21D9463D4);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_21D9463D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D9463E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for USOIdentifierNamespace()
{
  return &type metadata for USOIdentifierNamespace;
}

uint64_t getWorkoutEntity(from:)()
{
  uint64_t v0;
  uint64_t v2;
  _BYTE v3[32];
  _BYTE v4[24];
  uint64_t v5;
  _BYTE v6[32];

  sub_21D94C5C8();
  sub_21D946618((uint64_t)v6, (uint64_t)v4);
  if (v5)
  {
    sub_21D946618((uint64_t)v4, (uint64_t)v3);
    sub_21D94C6E8();
    if (swift_dynamicCast())
      goto LABEL_15;
    sub_21D94C688();
    if (swift_dynamicCast())
      goto LABEL_9;
    sub_21D94C6B8();
    if (swift_dynamicCast())
      goto LABEL_9;
    sub_21D94C70C();
    if (swift_dynamicCast())
      goto LABEL_9;
    sub_21D94C6DC();
    if (swift_dynamicCast())
      goto LABEL_15;
    sub_21D94C718();
    if (swift_dynamicCast())
    {
LABEL_9:
      swift_retain();
      sub_21D94C8D4();
LABEL_10:
      swift_release_n();
      sub_21D946660((uint64_t)v6);
      v0 = v2;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
      goto LABEL_11;
    }
    sub_21D94C6F4();
    if (swift_dynamicCast())
    {
LABEL_15:
      swift_retain();
      sub_21D94C46C();
      goto LABEL_10;
    }
    sub_21D946660((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    sub_21D946660((uint64_t)v6);
  }
  v0 = 0;
LABEL_11:
  sub_21D946660((uint64_t)v4);
  return v0;
}

uint64_t sub_21D946618(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F2F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D946660(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F2F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getHealthLogEntity(from:)()
{
  uint64_t v0;
  uint64_t v2;
  _BYTE v3[32];
  _BYTE v4[24];
  uint64_t v5;
  _BYTE v6[32];

  sub_21D94C5C8();
  sub_21D946618((uint64_t)v6, (uint64_t)v4);
  if (v5)
  {
    sub_21D946618((uint64_t)v4, (uint64_t)v3);
    sub_21D94C850();
    if (swift_dynamicCast())
      goto LABEL_10;
    sub_21D94C484();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_21D94CBD4();
LABEL_11:
      swift_release_n();
      sub_21D946660((uint64_t)v6);
      v0 = v2;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
      goto LABEL_12;
    }
    sub_21D94C700();
    if (swift_dynamicCast() || (sub_21D94CB44(), swift_dynamicCast()))
    {
LABEL_10:
      swift_retain();
      sub_21D94C46C();
      goto LABEL_11;
    }
    sub_21D946660((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    sub_21D946660((uint64_t)v6);
  }
  v0 = 0;
LABEL_12:
  sub_21D946660((uint64_t)v4);
  return v0;
}

uint64_t getAppEntity(from:)()
{
  uint64_t v0;
  uint64_t v2;
  _BYTE v3[32];
  _BYTE v4[24];
  uint64_t v5;
  _BYTE v6[32];

  sub_21D94C5C8();
  sub_21D946618((uint64_t)v6, (uint64_t)v4);
  if (v5)
  {
    sub_21D946618((uint64_t)v4, (uint64_t)v3);
    sub_21D94C6E8();
    if (swift_dynamicCast())
      goto LABEL_18;
    sub_21D94C688();
    if (swift_dynamicCast())
      goto LABEL_9;
    sub_21D94C6B8();
    if (swift_dynamicCast())
      goto LABEL_9;
    sub_21D94C70C();
    if (swift_dynamicCast())
      goto LABEL_9;
    sub_21D94C6DC();
    if (swift_dynamicCast())
      goto LABEL_18;
    sub_21D94C718();
    if (swift_dynamicCast())
    {
LABEL_9:
      swift_retain();
      sub_21D94C8D4();
      goto LABEL_10;
    }
    sub_21D94C6F4();
    if (swift_dynamicCast())
    {
LABEL_18:
      swift_retain();
      sub_21D94C46C();
LABEL_10:
      swift_release();
      if (v2)
      {
        v0 = sub_21D94C508();
        swift_release();
        swift_release();
        sub_21D946660((uint64_t)v6);
      }
      else
      {
        sub_21D946660((uint64_t)v6);
        swift_release();
        v0 = 0;
      }
      goto LABEL_13;
    }
    sub_21D94C61C();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_21D94C46C();
      swift_release_n();
      sub_21D946660((uint64_t)v6);
      v0 = v2;
LABEL_13:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
      goto LABEL_14;
    }
    sub_21D946660((uint64_t)v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    sub_21D946660((uint64_t)v6);
  }
  v0 = 0;
LABEL_14:
  sub_21D946660((uint64_t)v4);
  return v0;
}

uint64_t HealthApps.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21D946B18
                                                                     + 4 * asc_21D94E220[a1]))(0xD00000000000002ALL, 0x800000021D94EC60);
}

unint64_t sub_21D946B18()
{
  return 0xD000000000000019;
}

uint64_t sub_21D946BC8()
{
  uint64_t v0;

  return v0 - 8;
}

uint64_t sub_21D946BD8()
{
  uint64_t v0;

  return v0 - 9;
}

uint64_t sub_21D946BE8()
{
  uint64_t v0;

  return v0 + 3;
}

void sub_21D946BF8()
{
  JUMPOUT(0x21D946C04);
}

uint64_t sub_21D946C10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F338);
  MEMORY[0x24BDAC7A8](v3);
  v27 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v21 = v1;
    v31 = MEMORY[0x24BEE4AF8];
    sub_21D94D114();
    result = sub_21D947898(a1);
    v8 = result;
    v9 = 0;
    v10 = a1 + 64;
    v22 = a1 + 80;
    v23 = v5;
    v25 = a1 + 64;
    v26 = a1;
    v24 = v7;
    v11 = (uint64_t)v27;
    while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(_BYTE *)(a1 + 32))
    {
      v13 = (unint64_t)v8 >> 6;
      if ((*(_QWORD *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0)
        goto LABEL_22;
      if (*(_DWORD *)(a1 + 36) != (_DWORD)v7)
        goto LABEL_23;
      v28 = v9;
      v29 = 1 << v8;
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16 * v8);
      sub_21D94CDE4();
      swift_allocObject();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21D94CDD8();
      sub_21D94CF4C();
      v14 = sub_21D94CDA8();
      v15 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
      v15(v11, 0, 1, v14);
      sub_21D94CDC0();
      swift_release();
      sub_21D947858(v11);
      sub_21D94CF4C();
      v15(v11, 0, 1, v14);
      sub_21D94CDB4();
      swift_release();
      sub_21D947858(v11);
      sub_21D94CDCC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      sub_21D94D0FC();
      sub_21D94D120();
      a1 = v26;
      sub_21D94D12C();
      result = sub_21D94D108();
      v12 = 1 << *(_BYTE *)(a1 + 32);
      if (v8 >= v12)
        goto LABEL_24;
      v10 = v25;
      v16 = *(_QWORD *)(v25 + 8 * v13);
      if ((v16 & v29) == 0)
        goto LABEL_25;
      LODWORD(v7) = v24;
      if (*(_DWORD *)(a1 + 36) != (_DWORD)v24)
        goto LABEL_26;
      v17 = v16 & (-2 << (v8 & 0x3F));
      if (v17)
      {
        v12 = __clz(__rbit64(v17)) | v8 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        v18 = v13 + 1;
        v19 = (unint64_t)(v12 + 63) >> 6;
        if (v13 + 1 < v19)
        {
          v20 = *(_QWORD *)(v25 + 8 * v18);
          if (v20)
          {
LABEL_18:
            v12 = __clz(__rbit64(v20)) + (v18 << 6);
          }
          else
          {
            while (v19 - 2 != v13)
            {
              v20 = *(_QWORD *)(v22 + 8 * v13++);
              if (v20)
              {
                v18 = v13 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      v9 = v28 + 1;
      v8 = v12;
      if (v28 + 1 == v23)
        return v31;
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

id getApplicationState(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v4 = sub_21D94CEBC();
  MEMORY[0x24BDAC7A8](v4);
  v5 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v6 = sub_21D947780(a1, a2, 0);
  v7 = objc_msgSend(v6, sel_applicationState);

  return v7;
}

Swift::Bool __swiftcall appBundleIsInstalled(_:)(Swift::String a1)
{
  return sub_21D947278(a1._countAndFlagsBits, (uint64_t)a1._object, (SEL *)&selRef_isInstalled);
}

Swift::Bool __swiftcall appBundleIsRestricted(_:)(Swift::String a1)
{
  return sub_21D947278(a1._countAndFlagsBits, (uint64_t)a1._object, (SEL *)&selRef_isRestricted);
}

id sub_21D947278(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = getApplicationState(_:)(a1, a2);
  if (!v4)
    return 0;
  v5 = v4;
  if (objc_msgSend(v4, sel_isValid))
    v6 = objc_msgSend(v5, *a3);
  else
    v6 = 0;

  return v6;
}

uint64_t HealthApps.app.getter(unsigned __int8 a1)
{
  sub_21D94CE08();
  HealthApps.rawValue.getter(a1);
  return sub_21D94CDF0();
}

uint64_t HealthApps.sirikitApp.getter(unsigned __int8 a1)
{
  sub_21D94CD9C();
  HealthApps.rawValue.getter(a1);
  return SirikitApp.init(_:)();
}

uint64_t SirikitApp.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[16];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F338);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v8[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21D94CE08();
  swift_bridgeObjectRetain();
  sub_21D94CDF0();
  v3 = (void *)sub_21D94C2B0();
  swift_release();
  if (v3 && (v4 = objc_msgSend(v3, sel_appNameMap), v3, v4))
  {
    v5 = sub_21D94CEF8();

    sub_21D946C10(v5);
    swift_bridgeObjectRelease();
    sub_21D94CD84();
    swift_allocObject();
    sub_21D94CD78();
    sub_21D94CF4C();
    swift_bridgeObjectRelease();
    v6 = sub_21D94CDA8();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v2, 0, 1, v6);
    sub_21D94CD6C();
    swift_release();
    sub_21D947858((uint64_t)v2);
    sub_21D94CD60();
    swift_release();
    swift_bridgeObjectRelease();
    return sub_21D94CD90();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

id HealthApps.isInstalled.getter(unsigned __int8 a1)
{
  return sub_21D94751C(a1, (SEL *)&selRef_isInstalled);
}

id HealthApps.isRestricted.getter(unsigned __int8 a1)
{
  return sub_21D94751C(a1, (SEL *)&selRef_isRestricted);
}

id sub_21D94751C(unsigned __int8 a1, SEL *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = HealthApps.rawValue.getter(a1);
  v5 = getApplicationState(_:)(v3, v4);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v6 = v5;
  if ((objc_msgSend(v5, sel_isValid) & 1) == 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  v7 = objc_msgSend(v6, *a2);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t sub_21D9475A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = HealthApps.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == HealthApps.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_21D94D1EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21D947630()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21D94D24C();
  HealthApps.rawValue.getter(v1);
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D947690()
{
  unsigned __int8 *v0;

  HealthApps.rawValue.getter(*v0);
  sub_21D94CF58();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21D9476D0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_21D94D24C();
  HealthApps.rawValue.getter(v1);
  sub_21D94CF58();
  swift_bridgeObjectRelease();
  return sub_21D94D264();
}

uint64_t sub_21D94772C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18HealthDomainsTools0A4AppsO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21D947758@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = HealthApps.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_21D947780(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_21D94BFBC();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_21D947858(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F338);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21D947898(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t _s18HealthDomainsTools0A4AppsO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21D94D1BC();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE)
    return 14;
  else
    return v0;
}

unint64_t sub_21D94796C()
{
  unint64_t result;

  result = qword_25538F340;
  if (!qword_25538F340)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for HealthApps, &type metadata for HealthApps);
    atomic_store(result, (unint64_t *)&qword_25538F340);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HealthApps(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthApps(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_21D947A8C + 4 * byte_21D94E233[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_21D947AC0 + 4 * byte_21D94E22E[v4]))();
}

uint64_t sub_21D947AC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D947AC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21D947AD0);
  return result;
}

uint64_t sub_21D947ADC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21D947AE4);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_21D947AE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21D947AF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HealthApps()
{
  return &type metadata for HealthApps;
}

uint64_t LaunchAppFlow.init(app:)@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = sub_21D94C19C();
  *(_BYTE *)(a2 + 40) = a1;
  return result;
}

uint64_t LaunchAppFlow.init(aceService:app:)@<X0>(__int128 *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = sub_21D930780(a1, a3);
  *(_BYTE *)(a3 + 40) = a2;
  return result;
}

id sub_21D947B60()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81130]), sel_init);
  HealthApps.rawValue.getter(*(_BYTE *)(v0 + 40));
  v2 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setLaunchId_, v2);

  __swift_project_boxed_opaque_existential_1((_QWORD *)v0, *(_QWORD *)(v0 + 24));
  v3 = v1;
  sub_21D94C2E0();
  if (v4)
  {
    v5 = (void *)sub_21D94CF28();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, sel_setRefId_, v5);

  return v3;
}

uint64_t LaunchAppFlow.on(input:)()
{
  return 1;
}

uint64_t LaunchAppFlow.execute(completion:)()
{
  sub_21D947C80();
  return sub_21D94C0F4();
}

unint64_t sub_21D947C80()
{
  unint64_t result;

  result = qword_25538F348;
  if (!qword_25538F348)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for LaunchAppFlow, &type metadata for LaunchAppFlow);
    atomic_store(result, (unint64_t *)&qword_25538F348);
  }
  return result;
}

uint64_t LaunchAppFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[28] = a1;
  v2[29] = v1;
  v3 = sub_21D94CEBC();
  v2[30] = v3;
  v2[31] = *(_QWORD *)(v3 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D947D40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  _QWORD *v18;
  uint64_t v20;

  if (qword_25538EA88 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 232);
  v5 = __swift_project_value_buffer(v2, (uint64_t)static Logger.common);
  *(_QWORD *)(v0 + 280) = v5;
  swift_beginAccess();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 288) = v6;
  v6(v1, v5, v2);
  sub_21D948604(v4, v0 + 16);
  v7 = sub_21D94CEA4();
  v8 = sub_21D94D00C();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 272);
  v11 = *(_QWORD *)(v0 + 240);
  v12 = *(_QWORD *)(v0 + 248);
  if (v9)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v20 = v14;
    *(_DWORD *)v13 = 136315138;
    v15 = HealthApps.rawValue.getter(*(_BYTE *)(v0 + 56));
    *(_QWORD *)(v0 + 216) = sub_21D930010(v15, v16, &v20);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    sub_21D948650(v0 + 16);
    _os_log_impl(&dword_21D92C000, v7, v8, "Launching app : %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v14, -1, -1);
    MEMORY[0x2207955E4](v13, -1, -1);

  }
  else
  {
    sub_21D948650(v0 + 16);

  }
  v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v17(v10, v11);
  *(_QWORD *)(v0 + 296) = v17;
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 232), *(_QWORD *)(*(_QWORD *)(v0 + 232) + 24));
  *(_QWORD *)(v0 + 304) = sub_21D947B60();
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v18;
  sub_21D9313E8();
  *v18 = v0;
  v18[1] = sub_21D947FB4;
  return sub_21D94C2F8();
}

uint64_t sub_21D947FB4(void *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  void *v5;

  v4 = *v2;
  *(_QWORD *)(*v2 + 320) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    v5 = *(void **)(v4 + 304);

  }
  return swift_task_switch();
}

uint64_t sub_21D948030()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 232);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 240));
  sub_21D948604(v1, v0 + 112);
  v2 = sub_21D94CEA4();
  v3 = sub_21D94D00C();
  if (os_log_type_enabled(v2, v3))
  {
    v13 = *(_QWORD *)(v0 + 264);
    v14 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    v4 = *(_QWORD *)(v0 + 240);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v15 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = HealthApps.rawValue.getter(*(_BYTE *)(v0 + 152));
    *(_QWORD *)(v0 + 184) = sub_21D930010(v7, v8, &v15);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    sub_21D948650(v0 + 112);
    _os_log_impl(&dword_21D92C000, v2, v3, "App launch submitted : %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v6, -1, -1);
    MEMORY[0x2207955E4](v5, -1, -1);

    v14(v13, v4);
  }
  else
  {
    v9 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    v10 = *(_QWORD *)(v0 + 264);
    v11 = *(_QWORD *)(v0 + 240);
    sub_21D948650(v0 + 112);

    v9(v10, v11);
  }
  sub_21D94C28C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D948204()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;

  v1 = v0 + 112;
  v2 = *(void **)(v0 + 320);
  v4 = *(_QWORD *)(v0 + 280);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
  v5 = *(_QWORD *)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 232);
  v6 = *(_QWORD *)(v0 + 240);

  v3(v5, v4, v6);
  sub_21D948604(v7, v0 + 64);
  v8 = v2;
  v9 = v2;
  v10 = sub_21D94CEA4();
  v11 = sub_21D94D018();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = *(void **)(v0 + 320);
    v39 = *(_QWORD *)(v0 + 256);
    v40 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    v38 = *(_QWORD *)(v0 + 240);
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v42 = v14;
    *(_DWORD *)v13 = 136315394;
    v15 = HealthApps.rawValue.getter(*(_BYTE *)(v0 + 104));
    *(_QWORD *)(v0 + 192) = sub_21D930010(v15, v16, &v42);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    sub_21D948650(v0 + 64);
    *(_WORD *)(v13 + 12) = 2080;
    *(_QWORD *)(v0 + 200) = v12;
    v17 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE60);
    v18 = sub_21D94CF40();
    *(_QWORD *)(v0 + 208) = sub_21D930010(v18, v19, &v42);
    sub_21D94D078();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21D92C000, v10, v11, "Error launching app %s: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v14, -1, -1);
    v20 = v13;
    v1 = v0 + 112;
    MEMORY[0x2207955E4](v20, -1, -1);

    v40(v39, v38);
  }
  else
  {
    v21 = *(void **)(v0 + 320);
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    v23 = *(_QWORD *)(v0 + 256);
    v24 = *(_QWORD *)(v0 + 240);

    sub_21D948650(v0 + 64);
    v22(v23, v24);
  }
  v25 = *(_QWORD *)(v0 + 232);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 288))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 240));
  sub_21D948604(v25, v1);
  v26 = sub_21D94CEA4();
  v27 = sub_21D94D00C();
  v28 = os_log_type_enabled(v26, v27);
  v29 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
  v30 = *(_QWORD *)(v0 + 264);
  v31 = *(_QWORD *)(v0 + 240);
  if (v28)
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v41 = v30;
    v33 = v1;
    v34 = swift_slowAlloc();
    v42 = v34;
    *(_DWORD *)v32 = 136315138;
    v35 = HealthApps.rawValue.getter(*(_BYTE *)(v0 + 152));
    *(_QWORD *)(v0 + 184) = sub_21D930010(v35, v36, &v42);
    sub_21D94D078();
    swift_bridgeObjectRelease();
    sub_21D948650(v33);
    _os_log_impl(&dword_21D92C000, v26, v27, "App launch submitted : %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v34, -1, -1);
    MEMORY[0x2207955E4](v32, -1, -1);

    v29(v41, v31);
  }
  else
  {
    sub_21D948650(v1);

    v29(v30, v31);
  }
  sub_21D94C28C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D948604(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a2, a1);
  *(_BYTE *)(a2 + 40) = *(_BYTE *)(a1 + 40);
  return a2;
}

uint64_t sub_21D948650(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t sub_21D948674(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21D93121C;
  return LaunchAppFlow.execute()(a1);
}

uint64_t SACommandFlow.init(closure:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _BYTE v7[40];

  sub_21D94C19C();
  sub_21D931378((uint64_t)v7, (uint64_t)a2);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v4 = sub_21D94C2E0();
  v5 = a1(v4);
  swift_bridgeObjectRelease();
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  a2[5] = v5;
  return result;
}

uint64_t SACommandFlow.init(aceService:closure:)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  sub_21D931378(a1, (uint64_t)a3);
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  v6 = sub_21D94C2E0();
  v7 = a2(v6);
  swift_bridgeObjectRelease();
  result = __swift_destroy_boxed_opaque_existential_0(a1);
  a3[5] = v7;
  return result;
}

uint64_t SACommandFlow.execute(completion:)()
{
  sub_21D94914C();
  return sub_21D94C0F4();
}

uint64_t SACommandFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = v1;
  v3 = sub_21D94CEBC();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D9488A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void (*v13)(uint64_t, uint64_t);
  _QWORD *v14;

  if (qword_25538EA88 != -1)
    swift_once();
  v1 = v0[12];
  v2 = v0[8];
  v3 = v0[9];
  v4 = __swift_project_value_buffer(v2, (uint64_t)static Logger.common);
  v0[13] = v4;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v5(v1, v4, v2);
  v6 = sub_21D94CEA4();
  v7 = sub_21D94D00C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21D92C000, v6, v7, "Sending command", v8, 2u);
    MEMORY[0x2207955E4](v8, -1, -1);
  }
  v9 = v0[12];
  v10 = v0[8];
  v11 = v0[9];
  v12 = (_QWORD *)v0[7];

  v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[15] = v13;
  v13(v9, v10);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  v14 = (_QWORD *)swift_task_alloc();
  v0[16] = v14;
  sub_21D9313E8();
  *v14 = v0;
  v14[1] = sub_21D948A34;
  return sub_21D94C2F8();
}

uint64_t sub_21D948A34(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 136) = v1;
  swift_task_dealloc();
  if (!v1)

  return swift_task_switch();
}

uint64_t sub_21D948AA0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 64));
  v1 = sub_21D94CEA4();
  v2 = sub_21D94D00C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21D92C000, v1, v2, "command submitted", v3, 2u);
    MEMORY[0x2207955E4](v3, -1, -1);
  }
  v4 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 64);

  v4(v5, v6);
  sub_21D94C28C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D948BA0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 136);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 64));
  v2 = v1;
  v3 = v1;
  v4 = sub_21D94CEA4();
  v5 = sub_21D94D018();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 136);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v10;
    sub_21D94D078();
    *v8 = v10;

    _os_log_impl(&dword_21D92C000, v4, v5, "Error sending command %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EEF8);
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v8, -1, -1);
    MEMORY[0x2207955E4](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 136);

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 120))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 64));
  v12 = sub_21D94CEA4();
  v13 = sub_21D94D00C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21D92C000, v12, v13, "command submitted", v14, 2u);
    MEMORY[0x2207955E4](v14, -1, -1);
  }
  v15 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v16 = *(_QWORD *)(v0 + 88);
  v17 = *(_QWORD *)(v0 + 64);

  v15(v16, v17);
  sub_21D94C28C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D948E08()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21D934510;
  return sub_21D94C124();
}

uint64_t sub_21D948E70(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21D949310;
  return SACommandFlow.execute()(a1);
}

uint64_t closeAppFlow(app:)@<X0>(unsigned __int8 a1@<W0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t result;
  _BYTE v8[40];

  sub_21D94C19C();
  sub_21D931378((uint64_t)v8, (uint64_t)a2);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v4 = sub_21D94C2E0();
  v6 = sub_21D948F50(v4, v5, a1);
  swift_bridgeObjectRelease();
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  a2[5] = v6;
  return result;
}

id sub_21D948F50(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81138]), sel_init);
  HealthApps.rawValue.getter(a3);
  v6 = (void *)sub_21D94CF28();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setAppBundleId_, v6);

  v7 = (void *)sub_21D94CF28();
  objc_msgSend(v5, sel_setSceneId_, v7);

  v8 = v5;
  if (a2)
    a2 = (void *)sub_21D94CF28();
  objc_msgSend(v5, sel_setRefId_, a2);

  return v5;
}

uint64_t openAppFlow(app:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t result;
  _BYTE v9[40];

  sub_21D94C19C();
  sub_21D931378((uint64_t)v9, (uint64_t)a1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21D94C2E0();
  v3 = v2;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81130]), sel_init);
  v5 = (void *)sub_21D94CF28();
  objc_msgSend(v4, sel_setLaunchId_, v5);

  v6 = v4;
  if (v3)
    v7 = (void *)sub_21D94CF28();
  else
    v7 = 0;
  objc_msgSend(v4, sel_setRefId_, v7);
  swift_bridgeObjectRelease();

  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  a1[5] = v4;
  return result;
}

unint64_t sub_21D94914C()
{
  unint64_t result;

  result = qword_25538F358;
  if (!qword_25538F358)
  {
    result = MEMORY[0x220795560](&protocol conformance descriptor for SACommandFlow, &type metadata for SACommandFlow);
    atomic_store(result, (unint64_t *)&qword_25538F358);
  }
  return result;
}

uint64_t initializeWithCopy for LaunchAppFlow(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for LaunchAppFlow(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LaunchAppFlow(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchAppFlow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchAppFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppFlow()
{
  return &type metadata for LaunchAppFlow;
}

ValueMetadata *type metadata accessor for SACommandFlow()
{
  return &type metadata for SACommandFlow;
}

uint64_t static UsoEntity_common_WorkoutInstructor.builder(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_21D94CBC8();
  swift_allocObject();
  v3 = sub_21D94CBBC();
  if (a2)
    sub_21D94C7FC();
  return v3;
}

uint64_t static UsoEntity_common_WorkoutInstructor.with(name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  sub_21D94CBC8();
  swift_allocObject();
  v3 = sub_21D94CBBC();
  if (a2)
    sub_21D94C7FC();
  MEMORY[0x220794594](v3);
  sub_21D94C958();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v5;
}

uint64_t OutputFlow.init(templatingResult:snippets:flowConfig:rrEntities:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v10 = (int *)type metadata accessor for OutputFlow();
  v11 = v10[7];
  sub_21D9312CC(a1, a5);
  *(_QWORD *)(a5 + v10[5]) = a2;
  sub_21D931378(a3, a5 + v10[6]);
  *(_QWORD *)(a5 + v11) = a4;
  sub_21D94CE50();
  v12 = sub_21D94CE44();
  __swift_destroy_boxed_opaque_existential_0(a3);
  result = sub_21D930660(a1, &qword_25538EE58);
  *(_QWORD *)(a5 + v10[8]) = v12;
  return result;
}

uint64_t type metadata accessor for OutputFlow()
{
  uint64_t result;

  result = qword_25538F3F8;
  if (!qword_25538F3F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t OutputFlow.on(input:)()
{
  return 1;
}

uint64_t OutputFlow.execute(completion:)(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
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
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *);
  uint64_t v40;
  _QWORD v41[3];
  uint64_t v42;

  v3 = v2;
  v39 = a1;
  v40 = a2;
  v4 = sub_21D94C2A4();
  v37 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21D94CEBC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25538F388);
  MEMORY[0x24BDAC7A8](v11);
  v36 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21D94C2BC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D9312CC(v3, (uint64_t)v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21D930660((uint64_t)v15, &qword_25538EE58);
    if (qword_25538EA88 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v7, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v20, v7);
    v21 = sub_21D94CEA4();
    v22 = sub_21D94D018();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21D92C000, v21, v22, "Received error in TemplatingResult", v23, 2u);
      MEMORY[0x2207955E4](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    sub_21D94C28C();
    v39(v6);
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v6, v38);
  }
  else
  {
    v37 = v17;
    v38 = v16;
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
    v25 = type metadata accessor for OutputFlow();
    v26 = (_QWORD *)(v3 + *(int *)(v25 + 24));
    v27 = v26[3];
    v28 = v26[4];
    __swift_project_boxed_opaque_existential_1(v26, v27);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v28 + 8))(v41, v27, v28);
    __swift_project_boxed_opaque_existential_1(v41, v42);
    sub_21D94C1B4();
    sub_21D94C238();
    swift_allocObject();
    sub_21D94C22C();
    __swift_project_boxed_opaque_existential_1(v41, v42);
    sub_21D94C1B4();
    v29 = (void *)sub_21D94C220();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
    if (*(_QWORD *)(v3 + *(int *)(v25 + 28)))
    {
      v30 = sub_21D94CED4();
      v31 = (uint64_t)v36;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v36, 1, 1, v30);
      sub_21D94CE38();
      sub_21D930660(v31, qword_25538F388);
    }
    v32 = v26[3];
    v33 = v26[4];
    __swift_project_boxed_opaque_existential_1(v26, v32);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v33 + 16))(v41, v32, v33);
    __swift_project_boxed_opaque_existential_1(v41, v42);
    v34 = swift_allocObject();
    v35 = v40;
    *(_QWORD *)(v34 + 16) = v39;
    *(_QWORD *)(v34 + 24) = v35;
    sub_21D9313E8();
    swift_retain();
    sub_21D94C2D4();

    swift_release();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v38);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
  }
}

uint64_t OutputFlow.getReferenceResolutionClient_ForTesting()()
{
  type metadata accessor for OutputFlow();
  return swift_retain();
}

uint64_t sub_21D9499CC(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v3 = sub_21D94CEBC();
  v4 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    if (qword_25538EA88 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v3, (uint64_t)static Logger.common);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v3);
    v9 = sub_21D94CEA4();
    v10 = sub_21D94D018();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21D92C000, v9, v10, "Failed to donate entities to Siri Reference Resolution", v11, 2u);
      MEMORY[0x2207955E4](v11, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return result;
}

uint64_t sub_21D949B1C()
{
  swift_release();
  return swift_deallocObject();
}

id *initializeBufferWithCopyOfBuffer for OutputFlow(id *a1, id *a2, int *a3)
{
  id *v4;
  int v5;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = (char *)*a2;
    *a1 = *a2;
    v4 = (id *)&v9[(v5 + 16) & ~(unint64_t)v5];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = *a2;
      v8 = *a2;
      *v4 = v7;
    }
    else
    {
      v10 = sub_21D94C2BC();
      (*(void (**)(id *, id *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v4, a2, v10);
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[6];
    *(id *)((char *)v4 + a3[5]) = *(id *)((char *)a2 + a3[5]);
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = *(_OWORD *)((char *)a2 + v11 + 24);
    *(_OWORD *)((char *)v4 + v11 + 24) = v14;
    v15 = v14;
    v16 = **(void (***)(char *, char *, uint64_t))(v14 - 8);
    swift_bridgeObjectRetain();
    v16(v12, v13, v15);
    v17 = a3[8];
    *(id *)((char *)v4 + a3[7]) = *(id *)((char *)a2 + a3[7]);
    *(id *)((char *)v4 + v17) = *(id *)((char *)a2 + v17);
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for OutputFlow(id *a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {

  }
  else
  {
    v4 = sub_21D94C2BC();
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1 + *(int *)(a2 + 24));
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for OutputFlow(_QWORD *a1, id *a2, int *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = *a2;
    v7 = *a2;
    *a1 = v6;
  }
  else
  {
    v8 = sub_21D94C2BC();
    (*(void (**)(_QWORD *, id *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
  }
  swift_storeEnumTagMultiPayload();
  v9 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(id *)((char *)a2 + a3[5]);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_OWORD *)((char *)a2 + v9 + 24);
  *(_OWORD *)((char *)a1 + v9 + 24) = v12;
  v13 = v12;
  v14 = **(void (***)(char *, char *, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain();
  v14(v10, v11, v13);
  v15 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(id *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v15) = *(id *)((char *)a2 + v15);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

id *assignWithCopy for OutputFlow(id *a1, id *a2, int *a3)
{
  id v6;
  id v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_21D930660((uint64_t)a1, &qword_25538EE58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = *a2;
      v7 = *a2;
      *a1 = v6;
    }
    else
    {
      v8 = sub_21D94C2BC();
      (*(void (**)(id *, id *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  *(id *)((char *)a1 + a3[5]) = *(id *)((char *)a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]));
  *(id *)((char *)a1 + a3[7]) = *(id *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(id *)((char *)a1 + a3[8]) = *(id *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for OutputFlow(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = sub_21D94C2BC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
  v12 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];
  return a1;
}

char *assignWithTake for OutputFlow(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;

  if (a1 != a2)
  {
    sub_21D930660((uint64_t)a1, &qword_25538EE58);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v7 = sub_21D94C2BC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&a1[v8]);
  v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for OutputFlow()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21D94A138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for OutputFlow()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21D94A1C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE58);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void sub_21D94A240()
{
  unint64_t v0;

  sub_21D94A2D8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21D94A2D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25538F408[0])
  {
    sub_21D94C2BC();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25538EE60);
    v0 = sub_21D94D270();
    if (!v1)
      atomic_store(v0, qword_25538F408);
  }
}

uint64_t AppPunchOutFlow.init(aceService:url:instrumentationTask:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  _QWORD *v16;
  id v17;
  uint64_t result;
  _QWORD v20[5];

  v10 = sub_21D94BFD4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21D931378(a1, a5);
  v14 = (int *)type metadata accessor for AppPunchOutFlow();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v15(a5 + v14[5], a2, v10);
  v16 = (_QWORD *)(a5 + v14[6]);
  *v16 = a3;
  v16[1] = a4;
  sub_21D9343E0(0, &qword_25538F448);
  sub_21D931378(a1, (uint64_t)v20);
  v15((uint64_t)v13, a2, v10);
  v17 = SAUIAppPunchOut.init(aceService:url:)(v20, (uint64_t)v13);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  result = __swift_destroy_boxed_opaque_existential_0(a1);
  *(_QWORD *)(a5 + v14[7]) = v17;
  return result;
}

uint64_t type metadata accessor for AppPunchOutFlow()
{
  uint64_t result;

  result = qword_25538F4C8;
  if (!qword_25538F4C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AppPunchOutFlow.on(input:)()
{
  return 1;
}

uint64_t AppPunchOutFlow.execute(completion:)(uint64_t a1, uint64_t a2)
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
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[3];
  uint64_t v44;
  uint64_t v45;

  v3 = v2;
  v39 = a1;
  v40 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538F450);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21D94C244();
  v36 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AppPunchOutFlow();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21D94CEBC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25538EA88 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v11, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  sub_21D94A96C(v2, (uint64_t)v10);
  v16 = sub_21D94CEA4();
  v17 = sub_21D94D00C();
  v18 = os_log_type_enabled(v16, v17);
  v41 = v2;
  if (v18)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v43[0] = v33;
    v35 = v6;
    *(_DWORD *)v19 = 136315138;
    v32 = v19 + 4;
    sub_21D94BFD4();
    v34 = v12;
    sub_21D94AA14();
    v20 = sub_21D94D1D4();
    v42 = sub_21D930010(v20, v21, v43);
    v6 = v35;
    sub_21D94D078();
    swift_bridgeObjectRelease();
    sub_21D94A9B0((uint64_t)v10);
    _os_log_impl(&dword_21D92C000, v16, v17, "Punching out to: %s", v19, 0xCu);
    v22 = v33;
    swift_arrayDestroy();
    MEMORY[0x2207955E4](v22, -1, -1);
    v23 = v19;
    v3 = v41;
    MEMORY[0x2207955E4](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v14, v11);
  }
  else
  {
    sub_21D94A9B0((uint64_t)v10);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v24 = (uint64_t *)(v3 + *(int *)(v8 + 24));
  if (v24[1])
  {
    v34 = *v24;
    swift_bridgeObjectRetain();
    sub_21D94C154();
    v35 = v45;
    __swift_project_boxed_opaque_existential_1(v43, v44);
    sub_21D94C190();
    (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v37, *MEMORY[0x24BE97820], v6);
    v25 = *MEMORY[0x24BE970E0];
    v26 = sub_21D94C16C();
    v27 = *(_QWORD *)(v26 - 8);
    v28 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 104))(v38, v25, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v28, 0, 1, v26);
    sub_21D94C178();
    v3 = v41;
    sub_21D94C160();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
  }
  sub_21D931378(v3, (uint64_t)v43);
  __swift_project_boxed_opaque_existential_1(v43, v44);
  v29 = swift_allocObject();
  v30 = v40;
  *(_QWORD *)(v29 + 16) = v39;
  *(_QWORD *)(v29 + 24) = v30;
  sub_21D9343E0(0, qword_25538EE68);
  swift_retain();
  sub_21D94C2D4();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
}

uint64_t sub_21D94A96C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppPunchOutFlow();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D94A9B0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppPunchOutFlow();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21D94A9EC()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_21D94AA14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25538F458[0];
  if (!qword_25538F458[0])
  {
    v1 = sub_21D94BFD4();
    result = MEMORY[0x220795560](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, qword_25538F458);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AppPunchOutFlow(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v8 = a3[5];
    v9 = (char *)v4 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_21D94BFD4();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = a3[7];
    v14 = (_QWORD *)((char *)v4 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = *(void **)((char *)a2 + v13);
    *(_QWORD *)((char *)v4 + v13) = v17;
    swift_bridgeObjectRetain();
    v18 = v17;
  }
  return v4;
}

void destroy for AppPunchOutFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21D94BFD4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for AppPunchOutFlow(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21D94BFD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = *(void **)(a2 + v12);
  *(_QWORD *)(a1 + v12) = v16;
  swift_bridgeObjectRetain();
  v17 = v16;
  return a1;
}

uint64_t *assignWithCopy for AppPunchOutFlow(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21D94BFD4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (uint64_t *)((char *)a1 + v10);
  v12 = (uint64_t *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = *(void **)((char *)a2 + v13);
  v15 = *(void **)((char *)a1 + v13);
  *(uint64_t *)((char *)a1 + v13) = (uint64_t)v14;
  v16 = v14;

  return a1;
}

uint64_t initializeWithTake for AppPunchOutFlow(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21D94BFD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for AppPunchOutFlow(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
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
  void *v17;

  __swift_destroy_boxed_opaque_existential_0(a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21D94BFD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[7];
  v17 = *(void **)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppPunchOutFlow()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21D94AE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21D94BFD4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AppPunchOutFlow()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21D94AEA8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = sub_21D94BFD4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21D94AF1C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21D94BFD4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t SequenceFlow.flows.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t SequenceFlow.flows.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*SequenceFlow.flows.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SequenceFlow.__allocating_init(aceService:flows:)(__int128 *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_21D930780(a1, v4 + 16);
  *(_QWORD *)(v4 + 56) = a2;
  return v4;
}

uint64_t SequenceFlow.init(aceService:flows:)(__int128 *a1, uint64_t a2)
{
  uint64_t v2;

  sub_21D930780(a1, v2 + 16);
  *(_QWORD *)(v2 + 56) = a2;
  return v2;
}

uint64_t SequenceFlow.__allocating_init(with:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_21D94C1A8();
  *(_QWORD *)(v2 + 56) = a1;
  return v2;
}

uint64_t SequenceFlow.init(with:)(uint64_t a1)
{
  uint64_t v1;
  __int128 v4;

  sub_21D94C1A8();
  sub_21D930780(&v4, v1 + 16);
  *(_QWORD *)(v1 + 56) = a1;
  return v1;
}

uint64_t SequenceFlow.on(input:)()
{
  return 1;
}

uint64_t SequenceFlow.execute(completion:)(void (*a1)(_QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_21D94C2A4();
  v29 = *(_QWORD *)(v6 - 8);
  v30 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v28 = (char *)&v26 - v10;
  v11 = sub_21D94CEBC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t *)(v3 + 56);
  swift_beginAccess();
  v16 = *(_QWORD *)(v3 + 56);
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v22 = sub_21D94D198();
    swift_bridgeObjectRelease();
    if (v22)
      goto LABEL_3;
LABEL_21:
    sub_21D94C28C();
    goto LABEL_22;
  }
  if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_21;
LABEL_3:
  v27 = a2;
  if (qword_25538EA88 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v11, (uint64_t)static Logger.common);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
  swift_retain();
  v18 = sub_21D94CEA4();
  v19 = sub_21D94D00C();
  if (!os_log_type_enabled(v18, v19))
  {

    swift_release();
    goto LABEL_10;
  }
  v26 = a1;
  v20 = swift_slowAlloc();
  *(_DWORD *)v20 = 134217984;
  if ((unint64_t)*v15 >> 62)
    goto LABEL_31;
  v21 = *(_QWORD *)((*v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v31 = v21;
    sub_21D94D078();
    swift_release();
    _os_log_impl(&dword_21D92C000, v18, v19, "Flows remaining : %ld", (uint8_t *)v20, 0xCu);
    MEMORY[0x2207955E4](v20, -1, -1);

    a1 = v26;
LABEL_10:
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
    swift_beginAccess();
    v20 = *v15;
    v19 = v27;
    if ((unint64_t)*v15 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_21D94D198();
      swift_bridgeObjectRelease();
      if (!v24)
      {
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_24;
    }
    v20 = *v15;
    if (!((unint64_t)*v15 >> 62))
    {
      v14 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v14)
        goto LABEL_26;
      goto LABEL_14;
    }
LABEL_25:
    swift_bridgeObjectRetain();
    v14 = sub_21D94D198();
    swift_bridgeObjectRelease();
    if (!v14)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
LABEL_14:
    if ((v20 & 0xC000000000000001) == 0)
      break;
LABEL_27:
    v20 = MEMORY[0x220795098](0, v20);
LABEL_17:
    v14 = *v15;
    if ((unint64_t)*v15 >> 62)
      goto LABEL_29;
    if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_19;
LABEL_30:
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    v21 = sub_21D94D198();
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v20 = *(_QWORD *)(v20 + 32);
    swift_retain();
    goto LABEL_17;
  }
  __break(1u);
LABEL_29:
  swift_bridgeObjectRetain();
  v25 = sub_21D94D198();
  swift_bridgeObjectRelease();
  if (!v25)
    goto LABEL_30;
LABEL_19:
  sub_21D94B618(0, 1);
  swift_endAccess();
  v9 = v28;
  sub_21D94C274();
  swift_release();
LABEL_22:
  a1(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v9, v30);
}

uint64_t SequenceFlow.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SequenceFlow.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_21D94B5D4(void (*a1)(_QWORD), uint64_t a2)
{
  return SequenceFlow.execute(completion:)(a1, a2);
}

uint64_t sub_21D94B5F4()
{
  type metadata accessor for SequenceFlow();
  return sub_21D94C130();
}

uint64_t sub_21D94B618(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_21D94D198();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_21D94D198();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_21D94D198();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x2207950A4](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_21D94C0B8();
  swift_arrayDestroy();
  if (!v5)
    return sub_21D94CFD0();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_21D94D198();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_21D94CFD0();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_21D94D198();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_21D94D1B0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SequenceFlow()
{
  return objc_opt_self();
}

uint64_t static UsoEntity_common_Workout.builder(workoutName:goalDefinedValue:goalUnitType:goalValue:areaType:sequenceLabel:usoAssociatedAppIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, void (*a9)(char *, char *, uint64_t), uint64_t a10, uint64_t a11)
{
  return sub_21D94BB48(a1, a2, a3, a4, a5, a6 & 1, a7, a8, a9, a10, a11);
}

uint64_t static UsoEntity_common_Workout.builder(name:goal:healthLog:workoutClass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;

  sub_21D94C838();
  swift_allocObject();
  v11 = sub_21D94C82C();
  if (a2)
    sub_21D94C79C();
  if (a3)
  {
    swift_retain();
    sub_21D94C814();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_21D94C7FC();
    swift_release();
  }
  return v11;
}

uint64_t static UsoEntity_common_Workout.with(name:goal:healthLog:workoutClass:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v13;

  sub_21D94C838();
  swift_allocObject();
  v11 = sub_21D94C82C();
  if (a2)
    sub_21D94C79C();
  if (a3)
  {
    swift_retain();
    sub_21D94C814();
    swift_release();
  }
  if (a5)
  {
    swift_retain();
    sub_21D94C808();
    swift_release();
  }
  if (a7)
  {
    swift_retain();
    sub_21D94C7FC();
    swift_release();
  }
  MEMORY[0x220794594](v11);
  sub_21D94C5BC();
  sub_21D94C640();
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_21D94BB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, void (*a9)(char *, char *, uint64_t), uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  char *v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v46 = a5;
  v47 = a8;
  v41 = a7;
  v43 = a3;
  v44 = a4;
  v48 = a11;
  v45 = a9;
  v42 = a6 & 1;
  v13 = sub_21D94C4E4();
  v39 = *(_QWORD *)(v13 - 8);
  v40 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v38 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25538EE30);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v36 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v36 - v22;
  v24 = sub_21D94C6C4();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v37 = (char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v36 - v28;
  sub_21D94C838();
  swift_allocObject();
  v30 = sub_21D94C82C();
  v47 = _s12SiriOntology26UsoEntity_common_HealthLogC0F12DomainsToolsE7builder06healthG4Name8areaType0kgL19IdentifierNamespace17measurementNeededAA0cd8Builder_e1_fG0CSSSg_A2LSbtFZ_0(a1, a2, v41, v47, 0, 0, 0);
  sub_21D94C808();
  v46 = sub_21D9357A8(v43, v44, v46, v42);
  sub_21D94C814();
  sub_21D93ADB0((uint64_t)v45, (uint64_t)v23);
  v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v31(v23, 1, v24) == 1)
  {
    sub_21D93ADF8((uint64_t)v23);
    if (!v48)
      goto LABEL_9;
    goto LABEL_8;
  }
  v45 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
  v45(v29, v23, v24);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v21, v29, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v21, 0, 1, v24);
  sub_21D94CA00();
  swift_allocObject();
  sub_21D94C9F4();
  sub_21D93ADB0((uint64_t)v21, (uint64_t)v18);
  if (v31(v18, 1, v24) == 1)
  {
    sub_21D93ADF8((uint64_t)v18);
  }
  else
  {
    v32 = v37;
    v45(v37, v18, v24);
    sub_21D94C880();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v32, v24);
  }
  sub_21D93ADF8((uint64_t)v21);
  swift_retain();
  sub_21D94C628();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v24);
  if (v48)
  {
LABEL_8:
    sub_21D94C67C();
    swift_allocObject();
    sub_21D94C670();
    sub_21D94C610();
    swift_allocObject();
    swift_bridgeObjectRetain();
    v33 = MEMORY[0x2207945C4](0, 0);
    v34 = v38;
    sub_21D94C4C0();
    sub_21D94C490();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v40);
    v49 = v33;
    sub_21D94C4FC();
    swift_release();
    sub_21D94C634();
    swift_release();
  }
LABEL_9:
  swift_release();
  swift_release();
  return v30;
}

uint64_t sub_21D94BF80()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_21D94BF8C()
{
  return MEMORY[0x24BDCBCE0]();
}

uint64_t sub_21D94BF98()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t sub_21D94BFA4()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_21D94BFB0()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21D94BFBC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21D94BFC8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21D94BFD4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21D94BFE0()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_21D94BFEC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21D94BFF8()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_21D94C004()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21D94C010()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21D94C01C()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_21D94C028()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_21D94C034()
{
  return MEMORY[0x24BDCF150]();
}

uint64_t sub_21D94C040()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_21D94C04C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21D94C058()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21D94C064()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_21D94C070()
{
  return MEMORY[0x24BE85D28]();
}

uint64_t sub_21D94C07C()
{
  return MEMORY[0x24BE8AFB0]();
}

uint64_t sub_21D94C088()
{
  return MEMORY[0x24BE8CA08]();
}

uint64_t sub_21D94C094()
{
  return MEMORY[0x24BE8CA10]();
}

uint64_t sub_21D94C0A0()
{
  return MEMORY[0x24BE8D6E0]();
}

uint64_t sub_21D94C0AC()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_21D94C0B8()
{
  return MEMORY[0x24BE968E0]();
}

uint64_t sub_21D94C0C4()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_21D94C0D0()
{
  return MEMORY[0x24BE96A48]();
}

uint64_t sub_21D94C0DC()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_21D94C0E8()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_21D94C0F4()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_21D94C100()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_21D94C10C()
{
  return MEMORY[0x24BE96EA8]();
}

uint64_t sub_21D94C118()
{
  return MEMORY[0x24BE96EB8]();
}

uint64_t sub_21D94C124()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_21D94C130()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_21D94C13C()
{
  return MEMORY[0x24BE96F70]();
}

uint64_t _s18HealthDomainsTools10FlowFinderC04findD013forInvocation07SiriKitD003AnyD0CSgAF5ParseO06DirectH0V_tF_0()
{
  return MEMORY[0x24BE96F98]();
}

uint64_t sub_21D94C154()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_21D94C160()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_21D94C16C()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_21D94C178()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_21D94C184()
{
  return MEMORY[0x24BE97388]();
}

uint64_t sub_21D94C190()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_21D94C19C()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_21D94C1A8()
{
  return MEMORY[0x24BE973E8]();
}

uint64_t sub_21D94C1B4()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_21D94C1C0()
{
  return MEMORY[0x24BE975D0]();
}

uint64_t sub_21D94C1CC()
{
  return MEMORY[0x24BE975D8]();
}

uint64_t sub_21D94C1D8()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_21D94C1E4()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_21D94C1F0()
{
  return MEMORY[0x24BE975F8]();
}

uint64_t sub_21D94C1FC()
{
  return MEMORY[0x24BE97600]();
}

uint64_t sub_21D94C208()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_21D94C214()
{
  return MEMORY[0x24BE97670]();
}

uint64_t sub_21D94C220()
{
  return MEMORY[0x24BE97768]();
}

uint64_t sub_21D94C22C()
{
  return MEMORY[0x24BE97770]();
}

uint64_t sub_21D94C238()
{
  return MEMORY[0x24BE97780]();
}

uint64_t sub_21D94C244()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_21D94C250()
{
  return MEMORY[0x24BE978A8]();
}

uint64_t sub_21D94C25C()
{
  return MEMORY[0x24BE978B0]();
}

uint64_t sub_21D94C268()
{
  return MEMORY[0x24BE978B8]();
}

uint64_t sub_21D94C274()
{
  return MEMORY[0x24BE97D20]();
}

uint64_t sub_21D94C280()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_21D94C28C()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_21D94C298()
{
  return MEMORY[0x24BE97D68]();
}

uint64_t sub_21D94C2A4()
{
  return MEMORY[0x24BE97D78]();
}

uint64_t sub_21D94C2B0()
{
  return MEMORY[0x24BE97F80]();
}

uint64_t sub_21D94C2BC()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_21D94C2C8()
{
  return MEMORY[0x24BE98020]();
}

uint64_t sub_21D94C2D4()
{
  return MEMORY[0x24BE98030]();
}

uint64_t sub_21D94C2E0()
{
  return MEMORY[0x24BE985F0]();
}

uint64_t sub_21D94C2EC()
{
  return MEMORY[0x24BE98610]();
}

uint64_t sub_21D94C2F8()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_21D94C304()
{
  return MEMORY[0x24BE986C8]();
}

uint64_t sub_21D94C310()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_21D94C31C()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_21D94C328()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_21D94C334()
{
  return MEMORY[0x24BE99048]();
}

uint64_t sub_21D94C340()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_21D94C34C()
{
  return MEMORY[0x24BE9C1E0]();
}

uint64_t sub_21D94C358()
{
  return MEMORY[0x24BE9C290]();
}

uint64_t sub_21D94C364()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_21D94C370()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_21D94C37C()
{
  return MEMORY[0x24BE9C3F0]();
}

uint64_t sub_21D94C388()
{
  return MEMORY[0x24BE9C448]();
}

uint64_t sub_21D94C394()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_21D94C3A0()
{
  return MEMORY[0x24BE9C700]();
}

uint64_t sub_21D94C3AC()
{
  return MEMORY[0x24BE9C708]();
}

uint64_t sub_21D94C3B8()
{
  return MEMORY[0x24BE990B0]();
}

uint64_t sub_21D94C3C4()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_21D94C3D0()
{
  return MEMORY[0x24BE9C770]();
}

uint64_t sub_21D94C3DC()
{
  return MEMORY[0x24BE9C808]();
}

uint64_t sub_21D94C3E8()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_21D94C3F4()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_21D94C400()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_21D94C40C()
{
  return MEMORY[0x24BE9CB18]();
}

uint64_t sub_21D94C418()
{
  return MEMORY[0x24BE9CB20]();
}

uint64_t sub_21D94C424()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_21D94C430()
{
  return MEMORY[0x24BE9D100]();
}

uint64_t sub_21D94C43C()
{
  return MEMORY[0x24BE9D108]();
}

uint64_t sub_21D94C448()
{
  return MEMORY[0x24BE9D110]();
}

uint64_t sub_21D94C454()
{
  return MEMORY[0x24BE9DFF8]();
}

uint64_t sub_21D94C460()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_21D94C46C()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_21D94C478()
{
  return MEMORY[0x24BE9ED38]();
}

uint64_t sub_21D94C484()
{
  return MEMORY[0x24BE9EE18]();
}

uint64_t sub_21D94C490()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_21D94C49C()
{
  return MEMORY[0x24BE9F748]();
}

uint64_t sub_21D94C4A8()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_21D94C4B4()
{
  return MEMORY[0x24BE9F8E8]();
}

uint64_t sub_21D94C4C0()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_21D94C4CC()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_21D94C4D8()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_21D94C4E4()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_21D94C4F0()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t sub_21D94C4FC()
{
  return MEMORY[0x24BE9FEB8]();
}

uint64_t sub_21D94C508()
{
  return MEMORY[0x24BE9FF38]();
}

uint64_t sub_21D94C514()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_21D94C520()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_21D94C52C()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_21D94C538()
{
  return MEMORY[0x24BEA00E8]();
}

uint64_t sub_21D94C544()
{
  return MEMORY[0x24BEA0428]();
}

uint64_t sub_21D94C550()
{
  return MEMORY[0x24BEA0450]();
}

uint64_t sub_21D94C55C()
{
  return MEMORY[0x24BEA0510]();
}

uint64_t sub_21D94C568()
{
  return MEMORY[0x24BEA0550]();
}

uint64_t sub_21D94C574()
{
  return MEMORY[0x24BEA0568]();
}

uint64_t sub_21D94C580()
{
  return MEMORY[0x24BEA0588]();
}

uint64_t sub_21D94C58C()
{
  return MEMORY[0x24BEA0590]();
}

uint64_t sub_21D94C598()
{
  return MEMORY[0x24BEA0598]();
}

uint64_t sub_21D94C5A4()
{
  return MEMORY[0x24BEA05A0]();
}

uint64_t sub_21D94C5B0()
{
  return MEMORY[0x24BEA0680]();
}

uint64_t sub_21D94C5BC()
{
  return MEMORY[0x24BEA0688]();
}

uint64_t sub_21D94C5C8()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_21D94C5D4()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_21D94C5E0()
{
  return MEMORY[0x24BEA0768]();
}

uint64_t sub_21D94C5EC()
{
  return MEMORY[0x24BEA0870]();
}

uint64_t sub_21D94C5F8()
{
  return MEMORY[0x24BEA0888]();
}

uint64_t sub_21D94C604()
{
  return MEMORY[0x24BEA0898]();
}

uint64_t sub_21D94C610()
{
  return MEMORY[0x24BEA08A8]();
}

uint64_t sub_21D94C61C()
{
  return MEMORY[0x24BEA08C0]();
}

uint64_t sub_21D94C628()
{
  return MEMORY[0x24BEA0958]();
}

uint64_t sub_21D94C634()
{
  return MEMORY[0x24BEA0960]();
}

uint64_t sub_21D94C640()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_21D94C64C()
{
  return MEMORY[0x24BEA0A00]();
}

uint64_t sub_21D94C658()
{
  return MEMORY[0x24BEA0A08]();
}

uint64_t sub_21D94C664()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_21D94C670()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_21D94C67C()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_21D94C688()
{
  return MEMORY[0x24BEA0D58]();
}

uint64_t sub_21D94C694()
{
  return MEMORY[0x24BEA0E50]();
}

uint64_t sub_21D94C6A0()
{
  return MEMORY[0x24BEA0F00]();
}

uint64_t sub_21D94C6AC()
{
  return MEMORY[0x24BEA0F10]();
}

uint64_t sub_21D94C6B8()
{
  return MEMORY[0x24BEA0F48]();
}

uint64_t sub_21D94C6C4()
{
  return MEMORY[0x24BEA1250]();
}

uint64_t sub_21D94C6D0()
{
  return MEMORY[0x24BEA1338]();
}

uint64_t sub_21D94C6DC()
{
  return MEMORY[0x24BEA1348]();
}

uint64_t sub_21D94C6E8()
{
  return MEMORY[0x24BEA1358]();
}

uint64_t sub_21D94C6F4()
{
  return MEMORY[0x24BEA13B8]();
}

uint64_t sub_21D94C700()
{
  return MEMORY[0x24BEA13C8]();
}

uint64_t sub_21D94C70C()
{
  return MEMORY[0x24BEA13F0]();
}

uint64_t sub_21D94C718()
{
  return MEMORY[0x24BEA1430]();
}

uint64_t sub_21D94C724()
{
  return MEMORY[0x24BEA1480]();
}

uint64_t sub_21D94C730()
{
  return MEMORY[0x24BEA1488]();
}

uint64_t sub_21D94C73C()
{
  return MEMORY[0x24BEA14A0]();
}

uint64_t sub_21D94C748()
{
  return MEMORY[0x24BEA14A8]();
}

uint64_t sub_21D94C754()
{
  return MEMORY[0x24BEA1740]();
}

uint64_t sub_21D94C760()
{
  return MEMORY[0x24BEA1748]();
}

uint64_t sub_21D94C76C()
{
  return MEMORY[0x24BEA1750]();
}

uint64_t sub_21D94C778()
{
  return MEMORY[0x24BEA1758]();
}

uint64_t sub_21D94C784()
{
  return MEMORY[0x24BEA1918]();
}

uint64_t sub_21D94C790()
{
  return MEMORY[0x24BEA1920]();
}

uint64_t sub_21D94C79C()
{
  return MEMORY[0x24BEA1928]();
}

uint64_t sub_21D94C7A8()
{
  return MEMORY[0x24BEA1930]();
}

uint64_t sub_21D94C7B4()
{
  return MEMORY[0x24BEA1938]();
}

uint64_t sub_21D94C7C0()
{
  return MEMORY[0x24BEA1940]();
}

uint64_t sub_21D94C7CC()
{
  return MEMORY[0x24BEA1948]();
}

uint64_t sub_21D94C7D8()
{
  return MEMORY[0x24BEA1950]();
}

uint64_t sub_21D94C7E4()
{
  return MEMORY[0x24BEA1968]();
}

uint64_t sub_21D94C7F0()
{
  return MEMORY[0x24BEA1970]();
}

uint64_t sub_21D94C7FC()
{
  return MEMORY[0x24BEA1A28]();
}

uint64_t sub_21D94C808()
{
  return MEMORY[0x24BEA1A30]();
}

uint64_t sub_21D94C814()
{
  return MEMORY[0x24BEA1A38]();
}

uint64_t sub_21D94C820()
{
  return MEMORY[0x24BEA1A40]();
}

uint64_t sub_21D94C82C()
{
  return MEMORY[0x24BEA1A48]();
}

uint64_t sub_21D94C838()
{
  return MEMORY[0x24BEA1A50]();
}

uint64_t sub_21D94C844()
{
  return MEMORY[0x24BEA1BD0]();
}

uint64_t sub_21D94C850()
{
  return MEMORY[0x24BEA1C20]();
}

uint64_t sub_21D94C85C()
{
  return MEMORY[0x24BEA1D38]();
}

uint64_t sub_21D94C868()
{
  return MEMORY[0x24BEA1D48]();
}

uint64_t sub_21D94C874()
{
  return MEMORY[0x24BEA1D50]();
}

uint64_t sub_21D94C880()
{
  return MEMORY[0x24BEA1DC8]();
}

uint64_t sub_21D94C88C()
{
  return MEMORY[0x24BEA1DD0]();
}

uint64_t sub_21D94C898()
{
  return MEMORY[0x24BEA1DD8]();
}

uint64_t sub_21D94C8A4()
{
  return MEMORY[0x24BEA1DE8]();
}

uint64_t sub_21D94C8B0()
{
  return MEMORY[0x24BEA1DF0]();
}

uint64_t sub_21D94C8BC()
{
  return MEMORY[0x24BEA1E80]();
}

uint64_t sub_21D94C8C8()
{
  return MEMORY[0x24BEA1E90]();
}

uint64_t sub_21D94C8D4()
{
  return MEMORY[0x24BEA2068]();
}

uint64_t sub_21D94C8E0()
{
  return MEMORY[0x24BEA20A8]();
}

uint64_t sub_21D94C8EC()
{
  return MEMORY[0x24BEA20B0]();
}

uint64_t sub_21D94C8F8()
{
  return MEMORY[0x24BEA20C0]();
}

uint64_t sub_21D94C904()
{
  return MEMORY[0x24BEA20C8]();
}

uint64_t sub_21D94C910()
{
  return MEMORY[0x24BEA21B8]();
}

uint64_t sub_21D94C91C()
{
  return MEMORY[0x24BEA21C0]();
}

uint64_t sub_21D94C928()
{
  return MEMORY[0x24BEA21C8]();
}

uint64_t sub_21D94C934()
{
  return MEMORY[0x24BEA2208]();
}

uint64_t sub_21D94C940()
{
  return MEMORY[0x24BEA2328]();
}

uint64_t sub_21D94C94C()
{
  return MEMORY[0x24BEA2470]();
}

uint64_t sub_21D94C958()
{
  return MEMORY[0x24BEA2490]();
}

uint64_t sub_21D94C964()
{
  return MEMORY[0x24BEA24C8]();
}

uint64_t sub_21D94C970()
{
  return MEMORY[0x24BEA24D0]();
}

uint64_t sub_21D94C97C()
{
  return MEMORY[0x24BEA2570]();
}

uint64_t sub_21D94C988()
{
  return MEMORY[0x24BEA2580]();
}

uint64_t sub_21D94C994()
{
  return MEMORY[0x24BEA2588]();
}

uint64_t sub_21D94C9A0()
{
  return MEMORY[0x24BEA2640]();
}

uint64_t sub_21D94C9AC()
{
  return MEMORY[0x24BEA2648]();
}

uint64_t sub_21D94C9B8()
{
  return MEMORY[0x24BEA2658]();
}

uint64_t sub_21D94C9C4()
{
  return MEMORY[0x24BEA2660]();
}

uint64_t sub_21D94C9D0()
{
  return MEMORY[0x24BEA26A0]();
}

uint64_t sub_21D94C9DC()
{
  return MEMORY[0x24BEA26A8]();
}

uint64_t sub_21D94C9E8()
{
  return MEMORY[0x24BEA2828]();
}

uint64_t sub_21D94C9F4()
{
  return MEMORY[0x24BEA2850]();
}

uint64_t sub_21D94CA00()
{
  return MEMORY[0x24BEA2858]();
}

uint64_t sub_21D94CA0C()
{
  return MEMORY[0x24BEA28E8]();
}

uint64_t sub_21D94CA18()
{
  return MEMORY[0x24BEA28F0]();
}

uint64_t sub_21D94CA24()
{
  return MEMORY[0x24BEA28F8]();
}

uint64_t sub_21D94CA30()
{
  return MEMORY[0x24BEA2900]();
}

uint64_t sub_21D94CA3C()
{
  return MEMORY[0x24BEA2908]();
}

uint64_t sub_21D94CA48()
{
  return MEMORY[0x24BEA2910]();
}

uint64_t sub_21D94CA54()
{
  return MEMORY[0x24BEA2918]();
}

uint64_t sub_21D94CA60()
{
  return MEMORY[0x24BEA2920]();
}

uint64_t sub_21D94CA6C()
{
  return MEMORY[0x24BEA2930]();
}

uint64_t sub_21D94CA78()
{
  return MEMORY[0x24BEA2958]();
}

uint64_t sub_21D94CA84()
{
  return MEMORY[0x24BEA2960]();
}

uint64_t sub_21D94CA90()
{
  return MEMORY[0x24BEA29A8]();
}

uint64_t sub_21D94CA9C()
{
  return MEMORY[0x24BEA29B0]();
}

uint64_t sub_21D94CAA8()
{
  return MEMORY[0x24BEA2C20]();
}

uint64_t sub_21D94CAB4()
{
  return MEMORY[0x24BEA2C30]();
}

uint64_t sub_21D94CAC0()
{
  return MEMORY[0x24BEA2D98]();
}

uint64_t sub_21D94CACC()
{
  return MEMORY[0x24BEA2DA0]();
}

uint64_t sub_21D94CAD8()
{
  return MEMORY[0x24BEA2DF0]();
}

uint64_t sub_21D94CAE4()
{
  return MEMORY[0x24BEA2DF8]();
}

uint64_t sub_21D94CAF0()
{
  return MEMORY[0x24BEA2E00]();
}

uint64_t sub_21D94CAFC()
{
  return MEMORY[0x24BEA2E08]();
}

uint64_t sub_21D94CB08()
{
  return MEMORY[0x24BEA2EA0]();
}

uint64_t sub_21D94CB14()
{
  return MEMORY[0x24BEA2EA8]();
}

uint64_t sub_21D94CB20()
{
  return MEMORY[0x24BEA2EB0]();
}

uint64_t sub_21D94CB2C()
{
  return MEMORY[0x24BEA2EC0]();
}

uint64_t sub_21D94CB38()
{
  return MEMORY[0x24BEA2EC8]();
}

uint64_t sub_21D94CB44()
{
  return MEMORY[0x24BEA2FA8]();
}

uint64_t sub_21D94CB50()
{
  return MEMORY[0x24BEA3030]();
}

uint64_t sub_21D94CB5C()
{
  return MEMORY[0x24BEA3038]();
}

uint64_t sub_21D94CB68()
{
  return MEMORY[0x24BEA3040]();
}

uint64_t sub_21D94CB74()
{
  return MEMORY[0x24BEA30D0]();
}

uint64_t sub_21D94CB80()
{
  return MEMORY[0x24BEA3108]();
}

uint64_t sub_21D94CB8C()
{
  return MEMORY[0x24BEA3110]();
}

uint64_t sub_21D94CB98()
{
  return MEMORY[0x24BEA3120]();
}

uint64_t sub_21D94CBA4()
{
  return MEMORY[0x24BEA3128]();
}

uint64_t sub_21D94CBB0()
{
  return MEMORY[0x24BEA3150]();
}

uint64_t sub_21D94CBBC()
{
  return MEMORY[0x24BEA3158]();
}

uint64_t sub_21D94CBC8()
{
  return MEMORY[0x24BEA3160]();
}

uint64_t sub_21D94CBD4()
{
  return MEMORY[0x24BEA3188]();
}

uint64_t sub_21D94CBE0()
{
  return MEMORY[0x24BEA3260]();
}

uint64_t sub_21D94CBEC()
{
  return MEMORY[0x24BEA3268]();
}

uint64_t sub_21D94CBF8()
{
  return MEMORY[0x24BEA3270]();
}

uint64_t sub_21D94CC04()
{
  return MEMORY[0x24BEA32A8]();
}

uint64_t sub_21D94CC10()
{
  return MEMORY[0x24BEA32B0]();
}

uint64_t sub_21D94CC1C()
{
  return MEMORY[0x24BEA32C0]();
}

uint64_t sub_21D94CC28()
{
  return MEMORY[0x24BEA32C8]();
}

uint64_t sub_21D94CC34()
{
  return MEMORY[0x24BE86548]();
}

uint64_t sub_21D94CC40()
{
  return MEMORY[0x24BE86558]();
}

uint64_t sub_21D94CC4C()
{
  return MEMORY[0x24BE86568]();
}

uint64_t sub_21D94CC58()
{
  return MEMORY[0x24BE87610]();
}

uint64_t sub_21D94CC64()
{
  return MEMORY[0x24BE87618]();
}

uint64_t sub_21D94CC70()
{
  return MEMORY[0x24BE87650]();
}

uint64_t sub_21D94CC7C()
{
  return MEMORY[0x24BE880A0]();
}

uint64_t sub_21D94CC88()
{
  return MEMORY[0x24BE880B0]();
}

uint64_t sub_21D94CC94()
{
  return MEMORY[0x24BEA87F8]();
}

uint64_t sub_21D94CCA0()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_21D94CCAC()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_21D94CCB8()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t sub_21D94CCC4()
{
  return MEMORY[0x24BEA8D70]();
}

uint64_t sub_21D94CCD0()
{
  return MEMORY[0x24BEA8D80]();
}

uint64_t sub_21D94CCDC()
{
  return MEMORY[0x24BEA8D98]();
}

uint64_t sub_21D94CCE8()
{
  return MEMORY[0x24BEA8DA8]();
}

uint64_t sub_21D94CCF4()
{
  return MEMORY[0x24BE920F8]();
}

uint64_t sub_21D94CD00()
{
  return MEMORY[0x24BE92108]();
}

uint64_t sub_21D94CD0C()
{
  return MEMORY[0x24BE92118]();
}

uint64_t sub_21D94CD18()
{
  return MEMORY[0x24BE92120]();
}

uint64_t sub_21D94CD24()
{
  return MEMORY[0x24BE92658]();
}

uint64_t sub_21D94CD30()
{
  return MEMORY[0x24BE92668]();
}

uint64_t sub_21D94CD3C()
{
  return MEMORY[0x24BE92670]();
}

uint64_t sub_21D94CD48()
{
  return MEMORY[0x24BE92678]();
}

uint64_t sub_21D94CD54()
{
  return MEMORY[0x24BE92880]();
}

uint64_t sub_21D94CD60()
{
  return MEMORY[0x24BE928B0]();
}

uint64_t sub_21D94CD6C()
{
  return MEMORY[0x24BE928C0]();
}

uint64_t sub_21D94CD78()
{
  return MEMORY[0x24BE928D8]();
}

uint64_t sub_21D94CD84()
{
  return MEMORY[0x24BE928E0]();
}

uint64_t sub_21D94CD90()
{
  return MEMORY[0x24BE928E8]();
}

uint64_t sub_21D94CD9C()
{
  return MEMORY[0x24BE928F8]();
}

uint64_t sub_21D94CDA8()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_21D94CDB4()
{
  return MEMORY[0x24BE92B30]();
}

uint64_t sub_21D94CDC0()
{
  return MEMORY[0x24BE92B38]();
}

uint64_t sub_21D94CDCC()
{
  return MEMORY[0x24BE92B40]();
}

uint64_t sub_21D94CDD8()
{
  return MEMORY[0x24BE92B50]();
}

uint64_t sub_21D94CDE4()
{
  return MEMORY[0x24BE92B58]();
}

uint64_t sub_21D94CDF0()
{
  return MEMORY[0x24BE90B88]();
}

uint64_t sub_21D94CDFC()
{
  return MEMORY[0x24BE90B90]();
}

uint64_t sub_21D94CE08()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_21D94CE14()
{
  return MEMORY[0x24BE92EC8]();
}

uint64_t sub_21D94CE20()
{
  return MEMORY[0x24BE5BA20]();
}

uint64_t sub_21D94CE2C()
{
  return MEMORY[0x24BE5BA38]();
}

uint64_t sub_21D94CE38()
{
  return MEMORY[0x24BEA5458]();
}

uint64_t sub_21D94CE44()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_21D94CE50()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_21D94CE5C()
{
  return MEMORY[0x24BEA90B8]();
}

uint64_t sub_21D94CE68()
{
  return MEMORY[0x24BEA90E0]();
}

uint64_t sub_21D94CE74()
{
  return MEMORY[0x24BEA9140]();
}

uint64_t sub_21D94CE80()
{
  return MEMORY[0x24BEA9160]();
}

uint64_t sub_21D94CE8C()
{
  return MEMORY[0x24BEA92C0]();
}

uint64_t sub_21D94CE98()
{
  return MEMORY[0x24BEA92C8]();
}

uint64_t sub_21D94CEA4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21D94CEB0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21D94CEBC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21D94CEC8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_21D94CED4()
{
  return MEMORY[0x24BEA5A98]();
}

uint64_t sub_21D94CEE0()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_21D94CEEC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21D94CEF8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21D94CF04()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21D94CF10()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_21D94CF1C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21D94CF28()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21D94CF34()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21D94CF40()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21D94CF4C()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_21D94CF58()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21D94CF64()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21D94CF70()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_21D94CF7C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21D94CF88()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21D94CF94()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21D94CFA0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21D94CFAC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21D94CFB8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21D94CFC4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21D94CFD0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21D94CFDC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21D94CFE8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21D94CFF4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21D94D000()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21D94D00C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21D94D018()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21D94D024()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21D94D030()
{
  return MEMORY[0x24BE94900]();
}

uint64_t sub_21D94D03C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_21D94D048()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21D94D054()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21D94D060()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_21D94D06C()
{
  return MEMORY[0x24BE8DCC8]();
}

uint64_t sub_21D94D078()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21D94D084()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21D94D090()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21D94D09C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21D94D0A8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21D94D0B4()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_21D94D0C0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21D94D0CC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21D94D0D8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21D94D0E4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21D94D0F0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21D94D0FC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21D94D108()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21D94D114()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21D94D120()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21D94D12C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21D94D138()
{
  return MEMORY[0x24BEE2EA0]();
}

uint64_t sub_21D94D144()
{
  return MEMORY[0x24BEE2EB0]();
}

uint64_t sub_21D94D150()
{
  return MEMORY[0x24BEE2EC8]();
}

uint64_t sub_21D94D15C()
{
  return MEMORY[0x24BEE2ED0]();
}

uint64_t sub_21D94D168()
{
  return MEMORY[0x24BEE2ED8]();
}

uint64_t sub_21D94D174()
{
  return MEMORY[0x24BEE2F30]();
}

uint64_t sub_21D94D180()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21D94D18C()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_21D94D198()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21D94D1A4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21D94D1B0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21D94D1BC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21D94D1C8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21D94D1D4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21D94D1E0()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_21D94D1EC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21D94D1F8()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_21D94D204()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_21D94D210()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21D94D21C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21D94D228()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21D94D234()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21D94D240()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21D94D24C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21D94D258()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21D94D264()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21D94D270()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_21D94D27C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

