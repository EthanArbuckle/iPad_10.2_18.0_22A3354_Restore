@implementation VideoReader.Observer

- (void)dealloc
{
  _TtCV18CreateMLComponents11VideoReader8Observer *v2;

  v2 = self;
  sub_22AAAC544();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV18CreateMLComponents11VideoReader8Observer_captureSession));
  sub_22AAAEDB4((uint64_t)self + OBJC_IVAR____TtCV18CreateMLComponents11VideoReader8Observer_state);
  swift_release();

}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8;
  opaqueCMSampleBuffer *v9;
  id v10;
  _TtCV18CreateMLComponents11VideoReader8Observer *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_22AAAE234();

}

- (_TtCV18CreateMLComponents11VideoReader8Observer)init
{
  sub_22AAAE694();
}

@end
