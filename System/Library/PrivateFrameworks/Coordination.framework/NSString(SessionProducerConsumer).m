@implementation NSString(SessionProducerConsumer)

+ (uint64_t)_commandTypeForConsumerWithSubTopic:()SessionProducerConsumer
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("SessionConsumer+"), a3);
}

+ (uint64_t)_commandTypeForProducerWithSubTopic:()SessionProducerConsumer
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("SessionProducer+"), a3);
}

- (id)_sessionProducerSubTopic
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("SessionProducer+")))
  {
    v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("SessionProducer+"));
    objc_msgSend(a1, "substringFromIndex:", v2 + v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_sessionConsumerSubTopic
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("SessionConsumer+")))
  {
    v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("SessionConsumer+"));
    objc_msgSend(a1, "substringFromIndex:", v2 + v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
