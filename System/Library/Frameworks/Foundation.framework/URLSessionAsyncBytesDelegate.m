@implementation URLSessionAsyncBytesDelegate

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  _TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate *v14;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  specialized URLSessionAsyncBytesDelegate.urlSession(_:dataTask:didReceive:completionHandler:)((uint64_t)v13, (uint64_t)v14, v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  _TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate *v17;

  v10 = _Block_copy(a6);
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17 = self;
  v14 = specialized Data.init(referencing:)(v13);
  v16 = v15;

  _Block_copy(v10);
  specialized URLSessionAsyncBytesDelegate.urlSession(_:dataTask:_didReceive:completionHandler:)((uint64_t)v12, (uint64_t)v14, v16, (uint64_t)v17, v10);
  _Block_release(v10);
  _Block_release(v10);
  outlined consume of Data._Representation((uint64_t)v14, v16);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  specialized URLSessionAsyncBytesDelegate.urlSession(_:task:didCompleteWithError:)((uint64_t)a5);

}

- (_TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate)init
{
  _TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate *result;

  result = (_TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of URLSessionAsyncBytesDelegate.State((uint64_t)self + OBJC_IVAR____TtC10FoundationP33_1935C07EE287982D980AA89BB85ACEFA28URLSessionAsyncBytesDelegate_state);
}

@end
