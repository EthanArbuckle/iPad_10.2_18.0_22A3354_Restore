@implementation ClimateSyncIndicator

- (void).cxx_destruct
{
  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate20ClimateSyncIndicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimateSyncIndicator_sync));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate20ClimateSyncIndicator_syncButton));
}

- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate20ClimateSyncIndicator *v6;

  v5 = a3;
  v6 = self;
  sub_10005F2AC();

}

@end
