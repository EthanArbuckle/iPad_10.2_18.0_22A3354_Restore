@implementation SKPresentDevice(ForwardDeclare)

- (id)presencePayloadDictionary
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "presencePayload");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "payloadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
