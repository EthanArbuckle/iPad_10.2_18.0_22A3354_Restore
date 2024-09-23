@implementation PhotoLibrary

- (_TtC15ClarityPhotosUI12PhotoLibrary)init
{
  return (_TtC15ClarityPhotosUI12PhotoLibrary *)sub_10000CB28();
}

- (void)dealloc
{
  void *v2;
  _TtC15ClarityPhotosUI12PhotoLibrary *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary);
  v3 = self;
  objc_msgSend(v2, "unregisterChangeObserver:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PhotoLibrary(0);
  -[PhotoLibrary dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary__collection;
  v4 = sub_1000040EC(&qword_100019058);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)photoLibraryDidChange:(id)a3
{
  _TtC15ClarityPhotosUI12PhotoLibrary *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_10000CF04();

}

@end
