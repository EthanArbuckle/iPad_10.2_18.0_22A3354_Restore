@implementation AVAudioTime

- (AVAudioTime)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAudioTime;
  return -[AVAudioTime init](&v3, sel_init);
}

- (AVAudioTime)initWithHostTime:(uint64_t)hostTime
{
  AVAudioTime *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioTime;
  result = -[AVAudioTime init](&v5, sel_init);
  if (result)
  {
    result->_ats.mFlags = 2;
    result->_ats.mHostTime = hostTime;
  }
  return result;
}

- (AVAudioTime)initWithSampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  AVAudioTime *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAudioTime;
  result = -[AVAudioTime init](&v7, sel_init);
  if (result)
  {
    result->_ats.mFlags = 1;
    result->_ats.mSampleTime = (double)sampleTime;
    result->_sampleRate = sampleRate;
  }
  return result;
}

- (AVAudioTime)initWithHostTime:(uint64_t)hostTime sampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  AVAudioTime *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAudioTime;
  result = -[AVAudioTime init](&v9, sel_init);
  if (result)
  {
    result->_ats.mFlags = 3;
    result->_ats.mHostTime = hostTime;
    result->_ats.mSampleTime = (double)sampleTime;
    result->_sampleRate = sampleRate;
  }
  return result;
}

- (BOOL)isHostTimeValid
{
  return (LOBYTE(self->_ats.mFlags) >> 1) & 1;
}

- (BOOL)isSampleTimeValid
{
  return self->_ats.mFlags & 1;
}

- (uint64_t)hostTime
{
  return self->_ats.mHostTime;
}

