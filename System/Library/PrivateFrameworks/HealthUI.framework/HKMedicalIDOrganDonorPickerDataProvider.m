@implementation HKMedicalIDOrganDonorPickerDataProvider

+ (id)displayValueForOrganDonorStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _BOOL4 v7;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("organ_donor_not_set");
      goto LABEL_9;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("organ_donor_yes");
      goto LABEL_9;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("organ_donor_no");
      goto LABEL_9;
    case 3uLL:
      v7 = +[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v7)
        v6 = CFSTR("organ_donor_registered");
      else
        v6 = CFSTR("organ_donor_register");
LABEL_9:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

+ (unint64_t)emergencyCardOrganDonorStatus:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "integerValue"), v5 <= 2))
    v6 = qword_1D7B81CA8[v5];
  else
    v6 = 0;

  return v6;
}

+ (id)medicalIDOrganDonorStatus:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return (id)qword_1E9C43060[a3 - 1];
}

+ (int64_t)numberOfRowsWithDonateLifeSignup:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 4;
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant", v3, v4))
  {
    return 4;
  }
  return 3;
}

@end
