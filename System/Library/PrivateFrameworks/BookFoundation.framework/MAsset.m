@implementation MAsset

- (NSString)artistName
{
  return (NSString *)sub_21C4044A4();
}

- (NSString)name
{
  return (NSString *)sub_21C4044A4();
}

- (NSURL)url
{
  return (NSURL *)(id)sub_21C458BAC();
}

- (BOOL)isBook
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation6MAsset *v4;
  int v5;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 3;
}

- (BOOL)isAudiobook
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation6MAsset *v4;
  int v5;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 0;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14BookFoundation6MAsset_url;
  v4 = sub_21C458BF4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (NSString)seriesName
{
  return (NSString *)sub_21C405774(self);
}

- (NSString)sequenceDisplayLabel
{
  return (NSString *)sub_21C405774(self);
}

- (NSString)contentRating
{
  return (NSString *)sub_21C4068B0(self);
}

- (BOOL)isExplicit
{
  _TtC14BookFoundation6MAsset *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = self;
  v3 = -[MAsset contentRating](v2, sel_contentRating);
  if (v3)
  {
    v4 = v3;
    v5 = sub_21C458E64();
    v7 = v6;

    if (v5 == 0x746963696C707865 && v7 == 0xE800000000000000)
    {

      swift_bridgeObjectRelease();
      v9 = 1;
    }
    else
    {
      v9 = sub_21C4594F4();

      swift_bridgeObjectRelease();
    }
  }
  else
  {

    v9 = 0;
  }
  return v9 & 1;
}

- (NSString)editionKind
{
  return (NSString *)sub_21C4068B0(self);
}

- (NSString)genreName
{
  return (NSString *)sub_21C408788(self, (uint64_t)a2, (void (*)(void))MAsset.genreName.getter);
}

- (NSString)buyParams
{
  return (NSString *)sub_21C408788(self, (uint64_t)a2, (void (*)(void))MAsset.buyParams.getter);
}

- (NSDate)releaseDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC14BookFoundation6MAsset *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[16];
  uint64_t v15[2];

  swift_getObjectType();
  v3 = sub_21C3E344C(&qword_254078EC0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14[15] = 21;
  v6 = self;
  sub_21C44F8CC(0);
  v8 = v7;
  sub_21C40A1A0();
  sub_21C4340FC(v8, MEMORY[0x24BEE0D00], (uint64_t)v15);
  swift_bridgeObjectRelease();
  if (v15[1])
  {
    sub_21C4062D8(v15[0], 1, v5);
  }
  else
  {
    v9 = sub_21C458C60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
  }

  v10 = sub_21C458C60();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    v12 = (void *)sub_21C458C24();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }
  return (NSDate *)v12;
}

- (BOOL)hasSupplementalContent
{
  return sub_21C406AB8(self, (uint64_t)a2, 0xCu);
}

- (BOOL)isSG
{
  return sub_21C406AB8(self, (uint64_t)a2, 0xEu);
}

- (NSURL)bookSampleDownloadURL
{
  return (NSURL *)sub_21C408010(self, (uint64_t)a2, &qword_25527A2D0, (void (*)(void))MAsset.bookSampleDownloadURL.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCD8D0]);
}

- (NSString)pageProgressionDirection
{
  return (NSString *)sub_21C4068B0(self);
}

