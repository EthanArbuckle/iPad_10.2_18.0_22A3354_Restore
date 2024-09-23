@implementation NSMutableDictionary(MediaAnalysisResults)

- (void)vcp_setTimerange:()MediaAnalysisResults
{
  __int128 v4;
  CFDictionaryRef v5;
  CMTimeRange v6;

  v4 = a3[1];
  *(_OWORD *)&v6.start.value = *a3;
  *(_OWORD *)&v6.start.epoch = v4;
  *(_OWORD *)&v6.duration.timescale = a3[2];
  v5 = CMTimeRangeCopyAsDictionary(&v6, 0);
  objc_msgSend(a1, "addEntriesFromDictionary:", v5);

}

@end
