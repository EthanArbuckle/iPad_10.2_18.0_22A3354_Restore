@implementation _MFPlaceholderComposeRecipient

- (void)setDisplayString:(id)a3
{
  NSString **p_displayString;
  id v5;

  p_displayString = &self->super._displayString;
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", *p_displayString) & 1) == 0)
    objc_storeStrong((id *)p_displayString, a3);

}

- (id)displayString
{
  return self->super._displayString;
}

@end
