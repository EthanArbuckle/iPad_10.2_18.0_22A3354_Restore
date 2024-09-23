@implementation NSMutableDictionary(MediaAnalysisPauseResume)

- (void)vcp_setSyncPoint:()MediaAnalysisPauseResume
{
  CFDictionaryRef v4;
  CMTime v5;

  v5 = *a3;
  v4 = CMTimeCopyAsDictionary(&v5, 0);
  objc_msgSend(a1, "setObject:forKey:", v4, CFSTR("SyncPoint"));

}

- (uint64_t)vcp_removeSyncPoint
{
  return objc_msgSend(a1, "removeObjectForKey:", CFSTR("SyncPoint"));
}

@end
