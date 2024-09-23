@implementation IMDServiceReachabilityBaseDelegate

- (IMDServiceSession)serviceSession
{
  return (IMDServiceSession *)(id)MEMORY[0x1D17EB154]((char *)self+ OBJC_IVAR___IMDServiceReachabilityBaseDelegate_serviceSession, a2);
}

- (void)setServiceSession:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (IMDServiceReachabilityBaseDelegate)initWithServiceSession:(id)a3
{
  objc_super v5;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)IMDServiceReachabilityBaseDelegate;
  return -[IMDServiceReachabilityBaseDelegate init](&v5, sel_init);
}

- (BOOL)networkDataAvailable
{
  void *v3;
  IMDServiceReachabilityBaseDelegate *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedAccountController);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_networkDataAvailable);

    LOBYTE(v5) = v7;
  }
  else
  {
    __break(1u);
  }
  return (char)v5;
}

- (BOOL)isUsableForSending
{
  IMDServiceReachabilityBaseDelegate *v2;
  IMDServiceSession *v3;
  IMDServiceReachabilityBaseDelegate *v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = -[IMDServiceReachabilityBaseDelegate serviceSession](v2, sel_serviceSession);
  if (v3)
  {
    v4 = (IMDServiceReachabilityBaseDelegate *)v3;
    v5 = -[IMDServiceSession isActive](v3, sel_isActive);

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)idsRegisteredSIMIDs
{
  void *v3;
  IMDServiceReachabilityBaseDelegate *v4;
  id v5;
  id v6;
  void *v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  v6 = objc_msgSend(v5, sel_registeredSIMIDs);

  sub_1D166DBEC();
  v7 = (void *)sub_1D166DBD4();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (NSString)internalServiceName
{
  IMDServiceReachabilityBaseDelegate *v2;
  NSString *result;
  NSString *v4;
  id v5;
  id v6;
  void *v7;

  v2 = self;
  result = -[IMDServiceReachabilityBaseDelegate serviceSession](v2, sel_serviceSession);
  if (result)
  {
    v4 = result;
    v5 = -[NSString service](result, sel_service);

    v6 = objc_msgSend(v5, sel_internalName);
    sub_1D166DACC();

    v7 = (void *)sub_1D166DAA8();
    swift_bridgeObjectRelease();
    return (NSString *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (int64_t)maxChatParticipantsForContext:(id)a3
{
  return 32;
}

- (id)phoneNumberOnSubscriptionWithSIMID:(id)a3
{
  IMDServiceReachabilityBaseDelegate *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  sub_1D166DACC();
  v4 = self;
  sub_1D1660838();
  v6 = v5;

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7 = (void *)sub_1D166DAA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)hasCTSubscriptionWithPhoneNumber:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  IMDServiceReachabilityBaseDelegate *v7;

  v4 = sub_1D166DACC();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1D1660A28(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (BOOL)hasValidDowngradeRequestForHandleID:(id)a3
{
  IMDServiceReachabilityBaseDelegate *v4;
  IMDServiceSession *v5;
  IMDServiceSession *v6;
  void *v7;
  unsigned __int8 v8;

  sub_1D166DACC();
  v4 = self;
  v5 = -[IMDServiceReachabilityBaseDelegate serviceSession](v4, sel_serviceSession);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)sub_1D166DAA8();
    v8 = -[IMDServiceSession hasValidDowngradeRequestForHandleID:](v6, sel_hasValidDowngradeRequestForHandleID_, v7);

    swift_bridgeObjectRelease();
    return v8;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

- (IMDServiceReachabilityBaseDelegate)init
{
  IMDServiceReachabilityBaseDelegate *result;

  result = (IMDServiceReachabilityBaseDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

- (BOOL)isSMSEnabledForContext:(id)a3
{
  void *v5;
  id v6;
  IMDServiceReachabilityBaseDelegate *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_sharedInstance);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_supportsSMS);

    if ((v10 & 1) != 0)
      v11 = 1;
    else
      v11 = sub_1D1660D0C();

    LOBYTE(v8) = v11 & 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v8;
}

- (BOOL)isMMSEnabledForContext:(id)a3
{
  void *v5;
  id v6;
  IMDServiceReachabilityBaseDelegate *v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v6, sel_senderLastAddressedHandle);
  v9 = objc_msgSend(v6, sel_senderLastAddressedSIMID);
  LOBYTE(v5) = objc_msgSend(v5, sel_IMMMSEnabledForPhoneNumber_simID_, v8, v9);

  return (char)v5;
}

- (BOOL)shouldDowngradeToRecipient:(id)a3 fromSender:(id)a4 withContext:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  IMDServiceReachabilityBaseDelegate *v14;

  v7 = sub_1D166DACC();
  v9 = v8;
  v10 = sub_1D166DACC();
  v12 = v11;
  v13 = a5;
  v14 = self;
  LOBYTE(v10) = sub_1D1660614(v7, v9, v10, v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (BOOL)isInternationalSpamFilteringEnabled
{
  return objc_msgSend((id)objc_opt_self(), sel_isInternationalSpamFilteringEnabled);
}

@end
