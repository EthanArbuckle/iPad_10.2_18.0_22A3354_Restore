@implementation AppStateControllerSessionObserver

- (void)manager:(id)a3 didReceiveIncomingPendingSession:(id)a4
{
  id v6;
  id v7;
  _TtC6DropIn33AppStateControllerSessionObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A75BA68((uint64_t)v8, v7);

}

- (void)session:(id)a3 didUpdateState:(unint64_t)a4 reason:(unint64_t)a5
{
  id v8;
  _TtC6DropIn33AppStateControllerSessionObserver *v9;

  v8 = a3;
  v9 = self;
  sub_23A75BC34(v8, a4, a5);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC6DropIn33AppStateControllerSessionObserver *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_23A75BE1C(v6, v8);

}

- (void)serverDisconnectedForDropInCenter:(id)a3
{
  id v4;
  _TtC6DropIn33AppStateControllerSessionObserver *v5;

  v4 = a3;
  v5 = self;
  sub_23A75BFE8();

}

- (_TtC6DropIn33AppStateControllerSessionObserver)init
{
  return (_TtC6DropIn33AppStateControllerSessionObserver *)sub_23A75C16C();
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
