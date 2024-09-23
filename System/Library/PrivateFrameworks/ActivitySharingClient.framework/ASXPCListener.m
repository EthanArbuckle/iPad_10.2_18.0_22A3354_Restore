@implementation ASXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC21ActivitySharingClient13ASXPCListener *v9;
  char v10;

  v6 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21ActivitySharingClient13ASXPCListener_requiredEntitlements);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_235E8F36C(v8, v6);
  if ((v10 & 1) != 0)
    sub_235E90C6C(v8);

  return v10 & 1;
}

- (void)transportRequest:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC21ActivitySharingClient13ASXPCListener *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25638C8E8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C8F0;
  v13[5] = v12;
  v14 = self;
  sub_235EC4FE4((uint64_t)v8, (uint64_t)&unk_25638C8F8, (uint64_t)v13);
  swift_release();
}

- (_TtC21ActivitySharingClient13ASXPCListener)init
{
  id v2;
  char *v3;

  sub_235EE5D40();
  v2 = objc_allocWithZone((Class)type metadata accessor for ASXPCListener());
  v3 = ASXPCListener.init(machServiceName:)();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC21ActivitySharingClient13ASXPCListener *)v3;
}

- (void)dealloc
{
  uint64_t v2;
  _TtC21ActivitySharingClient13ASXPCListener *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v2 = qword_25429CF60;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_235EE5CF8();
  __swift_project_value_buffer(v4, (uint64_t)qword_25429CF70);
  sub_235E9105C(0xD000000000000063, 0x8000000235EEBD20, 0x6164696C61766E69, 0xEC00000029286574);
  v5 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC21ActivitySharingClient13ASXPCListener_listener);
  objc_msgSend(v5, sel_setDelegate_, 0);
  objc_msgSend(v5, sel_invalidate);
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ASXPCListener();
  -[ASXPCListener dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)transportMessage:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC21ActivitySharingClient13ASXPCListener *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25638C928;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25638C930;
  v14[5] = v13;
  v15 = self;
  sub_235EC4FE4((uint64_t)v9, (uint64_t)&unk_25638C938, (uint64_t)v14);
  swift_release();
}

- (void)transportMessage:(int64_t)a3 data:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  _TtC21ActivitySharingClient13ASXPCListener *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25638C908;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25638C910;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_235EC4FE4((uint64_t)v11, (uint64_t)&unk_25638C918, (uint64_t)v16);
  swift_release();
}

- (void)transportRequest:(int64_t)a3 data:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  _TtC21ActivitySharingClient13ASXPCListener *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429CDD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_235EE5E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25638C8A8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_25638C1C0;
  v16[5] = v15;
  v17 = a4;
  v18 = self;
  sub_235EC4FE4((uint64_t)v11, (uint64_t)&unk_25638C1C8, (uint64_t)v16);
  swift_release();
}

@end
