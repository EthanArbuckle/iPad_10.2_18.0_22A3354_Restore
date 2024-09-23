@implementation CNEmptyPeopleFetcher

- (void)fetchNextBatchWithReply:(id)a3
{
  void *v3;
  void (**v4)(id, id, uint64_t, _QWORD);
  id v5;

  v3 = (void *)MEMORY[0x1E0D13A20];
  v4 = (void (**)(id, id, uint64_t, _QWORD))a3;
  objc_msgSend(v3, "emptyResponse");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 1, 0);

}

@end
