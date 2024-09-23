@implementation ASDJobSchedulerRequest

- (ASDJobSchedulerRequest)initWithOptions:(id)a3
{
  return (ASDJobSchedulerRequest *)-[ASDEphemeralRequest _initWithOptions:](self, a3);
}

- (void)findNextJobsWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD newValue[4];
  id v7;

  v4 = a3;
  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __58__ASDJobSchedulerRequest_findNextJobsWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E37BDF88;
  v7 = v4;
  v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);

}

uint64_t __58__ASDJobSchedulerRequest_findNextJobsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (int64_t)requestType
{
  return 7;
}

@end
