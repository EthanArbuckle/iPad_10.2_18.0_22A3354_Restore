_QWORD *sub_1CC3BE568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _BYTE v34[24];
  ValueMetadata *v35;
  _UNKNOWN **v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _BYTE v40[24];
  ValueMetadata *v41;
  _UNKNOWN **v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  uint64_t v47[5];
  _QWORD v48[6];

  v48[3] = type metadata accessor for FitnessModeObserver();
  v48[4] = &off_1E880B0B8;
  v48[0] = a3;
  v47[3] = type metadata accessor for DateProvider();
  v47[4] = (uint64_t)&off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
  sub_1CC3834D0(a4, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v46[3] = &type metadata for FitnessPlusPlanStore;
  v46[4] = &off_1E880BE30;
  v20 = swift_allocObject();
  v46[0] = v20;
  v21 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a5;
  *(_OWORD *)(v20 + 32) = v21;
  *(_QWORD *)(v20 + 48) = *(_QWORD *)(a5 + 32);
  v45[3] = type metadata accessor for FirstPickupObserver(0);
  v45[4] = &off_1E8809F50;
  v45[0] = a6;
  v44[3] = type metadata accessor for NotificationRequestScheduler();
  v44[4] = &off_1E8808FE8;
  v44[0] = a7;
  v43[3] = &type metadata for NotificationSettingsProvider;
  v43[4] = &off_1E8808D80;
  v22 = swift_allocObject();
  v43[0] = v22;
  v23 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a8;
  *(_OWORD *)(v22 + 32) = v23;
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a8 + 32);
  *(_QWORD *)(v22 + 64) = *(_QWORD *)(a8 + 48);
  v41 = &type metadata for PrivacySettingsProvider;
  v42 = &off_1E880AE60;
  v39[3] = &type metadata for FitnessPlusPlanServiceFactory;
  v39[4] = &off_1E8809138;
  v24 = swift_allocObject();
  v39[0] = v24;
  v25 = *(_OWORD *)(a9 + 144);
  *(_OWORD *)(v24 + 144) = *(_OWORD *)(a9 + 128);
  *(_OWORD *)(v24 + 160) = v25;
  *(_QWORD *)(v24 + 176) = *(_QWORD *)(a9 + 160);
  v26 = *(_OWORD *)(a9 + 80);
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(a9 + 64);
  *(_OWORD *)(v24 + 96) = v26;
  v27 = *(_OWORD *)(a9 + 112);
  *(_OWORD *)(v24 + 112) = *(_OWORD *)(a9 + 96);
  *(_OWORD *)(v24 + 128) = v27;
  v28 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v24 + 32) = v28;
  v29 = *(_OWORD *)(a9 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a9 + 32);
  *(_OWORD *)(v24 + 64) = v29;
  v38[3] = type metadata accessor for UserDayProvider();
  v38[4] = &off_1E880A8D8;
  v38[0] = a10;
  v37[3] = type metadata accessor for XPCActivityScheduler();
  v37[4] = &off_1E880B388;
  v37[0] = a11;
  v35 = &type metadata for LockStateProvider;
  v36 = &off_1E88087C8;
  swift_defaultActor_initialize();
  a13[14] = a1;
  sub_1CC32F1E8(a2, (uint64_t)(a13 + 15));
  sub_1CC32F1E8((uint64_t)v48, (uint64_t)(a13 + 20));
  sub_1CC32F1E8((uint64_t)v47, (uint64_t)(a13 + 25));
  sub_1CC32F1E8((uint64_t)v46, (uint64_t)(a13 + 30));
  sub_1CC32F1E8((uint64_t)v45, (uint64_t)(a13 + 35));
  a13[40] = a12;
  sub_1CC32F1E8((uint64_t)v44, (uint64_t)(a13 + 41));
  sub_1CC32F1E8((uint64_t)v43, (uint64_t)(a13 + 46));
  sub_1CC32F1E8((uint64_t)v40, (uint64_t)(a13 + 51));
  sub_1CC32F1E8((uint64_t)v39, (uint64_t)(a13 + 56));
  sub_1CC32F1E8((uint64_t)v38, (uint64_t)(a13 + 61));
  sub_1CC32F1E8((uint64_t)v34, (uint64_t)(a13 + 66));
  sub_1CC32F1E8((uint64_t)v37, (uint64_t)(a13 + 71));
  sub_1CC3C6114();
  v30 = sub_1CC3C6108();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1(a2);
  a13[76] = v30;
  a13[77] = 0;
  return a13;
}

uint64_t sub_1CC3BE8AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v28[24];
  ValueMetadata *v29;
  char **v30;
  _BYTE v31[24];
  ValueMetadata *v32;
  _UNKNOWN **v33;
  uint64_t v34[3];
  uint64_t PickupDateValidator;
  _UNKNOWN **v36;
  uint64_t v37[3];
  uint64_t v38;
  _UNKNOWN **v39;
  _BYTE v40[24];
  ValueMetadata *v41;
  _UNKNOWN **v42;

  v41 = &type metadata for BiomeObserver;
  v42 = &off_1E8809E98;
  v38 = type metadata accessor for DateProvider();
  v39 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  PickupDateValidator = type metadata accessor for FirstPickupDateValidator();
  v36 = &off_1E880A9E0;
  v9 = __swift_allocate_boxed_opaque_existential_1(v34);
  sub_1CC3834D0(a2, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for FirstPickupDateValidator);
  v32 = &type metadata for DuetObserver;
  v33 = &off_1E88094C8;
  v29 = &type metadata for FirstPickupStore;
  v30 = &off_1E8808708;
  type metadata accessor for FirstPickupObserver(0);
  v10 = swift_allocObject();
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v40, (uint64_t)&type metadata for BiomeObserver);
  MEMORY[0x1E0C80A78](v11);
  (*(void (**)(void))(v12 + 16))();
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v38);
  MEMORY[0x1E0C80A78](v13);
  v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v16 + 16))(v15);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, PickupDateValidator);
  MEMORY[0x1E0C80A78](v17);
  v19 = &v28[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v20 + 16))(v19);
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, (uint64_t)&type metadata for DuetObserver);
  MEMORY[0x1E0C80A78](v21);
  (*(void (**)(void))(v22 + 16))();
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, (uint64_t)&type metadata for FirstPickupStore);
  MEMORY[0x1E0C80A78](v23);
  (*(void (**)(void))(v24 + 16))();
  v25 = sub_1CC3BDE98((uint64_t)v15, (uint64_t)v19, a3, a4, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  return v25;
}

_QWORD *sub_1CC3BEB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  uint64_t PickupObserver;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  _UNKNOWN **v26;
  __int128 v27;
  uint64_t v28;
  _UNKNOWN **v29;
  _QWORD v30[5];
  uint64_t v31[3];
  uint64_t v32;
  _UNKNOWN **v33;

  v8 = type metadata accessor for DateProvider();
  v32 = v8;
  v33 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v31);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  PickupObserver = type metadata accessor for FirstPickupObserver(0);
  v30[3] = PickupObserver;
  v30[4] = &off_1E8809F50;
  v30[0] = a2;
  type metadata accessor for UserDayProvider();
  v11 = (_QWORD *)swift_allocObject();
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v14);
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, PickupObserver);
  MEMORY[0x1E0C80A78](v16);
  v18 = (uint64_t *)((char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  v20 = *v18;
  v28 = v8;
  v29 = &off_1E88087E0;
  v21 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
  sub_1CC3834D0((uint64_t)v14, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v25 = PickupObserver;
  v26 = &off_1E8809F50;
  *(_QWORD *)&v24 = v20;
  swift_defaultActor_initialize();
  sub_1CC347088(&v27, (uint64_t)(v11 + 14));
  sub_1CC347088(&v24, (uint64_t)(v11 + 19));
  v11[24] = a4;
  v11[25] = a3;
  v11[26] = 0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  return v11;
}

uint64_t sub_1CC3BED34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];
  _BYTE v22[24];
  ValueMetadata *v23;
  _UNKNOWN **v24;
  _QWORD v25[5];
  _BYTE v26[24];
  ValueMetadata *v27;
  _UNKNOWN **v28;

  v27 = &type metadata for DuetObserver;
  v28 = &off_1E88094C8;
  v25[3] = &type metadata for NotificationRequestPublisher;
  v25[4] = &off_1E880A820;
  v25[0] = a1;
  v23 = &type metadata for LockStateProvider;
  v24 = &off_1E88087C8;
  v3 = type metadata accessor for NotificationRequestStore();
  v21[3] = v3;
  v21[4] = &off_1E880CA38;
  v21[0] = a2;
  type metadata accessor for NotificationRequestScheduler();
  v4 = swift_allocObject();
  v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, (uint64_t)&type metadata for DuetObserver);
  MEMORY[0x1E0C80A78](v5);
  (*(void (**)(char *))(v7 + 16))((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, (uint64_t)&type metadata for NotificationRequestPublisher);
  MEMORY[0x1E0C80A78](v8);
  v10 = (_QWORD *)((char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, (uint64_t)&type metadata for LockStateProvider);
  MEMORY[0x1E0C80A78](v12);
  (*(void (**)(char *))(v14 + 16))((char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v3);
  MEMORY[0x1E0C80A78](v15);
  v17 = (_QWORD *)((char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  v19 = sub_1CC3BDDCC(*v10, *v17, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v19;
}

uint64_t sub_1CC3BEF3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_BYTE *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[64];
  _BYTE v22[72];
  _BYTE v23[24];
  ValueMetadata *v24;
  char **v25;
  _QWORD v26[5];
  _QWORD v27[5];

  v27[3] = &type metadata for NotificationSettingsProvider;
  v27[4] = &off_1E8808D80;
  v8 = swift_allocObject();
  v26[4] = &off_1E8808D80;
  v27[0] = v8;
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v8 + 32) = v9;
  *(_OWORD *)(v8 + 48) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(v8 + 64) = *(_QWORD *)(a1 + 48);
  v26[3] = &type metadata for NotificationSettingsProvider;
  v10 = swift_allocObject();
  v26[0] = v10;
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v10 + 64) = *(_QWORD *)(a2 + 48);
  v24 = &type metadata for PairedDeviceRegistry;
  v25 = &off_1E880C970;
  type metadata accessor for NotificationSettingsSystem();
  v12 = swift_allocObject();
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, (uint64_t)&type metadata for NotificationSettingsProvider);
  MEMORY[0x1E0C80A78](v13);
  v15 = *(void (**)(_BYTE *))(v14 + 16);
  v15(v22);
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, (uint64_t)&type metadata for NotificationSettingsProvider);
  MEMORY[0x1E0C80A78](v16);
  v15(v21);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, (uint64_t)&type metadata for PairedDeviceRegistry);
  MEMORY[0x1E0C80A78](v17);
  (*(void (**)(void))(v18 + 16))();
  v19 = sub_1CC3BDCB8((uint64_t)v22, (uint64_t)v21, a3, a4, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return v19;
}

_QWORD *sub_1CC3BF134(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  __int128 *v65;
  _QWORD v66[3];
  uint64_t v67;
  _UNKNOWN **v68;
  _QWORD v69[3];
  ValueMetadata *v70;
  _UNKNOWN **v71;
  _BYTE v72[24];
  ValueMetadata *v73;
  _UNKNOWN **v74;
  _QWORD v75[3];
  ValueMetadata *v76;
  _UNKNOWN **v77;
  _QWORD v78[3];
  uint64_t v79;
  _UNKNOWN **v80;
  _QWORD v81[3];
  uint64_t PickupObserver;
  _UNKNOWN **v83;
  _QWORD v84[3];
  ValueMetadata *v85;
  _UNKNOWN **v86;
  _QWORD v87[5];
  uint64_t v88[3];
  uint64_t v89;
  _UNKNOWN **v90;

  v64 = a1;
  v65 = a2;
  v63 = a11;
  v89 = type metadata accessor for DateProvider();
  v90 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v88);
  sub_1CC3834D0(a3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v18 = type metadata accessor for FitnessModeObserver();
  v87[4] = &off_1E880B0B8;
  v87[3] = v18;
  v87[0] = a4;
  v85 = &type metadata for FirstGlanceStore;
  v86 = &off_1E880BA18;
  v84[0] = a5;
  PickupObserver = type metadata accessor for FirstPickupObserver(0);
  v83 = &off_1E8809F50;
  v81[0] = a6;
  v79 = type metadata accessor for NotificationRequestScheduler();
  v80 = &off_1E8808FE8;
  v78[0] = a7;
  v76 = &type metadata for NotificationSettingsProvider;
  v77 = &off_1E8808D80;
  v19 = swift_allocObject();
  v75[0] = v19;
  v20 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a8;
  *(_OWORD *)(v19 + 32) = v20;
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(a8 + 32);
  *(_QWORD *)(v19 + 64) = *(_QWORD *)(a8 + 48);
  v73 = &type metadata for PrivacySettingsProvider;
  v74 = &off_1E880AE60;
  v70 = &type metadata for FirstGlanceServiceFactory;
  v71 = &off_1E880B940;
  v21 = swift_allocObject();
  v69[0] = v21;
  v22 = *(_OWORD *)(a9 + 112);
  *(_OWORD *)(v21 + 112) = *(_OWORD *)(a9 + 96);
  *(_OWORD *)(v21 + 128) = v22;
  *(_QWORD *)(v21 + 144) = *(_QWORD *)(a9 + 128);
  v23 = *(_OWORD *)(a9 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(a9 + 32);
  *(_OWORD *)(v21 + 64) = v23;
  v24 = *(_OWORD *)(a9 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(a9 + 64);
  *(_OWORD *)(v21 + 96) = v24;
  v25 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v21 + 32) = v25;
  v67 = type metadata accessor for UserDayProvider();
  v68 = &off_1E880A8D8;
  v66[0] = a10;
  type metadata accessor for FirstGlanceSystem();
  v62 = (_QWORD *)swift_allocObject();
  v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
  MEMORY[0x1E0C80A78](v26);
  v28 = (char *)&v62 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v28);
  v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v87, v18);
  MEMORY[0x1E0C80A78](v30);
  v32 = (uint64_t *)((char *)&v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v33 + 16))(v32);
  v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, (uint64_t)v85);
  MEMORY[0x1E0C80A78](v34);
  v36 = (uint64_t *)((char *)&v62 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v37 + 16))(v36);
  v38 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v81, PickupObserver);
  MEMORY[0x1E0C80A78](v38);
  v40 = (uint64_t *)((char *)&v62 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v41 + 16))(v40);
  v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v78, v79);
  MEMORY[0x1E0C80A78](v42);
  v44 = (uint64_t *)((char *)&v62 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v45 + 16))(v44);
  v46 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v75, (uint64_t)v76);
  MEMORY[0x1E0C80A78](v46);
  v48 = (char *)&v62 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v49 + 16))(v48);
  v50 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v72, (uint64_t)v73);
  MEMORY[0x1E0C80A78](v50);
  (*(void (**)(void))(v51 + 16))();
  v52 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v69, (uint64_t)v70);
  MEMORY[0x1E0C80A78](v52);
  v54 = (char *)&v62 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v55 + 16))(v54);
  v56 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v66, v67);
  MEMORY[0x1E0C80A78](v56);
  v58 = (uint64_t *)((char *)&v62 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v59 + 16))(v58);
  v60 = sub_1CC3BDA5C(v64, v65, (uint64_t)v28, *v32, *v36, *v40, *v44, (uint64_t)v48, (uint64_t)v54, *v58, v63, v62);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v87);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
  return v60;
}

