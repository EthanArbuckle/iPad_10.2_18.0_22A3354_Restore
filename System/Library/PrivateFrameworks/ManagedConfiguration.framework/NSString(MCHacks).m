@implementation NSString(MCHacks)

- (id)MCAppendGreenteaSuffix
{
  void *v2;
  int v3;
  id v4;

  +[MCHacks sharedHacks](MCHacks, "sharedHacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGreenTea");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CH"), a1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1;
  }
  return v4;
}

- (uint64_t)MCRemoveAppExternalVersionIDParameter
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("(?:^appExtVrsId=[^&]+&?|&appExtVrsId=[^&]+)"), &stru_1E41E70C8, 1024, 0, objc_msgSend(a1, "length"));
}

@end
