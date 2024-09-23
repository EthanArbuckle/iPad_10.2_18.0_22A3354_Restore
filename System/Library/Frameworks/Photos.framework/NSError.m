@implementation NSError

void __55__NSError_PHErrors_Private__ph_genericEntitlementError__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB2D50];
  v4[0] = CFSTR("Process is not entitled to run this operation.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 5101, v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)ph_genericEntitlementError_s_error;
  ph_genericEntitlementError_s_error = v1;

}

@end
