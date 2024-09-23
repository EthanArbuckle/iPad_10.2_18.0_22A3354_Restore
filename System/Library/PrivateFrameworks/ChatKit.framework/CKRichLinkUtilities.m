@implementation CKRichLinkUtilities

+ (id)validURLsInString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  length = a4.length;
  location = a4.location;
  v6 = sub_18E768984();
  _s7ChatKit19CKRichLinkUtilitiesC17validURLsInString_7inRangeSayAA014CKDataDetectedD6ResultCGSS_So8_NSRangeVtFZ_0(v6, v7, location, length);
  swift_bridgeObjectRelease();
  type metadata accessor for CKDataDetectedLinkResult();
  v8 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC7ChatKit19CKRichLinkUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKRichLinkUtilities();
  return -[CKRichLinkUtilities init](&v3, sel_init);
}

@end
