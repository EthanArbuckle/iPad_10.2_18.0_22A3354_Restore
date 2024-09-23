@implementation CGDrawingLayer

- (void)drawInContext:(CGContext *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  CGContext *v10;
  _TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer *v11;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  v5 = *(void **)((char *)&self->super._attr.refcount
                + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  v6 = *(uint64_t *)((char *)&self->super._attr.layer
                  + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  v7 = *(uint64_t *)((char *)&self->super._attr._objc_observation_info
                  + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  v8 = *(_QWORD *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content];
  v9 = self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content + 8];
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

- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)init
{
  objc_class *ObjectType;
  _TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer *v4;
  char *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  PlatformDrawableContent.init()();
  v5 = (char *)v4 + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_state;
  *v5 = 3;
  *((_QWORD *)v5 + 1) = 0;

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return -[CGDrawingLayer init](&v7, sel_init);
}

- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  _TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer *v5;
  char *v6;
  uint64_t v7;
  _TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer *v8;
  objc_super v10;
  _QWORD v11[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v5 = self;
  PlatformDrawableContent.init()();
  v6 = (char *)v5 + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_state;
  *v6 = 3;
  *((_QWORD *)v6 + 1) = 0;

  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v7 = _bridgeAnythingToObjectiveC<A>(_:)();
  v10.receiver = v5;
  v10.super_class = ObjectType;
  v8 = -[CGDrawingLayer initWithLayer:](&v10, sel_initWithLayer_, v7);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v8;
}

- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer *v7;
  char *v8;
  _TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = a3;
  v7 = self;
  PlatformDrawableContent.init()();
  v8 = (char *)v7 + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_state;
  *v8 = 3;
  *((_QWORD *)v8 + 1) = 0;

  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = -[CGDrawingLayer initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (void).cxx_destruct
{
  outlined consume of PlatformDrawableContent.Storage(*(void **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(id *)((char *)&self->super._attr.refcount+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr.layer+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr._objc_observation_info+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(_QWORD *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content], self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content + 8]);
  swift_release();
}

@end
