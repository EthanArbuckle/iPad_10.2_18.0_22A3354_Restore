@implementation SpriteKitViewCoordinator

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)init
{
  char *v3;
  objc_super v5;

  v3 = (char *)self
     + OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_QWORD *)v3 + 6) = 0;
  outlined consume of SpriteKitViewState?(0, 0);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpriteKitViewCoordinator();
  return -[SKView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator *v6;
  objc_super v8;

  v4 = (char *)self
     + OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_OWORD *)v4 + 2) = 0u;
  *((_QWORD *)v4 + 6) = 0;
  v5 = a3;
  outlined consume of SpriteKitViewState?(0, 0);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SpriteKitViewCoordinator();
  v6 = -[SKView initWithCoder:](&v8, sel_initWithCoder_, v5);

  return v6;
}

- (void)layoutSubviews
{
  char *v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[2];
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for SpriteKitViewCoordinator();
  v2 = (char *)v19.receiver;
  -[SKView layoutSubviews](&v19, sel_layoutSubviews);
  v3 = &v2[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  v4 = *(void **)&v2[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
  if (v4)
  {
    v6 = *((_QWORD *)v3 + 5);
    v5 = *((_QWORD *)v3 + 6);
    v8 = *((_QWORD *)v3 + 3);
    v7 = *((_QWORD *)v3 + 4);
    v10 = (void *)*((_QWORD *)v3 + 1);
    v9 = *((_QWORD *)v3 + 2);
    v13[0] = *(_QWORD *)&v2[OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState];
    v13[1] = v10;
    v14 = v9 & 1;
    v15 = v8;
    v16 = v7;
    v17 = v6;
    v18 = v5;
    swift_unknownObjectRetain();
    v11 = v4;
    v12 = v10;
    SKView.assignState(state:)((uint64_t)v13);
    outlined consume of SpriteKitViewState?(v4, v10);
  }

}

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator)initWithFrame:(CGRect)a3
{
  _TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator *result;

  result = (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of SpriteKitViewState?(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5324SpriteKitViewCoordinator_deferredState));
}

@end
