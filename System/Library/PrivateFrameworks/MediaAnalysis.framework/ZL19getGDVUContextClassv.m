@implementation ZL19getGDVUContextClassv

VCPProtoTimeRange *___ZL19getGDVUContextClassv_block_invoke(uint64_t a1)
{
  VCPProtoTimeRange *result;
  void *v3;
  SEL v4;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *v5;

  IntelligencePlatformLibrary();
  result = (VCPProtoTimeRange *)objc_getClass("GDVUContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getGDVUContextClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)___ZL19getGDVUContextClassv_block_invoke_cold_1();
    return +[VCPProtoTimeRange timeRangeWithCMTimeRange:](v3, v4, v5);
  }
  return result;
}

@end
