@implementation CKVideoPlayerReusePool

- (NSArray)pool
{
  void *v2;

  swift_beginAccess();
  sub_18E5F0C98();
  sub_18E7669BC();
  v2 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setPool:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_18E5F0C98();
  v4 = sub_18E768AE0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CKVideoPlayerReusePool_pool);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

+ (CKVideoPlayerReusePool)sharedPool
{
  if (qword_1EE107328 != -1)
    swift_once();
  return (CKVideoPlayerReusePool *)(id)qword_1EE10C580;
}

- (CKVideoPlayerReusePool)init
{
  CKVideoPlayerReusePool *v2;
  void *v3;
  CKVideoPlayerReusePool *v4;
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKVideoPlayerReusePool_pool) = (Class)MEMORY[0x1E0DEE9D8];
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VideoPlayerReusePool();
  v2 = -[CKVideoPlayerReusePool init](&v7, sel_init);
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_addObserver_selector_name_object_, v4, sel_lowMemoryWarningReceivedWithNotification_, *MEMORY[0x1E0CEB298], 0);

  return v4;
}

- (void)dealloc
{
  void *v3;
  CKVideoPlayerReusePool *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for VideoPlayerReusePool();
  -[CKVideoPlayerReusePool dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (id)dequeueAvailableVideoPlayer
{
  CKVideoPlayerReusePool *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;

  v2 = self;
  v3 = sub_18E5F00B4();
  if ((v4 & 1) != 0)
    v5 = objc_msgSend(objc_allocWithZone((Class)CKReusableVideoPlayer), sel_init);
  else
    v5 = -[CKVideoPlayerReusePool dequeueAvailablePlayerAt:](v2, sel_dequeueAvailablePlayerAt_, v3);
  v6 = v5;

  return v6;
}

- (id)existingVideoPlayerForTransferGUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CKVideoPlayerReusePool *v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  id v12;

  v4 = sub_18E768984();
  v6 = v5;
  swift_beginAccess();
  v7 = self;
  v8 = sub_18E7669BC();
  v9 = sub_18E5F0AC0(v8, v4, v6);
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = 0;
  if ((v11 & 1) == 0)
    v12 = -[CKVideoPlayerReusePool dequeueAvailablePlayerAt:](v7, sel_dequeueAvailablePlayerAt_, v9);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)returnPlayerToPool:(id)a3
{
  id v4;
  CKVideoPlayerReusePool *v5;

  v4 = a3;
  v5 = self;
  sub_18E5F0414(v4);

}

- (id)dequeueAvailablePlayerAt:(int64_t)a3
{
  CKVideoPlayerReusePool *v5;
  void *v6;

  swift_beginAccess();
  v5 = self;
  v6 = (void *)sub_18E6083F0(a3);
  swift_endAccess();

  return v6;
}

- (void)removeUnneededVideoPlayers
{
  CKVideoPlayerReusePool *v2;

  v2 = self;
  sub_18E5F05E4();

}

- (void)lowMemoryWarningReceivedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_18E765F3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765F18();
  -[CKVideoPlayerReusePool removeUnneededVideoPlayers](self, sel_removeUnneededVideoPlayers);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
