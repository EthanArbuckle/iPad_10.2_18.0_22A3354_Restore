@implementation CSMagSafeAccessory

+ (CSMagSafeAccessory)accessoryWithType:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setType:", a3);
  objc_msgSend(v9, "setPrimaryColor:", v8);

  objc_msgSend(v9, "setSecondaryColor:", v7);
  return (CSMagSafeAccessory *)v9;
}

- (CSMagSafeAccessory)initWithDictionary:(id)a3 endpointUUID:(id)a4
{
  id v6;
  id v7;
  CSMagSafeAccessory *v8;
  CSMagSafeAccessory *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  UIColor *primaryColor;
  void *v14;
  uint64_t v15;
  UIColor *secondaryColor;
  double v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CSMagSafeAccessory;
  v8 = -[CSMagSafeAccessory init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpointUUID, a4);
    v10 = -[CSMagSafeAccessory _accessoryTypeFromDictionary:](v9, "_accessoryTypeFromDictionary:", v6);
    v9->_type = -[CSMagSafeAccessory _accessoryTypeForNFCtype:](v9, "_accessoryTypeForNFCtype:", v10);
    v9->_isSupported = -[CSMagSafeAccessory _isSupportedFromDictionary:](v9, "_isSupportedFromDictionary:", v6);
    v9->_blocksWallet = -[CSMagSafeAccessory _blocksWalletAnimationForNFCtype:](v9, "_blocksWalletAnimationForNFCtype:", v10);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D153B0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSMagSafeAccessory colorForP3ColorData:](v9, "colorForP3ColorData:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    primaryColor = v9->_primaryColor;
    v9->_primaryColor = (UIColor *)v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D153B8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSMagSafeAccessory colorForP3ColorData:](v9, "colorForP3ColorData:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    secondaryColor = v9->_secondaryColor;
    v9->_secondaryColor = (UIColor *)v15;

    -[CSMagSafeAccessory _delayFromDictionary:](v9, "_delayFromDictionary:", v6);
    v9->_attachAnimationDelay = v17;
  }

  return v9;
}

- (BOOL)blocksAttachAnimationForAccessoryType:(int64_t)a3
{
  return a3 == 8 && self->_blocksWallet;
}

- (id)colorForP3ColorData:(id)a3
{
  id v3;
  double *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "length") & 0xFFFFFFFFFFFFFFF8) == 0x20)
  {
    v4 = (double *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDisplayP3Red:green:blue:alpha:", *v4, v4[1], v4[2], v4[3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldLockScreenWhenAttached
{
  return self->_type == 6;
}

- (BOOL)isWindowed
{
  return self->_type == 6;
}

- (BOOL)shouldDelayAnimation
{
  double v2;

  -[CSMagSafeAccessory attachAnimationDelay](self, "attachAnimationDelay");
  return v2 > 0.0;
}

- (BOOL)shouldShowAnimation
{
  return (unint64_t)(self->_type - 2) < 7;
}

- (BOOL)hasStaticView
{
  return self->_type == 6;
}

- (BOOL)chimeOnDetach
{
  return self->_type == 8;
}

- (int64_t)_accessoryTypeForNFCtype:(unsigned __int8)a3
{
  int64_t result;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;

  if ((int)a3 <= 113)
  {
    result = 1;
    switch(a3)
    {
      case '9':
        goto LABEL_6;
      case ':':
      case ';':
      case '<':
      case '=':
      case '>':
      case '?':
      case '@':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
        goto LABEL_19;
      case 'A':
      case 'V':
        return 6;
      case 'B':
        return result;
      case 'C':
      case 'D':
      case 'E':
        goto LABEL_10;
      case 'L':
      case 'M':
      case 'N':
        return 3;
      case 'S':
      case 'T':
      case 'U':
        goto LABEL_9;
      case 'W':
      case 'X':
        return 8;
      default:
        if (a3)
          goto LABEL_19;
        SBLogCommon();
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

        if (v5)
          NSLog(CFSTR("Not a valid accessory type"));
        goto LABEL_21;
    }
  }
  switch(a3)
  {
    case 0x80u:
LABEL_8:
      result = 7;
      break;
    case 0x81u:
LABEL_9:
      result = 5;
      break;
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x86u:
    case 0x87u:
LABEL_19:
      SBLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

      if (v7)
        NSLog(CFSTR("Not implemented accessory type"));
LABEL_21:
      result = 0;
      break;
    case 0x85u:
LABEL_10:
      result = 2;
      break;
    case 0x88u:
      result = 9;
      break;
    default:
      switch(a3)
      {
        case 0x90u:
          goto LABEL_8;
        case 0x91u:
          goto LABEL_9;
        case 0x92u:
        case 0x94u:
          goto LABEL_19;
        case 0x93u:
LABEL_6:
          result = 10;
          break;
        case 0x95u:
          goto LABEL_10;
        default:
          if (a3 != 114)
            goto LABEL_19;
          result = 4;
          break;
      }
      break;
  }
  return result;
}

- (BOOL)_blocksWalletAnimationForNFCtype:(unsigned __int8)a3
{
  return a3 == 67;
}

- (unsigned)_accessoryTypeFromDictionary:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D153C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "charValue");

  return v4;
}

- (BOOL)_isSupportedFromDictionary:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D153C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (double)_delayFromDictionary:(id)a3
{
  void *v3;
  double v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D153D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(int)objc_msgSend(v3, "intValue") / 1000.0;

  return v4;
}

- (id)accessoryTypeString
{
  unint64_t type;

  type = self->_type;
  if (type > 0xA)
    return CFSTR("Battery Pack");
  else
    return off_1E8E2F0D8[type];
}

- (id)description
{
  void *v3;
  NSString *endpointUUID;
  uint64_t v5;
  void *v6;
  UIColor *secondaryColor;
  UIColor *primaryColor;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  endpointUUID = self->_endpointUUID;
  -[CSMagSafeAccessory accessoryTypeString](self, "accessoryTypeString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  secondaryColor = (UIColor *)CFSTR("N/A");
  primaryColor = self->_primaryColor;
  if (!primaryColor)
    primaryColor = (UIColor *)CFSTR("N/A");
  if (self->_secondaryColor)
    secondaryColor = self->_secondaryColor;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory endpointUUID: %@, type: %@, allows: %d, primary color: %@, secondary color: %@"), endpointUUID, v5, self->_isSupported, primaryColor, secondaryColor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)visibleScreenCoordinates
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  if (-[CSMagSafeAccessory isWindowed](self, "isWindowed"))
  {
    +[CSMagSafeAccessoryConfiguration defaultConfiguration](CSMagSafeAccessoryConfiguration, "defaultConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "visibleScreenCoordinatesForSleeve");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryColor, a3);
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (double)attachAnimationDelay
{
  return self->_attachAnimationDelay;
}

- (BOOL)blocksWallet
{
  return self->_blocksWallet;
}

- (void)setBlocksWallet:(BOOL)a3
{
  self->_blocksWallet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

@end
