@implementation AppOfferButtonPresenter

- (void)offerButtonTapped
{
  swift_retain();
  sub_1D8434314();
  swift_release();
}

- (void)isEnabledDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = sub_1D89271CC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D8927190();
  v7 = qword_1F016EDB0;
  swift_retain();
  if (v7 != -1)
    swift_once();
  v8 = sub_1D892AA00();
  __swift_project_value_buffer(v8, (uint64_t)qword_1F017F808);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA3B010);
  sub_1D89295A8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1D8931D70;
  sub_1D8929518();
  sub_1D892A778();
  swift_bridgeObjectRelease();
  _s19AppStoreKitInternal0A20OfferButtonPresenterC6update13ignoringCacheySb_tF_0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
