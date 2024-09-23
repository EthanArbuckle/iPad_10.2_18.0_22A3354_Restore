@implementation __FKOrderMessagesPreviewMetadataImage

- (NSData)data
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_data);
  v3 = *(_QWORD *)&self->data[OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_data];
  sub_2331D1374(v2, v3);
  v4 = (void *)sub_23361D3AC();
  sub_23316BEA4(v2, v3);
  return (NSData *)v4;
}

- (unsigned)kind
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_kind);
}

- (__FKOrderMessagesPreviewMetadataImage)init
{
  __FKOrderMessagesPreviewMetadataImage *result;

  result = (__FKOrderMessagesPreviewMetadataImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23316BEA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_data), *(_QWORD *)&self->data[OBJC_IVAR_____FKOrderMessagesPreviewMetadataImage_data]);
}

@end
