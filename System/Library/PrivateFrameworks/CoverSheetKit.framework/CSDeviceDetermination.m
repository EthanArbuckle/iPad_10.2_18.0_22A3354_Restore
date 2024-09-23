@implementation CSDeviceDetermination

+ (unint64_t)baseCategory
{
  unint64_t result;

  if (_CS_Private_MainScreenClass_onceToken != -1)
    dispatch_once(&_CS_Private_MainScreenClass_onceToken, &__block_literal_global_5);
  result = 24;
  switch(_CS_Private_MainScreenClass_mainScreenClass)
  {
    case 5:
      result = 0;
      break;
    case 8:
      result = 1;
      break;
    case 9:
      result = 2;
      break;
    case 11:
      return result;
    case 14:
      result = 23;
      break;
    case 15:
      result = 4;
      break;
    case 18:
    case 19:
      if (_CS_Private_BaseIsN84OrSimilarDevice_onceToken != -1)
        dispatch_once(&_CS_Private_BaseIsN84OrSimilarDevice_onceToken, &__block_literal_global_9);
      if (_CS_Private_BaseIsN84OrSimilarDevice_baseIsN84OrSimilarDevice)
        result = 7;
      else
        result = 5;
      break;
    case 20:
    case 23:
      result = 26;
      break;
    case 21:
      result = 22;
      break;
    case 22:
      result = 9;
      break;
    case 24:
      if (_CS_Private_ProductType_onceToken != -1)
        dispatch_once(&_CS_Private_ProductType_onceToken, &__block_literal_global_8);
      if (_CS_Private_ProductType_productType == 689804742)
        result = 11;
      else
        result = 10;
      break;
    case 25:
      result = 16;
      break;
    case 28:
      result = 25;
      break;
    case 30:
      result = 13;
      break;
    case 31:
      result = 18;
      break;
    case 32:
      result = 30;
      break;
    case 33:
      result = 27;
      break;
    case 36:
      result = 15;
      break;
    case 37:
      result = 20;
      break;
    default:
      result = 32;
      break;
  }
  return result;
}

+ (unint64_t)categoryFromScreenSize
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");

  BSSizeRoundForScale();
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceClass");

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 2)
  {
    v8 = objc_msgSend(v6, "homeButtonType");

    if (v8 == 2)
    {
      if ((BSFloatGreaterThanFloat() & 1) != 0)
        return 30;
      if ((BSFloatGreaterThanFloat() & 1) != 0)
        return 29;
      if ((BSFloatGreaterThanFloat() & 1) != 0)
        return 27;
      if ((BSFloatGreaterThanFloat() & 1) != 0)
        return 26;
      if ((BSFloatGreaterThanFloat() & 1) != 0 || (BSSizeEqualToSize() & 1) != 0)
        return 25;
      if ((BSFloatGreaterThanFloat() & 1) != 0)
        return 31;
      if ((BSSizeEqualToSize() & 1) != 0)
        return 28;
      return 32;
    }
    if ((BSFloatGreaterThanFloat() & 1) != 0)
      return 24;
    if ((BSFloatGreaterThanFloat() & 1) != 0)
      return 23;
    if (BSFloatGreaterThanFloat())
      return 22;
    return 21;
  }
  v10 = objc_msgSend(v6, "deviceClass");

  if (v10)
    return 32;
  if (CSEffectiveArtworkSubtype_onceToken != -1)
    dispatch_once(&CSEffectiveArtworkSubtype_onceToken, &__block_literal_global_1);
  v11 = CSEffectiveArtworkSubtype_deviceSubtype;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "homeButtonType");

  if (v13 != 2)
  {
    if ((BSFloatGreaterThanFloat() & 1) != 0)
      return 2;
    else
      return BSFloatGreaterThanFloat();
  }
  if (_CS_Private_MainScreenClass_onceToken != -1)
    dispatch_once(&_CS_Private_MainScreenClass_onceToken, &__block_literal_global_5);
  if (_CS_Private_MainScreenClass_mainScreenClass == 22)
  {
    v14 = a1;
    v15 = 9;
    v16 = 8;
    return objc_msgSend(v14, "_zoomAwareCategoryForDevice:zoomVariant:", v15, v16);
  }
  if (_CS_Private_BaseIsN84OrSimilarDevice_onceToken != -1)
    dispatch_once(&_CS_Private_BaseIsN84OrSimilarDevice_onceToken, &__block_literal_global_9);
  if (_CS_Private_BaseIsN84OrSimilarDevice_baseIsN84OrSimilarDevice)
  {
    v14 = a1;
    v15 = 7;
    v16 = 6;
    return objc_msgSend(v14, "_zoomAwareCategoryForDevice:zoomVariant:", v15, v16);
  }
  if (BSFloatGreaterThanFloat())
  {
    v17 = 16;
    if (v11 == 2796)
      v17 = 18;
    v18 = v11 == 2868;
    v19 = 20;
LABEL_46:
    if (v18)
      return v19;
    else
      return v17;
  }
  if (BSFloatGreaterThanFloat())
  {
    v17 = 5;
    if (v11 == 2556)
      v17 = 13;
    v18 = v11 == 2622;
    v19 = 15;
    goto LABEL_46;
  }
  if (v11 > 2795)
  {
    if (v11 == 2796)
    {
      if ((BSFloatEqualToFloat() & 1) != 0)
        return 17;
    }
    else if (v11 == 2868 && (BSFloatEqualToFloat() & 1) != 0)
    {
      return 19;
    }
  }
  else if (v11 == 2556)
  {
    if ((BSFloatEqualToFloat() & 1) != 0)
      return 12;
  }
  else if (v11 == 2622 && (BSFloatEqualToFloat() & 1) != 0)
  {
    return 14;
  }
  if (BSFloatGreaterThanFloat())
  {
    if (_CS_Private_ProductType_onceToken != -1)
      dispatch_once(&_CS_Private_ProductType_onceToken, &__block_literal_global_8);
    if (_CS_Private_ProductType_productType == 689804742 || _CS_Private_ProductType_productType == 2309863438)
      return 11;
    else
      return 10;
  }
  else if ((BSFloatGreaterThanFloat() & 1) != 0)
  {
    return 4;
  }
  else
  {
    if ((BSFloatGreaterThanFloat() & 1) == 0)
      return 32;
    return 3;
  }
}

+ (BOOL)isCategoryPad:(unint64_t)a3
{
  return a3 - 21 < 0xB;
}

+ (BOOL)isCategoryPhone:(unint64_t)a3
{
  return (a3 > 0x20) | (0x1FFFFFuLL >> a3) & 1;
}

+ (unint64_t)_zoomAwareCategoryForDevice:(unint64_t)a3 zoomVariant:(unint64_t)a4
{
  objc_msgSend(a1, "_zoomScaleForBaseDevice:");
  if (objc_msgSend(a1, "_screenScaleMatchesZoomScale:"))
    return a4;
  else
    return a3;
}

+ (double)_zoomScaleForBaseDevice:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 4 <= 5)
    return dbl_1A9D468E8[a3 - 4];
  return result;
}

+ (BOOL)_screenScaleMatchesZoomScale:(double)a3
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nativeScale");
  v4 = BSFloatEqualToFloat();

  return v4;
}

@end
