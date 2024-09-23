@implementation _CNRegExHandleStringClassificationStrategy

- (unint64_t)classificationOfHandleString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "doesStringLookLikePhoneNumber:", v3) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend((id)objc_opt_class(), "doesStringLookLikeEmailAddress:", v3);

  return v4;
}

+ (BOOL)doesStringLookLikePhoneNumber:(id)a3
{
  return +[CNPhoneNumberHelper isStringPhoneNumber:](CNPhoneNumberHelper, "isStringPhoneNumber:", a3);
}

+ (BOOL)doesStringLookLikeEmailAddress:(id)a3
{
  return +[CNEmailAddressUtilities isStringEmailAddress:](CNEmailAddressUtilities, "isStringEmailAddress:", a3);
}

@end
