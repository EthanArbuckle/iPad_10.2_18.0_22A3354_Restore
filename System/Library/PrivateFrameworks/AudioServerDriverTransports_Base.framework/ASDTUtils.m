@implementation ASDTUtils

+ (unsigned)latencyFramesIntForSamplingRate:(double)a3 andMicroseconds:(unsigned int)a4
{
  return vcvtpd_u64_f64((double)a4 * a3 / 1000000.0);
}

+ (id)latencyFramesForSamplingRate:(id)a3 andMicroseconds:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v7, "numberWithUnsignedInt:", +[ASDTUtils latencyFramesIntForSamplingRate:andMicroseconds:](ASDTUtils, "latencyFramesIntForSamplingRate:andMicroseconds:", objc_msgSend(v6, "unsignedIntValue"), v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
