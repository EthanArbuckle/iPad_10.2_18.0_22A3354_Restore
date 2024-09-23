@implementation VisionCoreTensorDescriptor(VNPrivateAdditions)

- (uint64_t)getVNElementType:()VNPrivateAdditions error:
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;

  if (a1)
  {
    v7 = objc_msgSend(a1, "dataType");
    if (v7 == 65568)
    {
      v8 = 1;
      if (!a3)
        return 1;
LABEL_7:
      *a3 = v8;
      return 1;
    }
    if (v7 == 65600)
    {
      v8 = 2;
      if (!a3)
        return 1;
      goto LABEL_7;
    }
  }
  if (a4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(a1, "dataType");
    NSStringFromVisionCoreTensorDataType();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("tensor data type %@ is not supported"), v11);

    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
