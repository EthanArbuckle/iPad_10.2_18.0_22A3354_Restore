@implementation AMSChannelLinkRequestParametersBuilder

+ (void)linkRequestParametersWithGuid:(NSString *)a3 linkParams:(NSString *)a4 productCode:(NSString *)a5 additionalParameters:(NSDictionary *)a6 customerID:(NSString *)a7 pacPromise:(id)a8 completionHandler:(id)aBlock
{
  void *v16;
  _QWORD *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSDictionary *v21;
  NSString *v22;
  id v23;

  v16 = _Block_copy(aBlock);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = a7;
  v17[7] = a8;
  v17[8] = v16;
  v17[9] = a1;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  sub_18C869ACC((uint64_t)&unk_1EE055B28, (uint64_t)v17);
}

- (AMSChannelLinkRequestParametersBuilder)init
{
  return (AMSChannelLinkRequestParametersBuilder *)ChannelLinkRequestParametersBuilder.init()();
}

@end
