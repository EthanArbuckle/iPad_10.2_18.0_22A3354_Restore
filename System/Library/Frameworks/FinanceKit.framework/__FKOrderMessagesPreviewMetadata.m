@implementation __FKOrderMessagesPreviewMetadata

- (__FKOrderMessagesPreviewMetadataImage)image
{
  return (__FKOrderMessagesPreviewMetadataImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_image));
}

- (CGColor)backgroundColor
{
  return (CGColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_backgroundColor));
}

- (__FKOrderMessagesPreviewMetadataText)primaryText
{
  return (__FKOrderMessagesPreviewMetadataText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_primaryText));
}

- (__FKOrderMessagesPreviewMetadataText)secondaryText
{
  return (__FKOrderMessagesPreviewMetadataText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_secondaryText));
}

- (__FKOrderMessagesPreviewMetadataText)tertiaryText
{
  return (__FKOrderMessagesPreviewMetadataText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR_____FKOrderMessagesPreviewMetadata_tertiaryText));
}

- (__FKOrderMessagesPreviewMetadata)initWithOrderData:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __FKOrderMessagesPreviewMetadata *v8;

  v4 = a3;
  v5 = sub_23361D3C4();
  v7 = v6;

  v8 = (__FKOrderMessagesPreviewMetadata *)sub_23328B190();
  sub_23316BEA4(v5, v7);
  return v8;
}

- (__FKOrderMessagesPreviewMetadata)initWithOrderData:(id)a3 workingDirectory:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;

  v7 = sub_23361D340();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  v12 = sub_23361D3C4();
  v14 = v13;

  sub_23361D2D4();
  return (__FKOrderMessagesPreviewMetadata *)OrderMessagesPreviewMetadata.init(orderData:workingDirectory:)(v12, v14, (uint64_t)v9);
}

+ (id)createWalletDeepLinkForExistingOrderAt:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t);
  void *v12;
  uint64_t v13;

  v3 = sub_23361D340();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254248700);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23361D2D4();
  if (qword_254244AD0 != -1)
    swift_once();
  sub_23328A3E8((uint64_t)v6, (uint64_t)off_254245198, (uint64_t)&type metadata for DeviceInfo, (uint64_t)&protocol witness table for DeviceInfo, (uint64_t)v9);
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v6, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
    return 0;
  v12 = (void *)sub_23361D268();
  v10(v9, v3);
  return v12;
}

- (__FKOrderMessagesPreviewMetadata)init
{
  __FKOrderMessagesPreviewMetadata *result;

  result = (__FKOrderMessagesPreviewMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
