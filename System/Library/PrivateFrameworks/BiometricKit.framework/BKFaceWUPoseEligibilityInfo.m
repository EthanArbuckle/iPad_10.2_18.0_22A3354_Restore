@implementation BKFaceWUPoseEligibilityInfo

- (BKFaceWUPoseEligibilityInfo)initWithDictionary:(id)a3
{
  id v4;
  BKFaceWUPoseEligibilityInfo *v5;
  BKFaceWUPoseEligibilityInfo *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKFaceWUPoseEligibilityInfo;
  v5 = -[BKFaceWUPoseEligibilityInfo init](&v10, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceWUPoseEligible"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v6->_isEligible = objc_msgSend(v7, "BOOLValue");

  }
  return v6;
}

- (BOOL)isEligible
{
  return self->_isEligible;
}

@end
