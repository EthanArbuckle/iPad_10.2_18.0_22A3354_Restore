@implementation ADSignpostUtils

+ (void)markStartMeasurement
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  NSLog(CFSTR("pnp_measurement_window_start %f"), v3);

  kdebug_trace();
}

+ (void)markEndMeasurement
{
  uint64_t v2;
  id v3;

  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemUptime");
  NSLog(CFSTR("pnp_measurement_window_end %f"), v2);

}

+ (void)markStartFrame:(id)a3 mappingId:(unint64_t)a4
{
  id v4;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  kdebug_trace();

}

+ (void)markEndFrame:(BOOL)a3 name:(id)a4 mappingId:(unint64_t)a5
{
  id v5;

  v5 = objc_retainAutorelease(a4);
  objc_msgSend(v5, "UTF8String");
  kdebug_trace();

}

@end
