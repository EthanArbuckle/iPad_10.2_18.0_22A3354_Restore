@implementation CarrySettings.MessageChannel

- (void)channel:(id)a3 didAddConsumer:(id)a4
{
  id v6;
  id v7;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22DF2A5E4();

}

- (void)channel:(id)a3 didFailToAddConsumerWithSubTopic:(id)a4 error:(id)a5
{
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_22DF2B82C((int)self, (int)a2, (int)a3, (int)a4, (int)a5, (int)sub_22DF2A658, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

- (void)consumer:(id)a3 didStartSession:(id)a4
{
  id v6;
  id v7;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22DF2A8CC();

}

- (void)consumer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v16;
  id v17;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self;
  v17 = a7;
  sub_22DF2AB68();

}

- (void)consumer:(COMessageSessionConsumer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 request:(COMessageSessionRequest *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  COMessageSessionConsumer *v12;
  COClusterMemberRoleSnapshot *v13;
  COMessageSessionRequest *v14;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_22DFA8D9C((uint64_t)&unk_255DD76D0, (uint64_t)v11);
}

- (void)channel:(id)a3 didAddProducer:(id)a4
{
  id v6;
  id v7;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22DF2B3C0();

}

- (void)channel:(id)a3 didFailToAddProducerWithSubTopic:(id)a4 error:(id)a5
{
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_22DF2B82C((int)self, (int)a2, (int)a3, (int)a4, (int)a5, (int)sub_22DF2B5C8, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

- (void)producer:(id)a3 didFailToStartSessionWithMember:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_22DF2B8B4();

}

- (void)producer:(id)a3 didStartSession:(id)a4 member:(id)a5 response:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = self;
  sub_22DF2BB84();

}

- (void)producer:(id)a3 didStopSession:(id)a4 initiator:(id)a5 notice:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v15;
  id v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = self;
  v16 = a7;
  sub_22DF2C060();

}

- (void)producer:(COMessageSessionProducer *)a3 shouldStartSessionWithMember:(COClusterMemberRoleSnapshot *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  COMessageSessionProducer *v10;
  COClusterMemberRoleSnapshot *v11;
  _TtCO15HomePodSettings13CarrySettings14MessageChannel *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_22DFA8D9C((uint64_t)&unk_255DD76C0, (uint64_t)v9);
}

- (_TtCO15HomePodSettings13CarrySettings14MessageChannel)init
{
  CarrySettings.MessageChannel.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_22DF2635C((uint64_t)self + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings14MessageChannel_role);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_106();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings14MessageChannel_dispatchQueue));
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_106();
  v3 = (char *)self + OBJC_IVAR____TtCO15HomePodSettings13CarrySettings14MessageChannel_logger;
  v4 = OUTLINED_FUNCTION_31();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
