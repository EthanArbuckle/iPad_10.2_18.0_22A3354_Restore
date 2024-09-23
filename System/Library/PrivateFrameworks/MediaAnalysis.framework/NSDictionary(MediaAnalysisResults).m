@implementation NSDictionary(MediaAnalysisResults)

- (void)vcp_time
{
  const __CFDictionary *v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("start"));
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(a2, v3);

}

@end
