@implementation BKMatchPearlResultInfo

- (BKMatchPearlResultInfo)initWithServerIdentity:(id)a3 details:(id)a4 device:(id)a5
{
  id v8;
  BKMatchPearlResultInfo *v9;
  BKMatchPearlResultInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKMatchPearlResultInfo;
  v9 = -[BKMatchResultInfo initWithServerIdentity:details:device:](&v15, sel_initWithServerIdentity_details_device_, a3, v8, a5);
  v10 = v9;
  if (v9)
  {
    v9->_feedback = 1;
    v9->_periocularMatchState = 0;
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKMatchDetailFaceDetectFeedback"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        v10->_feedback = __faceDetectFeedback(objc_msgSend(v11, "integerValue"));
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BKMatchDetailPOMatchState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v10->_periocularMatchState = objc_msgSend(v13, "integerValue") & 0x3F;

    }
  }

  return v10;
}

- (int64_t)feedback
{
  return self->_feedback;
}

- (unint64_t)periocularMatchState
{
  return self->_periocularMatchState;
}

@end
