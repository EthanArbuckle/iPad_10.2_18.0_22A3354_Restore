@implementation MetalRenderer

- (id)displayLinkWillRenderFrame
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame))
    return 0;
  v2 = *(_QWORD *)&self->framerateDelegate[OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame];
  v5[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame);
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_241789E54;
  v5[3] = &block_descriptor_7;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setDisplayLinkWillRenderFrame:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_24178B28C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame);
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_24178B1AC(v8);
}

- (BOOL)commandQueueIsEmpty
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_commandQueueIsEmpty);
}

- (void)setCommandQueueIsEmpty:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_commandQueueIsEmpty) = a3;
}

- (void)dealloc
{
  _TtC14MentalHealthUI13MetalRenderer *v2;

  v2 = self;
  sub_24178AFF4();
}

- (void).cxx_destruct
{
  sub_24178B29C((uint64_t)self + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_framerateDelegate);

  sub_24178B1AC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14MentalHealthUI13MetalRenderer_displayLinkWillRenderFrame));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (_TtC14MentalHealthUI13MetalRenderer)init
{
  _TtC14MentalHealthUI13MetalRenderer *result;

  result = (_TtC14MentalHealthUI13MetalRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
