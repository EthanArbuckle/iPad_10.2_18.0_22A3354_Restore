@implementation HearingMLHelperServiceInterface

void __HearingMLHelperServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25503D6B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HearingMLHelperServiceInterface__Interface;
  HearingMLHelperServiceInterface__Interface = v0;

  HearingMLHelperSecureCodingClasses();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)HearingMLHelperServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_, 0, 0);
  objc_msgSend((id)HearingMLHelperServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_, 1, 0);
  objc_msgSend((id)HearingMLHelperServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_, 2, 0);
  objc_msgSend((id)HearingMLHelperServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_, 0, 1);
  objc_msgSend((id)HearingMLHelperServiceInterface__Interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_, 1, 1);

}

@end
