@implementation ICThumbnailKey

+ (NSString)recentObjectId
{
  void *v2;

  if (qword_255019988 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)accountId
{
  return (NSString *)sub_218DFFF74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICThumbnailKey_accountId);
}

- (NSString)objectId
{
  return (NSString *)sub_218DFFF74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICThumbnailKey_objectId);
}

- (NSString)thumbnailId
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ICThumbnailKey)initWithAccountId:(id)a3 objectId:(id)a4 thumbnailId:(id)a5
{
  objc_class *ObjectType;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id *v15;
  uint64_t *v16;
  uint64_t v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  if (!a3)
  {
    v10 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  a3 = (id)sub_218E0C5D8();
  v10 = v9;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  a4 = (id)sub_218E0C5D8();
  v12 = v11;
LABEL_6:
  v13 = sub_218E0C5D8();
  v14 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICThumbnailKey_accountId);
  *v14 = a3;
  v14[1] = v10;
  v15 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICThumbnailKey_objectId);
  *v15 = a4;
  v15[1] = v12;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  *v16 = v13;
  v16[1] = v17;
  v19.receiver = self;
  v19.super_class = ObjectType;
  return -[ICThumbnailKey init](&v19, sel_init);
}

- (ICThumbnailKey)initWithAccountId:(id)a3 objectId:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    v10 = 0;
    return (ICThumbnailKey *)ThumbnailKey.init(accountId:objectId:)(v5, v7, v8, v10);
  }
  v5 = sub_218E0C5D8();
  v7 = v6;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_218E0C5D8();
  v10 = v9;
  return (ICThumbnailKey *)ThumbnailKey.init(accountId:objectId:)(v5, v7, v8, v10);
}

- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 scale:(double)a7 appearance:(unint64_t)a8 isRTL:(BOOL)a9 contentSizeCategory:(id)a10 hasBoldText:(BOOL)a11 hasButtonShapes:(BOOL)a12 hasDarkerSystemColors:(BOOL)a13 hasBorder:(BOOL)a14
{
  double height;
  double width;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  height = a6.height;
  width = a6.width;
  v18 = (uint64_t)a5;
  if (a4)
  {
    v20 = (void *)sub_218E0C5D8();
    v22 = v21;
    if (v18)
    {
LABEL_3:
      v18 = sub_218E0C5D8();
      v24 = v23;
      goto LABEL_6;
    }
  }
  else
  {
    v20 = 0;
    v22 = 0;
    if (a5)
      goto LABEL_3;
  }
  v24 = 0;
LABEL_6:
  if (a10)
  {
    v25 = sub_218E0C5D8();
    v27 = v26;
  }
  else
  {
    v25 = 0;
    v27 = 0;
  }
  return (ICThumbnailKey *)sub_218E03B84(a3, v20, v22, v18, v24, a8, v25, v27, width, height, a7, a11, a13, a14);
}

- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 scale:(double)a7 appearance:(unint64_t)a8
{
  double height;
  double width;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  height = a6.height;
  width = a6.width;
  if (!a4)
  {
    v14 = 0;
    v16 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v17 = 0;
    v19 = 0;
    return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(a3, width, height, a7, v14, v16, v17, v19, a8);
  }
  v14 = sub_218E0C5D8();
  v16 = v15;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v17 = sub_218E0C5D8();
  v19 = v18;
  return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(a3, width, height, a7, v14, v16, v17, v19, a8);
}

- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 traitCollection:(id)a7
{
  double height;
  double width;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  height = a6.height;
  width = a6.width;
  v10 = (uint64_t)a5;
  if (!a4)
  {
    v12 = 0;
    v14 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a3, width, height, v12, v14, v10, v16, a7);
  }
  v12 = sub_218E0C5D8();
  v14 = v13;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v10 = sub_218E0C5D8();
  v16 = v15;
  return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a3, width, height, v12, v14, v10, v16, a7);
}

- (NSString)description
{
  ICThumbnailKey *v2;
  void *v3;

  v2 = self;
  ThumbnailKey.description.getter();

  v3 = (void *)sub_218E0C5B4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  ICThumbnailKey *v4;
  ICThumbnailKey *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_218E0C668();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = ThumbnailKey.isEqual(_:)((uint64_t)v8);

  sub_218E028E8((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  ICThumbnailKey *v2;
  int64_t v3;

  v2 = self;
  v3 = ThumbnailKey.hash.getter();

  return v3;
}

- (id)copyWithZone:(void *)a3
{
  ICThumbnailKey *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  ThumbnailKey.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1Tm(v6, v6[3]);
  v4 = (void *)sub_218E0C77C();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (NSURL)containerUrl
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  ICThumbnailKey *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_218E0C50C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_218E012DC((uint64_t)v6);

  v8 = (void *)sub_218E0C4DC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (NSURL)descriptionUrl
{
  return (NSURL *)sub_218E01698(self, (uint64_t)a2, MEMORY[0x24BEE62E0]);
}

- (NSURL)imageUrl
{
  return (NSURL *)sub_218E01698(self, (uint64_t)a2, MEMORY[0x24BEE6278]);
}

- (ICThumbnailKey)init
{
  ICThumbnailKey *result;

  result = (ICThumbnailKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
