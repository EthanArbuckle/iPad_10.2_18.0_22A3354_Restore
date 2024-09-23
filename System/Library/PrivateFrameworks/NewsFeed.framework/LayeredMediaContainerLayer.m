@implementation LayeredMediaContainerLayer

- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransforms) = (Class)MEMORY[0x1E0DEE9D8];
  v4 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransform;
  v5 = *MEMORY[0x1E0DB7900];
  v6 = sub_1BB86FC10();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v4, v5, v6);
  v7 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionDisabledTransform;
  v8 = *MEMORY[0x1E0DB9C68];
  v9 = sub_1BB870870();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v7, v8, v9);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionEnabled) = 1;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionAllowed) = 1;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[TUNonAnimatingLayer init](&v11, sel_init);
}

- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer *v12;
  objc_super v14;
  _QWORD v15[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1BB873B64();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransforms) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransform;
  v6 = *MEMORY[0x1E0DB7900];
  v7 = sub_1BB86FC10();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  v8 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionDisabledTransform;
  v9 = *MEMORY[0x1E0DB9C68];
  v10 = sub_1BB870870();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v8, v9, v10);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionEnabled) = 1;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_isMotionAllowed) = 1;
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  v11 = sub_1BB874380();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[LayeredMediaContainerLayer initWithLayer:](&v14, sel_initWithLayer_, v11);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v12;
}

- (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer)initWithCoder:(id)a3
{
  return (_TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer *)sub_1BB634014(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionTransform;
  v4 = sub_1BB86FC10();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC8NewsFeedP33_F669C03278D43A4B0F24735E6C90190F26LayeredMediaContainerLayer_motionDisabledTransform;
  v6 = sub_1BB870870();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
