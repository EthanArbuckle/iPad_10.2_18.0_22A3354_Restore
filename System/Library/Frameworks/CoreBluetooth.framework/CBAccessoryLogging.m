@implementation CBAccessoryLogging

+ (id)getProductNameFromProductID:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  id result;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MobileBluetooth"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a3 - 8194;
  v7 = CFSTR("Beats Studio Pro");
  switch(v6)
  {
    case 0uLL:
      v9 = CFSTR("AIRPODS");
      v10 = CFSTR("AirPods");
      goto LABEL_16;
    case 1uLL:
      v9 = CFSTR("POWERBEATS3");
      v10 = CFSTR("Powerbeats³");
      goto LABEL_16;
    case 3uLL:
      v9 = CFSTR("BEATSX");
      v10 = CFSTR("Beatsˣ");
      goto LABEL_16;
    case 4uLL:
      v9 = CFSTR("SOLO3");
      v10 = CFSTR("Beats Solo³");
      goto LABEL_16;
    case 7uLL:
      v9 = CFSTR("BEATSSTUDIO3");
      v10 = CFSTR("Beats Studio³");
      goto LABEL_16;
    case 8uLL:
    case 0x1DuLL:

      return CFSTR("AirPods Max");
    case 9uLL:
      v9 = CFSTR("POWERBEATSPRO");
      v10 = CFSTR("PowerBeats Pro");
      goto LABEL_16;
    case 0xAuLL:
      v9 = CFSTR("SOLOPRO");
      v10 = CFSTR("Beats Solo Pro");
LABEL_16:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v9, v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
    case 0xBuLL:

      return CFSTR("Powerbeats 4");
    case 0xCuLL:
    case 0x12uLL:
    case 0x22uLL:

      return CFSTR("AirPods Pro");
    case 0xDuLL:

      return CFSTR("AirPods 2");
    case 0xEuLL:

      return CFSTR("Beats Flex");
    case 0xFuLL:

      return CFSTR("Beats Studio Buds");
    case 0x11uLL:

      return CFSTR("AirPods 3");
    case 0x13uLL:
    case 0x16uLL:
    case 0x1AuLL:

      return CFSTR("AirPods Case");
    case 0x14uLL:

      return CFSTR("Beats Studio Buds +");
    case 0x15uLL:
      goto LABEL_3;
    case 0x17uLL:
    case 0x19uLL:
    case 0x1CuLL:
    case 0x1EuLL:
      v7 = CFSTR("AirPods");
LABEL_3:

      result = v7;
      break;
    default:

      result = CFSTR("Unknown");
      break;
  }
  return result;
}

+ (unint64_t)getComponentIDFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22)
    return 1210810;
  else
    return qword_1A83348B0[a3 - 8194];
}

+ (id)getComponentNameFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22)
    return CFSTR("AudioProducts FW");
  else
    return off_1E5400438[a3 - 8194];
}

+ (id)getComponentVersionFromProductID:(unint64_t)a3
{
  if (a3 - 8194 > 0x22)
    return CFSTR("All");
  else
    return off_1E5400550[a3 - 8194];
}

+ (unint64_t)getComponentIDFromRadarReason:(int)a3
{
  if (a3 == 5)
    return 1046269;
  else
    return 1210810;
}

+ (id)getComponentNameFromRadarReason:(int)a3
{
  if (a3 == 5)
    return CFSTR("SpockEngine");
  else
    return CFSTR("AudioProducts FW");
}

+ (id)getComponentVersionFromRadarReason:(int)a3
{
  if (a3 == 5)
    return CFSTR("New Bugs");
  else
    return CFSTR("All");
}

@end
