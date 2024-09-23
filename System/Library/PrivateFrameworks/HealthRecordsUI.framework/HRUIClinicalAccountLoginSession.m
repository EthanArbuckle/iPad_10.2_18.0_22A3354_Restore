@implementation HRUIClinicalAccountLoginSession

- (HRUIClinicalAccountLoginSession)initWithAccountStore:(id)a3 presentationAnchor:(id)a4 funnelContext:(int64_t)a5
{
  objc_class *ObjectType;
  id v10;
  id v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_authSession) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_accountStore) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_presentationAnchor) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUIClinicalAccountLoginSession_funnelContext) = (Class)a5;
  v13.receiver = self;
  v13.super_class = ObjectType;
  v10 = a3;
  v11 = a4;
  return -[HRUIClinicalAccountLoginSession init](&v13, sel_init);
}

- (BOOL)startLoginWithGateway:(id)a3 loginCancelledHandler:(id)a4 callbackErrorHandler:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  HRUIClinicalAccountLoginSession *v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v25;

  sub_1BC384E68(0, (unint64_t *)&qword_1ED6A4DE0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v25 - v11;
  v13 = _Block_copy(a4);
  v14 = _Block_copy(a5);
  if (v13)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v13;
    v13 = sub_1BC398008;
  }
  else
  {
    v15 = 0;
  }
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  v17 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  sub_1BC62C944();
  v18 = a3;
  v19 = self;
  v20 = v18;
  sub_1BC38F084((uint64_t)v13);
  swift_retain();
  v21 = sub_1BC62C938();
  v22 = (_QWORD *)swift_allocObject();
  v23 = MEMORY[0x1E0DF06E8];
  v22[2] = v21;
  v22[3] = v23;
  v22[4] = v19;
  v22[5] = v20;
  v22[6] = v13;
  v22[7] = v15;
  v22[8] = sub_1BC397B64;
  v22[9] = v16;
  sub_1BC38F7CC((uint64_t)v12, (uint64_t)&unk_1EF42B268, (uint64_t)v22);
  swift_release();

  swift_release();
  sub_1BC36D770((uint64_t)v13);
  return 1;
}

- (BOOL)startReloginToAccount:(id)a3 viewController:(id)a4 profile:(id)a5 loginCancelledHandler:(id)a6 callbackErrorHandler:(id)a7 error:(id *)a8
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  HRUIClinicalAccountLoginSession *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v32;
  HRUIClinicalAccountLoginSession *v33;

  v33 = self;
  sub_1BC384E68(0, (unint64_t *)&qword_1ED6A4DE0, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v32 - v14;
  v16 = _Block_copy(a6);
  v17 = _Block_copy(a7);
  if (v16)
  {
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v16;
    v16 = sub_1BC397BC8;
  }
  else
  {
    v18 = 0;
  }
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v17;
  v20 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v15, 1, 1, v20);
  sub_1BC62C944();
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = v33;
  v25 = v21;
  v26 = v22;
  v27 = v23;
  sub_1BC38F084((uint64_t)v16);
  swift_retain();
  v28 = sub_1BC62C938();
  v29 = (_QWORD *)swift_allocObject();
  v30 = MEMORY[0x1E0DF06E8];
  v29[2] = v28;
  v29[3] = v30;
  v29[4] = v24;
  v29[5] = v25;
  v29[6] = v26;
  v29[7] = v27;
  v29[8] = v16;
  v29[9] = v18;
  v29[10] = sub_1BC397B64;
  v29[11] = v19;
  sub_1BC38F914((uint64_t)v15, (uint64_t)&unk_1EF42B260, (uint64_t)v29);
  swift_release();

  swift_release();
  sub_1BC36D770((uint64_t)v16);
  return 1;
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___HRUIClinicalAccountLoginSession_presentationAnchor));
}

- (HRUIClinicalAccountLoginSession)init
{
  HRUIClinicalAccountLoginSession *result;

  result = (HRUIClinicalAccountLoginSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
