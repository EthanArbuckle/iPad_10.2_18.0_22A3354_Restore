@implementation IMDPersistenceServiceClient

+ (IMDPersistenceServiceClient)sharedClient
{
  if (qword_1EEC3FCD8 != -1)
    swift_once();
  swift_beginAccess();
  return (IMDPersistenceServiceClient *)(id)qword_1EEC40208;
}

+ (void)setSharedClient:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1EEC3FCD8;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1EEC40208;
  qword_1EEC40208 = (uint64_t)v4;

}

- (IMDPersistenceServiceClient)init
{
  return (IMDPersistenceServiceClient *)MessagesPersistenceServiceClient.init()();
}

- (void).cxx_destruct
{

}

- (IMDRemoteDatabaseProtocol)remoteProxy
{
  return (IMDRemoteDatabaseProtocol *)sub_1ABC5053C(self);
}

- (IMDRemoteDatabaseProtocol)synchronousRemoteProxy
{
  return (IMDRemoteDatabaseProtocol *)sub_1ABC5053C(self);
}

@end
