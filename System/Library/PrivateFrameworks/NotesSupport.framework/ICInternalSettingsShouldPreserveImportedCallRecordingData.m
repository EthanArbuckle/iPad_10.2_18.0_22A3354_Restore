@implementation ICInternalSettingsShouldPreserveImportedCallRecordingData

void __ICInternalSettingsShouldPreserveImportedCallRecordingData_block_invoke()
{
  id v0;

  if ((ICInternalSettingsIsCallRecordingEnabled() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    ICInternalSettingsShouldPreserveImportedCallRecordingData_isEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("PreserveImportedCallRecordingData"));

  }
  else
  {
    ICInternalSettingsShouldPreserveImportedCallRecordingData_isEnabled = 0;
  }
}

@end
