@implementation TSEditorialItem

- (NSString)identifier
{
  return (NSString *)sub_1D64D8E80();
}

- (void)setIdentifier:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSEditorialItem_identifier);
}

- (NSString)title
{
  return (NSString *)sub_1D64D8E80();
}

- (void)setTitle:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSEditorialItem_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSEditorialItem_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSEditorialItem_subtitle);
}

- (NSString)subtitleColor
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSEditorialItem_subtitleColor);
}

- (void)setSubtitleColor:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSEditorialItem_subtitleColor);
}

- (NSArray)attributes
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26D68();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAttributes:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_1D6E26D80();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___TSEditorialItem_attributes);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSURL)actionURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  sub_1D5F53614();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___TSEditorialItem_actionURL;
  swift_beginAccess();
  sub_1D5FCC8F4((uint64_t)v6, (uint64_t)v5);
  v7 = sub_1D6E15BE4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D6E15B30();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setActionURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  TSEditorialItem *v11;
  uint64_t v12;

  sub_1D5F53614();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1D6E15B78();
    v8 = sub_1D6E15BE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1D6E15BE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___TSEditorialItem_actionURL;
  swift_beginAccess();
  v11 = self;
  sub_1D64D9610((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (UIImage)thumbnailImage
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TSEditorialItem_thumbnailImage);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setThumbnailImage:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TSEditorialItem_thumbnailImage);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (FCTagProviding)backingTag
{
  return (FCTagProviding *)sub_1D64D99A4();
}

- (void)setBackingTag:(id)a3
{
  sub_1D64D9A44((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSEditorialItem_backingTag);
}

- (FCHeadlineProviding)headline
{
  return (FCHeadlineProviding *)sub_1D64D99A4();
}

- (void)setHeadline:(id)a3
{
  sub_1D64D9A44((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSEditorialItem_headline);
}

- (TSEditorialItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColor:(id)a6 attributes:(id)a7 actionURL:(id)a8 thumbnailImage:(id)a9 backingTag:(id)a10 headline:(id)a11
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, _QWORD, uint64_t, uint64_t);
  id v33;
  uint64_t v34;
  id v35;
  TSEditorialItem *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  TSEditorialItem *v43;

  v43 = self;
  sub_1D5F53614();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1D6E26978();
  v19 = v18;
  v20 = sub_1D6E26978();
  v42 = v21;
  if (a5)
  {
    v22 = sub_1D6E26978();
    v40 = v23;
    v41 = v22;
    if (a6)
    {
LABEL_3:
      a6 = (id)sub_1D6E26978();
      v39 = v24;
      goto LABEL_6;
    }
  }
  else
  {
    v40 = 0;
    v41 = 0;
    if (a6)
      goto LABEL_3;
  }
  v39 = 0;
LABEL_6:
  v25 = sub_1D6E26D80();
  if (a8)
  {
    sub_1D6E15B78();
    v26 = sub_1D6E15BE4();
    v27 = *(_QWORD *)(v26 - 8);
    v38 = v25;
    v28 = a6;
    v29 = v20;
    v30 = v19;
    v31 = v17;
    v32 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v33 = a9;
    v32(v16, 0, 1, v26);
    v17 = v31;
    v19 = v30;
    v20 = v29;
    a6 = v28;
    v25 = v38;
  }
  else
  {
    v34 = sub_1D6E15BE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v16, 1, 1, v34);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v35 = a9;
  }
  v36 = (TSEditorialItem *)sub_1D64DA01C(v17, v19, v20, v42, v41, v40, (uint64_t)a6, v39, v25, (uint64_t)v16, a9, (uint64_t)a10, (uint64_t)a11);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v36;
}

- (TSEditorialItem)init
{
  TSEditorialItem *result;

  result = (TSEditorialItem *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1D60178E0((uint64_t)self + OBJC_IVAR___TSEditorialItem_actionURL);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
