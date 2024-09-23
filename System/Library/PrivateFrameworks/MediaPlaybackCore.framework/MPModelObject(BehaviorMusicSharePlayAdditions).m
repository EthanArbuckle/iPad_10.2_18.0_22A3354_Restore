@implementation MPModelObject(BehaviorMusicSharePlayAdditions)

- (id)msp_shortDescription
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@:"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaceholder");

  if (v4)
    objc_msgSend(v2, "appendString:", CFSTR(" placeholder"));
  objc_msgSend(v2, "appendString:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

@end
