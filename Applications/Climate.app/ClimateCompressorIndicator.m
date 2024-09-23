@implementation ClimateCompressorIndicator

- (void).cxx_destruct
{
  sub_10001BF8C((uint64_t)self + OBJC_IVAR____TtC7Climate26ClimateCompressorIndicator_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateCompressorIndicator_cabin));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateCompressorIndicator_compressorButton));
}

- (void)cabinService:(id)a3 didUpdateCompressorOn:(BOOL)a4
{
  id v5;
  _TtC7Climate26ClimateCompressorIndicator *v6;

  v5 = a3;
  v6 = self;
  sub_100036CAC();

}

@end
