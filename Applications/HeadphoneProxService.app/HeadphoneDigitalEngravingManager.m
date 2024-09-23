@implementation HeadphoneDigitalEngravingManager

- (id)fetchEngravingDataHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler))
    return 0;
  v2 = *(_QWORD *)&self->localStorage[OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler];
  v6[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10005D4E4;
  v6[3] = &unk_1000A8CA8;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setFetchEngravingDataHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  double (*v6)(uint64_t, uint64_t, uint64_t);
  double (**v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1000A8C68, 24, 7);
    v4[2] = v5;
    v6 = sub_10005E084;
  }
  else
  {
    v6 = 0;
  }
  v7 = (double (**)(uint64_t, uint64_t, uint64_t))((char *)self
                                                         + OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler);
  v8 = *(_QWORD *)&self->localStorage[OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler];
  *v7 = v6;
  v7[1] = (double (*)(uint64_t, uint64_t, uint64_t))v4;
  sub_10004D7DC(v9, v8);
}

- (_TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager)init
{
  return (_TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager *)sub_10005D75C((uint64_t)self, (uint64_t)a2);
}

- (void)deviceDidConnect:(id)a3
{
  id v4;
  _TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager *v5;

  v4 = a3;
  v5 = self;
  sub_10005D87C(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_localStorage));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager____lazy_storage___decoder));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager____lazy_storage___encoder));
  sub_10004D7DC(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler), *(_QWORD *)&self->localStorage[OBJC_IVAR____TtC20HeadphoneProxService32HeadphoneDigitalEngravingManager_fetchEngravingDataHandler]);
}

@end
