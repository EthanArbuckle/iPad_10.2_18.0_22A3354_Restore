@implementation MRMediaRemoteServicePing

uint64_t ___MRMediaRemoteServicePing_block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = v3;

  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(v4);
}

@end
