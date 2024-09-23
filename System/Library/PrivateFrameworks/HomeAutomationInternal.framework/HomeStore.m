@implementation HomeStore

- (_TtC22HomeAutomationInternal9HomeStore)init
{
  return (_TtC22HomeAutomationInternal9HomeStore *)sub_22086B5B4();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  _TtC22HomeAutomationInternal9HomeStore *v5;

  v4 = a3;
  v5 = self;
  sub_22086C440((uint64_t)v4);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore_initializationSignpostID;
  v4 = sub_220C98730();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_release();
  swift_release();
  objc_release(*(id *)&self->_cachedResults[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cachedStableHomeGraphHash
                                          + 8]);
  swift_bridgeObjectRelease();

}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v4;
  _TtC22HomeAutomationInternal9HomeStore *v5;

  v4 = a3;
  v5 = self;
  sub_22093FFB8();

}

- (void)homeDidUpdateName:(id)a3
{
  id v4;
  _TtC22HomeAutomationInternal9HomeStore *v5;

  v4 = a3;
  v5 = self;
  sub_22094031C();

}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6;
  id v7;
  _TtC22HomeAutomationInternal9HomeStore *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_220940204(v7);

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6;
  id v7;
  _TtC22HomeAutomationInternal9HomeStore *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22094031C();

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6;
  id v7;
  _TtC22HomeAutomationInternal9HomeStore *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22094041C(v7);

}

- (void)home:(void *)a3 didUpdateRoom:(void *)a4 forAccessory:(void *)a5
{
  char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  void *v16;

  v9 = &a1[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cacheRequiresInvalidation];
  swift_beginAccess();
  v10 = (void *)*((_QWORD *)v9 + 1);
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a1;
  objc_msgSend(v10, sel_lock);
  *v9 = 1;
  objc_msgSend(v10, sel_unlock);
  swift_endAccess();
  v15 = &v14[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__isCachedStableHomeGraphHashValid];
  swift_beginAccess();
  v16 = (void *)*((_QWORD *)v15 + 1);
  objc_msgSend(v16, sel_lock);
  *v15 = 0;
  objc_msgSend(v16, sel_unlock);
  swift_endAccess();

}

- (void)mediaSystem:(void *)a3 didUpdateName:
{
  char *v5;
  void *v6;
  id v7;
  char *v8;
  char *v9;
  void *v10;

  v5 = &a1[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cacheRequiresInvalidation];
  swift_beginAccess();
  v6 = (void *)*((_QWORD *)v5 + 1);
  v7 = a3;
  v8 = a1;
  objc_msgSend(v6, sel_lock);
  *v5 = 1;
  objc_msgSend(v6, sel_unlock);
  swift_endAccess();
  v9 = &v8[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__isCachedStableHomeGraphHashValid];
  swift_beginAccess();
  v10 = (void *)*((_QWORD *)v9 + 1);
  objc_msgSend(v10, sel_lock);
  *v9 = 0;
  objc_msgSend(v10, sel_unlock);
  swift_endAccess();

}

- (void)home:(void *)a3 didRemoveAccessory:(void *)a4
{
  char *v7;
  void *v8;
  id v9;
  id v10;
  char *v11;
  char *v12;
  void *v13;

  v7 = &a1[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__cacheRequiresInvalidation];
  swift_beginAccess();
  v8 = (void *)*((_QWORD *)v7 + 1);
  v9 = a3;
  v10 = a4;
  v11 = a1;
  objc_msgSend(v8, sel_lock);
  *v7 = 1;
  objc_msgSend(v8, sel_unlock);
  swift_endAccess();
  v12 = &v11[OBJC_IVAR____TtC22HomeAutomationInternal9HomeStore__isCachedStableHomeGraphHashValid];
  swift_beginAccess();
  v13 = (void *)*((_QWORD *)v12 + 1);
  objc_msgSend(v13, sel_lock);
  *v12 = 0;
  objc_msgSend(v13, sel_unlock);
  swift_endAccess();

}

@end
