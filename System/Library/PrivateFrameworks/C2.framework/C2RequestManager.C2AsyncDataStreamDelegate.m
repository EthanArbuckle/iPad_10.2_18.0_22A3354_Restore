@implementation C2RequestManager.C2AsyncDataStreamDelegate

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 willPerformHTTPRedirection:(NSHTTPURLResponse *)a5 newRequest:(NSURLRequest *)a6 completionHandler:(id)a7
{
  void *v12;
  _QWORD *v13;
  NSURLSession *v14;
  NSURLSessionTask *v15;
  NSHTTPURLResponse *v16;
  NSURLRequest *v17;
  _TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate *v18;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)OUTLINED_FUNCTION_38();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;
  OUTLINED_FUNCTION_7((uint64_t)&unk_1EFEFB7C8, (uint64_t)v13);
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 needNewBodyStream:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSURLSession *v10;
  NSURLSessionTask *v11;
  _TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)OUTLINED_FUNCTION_38();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1D4DF3744((uint64_t)&unk_1EFEFB7B8, (uint64_t)v9);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v12 = a5;
  sub_1D4DF3A3C((uint64_t)v12, v11, a5);

  OUTLINED_FUNCTION_8(v12);
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 _willSendRequestForEstablishedConnection:(NSURLRequest *)a5 completionHandler:(id)a6
{
  sub_1D4DF4224(self, (int)a2, a3, a4, a5, a6, (uint64_t)&unk_1E9899408, (uint64_t)&unk_1EFEFB7A8);
}

- (void)URLSession:(NSURLSession *)a3 dataTask:(NSURLSessionDataTask *)a4 didReceiveResponse:(NSURLResponse *)a5 completionHandler:(id)a6
{
  sub_1D4DF4224(self, (int)a2, a3, a4, a5, a6, (uint64_t)&unk_1E9899368, (uint64_t)&unk_1EFEFB770);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  _TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate *v15;
  uint64_t v16;
  id v17;
  id v18;

  if (a5)
  {
    v8 = a3;
    v9 = a4;
    v10 = self;
    v11 = a5;
    v12 = sub_1D4DF6274();
    v14 = v13;

  }
  else
  {
    v17 = a3;
    v18 = a4;
    v15 = self;
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  sub_1D4DF438C((uint64_t)v15, v16, v12, v14);
  sub_1D4DF4F6C(v12, v14);

  OUTLINED_FUNCTION_8(self);
}

- (_TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate)init
{
  sub_1D4DF45D4();
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4F5508);
  OUTLINED_FUNCTION_37(*(_QWORD *)(v3 - 8));
  sub_1D4DF5748((uint64_t)self+ OBJC_IVAR____TtCE2C2CSo16C2RequestManagerP33_84EE1E58F246DCD3EE191A742089E5F125C2AsyncDataStreamDelegate_bytesStreamContinuation, (uint64_t *)&unk_1ED4F5530);
  OUTLINED_FUNCTION_39();
}

@end
