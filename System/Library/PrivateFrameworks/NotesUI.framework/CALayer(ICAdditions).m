@implementation CALayer(ICAdditions)

- (void)ic_animateProperty:()ICAdditions toValue:timing:
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "valueForKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_animateProperty:toValue:fromValue:timing:", v10, v9, v11, v8);

}

- (void)ic_animateProperty:()ICAdditions toValue:fromValue:timing:
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v10 = (void *)MEMORY[0x1E0CD2710];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "animation");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setKeyPath:", v14);
  objc_msgSend(v17, "setFromValue:", v12);

  objc_msgSend(v17, "setToValue:", v13);
  objc_msgSend(v17, "setDuration:", 0.2);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setTimingFunction:", v15);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Animation"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addAnimation:forKey:", v17, v16);
  objc_msgSend(a1, "setValue:forKey:", v13, v14);

}

@end
