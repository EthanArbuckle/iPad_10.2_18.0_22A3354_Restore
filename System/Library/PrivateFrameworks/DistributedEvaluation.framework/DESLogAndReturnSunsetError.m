@implementation DESLogAndReturnSunsetError

void __DESLogAndReturnSunsetError_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2D50];
  v5[0] = CFSTR("DodML is already sunset. Pls migrate.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 1533, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)DESLogAndReturnSunsetError_sunSetError;
  DESLogAndReturnSunsetError_sunSetError = v2;

}

@end
