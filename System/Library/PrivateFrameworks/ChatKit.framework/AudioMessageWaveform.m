@implementation AudioMessageWaveform

- (BOOL)isOpaque
{
  return 0;
}

- (_TtC7ChatKit20AudioMessageWaveform)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit20AudioMessageWaveform *)sub_18E553D38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit20AudioMessageWaveform)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E55458C();
}

- (void)drawRect:(CGRect)a3
{
  _TtC7ChatKit20AudioMessageWaveform *v3;

  v3 = self;
  sub_18E554688();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit20AudioMessageWaveform_audioMediaObject));

}

@end
