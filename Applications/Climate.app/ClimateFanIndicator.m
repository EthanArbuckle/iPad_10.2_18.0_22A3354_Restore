@implementation ClimateFanIndicator

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_fan));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_fanButton));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_defaultProgressViewColorConfig);
  v4 = *(void **)&self->super.super.action[OBJC_IVAR____TtC7Climate19ClimateFanIndicator_defaultProgressViewColorConfig];
  v5 = *(void **)&self->super.super.action[OBJC_IVAR____TtC7Climate19ClimateFanIndicator_defaultProgressViewColorConfig
                                         + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.popoverDelegate[OBJC_IVAR____TtC7Climate19ClimateFanIndicator_defaultProgressViewColorConfig]);

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_autoModeGlyph));
}

- (void)fanService:(id)a3 didUpdateFanLevel:(unsigned __int8)a4
{
  id v5;
  uint64_t Strong;
  uint64_t v7;
  _TtC7Climate19ClimateFanIndicator *v8;

  v5 = a3;
  v8 = self;
  sub_100045954();
  Strong = swift_unknownObjectWeakLoadStrong((char *)v8 + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_delegate);
  if (Strong)
  {
    v7 = Strong;
    sub_10003C0B0();

    swift_unknownObjectRelease(v7);
  }
  else
  {

  }
}

- (void)fanService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate19ClimateFanIndicator *v6;

  v5 = a3;
  v6 = self;
  sub_100045954();

}

- (void)fanService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v5;
  uint64_t Strong;
  uint64_t v7;
  _TtC7Climate19ClimateFanIndicator *v8;

  v5 = a3;
  v8 = self;
  sub_100045954();
  Strong = swift_unknownObjectWeakLoadStrong((char *)v8 + OBJC_IVAR____TtC7Climate19ClimateFanIndicator_delegate);
  if (Strong)
  {
    v7 = Strong;
    sub_10003C0B0();

    swift_unknownObjectRelease(v7);
  }
  else
  {

  }
}

@end
