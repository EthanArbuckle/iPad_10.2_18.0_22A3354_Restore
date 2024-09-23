@implementation HMSymptom

- (HMSymptom)initWithType:(int64_t)a3
{
  HMSymptom *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMSymptom;
  result = -[HMSymptom init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)description
{
  int64_t v2;
  __CFString *v3;
  id result;

  v2 = -[HMSymptom type](self, "type") - 1;
  v3 = CFSTR("HMSymptomTypeNeediCloudCredential");
  switch(v2)
  {
    case 0:
      goto LABEL_27;
    case 1:
      result = CFSTR("HMSymptomTypeNeediTunesCredential");
      break;
    case 2:
      result = CFSTR("HMSymptomTypeNeedHomeKitFix");
      break;
    case 3:
      result = CFSTR("HMSymptomTypeNeedWiFiFix");
      break;
    case 4:
      result = CFSTR("HMSymptomTypeNeedWiFiPerformanceFix");
      break;
    case 5:
      result = CFSTR("HMSymptomTypeNeedInternetFix");
      break;
    case 6:
      result = CFSTR("HMSymptomTypeNeedHardwareFix");
      break;
    case 7:
      result = CFSTR("HMSymptomTypeStereoVersionMismatch");
      break;
    case 8:
      result = CFSTR("HMSymptomTypeStereoNotFound");
      break;
    case 9:
      result = CFSTR("HMSymptomTypeStereoError");
      break;
    case 10:
      result = CFSTR("HMSymptomTypeWiFiNetworkMismatch");
      break;
    case 11:
      result = CFSTR("HMSymptomTypeNoConfiguredTargets");
      break;
    case 12:
      result = CFSTR("HMSymptomTypeVPNProfileExpired");
      break;
    case 13:
      result = CFSTR("HMSymptomTypeNeed8021xNetworkFix");
      break;
    case 14:
      result = CFSTR("HMSymptomTypeNeedWiFiSecurityFix");
      break;
    case 15:
      result = CFSTR("HMSymptomTypeNeedNetworkProfileFix");
      break;
    case 16:
      result = CFSTR("HMSymptomTypeNeedNetworkProfileInstall");
      break;
    case 17:
      result = CFSTR("HMSymptomTypeNetworkNotShareable");
      break;
    case 18:
      result = CFSTR("HMSymptomTypeNeedCaptiveLeaseRenewal");
      break;
    case 19:
      result = CFSTR("HMSymptomTypeNeedCDPFix");
      break;
    case 20:
      result = CFSTR("HMSymptomTypePrimaryResidentUnreachable");
      break;
    default:
      if (CFSTR("HMSymptomTypeNeediCloudCredential") == (__CFString *)999)
      {
        result = CFSTR("HMSymptomTypeNeedGeneralFix");
      }
      else if (CFSTR("HMSymptomTypeNeediCloudCredential") == (__CFString *)1000)
      {
        result = CFSTR("HMSymptomTypeFixInProgress");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown symptom type: %ld>"), CFSTR("HMSymptomTypeNeediCloudCredential"));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_27:
        result = v3;
      }
      break;
  }
  return result;
}

- (HMSymptom)initWithCoder:(id)a3
{
  id v4;
  HMSymptom *v5;

  v4 = a3;
  v5 = -[HMSymptom init](self, "init");
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMS.type"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSymptom type](self, "type"), CFSTR("HMS.type"));

}

- (BOOL)isEqual:(id)a3
{
  HMSymptom *v4;
  HMSymptom *v5;
  HMSymptom *v6;
  int64_t v7;
  BOOL v8;

  v4 = (HMSymptom *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = -[HMSymptom type](self, "type");
      v8 = v7 == -[HMSymptom type](v6, "type");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int64_t)type
{
  return self->_type;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
