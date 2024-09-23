@implementation AVAssetSegmentTrackReport

- (AVAssetSegmentTrackReport)initWithFigSegmentTrackReportDictionary:(id)a3
{
  AVAssetSegmentTrackReport *v4;
  uint64_t v5;
  AVAssetSegmentTrackReport *v9;
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
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"figSegmentTrackReportDict != nil"), 0);
    objc_exception_throw(v15);
  }
  v17.receiver = self;
  v17.super_class = (Class)AVAssetSegmentTrackReport;
  v4 = -[AVAssetSegmentTrackReport init](&v17, sel_init);
  if (v4)
  {
    v4->_trackID = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BE8]), "longValue");
    v4->_mediaType = (NSString *)objc_msgSend((id)AVMediaTypeFromCMMediaType(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BE0]), "longValue")), "copy");
    CMTimeMakeFromDictionary(&v16, (CFDictionaryRef)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BD0]));
    v4->_earliestPresentationTimeStamp = ($95D729B680665BEAEFA1D6FCA8238556)v16;
    CMTimeMakeFromDictionary(&v16, (CFDictionaryRef)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BC8]));
    v4->_duration = ($95D729B680665BEAEFA1D6FCA8238556)v16;
    v5 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3BD8]);
    if (v5)
      v4->_firstVideoSampleInformation = -[AVAssetSegmentReportSampleInformation initWithFigSegmentReportSampleInformationDictionary:]([AVAssetSegmentReportSampleInformation alloc], "initWithFigSegmentReportSampleInformationDictionary:", v5);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetSegmentTrackReport;
  -[AVAssetSegmentTrackReport dealloc](&v3, sel_dealloc);
}

- (CMPersistentTrackID)trackID
{
  return self->_trackID;
}

- (AVMediaType)mediaType
{
  return self->_mediaType;
}

- (CMTime)earliestPresentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (CMTime)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (AVAssetSegmentReportSampleInformation)firstVideoSampleInformation
{
  return self->_firstVideoSampleInformation;
}

@end
