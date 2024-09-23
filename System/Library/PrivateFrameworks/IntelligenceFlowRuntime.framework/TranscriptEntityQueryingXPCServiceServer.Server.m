@implementation TranscriptEntityQueryingXPCServiceServer.Server

- (void)getTranscriptEntitiesWithParameters:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = sub_23FD713D8();
  v10 = v9;

  *(_QWORD *)(swift_allocObject() + 16) = v6;
  sub_23FD69254(v8, v10);
  swift_release();
  sub_23FC577B0(v8, v10);

}

- (void)getTranscriptEntitiesBatchWithId:(id)a3 reply:(id)a4
{
  sub_23FD69A9C();
}

- (void)stopTranscriptEntitiesEnumerationWithId:(id)a3 reply:(id)a4
{
  sub_23FD69A9C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server)init
{
  sub_23FC98380();
}

@end
