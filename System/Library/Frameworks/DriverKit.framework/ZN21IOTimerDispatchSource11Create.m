@implementation ZN21IOTimerDispatchSource11Create

IODispatchSource *___ZN21IOTimerDispatchSource11Create_ImplEP15IODispatchQueuePPS__block_invoke_2(uint64_t a1)
{
  IODispatchSource *result;

  result = *(IODispatchSource **)(a1 + 32);
  if (LOBYTE(result[1].OSObject::OSMetaClassBase::__vftable[1].retain))
    return (IODispatchSource *)IODispatchSource::CheckForWork(result, 1, 0);
  return result;
}

@end
