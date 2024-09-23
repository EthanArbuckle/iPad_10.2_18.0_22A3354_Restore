@implementation AVPlayerItem(MPAVItemAdditions)

- (id)MPAVItem
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setMPAVItem:()MPAVItemAdditions
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AVPlayerItem_MPAVItemAdditions__setMPAVItem___block_invoke;
  v6[3] = &unk_1E3153580;
  objc_copyWeak(&v7, &location);
  v5 = (void *)MEMORY[0x19403A810](v6);
  objc_setAssociatedObject(a1, 0, v5, (void *)1);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

@end
