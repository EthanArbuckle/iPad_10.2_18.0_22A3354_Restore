@implementation CADTravelEventsPredicate(EKPredicateEvaluating)

- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v7) < 0)
    {
      objc_msgSend(v5, "endDateUnadjustedForLegacyClients");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "compare:", v10) < 1)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(a1, "calendars");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(a1, "calendars");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "calendar");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "CADObjectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v15, "containsObject:", v13);

        }
        else
        {
          v8 = 1;
        }

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
