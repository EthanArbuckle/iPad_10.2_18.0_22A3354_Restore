@implementation NSKeyValueDebugger

_NSKeyValueDebugging *___NSKeyValueDebugger_block_invoke()
{
  _NSKeyValueDebugging *result;

  result = (_NSKeyValueDebugging *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSProcessInfo environment](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("_NSKeyValueDebugging")), "BOOLValue");
  if ((_DWORD)result)
  {
    _MergedGlobals_132 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSProcessInfo environment](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("_NSKeyValueDebuggingUseNSLog")), "BOOLValue");
    result = objc_alloc_init(_NSKeyValueDebugging);
    qword_1ECD0A2C8 = (uint64_t)result;
  }
  return result;
}

@end
