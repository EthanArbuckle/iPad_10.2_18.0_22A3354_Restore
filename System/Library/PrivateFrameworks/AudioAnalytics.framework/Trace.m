@implementation Trace

+ (void)post:(unsigned int)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7
{
  kdebug_trace();
}

+ (void)postStart:(unsigned int)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7
{
  kdebug_trace();
}

+ (void)postEnd:(unsigned int)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7
{
  kdebug_trace();
}

+ (void)post:(unsigned int)a3 args:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "arg1");
  objc_msgSend(v4, "arg2");
  objc_msgSend(v4, "arg3");
  objc_msgSend(v4, "arg4");
  kdebug_trace();

}

+ (void)postStart:(unsigned int)a3 args:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "arg1");
  objc_msgSend(v4, "arg2");
  objc_msgSend(v4, "arg3");
  objc_msgSend(v4, "arg4");
  kdebug_trace();

}

+ (void)postEnd:(unsigned int)a3 args:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "arg1");
  objc_msgSend(v4, "arg2");
  objc_msgSend(v4, "arg3");
  objc_msgSend(v4, "arg4");
  kdebug_trace();

}

@end
