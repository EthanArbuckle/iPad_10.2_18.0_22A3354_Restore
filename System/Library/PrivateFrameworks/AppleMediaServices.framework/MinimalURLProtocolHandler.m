@implementation MinimalURLProtocolHandler

- (AMSURLSession)session
{
  return (AMSURLSession *)sub_18C9338C8();
}

- (void)setSession:(id)a3
{
  id v5;
  _TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler *v6;

  v5 = a3;
  v6 = self;
  sub_18C93393C((uint64_t)a3);

}

- (void)decodeMutableData:(NSMutableData *)a3 task:(NSURLSessionTask *)a4 completionHandler:(id)a5
{
  sub_18C9345D8(self, (int)a2, a3, a4, a5);
}

- (void)didCreateTask:(NSURLSessionTask *)a3 fromRequest:(NSURLRequest *)a4 completionHandler:(id)a5
{
  sub_18C9345D8(self, (int)a2, a3, a4, a5);
}

- (void)handleCompletionWithTask:(NSURLSessionTask *)a3 metrics:(NSURLSessionTaskMetrics *)a4 decodedObject:(id)a5 completionHandler:(id)a6
{
  sub_18C9344A4((int)self, (int)a2, (int)a3, (int)a4, (uint64_t)a5, a6);
}

- (void)handleResponse:(NSURLResponse *)a3 task:(NSURLSessionTask *)a4 completionHandler:(id)a5
{
  sub_18C9345D8(self, (int)a2, a3, a4, a5);
}

- (void)reconfigureNewRequest:(NSURLRequest *)a3 originalTask:(NSURLSessionTask *)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  sub_18C9346E4((int)self, (int)a2, (int)a3, (int)a4, a5, a6);
}

- (_TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler)init
{
  return (_TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler *)sub_18C934180();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler_metricsHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler_session));
}

- (void)reportMetricsForContext:(id)a3
{
  id v4;
  _TtC18AppleMediaServicesP33_1DA2568BEFA51656D884E7AA9CC6F3E225MinimalURLProtocolHandler *v5;

  v4 = a3;
  v5 = self;
  sub_18C9348D4((uint64_t)v4);

}

@end
