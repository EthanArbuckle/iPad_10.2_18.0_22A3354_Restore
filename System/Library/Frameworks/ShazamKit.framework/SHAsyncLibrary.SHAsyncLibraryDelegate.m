@implementation SHAsyncLibrary.SHAsyncLibraryDelegate

- (void)_libraryWillBeginSync:(id)a3
{
  sub_218C286F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_218C2BC80);
}

- (void)_library:(id)a3 didChangeWithSnapshot:(id)a4
{
  id v6;
  _TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_218C2BF14(v6);
  swift_unknownObjectRelease();

}

- (void)_library:(id)a3 didProduceError:(id)a4 failedItemIdentifiers:(id)a5
{
  uint64_t v7;
  id v8;
  _TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate *v9;

  v7 = sub_218C587A8();
  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  sub_218C2C834(v8, v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_libraryDidCompleteSync:(id)a3
{
  sub_218C286F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_218C2CA00);
}

- (_TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_updatesContinuation;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255009778);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255009780);
  v7 = (objc_class *)swift_allocObject();
  *((_DWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.isa + v6) = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_inflightItems) = (Class)MEMORY[0x24BEE4B08];
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[SHAsyncLibrary.SHAsyncLibraryDelegate init](&v9, sel_init);
}

- (void).cxx_destruct
{
  sub_218C16554((uint64_t)self + OBJC_IVAR____TtCC9ShazamKit14SHAsyncLibrary22SHAsyncLibraryDelegate_updatesContinuation, &qword_2550097C8);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
