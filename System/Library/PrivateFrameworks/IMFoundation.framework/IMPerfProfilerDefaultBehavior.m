@implementation IMPerfProfilerDefaultBehavior

- (void)perfProfiler:(id)a3 measurementDidFinish:(IMPerfMeasurement_t *)a4 withSink:(id)a5
{
  id v7;
  const char *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a5;
  v9 = v7;
  if (a4 && a4->var6 > 0.001)
    objc_msgSend_perfProfiler_measurementDidFinish_(v7, v8, (uint64_t)v10, (uint64_t)a4);

}

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19069121C;
  block[3] = &unk_1E2C444F8;
  block[4] = a1;
  if (qword_1EE1DDAB0 != -1)
    dispatch_once(&qword_1EE1DDAB0, block);
  return (id)qword_1EE1DDAA8;
}

@end
