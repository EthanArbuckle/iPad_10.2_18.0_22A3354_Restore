@implementation MapsSyncBaseItem

+ (OS_dispatch_queue)_queue
{
  return (OS_dispatch_queue *)sub_1A41D074C((uint64_t)a1, (uint64_t)a2, &qword_1ED1AA398, (id *)&qword_1ED1ACB00);
}

+ (OS_dispatch_queue)_callbackQueue
{
  return (OS_dispatch_queue *)sub_1A41D074C((uint64_t)a1, (uint64_t)a2, &qword_1EE70D9C0, (id *)&qword_1EE713160);
}

- (NSUUID)_identifier
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  sub_1A410356C((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1ED1ABCE0);
  v7 = sub_1A423BFE4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A423BFC0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (void)set_identifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8MapsSync16MapsSyncBaseItem *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A423BFCC();
    v8 = sub_1A423BFE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1A423BFE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  v11 = self;
  sub_1A4191184((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (NSDate)_createTime
{
  return (NSDate *)sub_1A41D098C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__createTime);
}

- (void)set_createTime:(id)a3
{
  sub_1A41D0A58((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__createTime);
}

- (NSDate)_modificationTime
{
  return (NSDate *)sub_1A41D098C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__modificationTime);
}

- (void)set_modificationTime:(id)a3
{
  sub_1A41D0A58((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__modificationTime);
}

- (int64_t)_positionIndex
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__positionIndex);
}

- (void)set_positionIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__positionIndex) = (Class)a3;
}

- (NSManagedObjectContext)_readContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext));
}

- (void)set_readContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext) = (Class)a3;
  v3 = a3;

}

- (_TtC8MapsSync16MapsSyncBaseItem)initWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC8MapsSync16MapsSyncBaseItem *)sub_1A41D033C(a3);
}

- (id)copyWithZone:(void *)a3
{
  _TtC8MapsSync16MapsSyncBaseItem *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1A41CFEE4((uint64_t)v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A423C7AC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_TtC8MapsSync16MapsSyncBaseItem)init
{
  return -[MapsSyncBaseItem initWithObject:](self, sel_initWithObject_, 0);
}

- (NSString)description
{
  _TtC8MapsSync16MapsSyncBaseItem *v2;
  void *v3;

  v2 = self;
  sub_1A41D0CDC();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isDuplicateOfOther:(id)a3
{
  id v4;
  _TtC8MapsSync16MapsSyncBaseItem *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1A41CD5F4((uint64_t)v4);

  return self & 1;
}

- (NSUUID)identifier
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1ABCE0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier;
  swift_beginAccess();
  sub_1A410356C((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1ED1ABCE0);
  v7 = sub_1A423BFE4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A423BFC0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (NSDate)createTime
{
  return (NSDate *)sub_1A41D1220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__createTime);
}

- (NSDate)modificationTime
{
  return (NSDate *)sub_1A41D1220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__modificationTime);
}

- (int64_t)positionIndex
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__positionIndex);
}

- (void)executeOnFirstSave:(id)a3
{
  id v4;
  _TtC8MapsSync16MapsSyncBaseItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A41D0144(v4);

}

- (void)setReadContextWithContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__readContext) = (Class)a3;
  v3 = a3;

}

- (void)persistObject:(id)a3 saveContext:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  _TtC8MapsSync16MapsSyncBaseItem *v10;

  v5 = a4;
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_1A41D45C0(v9, v5, v10, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)addEditWithBlock:(id)a3
{
  sub_1A41D1478(self, (int)a2, a3, (uint64_t)&unk_1E4BB5C20, (uint64_t)sub_1A40E7534, (void (*)(uint64_t, uint64_t))sub_1A41CFDB0);
}

- (void)commitEditsWithCompletion:(id)a3
{
  sub_1A41D1478(self, (int)a2, a3, (uint64_t)&unk_1E4BB5BF8, (uint64_t)sub_1A41D5A30, (void (*)(uint64_t, uint64_t))sub_1A41CDA4C);
}

- (id)performEditsWithoutSavingWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8MapsSync16MapsSyncBaseItem *v6;
  void *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = (void *)sub_1A41CDC68((uint64_t)sub_1A41D5A30, v5);

  swift_release();
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync16MapsSyncBaseItem *v4;
  _TtC8MapsSync16MapsSyncBaseItem *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A41D23DC((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (void)deleteWithCompletion:(id)a3
{
  void *v4;
  _TtC8MapsSync16MapsSyncBaseItem *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1A41D52AC(v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (Class)managedObjectClass
{
  return (Class)objc_opt_self();
}

- (id)mutableObject:(id)a3
{
  id v4;
  _TtC8MapsSync16MapsSyncBaseItem *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1A41CE890(v4);

  return v6;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4;
  _TtC8MapsSync16MapsSyncBaseItem *v5;

  v4 = a3;
  v5 = self;
  sub_1A41CF8C8(v4);

}

- (id)callCleanInObjc:(id)a3
{
  _TtC8MapsSync16MapsSyncBaseItem *v4;
  id v5;
  void *v6;

  sub_1A423C14C();
  v4 = self;
  v5 = sub_1A41CEA34();

  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_1A423BEB8();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)validate
{
  _TtC8MapsSync16MapsSyncBaseItem *v2;
  id v3;
  void *v4;

  v2 = self;
  if (!-[MapsSyncBaseItem respondsToSelector:](v2, sel_respondsToSelector_, sub_1A423C014()))
  {

    goto LABEL_5;
  }
  v3 = sub_1A41CEA34();

  if (!v3)
  {
LABEL_5:
    v4 = 0;
    return v4;
  }
  v4 = (void *)sub_1A423BEB8();

  return v4;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__identifier, (uint64_t *)&unk_1ED1ABCE0);
  v3 = (char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__createTime;
  v4 = sub_1A423BF9C();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8MapsSync16MapsSyncBaseItem__modificationTime, v4);
  swift_bridgeObjectRelease();

}

@end
