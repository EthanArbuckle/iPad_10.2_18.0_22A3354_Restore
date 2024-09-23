@implementation CKDTrafficLogger

+ (CKDTrafficLogger)shared
{
  return (CKDTrafficLogger *)(id)static TrafficLogger.shared.getter();
}

- (void)logPartialResponseObjectDataWithRequestUUID:(NSString *)a3 objectData:(NSData *)a4 completionHandler:(id)a5
{
  sub_1BE9BD614((uint64_t)self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E782CD98, (uint64_t)&unk_1EF570268);
}

- (void)logPartialRequestObjectDataWithRequestUUID:(NSString *)a3 objectData:(NSData *)a4 completionHandler:(id)a5
{
  sub_1BE9BD614((uint64_t)self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E782CE10, (uint64_t)&unk_1EF570298);
}

- (void)logResponseConfigurationWithRequestUUID:(NSString *)a3 format:(int64_t)a4 messageClass:(NSString *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSString *v12;
  NSString *v13;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a5;
  swift_retain();
  sub_1BE9BE930((uint64_t)&unk_1EF570278, (uint64_t)v11);
}

- (void)finishRequestLogWithRequestUUID:(NSString *)a3 completionHandler:(id)a4
{
  sub_1BE9C9A00((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1E782CD70, (uint64_t)&unk_1EF570258);
}

- (void)logResponseWithRequestUUID:(NSString *)a3 response:(NSHTTPURLResponse *)a4 completionHandler:(id)a5
{
  sub_1BE9BD614((uint64_t)self, (int)a2, a3, a4, a5, (uint64_t)&unk_1E782CE38, (uint64_t)&unk_1EF5702A8);
}

- (void)logRequestWithRequestUUID:(NSString *)a3 request:(NSURLRequest *)a4 url:(NSURL *)a5 method:(NSString *)a6 messageClass:(NSString *)a7 parsingStandaloneMessage:(BOOL)a8 completionHandler:(id)aBlock
{
  void *v16;
  uint64_t v17;
  NSString *v18;
  NSURLRequest *v19;
  NSURL *v20;
  NSString *v21;
  NSString *v22;

  v16 = _Block_copy(aBlock);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_QWORD *)(v17 + 32) = a5;
  *(_QWORD *)(v17 + 40) = a6;
  *(_QWORD *)(v17 + 48) = a7;
  *(_BYTE *)(v17 + 56) = a8;
  *(_QWORD *)(v17 + 64) = v16;
  *(_QWORD *)(v17 + 72) = self;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  swift_retain();
  sub_1BE9BE930((uint64_t)&unk_1EF5702B8, v17);
}

- (CKDTrafficLogger)init
{
  return (CKDTrafficLogger *)TrafficLogger.init()();
}

- (void)logRequestBodyStreamResetWithRequestUUID:(NSString *)a3 completionHandler:(id)a4
{
  sub_1BE9C9A00((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1E782CDE8, (uint64_t)&unk_1EF570288);
}

@end
