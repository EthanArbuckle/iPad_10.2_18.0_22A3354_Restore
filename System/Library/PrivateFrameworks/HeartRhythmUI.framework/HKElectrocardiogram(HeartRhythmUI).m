@implementation HKElectrocardiogram(HeartRhythmUI)

- (id)hrui_classificationShortBodyTextWithActiveAlgorithmVersion:()HeartRhythmUI isSharedData:
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  switch(objc_msgSend(a1, "privateClassification"))
  {
    case 1:
      if (a3 == 2)
      {
        v7 = CFSTR("ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_INCONCLUSIVE_POOR_RECORDING");
      }
      else
      {
        if (a3 != 1)
          goto LABEL_6;
        v7 = CFSTR("ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_INCONCLUSIVE_POOR_READING");
      }
      goto LABEL_14;
    case 2:
LABEL_6:
      v6 = CFSTR("ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_INCONCLUSIVE_OTHER");
      goto LABEL_19;
    case 3:
      v7 = CFSTR("ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_SINUS_RHYTHM_HEART_RATE_50_TO_100");
      goto LABEL_14;
    case 4:
    case 8:
      v6 = CFSTR("ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_ATRIAL_FIBRILLATION_HEART_RATE_50_TO_120");
      goto LABEL_19;
    case 5:
      v6 = CFSTR("ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_HEART_RATE_ABOVE_120");
      goto LABEL_19;
    case 6:
      if (a3 == 2)
      {
        v6 = CFSTR("ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_HEART_RATE_BELOW_50");
        goto LABEL_19;
      }
      if (a3 == 1)
      {
        v6 = CFSTR("ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_HEART_RATE_BELOW_50");
LABEL_19:
        -[__CFString hrui_appendForSharing:](v6, "hrui_appendForSharing:", a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        HRUIECGLocalizedString(v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        return v8;
      }
LABEL_13:
      v7 = CFSTR("ATRIAL_FIBRILLATION_CLASSIFICATION_SHORT_BODY_UNKNOWN");
LABEL_14:
      HRUIECGLocalizedString(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    case 7:
      v6 = CFSTR("ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_SINUS_TACHYCARDIA_HEART_RATE_100_TO_150");
      goto LABEL_19;
    case 9:
      v6 = CFSTR("ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_ATRIAL_FIBRILLATION_HEART_RATE_100_TO_150");
      goto LABEL_19;
    case 10:
      v6 = CFSTR("ATRIAL_FIBRILLATION_V2_CLASSIFICATION_SHORT_BODY_HEART_RATE_ABOVE_150");
      goto LABEL_19;
    default:
      goto LABEL_13;
  }
}

@end
