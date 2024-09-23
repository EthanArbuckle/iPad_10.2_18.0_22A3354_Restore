@implementation MAGAngelProxy

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC14MagnifierAngel13MAGAngelProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1000361B0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1000361D8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10003D0D8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100036200, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10003D0E0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100020FE8((uint64_t)v7, (uint64_t)&unk_10003D0E8, (uint64_t)v12);
  swift_release(v14);
}

- (void)finishWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC14MagnifierAngel13MAGAngelProxy *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10000ADD4(&qword_10003CB10);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100036110, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100036138, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10003D098;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100036160, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10003D0A8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100020FE8((uint64_t)v7, (uint64_t)&unk_10003D0B8, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC14MagnifierAngel13MAGAngelProxy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAGAngelProxy();
  return -[MAGAngelProxy init](&v3, "init");
}

@end
