@implementation EARSdapiHelper

+ (void)EnsureSDAPIInitialized
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__EARSdapiHelper_EnsureSDAPIInitialized__block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = a2;
  v2[5] = a1;
  if (+[EARSdapiHelper EnsureSDAPIInitialized]::onceToken != -1)
    dispatch_once(&+[EARSdapiHelper EnsureSDAPIInitialized]::onceToken, v2);
}

void __40__EARSdapiHelper_EnsureSDAPIInitialized__block_invoke(sdapi::SdapiUtil *a1)
{
  id v2;

  if ((sdapi::SdapiUtil::initializeSdapi(a1) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *((_QWORD *)a1 + 4), *((_QWORD *)a1 + 5), CFSTR("EARSdapiHelper.mm"), 21, CFSTR("Failed to initialize SDAPI"));

  }
}

@end
