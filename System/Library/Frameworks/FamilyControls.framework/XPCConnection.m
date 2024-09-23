@implementation XPCConnection

- (id)remoteObjectProxy
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];

  v2 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 11);
  v3 = swift_retain();
  v4 = (void *)v2(v3);
  v5 = objc_msgSend(v4, sel_remoteObjectProxy);

  sub_1DD34296C();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v6 = (void *)sub_1DD342B28();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[3];
  void *v14;
  uint64_t (*v15)();
  uint64_t v16;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 11);
  v7 = swift_retain();
  v8 = (void *)v6(v7);
  v15 = sub_1DD338068;
  v16 = v5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1DD30ED08;
  v14 = &block_descriptor_14;
  v9 = _Block_copy(v13);
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v8, sel_remoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);

  sub_1DD34296C();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v13, (uint64_t)v14);
  v11 = (void *)sub_1DD342B28();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v11;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[3];
  void *v14;
  uint64_t (*v15)();
  uint64_t v16;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 11);
  v7 = swift_retain();
  v8 = (void *)v6(v7);
  v15 = sub_1DD338068;
  v16 = v5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1DD30ED08;
  v14 = &block_descriptor_7;
  v9 = _Block_copy(v13);
  swift_retain();
  swift_release();
  v10 = objc_msgSend(v8, sel_synchronousRemoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);

  sub_1DD34296C();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v13, (uint64_t)v14);
  v11 = (void *)sub_1DD342B28();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v11;
}

@end
