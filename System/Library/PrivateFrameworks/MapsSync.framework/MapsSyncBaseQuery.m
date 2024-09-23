@implementation MapsSyncBaseQuery

- (_TtP8MapsSync30MapsSyncDataQueryMergeDelegate_)mergeDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mergeDelegate;
  swift_beginAccess();
  return (_TtP8MapsSync30MapsSyncDataQueryMergeDelegate_ *)(id)MEMORY[0x1A859C108](v2);
}

- (void)setMergeDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtP8MapsSync21MapsSyncQueryProtocol_)genericQuery
{
  return (_TtP8MapsSync21MapsSyncQueryProtocol_ *)(id)swift_unknownObjectRetain();
}

- (void)setGenericQuery:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_genericQuery) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtP8MapsSync25MapsSyncDataQueryDelegate_)delegate
{
  return (_TtP8MapsSync25MapsSyncDataQueryDelegate_ *)(id)MEMORY[0x1A859C108]((char *)self+ OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_predicate));
}

- (void)setPredicate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_predicate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_predicate) = (Class)a3;
  v3 = a3;

}

- (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate)mapsSyncFetchedResultsControllerDelegate
{
  return (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate);
}

- (void)setMapsSyncFetchedResultsControllerDelegate:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate) = (Class)a3;
  v3 = a3;

}

- (_TtC8MapsSync17MapsSyncBaseQuery)initWithQueryDelegate:(id)a3 predicate:(id)a4
{
  id v6;

  swift_unknownObjectRetain();
  v6 = a4;
  return (_TtC8MapsSync17MapsSyncBaseQuery *)sub_1A4162018((uint64_t)a3, a4);
}

- (void)completeInit
{
  uint64_t v3;
  void *v4;
  _TtC8MapsSync17MapsSyncBaseQuery *v5;

  v3 = OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitComplete) = 1;
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), sel_unlock);

}

- (BOOL)isInitComplete
{
  uint64_t v3;
  void *v4;
  _TtC8MapsSync17MapsSyncBaseQuery *v5;

  v3 = OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitCompleteLock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  LOBYTE(v4) = *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery__isInitComplete);
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), sel_unlock);

  return (char)v4;
}

- (void)preFetchHook:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *);
  _TtC8MapsSync17MapsSyncBaseQuery *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);

}

+ (NSArray)additionalNotificationTypes
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB680);
  return (NSArray *)(id)sub_1A423C1B8();
}

+ (OS_os_log)signpostLog
{
  sub_1A40D19C0(0, (unint64_t *)&qword_1ED1ACAA0);
  return (OS_os_log *)(id)sub_1A423C464();
}

- (BOOL)isReady
{
  _TtC8MapsSync17MapsSyncBaseQuery *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A4162484();

  return v3 & 1;
}

- (id)mergeDuplicateObjectsWithDuplicates:(id)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  _TtC8MapsSync17MapsSyncBaseQuery *v7;
  void *v8;
  id v9;

  type metadata accessor for MapsSyncBaseItem();
  sub_1A423C1C4();
  v4 = (char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mergeDelegate;
  swift_beginAccess();
  v5 = MEMORY[0x1A859C108](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = self;
    v8 = (void *)sub_1A423C1B8();
    v9 = objc_msgSend(v6, sel_mergeDuplicateObjectsWithQuery_duplicates_, v7, v8);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    return v9;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

- (void)fetchCountWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC8MapsSync17MapsSyncBaseQuery *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1A4167954(a3, v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)fetchBaseContents:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC8MapsSync17MapsSyncBaseQuery *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = sub_1A4168D64;
  v6[3] = v5;
  v7 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A4168DEC, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchBaseContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC8MapsSync17MapsSyncBaseQuery *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_1A41681A8;
  v8[3] = v7;
  v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A4168DEC, v8, a3);

  swift_release();
  swift_release();
}

