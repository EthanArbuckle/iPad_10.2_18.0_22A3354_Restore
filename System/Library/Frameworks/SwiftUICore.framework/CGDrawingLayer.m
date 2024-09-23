@implementation CGDrawingLayer

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)initWithCoder:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  _TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer *result;

  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v4[40] = 5;
  v5 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_state;
  *v5 = 3;
  *((_QWORD *)v5 + 1) = 0;
  v6 = a3;

  result = (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  CGContext *v10;
  _TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer *v11;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  v5 = *(void **)((char *)&self->super._attr.refcount
                + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  v6 = *(uint64_t *)((char *)&self->super._attr.layer
                  + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  v7 = *(uint64_t *)((char *)&self->super._attr._objc_observation_info
                  + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  v8 = *(_QWORD *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content];
  v9 = self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content + 8];
  v10 = a3;
  v11 = self;
  outlined copy of PlatformDrawableContent.Storage(v4, v5, v6, v7, v8, v9);
  -[CGDrawingLayer bounds](v11, sel_bounds);
  -[CGDrawingLayer contentsScale](v11, sel_contentsScale);
  swift_beginAccess();
  PlatformDrawableContent.draw(in:size:contentsScale:state:)();
  swift_endAccess();
  outlined consume of PlatformDrawableContent.Storage(v4, v5, v6, v7, v8, v9);

}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)init
{
  _TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer *result;

  result = (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)initWithLayer:(id)a3
{
  @objc CGDrawingLayer.init(layer:)();
}

- (void).cxx_destruct
{
  outlined consume of PlatformDrawableContent.Storage(*(void **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(id *)((char *)&self->super._attr.refcount+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr.layer+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr._objc_observation_info+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(_QWORD *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content], self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content + 8]);
  swift_release();
}

@end
