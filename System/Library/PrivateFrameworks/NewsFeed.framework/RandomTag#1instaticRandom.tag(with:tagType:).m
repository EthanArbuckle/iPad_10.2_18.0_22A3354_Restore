@implementation RandomTag#1instaticRandom.tag(with:tagType:)

- (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag)initWithTagRecord:()with:tagType: assetManager:interestToken:
{
  return (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag *)sub_1BB5BC48C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (id)initForTestingWithTagType:()with:tagType: identifier:name:
{
  return sub_1BB5BC2D4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(_QWORD))_s9RandomTagCMa, (SEL *)&selRef_initForTestingWithTagType_identifier_name_);
}

- (id)initForTestingWithTagType:()with:tagType: identifier:name:umcCanonicalID:
{
  return sub_1BB5BC624((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (id)initChannelForTestingWithIdentifier:()with:tagType: name:defaultSection:publisherAuthorizationURL:publisherVerificationURL:
{
  return sub_1BB5BC860((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (id)initChannelForTestingWithIdentifier:()with:tagType: name:publisherPaidBundlePurchaseIDs:
{
  return sub_1BB5BCA9C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag)initWithData:()with:tagType: context:
{
  return (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag *)sub_1BB5BCC18((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag)initWithTagMetadata:()with:tagType: assetManager:isSports:
{
  return (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag *)sub_1BB5BCCA8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag)initWithTagType:()with:tagType: identifier:name:
{
  return (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag *)sub_1BB5BC2D4((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(_QWORD))_s9RandomTagCMa, (SEL *)&selRef_initWithTagType_identifier_name_);
}

- (id)initChannelFromNotificationWithIdentifier:()with:tagType: name:nameImageAssetHandle:nameImageMaskAssetHandle:
{
  return sub_1BB5BCEE8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, a6, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag)init
{
  return (_TtCZFE8NewsFeedV13TeaFoundation6Random3tagFT4withSS7tagTypeVSo9FCTagType_CSo5FCTagL_9RandomTag *)sub_1BB5BCFA0(self, (uint64_t)a2, (uint64_t (*)(_QWORD))_s9RandomTagCMa);
}

- (id)currentIssueIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v2 = sub_1BB86C8E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA6EA07C();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1BB87CE70;
  v7 = a1;
  sub_1BB86C8D4();
  v8 = sub_1BB86C8C8();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v6 + 32) = v8;
  *(_QWORD *)(v6 + 40) = v10;

  v11 = (void *)sub_1BB872D9C();
  swift_bridgeObjectRelease();
  return v11;
}

@end