_QWORD *sub_1CC3BF670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12)
{
  uint64_t v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v71;
  uint64_t *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE v77[24];
  ValueMetadata *v78;
  _UNKNOWN **v79;
  _QWORD v80[3];
  uint64_t v81;
  _UNKNOWN **v82;
  _QWORD v83[3];
  uint64_t v84;
  _UNKNOWN **v85;
  _QWORD v86[3];
  ValueMetadata *v87;
  _UNKNOWN **v88;
  _BYTE v89[24];
  ValueMetadata *v90;
  _UNKNOWN **v91;
  _QWORD v92[3];
  ValueMetadata *v93;
  _UNKNOWN **v94;
  _QWORD v95[3];
  uint64_t v96;
  _UNKNOWN **v97;
  _QWORD v98[3];
  uint64_t PickupObserver;
  _UNKNOWN **v100;
  _QWORD v101[3];
  ValueMetadata *v102;
  _UNKNOWN **v103;
  uint64_t v104[3];
  uint64_t v105;
  _UNKNOWN **v106;
  _QWORD v107[6];

  v75 = a1;
  v76 = a2;
  v74 = a12;
  v73 = a11;
  v18 = type metadata accessor for FitnessModeObserver();
  v107[3] = v18;
  v107[4] = &off_1E880B0B8;
  v107[0] = a3;
  v105 = type metadata accessor for DateProvider();
  v106 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v104);
  sub_1CC3834D0(a4, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v102 = &type metadata for FitnessPlusPlanStore;
  v103 = &off_1E880BE30;
  v20 = swift_allocObject();
  v101[0] = v20;
  v21 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a5;
  *(_OWORD *)(v20 + 32) = v21;
  *(_QWORD *)(v20 + 48) = *(_QWORD *)(a5 + 32);
  PickupObserver = type metadata accessor for FirstPickupObserver(0);
  v100 = &off_1E8809F50;
  v98[0] = a6;
  v96 = type metadata accessor for NotificationRequestScheduler();
  v97 = &off_1E8808FE8;
  v95[0] = a7;
  v93 = &type metadata for NotificationSettingsProvider;
  v94 = &off_1E8808D80;
  v22 = swift_allocObject();
  v92[0] = v22;
  v23 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(v22 + 16) = *(_OWORD *)a8;
  *(_OWORD *)(v22 + 32) = v23;
  *(_OWORD *)(v22 + 48) = *(_OWORD *)(a8 + 32);
  *(_QWORD *)(v22 + 64) = *(_QWORD *)(a8 + 48);
  v90 = &type metadata for PrivacySettingsProvider;
  v91 = &off_1E880AE60;
  v87 = &type metadata for FitnessPlusPlanServiceFactory;
  v88 = &off_1E8809138;
  v24 = swift_allocObject();
  v86[0] = v24;
  v25 = *(_OWORD *)(a9 + 144);
  *(_OWORD *)(v24 + 144) = *(_OWORD *)(a9 + 128);
  *(_OWORD *)(v24 + 160) = v25;
  *(_QWORD *)(v24 + 176) = *(_QWORD *)(a9 + 160);
  v26 = *(_OWORD *)(a9 + 80);
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(a9 + 64);
  *(_OWORD *)(v24 + 96) = v26;
  v27 = *(_OWORD *)(a9 + 112);
  *(_OWORD *)(v24 + 112) = *(_OWORD *)(a9 + 96);
  *(_OWORD *)(v24 + 128) = v27;
  v28 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v24 + 32) = v28;
  v29 = *(_OWORD *)(a9 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a9 + 32);
  *(_OWORD *)(v24 + 64) = v29;
  v84 = type metadata accessor for UserDayProvider();
  v85 = &off_1E880A8D8;
  v83[0] = a10;
  v81 = type metadata accessor for XPCActivityScheduler();
  v82 = &off_1E880B388;
  v80[0] = v73;
  v78 = &type metadata for LockStateProvider;
  v79 = &off_1E88087C8;
  type metadata accessor for FitnessPlusPlanSystem();
  v73 = (_QWORD *)swift_allocObject();
  v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v107, v18);
  MEMORY[0x1E0C80A78](v30);
  v72 = (uint64_t *)((char *)&v71 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void))(v32 + 16))();
  v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v104, v105);
  MEMORY[0x1E0C80A78](v33);
  v35 = (char *)&v71 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v36 + 16))(v35);
  v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v101, (uint64_t)v102);
  MEMORY[0x1E0C80A78](v37);
  v39 = (char *)&v71 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v40 + 16))(v39);
  v41 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v98, PickupObserver);
  MEMORY[0x1E0C80A78](v41);
  v43 = (uint64_t *)((char *)&v71 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v44 + 16))(v43);
  v45 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v95, v96);
  MEMORY[0x1E0C80A78](v45);
  v47 = (uint64_t *)((char *)&v71 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v48 + 16))(v47);
  v49 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v92, (uint64_t)v93);
  MEMORY[0x1E0C80A78](v49);
  v51 = (char *)&v71 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v52 + 16))(v51);
  v53 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v89, (uint64_t)v90);
  MEMORY[0x1E0C80A78](v53);
  (*(void (**)(void))(v54 + 16))();
  v55 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v86, (uint64_t)v87);
  MEMORY[0x1E0C80A78](v55);
  v57 = (char *)&v71 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v58 + 16))(v57);
  v59 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v83, v84);
  MEMORY[0x1E0C80A78](v59);
  v61 = (uint64_t *)((char *)&v71 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v62 + 16))(v61);
  v63 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v80, v81);
  MEMORY[0x1E0C80A78](v63);
  v65 = (uint64_t *)((char *)&v71 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v66 + 16))(v65);
  v67 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v77, (uint64_t)v78);
  MEMORY[0x1E0C80A78](v67);
  (*(void (**)(void))(v68 + 16))();
  v69 = sub_1CC3BE568(v75, v76, *v72, (uint64_t)v35, (uint64_t)v39, *v43, *v47, (uint64_t)v51, (uint64_t)v57, *v61, *v65, v74, v73);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v101);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v107);
  return v69;
}

uint64_t sub_1CC3BFCBC(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v34[3];
  ValueMetadata *v35;
  _UNKNOWN **v36;
  _QWORD v37[5];
  uint64_t v38[3];
  uint64_t v39;
  _UNKNOWN **v40;

  v39 = type metadata accessor for DateProvider();
  v40 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v11 = type metadata accessor for FitnessPlusPlanSystem();
  v37[3] = v11;
  v37[4] = &off_1E880C3D0;
  v37[0] = a3;
  v35 = &type metadata for FitnessPlusPlanServiceFactory;
  v36 = &off_1E8809138;
  v12 = swift_allocObject();
  v34[0] = v12;
  v13 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v12 + 144) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v12 + 160) = v13;
  *(_QWORD *)(v12 + 176) = *(_QWORD *)(a4 + 160);
  v14 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v12 + 96) = v14;
  v15 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v12 + 128) = v15;
  v16 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v12 + 32) = v16;
  v17 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v12 + 64) = v17;
  type metadata accessor for FitnessPlusPlanListener();
  v18 = swift_allocObject();
  v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v38, v39);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v34[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v22 + 16))(v21);
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v37, v11);
  MEMORY[0x1E0C80A78](v23);
  v25 = (_QWORD *)((char *)&v34[-1] - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, (uint64_t)v35);
  MEMORY[0x1E0C80A78](v27);
  v29 = (char *)&v34[-1] - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v30 + 16))(v29);
  v31 = sub_1CC3C0D68((uint64_t)v21, a2, *v25, (uint64_t)v29, a5, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
  return v31;
}

_QWORD *sub_1CC3BFEF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[24];
  ValueMetadata *v72;
  _UNKNOWN **v73;
  _QWORD v74[3];
  uint64_t v75;
  _UNKNOWN **v76;
  _QWORD v77[3];
  uint64_t v78;
  _UNKNOWN **v79;
  _QWORD v80[3];
  ValueMetadata *v81;
  _UNKNOWN **v82;
  _BYTE v83[24];
  ValueMetadata *v84;
  _UNKNOWN **v85;
  _QWORD v86[3];
  ValueMetadata *v87;
  _UNKNOWN **v88;
  _QWORD v89[3];
  uint64_t v90;
  _UNKNOWN **v91;
  _QWORD v92[3];
  uint64_t PickupObserver;
  _UNKNOWN **v94;
  _BYTE v95[24];
  ValueMetadata *v96;
  _UNKNOWN **v97;
  uint64_t v98[3];
  uint64_t v99;
  _UNKNOWN **v100;
  _QWORD v101[6];

  v70 = a1;
  v69 = a10;
  v17 = type metadata accessor for FitnessModeObserver();
  v101[3] = v17;
  v101[4] = &off_1E880B0B8;
  v101[0] = a2;
  v99 = type metadata accessor for DateProvider();
  v100 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v98);
  sub_1CC3834D0(a3, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v96 = &type metadata for PauseRingsStore;
  v97 = &off_1E880A230;
  PickupObserver = type metadata accessor for FirstPickupObserver(0);
  v94 = &off_1E8809F50;
  v92[0] = a4;
  v90 = type metadata accessor for NotificationRequestScheduler();
  v91 = &off_1E8808FE8;
  v89[0] = a5;
  v87 = &type metadata for NotificationSettingsProvider;
  v88 = &off_1E8808D80;
  v19 = swift_allocObject();
  v86[0] = v19;
  v20 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a6;
  *(_OWORD *)(v19 + 32) = v20;
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(a6 + 32);
  *(_QWORD *)(v19 + 64) = *(_QWORD *)(a6 + 48);
  v84 = &type metadata for PrivacySettingsProvider;
  v85 = &off_1E880AE60;
  v81 = &type metadata for PauseRingsServiceFactory;
  v82 = &off_1E8809E68;
  v21 = swift_allocObject();
  v80[0] = v21;
  v22 = *(_OWORD *)(a7 + 144);
  *(_OWORD *)(v21 + 144) = *(_OWORD *)(a7 + 128);
  *(_OWORD *)(v21 + 160) = v22;
  *(_QWORD *)(v21 + 176) = *(_QWORD *)(a7 + 160);
  v23 = *(_OWORD *)(a7 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(a7 + 64);
  *(_OWORD *)(v21 + 96) = v23;
  v24 = *(_OWORD *)(a7 + 112);
  *(_OWORD *)(v21 + 112) = *(_OWORD *)(a7 + 96);
  *(_OWORD *)(v21 + 128) = v24;
  v25 = *(_OWORD *)(a7 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)a7;
  *(_OWORD *)(v21 + 32) = v25;
  v26 = *(_OWORD *)(a7 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(a7 + 32);
  *(_OWORD *)(v21 + 64) = v26;
  v78 = type metadata accessor for UserDayProvider();
  v79 = &off_1E880A8D8;
  v77[0] = a8;
  v75 = type metadata accessor for XPCActivityScheduler();
  v76 = &off_1E880B388;
  v74[0] = a9;
  v72 = &type metadata for LockStateProvider;
  v73 = &off_1E88087C8;
  type metadata accessor for PauseRingsSystem();
  v68 = (_QWORD *)swift_allocObject();
  v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v101, v17);
  MEMORY[0x1E0C80A78](v27);
  v29 = (uint64_t *)((char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v30 + 16))(v29);
  v31 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v98, v99);
  MEMORY[0x1E0C80A78](v31);
  v33 = (char *)&v67 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v34 + 16))(v33);
  v35 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v95, (uint64_t)v96);
  MEMORY[0x1E0C80A78](v35);
  (*(void (**)(void))(v36 + 16))();
  v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v92, PickupObserver);
  MEMORY[0x1E0C80A78](v37);
  v39 = (uint64_t *)((char *)&v67 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v40 + 16))(v39);
  v41 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v89, v90);
  MEMORY[0x1E0C80A78](v41);
  v43 = (uint64_t *)((char *)&v67 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v44 + 16))(v43);
  v45 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v86, (uint64_t)v87);
  MEMORY[0x1E0C80A78](v45);
  v47 = (char *)&v67 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v48 + 16))(v47);
  v49 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v83, (uint64_t)v84);
  MEMORY[0x1E0C80A78](v49);
  (*(void (**)(void))(v50 + 16))();
  v51 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v80, (uint64_t)v81);
  MEMORY[0x1E0C80A78](v51);
  v53 = (char *)&v67 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v54 + 16))(v53);
  v55 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v77, v78);
  MEMORY[0x1E0C80A78](v55);
  v57 = (uint64_t *)((char *)&v67 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v58 + 16))(v57);
  v59 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v74, v75);
  MEMORY[0x1E0C80A78](v59);
  v61 = (uint64_t *)((char *)&v67 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v62 + 16))(v61);
  v63 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v71, (uint64_t)v72);
  MEMORY[0x1E0C80A78](v63);
  (*(void (**)(void))(v64 + 16))();
  v65 = sub_1CC3BE264(v70, *v29, (uint64_t)v33, *v39, *v43, (uint64_t)v47, (uint64_t)v53, *v57, *v61, v69, v68);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v83);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v101);
  return v65;
}

uint64_t sub_1CC3C0508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v32[3];
  ValueMetadata *v33;
  _UNKNOWN **v34;
  _QWORD v35[5];
  uint64_t v36[3];
  uint64_t v37;
  _UNKNOWN **v38;

  v37 = type metadata accessor for DateProvider();
  v38 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v9 = type metadata accessor for PauseRingsSystem();
  v35[3] = v9;
  v35[4] = &off_1E880BB30;
  v35[0] = a2;
  v33 = &type metadata for PauseRingsServiceFactory;
  v34 = &off_1E8809E68;
  v10 = swift_allocObject();
  v32[0] = v10;
  v11 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(v10 + 144) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v10 + 160) = v11;
  *(_QWORD *)(v10 + 176) = *(_QWORD *)(a3 + 160);
  v12 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v10 + 96) = v12;
  v13 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v10 + 112) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v10 + 128) = v13;
  v14 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v10 + 32) = v14;
  v15 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v10 + 64) = v15;
  type metadata accessor for PauseRingsListener();
  v16 = swift_allocObject();
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v32[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v19);
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v9);
  MEMORY[0x1E0C80A78](v21);
  v23 = (_QWORD *)((char *)&v32[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, (uint64_t)v33);
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v32[-1] - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v28 + 16))(v27);
  v29 = sub_1CC3C0C28((uint64_t)v19, *v23, (uint64_t)v27, a4, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return v29;
}

_QWORD *sub_1CC3C0730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _BYTE v41[24];
  ValueMetadata *v42;
  _UNKNOWN **v43;
  _QWORD v44[3];
  uint64_t v45;
  _UNKNOWN **v46;
  _BYTE v47[24];
  ValueMetadata *v48;
  _UNKNOWN **v49;
  _QWORD v50[3];
  ValueMetadata *v51;
  _UNKNOWN **v52;
  _QWORD v53[5];
  uint64_t v54[3];
  uint64_t v55;
  _UNKNOWN **v56;

  v55 = type metadata accessor for DateProvider();
  v56 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v54);
  sub_1CC3834D0(a2, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v15 = type metadata accessor for FitnessModeObserver();
  v53[3] = v15;
  v53[4] = &off_1E880B0B8;
  v53[0] = a3;
  v51 = &type metadata for NotificationSettingsProvider;
  v52 = &off_1E8808D80;
  v16 = swift_allocObject();
  v50[0] = v16;
  v17 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v16 + 32) = v17;
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(a4 + 32);
  *(_QWORD *)(v16 + 64) = *(_QWORD *)(a4 + 48);
  v48 = &type metadata for PrivacySettingsProvider;
  v49 = &off_1E880AE60;
  v45 = type metadata accessor for UserDayProvider();
  v46 = &off_1E880A8D8;
  v44[0] = a6;
  v42 = &type metadata for GoalProgressConfigurationFactory;
  v43 = &off_1E880AC40;
  type metadata accessor for GoalProgressSystem();
  v18 = (_QWORD *)swift_allocObject();
  v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v54, v55);
  MEMORY[0x1E0C80A78](v19);
  v21 = &v41[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v22 + 16))(v21);
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v53, v15);
  MEMORY[0x1E0C80A78](v23);
  v25 = (uint64_t *)&v41[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v50, (uint64_t)v51);
  MEMORY[0x1E0C80A78](v27);
  v29 = &v41[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v30 + 16))(v29);
  v31 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v47, (uint64_t)v48);
  MEMORY[0x1E0C80A78](v31);
  (*(void (**)(void))(v32 + 16))();
  v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v44, v45);
  MEMORY[0x1E0C80A78](v33);
  v35 = (uint64_t *)&v41[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v36 + 16))(v35);
  v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v41, (uint64_t)v42);
  MEMORY[0x1E0C80A78](v37);
  (*(void (**)(void))(v38 + 16))();
  v39 = sub_1CC3BE0C8(a1, (uint64_t)v21, *v25, (uint64_t)v29, a5, *v35, a7, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  return v39;
}

