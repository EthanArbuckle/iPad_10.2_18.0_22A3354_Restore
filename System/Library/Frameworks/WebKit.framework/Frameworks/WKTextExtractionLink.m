@implementation WKTextExtractionLink

- (NSURL)url
{
  return (NSURL *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                          + OBJC_IVAR___WKTextExtractionLink_url));
}

- (_NSRange)range
{
  char *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR___WKTextExtractionLink_range;
  v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionLink_range);
  v4 = *((_QWORD *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (WKTextExtractionLink)initWithURL:(id)a3 range:(_NSRange)a4
{
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionLink_url) = (Class)a3;
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR___WKTextExtractionLink_range) = a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WKTextExtractionLink();
  v5 = a3;
  return -[WKTextExtractionLink init](&v7, sel_init);
}

- (WKTextExtractionLink)init
{
  WKTextExtractionLink *result;

  result = (WKTextExtractionLink *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
