@implementation DeclineCallService

- (void)declineAnsweringWithCall:(TUCall *)a3 anayticsSourceForDismissal:(NSString *)a4 reason:(int)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  TUCall *v12;
  NSString *v13;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject(&unk_10028C7C0, 56, 7);
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a4;
  *(_DWORD *)(v11 + 32) = a5;
  *(_QWORD *)(v11 + 40) = v10;
  *(_QWORD *)(v11 + 48) = self;
  v12 = a3;
  v13 = a4;
  swift_retain();
  sub_10018236C((uint64_t)&unk_1002DB160, v11);
}

- (void)declineAnsweringFrontMostCallViaUserActionWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10028C798, 32, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  swift_retain();
  sub_10018236C((uint64_t)&unk_1002DB148, v5);
}

- (void)declineAnsweringCallDueToLockEventWithCurrentActiveCall:(TUCall *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  TUCall *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_10028C6F8, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  swift_retain();
  sub_10018236C((uint64_t)&unk_1002DB100, (uint64_t)v7);
}

@end
