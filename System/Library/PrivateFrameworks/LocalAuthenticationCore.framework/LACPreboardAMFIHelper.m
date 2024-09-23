@implementation LACPreboardAMFIHelper

+ (int64_t)useCase
{
  int v2;
  int64_t *v3;
  uint64_t *v4;

  v2 = objc_msgSend(a1, "_securityBootMode");
  v3 = &LACPreboardUseCaseUPP;
  v4 = &LACPreboardUseCaseDeveloperMode;
  if (v2 != 2)
    v4 = &LACPreboardUseCaseUnknown;
  if (v2 != 3)
    v3 = v4;
  return *v3;
}

+ (void)completeCurrentBootModeWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a1, "_securityBootMode");
  v5 = v4;
  if (v4 == 2)
  {
    v11 = AMFIDeveloperModeCommit();
    LACLogPreboard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109376;
      v15 = v3;
      v16 = 1024;
      v17 = v11;
      v8 = "Committing developer mode value: %u with result: %u";
      v9 = v7;
      v10 = 14;
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v4 == 3 && !v3)
  {
    v6 = AMFIProfileCommitProfile();
    LACLogPreboard();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 67109120;
      v15 = v6;
      v8 = "Committing UPP profile value: nil with result: %u";
      v9 = v7;
      v10 = 8;
LABEL_8:
      _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:
  v12 = AMFICompleteSecurityBootMode();
  LACLogPreboard();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 67109376;
    v15 = v5;
    v16 = 1024;
    v17 = v12;
    _os_log_impl(&dword_2409DC000, v13, OS_LOG_TYPE_DEFAULT, "Completing boot mode: %u with result: %u", (uint8_t *)&v14, 0xEu);
  }

}

+ (id)getUPPProfile
{
  int ScheduledProfile;
  NSObject *v3;
  LACPreboardUPPProfile *v4;

  ScheduledProfile = AMFIProfileGetScheduledProfile();
  if (ScheduledProfile)
  {
    LACLogPreboard();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[LACPreboardAMFIHelper getUPPProfile].cold.1(ScheduledProfile, v3);

    v4 = 0;
  }
  else
  {
    v4 = -[LACPreboardUPPProfile initWithUUID:teamID:teamName:]([LACPreboardUPPProfile alloc], "initWithUUID:teamID:teamName:", 0, 0, 0);
  }

  return v4;
}

+ (id)createUPPControlForTeamID:(id)a3
{
  id v3;
  id v4;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _DWORD v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  memset(v14, 0, 28);
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v6 = 2;
  *(_QWORD *)((char *)&v7 + 4) = 0x100000005;
  v3 = a3;
  v14[7] = objc_msgSend(v3, "lengthOfBytesUsingEncoding:", 4);
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "UTF8String");
  objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);

  __memcpy_chk();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v6, 148);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)installProfileWithUUID:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  int v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (id)objc_msgSend(v8, "copy");
  v10 = AMFIProfileSetTrustWithOptions();
  LACLogDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109120;
    v18 = v10;
    _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "AMFIProfileSetTrustWithOptions returned: %d", (uint8_t *)&v17, 8u);
  }

  if (v10)
  {
    if (!a5)
    {
      v15 = 0;
      goto LABEL_13;
    }
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Unable to set profile trust"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v13 = AMFIProfileCommitProfile();
  LACLogDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109120;
    v18 = v13;
    _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "AMFIProfileCommitProfile returned: %d", (uint8_t *)&v17, 8u);
  }

  v15 = v13 == 0;
  if (a5 && v13)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Unable to commit profile"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v15 = 0;
    *a5 = v12;
  }
LABEL_13:

  return v15;
}

+ (unsigned)_securityBootMode
{
  AMFIGetSecurityBootMode();
  return -1;
}

+ (void)getUPPProfile
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "AMFIProfileGetScheduledProfile returned error code: %d", (uint8_t *)v2, 8u);
}

@end
