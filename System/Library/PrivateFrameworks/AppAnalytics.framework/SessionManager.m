@implementation SessionManager

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    v9 = sub_1A5EBC084;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v10 = *(_QWORD *)self->accessQueue;
  v11 = swift_allocObject();
  swift_weakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a3;
  v12[4] = v9;
  v12[5] = v8;
  v13 = a3;
  swift_retain();
  swift_retain();
  sub_1A5EC84CC((uint64_t)v9);
  sub_1A5EEC784(v10, (uint64_t)sub_1A5F12DB4, (uint64_t)v12);
  swift_release();
  swift_release();
  sub_1A5ED0004((uint64_t)v9);

  swift_release();
}

@end
