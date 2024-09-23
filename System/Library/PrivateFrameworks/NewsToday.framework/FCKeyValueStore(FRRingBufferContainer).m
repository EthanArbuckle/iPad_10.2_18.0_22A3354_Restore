@implementation FCKeyValueStore(FRRingBufferContainer)

- (FRRingBuffer)ringBufferForKey:()FRRingBufferContainer capacity:
{
  id v6;
  void *v7;
  void *v8;
  FRRingBuffer *v9;

  v6 = a3;
  objc_opt_class();
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  FCDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[FRRingBuffer initWithCapacity:dictionary:]([FRRingBuffer alloc], "initWithCapacity:dictionary:", a4, v8);
  return v9;
}

- (FRRingBuffer)ringBufferForKey:()FRRingBufferContainer
{
  id v4;
  void *v5;
  void *v6;
  FRRingBuffer *v7;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  FCDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FRRingBuffer initWithCapacity:dictionary:]([FRRingBuffer alloc], "initWithCapacity:dictionary:", 75, v6);
  return v7;
}

- (uint64_t)setRingBuffers:()FRRingBufferContainer
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__FCKeyValueStore_FRRingBufferContainer__setRingBuffers___block_invoke;
  v4[3] = &unk_24DB5FB58;
  v4[4] = a1;
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (BOOL)hasMinForKey:()FRRingBufferContainer
{
  double v1;

  objc_msgSend(a1, "minForKey:");
  return v1 != 1.79769313e308;
}

- (BOOL)hasMaxForKey:()FRRingBufferContainer
{
  double v1;

  objc_msgSend(a1, "maxForKey:");
  return v1 != -1.79769313e308;
}

- (double)minForKey:()FRRingBufferContainer
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  FCDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Min"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
  }
  else
  {
    v10 = 1.79769313e308;
  }

  return v10;
}

- (double)maxForKey:()FRRingBufferContainer
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  FCDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Max"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FCDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
  }
  else
  {
    v10 = -1.79769313e308;
  }

  return v10;
}

@end
