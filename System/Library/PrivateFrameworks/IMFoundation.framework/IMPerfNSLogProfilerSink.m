@implementation IMPerfNSLogProfilerSink

- (void)perfProfiler:(id)a3 measurementDidFinish:(IMPerfMeasurement_t *)a4
{
  unint64_t var1;
  double var6;
  _BYTE *v7;

  if (a4)
  {
    var1 = a4->var1;
    var6 = a4->var6;
    v7 = IMFileLocationTrimFileName(a4);
    NSLog(CFSTR("[PERF]: id:%lld e:%f file:%s:%i func:%s c:\"%@\"), var1, *(_QWORD *)&var6, v7, a4->var0.var4, a4->var0.var2, a4->var3);
  }
}

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906B02B8;
  block[3] = &unk_1E2C444F8;
  block[4] = a1;
  if (qword_1EE1DDE60 != -1)
    dispatch_once(&qword_1EE1DDE60, block);
  return (id)qword_1EE1DDE58;
}

@end
