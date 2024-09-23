@implementation ErrorPresenter

- (void)dealloc
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _TtC19AppStoreKitInternal14ErrorPresenter *v8;
  _TtC19AppStoreKitInternal14ErrorPresenter *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_networkObservation;
  swift_beginAccess();
  if (*((_QWORD *)v4 + 3))
  {
    sub_1D832D54C((uint64_t)v4, (uint64_t)v10);
    v5 = v11;
    v6 = v12;
    __swift_project_boxed_opaque_existential_1Tm(v10, v11);
    v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v8 = self;
    v7(v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v9 = self;
  }
  v13.receiver = self;
  v13.super_class = ObjectType;
  -[ErrorPresenter dealloc](&v13, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_networkInquiry);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_airplaneModeInquiry));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_cellularDataInquiry));
  sub_1D83371E4((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_networkObservation, &qword_1EDA282D0);
  sub_1D8374F48((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal14ErrorPresenter_view);

}

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal14ErrorPresenter *v5;

  v4 = a3;
  v5 = self;
  ErrorPresenter.update()();

}

- (_TtC19AppStoreKitInternal14ErrorPresenter)init
{
  _TtC19AppStoreKitInternal14ErrorPresenter *result;

  result = (_TtC19AppStoreKitInternal14ErrorPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
