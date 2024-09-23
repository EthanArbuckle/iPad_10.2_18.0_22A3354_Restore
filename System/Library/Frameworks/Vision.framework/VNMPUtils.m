@implementation VNMPUtils

+ (double)getHostTime
{
  unint64_t v2;
  unint64_t v3;
  mach_timebase_info info;

  info = 0;
  if (*(double *)&getHostTime_timeBaseFactor == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    *(double *)&getHostTime_timeBaseFactor = (double)v2 / (double)v3 * 0.000000001;
  }
  return *(double *)&getHostTime_timeBaseFactor * (double)mach_absolute_time();
}

+ (unint64_t)getHostTimeInNanos
{
  if (mach_timebase_info((mach_timebase_info_t)&getHostTimeInNanos_info))
    return 0;
  else
    return mach_absolute_time() * getHostTimeInNanos_info / *(unsigned int *)algn_1EE63FCBC;
}

+ (id)createErrorWithCode:(int64_t)a3 andMessage:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a4;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x1E0CB2D68]);

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MomentProcessor"), a3, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)freeVImageBuffer:(vImage_Buffer *)a3
{
  if (a3)
  {
    if (a3->data)
      free(a3->data);
    free(a3);
  }
}

+ (int64_t)parseExifTimestamp:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  int64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = (uint64_t)v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
