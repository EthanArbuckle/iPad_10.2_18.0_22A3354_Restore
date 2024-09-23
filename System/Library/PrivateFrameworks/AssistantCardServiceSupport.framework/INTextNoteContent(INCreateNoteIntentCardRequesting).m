@implementation INTextNoteContent(INCreateNoteIntentCardRequesting)

- (id)acs_cardSection
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "text");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BE84E00], "acs_uniquelyIdentifiedCardSection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTitle:", v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
