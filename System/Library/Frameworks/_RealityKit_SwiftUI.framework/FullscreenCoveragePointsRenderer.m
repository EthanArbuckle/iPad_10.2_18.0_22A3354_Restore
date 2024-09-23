@implementation FullscreenCoveragePointsRenderer

- (void)dealloc
{
  void *v2;
  _TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_dragGesture);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_dragGesture) = 0;
  v3 = self;

  *(_QWORD *)&v3->view[OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_transformProvider] = 0;
  swift_unknownObjectWeakAssign();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FullscreenCoveragePointsRenderer(0);
  -[FullscreenCoveragePointsRenderer dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_view));
  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_coveragePointCloud, (uint64_t *)&demangling cache variable for type metadata for CoveragePointCloud?);
  outlined destroy of URL?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_coveragePoints, &demangling cache variable for type metadata for ObjectCaptureSession.Frame.PointCloud?);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined consume of PlatterRenderer??(*(uint64_t *)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer____lazy_storage___voxelRenderer));
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_dragGesture));
  outlined destroy of weak RangefinderDelegate?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_transformProvider);
  v3 = (char *)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer_colorScheme;
  v4 = type metadata accessor for ColorScheme();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  _TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = self;
  FullscreenCoveragePointsRenderer.mtkView(_:drawableSizeWillChange:)((MTKView)v7, (CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

}

- (void)drawInMTKView:(id)a3
{
  id v4;
  _TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer *v5;

  v4 = a3;
  v5 = self;
  FullscreenCoveragePointsRenderer.draw(in:)((MTKView)v4);

}

- (_TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer)init
{
  _TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer *result;

  result = (_TtC19_RealityKit_SwiftUI32FullscreenCoveragePointsRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
