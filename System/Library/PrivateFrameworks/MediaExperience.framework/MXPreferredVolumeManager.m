@implementation MXPreferredVolumeManager

- (void)postNotification:(id)a3 category:(id)a4 mode:(id)a5 volume:(float)a6 rampUpwardDuration:(float)a7 rampDownwardDuration:(float)a8 silenceVolumeHUD:(BOOL)a9 reason:(id)a10 refCon:(id)a11 sequenceNumber:(int64_t)a12
{
  _BOOL8 v14;
  id v22;
  __CFString *MappedCategoryWithModeAppended;
  double v24;
  double v25;
  double v26;
  void *v27;
  __CFString *v28;
  id v29;

  v14 = a9;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0;
  v29 = 0;
  v27 = 0;
  objc_msgSend(v22, "setObject:forKey:", a4, CFSTR("AudioCategory"));
  PVMCopyCurrentCategoryAndMode((CFTypeRef *)&v28, &v27);
  MappedCategoryWithModeAppended = (__CFString *)pvmGetMappedCategoryWithModeAppended(v28, v27);
  pvmCreateSeparateCategoryAndModeStrings(MappedCategoryWithModeAppended, &v29, 0);
  objc_msgSend(v22, "setObject:forKey:", v29, CFSTR("ActiveAudioCategory"));

  if (a5)
    objc_msgSend(v22, "setObject:forKey:", a5, CFSTR("AudioMode"));
  *(float *)&v24 = a6;
  objc_msgSend(v22, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24), CFSTR("Volume"));
  if (MX_FeatureFlags_IsAdaptiveVolumeControlEnabled())
  {
    *(float *)&v25 = a7;
    objc_msgSend(v22, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25), CFSTR("RampUpwardDuration"));
    *(float *)&v26 = a8;
    objc_msgSend(v22, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26), CFSTR("RampDownwardDuration"));
    objc_msgSend(v22, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14), CFSTR("SilenceVolumeHUD"));
  }
  if (a10)
    objc_msgSend(v22, "setObject:forKey:", a10, CFSTR("Reason"));
  if (a11)
    objc_msgSend(v22, "setObject:forKey:", a11, CFSTR("RefCon"));
  if (a12)
    objc_msgSend(v22, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a12), CFSTR("SequenceNumber"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", a3, self, v22);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_60);
  return (id)sharedInstance_sSharedInstance_8;
}

MXPreferredVolumeManager *__42__MXPreferredVolumeManager_sharedInstance__block_invoke()
{
  MXPreferredVolumeManager *result;

  result = objc_alloc_init(MXPreferredVolumeManager);
  sharedInstance_sSharedInstance_8 = (uint64_t)result;
  return result;
}

- (MXPreferredVolumeManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MXPreferredVolumeManager;
  return -[MXPreferredVolumeManager init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MXPreferredVolumeManager;
  -[MXPreferredVolumeManager dealloc](&v2, sel_dealloc);
}

@end
