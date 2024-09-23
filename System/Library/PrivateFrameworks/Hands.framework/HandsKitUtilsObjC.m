@implementation HandsKitUtilsObjC

+ (id)GetHandsKitVersionString
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  if (+[HandsKitUtilsObjC GetHandsKitVersionString]::onceToken != -1)
    dispatch_once(&+[HandsKitUtilsObjC GetHandsKitVersionString]::onceToken, &__block_literal_global_0);
  v3 = (id)+[HandsKitUtilsObjC GetHandsKitVersionString]::version;
  objc_sync_exit(v2);

  return v3;
}

void __45__HandsKitUtilsObjC_GetHandsKitVersionString__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[HandsKitUtilsObjC GetHandsKitVersionString]::version;
  +[HandsKitUtilsObjC GetHandsKitVersionString]::version = v0;

  if (objc_msgSend((id)+[HandsKitUtilsObjC GetHandsKitVersionString]::version, "isEqualToString:", CFSTR("Hands-9999.99.99")))
  {
    objc_msgSend(v9, "pathForResource:ofType:", CFSTR("BundleResource/handskit_version"), CFSTR("txt"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v2, 4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = v5;
        v8 = (void *)+[HandsKitUtilsObjC GetHandsKitVersionString]::version;
        +[HandsKitUtilsObjC GetHandsKitVersionString]::version = (uint64_t)v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error reading handskit_version.txt!"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("HandsKitPipeline"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/HandsKitUtilsObjC.mm"), 44, v8);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("commit hash file (handskit_version.txt) does not exist at path: %@"), v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[HandyLoggerNeo logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:](_TtC5Hands14HandyLoggerNeo, "logAtLevel:withPrivacy:withLogArea:inFile:onLine:message:", 4, 1, CFSTR("HandsKitPipeline"), CFSTR("/Library/Caches/com.apple.xbs/Sources/Hands/HandsKit/Utils/HandsKitUtilsObjC.mm"), 49, v6);
    }

  }
}

+ (void)calculatePRP2PDistanceFromPoseFeature:(float *)a3 p2pDistance:(float *)a4
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;

  v4.i64[0] = *((_QWORD *)a3 + 12);
  v4.f32[2] = a3[26];
  v5.i64[0] = *((_QWORD *)a3 + 6);
  v5.f32[2] = a3[14];
  v6 = vsubq_f32(v4, v5);
  v7 = vmulq_f32(v6, v6);
  *a4 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0]);
}

+ (void)createGeometricPoseFeatureForPR:(float *)a3
{
  int v4;

  v4 = 0;
  +[HandsKitUtilsObjC calculatePRP2PDistanceFromPoseFeature:p2pDistance:](HandsKitUtilsObjC, "calculatePRP2PDistanceFromPoseFeature:p2pDistance:", a3, &v4);
  *((_DWORD *)a3 + 63) = v4;
}

+ (unint64_t)arvinoToDirectRegressionMapping:(unint64_t)a3
{
  if (a3 > 0x1A)
    return 0;
  else
    return +[HandsKitUtilsObjC arvinoToDirectRegressionMapping:]::mapping[a3];
}

@end
