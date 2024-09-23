@implementation GTMTLReplayHost

void __GTMTLReplayHost_computeDerivedCountersFromData_block_invoke_2(id a1, JSContext *a2, JSValue *a3)
{
  JSValue *v3;
  void *v4;
  void *v5;
  void *v6;
  FILE *v7;
  const char *v8;
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[JSValue toString](v3, "toString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSValue toDictionary](v3, "toDictionary"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[DYJSScripting] %@ %@"), v4, v5));
  v7 = __stdoutp;
  if (g_runningInCI)
    v8 = "#CI_ERROR# ";
  else
    v8 = "";
  v9 = objc_retainAutorelease(v6);
  fprintf(v7, "%s%s %u: %s\n", v8, "NSDictionary *GTMTLReplayHost_computeDerivedCountersFromData(NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSDictionary *__strong)_block_invoke_2", 103, (const char *)objc_msgSend(v9, "UTF8String"));
  v10 = objc_retainAutorelease(v9);
  GTMTLReplay_handleError(101, (uint64_t)objc_msgSend(v10, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/launcher/DYJavaScriptHelper.m", (uint64_t)"GTMTLReplayHost_computeDerivedCountersFromData_block_invoke_2", 103, 2);

}

void __GTMTLReplayHost_computeDerivedCountersFromData_block_invoke(id a1, NSString *a2)
{
  void *v2;
  FILE *v3;
  const char *v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), a2));
  v3 = __stdoutp;
  if (g_runningInCI)
    v4 = "#CI_ERROR# ";
  else
    v4 = "";
  v5 = objc_retainAutorelease(v2);
  fprintf(v3, "%s%s %u: %s\n", v4, "NSDictionary *GTMTLReplayHost_computeDerivedCountersFromData(NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSDictionary *__strong)_block_invoke", 99, (const char *)objc_msgSend(v5, "UTF8String"));
  v6 = objc_retainAutorelease(v5);
  GTMTLReplay_handleError(101, (uint64_t)objc_msgSend(v6, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/launcher/DYJavaScriptHelper.m", (uint64_t)"GTMTLReplayHost_computeDerivedCountersFromData_block_invoke", 99, 2);

}

@end
