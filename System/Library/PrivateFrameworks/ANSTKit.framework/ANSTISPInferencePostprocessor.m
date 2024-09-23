@implementation ANSTISPInferencePostprocessor

- (id)trackedObjectsOfCategory:(id)a3
{
  id v3;
  const char *v4;
  id v5;

  v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v4, *MEMORY[0x24BDBCAB8], CFSTR("A concrete implementation of -trackedObjectsOfCategory: is required."), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (id)semanticSegmentationMaskDescriptorOfCategory:(id)a3
{
  id v3;
  const char *v4;
  id v5;

  v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], v4, *MEMORY[0x24BDBCAB8], CFSTR("A concrete implementation of -semanticSegmentationMaskDescriptorOfCategory: is required."), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

@end