- (void)fetchQueryBaseContents:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC8MapsSync17MapsSyncBaseQuery *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = sub_1A4168D5C;
  v6[3] = v5;
  v7 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A4168DF0, v6, 0);

  swift_release();
  swift_release();
}

- (void)fetchQueryBaseContentsWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC8MapsSync17MapsSyncBaseQuery *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = sub_1A4168188;
  v8[3] = v7;
  v9 = a3;
  v10 = self;
  swift_retain();
  sub_1A4162A48((void (*)(_QWORD, _QWORD))sub_1A4168DF0, v8, a3);

  swift_release();
  swift_release();
}

- (void)reloadContentsWithCompletion:(id)a3 queue:(id)a4
{
  void *v6;
  _QWORD *v7;
  id v8;
  _TtC8MapsSync17MapsSyncBaseQuery *v9;

  v6 = _Block_copy(a3);
  if (v6)
  {
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = v6;
    v6 = sub_1A4168168;
  }
  else
  {
    v7 = 0;
  }
  v8 = a4;
  v9 = self;
  sub_1A4162A48((void (*)(_QWORD, _QWORD))v6, v7, a4);
  sub_1A4111284((uint64_t)v6);

}

- (void)deleteAllObjectsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8MapsSync17MapsSyncBaseQuery *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A4162E78((uint64_t)sub_1A411127C, v5);

  swift_release();
}

- (void)watchItemsMatchingPredicate:(id)a3
{
  void *v3;
  id v6;
  _TtC8MapsSync17MapsSyncBaseQuery *v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate);
  if (v3)
  {
    v6 = a3;
    v7 = self;
    v8 = v3;
    sub_1A4163698(a3);

  }
}

- (void)queryIsReady
{
  void *v3;
  void *v4;
  _TtC8MapsSync17MapsSyncBaseQuery *v5;

  v3 = (void *)MEMORY[0x1A859C108]((char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate, a2);
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, sel_respondsToSelector_, sel_queryIsReadyWithQuery_) & 1) != 0)
    {
      v5 = self;
      objc_msgSend(v4, sel_queryIsReadyWithQuery_, v5);

    }
    swift_unknownObjectRelease();
  }
}

- (void)queryContentsDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8MapsSync17MapsSyncBaseQuery *v8;
  uint64_t v9;

  v4 = sub_1A423BE88();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A423BE58();
  v8 = self;
  sub_1A4162FF0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (uint64_t)queryContextDidChangeWithNotification:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1A423BE88();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A423BE58();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

- (void)queryContentsWillChangeWithNotification:(id)a3
{
  sub_1A416647C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_queryContentsWillChangeWithQuery_);
}

- (void)queryContentsDidChangeObjectWithNotification:(id)a3 object:(id)a4 indexPath:(id)a5 changeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _TtC8MapsSync17MapsSyncBaseQuery *v26;
  uint64_t v27;
  uint64_t v28;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AAF60);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v27 - v16;
  v28 = sub_1A423BE88();
  v18 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A423BE58();
  if (a5)
  {
    sub_1A423BFFC();
    v21 = sub_1A423C008();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v17, 0, 1, v21);
  }
  else
  {
    v22 = sub_1A423C008();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v17, 1, 1, v22);
  }
  if (a7)
  {
    sub_1A423BFFC();
    v23 = sub_1A423C008();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 0, 1, v23);
  }
  else
  {
    v24 = sub_1A423C008();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v15, 1, 1, v24);
  }
  v25 = a4;
  v26 = self;
  sub_1A41632A0((uint64_t)v26, (uint64_t)v25, (uint64_t)v17, a6, (uint64_t)v15);

  sub_1A410251C((uint64_t)v15, &qword_1ED1AAF60);
  sub_1A410251C((uint64_t)v17, &qword_1ED1AAF60);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v28);
}

