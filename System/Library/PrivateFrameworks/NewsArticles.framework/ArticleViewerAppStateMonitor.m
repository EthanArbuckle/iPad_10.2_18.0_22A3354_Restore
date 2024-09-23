@implementation ArticleViewerAppStateMonitor

- (_TtC12NewsArticles28ArticleViewerAppStateMonitor)init
{
  objc_class *ObjectType;
  objc_class *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onForegroundClosures) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onEnterBackgroundClosures) = v4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowForegroundClosures) = v4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowBackgroundClosures) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[ArticleViewerAppStateMonitor init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)performOnApplicationWillEnterForeground:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _TtC12NewsArticles28ArticleViewerAppStateMonitor *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1B9F783D8;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onForegroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BA00730C(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BA00730C((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1B9F2FC94;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)performOnApplicationDidBecomeActive:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (void)performOnApplicationDidEnterBackground:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _TtC12NewsArticles28ArticleViewerAppStateMonitor *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1B9F783D8;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onEnterBackgroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BA00730C(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BA00730C((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1B9F2FC94;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)performOnApplicationWindowDidBecomeForeground:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _TtC12NewsArticles28ArticleViewerAppStateMonitor *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1B9F783D8;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowForegroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BA00730C(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BA00730C((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1B9F2FC94;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)performOnApplicationWindowDidBecomeBackground:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _TtC12NewsArticles28ArticleViewerAppStateMonitor *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1B9F783A8;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleViewerAppStateMonitor_onWindowBackgroundClosures);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1BA00730C(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1BA00730C((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1B9E38BD0;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

@end
