@implementation INInteraction(sgLogging)

- (id)sg_LoggingIdentifier
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%tu"), objc_msgSend(v3, "hash"));

  if ((unint64_t)objc_msgSend(v4, "length") > 0xC)
  {
    objc_msgSend(v4, "substringWithRange:", 0, 12);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

@end