- (AVAudioFramePosition)sampleTime
{
  return (uint64_t)self->_ats.mSampleTime;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (AVAudioTime)extrapolateTimeFromAnchor:(AVAudioTime *)anchorTime
{
  double sampleRate;
  AVAudioTime *result;
  __int128 v6;
  __int128 v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  if (anchorTime)
    -[AVAudioTime audioTimeStamp](anchorTime, "audioTimeStamp");
  sampleRate = self->_sampleRate;
  if (sampleRate == 0.0)
    return 0;
  v6 = *(_OWORD *)&self->_ats.mSMPTETime.mHours;
  v7 = *(_OWORD *)&self->_ats.mRateScalar;
  v9 = *(_OWORD *)&self->_ats.mSampleTime;
  v10 = v7;
  v11 = *(_OWORD *)&self->_ats.mSMPTETime.mSubframes;
  v12 = v6;
  v8 = DWORD2(v6);
  if ((~DWORD2(v6) & 7) == 0)
    return +[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", &v9, sampleRate, *(double *)&v6);
  result = 0;
  if ((BYTE8(v6) & 3) != 0 && (BYTE8(v16) & 3) == 3)
  {
    if ((BYTE8(v6) & 4) != 0)
    {
      *(_QWORD *)&v6 = v10;
      if ((BYTE8(v6) & 2) == 0)
        goto LABEL_19;
    }
    else
    {
      *(_QWORD *)&v6 = 1.0;
      if ((BYTE8(v16) & 4) == 0)
      {
        if ((BYTE8(v6) & 2) != 0)
          goto LABEL_11;
LABEL_19:
        *((_QWORD *)&v9 + 1) = (unint64_t)((double)*((uint64_t *)&v13 + 1)
                                                + (*(double *)&v9 - *(double *)&v13)
                                                * (*(double *)&v6
                                                 * 24000000.0
                                                 / sampleRate));
        if ((v8 & 1) != 0)
          goto LABEL_13;
        goto LABEL_12;
      }
      v8 = DWORD2(v6) | 4;
      *(_QWORD *)&v6 = v14;
      *(_QWORD *)&v10 = v14;
      if ((BYTE8(v6) & 2) == 0)
        goto LABEL_19;
    }
LABEL_11:
    if ((v8 & 1) != 0)
    {
LABEL_13:
      DWORD2(v12) = v8 | 3;
      return +[AVAudioTime timeWithAudioTimeStamp:sampleRate:](AVAudioTime, "timeWithAudioTimeStamp:sampleRate:", &v9, sampleRate, *(double *)&v6);
    }
LABEL_12:
    *(double *)&v6 = *(double *)&v13
                   + round(sampleRate/ (*(double *)&v6* 24000000.0)* (double)(uint64_t)(*((_QWORD *)&v9 + 1) - *((_QWORD *)&v13 + 1)));
    *(_QWORD *)&v9 = v6;
    goto LABEL_13;
  }
  return result;
}

- (AVAudioTime)initWithAudioTimeStamp:(const AudioTimeStamp *)ts sampleRate:(double)sampleRate
{
  AVAudioTime *result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVAudioTime;
  result = -[AVAudioTime init](&v10, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&ts->mSampleTime;
    v8 = *(_OWORD *)&ts->mRateScalar;
    v9 = *(_OWORD *)&ts->mSMPTETime.mSubframes;
    *(_OWORD *)&result->_ats.mSMPTETime.mHours = *(_OWORD *)&ts->mSMPTETime.mHours;
    *(_OWORD *)&result->_ats.mSMPTETime.mSubframes = v9;
    *(_OWORD *)&result->_ats.mRateScalar = v8;
    *(_OWORD *)&result->_ats.mSampleTime = v7;
    result->_sampleRate = sampleRate;
  }
  return result;
}

- (AudioTimeStamp)audioTimeStamp
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->mWordClockTime;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self->mHostTime;
  *(_OWORD *)&retstr->mRateScalar = v3;
  v4 = *(_OWORD *)&self->mFlags;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self->mSMPTETime.mType;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (id)description
{
  AudioTimeStampFlags mFlags;
  double v4;
  char v6[32];
  char __str[48];
  char v8[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  mFlags = self->_ats.mFlags;
  if ((mFlags & 2) == 0)
  {
    v8[0] = 0;
    if ((mFlags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    __str[0] = 0;
    if ((mFlags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6[0] = 0;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVAudioTime %p: %s %s %s>"), self, v8, __str, v6);
  }
  +[AVAudioTime secondsForHostTime:](AVAudioTime, "secondsForHostTime:", self->_ats.mHostTime);
  snprintf(v8, 0x20uLL, "%.6f s", v4);
  mFlags = self->_ats.mFlags;
  if ((mFlags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  snprintf(__str, 0x30uLL, "%ld fr (/%.f Hz)", (uint64_t)self->_ats.mSampleTime, self->_sampleRate);
  if ((self->_ats.mFlags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  snprintf(v6, 0x20uLL, "%.6f rs", self->_ats.mRateScalar);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVAudioTime %p: %s %s %s>"), self, v8, __str, v6);
}

+ (AVAudioTime)timeWithHostTime:(uint64_t)hostTime
{
  return -[AVAudioTime initWithHostTime:]([AVAudioTime alloc], "initWithHostTime:", hostTime);
}

+ (AVAudioTime)timeWithSampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  return -[AVAudioTime initWithSampleTime:atRate:]([AVAudioTime alloc], "initWithSampleTime:atRate:", sampleTime, sampleRate);
}

+ (AVAudioTime)timeWithHostTime:(uint64_t)hostTime sampleTime:(AVAudioFramePosition)sampleTime atRate:(double)sampleRate
{
  return -[AVAudioTime initWithHostTime:sampleTime:atRate:]([AVAudioTime alloc], "initWithHostTime:sampleTime:atRate:", hostTime, sampleTime, sampleRate);
}

+ (AVAudioTime)timeWithAudioTimeStamp:(const AudioTimeStamp *)ts sampleRate:(double)sampleRate
{
  return -[AVAudioTime initWithAudioTimeStamp:sampleRate:]([AVAudioTime alloc], "initWithAudioTimeStamp:sampleRate:", ts, sampleRate);
}

+ (uint64_t)hostTimeForSeconds:(NSTimeInterval)seconds
{
  return (unint64_t)(seconds * 24000000.0);
}

+ (NSTimeInterval)secondsForHostTime:(uint64_t)hostTime
{
  return (double)hostTime * 0.0000000416666667;
}

@end
