@implementation AAProxCardsInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAProxCardsInfo)initWithBluetoothAddress:(id)a3
{
  id v4;
  AAProxCardsInfo *v5;
  uint64_t v6;
  NSString *bluetoothAddress;
  AAProxCardsInfo *v8;

  v4 = a3;
  v5 = -[AAProxCardsInfo init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "uppercaseString");
    v6 = objc_claimAutoreleasedReturnValue();
    bluetoothAddress = v5->_bluetoothAddress;
    v5->_bluetoothAddress = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return -[AAProxCardsInfo descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v5;
  NSString *bluetoothAddress;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v15;
  NSString *v16;

  objc_msgSend((id)objc_opt_class(), "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v5 = 0;

  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    v16 = bluetoothAddress;
    NSAppendPrintF_safe();
    v7 = v5;

    v5 = v7;
  }
  if (self->_caseDoubleTapVersion)
  {
    NSAppendPrintF_safe();
    v8 = v5;

    v5 = v8;
  }
  if (self->_headGesturesVersion)
  {
    NSAppendPrintF_safe();
    v9 = v5;

    v5 = v9;
  }
  if (self->_heartRateVersion)
  {
    NSAppendPrintF_safe();
    v10 = v5;

    v5 = v10;
  }
  if (self->_voiceQualityVersion)
  {
    NSAppendPrintF_safe();
    v11 = v5;

    v5 = v11;
  }
  if (self->_whatsNewVersion)
  {
    NSAppendPrintF_safe();
    v12 = v5;

    v5 = v12;
  }
  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    v13 = v5;

    v5 = v13;
  }
  return v5;
}

- (AAProxCardsInfo)initWithCoder:(id)a3
{
  id v4;
  AAProxCardsInfo *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  AAProxCardsInfo *v12;

  v4 = a3;
  v5 = -[AAProxCardsInfo init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("caDT")))
      v5->_caseDoubleTapVersion = objc_msgSend(v7, "decodeInt64ForKey:", CFSTR("caDT"));

    v8 = v7;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("hGes")))
      v5->_headGesturesVersion = objc_msgSend(v8, "decodeInt64ForKey:", CFSTR("hGes"));

    v9 = v8;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("heRa")))
      v5->_heartRateVersion = objc_msgSend(v9, "decodeInt64ForKey:", CFSTR("heRa"));

    v10 = v9;
    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("voQu")))
      v5->_voiceQualityVersion = objc_msgSend(v10, "decodeInt64ForKey:", CFSTR("voQu"));

    v11 = v10;
    if (objc_msgSend(v11, "containsValueForKey:", CFSTR("wNew")))
      v5->_whatsNewVersion = objc_msgSend(v11, "decodeInt64ForKey:", CFSTR("wNew"));

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *bluetoothAddress;
  unint64_t caseDoubleTapVersion;
  unint64_t headGesturesVersion;
  unint64_t heartRateVersion;
  unint64_t voiceQualityVersion;
  unint64_t whatsNewVersion;
  id v11;

  v4 = a3;
  bluetoothAddress = self->_bluetoothAddress;
  v11 = v4;
  if (bluetoothAddress)
  {
    objc_msgSend(v4, "encodeObject:forKey:", bluetoothAddress, CFSTR("btAd"));
    v4 = v11;
  }
  caseDoubleTapVersion = self->_caseDoubleTapVersion;
  if (caseDoubleTapVersion)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", caseDoubleTapVersion, CFSTR("caDT"));
    v4 = v11;
  }
  headGesturesVersion = self->_headGesturesVersion;
  if (headGesturesVersion)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", headGesturesVersion, CFSTR("hGes"));
    v4 = v11;
  }
  heartRateVersion = self->_heartRateVersion;
  if (heartRateVersion)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", heartRateVersion, CFSTR("heRa"));
    v4 = v11;
  }
  voiceQualityVersion = self->_voiceQualityVersion;
  if (voiceQualityVersion)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", voiceQualityVersion, CFSTR("voQu"));
    v4 = v11;
  }
  whatsNewVersion = self->_whatsNewVersion;
  if (whatsNewVersion)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", whatsNewVersion, CFSTR("wNew"));
    v4 = v11;
  }

}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (unint64_t)caseDoubleTapVersion
{
  return self->_caseDoubleTapVersion;
}

- (void)setCaseDoubleTapVersion:(unint64_t)a3
{
  self->_caseDoubleTapVersion = a3;
}

- (unint64_t)headGesturesVersion
{
  return self->_headGesturesVersion;
}

- (void)setHeadGesturesVersion:(unint64_t)a3
{
  self->_headGesturesVersion = a3;
}

- (unint64_t)heartRateVersion
{
  return self->_heartRateVersion;
}

- (void)setHeartRateVersion:(unint64_t)a3
{
  self->_heartRateVersion = a3;
}

- (unint64_t)voiceQualityVersion
{
  return self->_voiceQualityVersion;
}

- (void)setVoiceQualityVersion:(unint64_t)a3
{
  self->_voiceQualityVersion = a3;
}

- (unint64_t)whatsNewVersion
{
  return self->_whatsNewVersion;
}

- (void)setWhatsNewVersion:(unint64_t)a3
{
  self->_whatsNewVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
