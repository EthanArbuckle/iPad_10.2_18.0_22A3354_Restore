@implementation CALayer(HUAdditions)

- (id)hu_addAnimationAdditively:()HUAdditions applyModelValue:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  if (a4)
    objc_msgSend(a1, "hu_applyModelValueFromAnimation:", v6);
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v6, "toValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "valueForKeyPath:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "fromValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CA_addValue:multipliedBy:", v10, 0xFFFFFFFFLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v13)
  {
    objc_msgSend(v7, "setAdditive:", 1);
    objc_msgSend(v7, "setFromValue:", v13);
    objc_msgSend(v10, "CA_addValue:multipliedBy:", v10, 0xFFFFFFFFLL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v14);

  }
  objc_msgSend(v6, "keyPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "animationForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = 2;
    do
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "keyPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%ld"), v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      ++v17;
      objc_msgSend(a1, "animationForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v20;
    }
    while (v21);
  }
  else
  {
    v20 = v15;
  }
  objc_msgSend(a1, "addAnimation:forKey:", v7, v20);

  return v20;
}

- (void)hu_applyModelValueFromAnimation:()HUAdditions
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "toValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v7, "toValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forKeyPath:", v5, v6);

  }
  else
  {
    NSLog(CFSTR("animations without a toValue are not currently supported!"));
  }

}

@end
