@implementation HMFaceCrop(HFAdditions)

- (id)hf_imageRepresentation
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(a1, "dataRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageWithData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
