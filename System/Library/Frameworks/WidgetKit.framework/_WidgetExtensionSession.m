@implementation _WidgetExtensionSession

- (void)invalidate
{
  swift_retain();
  sub_1908B026C();
  swift_release();
}

- (void)getAllCurrentDescriptorsWithCompletion:(id)a3
{
  sub_1908AAC78((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1908ABEEC);
}

- (void)getDescriptorsWithCompletion:(id)a3
{
  sub_1908AAC78((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1909E1BB4);
}

- (void)getCurrentDescriptorsWithCompletion:(id)a3
{
  sub_1908AAC78((int)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1909E1FB4);
}

- (void)getPlaceholdersWithEnvironment:(id)a3 for:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v7 = _Block_copy(a5);
  sub_1908AB890(0, &qword_1ECF6BF58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECF6B850);
  sub_1909E4344(&qword_1ECF6B848, &qword_1ECF6BF58);
  v8 = sub_190A47A28();
  _Block_copy(v7);
  v9 = a3;
  swift_retain();
  v10 = sub_1909E58A0(v8);
  sub_1909E24DC(v10, v9, (uint64_t)self, v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
  _Block_release(v7);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getPlaceholdersForRequests:(id)a3 inEnvironment:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;

  v7 = _Block_copy(a5);
  sub_1908AB890(0, &qword_1ECF6D250);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECF6B850);
  sub_1909E4344(&qword_1ECF6A558, &qword_1ECF6D250);
  v8 = sub_190A47A28();
  _Block_copy(v7);
  v9 = a4;
  swift_retain();
  sub_1909E24DC(v8, v9, (uint64_t)self, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getPlaceholdersWithRequests:(id)a3 completion:(id)a4
{
  sub_1909DDA94((uint64_t)self, (int)a2, (int)a3, a4, (void (*)(_QWORD))type metadata accessor for PlaceholderRequest, (void (*)(uint64_t, uint64_t, void *))sub_1909E2360);
}

- (void)handleURLSessionEventsFor:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v4 = _Block_copy(a4);
  v5 = sub_190A47ADC();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  v11 = 6;
  v12 = 4;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v5;
  v9[3] = v7;
  v9[4] = sub_1908CEB50;
  v9[5] = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_1908CEB50;
  *(_QWORD *)(v10 + 24) = v8;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1908AF080((uint64_t)&v11, (uint64_t)sub_1909E4248, (uint64_t)v9, (uint64_t)sub_1909E4538, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)attachPreviewAgentWithFrameworkPath:(id)a3 endpoint:(id)a4 handler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v6 = _Block_copy(a5);
  v7 = sub_190A47ADC();
  v9 = v8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  v13 = 7;
  v14 = 4;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v7;
  v11[3] = v9;
  v11[4] = a4;
  v11[5] = sub_1909E4534;
  v11[6] = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1909E4534;
  *(_QWORD *)(v12 + 24) = v10;
  swift_unknownObjectRetain_n();
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1908AF080((uint64_t)&v13, (uint64_t)sub_1909E41C4, (uint64_t)v11, (uint64_t)sub_1909E41D4, v12);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)pushTokensDidChange:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v11 = 10;
  v12 = 4;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = sub_1908CEB50;
  v7[4] = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1908CEB50;
  *(_QWORD *)(v8 + 24) = v6;
  v9 = a3;
  swift_retain_n();
  v10 = v9;
  swift_retain();
  sub_1908AF080((uint64_t)&v11, (uint64_t)sub_1909E410C, (uint64_t)v7, (uint64_t)sub_1909E4538, v8);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)setControlState:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v11 = 3;
  v12 = 4;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = sub_1908CEB50;
  v7[4] = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1908CEB50;
  *(_QWORD *)(v8 + 24) = v6;
  v9 = a3;
  swift_retain_n();
  v10 = v9;
  swift_retain();
  sub_1908AF080((uint64_t)&v11, (uint64_t)sub_1909E4084, (uint64_t)v7, (uint64_t)sub_1909E4538, v8);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)getControlTemplatesWithRequests:(id)a3 completion:(id)a4
{
  sub_1909DDA94((uint64_t)self, (int)a2, (int)a3, a4, (void (*)(_QWORD))type metadata accessor for ControlTemplateRequest, (void (*)(uint64_t, uint64_t, void *))sub_1909E2C88);
}

- (void)getTimelinesWithRequests:(id)a3 isPreview:(BOOL)a4 completion:(id)a5
{
  void *v7;
  unint64_t v8;

  v7 = _Block_copy(a5);
  type metadata accessor for TimelineRequest();
  v8 = sub_190A47C5C();
  _Block_copy(v7);
  swift_retain();
  sub_1909E2E00(v8, a4, (uint64_t)self, (void (**)(_QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getTimelineFor:(id)a3 into:(id)a4 environment:(id)a5 isPreview:(BOOL)a6 completion:(id)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;

  v11 = _Block_copy(a7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v21 = 8;
  v22 = 4;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a5;
  *(_QWORD *)(v13 + 32) = a4;
  *(_BYTE *)(v13 + 40) = a6;
  *(_QWORD *)(v13 + 48) = sub_1908CEB50;
  *(_QWORD *)(v13 + 56) = v12;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_1908CEB50;
  *(_QWORD *)(v14 + 24) = v12;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  swift_retain_n();
  v18 = v15;
  v19 = v17;
  v20 = v16;
  swift_retain();
  sub_1908AF080((uint64_t)&v21, (uint64_t)sub_1909E3F40, v13, (uint64_t)sub_1909E4538, v14);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)getAppIntentsXPCListenerEndpointWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v7 = 9;
  v8 = 4;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_1909E3E34;
  *(_QWORD *)(v5 + 24) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1909E3E34;
  *(_QWORD *)(v6 + 24) = v4;
  swift_retain_n();
  swift_retain();
  sub_1908AF080((uint64_t)&v7, (uint64_t)sub_1909E3E3C, v5, (uint64_t)sub_1909E3E44, v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)getActivitiesWithRequests:(id)a3 completion:(id)a4
{
  sub_1909DDA94((uint64_t)self, (int)a2, (int)a3, a4, (void (*)(_QWORD))type metadata accessor for ActivityWidgetRequest, (void (*)(uint64_t, uint64_t, void *))sub_1909E2F90);
}

- (void)getWidgetRelevancesWithRequest:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v11 = 12;
  v12 = 4;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = sub_1908CDA5C;
  v7[4] = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_1908CDA5C;
  *(_QWORD *)(v8 + 24) = v6;
  v9 = a3;
  swift_retain_n();
  v10 = v9;
  swift_retain();
  sub_1908AF080((uint64_t)&v11, (uint64_t)sub_1909E3D6C, (uint64_t)v7, (uint64_t)sub_1909172D0, v8);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (int)pid
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  int v10;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;

  v2 = swift_retain();
  v12 = MEMORY[0x1940115A8](v2);
  v13 = v3;
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D016E0]), sel_initWithAuditToken_, &v12);
  v10 = objc_msgSend(v9, sel_pid);
  swift_release();

  return v10;
}

@end
