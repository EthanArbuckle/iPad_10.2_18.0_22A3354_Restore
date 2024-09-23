@implementation VRLogfileFree

void __VRLogfileFree_block_invoke(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  fclose(**(FILE ***)(a1 + 32));
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableZipDump"), 1))
    VRLogfileZip(*(_QWORD *)(a1 + 32));
  free(*(void **)(*(_QWORD *)(a1 + 32) + 48));
  free(*(void **)(a1 + 32));
}

@end
