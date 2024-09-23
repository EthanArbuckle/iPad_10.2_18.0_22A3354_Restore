@implementation ReporterWithRefApp

- (void)reportEvent:(id)a3 type:(id)a4
{
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _TtC12GameCenterUIP33_5352B16A5002CB36501838DE2FD945EE18ReporterWithRefApp *v11;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v6 = sub_1AB7DAF90();
  v8 = v7;
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v9 = sub_1AB7DAF90();
  v4 = v10;
LABEL_6:
  v11 = self;
  sub_1AB74C81C(v6, v8, v9, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUIP33_5352B16A5002CB36501838DE2FD945EE18ReporterWithRefApp)init
{
  sub_1AB74C9D0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
