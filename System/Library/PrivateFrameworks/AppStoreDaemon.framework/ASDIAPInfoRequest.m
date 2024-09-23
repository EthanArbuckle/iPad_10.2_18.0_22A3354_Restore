@implementation ASDIAPInfoRequest

uint64_t __46__ASDIAPInfoRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

- (ASDIAPInfoRequest)initWithOptions:(id)a3
{
  return (ASDIAPInfoRequest *)-[ASDEphemeralRequest _initWithOptions:](self, a3);
}

+ (int64_t)requestType
{
  return 4;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD newValue[4];
  id v7;

  v4 = a3;
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __46__ASDIAPInfoRequest_startWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E37BDF88;
  v7 = v4;
  v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);

}

@end