uint64_t sub_1CC3C0ABC(uint64_t a1, uint64_t a2)
{
  uint64_t PickupObserver;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  __int128 v19;
  ValueMetadata *v20;
  _UNKNOWN **v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v23[3] = &type metadata for FirstGlanceStore;
  v23[4] = &off_1E880BA18;
  v23[0] = a1;
  PickupObserver = type metadata accessor for FirstPickupObserver(0);
  v22[3] = PickupObserver;
  v22[4] = &off_1E8809F50;
  v22[0] = a2;
  type metadata accessor for AdminSystem();
  v4 = swift_allocObject();
  v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, (uint64_t)&type metadata for FirstGlanceStore);
  MEMORY[0x1E0C80A78](v5);
  v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, PickupObserver);
  MEMORY[0x1E0C80A78](v9);
  v11 = (uint64_t *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  v13 = *v7;
  v14 = *v11;
  v20 = &type metadata for FirstGlanceStore;
  v21 = &off_1E880BA18;
  v18 = &off_1E8809F50;
  *(_QWORD *)&v19 = v13;
  v17 = PickupObserver;
  *(_QWORD *)&v16 = v14;
  swift_defaultActor_initialize();
  sub_1CC347088(&v19, v4 + 112);
  sub_1CC347088(&v16, v4 + 152);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return v4;
}

uint64_t sub_1CC3C0C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;
  __int128 v21;
  uint64_t v22;
  _UNKNOWN **v23;
  __int128 v24;
  uint64_t v25;
  _UNKNOWN **v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v28 = sub_1CC3C5C40();
  v29 = MEMORY[0x1E0D218F0];
  *(_QWORD *)&v27 = a4;
  v25 = type metadata accessor for DateProvider();
  v26 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v22 = type metadata accessor for PauseRingsSystem();
  v23 = &off_1E880BB30;
  *(_QWORD *)&v21 = a2;
  v19 = &type metadata for PauseRingsServiceFactory;
  v20 = &off_1E8809E68;
  v11 = swift_allocObject();
  *(_QWORD *)&v18 = v11;
  v12 = *(_OWORD *)(a3 + 144);
  *(_OWORD *)(v11 + 144) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v11 + 160) = v12;
  *(_QWORD *)(v11 + 176) = *(_QWORD *)(a3 + 160);
  v13 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v11 + 96) = v13;
  v14 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v11 + 112) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v11 + 128) = v14;
  v15 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v11 + 32) = v15;
  v16 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v11 + 64) = v16;
  swift_defaultActor_initialize();
  sub_1CC347088(&v24, a5 + 112);
  sub_1CC347088(&v21, a5 + 152);
  sub_1CC347088(&v18, a5 + 192);
  sub_1CC347088(&v27, a5 + 232);
  return a5;
}

uint64_t sub_1CC3C0D68(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  __int128 v23;
  uint64_t v24;
  _UNKNOWN **v25;
  __int128 v26;
  uint64_t v27;
  _UNKNOWN **v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v30 = sub_1CC3C5C40();
  v31 = MEMORY[0x1E0D218F0];
  *(_QWORD *)&v29 = a5;
  v27 = type metadata accessor for DateProvider();
  v28 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v24 = type metadata accessor for FitnessPlusPlanSystem();
  v25 = &off_1E880C3D0;
  *(_QWORD *)&v23 = a3;
  v21 = &type metadata for FitnessPlusPlanServiceFactory;
  v22 = &off_1E8809138;
  v13 = swift_allocObject();
  *(_QWORD *)&v20 = v13;
  v14 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v13 + 144) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v13 + 160) = v14;
  *(_QWORD *)(v13 + 176) = *(_QWORD *)(a4 + 160);
  v15 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v13 + 96) = v15;
  v16 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v13 + 128) = v16;
  v17 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v13 + 32) = v17;
  v18 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v13 + 64) = v18;
  swift_defaultActor_initialize();
  sub_1CC347088(&v26, a6 + 112);
  sub_1CC347088(a2, a6 + 192);
  sub_1CC347088(&v23, a6 + 152);
  sub_1CC347088(&v20, a6 + 232);
  sub_1CC347088(&v29, a6 + 272);
  return a6;
}

unint64_t sub_1CC3C0EB8(_QWORD *a1)
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
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF9C7F60);
  v3 = (_QWORD *)sub_1CC3C67A4();
  v4 = a1[4];
  v5 = (void *)a1[5];
  result = sub_1CC3B1550(v4);
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
    result = sub_1CC3B1550(v4);
    v8 = v13;
    v5 = v14;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_1CC3C0FAC(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9C7F58);
    v3 = (_QWORD *)sub_1CC3C67A4();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_1CC3B1550(v5);
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
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

id sub_1CC3C1084(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  _BYTE *v10;
  _DWORD *v11;
  char *v12;
  id v13;
  id v14;
  objc_super v16;
  _BYTE v17[24];
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20[5];

  v20[3] = type metadata accessor for DateProvider();
  v20[4] = (uint64_t)&off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v18 = &type metadata for DuetObserver;
  v19 = &off_1E88094C8;
  sub_1CC32F1E8((uint64_t)v20, (uint64_t)a4 + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_dateProvider);
  sub_1CC32F1E8((uint64_t)v17, (uint64_t)a4 + OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_duetObserver);
  type metadata accessor for UnfairLock();
  v9 = swift_allocObject();
  v10 = a4;
  v11 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v9 + 16) = v11;
  *v11 = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_lock] = v9;
  *(_QWORD *)&v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_notificationCenter] = a2;
  v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_platform] = a3;
  v12 = &v10[OBJC_IVAR____TtC23FitnessCoachingServices13SleepObserver_state];
  *(_QWORD *)v12 = 0;
  v12[8] = -1;
  v13 = a2;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for SleepObserver();
  v14 = objc_msgSendSuper2(&v16, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v14;
}

id sub_1CC3C11E0(uint64_t a1, void *a2, char a3)
{
  uint64_t *boxed_opaque_existential_1;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _BYTE v16[24];
  ValueMetadata *v17;
  _UNKNOWN **v18;
  uint64_t v19[3];
  uint64_t v20;
  _UNKNOWN **v21;

  v20 = type metadata accessor for DateProvider();
  v21 = &off_1E88087E0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
  sub_1CC3834D0(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for DateProvider);
  v17 = &type metadata for DuetObserver;
  v18 = &off_1E88094C8;
  v7 = objc_allocWithZone((Class)type metadata accessor for SleepObserver());
  v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
  MEMORY[0x1E0C80A78](v8);
  v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v11 + 16))(v10);
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, (uint64_t)v17);
  MEMORY[0x1E0C80A78](v12);
  (*(void (**)(void))(v13 + 16))();
  v14 = sub_1CC3C1084((uint64_t)v10, a2, a3, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return v14;
}

uint64_t sub_1CC3C133C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CC3C1368()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  return swift_deallocObject();
}

uint64_t sub_1CC3C13AC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  return swift_deallocObject();
}

uint64_t sub_1CC3C13F0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1CC3C1414(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PauseRingsServiceFactory(a2, a1);
  return a2;
}

uint64_t sub_1CC3C1450()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  return swift_deallocObject();
}

uint64_t sub_1CC3C1494()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);

  return swift_deallocObject();
}

uint64_t sub_1CC3C14E0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return swift_deallocObject();
}

uint64_t sub_1CC3C1514()
{
  id *v0;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 13));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 18));

  return swift_deallocObject();
}

uint64_t sub_1CC3C1568(uint64_t a1)
{
  destroy for PauseRingsServiceFactory(a1);
  return a1;
}

uint64_t sub_1CC3C159C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CC3C15C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CC32BB18;
  return sub_1CC342194(a1, v1);
}

uint64_t sub_1CC3C1614(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CC32BAD0;
  return sub_1CC34738C(a1, v1);
}

uint64_t sub_1CC3C1664(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CC32BB18;
  return sub_1CC348E18(a1, v1);
}

uint64_t sub_1CC3C16B4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CC32BB18;
  return sub_1CC3957F8(v0);
}

uint64_t sub_1CC3C16FC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CC32BB18;
  return sub_1CC36850C(a1, v1);
}

uint64_t sub_1CC3C174C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CC32BB18;
  return sub_1CC36BBF8(a1, v1);
}

void destroy for Daemon(id *a1)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 2));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 12));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 17));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 22));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 27));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 33));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 38));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 43));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 48));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 54));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 59));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 64));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 69));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 74));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 79));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 85));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 90));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 95));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 101));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 106));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 111));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 116));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 121));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 126));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 131));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 136));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 141));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 146));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 151));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 156));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 161));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 166));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 171));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 176));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 181));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 186));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 191));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 197));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 202));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 207));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 212));

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 222));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 228));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 233));
  swift_release();

  swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Daemon(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  __int128 v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  id v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  void *v60;
  __int128 v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t, uint64_t);
  id v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t, uint64_t);
  id v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t, uint64_t);
  id v79;
  __int128 v80;
  void *v81;
  void *v82;
  id v83;
  id v84;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2 + 16;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  v7 = v6;
  v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 56, a2 + 56);
  v10 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 96, a2 + 96);
  v11 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 136, a2 + 136);
  v12 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 176, a2 + 176);
  v13 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 216, a2 + 216);
  v14 = *(void **)(a2 + 256);
  *(_QWORD *)(a1 + 256) = v14;
  v15 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v15;
  v16 = v15;
  v17 = **(void (***)(uint64_t, uint64_t, uint64_t))(v15 - 8);
  v18 = v14;
  v17(a1 + 264, a2 + 264, v16);
  v19 = *(_QWORD *)(a2 + 328);
  v20 = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 328) = v19;
  *(_QWORD *)(a1 + 336) = v20;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 304, a2 + 304);
  v21 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v21;
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 344, a2 + 344);
  v22 = *(_QWORD *)(a2 + 408);
  v23 = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 408) = v22;
  *(_QWORD *)(a1 + 416) = v23;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 384, a2 + 384);
  *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
  v25 = *(_QWORD *)(a2 + 456);
  v24 = *(_QWORD *)(a2 + 464);
  *(_QWORD *)(a1 + 456) = v25;
  *(_QWORD *)(a1 + 464) = v24;
  v26 = **(void (***)(uint64_t, uint64_t, uint64_t))(v25 - 8);
  swift_retain();
  v26(a1 + 432, a2 + 432, v25);
  v27 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 496) = v27;
  (**(void (***)(uint64_t, uint64_t))(v27 - 8))(a1 + 472, a2 + 472);
  v28 = *(_QWORD *)(a2 + 536);
  *(_QWORD *)(a1 + 536) = v28;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v28 - 8))(a1 + 512, a2 + 512);
  v29 = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 576) = v29;
  (**(void (***)(uint64_t, uint64_t))(v29 - 8))(a1 + 552, a2 + 552);
  v30 = *(_QWORD *)(a2 + 616);
  *(_QWORD *)(a1 + 616) = v30;
  *(_QWORD *)(a1 + 624) = *(_QWORD *)(a2 + 624);
  (**(void (***)(uint64_t, uint64_t))(v30 - 8))(a1 + 592, a2 + 592);
  v31 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 656) = v31;
  (**(void (***)(uint64_t, uint64_t))(v31 - 8))(a1 + 632, a2 + 632);
  *(_QWORD *)(a1 + 672) = *(_QWORD *)(a2 + 672);
  v32 = *(_OWORD *)(a2 + 704);
  *(_OWORD *)(a1 + 704) = v32;
  v33 = v32;
  v34 = **(void (***)(uint64_t, uint64_t, uint64_t))(v32 - 8);
  swift_retain();
  v34(a1 + 680, a2 + 680, v33);
  v35 = *(_QWORD *)(a2 + 744);
  *(_QWORD *)(a1 + 744) = v35;
  *(_QWORD *)(a1 + 752) = *(_QWORD *)(a2 + 752);
  (**(void (***)(uint64_t, uint64_t))(v35 - 8))(a1 + 720, a2 + 720);
  v36 = *(_OWORD *)(a2 + 784);
  *(_OWORD *)(a1 + 784) = v36;
  (**(void (***)(uint64_t, uint64_t))(v36 - 8))(a1 + 760, a2 + 760);
  v37 = *(void **)(a2 + 800);
  *(_QWORD *)(a1 + 800) = v37;
  v38 = *(_OWORD *)(a2 + 832);
  *(_OWORD *)(a1 + 832) = v38;
  v39 = v38;
  v40 = **(void (***)(uint64_t, uint64_t, uint64_t))(v38 - 8);
  v41 = v37;
  v40(a1 + 808, a2 + 808, v39);
  v42 = *(_QWORD *)(a2 + 872);
  *(_QWORD *)(a1 + 872) = v42;
  *(_QWORD *)(a1 + 880) = *(_QWORD *)(a2 + 880);
  (**(void (***)(uint64_t, uint64_t))(v42 - 8))(a1 + 848, a2 + 848);
  v43 = *(_OWORD *)(a2 + 912);
  *(_OWORD *)(a1 + 912) = v43;
  (**(void (***)(uint64_t, uint64_t))(v43 - 8))(a1 + 888, a2 + 888);
  v44 = *(_QWORD *)(a2 + 952);
  *(_QWORD *)(a1 + 952) = v44;
  *(_QWORD *)(a1 + 960) = *(_QWORD *)(a2 + 960);
  (**(void (***)(uint64_t, uint64_t))(v44 - 8))(a1 + 928, a2 + 928);
  v45 = *(_OWORD *)(a2 + 992);
  *(_OWORD *)(a1 + 992) = v45;
  (**(void (***)(uint64_t, uint64_t))(v45 - 8))(a1 + 968, a2 + 968);
  v46 = *(_QWORD *)(a2 + 1032);
  *(_QWORD *)(a1 + 1032) = v46;
  *(_QWORD *)(a1 + 1040) = *(_QWORD *)(a2 + 1040);
  (**(void (***)(uint64_t, uint64_t))(v46 - 8))(a1 + 1008, a2 + 1008);
  v47 = *(_OWORD *)(a2 + 1072);
  *(_OWORD *)(a1 + 1072) = v47;
  (**(void (***)(uint64_t, uint64_t))(v47 - 8))(a1 + 1048, a2 + 1048);
  v48 = *(_QWORD *)(a2 + 1112);
  *(_QWORD *)(a1 + 1112) = v48;
  *(_QWORD *)(a1 + 1120) = *(_QWORD *)(a2 + 1120);
  (**(void (***)(uint64_t, uint64_t))(v48 - 8))(a1 + 1088, a2 + 1088);
  v49 = *(_OWORD *)(a2 + 1152);
  *(_OWORD *)(a1 + 1152) = v49;
  (**(void (***)(uint64_t, uint64_t))(v49 - 8))(a1 + 1128, a2 + 1128);
  v50 = *(_QWORD *)(a2 + 1192);
  *(_QWORD *)(a1 + 1192) = v50;
  *(_QWORD *)(a1 + 1200) = *(_QWORD *)(a2 + 1200);
  (**(void (***)(uint64_t, uint64_t))(v50 - 8))(a1 + 1168, a2 + 1168);
  v51 = *(_OWORD *)(a2 + 1232);
  *(_OWORD *)(a1 + 1232) = v51;
  (**(void (***)(uint64_t, uint64_t))(v51 - 8))(a1 + 1208, a2 + 1208);
  v52 = *(_QWORD *)(a2 + 1272);
  *(_QWORD *)(a1 + 1272) = v52;
  *(_QWORD *)(a1 + 1280) = *(_QWORD *)(a2 + 1280);
  (**(void (***)(uint64_t, uint64_t))(v52 - 8))(a1 + 1248, a2 + 1248);
  v53 = *(_OWORD *)(a2 + 1312);
  *(_OWORD *)(a1 + 1312) = v53;
  (**(void (***)(uint64_t, uint64_t))(v53 - 8))(a1 + 1288, a2 + 1288);
  v54 = *(_QWORD *)(a2 + 1352);
  *(_QWORD *)(a1 + 1352) = v54;
  *(_QWORD *)(a1 + 1360) = *(_QWORD *)(a2 + 1360);
  (**(void (***)(uint64_t, uint64_t))(v54 - 8))(a1 + 1328, a2 + 1328);
  v55 = *(_OWORD *)(a2 + 1392);
  *(_OWORD *)(a1 + 1392) = v55;
  (**(void (***)(uint64_t, uint64_t))(v55 - 8))(a1 + 1368, a2 + 1368);
  v56 = *(_QWORD *)(a2 + 1432);
  *(_QWORD *)(a1 + 1432) = v56;
  *(_QWORD *)(a1 + 1440) = *(_QWORD *)(a2 + 1440);
  (**(void (***)(uint64_t, uint64_t))(v56 - 8))(a1 + 1408, a2 + 1408);
  v57 = *(_OWORD *)(a2 + 1472);
  *(_OWORD *)(a1 + 1472) = v57;
  (**(void (***)(uint64_t, uint64_t))(v57 - 8))(a1 + 1448, a2 + 1448);
  v58 = *(_QWORD *)(a2 + 1512);
  *(_QWORD *)(a1 + 1512) = v58;
  *(_QWORD *)(a1 + 1520) = *(_QWORD *)(a2 + 1520);
  (**(void (***)(uint64_t, uint64_t))(v58 - 8))(a1 + 1488, a2 + 1488);
  v59 = *(_OWORD *)(a2 + 1552);
  *(_OWORD *)(a1 + 1552) = v59;
  (**(void (***)(uint64_t, uint64_t))(v59 - 8))(a1 + 1528, a2 + 1528);
  v60 = *(void **)(a2 + 1568);
  *(_QWORD *)(a1 + 1568) = v60;
  v61 = *(_OWORD *)(a2 + 1600);
  *(_OWORD *)(a1 + 1600) = v61;
  v62 = v61;
  v63 = **(void (***)(uint64_t, uint64_t, uint64_t))(v61 - 8);
  v64 = v60;
  v63(a1 + 1576, a2 + 1576, v62);
  v65 = *(_QWORD *)(a2 + 1640);
  *(_QWORD *)(a1 + 1640) = v65;
  *(_QWORD *)(a1 + 1648) = *(_QWORD *)(a2 + 1648);
  (**(void (***)(uint64_t, uint64_t))(v65 - 8))(a1 + 1616, a2 + 1616);
  v66 = *(_OWORD *)(a2 + 1680);
  *(_OWORD *)(a1 + 1680) = v66;
  (**(void (***)(uint64_t, uint64_t))(v66 - 8))(a1 + 1656, a2 + 1656);
  v67 = *(_QWORD *)(a2 + 1720);
  *(_QWORD *)(a1 + 1720) = v67;
  *(_QWORD *)(a1 + 1728) = *(_QWORD *)(a2 + 1728);
  (**(void (***)(uint64_t, uint64_t))(v67 - 8))(a1 + 1696, a2 + 1696);
  v68 = *(void **)(a2 + 1736);
  *(_QWORD *)(a1 + 1736) = v68;
  *(_OWORD *)(a1 + 1744) = *(_OWORD *)(a2 + 1744);
  v69 = *(void **)(a2 + 1760);
  *(_QWORD *)(a1 + 1760) = v69;
  v70 = *(void **)(a2 + 1768);
  *(_QWORD *)(a1 + 1768) = v70;
  v71 = *(_QWORD *)(a2 + 1800);
  *(_QWORD *)(a1 + 1800) = v71;
  *(_QWORD *)(a1 + 1808) = *(_QWORD *)(a2 + 1808);
  v72 = **(void (***)(uint64_t, uint64_t, uint64_t))(v71 - 8);
  v73 = v68;
  swift_unknownObjectRetain();
  v74 = v69;
  v75 = v70;
  v72(a1 + 1776, a2 + 1776, v71);
  v76 = *(void **)(a2 + 1816);
  *(_QWORD *)(a1 + 1816) = v76;
  v77 = *(_QWORD *)(a2 + 1848);
  *(_QWORD *)(a1 + 1848) = v77;
  *(_QWORD *)(a1 + 1856) = *(_QWORD *)(a2 + 1856);
  v78 = **(void (***)(uint64_t, uint64_t, uint64_t))(v77 - 8);
  v79 = v76;
  v78(a1 + 1824, a2 + 1824, v77);
  v80 = *(_OWORD *)(a2 + 1888);
  *(_OWORD *)(a1 + 1888) = v80;
  (**(void (***)(uint64_t, uint64_t))(v80 - 8))(a1 + 1864, a2 + 1864);
  *(_QWORD *)(a1 + 1904) = *(_QWORD *)(a2 + 1904);
  v81 = *(void **)(a2 + 1912);
  *(_QWORD *)(a1 + 1912) = v81;
  *(_QWORD *)(a1 + 1920) = *(_QWORD *)(a2 + 1920);
  v82 = *(void **)(a2 + 1928);
  *(_QWORD *)(a1 + 1928) = v82;
  swift_retain();
  v83 = v81;
  swift_bridgeObjectRetain();
  v84 = v82;
  return a1;
}

