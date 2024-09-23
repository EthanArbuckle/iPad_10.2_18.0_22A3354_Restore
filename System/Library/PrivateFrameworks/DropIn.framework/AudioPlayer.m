@implementation AudioPlayer

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5;
  _TtC6DropIn11AudioPlayer *v6;

  v5 = a3;
  v6 = self;
  sub_23A74FAC4();

}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  _TtC6DropIn11AudioPlayer *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = self;
  v7 = a4;
  sub_23A74FB90((uint64_t)v7, a4);

}

- (_TtC6DropIn11AudioPlayer)init
{
  sub_23A74FCBC();
}

- (void).cxx_destruct
{

  sub_23A74FDDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6DropIn11AudioPlayer_playHandler));
}

@end
