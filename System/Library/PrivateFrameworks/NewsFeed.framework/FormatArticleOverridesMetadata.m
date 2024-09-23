@implementation FormatArticleOverridesMetadata

- (NSString)title
{
  return (NSString *)sub_1BA627B48((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_title);
}

- (NSString)shortExcerpt
{
  return (NSString *)sub_1BA627B48((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_shortExcerpt);
}

- (NSURL)routeURL
{
  return (NSURL *)sub_1BB7CC898((uint64_t)self, (uint64_t)a2, (unint64_t *)&qword_1ED3D2E70, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8], &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_routeURL, MEMORY[0x1E0CAFE38]);
}

- (FCHeadlineThumbnailMetadata)formatThumbnail
{
  return (FCHeadlineThumbnailMetadata *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_formatThumbnail));
}

- (NSDate)displayDate
{
  return (NSDate *)sub_1BB7CC898((uint64_t)self, (uint64_t)a2, (unint64_t *)&qword_1ED3B0540, (void (*)(uint64_t))MEMORY[0x1E0CB0870], &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_displayDate, MEMORY[0x1E0CB06B8]);
}

- (NSString)storyType
{
  return (NSString *)sub_1BA627B48((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_storyType);
}

- (_TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata)init
{
  _TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata *result;

  result = (_TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BA502AD0((uint64_t)self+ OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_displayDate, (unint64_t *)&qword_1ED3B0540, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_formatThumbnail));
  sub_1BA502AD0((uint64_t)self+ OBJC_IVAR____TtC8NewsFeedP33_956832B3628B6135B83D78176B8866FE30FormatArticleOverridesMetadata_routeURL, (unint64_t *)&qword_1ED3D2E70, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
}

@end
