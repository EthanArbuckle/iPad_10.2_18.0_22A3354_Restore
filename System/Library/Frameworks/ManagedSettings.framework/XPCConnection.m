@implementation XPCConnection

- (id)remoteObjectProxy
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];

  v2 = *(void **)self->nsXPCConnection;
  swift_retain();
  v3 = objc_msgSend(v2, sel_remoteObjectProxy);
  sub_1B76DBD50();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1B76DBEC4();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return sub_1B768D268((int)self, (int)a2, a3, (uint64_t)&unk_1E6CB1F48, (uint64_t)sub_1B768D8AC, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))sub_1B768D13C);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return sub_1B768D268((int)self, (int)a2, a3, (uint64_t)&unk_1E6CB1F20, (uint64_t)sub_1B768D8AC, (void (*)(_QWORD *__return_ptr, uint64_t, uint64_t))sub_1B768D16C);
}

@end
