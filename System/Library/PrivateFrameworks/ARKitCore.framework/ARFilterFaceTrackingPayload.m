@implementation ARFilterFaceTrackingPayload

void __ARFilterFaceTrackingPayload_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0CFCD88], *MEMORY[0x1E0CFCD60], *MEMORY[0x1E0CFCD78], *MEMORY[0x1E0CFCC40], *MEMORY[0x1E0CFCC48], *MEMORY[0x1E0CFCD58], *MEMORY[0x1E0CFCD68], *MEMORY[0x1E0CFCD90], *MEMORY[0x1E0CFCD10], *MEMORY[0x1E0CFCD28], *MEMORY[0x1E0CFCD08], *MEMORY[0x1E0CFCD28], *MEMORY[0x1E0CFCD18], *MEMORY[0x1E0CFCD20], *MEMORY[0x1E0CFCC58], *MEMORY[0x1E0CFCC60], *MEMORY[0x1E0CFCC68],
         *MEMORY[0x1E0CFCC70],
         *MEMORY[0x1E0CFCC50],
         *MEMORY[0x1E0CFCC78],
         *MEMORY[0x1E0CFCD00],
         *MEMORY[0x1E0CFCD80],
         0);
  v2 = (void *)ARFilterFaceTrackingPayload::approvedList;
  ARFilterFaceTrackingPayload::approvedList = v1;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_msgSend(v3, "initWithObjects:", *MEMORY[0x1E0CFCCF0], *MEMORY[0x1E0CFCCA8], *MEMORY[0x1E0CFCC98], 0);
  v5 = (void *)ARFilterFaceTrackingPayload::approvedListNoFurtherFiltering;
  ARFilterFaceTrackingPayload::approvedListNoFurtherFiltering = v4;

}

@end
