@implementation CKTextEffectsDisplayLink

- (void)_displayLinkDidFire
{
  _TtC7ChatKit24CKTextEffectsDisplayLink *v2;

  v2 = self;
  sub_18E6243E4();

}

- (_TtC7ChatKit24CKTextEffectsDisplayLink)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit24CKTextEffectsDisplayLink_tokens) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit24CKTextEffectsDisplayLink_displayLink) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKTextEffectsDisplayLink();
  return -[CKTextEffectsDisplayLink init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (id)frameRateRequest:(CAFrameRateRange)a3 block:(id)a4
{
  float preferred;
  float maximum;
  float minimum;
  void *v8;
  uint64_t v9;
  _TtC7ChatKit24CKTextEffectsDisplayLink *v10;
  id v11;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  v8 = _Block_copy(a4);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  v11 = sub_18E624188((uint64_t)sub_18E52A888, v9, minimum, maximum, preferred);

  swift_release();
  return v11;
}

@end
