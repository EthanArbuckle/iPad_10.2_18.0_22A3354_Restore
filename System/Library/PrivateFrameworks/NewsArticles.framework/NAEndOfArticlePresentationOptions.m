@implementation NAEndOfArticlePresentationOptions

- (NAEndOfArticlePresentationOptions)initWithSuppressMoreFromSection:(BOOL)a3 suppressMoreToReadSection:(BOOL)a4 suppressMoreFromIssueSection:(BOOL)a5 suppressRelatedSection:(BOOL)a6 suppressRecommendedReadsSection:(int64_t)a7 articleBackgroundColor:(id)a8
{
  id v9;
  objc_super v11;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressMoreFromSection) = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressMoreToReadSection) = a4;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressMoreFromIssueSection) = a5;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressRelatedSection) = a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_suppressRecommendedReadsSection) = (Class)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NAEndOfArticlePresentationOptions_articleBackgroundColor) = (Class)a8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EndOfArticlePresentationOptions();
  v9 = a8;
  return -[NAEndOfArticlePresentationOptions init](&v11, sel_init);
}

- (NAEndOfArticlePresentationOptions)init
{
  NAEndOfArticlePresentationOptions *result;

  result = (NAEndOfArticlePresentationOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