uint64_t *assignWithCopy for Daemon(uint64_t *a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  v4 = (void *)a2[32];
  v5 = (void *)a1[32];
  a1[32] = (uint64_t)v4;
  v6 = v4;

  __swift_assign_boxed_opaque_existential_1(a1 + 33, a2 + 33);
  __swift_assign_boxed_opaque_existential_1(a1 + 38, a2 + 38);
  __swift_assign_boxed_opaque_existential_1(a1 + 43, a2 + 43);
  __swift_assign_boxed_opaque_existential_1(a1 + 48, a2 + 48);
  a1[53] = a2[53];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 54, a2 + 54);
  __swift_assign_boxed_opaque_existential_1(a1 + 59, a2 + 59);
  __swift_assign_boxed_opaque_existential_1(a1 + 64, a2 + 64);
  __swift_assign_boxed_opaque_existential_1(a1 + 69, a2 + 69);
  __swift_assign_boxed_opaque_existential_1(a1 + 74, a2 + 74);
  __swift_assign_boxed_opaque_existential_1(a1 + 79, a2 + 79);
  a1[84] = a2[84];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 85, a2 + 85);
  __swift_assign_boxed_opaque_existential_1(a1 + 90, a2 + 90);
  __swift_assign_boxed_opaque_existential_1(a1 + 95, a2 + 95);
  v7 = (void *)a2[100];
  v8 = (void *)a1[100];
  a1[100] = (uint64_t)v7;
  v9 = v7;

  __swift_assign_boxed_opaque_existential_1(a1 + 101, a2 + 101);
  __swift_assign_boxed_opaque_existential_1(a1 + 106, a2 + 106);
  __swift_assign_boxed_opaque_existential_1(a1 + 111, a2 + 111);
  __swift_assign_boxed_opaque_existential_1(a1 + 116, a2 + 116);
  __swift_assign_boxed_opaque_existential_1(a1 + 121, a2 + 121);
  __swift_assign_boxed_opaque_existential_1(a1 + 126, a2 + 126);
  __swift_assign_boxed_opaque_existential_1(a1 + 131, a2 + 131);
  __swift_assign_boxed_opaque_existential_1(a1 + 136, a2 + 136);
  __swift_assign_boxed_opaque_existential_1(a1 + 141, a2 + 141);
  __swift_assign_boxed_opaque_existential_1(a1 + 146, a2 + 146);
  __swift_assign_boxed_opaque_existential_1(a1 + 151, a2 + 151);
  __swift_assign_boxed_opaque_existential_1(a1 + 156, a2 + 156);
  __swift_assign_boxed_opaque_existential_1(a1 + 161, a2 + 161);
  __swift_assign_boxed_opaque_existential_1(a1 + 166, a2 + 166);
  __swift_assign_boxed_opaque_existential_1(a1 + 171, a2 + 171);
  __swift_assign_boxed_opaque_existential_1(a1 + 176, a2 + 176);
  __swift_assign_boxed_opaque_existential_1(a1 + 181, a2 + 181);
  __swift_assign_boxed_opaque_existential_1(a1 + 186, a2 + 186);
  __swift_assign_boxed_opaque_existential_1(a1 + 191, a2 + 191);
  v10 = (void *)a2[196];
  v11 = (void *)a1[196];
  a1[196] = (uint64_t)v10;
  v12 = v10;

  __swift_assign_boxed_opaque_existential_1(a1 + 197, a2 + 197);
  __swift_assign_boxed_opaque_existential_1(a1 + 202, a2 + 202);
  __swift_assign_boxed_opaque_existential_1(a1 + 207, a2 + 207);
  __swift_assign_boxed_opaque_existential_1(a1 + 212, a2 + 212);
  v13 = (void *)a2[217];
  v14 = (void *)a1[217];
  a1[217] = (uint64_t)v13;
  v15 = v13;

  v16 = a2[219];
  a1[218] = a2[218];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[219] = v16;
  v17 = (void *)a2[220];
  v18 = (void *)a1[220];
  a1[220] = (uint64_t)v17;
  v19 = v17;

  v20 = (void *)a2[221];
  v21 = (void *)a1[221];
  a1[221] = (uint64_t)v20;
  v22 = v20;

  __swift_assign_boxed_opaque_existential_1(a1 + 222, a2 + 222);
  v23 = (void *)a2[227];
  v24 = (void *)a1[227];
  a1[227] = (uint64_t)v23;
  v25 = v23;

  __swift_assign_boxed_opaque_existential_1(a1 + 228, a2 + 228);
  __swift_assign_boxed_opaque_existential_1(a1 + 233, a2 + 233);
  a1[238] = a2[238];
  swift_retain();
  swift_release();
  v26 = (void *)a2[239];
  v27 = (void *)a1[239];
  a1[239] = (uint64_t)v26;
  v28 = v26;

  a1[240] = a2[240];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = (void *)a2[241];
  v30 = (void *)a1[241];
  a1[241] = (uint64_t)v29;
  v31 = v29;

  return a1;
}

void *__swift_memcpy1936_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x790uLL);
}

