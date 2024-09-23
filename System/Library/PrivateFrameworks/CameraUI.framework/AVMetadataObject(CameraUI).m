@implementation AVMetadataObject(CameraUI)

- (uint64_t)isHumanFace
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8AA38]);

  return v2;
}

- (uint64_t)isHumanBody
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8AA40]);

  return v2;
}

- (uint64_t)isHumanHead
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8AA48]);

  return v2;
}

- (uint64_t)isPetHead
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8AA18]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8AA28]);

  }
  return v3;
}

- (uint64_t)isPetBody
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8AA10]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8AA20]);

  }
  return v3;
}

- (uint64_t)isSalientObject
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8AA58]);

  return v2;
}

- (uint64_t)isCat
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8AA18]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8AA10]);

  }
  return v3;
}

- (uint64_t)isDog
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C8AA28]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8AA20]);

  }
  return v3;
}

- (uint64_t)isHuman
{
  if ((objc_msgSend(a1, "isHumanBody") & 1) != 0 || (objc_msgSend(a1, "isHumanFace") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isHumanHead");
}

@end
