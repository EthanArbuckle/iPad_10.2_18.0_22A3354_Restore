@implementation TrampolineXPCListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC13SoundAnalysis29TrampolineXPCListenerDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D43B1D18();

  return v9 & 1;
}

- (_TtC13SoundAnalysis29TrampolineXPCListenerDelegate)init
{
  sub_1D43B1DA8();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
