@implementation MPModelPlaylist(BehaviorMusicSharePlayAdditions)

- (id)msp_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  void *v13;
  objc_super v14;

  v14.receiver = a1;
  v14.super_class = (Class)&off_254AD2A88;
  objc_msgSendSuper2(&v14, sel_msp_shortDescription);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x24BDDC928];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __72__MPModelPlaylist_BehaviorMusicSharePlayAdditions__msp_shortDescription__block_invoke;
  v11 = &unk_24CABA1D0;
  v12 = v3;
  v13 = a1;
  v5 = v3;
  objc_msgSend(v4, "performWithoutEnforcement:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

@end