uint64_t assignWithTake for Daemon(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
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
  void *v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  void *v47;
  void *v48;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  v7 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v7;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  v8 = *(_QWORD *)(a2 + 256);
  v9 = *(void **)(a1 + 256);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = v8;

  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  v10 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v10;
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  v11 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v11;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 344);
  v12 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v12;
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  v13 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v13;
  v14 = *(_QWORD *)(a2 + 424);
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 424) = v14;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 432);
  v15 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 448) = v15;
  *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  v16 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v16;
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  v17 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v17;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  v18 = *(_OWORD *)(a2 + 568);
  *(_OWORD *)(a1 + 552) = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 568) = v18;
  *(_QWORD *)(a1 + 584) = *(_QWORD *)(a2 + 584);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  v19 = *(_OWORD *)(a2 + 608);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 608) = v19;
  *(_QWORD *)(a1 + 624) = *(_QWORD *)(a2 + 624);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  v20 = *(_OWORD *)(a2 + 648);
  *(_OWORD *)(a1 + 632) = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 648) = v20;
  *(_QWORD *)(a1 + 664) = *(_QWORD *)(a2 + 664);
  *(_QWORD *)(a1 + 672) = *(_QWORD *)(a2 + 672);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 680);
  v21 = *(_OWORD *)(a2 + 696);
  *(_OWORD *)(a1 + 680) = *(_OWORD *)(a2 + 680);
  *(_OWORD *)(a1 + 696) = v21;
  *(_QWORD *)(a1 + 712) = *(_QWORD *)(a2 + 712);
  __swift_destroy_boxed_opaque_existential_1(a1 + 720);
  v22 = *(_OWORD *)(a2 + 736);
  *(_OWORD *)(a1 + 720) = *(_OWORD *)(a2 + 720);
  *(_OWORD *)(a1 + 736) = v22;
  *(_QWORD *)(a1 + 752) = *(_QWORD *)(a2 + 752);
  __swift_destroy_boxed_opaque_existential_1(a1 + 760);
  v23 = *(_OWORD *)(a2 + 776);
  *(_OWORD *)(a1 + 760) = *(_OWORD *)(a2 + 760);
  *(_OWORD *)(a1 + 776) = v23;
  *(_QWORD *)(a1 + 792) = *(_QWORD *)(a2 + 792);
  v24 = *(void **)(a1 + 800);
  *(_QWORD *)(a1 + 800) = *(_QWORD *)(a2 + 800);

  __swift_destroy_boxed_opaque_existential_1(a1 + 808);
  v25 = *(_OWORD *)(a2 + 824);
  *(_OWORD *)(a1 + 808) = *(_OWORD *)(a2 + 808);
  *(_OWORD *)(a1 + 824) = v25;
  *(_QWORD *)(a1 + 840) = *(_QWORD *)(a2 + 840);
  __swift_destroy_boxed_opaque_existential_1(a1 + 848);
  v26 = *(_OWORD *)(a2 + 864);
  *(_OWORD *)(a1 + 848) = *(_OWORD *)(a2 + 848);
  *(_OWORD *)(a1 + 864) = v26;
  *(_QWORD *)(a1 + 880) = *(_QWORD *)(a2 + 880);
  __swift_destroy_boxed_opaque_existential_1(a1 + 888);
  v27 = *(_OWORD *)(a2 + 904);
  *(_OWORD *)(a1 + 888) = *(_OWORD *)(a2 + 888);
  *(_OWORD *)(a1 + 904) = v27;
  *(_QWORD *)(a1 + 920) = *(_QWORD *)(a2 + 920);
  __swift_destroy_boxed_opaque_existential_1(a1 + 928);
  v28 = *(_OWORD *)(a2 + 944);
  *(_OWORD *)(a1 + 928) = *(_OWORD *)(a2 + 928);
  *(_OWORD *)(a1 + 944) = v28;
  *(_QWORD *)(a1 + 960) = *(_QWORD *)(a2 + 960);
  __swift_destroy_boxed_opaque_existential_1(a1 + 968);
  v29 = *(_OWORD *)(a2 + 984);
  *(_OWORD *)(a1 + 968) = *(_OWORD *)(a2 + 968);
  *(_OWORD *)(a1 + 984) = v29;
  *(_QWORD *)(a1 + 1000) = *(_QWORD *)(a2 + 1000);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1008);
  v30 = *(_OWORD *)(a2 + 1024);
  *(_OWORD *)(a1 + 1008) = *(_OWORD *)(a2 + 1008);
  *(_OWORD *)(a1 + 1024) = v30;
  *(_QWORD *)(a1 + 1040) = *(_QWORD *)(a2 + 1040);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1048);
  v31 = *(_OWORD *)(a2 + 1064);
  *(_OWORD *)(a1 + 1048) = *(_OWORD *)(a2 + 1048);
  *(_OWORD *)(a1 + 1064) = v31;
  *(_QWORD *)(a1 + 1080) = *(_QWORD *)(a2 + 1080);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1088);
  *(_OWORD *)(a1 + 1088) = *(_OWORD *)(a2 + 1088);
  *(_OWORD *)(a1 + 1104) = *(_OWORD *)(a2 + 1104);
  *(_QWORD *)(a1 + 1120) = *(_QWORD *)(a2 + 1120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1128);
  v32 = *(_OWORD *)(a2 + 1144);
  *(_OWORD *)(a1 + 1128) = *(_OWORD *)(a2 + 1128);
  *(_OWORD *)(a1 + 1144) = v32;
  *(_QWORD *)(a1 + 1160) = *(_QWORD *)(a2 + 1160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1168);
  *(_OWORD *)(a1 + 1168) = *(_OWORD *)(a2 + 1168);
  *(_OWORD *)(a1 + 1184) = *(_OWORD *)(a2 + 1184);
  *(_QWORD *)(a1 + 1200) = *(_QWORD *)(a2 + 1200);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1208);
  v33 = *(_OWORD *)(a2 + 1224);
  *(_OWORD *)(a1 + 1208) = *(_OWORD *)(a2 + 1208);
  *(_OWORD *)(a1 + 1224) = v33;
  *(_QWORD *)(a1 + 1240) = *(_QWORD *)(a2 + 1240);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1248);
  *(_OWORD *)(a1 + 1248) = *(_OWORD *)(a2 + 1248);
  *(_OWORD *)(a1 + 1264) = *(_OWORD *)(a2 + 1264);
  *(_QWORD *)(a1 + 1280) = *(_QWORD *)(a2 + 1280);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1288);
  v34 = *(_OWORD *)(a2 + 1304);
  *(_OWORD *)(a1 + 1288) = *(_OWORD *)(a2 + 1288);
  *(_OWORD *)(a1 + 1304) = v34;
  *(_QWORD *)(a1 + 1320) = *(_QWORD *)(a2 + 1320);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1328);
  *(_OWORD *)(a1 + 1328) = *(_OWORD *)(a2 + 1328);
  *(_OWORD *)(a1 + 1344) = *(_OWORD *)(a2 + 1344);
  *(_QWORD *)(a1 + 1360) = *(_QWORD *)(a2 + 1360);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1368);
  v35 = *(_OWORD *)(a2 + 1384);
  *(_OWORD *)(a1 + 1368) = *(_OWORD *)(a2 + 1368);
  *(_OWORD *)(a1 + 1384) = v35;
  *(_QWORD *)(a1 + 1400) = *(_QWORD *)(a2 + 1400);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1408);
  *(_OWORD *)(a1 + 1408) = *(_OWORD *)(a2 + 1408);
  *(_OWORD *)(a1 + 1424) = *(_OWORD *)(a2 + 1424);
  *(_QWORD *)(a1 + 1440) = *(_QWORD *)(a2 + 1440);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1448);
  v36 = *(_OWORD *)(a2 + 1464);
  *(_OWORD *)(a1 + 1448) = *(_OWORD *)(a2 + 1448);
  *(_OWORD *)(a1 + 1464) = v36;
  *(_QWORD *)(a1 + 1480) = *(_QWORD *)(a2 + 1480);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1488);
  *(_OWORD *)(a1 + 1488) = *(_OWORD *)(a2 + 1488);
  *(_OWORD *)(a1 + 1504) = *(_OWORD *)(a2 + 1504);
  *(_QWORD *)(a1 + 1520) = *(_QWORD *)(a2 + 1520);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1528);
  v37 = *(_OWORD *)(a2 + 1544);
  *(_OWORD *)(a1 + 1528) = *(_OWORD *)(a2 + 1528);
  *(_OWORD *)(a1 + 1544) = v37;
  *(_QWORD *)(a1 + 1560) = *(_QWORD *)(a2 + 1560);
  v38 = *(void **)(a1 + 1568);
  *(_QWORD *)(a1 + 1568) = *(_QWORD *)(a2 + 1568);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1576);
  v39 = *(_OWORD *)(a2 + 1592);
  *(_OWORD *)(a1 + 1576) = *(_OWORD *)(a2 + 1576);
  *(_OWORD *)(a1 + 1592) = v39;
  *(_QWORD *)(a1 + 1608) = *(_QWORD *)(a2 + 1608);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1616);
  *(_OWORD *)(a1 + 1616) = *(_OWORD *)(a2 + 1616);
  *(_OWORD *)(a1 + 1632) = *(_OWORD *)(a2 + 1632);
  *(_QWORD *)(a1 + 1648) = *(_QWORD *)(a2 + 1648);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1656);
  v40 = *(_OWORD *)(a2 + 1672);
  *(_OWORD *)(a1 + 1656) = *(_OWORD *)(a2 + 1656);
  *(_OWORD *)(a1 + 1672) = v40;
  *(_QWORD *)(a1 + 1688) = *(_QWORD *)(a2 + 1688);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1696);
  *(_OWORD *)(a1 + 1696) = *(_OWORD *)(a2 + 1696);
  *(_OWORD *)(a1 + 1712) = *(_OWORD *)(a2 + 1712);
  *(_QWORD *)(a1 + 1728) = *(_QWORD *)(a2 + 1728);
  v41 = *(void **)(a1 + 1736);
  *(_QWORD *)(a1 + 1736) = *(_QWORD *)(a2 + 1736);

  v42 = *(_QWORD *)(a2 + 1752);
  *(_QWORD *)(a1 + 1744) = *(_QWORD *)(a2 + 1744);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 1752) = v42;
  v43 = *(void **)(a1 + 1760);
  *(_QWORD *)(a1 + 1760) = *(_QWORD *)(a2 + 1760);

  v44 = *(void **)(a1 + 1768);
  *(_QWORD *)(a1 + 1768) = *(_QWORD *)(a2 + 1768);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1776);
  *(_OWORD *)(a1 + 1776) = *(_OWORD *)(a2 + 1776);
  *(_OWORD *)(a1 + 1792) = *(_OWORD *)(a2 + 1792);
  *(_QWORD *)(a1 + 1808) = *(_QWORD *)(a2 + 1808);
  v45 = *(void **)(a1 + 1816);
  *(_QWORD *)(a1 + 1816) = *(_QWORD *)(a2 + 1816);

  __swift_destroy_boxed_opaque_existential_1(a1 + 1824);
  *(_OWORD *)(a1 + 1824) = *(_OWORD *)(a2 + 1824);
  *(_OWORD *)(a1 + 1840) = *(_OWORD *)(a2 + 1840);
  *(_QWORD *)(a1 + 1856) = *(_QWORD *)(a2 + 1856);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1864);
  v46 = *(_OWORD *)(a2 + 1880);
  *(_OWORD *)(a1 + 1864) = *(_OWORD *)(a2 + 1864);
  *(_OWORD *)(a1 + 1880) = v46;
  *(_QWORD *)(a1 + 1896) = *(_QWORD *)(a2 + 1896);
  *(_QWORD *)(a1 + 1904) = *(_QWORD *)(a2 + 1904);
  swift_release();
  v47 = *(void **)(a1 + 1912);
  *(_QWORD *)(a1 + 1912) = *(_QWORD *)(a2 + 1912);

  *(_QWORD *)(a1 + 1920) = *(_QWORD *)(a2 + 1920);
  swift_bridgeObjectRelease();
  v48 = *(void **)(a1 + 1928);
  *(_QWORD *)(a1 + 1928) = *(_QWORD *)(a2 + 1928);

  return a1;
}

uint64_t getEnumTagSinglePayload for Daemon(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 1936))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Daemon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 1928) = 0;
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
    *(_OWORD *)(result + 1912) = 0u;
    *(_OWORD *)(result + 1896) = 0u;
    *(_OWORD *)(result + 1880) = 0u;
    *(_OWORD *)(result + 1864) = 0u;
    *(_OWORD *)(result + 1848) = 0u;
    *(_OWORD *)(result + 1832) = 0u;
    *(_OWORD *)(result + 1816) = 0u;
    *(_OWORD *)(result + 1800) = 0u;
    *(_OWORD *)(result + 1784) = 0u;
    *(_OWORD *)(result + 1768) = 0u;
    *(_OWORD *)(result + 1752) = 0u;
    *(_OWORD *)(result + 1736) = 0u;
    *(_OWORD *)(result + 1720) = 0u;
    *(_OWORD *)(result + 1704) = 0u;
    *(_OWORD *)(result + 1688) = 0u;
    *(_OWORD *)(result + 1672) = 0u;
    *(_OWORD *)(result + 1656) = 0u;
    *(_OWORD *)(result + 1640) = 0u;
    *(_OWORD *)(result + 1624) = 0u;
    *(_OWORD *)(result + 1608) = 0u;
    *(_OWORD *)(result + 1592) = 0u;
    *(_OWORD *)(result + 1576) = 0u;
    *(_OWORD *)(result + 1560) = 0u;
    *(_OWORD *)(result + 1544) = 0u;
    *(_OWORD *)(result + 1528) = 0u;
    *(_OWORD *)(result + 1512) = 0u;
    *(_OWORD *)(result + 1496) = 0u;
    *(_OWORD *)(result + 1480) = 0u;
    *(_OWORD *)(result + 1464) = 0u;
    *(_OWORD *)(result + 1448) = 0u;
    *(_OWORD *)(result + 1432) = 0u;
    *(_OWORD *)(result + 1416) = 0u;
    *(_OWORD *)(result + 1400) = 0u;
    *(_OWORD *)(result + 1384) = 0u;
    *(_OWORD *)(result + 1368) = 0u;
    *(_OWORD *)(result + 1352) = 0u;
    *(_OWORD *)(result + 1336) = 0u;
    *(_OWORD *)(result + 1320) = 0u;
    *(_OWORD *)(result + 1304) = 0u;
    *(_OWORD *)(result + 1288) = 0u;
    *(_OWORD *)(result + 1272) = 0u;
    *(_OWORD *)(result + 1256) = 0u;
    *(_OWORD *)(result + 1240) = 0u;
    *(_OWORD *)(result + 1224) = 0u;
    *(_OWORD *)(result + 1208) = 0u;
    *(_OWORD *)(result + 1192) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 1936) = 1;
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
    *(_BYTE *)(result + 1936) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Daemon()
{
  return &type metadata for Daemon;
}

uint64_t sub_1CC3C2D64()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  return swift_deallocObject();
}

uint64_t sub_1CC3C2DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a1 == 0x6169726F67657267 && a2 == 0xE90000000000006ELL;
  if (v4 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EF8];
  }
  else if (a1 == 0x7473696864647562 && a2 == 0xE800000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EE8];
  }
  else if (a1 == 0x6573656E696863 && a2 == 0xE700000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EC8];
  }
  else if (a1 == 0x636974706F63 && a2 == 0xE600000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EB0];
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001CC3CF900 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EA0];
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001CC3CF920 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0E98];
  }
  else if (a1 == 0x776572626568 && a2 == 0xE600000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EB8];
  }
  else if (a1 == 0x313036386F7369 && a2 == 0xE700000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0ED8];
  }
  else if (a1 == 0x6E6169646E69 && a2 == 0xE600000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EC0];
  }
  else if (a1 == 0x63696D616C7369 && a2 == 0xE700000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0ED0];
  }
  else if (a1 == 0x4363696D616C7369 && a2 == 0xEC0000006C697669 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0E78];
  }
  else if (a1 == 0x6573656E6170616ALL && a2 == 0xE800000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EF0];
  }
  else if (a1 == 0x6E616973726570 && a2 == 0xE700000000000000 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0EE0];
  }
  else if (a1 == 0x63696C6275706572 && a2 == 0xEF616E696843664FLL || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0E88];
  }
  else if (a1 == 0x5463696D616C7369 && a2 == 0xEE0072616C756261 || (sub_1CC3C6804() & 1) != 0)
  {
    v7 = (unsigned int *)MEMORY[0x1E0CB0E80];
  }
  else
  {
    if ((a1 != 0xD000000000000010 || a2 != 0x80000001CC3CF940) && (sub_1CC3C6804() & 1) == 0)
    {
      v14 = sub_1CC3C58BC();
      v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
      v12 = a3;
      v13 = 1;
      return v11(v12, v13, 1, v14);
    }
    v7 = (unsigned int *)MEMORY[0x1E0CB0E90];
  }
  v8 = *v7;
  v9 = sub_1CC3C58BC();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 104))(a3, v8, v9);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v12 = a3;
  v13 = 0;
  v14 = v9;
  return v11(v12, v13, 1, v14);
}

ValueMetadata *type metadata accessor for NotificationConfigurationCoordinator()
{
  return &type metadata for NotificationConfigurationCoordinator;
}

uint64_t sub_1CC3C33F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return swift_task_switch();
}

uint64_t sub_1CC3C3408()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char v14;
  char v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD *, _QWORD);
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;

  v1 = v0 + 10;
  v2 = v0[17];
  v3 = MEMORY[0x1E0DEE9D8];
  v38 = MEMORY[0x1E0DEE9D8];
  v4 = *(_QWORD *)(v2 + 16);
  if (v4)
  {
    v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_1CC32F1E8(v5, (uint64_t)(v0 + 10));
      v6 = v0[13];
      v7 = v0[14];
      __swift_project_boxed_opaque_existential_1(v0 + 10, v6);
      v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 10));
      sub_1CC3C3B64(v8);
      v5 += 40;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v3 = v38;
  }
  v9 = sub_1CC3A93CC(v3);
  v0[18] = v9;
  swift_bridgeObjectRelease();
  v36 = v9 & 0xC000000000000001;
  if ((v9 & 0xC000000000000001) != 0)
    v10 = sub_1CC3C663C();
  else
    v10 = *(_QWORD *)(v9 + 16);
  v11 = MEMORY[0x1E0DEE9D8];
  if (!v10)
  {
LABEL_25:
    v0[19] = v11;
    v33 = (void *)v0[16];
    v0[7] = v0 + 15;
    v0[2] = v0;
    v0[3] = sub_1CC3C3798;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x1E0C809B0];
    v0[11] = 0x40000000;
    v0[12] = sub_1CC3C3890;
    v0[13] = &block_descriptor_23;
    objc_msgSend(v33, sel_getNotificationCategoriesWithCompletionHandler_, v1);
    return swift_continuation_await();
  }
  v37 = MEMORY[0x1E0DEE9D8];
  sub_1CC3B47E4(0, v10 & ~(v10 >> 63), 0);
  if (v36)
  {
    result = sub_1CC3C6600();
    v14 = 1;
  }
  else
  {
    result = sub_1CC3C46C8(v9);
    v14 = v15 & 1;
  }
  v39 = result;
  v40 = v13;
  v41 = v14;
  if ((v10 & 0x8000000000000000) == 0)
  {
    v34 = v0;
    v35 = v0 + 10;
    do
    {
      while (1)
      {
        v21 = v9;
        sub_1CC3C4480(v39, v40, v41, v9);
        v23 = v22;
        v24 = objc_msgSend(v22, sel_identifier);
        v25 = sub_1CC3C62C4();
        v27 = v26;

        v28 = v37;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = sub_1CC3B47E4(0, *(_QWORD *)(v37 + 16) + 1, 1);
          v28 = v37;
        }
        v30 = *(_QWORD *)(v28 + 16);
        v29 = *(_QWORD *)(v28 + 24);
        if (v30 >= v29 >> 1)
        {
          result = sub_1CC3B47E4(v29 > 1, v30 + 1, 1);
          v28 = v37;
        }
        *(_QWORD *)(v28 + 16) = v30 + 1;
        v31 = v28 + 16 * v30;
        *(_QWORD *)(v31 + 32) = v25;
        *(_QWORD *)(v31 + 40) = v27;
        if (v36)
          break;
        v9 = v21;
        v16 = sub_1CC3C439C(v39, v40, v41, v21);
        v18 = v17;
        v20 = v19;
        sub_1CC3C4750(v39, v40, v41);
        v39 = v16;
        v40 = v18;
        v41 = v20 & 1;
        v0 = v34;
        v1 = v35;
        if (!--v10)
          goto LABEL_24;
      }
      if ((v41 & 1) == 0)
        goto LABEL_27;
      v9 = v21;
      if (sub_1CC3C6618())
        swift_isUniquelyReferenced_nonNull_native();
      v0 = v34;
      v1 = v35;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9C7F78);
      v32 = (void (*)(_QWORD *, _QWORD))sub_1CC3C6450();
      sub_1CC3C666C();
      v32(v35, 0);
      --v10;
    }
    while (v10);
LABEL_24:
    sub_1CC3C4750(v39, v40, v41);
    v11 = v37;
    goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1CC3C3798()
{
  return swift_task_switch();
}

