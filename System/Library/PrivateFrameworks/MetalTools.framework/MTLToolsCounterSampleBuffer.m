@implementation MTLToolsCounterSampleBuffer

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (unint64_t)sampleCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCount");
}

- (id)resolveCounterRange:(_NSRange)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resolveCounterRange:", a3.location, a3.length);
}

@end
