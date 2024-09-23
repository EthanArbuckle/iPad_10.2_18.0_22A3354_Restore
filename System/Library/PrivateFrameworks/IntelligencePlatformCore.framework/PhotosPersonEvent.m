@implementation PhotosPersonEvent

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v5 = a3;
  v6 = sub_1C106AC18();
  v8 = v7;

  swift_getObjCClassMetadata();
  v9 = static PhotosPersonEvent.event(with:dataVersion:)(v6, (os_log_type_t)v8, a4);
  sub_1C07B3374(v6, v8);
  return v9;
}

- (id)serialize
{
  _TtC24IntelligencePlatformCore17PhotosPersonEvent *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = PhotosPersonEvent.serialize()();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1C106ABF4();
    sub_1C07B33B8(v3, v5);
  }
  return v6;
}

- (_TtC24IntelligencePlatformCore17PhotosPersonEvent)init
{
  PhotosPersonEvent.init()();
}

- (void).cxx_destruct
{
  sub_1C0CAA2CC((uint64_t)self + OBJC_IVAR____TtC24IntelligencePlatformCore17PhotosPersonEvent_photosPerson);
}

@end