uint64_t sub_1CC3C37E4()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void **)(v0 + 128);
  v3 = (void *)sub_1CC3C4BC8(*(_QWORD *)(v0 + 120), *(_QWORD **)(v0 + 152));
  swift_bridgeObjectRelease();
  sub_1CC3C38E8(v1, v3);
  sub_1CC3C4E90();
  sub_1CC3C4ECC();
  v4 = (void *)sub_1CC3C642C();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setNotificationCategories_, v4);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CC3C3890(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  sub_1CC3C4E90();
  sub_1CC3C4ECC();
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_1CC3C6438();
  return swift_continuation_resume();
}

void sub_1CC3C38E8(unint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  _QWORD *v17;
  id v18[7];

  v2 = a1;
  v18[1] = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_1CC3C660C();
    sub_1CC3C4E90();
    sub_1CC3C4ECC();
    sub_1CC3C645C();
    v2 = (unint64_t)v18[2];
    v17 = v18[3];
    v3 = (uint64_t)v18[4];
    v4 = v18[5];
    v5 = (unint64_t)v18[6];
  }
  else
  {
    v4 = 0;
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v17 = (_QWORD *)(a1 + 56);
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(a1 + 56);
  }
  v9 = (unint64_t)(v3 + 64) >> 6;
  if ((v2 & 0x8000000000000000) != 0)
    goto LABEL_10;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | ((_QWORD)v4 << 6);
      v12 = (char *)v4;
      goto LABEL_29;
    }
    v14 = (uint64_t)v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v14 >= v9)
      goto LABEL_32;
    v15 = v17[v14];
    v12 = (char *)v4 + 1;
    if (!v15)
    {
      v12 = (char *)v4 + 2;
      if ((uint64_t)v4 + 2 >= v9)
        goto LABEL_32;
      v15 = v17[(_QWORD)v12];
      if (!v15)
      {
        v12 = (char *)v4 + 3;
        if ((uint64_t)v4 + 3 >= v9)
          goto LABEL_32;
        v15 = v17[(_QWORD)v12];
        if (!v15)
        {
          v12 = (char *)v4 + 4;
          if ((uint64_t)v4 + 4 >= v9)
            goto LABEL_32;
          v15 = v17[(_QWORD)v12];
          if (!v15)
          {
            v12 = (char *)v4 + 5;
            if ((uint64_t)v4 + 5 >= v9)
              goto LABEL_32;
            v15 = v17[(_QWORD)v12];
            if (!v15)
            {
              v16 = (char *)v4 + 6;
              while ((char *)v9 != v16)
              {
                v15 = v17[(_QWORD)v16++];
                if (v15)
                {
                  v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_1CC3AA144();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v10 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + ((_QWORD)v12 << 6);
LABEL_29:
    v13 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v11);
    if (!v13)
      goto LABEL_32;
    while (1)
    {
      sub_1CC3A75B0(v18, v13);

      v4 = v12;
      v5 = v10;
      if ((v2 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_1CC3C6660())
      {
        sub_1CC3C4E90();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v13 = v18[0];
        swift_unknownObjectRelease();
        v12 = (char *)v4;
        v10 = v5;
        if (v13)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_1CC3C3B64(uint64_t result)
{
  int64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  int64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  int64_t v39;
  unint64_t v40;
  int64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  unint64_t v48;

  v4 = v2;
  v5 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    result = sub_1CC3C663C();
    v6 = result;
  }
  else
  {
    v6 = *(_QWORD *)(result + 16);
  }
  if ((unint64_t)*v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v20 = sub_1CC3C6774();
    result = swift_bridgeObjectRelease();
    v8 = v20 + v6;
    if (!__OFADD__(v20, v6))
      goto LABEL_6;
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v7 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v6;
  if (__OFADD__(v7, v6))
    goto LABEL_24;
LABEL_6:
  v9 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v9;
  v11 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v12 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v11 = 1;
  }
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_1CC3C6774();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v13 <= v8)
    v13 = v8;
  swift_bridgeObjectRetain();
  v14 = MEMORY[0x1D17AA188](v11, v13, 1, v9);
  swift_bridgeObjectRelease();
  *v4 = v14;
  v12 = v14 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (*(_QWORD *)(v12 + 24) >> 1) - v15;
  result = (uint64_t)sub_1CC3A8AA0(&v44, (_QWORD *)(v12 + 8 * v15 + 32), v16, v5);
  if (result < v6)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (result >= 1)
  {
    v17 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v18 = __OFADD__(v17, result);
    v19 = v17 + result;
    if (v18)
    {
      __break(1u);
LABEL_33:
      if (!sub_1CC3C6660())
        goto LABEL_21;
      sub_1CC3C4E90();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v24 = v43;
      swift_unknownObjectRelease();
      while (2)
      {
        if (!v24)
          goto LABEL_21;
        while (1)
        {
          v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          if (v3 + 1 > *(_QWORD *)(v26 + 0x18) >> 1)
          {
            sub_1CC3C6360();
            v26 = *v4 & 0xFFFFFFFFFFFFFF8;
          }
          v27 = *(_QWORD *)(v26 + 24) >> 1;
          if (v3 < v27)
            break;
LABEL_37:
          *(_QWORD *)(v26 + 16) = v3;
        }
        v28 = v26 + 32;
        while (1)
        {
          *(_QWORD *)(v28 + 8 * v3++) = v24;
          v29 = v47;
          if (v44 < 0)
          {
            if (!sub_1CC3C6660())
              goto LABEL_74;
            sub_1CC3C4E90();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            v24 = v43;
            swift_unknownObjectRelease();
            goto LABEL_49;
          }
          if (!v48)
            break;
          v30 = (v48 - 1) & v48;
          v31 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_45:
          v24 = *(void **)(*(_QWORD *)(v44 + 48) + 8 * v31);
          v32 = v24;
LABEL_46:
          v47 = v29;
          v48 = v30;
LABEL_49:
          if (!v24)
          {
LABEL_74:
            *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10) = v3;
            goto LABEL_21;
          }
          if (v3 >= v27)
          {
            v26 = *v4 & 0xFFFFFFFFFFFFFF8;
            goto LABEL_37;
          }
        }
        v33 = v47 + 1;
        if (__OFADD__(v47, 1))
        {
          __break(1u);
LABEL_98:
          v24 = 0;
          v22 = 0;
          v21 = v1;
LABEL_30:
          v47 = v21;
          v48 = v22;
          continue;
        }
        break;
      }
      v34 = (unint64_t)(v46 + 64) >> 6;
      if (v33 >= v34)
      {
        v24 = 0;
        v30 = 0;
        goto LABEL_46;
      }
      v35 = *(_QWORD *)(v45 + 8 * v33);
      if (!v35)
      {
        v36 = v47 + 2;
        if (v47 + 2 >= v34)
          goto LABEL_71;
        v35 = *(_QWORD *)(v45 + 8 * v36);
        if (!v35)
        {
          v1 = v47 + 3;
          if (v47 + 3 >= v34)
            goto LABEL_72;
          v35 = *(_QWORD *)(v45 + 8 * v1);
          if (v35)
          {
            v33 = v47 + 3;
            goto LABEL_55;
          }
          v36 = v47 + 4;
          if (v47 + 4 >= v34)
          {
            v24 = 0;
            v30 = 0;
            v29 = v47 + 3;
            goto LABEL_46;
          }
          v35 = *(_QWORD *)(v45 + 8 * v36);
          if (!v35)
          {
            v33 = v47 + 5;
            if (v47 + 5 >= v34)
            {
LABEL_72:
              v24 = 0;
              v30 = 0;
              v29 = v36;
              goto LABEL_46;
            }
            v35 = *(_QWORD *)(v45 + 8 * v33);
            if (!v35)
            {
              v33 = v34 - 1;
              v37 = v47 + 6;
              while (v34 != v37)
              {
                v35 = *(_QWORD *)(v45 + 8 * v37++);
                if (v35)
                {
                  v33 = v37 - 1;
                  goto LABEL_55;
                }
              }
LABEL_71:
              v24 = 0;
              v30 = 0;
              v29 = v33;
              goto LABEL_46;
            }
            goto LABEL_55;
          }
        }
        v33 = v36;
      }
LABEL_55:
      v30 = (v35 - 1) & v35;
      v31 = __clz(__rbit64(v35)) + (v33 << 6);
      v29 = v33;
      goto LABEL_45;
    }
    *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
  }
  if (result != v16)
  {
LABEL_21:
    sub_1CC3AA144();
    return sub_1CC3C6354();
  }
LABEL_26:
  v3 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v21 = v47;
  if (v44 < 0)
    goto LABEL_33;
  if (v48)
  {
    v22 = (v48 - 1) & v48;
    v23 = __clz(__rbit64(v48)) | (v47 << 6);
LABEL_29:
    v24 = *(void **)(*(_QWORD *)(v44 + 48) + 8 * v23);
    v25 = v24;
    goto LABEL_30;
  }
  v38 = v47 + 1;
  if (!__OFADD__(v47, 1))
  {
    v39 = (unint64_t)(v46 + 64) >> 6;
    if (v38 >= v39)
    {
      v24 = 0;
      v22 = 0;
      goto LABEL_30;
    }
    v40 = *(_QWORD *)(v45 + 8 * v38);
    if (v40)
      goto LABEL_79;
    v41 = v47 + 2;
    if (v47 + 2 >= v39)
    {
LABEL_95:
      v24 = 0;
      v22 = 0;
      v21 = v38;
      goto LABEL_30;
    }
    v40 = *(_QWORD *)(v45 + 8 * v41);
    if (v40)
      goto LABEL_83;
    v1 = v47 + 3;
    if (v47 + 3 < v39)
    {
      v40 = *(_QWORD *)(v45 + 8 * v1);
      if (v40)
      {
        v38 = v47 + 3;
        goto LABEL_79;
      }
      v41 = v47 + 4;
      if (v47 + 4 >= v39)
        goto LABEL_98;
      v40 = *(_QWORD *)(v45 + 8 * v41);
      if (v40)
      {
LABEL_83:
        v38 = v41;
LABEL_79:
        v22 = (v40 - 1) & v40;
        v23 = __clz(__rbit64(v40)) + (v38 << 6);
        v21 = v38;
        goto LABEL_29;
      }
      v38 = v47 + 5;
      if (v47 + 5 < v39)
      {
        v40 = *(_QWORD *)(v45 + 8 * v38);
        if (!v40)
        {
          v38 = v39 - 1;
          v42 = v47 + 6;
          do
          {
            if (v39 == v42)
              goto LABEL_95;
            v40 = *(_QWORD *)(v45 + 8 * v42++);
          }
          while (!v40);
          v38 = v42 - 1;
        }
        goto LABEL_79;
      }
    }
    v24 = 0;
    v22 = 0;
    v21 = v41;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CC3C4140(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89ECA8);
  result = sub_1CC3C66C0();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = sub_1CC3C6570();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

int64_t sub_1CC3C439C(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_1CC3C4480(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_1CC3C6624() == *(_DWORD *)(a4 + 36))
      {
        sub_1CC3C6630();
        sub_1CC3C4E90();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_1CC3C6570();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_1CC3C657C();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_1CC3C657C();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x1D17AA0D4](a1, a2, v7);
  sub_1CC3C4E90();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_1CC3C46C8(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_1CC3C4750(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1CC3C475C(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v25;
  unint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  int64_t v34;

  v4 = 0;
  v29 = 0;
  v30 = a3 + 56;
  v5 = 1 << *(_BYTE *)(a3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a3 + 56);
  v31 = (unint64_t)(v5 + 63) >> 6;
  v27 = (unint64_t *)result;
  v28 = a4 + 7;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        v8 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v34 = v4;
        v9 = v8 | (v4 << 6);
      }
      else
      {
        v10 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_41;
        if (v10 >= v31)
          goto LABEL_39;
        v11 = *(_QWORD *)(v30 + 8 * v10);
        v12 = v4 + 1;
        if (!v11)
        {
          v12 = v4 + 2;
          if (v4 + 2 >= v31)
            goto LABEL_39;
          v11 = *(_QWORD *)(v30 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 3;
            if (v4 + 3 >= v31)
              goto LABEL_39;
            v11 = *(_QWORD *)(v30 + 8 * v12);
            if (!v11)
            {
              v13 = v4 + 4;
              if (v4 + 4 >= v31)
                goto LABEL_39;
              v11 = *(_QWORD *)(v30 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  v12 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_42;
                  if (v12 >= v31)
                    goto LABEL_39;
                  v11 = *(_QWORD *)(v30 + 8 * v12);
                  ++v13;
                  if (v11)
                    goto LABEL_20;
                }
              }
              v12 = v4 + 4;
            }
          }
        }
LABEL_20:
        v7 = (v11 - 1) & v11;
        v34 = v12;
        v9 = __clz(__rbit64(v11)) + (v12 << 6);
      }
      v14 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v9);
      v15 = objc_msgSend(v14, sel_identifier);
      v16 = sub_1CC3C62C4();
      v18 = v17;

      v19 = a4[2];
      if (v19)
        break;
LABEL_36:

      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v27 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
      v25 = __OFADD__(v29++, 1);
      v4 = v34;
      if (v25)
      {
        __break(1u);
LABEL_39:
        swift_retain();
        return sub_1CC3C4140(v27, a2, v29, a3);
      }
    }
    if (a4[4] != v16 || a4[5] != v18)
    {
      result = sub_1CC3C6804();
      if ((result & 1) == 0)
        break;
    }
LABEL_4:

    result = swift_bridgeObjectRelease();
    v4 = v34;
  }
  if (v19 == 1)
    goto LABEL_36;
  v21 = v28;
  v22 = 1;
  while (1)
  {
    v23 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (*(v21 - 1) == v16 && *v21 == v18)
      goto LABEL_4;
    result = sub_1CC3C6804();
    if ((result & 1) != 0)
      goto LABEL_4;
    v21 += 2;
    ++v22;
    if (v23 == v19)
      goto LABEL_36;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1CC3C4A04(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    v10 = sub_1CC3C475C((uint64_t)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_release();
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    v10 = sub_1CC3C475C((uint64_t)v11, v7, a1, a2);
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x1D17AAAC4](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_1CC3C4BC8(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  uint64_t v27;

  if ((a1 & 0xC000000000000001) == 0)
    return sub_1CC3C4A04(a1, a2);
  v3 = MEMORY[0x1E0DEE9E8];
  v27 = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRetain();
  sub_1CC3C660C();
  if (!sub_1CC3C6660())
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_release();
    return v3;
  }
  sub_1CC3C4E90();
  while (1)
  {
    swift_dynamicCast();
    v4 = objc_msgSend(v26, sel_identifier);
    v5 = sub_1CC3C62C4();
    v7 = v6;

    v8 = a2[2];
    if (!v8)
      goto LABEL_21;
    if (a2[4] != v5 || a2[5] != v7)
    {
      result = sub_1CC3C6804();
      if ((result & 1) == 0)
        break;
    }
LABEL_4:
    swift_bridgeObjectRelease();

LABEL_5:
    if (!sub_1CC3C6660())
    {
      v3 = v27;
      goto LABEL_36;
    }
  }
  if (v8 == 1)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    v15 = v27;
    v16 = *(_QWORD *)(v27 + 16);
    if (*(_QWORD *)(v27 + 24) <= v16)
    {
      sub_1CC3A7A94(v16 + 1);
      v15 = v27;
    }
    result = sub_1CC3C6570();
    v17 = v15 + 56;
    v18 = -1 << *(_BYTE *)(v15 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v15 + 56 + 8 * (v19 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v15 + 56 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_37;
        }
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v17 + 8 * v20);
      }
      while (v25 == -1);
      v21 = __clz(__rbit64(~v25)) + (v20 << 6);
    }
    *(_QWORD *)(v17 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_QWORD *)(*(_QWORD *)(v15 + 48) + 8 * v21) = v26;
    ++*(_QWORD *)(v15 + 16);
    goto LABEL_5;
  }
  v11 = a2 + 7;
  v12 = 1;
  while (1)
  {
    v13 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (*(v11 - 1) == v5 && *v11 == v7)
      goto LABEL_4;
    result = sub_1CC3C6804();
    if ((result & 1) != 0)
      goto LABEL_4;
    v11 += 2;
    ++v12;
    if (v13 == v8)
      goto LABEL_21;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1CC3C4E90()
{
  unint64_t result;

  result = qword_1ED8A08B8;
  if (!qword_1ED8A08B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED8A08B8);
  }
  return result;
}

unint64_t sub_1CC3C4ECC()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1ED8A08C0;
  if (!qword_1ED8A08C0)
  {
    v1 = sub_1CC3C4E90();
    result = MEMORY[0x1D17AAA04](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED8A08C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WalkSuggestionError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1CC3C4F54 + 4 * byte_1CC3CB220[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CC3C4F74 + 4 * byte_1CC3CB225[v4]))();
}

_BYTE *sub_1CC3C4F54(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CC3C4F74(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CC3C4F7C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CC3C4F84(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CC3C4F8C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CC3C4F94(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WalkSuggestionError()
{
  return &type metadata for WalkSuggestionError;
}

unint64_t sub_1CC3C4FB4()
{
  unint64_t result;

  result = qword_1EF9C7F80;
  if (!qword_1EF9C7F80)
  {
    result = MEMORY[0x1D17AAA04](&unk_1CC3CB2A4, &type metadata for WalkSuggestionError);
    atomic_store(result, (unint64_t *)&qword_1EF9C7F80);
  }
  return result;
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  BOOL v6;

  if (qword_1EF9CA0A0 == -1)
  {
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1EF9CA0A0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  if (v6)
    return 0;
  if (dword_1EF9CA094 > a2)
    return 1;
  return dword_1EF9CA094 >= a2 && dword_1EF9CA098 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_1EF9CA0A8 == -1)
  {
    if (qword_1EF9CA0B0)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_1EF9CA0A8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1EF9CA0B0)
      return _availability_version_check();
  }
  if (qword_1EF9CA0A0 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1EF9CA0A0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_1EF9CA094 > a3)
    return 1;
  return dword_1EF9CA094 >= a3 && dword_1EF9CA098 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t (*v1)(void);
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (uint64_t (*)(void))qword_1EF9CA0B0;
  if (qword_1EF9CA0B0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x1E0C80CC0])
    {
      qword_1EF9CA0B0 = (uint64_t)MEMORY[0x1E0C80CC0];
      v1 = MEMORY[0x1E0C80CC0];
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = MEMORY[0x1D17AA50C](v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1EF9CA094, &dword_1EF9CA098);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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

uint64_t sub_1CC3C5640()
{
  return MEMORY[0x1E0CAE568]();
}

uint64_t sub_1CC3C564C()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t sub_1CC3C5658()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1CC3C5664()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1CC3C5670()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1CC3C567C()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1CC3C5688()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1CC3C5694()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1CC3C56A0()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1CC3C56AC()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1CC3C56B8()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1CC3C56C4()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1CC3C56D0()
{
  return MEMORY[0x1E0CAEA00]();
}

uint64_t sub_1CC3C56DC()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1CC3C56E8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CC3C56F4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CC3C5700()
{
  return MEMORY[0x1E0D8D758]();
}

uint64_t sub_1CC3C570C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1CC3C5718()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1CC3C5724()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1CC3C5730()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CC3C573C()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1CC3C5748()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CC3C5754()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CC3C5760()
{
  return MEMORY[0x1E0CB0240]();
}

uint64_t sub_1CC3C576C()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1CC3C5778()
{
  return MEMORY[0x1E0D217B8]();
}

uint64_t sub_1CC3C5784()
{
  return MEMORY[0x1E0D217C0]();
}

uint64_t sub_1CC3C5790()
{
  return MEMORY[0x1E0D217C8]();
}

uint64_t sub_1CC3C579C()
{
  return MEMORY[0x1E0D217D0]();
}

uint64_t sub_1CC3C57A8()
{
  return MEMORY[0x1E0D217D8]();
}

uint64_t sub_1CC3C57B4()
{
  return MEMORY[0x1E0D217E0]();
}

uint64_t sub_1CC3C57C0()
{
  return MEMORY[0x1E0D217E8]();
}

uint64_t sub_1CC3C57CC()
{
  return MEMORY[0x1E0D217F0]();
}

uint64_t sub_1CC3C57D8()
{
  return MEMORY[0x1E0D217F8]();
}

uint64_t sub_1CC3C57E4()
{
  return MEMORY[0x1E0D21800]();
}

uint64_t sub_1CC3C57F0()
{
  return MEMORY[0x1E0D21808]();
}

uint64_t sub_1CC3C57FC()
{
  return MEMORY[0x1E0D21810]();
}

uint64_t sub_1CC3C5808()
{
  return MEMORY[0x1E0D21818]();
}

uint64_t sub_1CC3C5814()
{
  return MEMORY[0x1E0D21820]();
}

uint64_t sub_1CC3C5820()
{
  return MEMORY[0x1E0D21828]();
}

uint64_t sub_1CC3C582C()
{
  return MEMORY[0x1E0D21830]();
}

uint64_t sub_1CC3C5838()
{
  return MEMORY[0x1E0D21838]();
}

uint64_t sub_1CC3C5844()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1CC3C5850()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1CC3C585C()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1CC3C5868()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1CC3C5874()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1CC3C5880()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1CC3C588C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CC3C5898()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CC3C58A4()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1CC3C58B0()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CC3C58BC()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1CC3C58C8()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1CC3C58D4()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1CC3C58E0()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1CC3C58EC()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_1CC3C58F8()
{
  return MEMORY[0x1E0CB1050]();
}

uint64_t sub_1CC3C5904()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1CC3C5910()
{
  return MEMORY[0x1E0CB1098]();
}

uint64_t sub_1CC3C591C()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1CC3C5928()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1CC3C5934()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1CC3C5940()
{
  return MEMORY[0x1E0D91AC8]();
}

uint64_t sub_1CC3C594C()
{
  return MEMORY[0x1E0D920D0]();
}

uint64_t sub_1CC3C5958()
{
  return MEMORY[0x1E0D930F8]();
}

uint64_t sub_1CC3C5964()
{
  return MEMORY[0x1E0D93108]();
}

uint64_t sub_1CC3C5970()
{
  return MEMORY[0x1E0D93128]();
}

uint64_t sub_1CC3C597C()
{
  return MEMORY[0x1E0D932A8]();
}

uint64_t sub_1CC3C5988()
{
  return MEMORY[0x1E0D94FF8]();
}

uint64_t sub_1CC3C5994()
{
  return MEMORY[0x1E0D95010]();
}

uint64_t sub_1CC3C59A0()
{
  return MEMORY[0x1E0D95028]();
}

uint64_t sub_1CC3C59AC()
{
  return MEMORY[0x1E0D96050]();
}

uint64_t sub_1CC3C59B8()
{
  return MEMORY[0x1E0D96078]();
}

uint64_t sub_1CC3C59C4()
{
  return MEMORY[0x1E0D960E0]();
}

uint64_t sub_1CC3C59D0()
{
  return MEMORY[0x1E0D96118]();
}

uint64_t sub_1CC3C59DC()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1CC3C59E8()
{
  return MEMORY[0x1E0D28F68]();
}

uint64_t sub_1CC3C59F4()
{
  return MEMORY[0x1E0D28F80]();
}

uint64_t sub_1CC3C5A00()
{
  return MEMORY[0x1E0D28F88]();
}

uint64_t sub_1CC3C5A0C()
{
  return MEMORY[0x1E0D28F98]();
}

uint64_t sub_1CC3C5A18()
{
  return MEMORY[0x1E0D29010]();
}

uint64_t sub_1CC3C5A24()
{
  return MEMORY[0x1E0D29020]();
}

uint64_t sub_1CC3C5A30()
{
  return MEMORY[0x1E0D29028]();
}

uint64_t sub_1CC3C5A3C()
{
  return MEMORY[0x1E0D29030]();
}

uint64_t sub_1CC3C5A48()
{
  return MEMORY[0x1E0D290D8]();
}

uint64_t sub_1CC3C5A54()
{
  return MEMORY[0x1E0D290E0]();
}

uint64_t sub_1CC3C5A60()
{
  return MEMORY[0x1E0D290E8]();
}

uint64_t sub_1CC3C5A6C()
{
  return MEMORY[0x1E0D290F8]();
}

uint64_t sub_1CC3C5A78()
{
  return MEMORY[0x1E0D29100]();
}

uint64_t sub_1CC3C5A84()
{
  return MEMORY[0x1E0D29108]();
}

uint64_t sub_1CC3C5A90()
{
  return MEMORY[0x1E0D29110]();
}

uint64_t sub_1CC3C5A9C()
{
  return MEMORY[0x1E0D29140]();
}

uint64_t sub_1CC3C5AA8()
{
  return MEMORY[0x1E0D29150]();
}

uint64_t sub_1CC3C5AB4()
{
  return MEMORY[0x1E0D29158]();
}

uint64_t sub_1CC3C5AC0()
{
  return MEMORY[0x1E0D8D9B8]();
}

uint64_t sub_1CC3C5ACC()
{
  return MEMORY[0x1E0D8D9C8]();
}

uint64_t sub_1CC3C5AD8()
{
  return MEMORY[0x1E0D8D9D8]();
}

uint64_t sub_1CC3C5AE4()
{
  return MEMORY[0x1E0D8DA00]();
}

uint64_t sub_1CC3C5AF0()
{
  return MEMORY[0x1E0D8DA08]();
}

uint64_t sub_1CC3C5AFC()
{
  return MEMORY[0x1E0D8DA10]();
}

uint64_t sub_1CC3C5B08()
{
  return MEMORY[0x1E0D8DA50]();
}

uint64_t sub_1CC3C5B14()
{
  return MEMORY[0x1E0D8DA60]();
}

uint64_t sub_1CC3C5B20()
{
  return MEMORY[0x1E0D8DA68]();
}

uint64_t sub_1CC3C5B2C()
{
  return MEMORY[0x1E0D8EF40]();
}

uint64_t sub_1CC3C5B38()
{
  return MEMORY[0x1E0D8EF48]();
}

uint64_t sub_1CC3C5B44()
{
  return MEMORY[0x1E0D8EF58]();
}

uint64_t sub_1CC3C5B50()
{
  return MEMORY[0x1E0D8F608]();
}

uint64_t sub_1CC3C5B5C()
{
  return MEMORY[0x1E0D8F7E0]();
}

uint64_t sub_1CC3C5B68()
{
  return MEMORY[0x1E0D8F800]();
}

uint64_t sub_1CC3C5B74()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1CC3C5B80()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1CC3C5B8C()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1CC3C5B98()
{
  return MEMORY[0x1E0D21848]();
}

uint64_t sub_1CC3C5BA4()
{
  return MEMORY[0x1E0D21850]();
}

uint64_t sub_1CC3C5BB0()
{
  return MEMORY[0x1E0D21860]();
}

uint64_t sub_1CC3C5BBC()
{
  return MEMORY[0x1E0D21868]();
}

uint64_t sub_1CC3C5BC8()
{
  return MEMORY[0x1E0D21880]();
}

uint64_t sub_1CC3C5BD4()
{
  return MEMORY[0x1E0D21888]();
}

uint64_t sub_1CC3C5BE0()
{
  return MEMORY[0x1E0D21890]();
}

uint64_t sub_1CC3C5BEC()
{
  return MEMORY[0x1E0D218A8]();
}

uint64_t sub_1CC3C5BF8()
{
  return MEMORY[0x1E0D218B0]();
}

uint64_t sub_1CC3C5C04()
{
  return MEMORY[0x1E0D218B8]();
}

uint64_t sub_1CC3C5C10()
{
  return MEMORY[0x1E0D218C0]();
}

uint64_t sub_1CC3C5C1C()
{
  return MEMORY[0x1E0D218E0]();
}

uint64_t sub_1CC3C5C28()
{
  return MEMORY[0x1E0D218E8]();
}

uint64_t sub_1CC3C5C34()
{
  return MEMORY[0x1E0D218F8]();
}

uint64_t sub_1CC3C5C40()
{
  return MEMORY[0x1E0D21900]();
}

uint64_t sub_1CC3C5C4C()
{
  return MEMORY[0x1E0D21910]();
}

uint64_t sub_1CC3C5C58()
{
  return MEMORY[0x1E0D21918]();
}

uint64_t sub_1CC3C5C64()
{
  return MEMORY[0x1E0D21928]();
}

uint64_t sub_1CC3C5C70()
{
  return MEMORY[0x1E0D21930]();
}

uint64_t sub_1CC3C5C7C()
{
  return MEMORY[0x1E0D21940]();
}

uint64_t sub_1CC3C5C88()
{
  return MEMORY[0x1E0D21950]();
}

uint64_t sub_1CC3C5C94()
{
  return MEMORY[0x1E0D219F0]();
}

uint64_t sub_1CC3C5CA0()
{
  return MEMORY[0x1E0D21A08]();
}

uint64_t sub_1CC3C5CAC()
{
  return MEMORY[0x1E0D21A10]();
}

uint64_t sub_1CC3C5CB8()
{
  return MEMORY[0x1E0D21A20]();
}

uint64_t sub_1CC3C5CC4()
{
  return MEMORY[0x1E0D21A58]();
}

uint64_t sub_1CC3C5CD0()
{
  return MEMORY[0x1E0D21A98]();
}

uint64_t sub_1CC3C5CDC()
{
  return MEMORY[0x1E0D21AA0]();
}

uint64_t sub_1CC3C5CE8()
{
  return MEMORY[0x1E0D21AB0]();
}

uint64_t sub_1CC3C5CF4()
{
  return MEMORY[0x1E0D21AC0]();
}

uint64_t sub_1CC3C5D00()
{
  return MEMORY[0x1E0D21AD0]();
}

uint64_t sub_1CC3C5D0C()
{
  return MEMORY[0x1E0D21AE0]();
}

uint64_t sub_1CC3C5D18()
{
  return MEMORY[0x1E0D21AF0]();
}

uint64_t sub_1CC3C5D24()
{
  return MEMORY[0x1E0D21AF8]();
}

uint64_t sub_1CC3C5D30()
{
  return MEMORY[0x1E0D21B00]();
}

uint64_t sub_1CC3C5D3C()
{
  return MEMORY[0x1E0D21B08]();
}

uint64_t sub_1CC3C5D48()
{
  return MEMORY[0x1E0D21B18]();
}

uint64_t sub_1CC3C5D54()
{
  return MEMORY[0x1E0D21B20]();
}

uint64_t sub_1CC3C5D60()
{
  return MEMORY[0x1E0D21B38]();
}

uint64_t sub_1CC3C5D6C()
{
  return MEMORY[0x1E0D21B40]();
}

uint64_t sub_1CC3C5D78()
{
  return MEMORY[0x1E0D21B48]();
}

uint64_t sub_1CC3C5D84()
{
  return MEMORY[0x1E0D21B50]();
}

uint64_t sub_1CC3C5D90()
{
  return MEMORY[0x1E0D21B58]();
}

uint64_t sub_1CC3C5D9C()
{
  return MEMORY[0x1E0D21B78]();
}

uint64_t sub_1CC3C5DA8()
{
  return MEMORY[0x1E0D21B80]();
}

uint64_t sub_1CC3C5DB4()
{
  return MEMORY[0x1E0D21B90]();
}

uint64_t sub_1CC3C5DC0()
{
  return MEMORY[0x1E0D21B98]();
}

uint64_t sub_1CC3C5DCC()
{
  return MEMORY[0x1E0D21BA0]();
}

uint64_t sub_1CC3C5DD8()
{
  return MEMORY[0x1E0D21BB0]();
}

uint64_t sub_1CC3C5DE4()
{
  return MEMORY[0x1E0D21BC0]();
}

uint64_t sub_1CC3C5DF0()
{
  return MEMORY[0x1E0D21BD0]();
}

uint64_t sub_1CC3C5DFC()
{
  return MEMORY[0x1E0D21BE0]();
}

uint64_t sub_1CC3C5E08()
{
  return MEMORY[0x1E0D21BF0]();
}

uint64_t sub_1CC3C5E14()
{
  return MEMORY[0x1E0D21BF8]();
}

uint64_t sub_1CC3C5E20()
{
  return MEMORY[0x1E0D21C08]();
}

uint64_t sub_1CC3C5E2C()
{
  return MEMORY[0x1E0D21C18]();
}

uint64_t sub_1CC3C5E38()
{
  return MEMORY[0x1E0D21C28]();
}

uint64_t sub_1CC3C5E44()
{
  return MEMORY[0x1E0D21C40]();
}

uint64_t sub_1CC3C5E50()
{
  return MEMORY[0x1E0D21C48]();
}

uint64_t sub_1CC3C5E5C()
{
  return MEMORY[0x1E0D21C50]();
}

uint64_t sub_1CC3C5E68()
{
  return MEMORY[0x1E0D21C58]();
}

uint64_t sub_1CC3C5E74()
{
  return MEMORY[0x1E0D21C80]();
}

uint64_t sub_1CC3C5E80()
{
  return MEMORY[0x1E0D21C88]();
}

uint64_t sub_1CC3C5E8C()
{
  return MEMORY[0x1E0D21C90]();
}

uint64_t sub_1CC3C5E98()
{
  return MEMORY[0x1E0D21C98]();
}

uint64_t sub_1CC3C5EA4()
{
  return MEMORY[0x1E0D21CA0]();
}

uint64_t sub_1CC3C5EB0()
{
  return MEMORY[0x1E0D21CC0]();
}

uint64_t sub_1CC3C5EBC()
{
  return MEMORY[0x1E0D21CD0]();
}

uint64_t sub_1CC3C5EC8()
{
  return MEMORY[0x1E0D21CD8]();
}

uint64_t sub_1CC3C5ED4()
{
  return MEMORY[0x1E0D21CE0]();
}

uint64_t sub_1CC3C5EE0()
{
  return MEMORY[0x1E0D21CF8]();
}

uint64_t sub_1CC3C5EEC()
{
  return MEMORY[0x1E0D21D00]();
}

uint64_t sub_1CC3C5EF8()
{
  return MEMORY[0x1E0D21D10]();
}

uint64_t sub_1CC3C5F04()
{
  return MEMORY[0x1E0D21D20]();
}

uint64_t sub_1CC3C5F10()
{
  return MEMORY[0x1E0D21D28]();
}

uint64_t sub_1CC3C5F1C()
{
  return MEMORY[0x1E0D21D38]();
}

uint64_t sub_1CC3C5F28()
{
  return MEMORY[0x1E0D21D48]();
}

uint64_t sub_1CC3C5F34()
{
  return MEMORY[0x1E0D21D58]();
}

uint64_t sub_1CC3C5F40()
{
  return MEMORY[0x1E0D21D68]();
}

uint64_t sub_1CC3C5F4C()
{
  return MEMORY[0x1E0D21D70]();
}

uint64_t sub_1CC3C5F58()
{
  return MEMORY[0x1E0D21D78]();
}

uint64_t sub_1CC3C5F64()
{
  return MEMORY[0x1E0D21D80]();
}

uint64_t sub_1CC3C5F70()
{
  return MEMORY[0x1E0D21D88]();
}

uint64_t sub_1CC3C5F7C()
{
  return MEMORY[0x1E0D21D98]();
}

uint64_t sub_1CC3C5F88()
{
  return MEMORY[0x1E0D21DA0]();
}

uint64_t sub_1CC3C5F94()
{
  return MEMORY[0x1E0D21DC0]();
}

uint64_t sub_1CC3C5FA0()
{
  return MEMORY[0x1E0D21DC8]();
}

uint64_t sub_1CC3C5FAC()
{
  return MEMORY[0x1E0D21DD0]();
}

uint64_t sub_1CC3C5FB8()
{
  return MEMORY[0x1E0D21DD8]();
}

uint64_t sub_1CC3C5FC4()
{
  return MEMORY[0x1E0D21DE0]();
}

uint64_t sub_1CC3C5FD0()
{
  return MEMORY[0x1E0D21DE8]();
}

uint64_t sub_1CC3C5FDC()
{
  return MEMORY[0x1E0D21DF0]();
}

uint64_t sub_1CC3C5FE8()
{
  return MEMORY[0x1E0D21E00]();
}

uint64_t sub_1CC3C5FF4()
{
  return MEMORY[0x1E0D21E20]();
}

uint64_t sub_1CC3C6000()
{
  return MEMORY[0x1E0D21E38]();
}

uint64_t sub_1CC3C600C()
{
  return MEMORY[0x1E0D21E48]();
}

uint64_t sub_1CC3C6018()
{
  return MEMORY[0x1E0D21E50]();
}

uint64_t sub_1CC3C6024()
{
  return MEMORY[0x1E0D21E58]();
}

uint64_t sub_1CC3C6030()
{
  return MEMORY[0x1E0D21E60]();
}

uint64_t sub_1CC3C603C()
{
  return MEMORY[0x1E0D21E68]();
}

uint64_t sub_1CC3C6048()
{
  return MEMORY[0x1E0D21E70]();
}

uint64_t sub_1CC3C6054()
{
  return MEMORY[0x1E0D21E78]();
}

uint64_t sub_1CC3C6060()
{
  return MEMORY[0x1E0D21E80]();
}

uint64_t sub_1CC3C606C()
{
  return MEMORY[0x1E0D21E88]();
}

uint64_t sub_1CC3C6078()
{
  return MEMORY[0x1E0D21E90]();
}

uint64_t sub_1CC3C6084()
{
  return MEMORY[0x1E0D21E98]();
}

uint64_t sub_1CC3C6090()
{
  return MEMORY[0x1E0D21EA0]();
}

uint64_t sub_1CC3C609C()
{
  return MEMORY[0x1E0D21EA8]();
}

uint64_t sub_1CC3C60A8()
{
  return MEMORY[0x1E0D21EB0]();
}

uint64_t sub_1CC3C60B4()
{
  return MEMORY[0x1E0D21EB8]();
}

uint64_t sub_1CC3C60C0()
{
  return MEMORY[0x1E0D21EC0]();
}

uint64_t sub_1CC3C60CC()
{
  return MEMORY[0x1E0D21ED0]();
}

uint64_t sub_1CC3C60D8()
{
  return MEMORY[0x1E0D21ED8]();
}

uint64_t sub_1CC3C60E4()
{
  return MEMORY[0x1E0D21EE0]();
}

uint64_t sub_1CC3C60F0()
{
  return MEMORY[0x1E0D21EE8]();
}

uint64_t sub_1CC3C60FC()
{
  return MEMORY[0x1E0D21F00]();
}

uint64_t sub_1CC3C6108()
{
  return MEMORY[0x1E0D21F08]();
}

uint64_t sub_1CC3C6114()
{
  return MEMORY[0x1E0D21F10]();
}

uint64_t sub_1CC3C6120()
{
  return MEMORY[0x1E0D21F20]();
}

uint64_t sub_1CC3C612C()
{
  return MEMORY[0x1E0D291C8]();
}

uint64_t sub_1CC3C6138()
{
  return MEMORY[0x1E0CF5188]();
}

uint64_t sub_1CC3C6144()
{
  return MEMORY[0x1E0CF5190]();
}

uint64_t sub_1CC3C6150()
{
  return MEMORY[0x1E0CF51A0]();
}

uint64_t sub_1CC3C615C()
{
  return MEMORY[0x1E0CF51A8]();
}

uint64_t sub_1CC3C6168()
{
  return MEMORY[0x1E0CF51E0]();
}

uint64_t sub_1CC3C6174()
{
  return MEMORY[0x1E0CF51E8]();
}

uint64_t sub_1CC3C6180()
{
  return MEMORY[0x1E0DF0190]();
}

uint64_t sub_1CC3C618C()
{
  return MEMORY[0x1E0DF0298]();
}

uint64_t sub_1CC3C6198()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1CC3C61A4()
{
  return MEMORY[0x1E0D21F28]();
}

uint64_t sub_1CC3C61B0()
{
  return MEMORY[0x1E0D21F30]();
}

uint64_t sub_1CC3C61BC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CC3C61C8()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CC3C61D4()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_1CC3C61E0()
{
  return MEMORY[0x1E0CB4448]();
}

uint64_t sub_1CC3C61EC()
{
  return MEMORY[0x1E0CB4450]();
}

uint64_t sub_1CC3C61F8()
{
  return MEMORY[0x1E0CB4458]();
}

uint64_t sub_1CC3C6204()
{
  return MEMORY[0x1E0CB4468]();
}

uint64_t sub_1CC3C6210()
{
  return MEMORY[0x1E0CB4470]();
}

uint64_t sub_1CC3C621C()
{
  return MEMORY[0x1E0CB4478]();
}

uint64_t sub_1CC3C6228()
{
  return MEMORY[0x1E0CB44C0]();
}

uint64_t sub_1CC3C6234()
{
  return MEMORY[0x1E0CB44E0]();
}

uint64_t sub_1CC3C6240()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CC3C624C()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1CC3C6258()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CC3C6264()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1CC3C6270()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CC3C627C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1CC3C6288()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1CC3C6294()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1CC3C62A0()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1CC3C62AC()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CC3C62B8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CC3C62C4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CC3C62D0()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1CC3C62DC()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1CC3C62E8()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CC3C62F4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CC3C6300()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1CC3C630C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CC3C6318()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1CC3C6324()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CC3C6330()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CC3C633C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CC3C6348()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CC3C6354()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CC3C6360()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CC3C636C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CC3C6378()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CC3C6384()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CC3C6390()
{
  return MEMORY[0x1E0DF05C0]();
}

uint64_t sub_1CC3C639C()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1CC3C63A8()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1CC3C63B4()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1CC3C63C0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CC3C63CC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CC3C63D8()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1CC3C63E4()
{
  return MEMORY[0x1E0DF0A88]();
}

uint64_t sub_1CC3C63F0()
{
  return MEMORY[0x1E0DF0A90]();
}

uint64_t sub_1CC3C63FC()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1CC3C6408()
{
  return MEMORY[0x1E0D21F48]();
}

uint64_t sub_1CC3C6414()
{
  return MEMORY[0x1E0D21F50]();
}

uint64_t sub_1CC3C6420()
{
  return MEMORY[0x1E0D21F58]();
}

uint64_t sub_1CC3C642C()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1CC3C6438()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1CC3C6444()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1CC3C6450()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1CC3C645C()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1CC3C6468()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1CC3C6474()
{
  return MEMORY[0x1E0D21F70]();
}

uint64_t sub_1CC3C6480()
{
  return MEMORY[0x1E0CB1CA0]();
}

uint64_t sub_1CC3C648C()
{
  return MEMORY[0x1E0CB1CB0]();
}

uint64_t sub_1CC3C6498()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CC3C64A4()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1CC3C64B0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CC3C64BC()
{
  return MEMORY[0x1E0CB4540]();
}

uint64_t sub_1CC3C64C8()
{
  return MEMORY[0x1E0D21F78]();
}

uint64_t sub_1CC3C64D4()
{
  return MEMORY[0x1E0D21F80]();
}

uint64_t sub_1CC3C64E0()
{
  return MEMORY[0x1E0D21F88]();
}

uint64_t sub_1CC3C64EC()
{
  return MEMORY[0x1E0D21F90]();
}

uint64_t sub_1CC3C64F8()
{
  return MEMORY[0x1E0D21F98]();
}

uint64_t sub_1CC3C6504()
{
  return MEMORY[0x1E0D21FA0]();
}

uint64_t sub_1CC3C6510()
{
  return MEMORY[0x1E0D21FA8]();
}

uint64_t sub_1CC3C651C()
{
  return MEMORY[0x1E0D21FB0]();
}

uint64_t sub_1CC3C6528()
{
  return MEMORY[0x1E0D21FB8]();
}

uint64_t sub_1CC3C6534()
{
  return MEMORY[0x1E0D21FC0]();
}

uint64_t sub_1CC3C6540()
{
  return MEMORY[0x1E0D21FC8]();
}

uint64_t sub_1CC3C654C()
{
  return MEMORY[0x1E0CB1E70]();
}

uint64_t sub_1CC3C6558()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1CC3C6564()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1CC3C6570()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1CC3C657C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CC3C6588()
{
  return MEMORY[0x1E0D96918]();
}

uint64_t sub_1CC3C6594()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CC3C65A0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CC3C65AC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CC3C65B8()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1CC3C65C4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CC3C65D0()
{
  return MEMORY[0x1E0DEBFC0]();
}

uint64_t sub_1CC3C65DC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CC3C65E8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CC3C65F4()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1CC3C6600()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1CC3C660C()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1CC3C6618()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1CC3C6624()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1CC3C6630()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1CC3C663C()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1CC3C6648()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1CC3C6654()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1CC3C6660()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1CC3C666C()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1CC3C6678()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CC3C6684()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CC3C6690()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CC3C669C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1CC3C66A8()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1CC3C66B4()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1CC3C66C0()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1CC3C66CC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CC3C66D8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CC3C66E4()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1CC3C66F0()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1CC3C66FC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CC3C6708()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CC3C6714()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CC3C6720()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CC3C672C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CC3C6738()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CC3C6744()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CC3C6750()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CC3C675C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CC3C6768()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CC3C6774()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CC3C6780()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1CC3C678C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CC3C6798()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CC3C67A4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CC3C67B0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CC3C67BC()
{
  return MEMORY[0x1E0DF0CB8]();
}

uint64_t sub_1CC3C67C8()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CC3C67D4()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1CC3C67E0()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1CC3C67EC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CC3C67F8()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1CC3C6804()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CC3C6810()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1CC3C681C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1CC3C6828()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1CC3C6834()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CC3C6840()
{
  return MEMORY[0x1E0D22000]();
}

uint64_t sub_1CC3C684C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CC3C6858()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CC3C6864()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CC3C6870()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CC3C687C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CC3C6888()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CC3C6894()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1CC3C68A0()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1CC3C68AC()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t ACHCodableFromAchievement()
{
  return MEMORY[0x1E0CF4F60]();
}

uint64_t ACHEncodeAchievementIntoUserInfoDictionary()
{
  return MEMORY[0x1E0CF4F78]();
}

uint64_t ACHMonthlyChallengeAchievementFromAchievementsForDate()
{
  return MEMORY[0x1E0CF4F80]();
}

uint64_t ACHMonthlyChallengeAchievementIsDayBased()
{
  return MEMORY[0x1E0CF4F88]();
}

uint64_t ASCodableFriendListFromFriends()
{
  return MEMORY[0x1E0CF51C0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

uint64_t FIActivitySummaryHasNonZeroMoveGoal()
{
  return MEMORY[0x1E0D216B8]();
}

uint64_t FIExperienceTypeWithHealthStoreAndDefaultExperienceType()
{
  return MEMORY[0x1E0D216E8]();
}

uint64_t FILocalizationTableForExperienceType()
{
  return MEMORY[0x1E0D21700]();
}

uint64_t FIMoveGoalQuantityForActivitySummary()
{
  return MEMORY[0x1E0D21718]();
}

uint64_t FIMoveQuantityForActivitySummary()
{
  return MEMORY[0x1E0D21720]();
}

uint64_t FIRandomKeyForPrefixWithTableName()
{
  return MEMORY[0x1E0D21730]();
}

uint64_t HKFirstDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x1E0CB50E8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x1E0DAB728]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1E0DB0FC8]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x1E0DB0FD8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _HKCacheIndexFromDate()
{
  return MEMORY[0x1E0CB70E0]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1E0CB7190]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1E0C80CC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x1E0C811A0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

void rewind(FILE *a1)
{
  MEMORY[0x1E0C85120](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x1E0DF0F80]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

