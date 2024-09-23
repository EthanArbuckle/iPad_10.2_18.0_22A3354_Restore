@implementation ATXAVRoutingUtils

+ (BOOL)isTVExperienceAppWithBundleId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getAVSystemControllerClass_softClass;
  v13 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getAVSystemControllerClass_block_invoke;
    v9[3] = &unk_1E4D570B8;
    v9[4] = &v10;
    __getAVSystemControllerClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v5, "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasRouteSharingPolicyLongFormVideo:", v3);

  return v7;
}

+ (BOOL)isTVAppWithBundleId:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.tv"));
}

@end
