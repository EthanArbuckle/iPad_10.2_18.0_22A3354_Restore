@implementation HKDisplayCategory(BuiltinCategories)

- (UIImageSymbolConfiguration)multiColorImageConfiguration
{
  unint64_t v2;
  void *v3;

  v2 = -[HKDisplayCategory categoryID](self, "categoryID");
  v3 = 0;
  if (v2 <= 0x1E && ((1 << v2) & 0x44DFE332) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "hk_prefersMultiColorConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIImageSymbolConfiguration *)v3;
}

- (UIColor)color
{
  int64_t v2;
  void *v3;

  v2 = -[HKDisplayCategory categoryID](self, "categoryID");
  v3 = 0;
  switch(v2)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_nutritionKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_bodyMeasurementsKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_profileKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_reproductiveHealthKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_clinicalDocumentsKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_mindfulnessKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_heartKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_hearingHealthKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_respiratoryKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_otherKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
    case 20:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_labResultsClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_allergiesClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_conditionsClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_immunizationsClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_medicationsClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_proceduresClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_mobilityKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 26:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_symptomsKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_insuranceClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 30:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_clinicalNotesClinicalKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 31:
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_medicationTrackingKeyColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (UIColor *)v3;
  }
  return (UIColor *)v3;
}

@end
