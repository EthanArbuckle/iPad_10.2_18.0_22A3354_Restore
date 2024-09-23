@implementation BWMetadataTimeMachineMetadataRequest

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMetadataTimeMachineMetadataRequest;
  -[BWMetadataTimeMachineRequest dealloc](&v3, sel_dealloc);
}

- (id)completeWithMetadata:(id)result
{
  void *v2;
  objc_super v3;

  if (result)
  {
    v2 = result;
    *((_QWORD *)result + 8) = a2;
    v3.receiver = v2;
    v3.super_class = (Class)BWMetadataTimeMachineMetadataRequest;
    return objc_msgSendSuper2(&v3, sel_complete);
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  Float64 Seconds;
  __int128 v6;
  CMTimeRange time;
  CMTime v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  *(_OWORD *)&time.start.value = *(_OWORD *)&self->_ptsRange.start.value;
  time.start.epoch = self->_ptsRange.start.epoch;
  Seconds = CMTimeGetSeconds(&time.start);
  v6 = *(_OWORD *)&self->_ptsRange.start.epoch;
  *(_OWORD *)&time.start.value = *(_OWORD *)&self->_ptsRange.start.value;
  *(_OWORD *)&time.start.epoch = v6;
  *(_OWORD *)&time.duration.timescale = *(_OWORD *)&self->_ptsRange.duration.timescale;
  CMTimeRangeGetEnd(&v9, &time);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: PTS range: %.3fs -> %.3fs, metadata count:%d"), v4, self, *(_QWORD *)&Seconds, CMTimeGetSeconds(&v9), -[NSArray count](self->_metadataForPTSRange, "count"));
}

@end
