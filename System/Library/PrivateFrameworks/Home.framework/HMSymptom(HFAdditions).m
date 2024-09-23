@implementation HMSymptom(HFAdditions)

- (uint64_t)hf_generatedByHomeAppForDebuggingPurposes
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("kHMSymptomhf_generatedByHomeAppForDebuggingPurposesKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)hf_setGeneratedByHomeAppForDebuggingPurposes:()HFAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("kHMSymptomhf_generatedByHomeAppForDebuggingPurposesKey"), v2, (void *)0x301);

}

- (id)hf_shortDescription
{
  uint64_t v1;
  void *v2;
  __CFString *v3;

  v1 = objc_msgSend(a1, "type");
  switch(v1)
  {
    case 1:
    case 2:
    case 20:
      v3 = CFSTR("HFSymptomDescriptionProblemAccount");
      goto LABEL_14;
    case 3:
    case 7:
      v3 = CFSTR("HFSymptomDescriptionNeedsService");
      goto LABEL_14;
    case 4:
    case 11:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      HFLocalizedWiFiString(CFSTR("HFSymptomDescriptionProblemWiFiNetwork"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    case 5:
      v3 = CFSTR("HFSymptomDescriptionProblemWifiPerformanceFix");
      goto LABEL_14;
    case 6:
      v3 = CFSTR("HFSymptomDescriptionProblemInternet");
      goto LABEL_14;
    case 8:
      v3 = CFSTR("HFSymptomDescriptionStereoVersionMismatch");
      goto LABEL_14;
    case 9:
      v3 = CFSTR("HFSymptomDescriptionStereoNotFound");
      goto LABEL_14;
    case 10:
      v3 = CFSTR("HFSymptomDescriptionStereoError");
      goto LABEL_14;
    case 12:
      v3 = CFSTR("HFSymptomDescriptionTargetControlMissing");
      goto LABEL_14;
    case 13:
      v3 = CFSTR("HFSymptomDescriptionVPNProfileExpired");
      goto LABEL_14;
    default:
      if (v1 != 999)
        return 0;
      v3 = CFSTR("HMSymptomDescriptionSharedUserErrorNotification");
LABEL_14:
      _HFLocalizedStringWithDefaultValue(v3, v3, 1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
  }
}

@end