- (BOOL)pagesAreRTL
{
  _TtC14BookFoundation6MAsset *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = self;
  v3 = -[MAsset pageProgressionDirection](v2, sel_pageProgressionDirection);
  if (v3)
  {
    v4 = v3;
    v5 = sub_21C458E64();
    v7 = v6;

    if (v5 == 7107698 && v7 == 0xE300000000000000)
    {

      swift_bridgeObjectRelease();
      v9 = 1;
    }
    else
    {
      v9 = sub_21C4594F4();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v9 = _s14BookFoundation23LocaleLanguageDirectionV5isRTLSbvgZ_0();

  }
  return v9 & 1;
}

- (NSString)version
{
  return (NSString *)sub_21C4068B0(self);
}

- (BOOL)supportsUnifiedProductPage
{
  return sub_21C406AB8(self, (uint64_t)a2, 0x17u);
}

- (double)averageRating
{
  _TtC14BookFoundation6MAsset *v2;
  double v3;

  v2 = self;
  v3 = MAsset.averageRating.getter();

  return v3;
}

- (unint64_t)ratingCount
{
  _TtC14BookFoundation6MAsset *v2;
  unint64_t v3;

  v2 = self;
  v3 = MAsset.ratingCount.getter();

  return v3;
}

- (unint64_t)ratingCountForAnalytics
{
  _TtC14BookFoundation6MAsset *v2;
  unint64_t v3;

  v2 = self;
  v3 = MAsset.ratingCountForAnalytics.getter();

  return v3;
}

- (NSString)standardNotes
{
  return (NSString *)sub_21C408788(self, (uint64_t)a2, (void (*)(void))MAsset.standardNotes.getter);
}

- (NSString)standardDescription
{
  return (NSString *)sub_21C408788(self, (uint64_t)a2, (void (*)(void))MAsset.standardDescription.getter);
}

- (NSDate)expectedReleaseDate
{
  return (NSDate *)sub_21C408010(self, (uint64_t)a2, &qword_254078EC0, (void (*)(void))MAsset.expectedReleaseDate.getter, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (int64_t)fileSize
{
  _TtC14BookFoundation6MAsset *v3;
  uint64_t v4;
  int64_t v6;
  char v7;

  swift_getObjectType();
  v3 = self;
  v4 = sub_21C407E54();
  sub_21C40A940();
  sub_21C4340FC(v4, MEMORY[0x24BEE4008], (uint64_t)&v6);

  swift_bridgeObjectRelease();
  if (v7)
    return 0;
  else
    return v6;
}

- (NSDictionary)offer
{
  _TtC14BookFoundation6MAsset *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = MAsset.offer.getter();

  if (v3)
  {
    v4 = (void *)sub_21C458D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (BOOL)isPreorder
{
  _TtC14BookFoundation6MAsset *v2;
  char v3;

  v2 = self;
  v3 = MAsset.isPreorder.getter();

  return v3 & 1;
}

- (NSString)priceFormatted
{
  return (NSString *)sub_21C408788(self, (uint64_t)a2, (void (*)(void))MAsset.priceFormatted.getter);
}

- (NSURL)previewURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC14BookFoundation6MAsset *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  swift_getObjectType();
  v3 = sub_21C3E344C(&qword_25527A2D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  v7 = MAsset.preview.getter();
  sub_21C40A984();
  sub_21C4340FC(v7, MEMORY[0x24BEE0D00], (uint64_t)v13);
  swift_bridgeObjectRelease();
  if (v13[1])
  {
    sub_21C458BDC();

    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_21C458BF4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);

  }
  v9 = sub_21C458BF4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
  {
    v11 = (void *)sub_21C458BAC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
  }
  return (NSURL *)v11;
}

- (NSString)artworkURL
{
  uint64_t v3;
  _TtC14BookFoundation6MAsset *v4;
  void *v5;
  _QWORD v7[2];

  swift_getObjectType();
  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14BookFoundation6MAsset_artwork);
  sub_21C40A9C8();
  v4 = self;
  sub_21C4340FC(v3, MEMORY[0x24BEE0D00], (uint64_t)v7);

  if (!v7[1])
    return (NSString *)0;
  v5 = (void *)sub_21C458E40();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSDecimalNumber)sequenceNumber
{
  uint64_t (*v2)(void);
  _TtC14BookFoundation6MAsset *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0x140);
  v3 = self;
  v4 = v2();
  sub_21C40A46C(1, v4);
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 0x100000000) != 0)
    v7 = 0;
  else
    v7 = (void *)sub_21C459254();

  return (NSDecimalNumber *)v7;
}

- (NSArray)genres
{
  _TtC14BookFoundation6MAsset *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_21C3FCCE4(CFSTR("genres"));
  v4 = (void *)v3;
  if (v3)
  {
    sub_21C40ECA0(v3);

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

- (NSNumber)price
{
  _TtC14BookFoundation6MAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)MAsset.__price.getter();

  return (NSNumber *)v3;
}

- (NSNumber)width
{
  return (NSNumber *)sub_21C431890((char *)self, (uint64_t)a2, 2);
}

- (NSNumber)height
{
  return (NSNumber *)sub_21C431890((char *)self, (uint64_t)a2, 0);
}

- (BFMSeries)seriesResource
{
  _TtC14BookFoundation6MAsset *v2;
  void *v3;

  v2 = self;
  v3 = (void *)MAsset.__seriesResource.getter();

  return (BFMSeries *)v3;
}

@end
