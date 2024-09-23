@implementation TLAlert

void __62__TLAlert_BulletinBoard__bb_toneLibraryAlertTypeForSectionID___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.mobilemail");
  v2[1] = CFSTR("com.apple.MobileSMS");
  v3[0] = &unk_24C5835F8;
  v3[1] = &unk_24C583610;
  v2[2] = CFSTR("com.apple.mobilephone");
  v2[3] = CFSTR("com.apple.facetime");
  v3[2] = &unk_24C583628;
  v3[3] = &unk_24C583628;
  v2[4] = CFSTR("com.apple.mobilecal");
  v2[5] = CFSTR("com.apple.reminders");
  v3[4] = &unk_24C583640;
  v3[5] = &unk_24C583658;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bb_toneLibraryAlertTypeForSectionID____sectionIDToAlertType;
  bb_toneLibraryAlertTypeForSectionID____sectionIDToAlertType = v0;

}

@end
