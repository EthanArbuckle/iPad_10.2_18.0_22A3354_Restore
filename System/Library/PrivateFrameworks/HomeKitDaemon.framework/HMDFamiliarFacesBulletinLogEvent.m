@implementation HMDFamiliarFacesBulletinLogEvent

- (HMDFamiliarFacesBulletinLogEvent)initWithContainsFaceClassification:(BOOL)a3 numberOfKnownPersons:(int64_t)a4 numberOfUnknownPersons:(int64_t)a5 bulletinReason:(id)a6 doorbellPressed:(BOOL)a7 secondsFromDoorbellToFaceClassification:(double)a8
{
  id v14;
  HMDFamiliarFacesBulletinLogEvent *v15;
  HMDFamiliarFacesBulletinLogEvent *v16;
  uint64_t v17;
  NSString *bulletinReason;
  objc_super v20;

  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDFamiliarFacesBulletinLogEvent;
  v15 = -[HMMLogEvent init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_containsFaceClassification = a3;
    v15->_numberOfKnownPersons = a4;
    v15->_numberOfUnknownPersons = a5;
    v17 = objc_msgSend(v14, "copy");
    bulletinReason = v16->_bulletinReason;
    v16->_bulletinReason = (NSString *)v17;

    v16->_doorbellPressed = a7;
    v16->_secondsFromDoorbellToFaceClassification = a8;
  }

  return v16;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.familiarFacesBulletin");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("containsFaceClassification_BOOL");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDFamiliarFacesBulletinLogEvent containsFaceClassification](self, "containsFaceClassification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("containsFaceClassification_INT");
  v4 = -[HMDFamiliarFacesBulletinLogEvent containsFaceClassification](self, "containsFaceClassification");
  v5 = &unk_24E96A3D0;
  if (v4)
    v5 = &unk_24E96A3B8;
  v18[1] = v5;
  v17[2] = CFSTR("numberOfKnownPersons");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intervalIndexForValue:", -[HMDFamiliarFacesBulletinLogEvent numberOfKnownPersons](self, "numberOfKnownPersons"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = CFSTR("numberOfUnknownPersons");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intervalIndexForValue:", -[HMDFamiliarFacesBulletinLogEvent numberOfUnknownPersons](self, "numberOfUnknownPersons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  v17[4] = CFSTR("bulletinReason");
  -[HMDFamiliarFacesBulletinLogEvent bulletinReason](self, "bulletinReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  v17[5] = CFSTR("doorbellPressed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDFamiliarFacesBulletinLogEvent doorbellPressed](self, "doorbellPressed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v11;
  v17[6] = CFSTR("secondsFromDoorbellToFaceClassification");
  +[HMDLogEventHistograms lowVolumeHistogram](HMDLogEventHistograms, "lowVolumeHistogram");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFamiliarFacesBulletinLogEvent secondsFromDoorbellToFaceClassification](self, "secondsFromDoorbellToFaceClassification");
  objc_msgSend(v12, "intervalIndexForValue:", (unint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v15;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)containsFaceClassification
{
  return self->_containsFaceClassification;
}

- (int64_t)numberOfKnownPersons
{
  return self->_numberOfKnownPersons;
}

- (int64_t)numberOfUnknownPersons
{
  return self->_numberOfUnknownPersons;
}

- (NSString)bulletinReason
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)doorbellPressed
{
  return self->_doorbellPressed;
}

- (double)secondsFromDoorbellToFaceClassification
{
  return self->_secondsFromDoorbellToFaceClassification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletinReason, 0);
}

@end
