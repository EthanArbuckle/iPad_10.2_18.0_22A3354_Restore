@implementation CADNotificationCenterVisibleEventsPredicate(EKPredicateEvaluating)

- (BOOL)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v3;
  id v4;
  _BOOL8 v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "invitationStatus"))
      v5 = objc_msgSend(v4, "invitationStatus") != 1;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
