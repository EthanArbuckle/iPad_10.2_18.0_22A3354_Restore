@implementation WFStageManagerSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = a1;
  sub_22D3DC654((uint64_t)&unk_255D7FE78, v5);
}

- (BOOL)showRecentApps
{
  WFStageManagerSettingsClient *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_22D359370();

  return v3 & 1;
}

- (void)setShowRecentApps:(BOOL)a3
{
  WFStageManagerSettingsClient *v4;

  v4 = self;
  sub_22D3593C8(a3);

}

- (BOOL)showDock
{
  WFStageManagerSettingsClient *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_22D359410();

  return v3 & 1;
}

- (void)setShowDock:(BOOL)a3
{
  WFStageManagerSettingsClient *v4;

  v4 = self;
  sub_22D3594C0(a3);

}

- (WFStageManagerSettingsClient)init
{
  return (WFStageManagerSettingsClient *)sub_22D359544();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___WFStageManagerSettingsClient____lazy_storage___manager));
}

- (void)getStateWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  WFStageManagerSettingsClient *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_22D3DC654((uint64_t)&unk_255D7FE60, v5);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  WFStageManagerSettingsClient *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_BYTE *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v7 + 32) = self;
  v8 = self;
  sub_22D3DC654((uint64_t)&unk_255D7FE48, v7);
}

@end
