@implementation AVAssetSegmentReportSampleInformation

- (AVAssetSegmentReportSampleInformation)initWithFigSegmentReportSampleInformationDictionary:(id)a3
{
  char *v4;
  __int128 v5;
  AVAssetSegmentReportSampleInformation *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CMTime v16;
  objc_super v17;

  if (!a3)
  {
    v9 = self;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"figSampleInformationoDict != nil"), 0);
    objc_exception_throw(v15);
  }
  v17.receiver = self;
  v17.super_class = (Class)AVAssetSegmentReportSampleInformation;
  v4 = -[AVAssetSegmentReportSampleInformation init](&v17, sel_init);
  if (v4)
  {
    CMTimeMakeFromDictionary(&v16, (CFDictionaryRef)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BC0]));
    v5 = *(_OWORD *)&v16.value;
    *((_QWORD *)v4 + 3) = v16.epoch;
    *(_OWORD *)(v4 + 8) = v5;
    *((_QWORD *)v4 + 4) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BB8]), "integerValue");
    *((_QWORD *)v4 + 5) = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BB0]), "integerValue");
    v4[48] = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BA8]), "BOOLValue");
  }
  return (AVAssetSegmentReportSampleInformation *)v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVAssetSegmentReportSampleInformation;
  -[AVAssetSegmentReportSampleInformation dealloc](&v2, sel_dealloc);
}

- (CMTime)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->timescale;
  return self;
}

- (NSInteger)offset
{
  return self->_offset;
}

- (NSInteger)length
{
  return self->_length;
}

- (BOOL)isSyncSample
{
  return self->_isSyncSample;
}

@end
