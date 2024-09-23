@implementation IMPersistentMenu

- (int64_t)level
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenu_level);
}

- (NSString)displayText
{
  void *v2;

  if (*(_QWORD *)&self->level[OBJC_IVAR___IMPersistentMenu_displayText])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSArray)items
{
  void *v2;

  type metadata accessor for IMPersistentMenuItem();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F954();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (IMPersistentMenu)initWithLevel:(int64_t)a3 displayText:(id)a4 items:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t *v11;
  objc_super v13;

  if (a4)
  {
    v7 = sub_19E36F888();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  type metadata accessor for IMPersistentMenuItem();
  v10 = (objc_class *)sub_19E36F960();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenu_level) = (Class)a3;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___IMPersistentMenu_displayText);
  *v11 = v7;
  v11[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenu_items) = v10;
  v13.receiver = self;
  v13.super_class = (Class)IMPersistentMenu;
  return -[IMPersistentMenu init](&v13, sel_init);
}

- (IMPersistentMenu)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMPersistentMenu *)IMPersistentMenu.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMPersistentMenu *v2;
  void *v3;

  v2 = self;
  sub_19E32560C();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

+ (BOOL)isEmptyStamped:(id)a3
{
  char v3;
  _OWORD v5[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  v3 = sub_19E325CAC((uint64_t)v5);
  sub_19E322284((uint64_t)v5);
  return v3 & 1;
}

+ (id)emptyStampProperty
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_19E247E74(&qword_1EE5019B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19E381BA0;
  *(_QWORD *)(inited + 32) = sub_19E36F888();
  *(_QWORD *)(inited + 40) = v3;
  v4 = sub_19E36F888();
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v5;
  sub_19E32D864(inited);
  v6 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v6;
}

- (IMPersistentMenu)init
{
  IMPersistentMenu *result;

  result = (IMPersistentMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
