@implementation MSeries

- (NSNumber)authorCount
{
  _TtC14BookFoundation7MSeries *v2;
  char v3;
  void *v4;

  v2 = self;
  MSeries.authorCount.getter();
  if ((v3 & 1) != 0)
    v4 = 0;
  else
    v4 = (void *)sub_21C45914C();

  return (NSNumber *)v4;
}

- (NSArray)assets
{
  _TtC14BookFoundation7MSeries *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  if (MSeries.assetsResourceSet.getter() && (v3 = sub_21C44F728(), swift_release(), v3))
  {
    sub_21C40ECAC(v3, (uint64_t *)&unk_25527AAF0);

    swift_bridgeObjectRelease();
    sub_21C3E344C((uint64_t *)&unk_25527AAF0);
    v4 = (void *)sub_21C459020();
    swift_bridgeObjectRelease();
  }
  else
  {

    v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSArray)genres
{
  _TtC14BookFoundation7MSeries *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_21C3FCCE4(CFSTR("genres"));
  v4 = (void *)v3;
  if (v3)
  {
    sub_21C40ECAC(v3, (uint64_t *)&unk_25527B510);

    swift_bridgeObjectRelease();
    sub_21C3E344C((uint64_t *)&unk_25527B510);
    v4 = (void *)sub_21C459020();
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  return (NSArray *)v4;
}

- (BOOL)hasUniqueAuthors
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC14BookFoundation7MSeries_hasUniqueAuthors);
}

- (BOOL)isOrdered
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC14BookFoundation7MSeries_isOrdered);
}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_21C458E40();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)url
{
  return (NSURL *)(id)sub_21C458BAC();
}

- (BOOL)isBookSeries
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation7MSeries *v4;
  int v5;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 4;
}

- (BOOL)isAudiobookSeries
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation7MSeries *v4;
  int v5;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14BookFoundation7MSeries_url;
  v4 = sub_21C458BF4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (BOOL)isExplicit
{
  _TtC14BookFoundation7MSeries *v2;
  char v3;

  v2 = self;
  v3 = MSeries.isExplicit.getter();

  return v3 & 1;
}

- (NSArray)authorNames
{
  _TtC14BookFoundation7MSeries *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = MSeries.authorNames.getter();

  if (v3)
  {
    v4 = (void *)sub_21C459020();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

@end
