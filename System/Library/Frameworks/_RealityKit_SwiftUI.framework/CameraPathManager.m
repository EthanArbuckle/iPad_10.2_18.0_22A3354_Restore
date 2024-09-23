@implementation CameraPathManager

- (_TtC19_RealityKit_SwiftUI17CameraPathManager)init
{
  char *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19_RealityKit_SwiftUI17CameraPathManager_shots) = (Class)MEMORY[0x24BEE4AF8];
  v2 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI17CameraPathManager_cameraPosesBoundingBox;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CameraPathManager();
  return -[CameraPathManager init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
