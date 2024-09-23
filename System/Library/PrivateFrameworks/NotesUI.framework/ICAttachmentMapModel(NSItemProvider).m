@implementation ICAttachmentMapModel(NSItemProvider)

- (id)itemProvider
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  objc_msgSend(a1, "MKMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "conformsToProtocol:", &unk_1EECE0110))
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v3);
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_1EED3B5E0;
    objc_msgSendSuper2(&v7, sel_itemProvider);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
