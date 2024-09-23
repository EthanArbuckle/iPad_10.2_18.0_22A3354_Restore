@implementation UIAlertController

- (void)showOnTopWithAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  UIAlertController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100137A10, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10003F994;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_100066370(1, a3, (uint64_t)v6, v7);
  sub_100035D74((uint64_t)v6, v7);

}

- (void)scheduleModalPresentationWithPriority:(int64_t)a3 animated:(BOOL)a4 presentationCompletion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  void **v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  UIAlertController *v15;
  uint64_t v16;
  uint64_t v17;
  UIAlertController *v18;
  _BYTE v20[24];

  v9 = type metadata accessor for ModalPresentationCoordinator.QueueEntry(0);
  __chkstk_darwin(v9);
  v11 = (void **)&v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = _Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject(&unk_10013B5A0, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1000C8EF8;
  }
  else
  {
    v13 = 0;
  }
  v14 = qword_10016A6D8;
  v15 = self;
  if (v14 != -1)
    swift_once(&qword_10016A6D8, sub_1000C6380);
  v16 = type metadata accessor for ModalPresentationCoordinator(0);
  v17 = sub_100036D34(v16, (uint64_t)qword_1001723D0);
  swift_beginAccess(v17, v20, 33, 0);
  v18 = v15;
  sub_100035C4C((uint64_t)v12, v13);
  sub_1000C5EF0(v18, 1, a3, a4, 0, 1, (uint64_t)v12, v13, (uint64_t)v11);
  sub_1000C6848(v11);
  sub_100036DC0((uint64_t)v11);
  swift_endAccess(v20);
  sub_100035D74((uint64_t)v12, v13);

}

@end
