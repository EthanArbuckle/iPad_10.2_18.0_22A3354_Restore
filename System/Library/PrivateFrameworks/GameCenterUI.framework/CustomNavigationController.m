@implementation CustomNavigationController

- (void)viewDidLoad
{
  _TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *v2;

  v2 = self;
  sub_1AB589724();

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1AB589B8C((uint64_t)v7, v8);

}

- (void)donePressed:(id)a3
{
  _TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AB7DB758();
  swift_unknownObjectRelease();
  sub_1AB589C0C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v6;

  if (!a3)
  {
    ObjCClassMetadata = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AB589CBC(ObjCClassMetadata, v6);
  }
  ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_getObjCClassMetadata();
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AB589CBC(ObjCClassMetadata, v6);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AB589DC0(a3);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AB7DAF90();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AB589E5C(v5, v7, a4);
}

- (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController *)sub_1AB589F78(a3);
}

- (void).cxx_destruct
{
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUIP33_ED65E62AB2E9DEC955C1CAF6BA7C69F726CustomNavigationController_dismissHandler));
  swift_release();
}

@end
