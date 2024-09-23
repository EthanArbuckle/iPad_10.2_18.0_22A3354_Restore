@implementation MapsSyncObject

- (BOOL)lazyLoad
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject_lazyLoad);
}

- (_TtC8MapsSync14MapsSyncObject)init
{
  if (qword_1ED1AB880 != -1)
    swift_once();
  return -[MapsSyncObject initWithObject:store:lazyLoad:](self, sel_initWithObject_store_lazyLoad_, 0, qword_1ED1AB9F0, 0);
}

- (_TtC8MapsSync14MapsSyncObject)initWithStore:(id)a3
{
  return -[MapsSyncObject initWithObject:store:lazyLoad:](self, sel_initWithObject_store_lazyLoad_, 0, a3, 0);
}

- (_TtC8MapsSync14MapsSyncObject)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  id v8;

  v8 = a3;
  return (_TtC8MapsSync14MapsSyncObject *)sub_1A4185C24(a3, a4, a5);
}

- (NSLock)propertyLock
{
  return (NSLock *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock));
}

- (void)flushChanges
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  *v2 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
}

- (id)onDeleteWithManagedObject:(id)a3 context:(id)a4
{
  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  return (id)sub_1A423C1B8();
}

- (NSManagedObjectID)managedId
{
  void *v2;
  _TtC8MapsSync14MapsSyncObject *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  objc_msgSend(v2, sel_unlock);

  return (NSManagedObjectID *)v4;
}

- (void)setManagedId:(id)a3
{
  void *v5;
  id v6;
  _TtC8MapsSync14MapsSyncObject *v7;
  void *v8;
  id v9;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v6 = a3;
  v7 = self;
  objc_msgSend(v5, sel_lock);
  v8 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId) = (Class)a3;
  v9 = v6;

  objc_msgSend(v5, sel_unlock);
}

- (BOOL)isStored
{
  void *v2;
  _TtC8MapsSync14MapsSyncObject *v3;
  void *v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__managedObjectId);
  v5 = v4;
  objc_msgSend(v2, sel_unlock);

  if (v4)
  return v4 != 0;
}

- (_TtC8MapsSync13MapsSyncStore)store
{
  return (_TtC8MapsSync13MapsSyncStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__store));
}

- (BOOL)hasChanges
{
  void *v2;
  _TtC8MapsSync14MapsSyncObject *v3;
  char *v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  v4 = (char *)v3 + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks;
  swift_beginAccess();
  LOBYTE(v4) = *(_QWORD *)(*(_QWORD *)v4 + 16) != 0;
  objc_msgSend(v2, sel_unlock);

  return (char)v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)sub_1A4186668((char *)self, (uint64_t)a2, (uint64_t *)&unk_1ED1ABCE0, &OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB0930]);
}

- (void)setIdentifier:(id)a3
{
  sub_1A418689C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_1ED1ABCE0, (void (*)(uint64_t))MEMORY[0x1E0CB0958], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], (void (*)(char *, uint64_t))sub_1A4184BA8);
}

- (NSDate)createTime
{
  return (NSDate *)sub_1A4186668((char *)self, (uint64_t)a2, &qword_1ED1AB5D0, &OBJC_IVAR____TtC8MapsSync14MapsSyncObject__createTime, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (void)setCreateTime:(id)a3
{
  sub_1A418689C(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED1AB5D0, (void (*)(uint64_t))MEMORY[0x1E0CB07E8], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], (void (*)(char *, uint64_t))sub_1A4184D98);
}

- (NSDate)modificationTime
{
  return (NSDate *)sub_1A4186668((char *)self, (uint64_t)a2, &qword_1ED1AB5D0, &OBJC_IVAR____TtC8MapsSync14MapsSyncObject__modificationTime, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (void)setModificationTime:(id)a3
{
  sub_1A418689C(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED1AB5D0, (void (*)(uint64_t))MEMORY[0x1E0CB07E8], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], (void (*)(char *, uint64_t))sub_1A4185190);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync14MapsSyncObject *v4;
  _TtC8MapsSync14MapsSyncObject *v5;
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
  v6 = sub_1A4186B40((uint64_t)v8);

  sub_1A410251C((uint64_t)v8, (uint64_t *)&unk_1ED1AC4F0);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC8MapsSync14MapsSyncObject *v2;
  id v3;

  v2 = self;
  v3 = sub_1A4186DA8();

  return (int64_t)v3;
}

- (void)withPropertyLock:(id)a3
{
  void (**v4)(void *, void *);
  void *v5;
  _TtC8MapsSync14MapsSyncObject *v6;

  v4 = (void (**)(void *, void *))_Block_copy(a3);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v6 = self;
  objc_msgSend(v5, sel_lock);
  v4[2](v4, v5);
  objc_msgSend(v5, sel_unlock);
  _Block_release(v4);

}

- (void)addEdit:(id)a3 :(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8MapsSync14MapsSyncObject *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1A41851B4((uint64_t)v8, (uint64_t)sub_1A40E7534, v7);

  swift_release();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5;
  _TtC8MapsSync14MapsSyncObject *v6;

  v5 = a3;
  v6 = self;
  sub_1A4187884(v5);

}

+ (Class)managedClass
{
  return (Class)objc_opt_self();
}

- (id)getManagedObjectWithContext:(id)a3
{
  void *v4;
  id v5;
  _TtC8MapsSync14MapsSyncObject *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v5 = a3;
  v6 = self;
  objc_msgSend(v4, sel_lock);
  v7 = sub_1A41852F4((uint64_t)v4, v5);
  objc_msgSend(v4, sel_unlock);

  return v7;
}

- (id)getManagedObjectOnContextWithLock:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _TtC8MapsSync14MapsSyncObject *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1A41852F4((uint64_t)v6, v7);

  return v9;
}

- (void)performEditsWithManagedObject:(id)a3
{
  void *v4;
  id v5;
  _TtC8MapsSync14MapsSyncObject *v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v5 = a3;
  v6 = self;
  objc_msgSend(v4, sel_lock);
  sub_1A41855A0((uint64_t)v4, (uint64_t)v5);
  objc_msgSend(v4, sel_unlock);

}

- (void)performEditsOnContextWithLock:(id)a3 managedObject:(id)a4
{
  id v6;
  id v7;
  _TtC8MapsSync14MapsSyncObject *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A41855A0((uint64_t)v6, (uint64_t)v7);

}

- (NSString)description
{
  _TtC8MapsSync14MapsSyncObject *v2;
  void *v3;

  v2 = self;
  sub_1A41871F8();

  v3 = (void *)sub_1A423C140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__identifier, (uint64_t *)&unk_1ED1ABCE0);
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__createTime, &qword_1ED1AB5D0);
  sub_1A410251C((uint64_t)self + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__modificationTime, &qword_1ED1AB5D0);
}

+ (id)mergeWithDuplicates:(id)a3
{
  uint64_t v3;
  void *v4;

  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  v3 = sub_1A423C1C4();
  v4 = (void *)sub_1A41BED4C(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)strippedMapItemWith:(id)a3
{
  return a3;
}

+ (id)findDuplicatesWithContext:(id)a3
{
  id v4;
  void *v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  sub_1A41BC210(v4);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB910);
  v5 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return v5;
}

@end
