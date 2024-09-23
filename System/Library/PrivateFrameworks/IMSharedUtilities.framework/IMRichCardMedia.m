@implementation IMRichCardMedia

- (NSString)mediaUrl
{
  return (NSString *)sub_19E325D9C();
}

- (NSString)mediaContentType
{
  return (NSString *)sub_19E325D9C();
}

- (NSNumber)mediaFileSize
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMRichCardMedia_mediaFileSize));
}

- (NSString)thumbnailUrl
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCardMedia_thumbnailUrl);
}

- (NSString)thumbnailContentType
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCardMedia_thumbnailContentType);
}

- (NSNumber)thumbnailFileSize
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMRichCardMedia_thumbnailFileSize));
}

- (int64_t)height
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_height);
}

- (NSString)contentDescription
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCardMedia_contentDescription);
}

- (IMRichCardMedia)initWithMediaUrl:(id)a3 mediaContentType:(id)a4 mediaFileSize:(id)a5 thumbnailUrl:(id)a6 thumbnailContentType:(id)a7 thumbnailFileSize:(id)a8 height:(int64_t)a9 contentDescription:(id)a10
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  objc_class *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  id v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  objc_super v39;

  v14 = sub_19E36F888();
  v36 = v15;
  v37 = v14;
  v16 = sub_19E36F888();
  v18 = v17;
  if (a6)
  {
    v19 = sub_19E36F888();
    v21 = v20;
    v22 = a10;
    if (a7)
      goto LABEL_3;
LABEL_6:
    v23 = 0;
    v25 = (objc_class *)a9;
    if (v22)
      goto LABEL_4;
LABEL_7:
    v26 = 0;
    v27 = 0;
    goto LABEL_8;
  }
  v19 = 0;
  v21 = 0;
  v22 = a10;
  if (!a7)
    goto LABEL_6;
LABEL_3:
  v23 = sub_19E36F888();
  a7 = v24;
  v25 = (objc_class *)a9;
  if (!v22)
    goto LABEL_7;
LABEL_4:
  v26 = sub_19E36F888();
LABEL_8:
  v28 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_mediaUrl);
  *v28 = v37;
  v28[1] = v36;
  v29 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_mediaContentType);
  *v29 = v16;
  v29[1] = v18;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_mediaFileSize) = (Class)a5;
  v30 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_thumbnailUrl);
  *v30 = v19;
  v30[1] = v21;
  v31 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_thumbnailContentType);
  *v31 = v23;
  v31[1] = (uint64_t)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_thumbnailFileSize) = (Class)a8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_height) = v25;
  v32 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_contentDescription);
  *v32 = v26;
  v32[1] = v27;
  v39.receiver = self;
  v39.super_class = (Class)IMRichCardMedia;
  v33 = a5;
  v34 = a8;
  return -[IMRichCardMedia init](&v39, sel_init);
}

- (IMRichCardMedia)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMRichCardMedia *)IMRichCardMedia.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMRichCardMedia *v2;
  void *v3;

  v2 = self;
  sub_19E351834();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  IMRichCardMedia *v4;
  IMRichCardMedia *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = IMRichCardMedia.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCardMedia)init
{
  IMRichCardMedia *result;

  result = (IMRichCardMedia *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
