@implementation MapsSyncFetchedResultsControllerDelegate

- (void)contextDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1A4163A84(v4);

}

- (void)remoteChangeWithNotification:(id)a3
{
  id v4;
  _TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1A4168780(v4);

}

- (void)controllerDidChangeContent:(id)a3
{
  sub_1A4164174((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_fetchedResultsDidChangeWithControllerDelegate_);
}

- (void)controllerWillChangeContent:(id)a3
{
  sub_1A4164174((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_fetchedResultsWillChangeWithControllerDelegate_);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  id v18;
  _TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[32];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AAF60);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = &v26[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v13);
  v17 = &v26[-v16];
  v18 = a3;
  swift_unknownObjectRetain();
  v19 = self;
  v20 = a5;
  v21 = a7;
  sub_1A423C488();
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_1A423BFFC();

    v22 = sub_1A423C008();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    v23 = sub_1A423C008();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  if (v21)
  {
    sub_1A423BFFC();

    v24 = sub_1A423C008();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v15, 0, 1, v24);
  }
  else
  {
    v25 = sub_1A423C008();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v15, 1, 1, v25);
  }
  sub_1A4168838((uint64_t)v26, (uint64_t)v17, a6, (uint64_t)v15);

  sub_1A410251C((uint64_t)v15, &qword_1ED1AAF60);
  sub_1A410251C((uint64_t)v17, &qword_1ED1AAF60);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
}

- (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate)init
{
  _TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *result;

  result = (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1A41112A4((uint64_t)self + OBJC_IVAR____TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate__delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate__contentPredicate));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate__otherWatchedContentPredicate));
}

@end
