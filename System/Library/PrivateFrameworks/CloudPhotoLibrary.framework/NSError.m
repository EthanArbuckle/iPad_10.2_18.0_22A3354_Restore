@implementation NSError

void __57__NSError_CPLAdditions___cplSafeUserInfoForXPCDidChange___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[11];

  v6[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB2D80];
  v6[0] = *MEMORY[0x1E0CB2D68];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0CB3148];
  v6[2] = *MEMORY[0x1E0CB2D78];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0CB31F0];
  v6[4] = *MEMORY[0x1E0CB2BF8];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0CB2AA0];
  v6[6] = *MEMORY[0x1E0CB3308];
  v6[7] = v3;
  v6[8] = CFSTR("CPLErrorLearnMoreLink");
  v6[9] = CFSTR("CPLErrorServerGeneratedLocalizedDescription");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_cplSafeUserInfoForXPCDidChange__safeKeys;
  _cplSafeUserInfoForXPCDidChange__safeKeys = v4;

}

void __50__NSError_CPLAdditions__cplShortDomainDescription__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB28A8];
  v3[1] = CFSTR("CloudPhotoLibraryErrorDomain");
  v4[0] = CFSTR("cocoa");
  v4[1] = CFSTR("cpl");
  v0 = *MEMORY[0x1E0CB2FE0];
  v3[2] = *MEMORY[0x1E0CB2F90];
  v3[3] = v0;
  v4[2] = CFSTR("os");
  v4[3] = CFSTR("posix");
  v3[4] = *MEMORY[0x1E0CB2D98];
  v3[5] = CFSTR("CKErrorDomain");
  v4[4] = CFSTR("mach");
  v4[5] = CFSTR("cloudkit");
  v3[6] = CFSTR("CKInternalErrorDomain");
  v3[7] = CFSTR("CKUnderlyingErrorDomain");
  v4[6] = CFSTR("cloudkit-internal");
  v4[7] = CFSTR("cloudkit-internal");
  v3[8] = CFSTR("SqliteErrorDomain");
  v4[8] = CFSTR("sqlite");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cplShortDomainDescription_wellKnownDomainToShortDomain;
  cplShortDomainDescription_wellKnownDomainToShortDomain = v1;

}

@end
