@implementation CADEventTimeWindowPredicate(EKPredicateEvaluating)

- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_msgSend(a1, "wrappedPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "evaluateWithObject:", v4);

  if (!v6)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  objc_msgSend(a1, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  objc_msgSend(a1, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  objc_msgSend(v4, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v15 = v14;

  objc_msgSend(v4, "endDateUnadjustedForLegacyClients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;

  if (v15 >= v12 || v18 <= v9 || (v19 = 1, objc_msgSend(a1, "mustStartInInterval")) && v15 < v9)
  {
    objc_msgSend(a1, "wrappedPredicate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v22 = (void *)MEMORY[0x1E0C99E80];
      v23 = v4;
      objc_msgSend(v22, "timeZoneWithAbbreviation:", CFSTR("GMT"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "eventStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "startDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v25, "occurrencesExistInRangeForEvent:startDate:endDate:mustStartInInterval:timezone:", v23, v26, v27, objc_msgSend(a1, "mustStartInInterval"), v24);

      goto LABEL_10;
    }
LABEL_9:
    v19 = 0;
  }
LABEL_10:

  return v19;
}

@end
