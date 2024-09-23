@implementation HMDShouldRedactBundleIdForBuildType

void __HMDShouldRedactBundleIdForBuildType_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("hdsutil"), CFSTR("HomeIntegrationTests-Runner"), CFSTR("homeutil"), CFSTR("tvsetuputil"), CFSTR("CarPlay"), CFSTR("Carousel"), CFSTR("HDSViewService"), CFSTR("HomeAppIntentsExtension"), CFSTR("HomeKitDiagnosticExtension"), CFSTR("HomeKitIntentExtension"), CFSTR("PineBoard"), CFSTR("Shortcuts"), CFSTR("Siri Debug"), CFSTR("SiriUI"), CFSTR("SiriUserFeedbackLearningUnivers"), CFSTR("SoundBoard"), CFSTR("SpringBoard"),
    CFSTR("accountsd"),
    CFSTR("amsaccountsd"),
    CFSTR("announced"),
    CFSTR("assistant_service"),
    CFSTR("assistantd"),
    CFSTR("cloudmediaservicesd"),
    CFSTR("companiond"),
    CFSTR("coordinated"),
    CFSTR("coreautomationd"),
    CFSTR("diagnosticextensionsd"),
    CFSTR("homeenergyd"),
    CFSTR("homehubd"),
    CFSTR("homepodsensoryreporterd"),
    CFSTR("homepodsettingsd"),
    CFSTR("itunescloudd"),
    CFSTR("knowledgeconstructiond"),
    CFSTR("mediaanalysisd"),
    CFSTR("mediaanalysisd-service"),
    CFSTR("mediaremoted"),
    CFSTR("mediasetupd"),
    CFSTR("passd"),
    CFSTR("proximitycontrold"),
    CFSTR("rapportd"),
    CFSTR("seserviced"),
    CFSTR("sharingd"),
    CFSTR("siri"),
    CFSTR("siriinferenced"),
    CFSTR("siriknowledged"),
    CFSTR("sirittsd"),
    CFSTR("taptoradard"),
    CFSTR("tvairplayd"),
    CFSTR("tvremoted"),
    CFSTR("userprofilesd"),
    CFSTR("voiced"),
    CFSTR("wifid"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HMDShouldRedactBundleIdForBuildType_knownBundleIdentifiers;
  HMDShouldRedactBundleIdForBuildType_knownBundleIdentifiers = v0;

}

@end
