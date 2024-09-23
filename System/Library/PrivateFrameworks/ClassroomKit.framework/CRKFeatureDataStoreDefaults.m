@implementation CRKFeatureDataStoreDefaults

void __59__CRKFeatureDataStoreDefaults_MCX_restrictionDefaultValues__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("defaultSettings_macOS"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)restrictionDefaultValues_classroomRestrictionDefaultValues;
  restrictionDefaultValues_classroomRestrictionDefaultValues = v1;

}

@end
