@implementation VNImageAestheticsScoresObservation

- (VNImageAestheticsScoresObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageAestheticsScoresObservation *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNImageAestheticsScoresObservation;
  v5 = -[VNObservation initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("isUtility"));
    v5->_isUtility = v6 != 0.0;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("OverallScore"));
    v5->_overallScore = v7;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("AestheticsScore"));
    v5->_aestheticScore = v8;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("FailureScore"));
    v5->_failureScore = v9;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("JunkNegative"));
    v5->_junkNegativeScore = v10;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("JunkTragicFailure"));
    v5->_junkTragicFailureScore = v11;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PoorQuality"));
    v5->_poorQualityScore = v12;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("NonMemorable"));
    v5->_nonMemorableScore = v13;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("ScreenShot"));
    v5->_screenShotScore = v14;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("ReceiptOrDocument"));
    v5->_receiptOrDocumentScore = v15;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("TextDocument"));
    v5->_textDocumentScore = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VNImageAestheticsScoresObservation;
  v4 = a3;
  -[VNObservation encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  LODWORD(v5) = 0;
  if (self->_isUtility)
    *(float *)&v5 = 1.0;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("isUtility"), v5, v16.receiver, v16.super_class);
  *(float *)&v6 = self->_overallScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("OverallScore"), v6);
  *(float *)&v7 = self->_aestheticScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("AestheticsScore"), v7);
  *(float *)&v8 = self->_failureScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("FailureScore"), v8);
  *(float *)&v9 = self->_junkNegativeScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("JunkNegative"), v9);
  *(float *)&v10 = self->_junkTragicFailureScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("JunkTragicFailure"), v10);
  *(float *)&v11 = self->_poorQualityScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PoorQuality"), v11);
  *(float *)&v12 = self->_nonMemorableScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("NonMemorable"), v12);
  *(float *)&v13 = self->_screenShotScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("ScreenShot"), v13);
  *(float *)&v14 = self->_receiptOrDocumentScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("ReceiptOrDocument"), v14);
  *(float *)&v15 = self->_textDocumentScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("TextDocument"), v15);

}

- (id)_initWithOriginatingRequestSpecifier:(id)a3 isUtility:(BOOL)a4 overallScore:(float)a5 aestheticScore:(float)a6 failureScore:(float)a7 junkNegativeScore:(float)a8 junkTragicFailureScore:(float)a9 poorQualityScore:(float)a10 nonMemorableScore:(float)a11 screenShotScore:(float)a12 receiptOrDocumentScore:(float)a13 textDocumentScore:(float)a14
{
  id result;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VNImageAestheticsScoresObservation;
  result = -[VNObservation initWithOriginatingRequestSpecifier:](&v24, sel_initWithOriginatingRequestSpecifier_, a3);
  if (result)
  {
    *((_BYTE *)result + 96) = a4;
    *((float *)result + 25) = a5;
    *((float *)result + 26) = a6;
    *((float *)result + 27) = a7;
    *((float *)result + 28) = a8;
    *((float *)result + 29) = a9;
    *((float *)result + 30) = a10;
    *((float *)result + 31) = a11;
    *((float *)result + 32) = a12;
    *((float *)result + 33) = a13;
    *((float *)result + 34) = a14;
  }
  return result;
}

- (id)vn_cloneObject
{
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNImageAestheticsScoresObservation;
  -[VNObservation vn_cloneObject](&v5, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *(_BYTE *)(v3 + 96) = self->_isUtility;
    *(float *)(v3 + 100) = self->_overallScore;
    *(float *)(v3 + 104) = self->_aestheticScore;
    *(float *)(v3 + 108) = self->_failureScore;
    *(float *)(v3 + 112) = self->_junkNegativeScore;
    *(float *)(v3 + 116) = self->_junkTragicFailureScore;
    *(float *)(v3 + 120) = self->_poorQualityScore;
    *(float *)(v3 + 124) = self->_nonMemorableScore;
    *(float *)(v3 + 128) = self->_screenShotScore;
    *(float *)(v3 + 132) = self->_receiptOrDocumentScore;
    *(float *)(v3 + 136) = self->_textDocumentScore;
  }
  return (id)v3;
}

- (BOOL)isUtility
{
  return self->_isUtility;
}

- (float)overallScore
{
  return self->_overallScore;
}

- (float)aestheticScore
{
  return self->_aestheticScore;
}

- (float)failureScore
{
  return self->_failureScore;
}

- (float)junkNegativeScore
{
  return self->_junkNegativeScore;
}

- (float)junkTragicFailureScore
{
  return self->_junkTragicFailureScore;
}

- (float)poorQualityScore
{
  return self->_poorQualityScore;
}

- (float)nonMemorableScore
{
  return self->_nonMemorableScore;
}

- (float)screenShotScore
{
  return self->_screenShotScore;
}

- (float)receiptOrDocumentScore
{
  return self->_receiptOrDocumentScore;
}

- (float)textDocumentScore
{
  return self->_textDocumentScore;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCalculateImageAestheticsScoresRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)observationForOriginatingRequestSpecifier:(id)a3 isUtility:(BOOL)a4 overallScore:(float)a5 aestheticScore:(float)a6 failureScore:(float)a7 junkNegativeScore:(float)a8 junkTragicFailureScore:(float)a9 poorQualityScore:(float)a10 nonMemorableScore:(float)a11 screenShotScore:(float)a12 receiptOrDocumentScore:(float)a13 textDocumentScore:(float)a14 error:(id *)a15
{
  _BOOL8 v22;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;

  v22 = a4;
  v24 = a3;
  *(float *)&v25 = (float)v22;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("is utility"), a15, v25))goto LABEL_13;
  *(float *)&v26 = a5;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("overall score"), a15, v26))goto LABEL_13;
  *(float *)&v27 = a6;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("aesthetic score"), a15, v27))goto LABEL_13;
  *(float *)&v28 = a7;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("failure"), a15, v28))goto LABEL_13;
  *(float *)&v29 = a8;
  if (+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("junk negative"), a15, v29)&& (*(float *)&v30 = a9, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("junk tragic failure"), a15, v30))&& (*(float *)&v31 = a10, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("poor quality"), a15, v31))
    && (*(float *)&v32 = a11,
        +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("non memorable"), a15, v32))&& (*(float *)&v33 = a12, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("screen shot"), a15, v33))&& (*(float *)&v34 = a13, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("receipt or document"), a15, v34))
    && (*(float *)&v35 = a14,
        +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("text document"), a15, v35)))
  {
    v36 = objc_alloc((Class)a1);
    *(float *)&v37 = a5;
    *(float *)&v38 = a6;
    *(float *)&v39 = a7;
    *(float *)&v40 = a8;
    *(float *)&v41 = a9;
    *(float *)&v42 = a10;
    *(float *)&v44 = a12;
    *(float *)&v43 = a11;
    v45 = (void *)objc_msgSend(v36, "_initWithOriginatingRequestSpecifier:isUtility:overallScore:aestheticScore:failureScore:junkNegativeScore:junkTragicFailureScore:poorQualityScore:nonMemorableScore:screenShotScore:receiptOrDocumentScore:textDocumentScore:", v24, v22, v37, v38, v39, v40, v41, v42, v43, v44, __PAIR64__(LODWORD(a14), LODWORD(a13)));
  }
  else
  {
LABEL_13:
    v45 = 0;
  }

  return v45;
}

@end
