@implementation CHUISControlInstance

- (CHSControlInstanceIdentity)instanceIdentity
{
  return (CHSControlInstanceIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___CHUISControlInstance_instanceIdentity));
}

- (CHSControlIdentity)control
{
  CHUISControlInstance *v2;
  CHSControlInstanceIdentity *v3;
  id v4;

  v2 = self;
  v3 = -[CHUISControlInstance instanceIdentity](v2, sel_instanceIdentity);
  v4 = -[CHSControlInstanceIdentity control](v3, sel_control);

  return (CHSControlIdentity *)v4;
}

- (unint64_t)contentType
{
  CHUISControlInstance *v2;
  CHSControlInstanceIdentity *v3;
  id v4;

  v2 = self;
  v3 = -[CHUISControlInstance instanceIdentity](v2, sel_instanceIdentity);
  v4 = -[CHSControlInstanceIdentity contentType](v3, sel_contentType);

  return (unint64_t)v4;
}

- (unint64_t)visibility
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___CHUISControlInstance_visibility);
  swift_beginAccess();
  return *v2;
}

- (void)setVisibility:(unint64_t)a3
{
  unint64_t *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(unint64_t, uint64_t, uint64_t);
  CHUISControlInstance *v10;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR___CHUISControlInstance_visibility);
  swift_beginAccess();
  *v5 = a3;
  v6 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  v7 = *((_QWORD *)v6 + 3);
  v8 = *((_QWORD *)v6 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  v9 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 88);
  v10 = self;
  v9(a3, v7, v8);
  swift_endAccess();

}

- (CHUISControlInstanceConfiguration)configuration
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *__return_ptr, uint64_t, uint64_t);
  CHUISControlInstance *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _QWORD v15[2];
  char v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance__adapter);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v5 + 56);
  v7 = self;
  v6(v15, v4, v5);
  LOBYTE(v5) = v15[0];
  LOBYTE(v6) = BYTE1(v15[0]);
  v8 = v15[1];
  v9 = v16;
  v10 = v17;
  v11 = v18;
  swift_endAccess();
  v12 = (char *)objc_msgSend(objc_allocWithZone((Class)CHUISControlInstanceConfiguration), sel_init);
  v13 = &v12[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  *v13 = v5;
  v13[1] = (char)v6;
  *((_QWORD *)v13 + 1) = v8;
  v13[16] = v9;
  *((_QWORD *)v13 + 3) = v10;
  *((_QWORD *)v13 + 4) = v11;

  swift_bridgeObjectRelease();
  return (CHUISControlInstanceConfiguration *)v12;
}

- (void)setConfiguration:(id)a3
{
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_BYTE *, uint64_t, uint64_t);
  id v14;
  CHUISControlInstance *v15;
  uint64_t v16;
  _BYTE v17[8];
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *((_BYTE *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
  v6 = *((_BYTE *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
  v7 = *(_QWORD *)((char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8);
  v8 = *((_BYTE *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 16);
  v9 = *(_QWORD *)((char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 32);
  v16 = *(_QWORD *)((char *)a3 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 24);
  v10 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  v11 = *((_QWORD *)v10 + 3);
  v12 = *((_QWORD *)v10 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  v17[0] = v5;
  v17[1] = v6;
  v18 = v7;
  v19 = v8;
  v20 = v16;
  v21 = v9;
  v13 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 64);
  swift_bridgeObjectRetain();
  v14 = a3;
  v15 = self;
  v13(v17, v11, v12);
  swift_endAccess();

}

- (CHSControlDescriptor)descriptor
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  CHUISControlInstance *v7;
  void *v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance__adapter);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v8 = (void *)v6(v4, v5);
  swift_endAccess();

  return (CHSControlDescriptor *)v8;
}

- (CHUISControlInstanceDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CHUISControlInstance_delegate;
  swift_beginAccess();
  return (CHUISControlInstanceDelegate *)(id)MEMORY[0x1BCCA4DE8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (NSString)title
{
  NSString *result;

  result = (NSString *)sub_1B7196A64();
  __break(1u);
  return result;
}

- (CHUISControlIconView)iconView
{
  CHUISControlIconView *result;

  result = (CHUISControlIconView *)sub_1B7196A64();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  UIColor *result;

  result = (UIColor *)sub_1B7196A64();
  __break(1u);
  return result;
}

- (CHUISControlInstance)initWithControl:(id)a3
{
  return (CHUISControlInstance *)CHUISControlInstance.init(control:)(a3);
}

- (CHUISControlInstance)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  CHUISControlInstance *v10;

  v7 = objc_allocWithZone(MEMORY[0x1E0D10010]);
  v8 = a3;
  v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = -[CHUISControlInstance initWithInstanceIdentity:](self, sel_initWithInstanceIdentity_, v9);

  return v10;
}

- (CHUISControlInstance)initWithInstanceIdentity:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  id v8;
  objc_super v10;

  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHUISControlInstance__implicitlyActivateOnObserverRegistration) = 0;
  v5 = type metadata accessor for EmptyControlInstanceAdapter();
  v6 = swift_allocObject();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CHUISControlInstance__adapter);
  v7[3] = v5;
  v7[4] = (uint64_t)&off_1E6B84108;
  *v7 = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance_instanceIdentity) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISControlInstance_visibility) = 0;
  v10.receiver = self;
  v10.super_class = (Class)CHUISControlInstance;
  v8 = a3;
  return -[CHUISControlInstance init](&v10, sel_init);
}

- (void)activate
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  CHUISControlInstance *v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = v9;
  v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 112);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

}

- (void)invalidate
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  CHUISControlInstance *v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = v9;
  v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 120);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);

}

- (void)modifyConfiguration:(id)a3
{
  void *v4;
  CHUISControlInstance *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1B7176010(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)performControlActionWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void (*)(uint64_t), uint64_t, uint64_t, uint64_t);
  CHUISControlInstance *v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1B715B35C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v8, (uint64_t)v13);
  v9 = v14;
  v10 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  v11 = *(void (**)(void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v10 + 128);
  v12 = self;
  v11(v7, v6, v9, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  sub_1B715B328((uint64_t)v7);

}

- (void)registerObserver:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(id, uint64_t, uint64_t);
  CHUISControlInstance *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v5 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v5, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v8 = *(void (**)(id, uint64_t, uint64_t))(v7 + 136);
  swift_unknownObjectRetain();
  v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  swift_unknownObjectRelease();

}

- (void)unregisterObserver:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(id, uint64_t, uint64_t);
  CHUISControlInstance *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v5 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v5, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v8 = *(void (**)(id, uint64_t, uint64_t))(v7 + 144);
  swift_unknownObjectRetain();
  v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  swift_unknownObjectRelease();

}

- (CHUISControlInstance)init
{
  CHUISControlInstance *result;

  result = (CHUISControlInstance *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1B7176124((uint64_t)self + OBJC_IVAR___CHUISControlInstance_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___CHUISControlInstance__adapter);
}

@end
