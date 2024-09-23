@implementation VNFaceCoreExceptionUtils

+ (void)throwInvalidArgumentException:(id)a3
{
  id v3;
  std::logic_error *exception;

  v3 = a3;
  NSLog(CFSTR("FaceCore: Throwing invalid argument exception: %@"), v3);
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
  __cxa_throw(exception, (struct type_info *)off_1E9549790, MEMORY[0x1E0DE4360]);
}

+ (void)throwRuntimeErrorException:(id)a3
{
  id v3;
  void *exception;

  v3 = a3;
  NSLog(CFSTR("FaceCore: Throwing runtime error exception: %@"), v3);
  exception = __cxa_allocate_exception(0x10uLL);
  MEMORY[0x1D825019C](exception, objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

@end
