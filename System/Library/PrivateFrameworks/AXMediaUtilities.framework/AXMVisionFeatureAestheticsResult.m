@implementation AXMVisionFeatureAestheticsResult

- (AXMVisionFeatureAestheticsResult)initWithVisionAestheticsObservation:(id)a3
{
  id v4;
  AXMVisionFeatureAestheticsResult *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  AXMVisionFeatureAestheticsResult *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMVisionFeatureAestheticsResult;
  v5 = -[AXMVisionFeatureAestheticsResult init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "aestheticScore");
    v5->_aestheticScore = v6;
    objc_msgSend(v4, "wellFramedSubjectScore");
    v5->_wellFramedSubjectScore = v7;
    objc_msgSend(v4, "wellChosenBackgroundScore");
    v5->_wellChosenBackgroundScore = v8;
    objc_msgSend(v4, "noiseScore");
    v5->_noiseScore = v9;
    objc_msgSend(v4, "failureScore");
    v5->_failureScore = v10;
    objc_msgSend(v4, "pleasantCompositionScore");
    v5->_pleasantCompositionScore = v11;
    v12 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureAestheticsResult)initWithCoder:(id)a3
{
  id v4;
  AXMVisionFeatureAestheticsResult *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  AXMVisionFeatureAestheticsResult *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMVisionFeatureAestheticsResult;
  v5 = -[AXMVisionFeatureAestheticsResult init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("aestheticScore"));
    v5->_aestheticScore = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("wellFramedSubjectScore"));
    v5->_wellFramedSubjectScore = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("wellChosenBackgroundScore"));
    v5->_wellChosenBackgroundScore = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("noiseScore"));
    v5->_noiseScore = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("failureScore"));
    v5->_failureScore = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pleasantCompositionScore"));
    v5->_pleasantCompositionScore = v11;
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[AXMVisionFeatureAestheticsResult aestheticScore](self, "aestheticScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("aestheticScore"));
  -[AXMVisionFeatureAestheticsResult wellFramedSubjectScore](self, "wellFramedSubjectScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("wellFramedSubjectScore"));
  -[AXMVisionFeatureAestheticsResult wellChosenBackgroundScore](self, "wellChosenBackgroundScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("wellChosenBackgroundScore"));
  -[AXMVisionFeatureAestheticsResult noiseScore](self, "noiseScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("noiseScore"));
  -[AXMVisionFeatureAestheticsResult failureScore](self, "failureScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("failureScore"));
  -[AXMVisionFeatureAestheticsResult pleasantCompositionScore](self, "pleasantCompositionScore");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("pleasantCompositionScore"));

}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXMVisionFeatureAestheticsResult aestheticScore](self, "aestheticScore");
  v5 = v4;
  -[AXMVisionFeatureAestheticsResult wellFramedSubjectScore](self, "wellFramedSubjectScore");
  v7 = v6;
  -[AXMVisionFeatureAestheticsResult wellChosenBackgroundScore](self, "wellChosenBackgroundScore");
  v9 = v8;
  -[AXMVisionFeatureAestheticsResult noiseScore](self, "noiseScore");
  v11 = v10;
  -[AXMVisionFeatureAestheticsResult failureScore](self, "failureScore");
  v13 = v12;
  -[AXMVisionFeatureAestheticsResult pleasantCompositionScore](self, "pleasantCompositionScore");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Aesthetics: aesthetic=%.2f wellFramedSubject=%.2f wellChosenBackground=%.2f noise=%.2f failure=%.2f pleasantComposition=%.2f"), *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, *(_QWORD *)&v13, v14);
}

- (float)aestheticScore
{
  return self->_aestheticScore;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (float)pleasantCompositionScore
{
  return self->_pleasantCompositionScore;
}

- (float)wellChosenBackgroundScore
{
  return self->_wellChosenBackgroundScore;
}

- (float)noiseScore
{
  return self->_noiseScore;
}

- (float)failureScore
{
  return self->_failureScore;
}

@end
