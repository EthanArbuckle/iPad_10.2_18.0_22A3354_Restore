@implementation BSLogStateCaptureEncodePlist

void __BSLogStateCaptureEncodePlist_block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", &stru_1E1EC08D0, 200, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "length");

  qword_1ECD39AE8 = 32552 - v1;
}

@end
