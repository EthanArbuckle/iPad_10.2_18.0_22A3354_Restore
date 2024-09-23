@implementation AMSMescalFairplaySession

- (AMSMescalFairplaySession)initWithMescalType:(int64_t)a3 cachedCertificateProvider:(id)a4 certificateCacher:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  return (AMSMescalFairplaySession *)MescalFairplaySession.init(mescalType:cachedCertificateProvider:certificateCacher:)(a3, (uint64_t)sub_18C9703E8, v9, (uint64_t)sub_18C9703F0, v10);
}

- (void)signData:(NSData *)a3 bag:(AMSBagProtocol *)a4 logKey:(NSString *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSData *v12;
  NSString *v13;
  AMSMescalFairplaySession *v14;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_18C869ACC((uint64_t)&unk_1EE056208, (uint64_t)v11);
}

- (void)primeSignatureForData:(NSData *)a3 bag:(AMSBagProtocol *)a4 logKey:(NSString *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSData *v12;
  NSString *v13;
  AMSMescalFairplaySession *v14;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_18C869ACC((uint64_t)&unk_1EE0561F8, (uint64_t)v11);
}

- (void)verifyData:(NSMutableData *)a3 signature:(NSData *)a4 bag:(AMSBagProtocol *)a5 logKey:(NSString *)a6 completionHandler:(id)a7
{
  void *v12;
  _QWORD *v13;
  NSMutableData *v14;
  NSData *v15;
  NSString *v16;
  AMSMescalFairplaySession *v17;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  swift_unknownObjectRetain();
  v16 = a6;
  v17 = self;
  sub_18C869ACC((uint64_t)&unk_1EE0561E8, (uint64_t)v13);
}

- (void)verifyPrimeSignature:(NSData *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSData *v8;
  AMSMescalFairplaySession *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_18C869ACC((uint64_t)&unk_1EE0561D8, (uint64_t)v7);
}

- (AMSMescalFairplaySession)init
{
  MescalFairplaySession.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  sub_18C9703F8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMSMescalFairplaySession_certificateData), *(_QWORD *)&self->mescalType[OBJC_IVAR___AMSMescalFairplaySession_certificateData]);
  swift_bridgeObjectRelease();
}

@end
