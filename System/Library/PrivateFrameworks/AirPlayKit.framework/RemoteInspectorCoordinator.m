@implementation RemoteInspectorCoordinator

- (void)CSSAgent:(APKRemoteInspectorCSSAgent *)a3 onInlineStylesRequestWithIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  APKRemoteInspectorCSSAgent *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_DWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255AFF8C8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255AFF8D0;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_22A6847DC((uint64_t)v11, (uint64_t)&unk_255AFF8D8, (uint64_t)v16);
  swift_release();
}

- (void)CSSAgent:(APKRemoteInspectorCSSAgent *)a3 onComputedStylesRequestWithIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  APKRemoteInspectorCSSAgent *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_DWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255AFF890;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255B00C20;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_22A6847DC((uint64_t)v11, (uint64_t)&unk_255AFF8A0, (uint64_t)v16);
  swift_release();
}

- (void)pageAgent:(APKRemoteInspectorPageAgent *)a3 onResourcesRequestWithCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  APKRemoteInspectorPageAgent *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_255B00A50;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_255B00A58;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_22A6847DC((uint64_t)v9, (uint64_t)&unk_255B00A60, (uint64_t)v14);
  swift_release();
}

- (void)pageAgent:(APKRemoteInspectorPageAgent *)a3 onResourceContentRequestWithIdentifier:(NSString *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  APKRemoteInspectorPageAgent *v17;
  NSString *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255B00A30;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255B00C20;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_22A6847DC((uint64_t)v11, (uint64_t)&unk_255AFF8A0, (uint64_t)v16);
  swift_release();
}

- (void)DOMAgent:(APKRemoteInspectorDOMAgent *)a3 onDocumentWithCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  APKRemoteInspectorDOMAgent *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_255B00CC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_255B00CC8;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_22A6847DC((uint64_t)v9, (uint64_t)&unk_255B00CD0, (uint64_t)v14);
  swift_release();
}

- (void)DOMAgent:(APKRemoteInspectorDOMAgent *)a3 onOuterHTMLRequestWithIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  APKRemoteInspectorDOMAgent *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_DWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255B00C88;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255B00C90;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_22A6847DC((uint64_t)v11, (uint64_t)&unk_255B00C98, (uint64_t)v16);
  swift_release();
}

- (void)DOMAgent:(APKRemoteInspectorDOMAgent *)a3 onAttributesRequestWithIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  APKRemoteInspectorDOMAgent *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_DWORD *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_255B00C60;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_255B00C68;
  v16[5] = v15;
  v17 = a3;
  swift_retain();
  sub_22A6847DC((uint64_t)v11, (uint64_t)&unk_255B00C70, (uint64_t)v16);
  swift_release();
}

- (void)DOMAgent:(APKRemoteInspectorDOMAgent *)a3 onChildNodeRequestWithParentIdentifier:(int)a4 depth:(int)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  APKRemoteInspectorDOMAgent *v19;
  uint64_t v20;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255AFECC0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_DWORD *)(v15 + 24) = a4;
  *(_DWORD *)(v15 + 28) = a5;
  *(_QWORD *)(v15 + 32) = v14;
  *(_QWORD *)(v15 + 40) = self;
  v16 = sub_22A6A5EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_255B00C10;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_255B00C20;
  v18[5] = v17;
  v19 = a3;
  swift_retain();
  sub_22A6847DC((uint64_t)v13, (uint64_t)&unk_255AFF8A0, (uint64_t)v18);
  swift_release();
}

@end
