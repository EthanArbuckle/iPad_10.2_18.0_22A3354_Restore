@implementation INImageNoteContent(INCreateNoteIntentCardRequesting)

- (id)acs_cardSection
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "image");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BE84E70], "acs_uniquelyIdentifiedCardSection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA518]), "initWithIntentsImage:", v1);
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setImages:", v4);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
