@implementation IMServiceForSendingTask

- (NSString)taskID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (IMServiceForSendingTaskDelegate)delegate
{
  return (IMServiceForSendingTaskDelegate *)(id)MEMORY[0x1A1AE8B50]((char *)self+ OBJC_IVAR___IMServiceForSendingTask_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (IMServiceForSendingTask)initWithDelegate:(id)a3 updateHandler:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a4);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_unknownObjectRetain();
  return (IMServiceForSendingTask *)sub_19E3551A4(v6, (uint64_t)sub_19E35B65C, v5);
}

- (void)reachabilityRequest:(id)a3 updatedWithResult:(id)a4
{
  id v6;
  id v7;
  IMServiceForSendingTask *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19E355988(v6, v7);

}

- (IMServiceForSendingTask)init
{
  IMServiceForSendingTask *result;

  result = (IMServiceForSendingTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_19E323244((uint64_t)self + OBJC_IVAR___IMServiceForSendingTask_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

}

- (NSArray)requestIDs
{
  IMServiceForSendingTask *v3;
  uint64_t v4;
  void *v5;

  swift_beginAccess();
  v3 = self;
  v4 = swift_bridgeObjectRetain();
  sub_19E337F84(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_19E36F954();
  swift_release();
  return (NSArray *)v5;
}

- (void)submitRequestWithID:(id)a3 serviceName:(id)a4 preconditions:(id)a5 clearanceHandler:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  IMServiceForSendingTask *v16;

  v7 = _Block_copy(a6);
  v8 = sub_19E36F888();
  v10 = v9;
  v11 = sub_19E36F888();
  v13 = v12;
  sub_19E24B854(0, &qword_1EE500578);
  v14 = sub_19E36F960();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v7;
  v16 = self;
  sub_19E3579C8(v8, v10, v11, v13, v14, (uint64_t)sub_19E359F48, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)allRequestsSubmitted
{
  IMServiceForSendingTask *v2;

  v2 = self;
  sub_19E358194();

}

- (void)beganRequestWithID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  IMServiceForSendingTask *v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v4 = sub_19E36F888();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___IMServiceForSendingTask_requestIDToResults);
  swift_beginAccess();
  v8 = self;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v7;
  *v7 = 0x8000000000000000;
  sub_19E32FB88(MEMORY[0x1E0DEE9D8], v4, v6, isUniquelyReferenced_nonNull_native);
  *v7 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)cancelledRequestWithID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  IMServiceForSendingTask *v7;

  v4 = sub_19E36F888();
  v6 = v5;
  swift_beginAccess();
  v7 = self;
  sub_19E358EE0(v4, v6);
  swift_endAccess();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