- (void)queryContentsDidLoadWithNotification:(id)a3
{
  sub_1A416647C((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_queryContentsDidLoadWithQuery_);
}

- (void)fetchedResultsWillChangeWithControllerDelegate:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  _TtC8MapsSync17MapsSyncBaseQuery *v8;

  v5 = (void *)MEMORY[0x1A859C108]((char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate, a2);
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, sel_respondsToSelector_, sel_queryContentsWillChangeWithQuery_) & 1) != 0)
    {
      v7 = a3;
      v8 = self;
      objc_msgSend(v6, sel_queryContentsWillChangeWithQuery_, v8);

    }
    swift_unknownObjectRelease();
  }
}

- (void)fetchedResultsDidChangeObjectWithControllerDelegate:(id)a3 object:(id)a4 indexPath:(id)a5 changeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _TtC8MapsSync17MapsSyncBaseQuery *v39;
  id v40;
  id v41;
  _TtC8MapsSync17MapsSyncBaseQuery *v42;
  uint64_t v43;
  uint64_t v44;
  _TtC8MapsSync17MapsSyncBaseQuery *v45;
  id v46;
  uint64_t v47;
  id v48;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AAF60);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v14);
  v19 = (char *)&v43 - v18;
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (char *)&v43 - v21;
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v43 - v23;
  if (a5)
  {
    sub_1A423BFFC();
    v25 = sub_1A423C008();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 0, 1, v25);
  }
  else
  {
    v26 = sub_1A423C008();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v24, 1, 1, v26);
  }
  if (a7)
  {
    sub_1A423BFFC();
    v27 = sub_1A423C008();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v22, 0, 1, v27);
  }
  else
  {
    v28 = sub_1A423C008();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v22, 1, 1, v28);
  }
  v29 = (void *)MEMORY[0x1A859C108]((char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate);
  if (!v29)
    goto LABEL_17;
  v30 = v29;
  if ((objc_msgSend(v29, sel_respondsToSelector_, sel_queryContentsDidChangeObjectWithQuery_object_indexPath_changeType_newIndexPath_) & 1) == 0)
  {
    swift_unknownObjectRelease();
LABEL_17:
    sub_1A410251C((uint64_t)v22, &qword_1ED1AAF60);
    sub_1A410251C((uint64_t)v24, &qword_1ED1AAF60);
    return;
  }
  v48 = a4;
  v47 = sub_1A4167E18(a6);
  if ((v31 & 1) == 0)
  {
    sub_1A41680FC((uint64_t)v24, (uint64_t)v19);
    v32 = sub_1A423C008();
    v44 = *(_QWORD *)(v32 - 8);
    v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
    v34 = v33(v19, 1, v32);
    v46 = a3;
    v48 = v48;
    v45 = self;
    v35 = 0;
    if (v34 != 1)
    {
      v35 = (void *)sub_1A423BFF0();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v32);
    }
    sub_1A41680FC((uint64_t)v22, (uint64_t)v16);
    if (v33(v16, 1, v32) == 1)
    {
      v36 = 0;
    }
    else
    {
      v36 = (void *)sub_1A423BFF0();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v16, v32);
    }
    v37 = v46;
    v38 = v48;
    v39 = v45;
    objc_msgSend(v30, sel_queryContentsDidChangeObjectWithQuery_object_indexPath_changeType_newIndexPath_, v45, v48, v35, v47, v36);

    swift_unknownObjectRelease();
    goto LABEL_17;
  }
  v40 = a3;
  v41 = v48;
  v42 = self;
  swift_unknownObjectRelease();
  __break(1u);
}

- (id)findDuplicates:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AC420);
  return (id)sub_1A423C1B8();
}

- (_TtC8MapsSync17MapsSyncBaseQuery)init
{
  _TtC8MapsSync17MapsSyncBaseQuery *result;

  result = (_TtC8MapsSync17MapsSyncBaseQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A41112A4((uint64_t)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mergeDelegate);
  swift_unknownObjectRelease();
  sub_1A41112A4((uint64_t)self + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8MapsSync17MapsSyncBaseQuery_mapsSyncFetchedResultsControllerDelegate));

  swift_release();
}

@end
