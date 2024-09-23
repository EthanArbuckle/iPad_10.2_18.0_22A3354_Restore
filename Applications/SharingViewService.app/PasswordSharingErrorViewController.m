@implementation PasswordSharingErrorViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService34PasswordSharingErrorViewController *v2;

  v2 = self;
  sub_1000800CC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService34PasswordSharingErrorViewController *v4;

  v4 = self;
  sub_100080824(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PasswordSharingErrorViewController();
  v4 = v12.receiver;
  -[PasswordSharingErrorViewController viewDidDisappear:](&v12, "viewDidDisappear:", v3);
  if (qword_1001A3030 != -1)
    swift_once(&qword_1001A3030, sub_10007FD64);
  v6 = type metadata accessor for Logger(0, v5);
  v7 = sub_10000E8E8(v6, (uint64_t)qword_1001A64C8);
  v8 = Logger.logObject.getter(v7);
  v10 = static os_log_type_t.default.getter(v8, v9);
  if (os_log_type_enabled(v8, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v10, "Error ViewDidDisappear", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

- (_TtC18SharingViewService34PasswordSharingErrorViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  objc_class *v7;
  objc_super v9;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_type] = 1;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model];
  v7 = (objc_class *)type metadata accessor for PasswordSharingErrorViewController();
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_QWORD *)v6 + 12) = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[PasswordSharingErrorViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100013338((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_presenter], (uint64_t)a2);
  sub_10002715C(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model], *(_QWORD *)&self->presenter[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model], *(_QWORD *)&self->presenter[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 8], *(_QWORD *)&self->type[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 7], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 15], *(void **)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 23], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 31], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 39], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 47], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 55], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 63], *(_QWORD *)&self->model[OBJC_IVAR____TtC18SharingViewService34PasswordSharingErrorViewController_model + 71]);
}

@end
