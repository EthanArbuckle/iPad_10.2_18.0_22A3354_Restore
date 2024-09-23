@implementation CKRecipientAvailabilities

- (CKRecipientAvailabilities)initWithReachabilityController:(id)a3
{
  id v4;
  CKRecipientAvailabilities *v5;
  CKRecipientAvailabilities *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKRecipientAvailabilities_reachabilityController) = (Class)a3;
  v4 = a3;
  v5 = self;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___CKRecipientAvailabilities_reachabilities) = (Class)sub_18E50DD44(MEMORY[0x1E0DEE9D8]);

  v8.receiver = v5;
  v8.super_class = (Class)CKRecipientAvailabilities;
  v6 = -[CKRecipientAvailabilities init](&v8, sel_init);

  return v6;
}

- (CKRecipientAvailabilities)init
{
  id v3;
  CKRecipientAvailabilities *v4;

  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedController);
  v4 = -[CKRecipientAvailabilities initWithReachabilityController:](self, sel_initWithReachabilityController_, v3);

  return v4;
}

- (NSString)description
{
  CKRecipientAvailabilities *v3;
  void *v4;

  swift_beginAccess();
  v3 = self;
  sub_18E7669BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE10BD28);
  sub_18E768888();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)refreshAvailabilityForRecipients:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  CKRecipientAvailabilities *v11;

  v7 = _Block_copy(a5);
  v8 = sub_18E768AE0();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a4;
  v11 = self;
  sub_18E5DD454(v8, (uint64_t)v10, (uint64_t)sub_18E5DF30C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)hasResultsForRecipient:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CKRecipientAvailabilities *v7;

  v4 = sub_18E768984();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_18E5DD828(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)recipientsWithoutResults:(id)a3 onService:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKRecipientAvailabilities *v9;
  void *v10;

  v5 = sub_18E768AE0();
  v6 = sub_18E768984();
  v8 = v7;
  v9 = self;
  sub_18E5DEE28(v5, (uint64_t)v9, v6, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)reachabilityForRecipient:(id)a3 service:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CKRecipientAvailabilities *v11;
  void *v12;

  v5 = sub_18E768984();
  v7 = v6;
  v8 = sub_18E768984();
  v10 = v9;
  v11 = self;
  v12 = sub_18E5DD9FC(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)reachabilityForRecipient:(id)a3 service:(id)a4 isFinal:(BOOL *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CKRecipientAvailabilities *v13;
  id v14;

  v7 = sub_18E768984();
  v9 = v8;
  v10 = sub_18E768984();
  v12 = v11;
  v13 = self;
  v14 = sub_18E5DDB9C(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (int64_t)idStatusForRecipient:(id)a3 service:(id)a4
{
  CKRecipientAvailabilities *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;

  sub_18E768984();
  sub_18E768984();
  v5 = self;
  v6 = (void *)sub_18E768954();
  v7 = (void *)sub_18E768954();
  v8 = -[CKRecipientAvailabilities reachabilityForRecipient:service:](v5, sel_reachabilityForRecipient_service_, v6, v7);

  if (v8)
  {
    v9 = objc_msgSend(v8, sel_isReachable);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (v9)
      return 1;
    else
      return 2;
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
}

- (id)availabilitiesForRecipients:(id)a3 service:(id)a4
{
  uint64_t v5;
  CKRecipientAvailabilities *v6;
  _QWORD *v7;
  CKRecipientAvailabilities *v8;
  void *v9;

  v5 = sub_18E768AE0();
  sub_18E768984();
  v6 = self;
  v7 = (_QWORD *)sub_18E50DF84(MEMORY[0x1E0DEE9D8]);
  v8 = v6;
  sub_18E7669BC();
  sub_18E5DF03C(v7, v5, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB940);
  v9 = (void *)sub_18E768864();
  swift_bridgeObjectRelease();
  return v9;
}

- (BOOL)hasIDStatus:(int64_t)a3 forRecipient:(id)a4 forServicesWithCapability:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CKRecipientAvailabilities *v10;
  char v11;
  char v12;

  v7 = sub_18E768984();
  v9 = v8;
  sub_18E768984();
  v10 = self;
  sub_18E5DDF64(a3, v7, v9);
  v12 = v11;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (void)addEntriesFromIDSResults:(id)a3
{
  uint64_t v4;
  CKRecipientAvailabilities *v5;

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB940);
  v4 = sub_18E76887C();
  v5 = self;
  sub_18E5DE2FC(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
