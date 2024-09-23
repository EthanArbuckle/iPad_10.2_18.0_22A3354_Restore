@implementation CKCloudTipViewModel

- (_TtC7ChatKit19CKCloudTipViewModel)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged);
  v4 = (objc_class *)type metadata accessor for CKCloudTipViewModel();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CKCloudTipViewModel init](&v6, sel_init);
}

+ (_TtC7ChatKit19CKCloudTipViewModel)sharedInstance
{
  if (qword_1EE0F4688 != -1)
    swift_once();
  return (_TtC7ChatKit19CKCloudTipViewModel *)(id)qword_1EE0F4958;
}

- (void)setOnCloudTipChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_18E52A888;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18E011A40(v7);
}

- (void)configureCloudTipManagerWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _TtC7ChatKit19CKCloudTipViewModel *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EE108D10;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE108D18;
  v11[5] = v10;
  v12 = self;
  sub_18E691CC8((uint64_t)v6, (uint64_t)&unk_1EE109740, (uint64_t)v11);
  swift_release();
}

- (_TtC7ChatKit20CKCloudTipDescriptor)currentTipDescriptor
{
  return (_TtC7ChatKit20CKCloudTipDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor));
}

- (void)setCurrentTipDescriptor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_currentTipDescriptor) = (Class)a3;
  v3 = a3;

}

- (id)onCloudTipChanged
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18E52243C;
  aBlock[3] = &block_descriptor_3;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void).cxx_destruct
{

  sub_18E011A40(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit19CKCloudTipViewModel_onCloudTipChanged));
}

+ (void)enableCloudSyncing
{
  void *v2;
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  id v7;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_sharedInstance);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_isEnabled);

    if ((v5 & 1) != 0)
      return;
    v6 = objc_msgSend(v2, sel_sharedInstance);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_setEnabled_, 1);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end
