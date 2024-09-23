@implementation UIView(CKPopover)

- (void)ck_setBoundsWidth:()CKPopover
{
  void *v3;
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("bounds.size.width"));

}

- (void)ck_setBoundsHeight:()CKPopover
{
  void *v3;
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("bounds.size.height"));

}

- (void)ck_setPositionX:()CKPopover
{
  void *v3;
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("position.x"));

}

- (void)ck_setPositionY:()CKPopover
{
  void *v3;
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("position.y"));

}

- (void)ck_setScaleX:()CKPopover
{
  void *v3;
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("transform.scale.x"));

}

- (void)ck_setScaleY:()CKPopover
{
  void *v3;
  id v4;

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKeyPath:", v3, CFSTR("transform.scale.y"));

}

@end
