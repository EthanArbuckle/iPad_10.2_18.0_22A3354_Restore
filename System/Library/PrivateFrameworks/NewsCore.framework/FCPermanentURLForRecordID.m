@implementation FCPermanentURLForRecordID

void __FCPermanentURLForRecordID_block_invoke()
{
  id v0;

  NewsCoreUserDefaults();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_214 = objc_msgSend(v0, "BOOLForKey:", CFSTR("replace_cdn_with_cvws"));

}

@end
