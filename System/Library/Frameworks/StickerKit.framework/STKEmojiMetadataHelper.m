@implementation STKEmojiMetadataHelper

+ (id)metadataDictionaryFromData:(id)a3
{
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (uint64_t)a3;
  if (a3)
  {
    v4 = a3;
    v3 = sub_234715A08();
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  v7 = _s10StickerKit19EmojiMetadataHelperC18metadataDictionary8fromDataSDySSypGSg10Foundation0I0VSg_tFZ_0(v3, v6);
  sub_2345B5CF0(v3, v6);
  if (v7)
  {
    v8 = (void *)sub_2347176B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (STKEmojiMetadataHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiMetadataHelper();
  return -[STKEmojiMetadataHelper init](&v3, sel_init);
}

@end
