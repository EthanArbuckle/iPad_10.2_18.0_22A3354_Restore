@implementation CKDataDetectedLinkResult

- (_NSRange)range
{
  char *v2;
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit24CKDataDetectedLinkResult_range;
  v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit24CKDataDetectedLinkResult_range);
  v4 = *((_QWORD *)v2 + 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSURL)url
{
  return (NSURL *)(id)sub_18E766164();
}

- (_TtC7ChatKit24CKDataDetectedLinkResult)init
{
  _TtC7ChatKit24CKDataDetectedLinkResult *result;

  result = (_TtC7ChatKit24CKDataDetectedLinkResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC7ChatKit24CKDataDetectedLinkResult_url;
  v3 = sub_18E7661A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
