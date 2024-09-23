@implementation CKIMGroupHeaderRecipient

- (void)setDisplayString:(id)a3
{
  NSString **p_displayString;
  id v5;

  p_displayString = &self->_displayString;
  v5 = a3;
  if (!-[NSString isEqualToString:](*p_displayString, "isEqualToString:"))
    objc_storeStrong((id *)p_displayString, a3);

}

- (NSString)displayString
{
  return self->_displayString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
}

@end
