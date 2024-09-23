@implementation AVMetadataItem(MediaMetadataReaderItem)

- (CMTimeRange)timeRange
{
  CMTime v5;
  CMTime start;

  objc_msgSend(a1, "time");
  objc_msgSend(a1, "duration");
  return CMTimeRangeMake(a2, &start, &v5);
}

@end
