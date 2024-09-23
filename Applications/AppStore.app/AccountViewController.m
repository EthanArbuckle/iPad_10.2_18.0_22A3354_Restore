@implementation AccountViewController

- (void)viewDidLoad
{
  _TtC8AppStore21AccountViewController *v2;

  v2 = self;
  sub_10055AE84();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccountViewController();
  v4 = v7.receiver;
  -[StoreCollectionViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "collectionView", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", 0, 1, 0);

    v4 = v6;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccountViewController();
  v4 = v7.receiver;
  -[StoreCollectionViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  v5 = (void *)objc_opt_self(ASKRebootstrapCoordinator);
  v6 = objc_msgSend(v5, "sharedCoordinator", v7.receiver, v7.super_class);
  objc_msgSend(v6, "beginDelayingNotifications");

  v4[OBJC_IVAR____TtC8AppStore21AccountViewController_allowBatchUpdates] = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  v4 = v5.receiver;
  -[StoreCollectionViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  v4[OBJC_IVAR____TtC8AppStore21AccountViewController_allowBatchUpdates] = 0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccountViewController();
  v4 = v7.receiver;
  -[StoreCollectionViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = (void *)objc_opt_self(ASKRebootstrapCoordinator);
  v6 = objc_msgSend(v5, "sharedCoordinator", v7.receiver, v7.super_class);
  objc_msgSend(v6, "endDelayingNotifications");

}

- (UIEdgeInsets)pageMarginInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = 0.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8AppStore21AccountViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10055EACC(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_10056173C);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1001F4F3C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_100561D64);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC8AppStore21AccountViewController *v7;

  v6 = a3;
  v7 = self;
  sub_10055F668((uint64_t)v6, a4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC8AppStore21AccountViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10055F838((uint64_t)v4);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore21AccountViewController_compoundScrollObserver), "scrollViewWillBeginDecelerating:", a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore21AccountViewController_compoundScrollObserver), "scrollViewDidScroll:", a3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore21AccountViewController_compoundScrollObserver), "scrollViewWillBeginDragging:", a3);
}

- (void)refreshControlValueChanged
{
  _TtC8AppStore21AccountViewController *v2;

  v2 = self;
  sub_100560A28();

}

- (void)fetchUpdates
{
  _TtC8AppStore21AccountViewController *v2;

  v2 = self;
  sub_100560BE0();

}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8AppStore21AccountViewController *v10;
  __n128 v11;

  v7 = sub_100008FE4(0, &qword_10084D968, AIDAServiceOperationResult_ptr);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v7, &protocol witness table for String);
  v9 = a3;
  v10 = self;
  sub_100561EBC(v8, v11);

  swift_bridgeObjectRelease(v8);
}

- (void)signInControllerDidCancel:(id)a3
{
  uint64_t v4;
  id v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8AppStore21AccountViewController *v11;

  v4 = qword_100828EB8;
  v5 = a3;
  v11 = self;
  if (v4 != -1)
    swift_once(&qword_100828EB8, sub_10055A87C);
  v7 = type metadata accessor for OSLogger(0, v6);
  sub_10007AF70(v7, (uint64_t)qword_10084D7B0);
  v8 = sub_10007B804((uint64_t *)&unk_10082D0C0);
  v9 = type metadata accessor for LogMessage(0);
  v10 = swift_allocObject(v8, ((*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) | 7);
  *(_OWORD *)(v10 + 16) = xmmword_100661E10;
  static LogMessage.identity(_:)((__n128)xmmword_100661E10);
  LogMessage.init(stringLiteral:)(0xD000000000000019, 0x80000001006CAD20);
  Logger.info(_:)(v10, v7, &protocol witness table for OSLogger);
  -[AccountViewController dismissViewControllerAnimated:completion:](v11, "dismissViewControllerAnimated:completion:", 1, 0, swift_bridgeObjectRelease(v10).n128_f64[0]);
  dispatch thunk of AccountPresenter.didFinishSignIn()(v11);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore21AccountViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AccountViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AccountViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AccountViewController_refreshControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AccountViewController_flowPreviewing));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21AccountViewController_compoundScrollObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore21AccountViewController_impressionsCoordinator));
}

@end
