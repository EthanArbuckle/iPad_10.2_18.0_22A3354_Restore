@implementation SWMutableCollaborationMetadataClass

Class __get_SWMutableCollaborationMetadataClass_block_invoke(uint64_t a1)
{
  Class result;
  _BlastDoorLPPlatformColor *v3;
  SEL v4;
  _NSZone *v5;

  SharedWithYouLibrary();
  result = objc_getClass("_SWMutableCollaborationMetadata");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_SWMutableCollaborationMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (_BlastDoorLPPlatformColor *)__get_SWMutableCollaborationMetadataClass_block_invoke_cold_1();
    return (Class)-[_BlastDoorLPPlatformColor copyWithZone:](v3, v4, v5);
  }
  return result;
}

uint64_t __get_SWMutableCollaborationMetadataClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return BD_IOSurfaceDisallowForever_cold_1(v0);
}

@end
