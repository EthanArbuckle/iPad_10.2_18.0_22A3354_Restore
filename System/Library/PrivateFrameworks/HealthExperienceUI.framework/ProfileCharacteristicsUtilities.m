@implementation ProfileCharacteristicsUtilities

+ (int64_t)characteristicsTypeCountForDisplayType:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "displayTypeIdentifier");
  if (v3 > 87)
  {
    if (v3 != 88)
    {
      if (v3 == 103)
        return 3;
      return 0;
    }
    return 7;
  }
  else
  {
    if (v3 != 64)
    {
      if (v3 == 66)
        return 9;
      return 0;
    }
    return 4;
  }
}

+ (id)displayStringForBiologicalSex:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 3:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("OTHER");
      break;
    case 2:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("MALE");
      break;
    case 1:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("FEMALE");
      break;
    default:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("BIOLOGICAL_SEX_NOT_SET");
      break;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)displayStringForBloodType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_a+");
      break;
    case 2:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_a-");
      break;
    case 3:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_b+");
      break;
    case 4:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_b-");
      break;
    case 5:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_ab+");
      break;
    case 6:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_ab-");
      break;
    case 7:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_o+");
      break;
    case 8:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_o-");
      break;
    default:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("BLOOD_TYPE_NOT_SET");
      break;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)displayStringForFitzpatrickSkinType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("FITZPATRICK_SKIN_TYPE_NOT_SET");
      goto LABEL_10;
    case 1:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_I");
      goto LABEL_10;
    case 2:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_II");
      goto LABEL_10;
    case 3:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_III");
      goto LABEL_10;
    case 4:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_IV");
      goto LABEL_10;
    case 5:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_V");
      goto LABEL_10;
    case 6:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_VI");
LABEL_10:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)displayStringForWheelchairUse:(int64_t)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    HKWheelchairUseDisplayName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WDBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WHEELCHAIR_USE_NOT_SET"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
