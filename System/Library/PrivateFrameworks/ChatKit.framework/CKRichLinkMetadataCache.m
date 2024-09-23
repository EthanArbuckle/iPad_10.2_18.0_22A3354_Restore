@implementation CKRichLinkMetadataCache

- (_TtC7ChatKit23CKRichLinkMetadataCache)init
{
  uint64_t v3;
  id v4;
  _TtC7ChatKit23CKRichLinkMetadataCache *v5;
  id v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC7ChatKit23CKRichLinkMetadataCache_metadataCache;
  v4 = objc_allocWithZone(MEMORY[0x1E0C99D38]);
  v5 = self;
  v6 = objc_msgSend(v4, sel_init);
  objc_msgSend(v6, sel_setCountLimit_, 10);
  *(Class *)((char *)&self->super.isa + v3) = (Class)v6;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CKRichLinkMetadataCache();
  return -[CKRichLinkMetadataCache init](&v8, sel_init);
}

- (void).cxx_destruct
{

}

@end
