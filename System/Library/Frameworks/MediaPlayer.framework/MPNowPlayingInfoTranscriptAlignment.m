@implementation MPNowPlayingInfoTranscriptAlignment

- (MPNowPlayingInfoTranscriptAlignment)initWithPlayerStartTime:(double)a3 playerEndTime:(double)a4 referenceStartTime:(double)a5 referenceEndTime:(double)a6 matchedBeginning:(BOOL)a7 matchedEnd:(BOOL)a8
{
  MPNowPlayingInfoTranscriptAlignment *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MPNowPlayingInfoTranscriptAlignment;
  result = -[MPNowPlayingInfoTranscriptAlignment init](&v15, sel_init);
  if (result)
  {
    result->_playerStartTime = a3;
    result->_playerEndTime = a4;
    result->_referenceStartTime = a5;
    result->_referenceEndTime = a6;
    result->_matchedBeginning = a7;
    result->_matchedEnd = a8;
  }
  return result;
}

- (MPNowPlayingInfoTranscriptAlignment)initWithMRTranscriptAlignment:(id)a3
{
  id v4;
  MPNowPlayingInfoTranscriptAlignment *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPNowPlayingInfoTranscriptAlignment;
  v5 = -[MPNowPlayingInfoTranscriptAlignment init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "playerStartTime");
    v5->_playerStartTime = v6;
    objc_msgSend(v4, "playerEndTime");
    v5->_playerEndTime = v7;
    objc_msgSend(v4, "referenceStartTime");
    v5->_referenceStartTime = v8;
    objc_msgSend(v4, "referenceEndTime");
    v5->_referenceEndTime = v9;
    v5->_matchedBeginning = objc_msgSend(v4, "matchedBeginning");
    v5->_matchedEnd = objc_msgSend(v4, "matchedEnd");
  }

  return v5;
}

- (MRTranscriptAlignment)mrTranscriptAlignment
{
  return (MRTranscriptAlignment *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C640]), "initWithPlayerStartTime:playerEndTime:referenceStartTime:referenceEndTime:matchedBeginning:matchedEnd:", self->_matchedBeginning, self->_matchedEnd, self->_playerStartTime, self->_playerEndTime, self->_referenceStartTime, self->_referenceEndTime);
}

- (MPTranscriptAlignment)mpTranscriptAlignment
{
  return -[MPTranscriptAlignment initWithPlayerStartTime:playerEndTime:referenceStartTime:referenceEndTime:matchedBeginning:matchedEnd:]([MPTranscriptAlignment alloc], "initWithPlayerStartTime:playerEndTime:referenceStartTime:referenceEndTime:matchedBeginning:matchedEnd:", self->_matchedBeginning, self->_matchedEnd, self->_playerStartTime, self->_playerEndTime, self->_referenceStartTime, self->_referenceEndTime);
}

- (double)playerStartTime
{
  return self->_playerStartTime;
}

- (double)playerEndTime
{
  return self->_playerEndTime;
}

- (double)referenceStartTime
{
  return self->_referenceStartTime;
}

- (double)referenceEndTime
{
  return self->_referenceEndTime;
}

- (BOOL)matchedBeginning
{
  return self->_matchedBeginning;
}

- (BOOL)matchedEnd
{
  return self->_matchedEnd;
}

@end
