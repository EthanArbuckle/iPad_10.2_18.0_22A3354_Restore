@implementation ObjCRLE

- (_TtC9Coherence7ObjCRLE)init
{
  objc_super v4;
  uint64_t v5;

  v5 = MEMORY[0x1E0DEE9D8];
  swift_weakInit();
  swift_weakAssign();
  sub_1BDDB4F58(&v5, (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence7ObjCRLE_rle));
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ObjCRLE();
  return -[ObjCRLE init](&v4, sel_init);
}

- (int64_t)rangeCount
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence7ObjCRLE_rle))[2];
}

- (int64_t)rangeCountIn:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _TtC9Coherence7ObjCRLE *v5;
  int64_t v6;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6 = sub_1BE19CA0C(location, length);

  return v6;
}

- (void)enumerateRangesIn:(_NSRange)a3 :(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  _TtC9Coherence7ObjCRLE *v8;

  length = a3.length;
  location = a3.location;
  v7 = _Block_copy(a4);
  _Block_copy(v7);
  v8 = self;
  sub_1BE1A16EC(location, length, (uint64_t)v8, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

}

- (NSString)description
{
  _TtC9Coherence7ObjCRLE *v3;
  void *v4;
  _QWORD v6[2];

  sub_1BDDB4ED4((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9Coherence7ObjCRLE_rle), v6);
  v3 = self;
  sub_1BE19AAB0();
  sub_1BDDB4E78((uint64_t)v6);

  v4 = (void *)sub_1BE1B27A4();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  sub_1BDDB4E78((uint64_t)self + OBJC_IVAR____TtC9Coherence7ObjCRLE_rle);
}

@end
