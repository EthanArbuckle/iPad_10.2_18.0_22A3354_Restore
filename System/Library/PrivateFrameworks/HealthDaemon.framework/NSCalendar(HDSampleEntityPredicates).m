@implementation NSCalendar(HDSampleEntityPredicates)

- (id)hd_predicateForSamplesWithTypes:()HDSampleEntityPredicates endingBeforeDate:minusDays:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSCalendar(HDSampleEntityPredicates) hd_predicateForSamplesWithTypes:endingBeforeDate:minusDays:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("HDSampleEntity.m"), 1038, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date != nil"));

  }
  objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    HDSampleEntityPredicateForDataTypes(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  HDSampleEntityPredicateForEndDate(4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)hd_predicateForSamplesWithTypes:()HDSampleEntityPredicates endingAfterDate:minusDays:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[NSCalendar(HDSampleEntityPredicates) hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("HDSampleEntity.m"), 1025, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date != nil"));

  }
  objc_msgSend(a1, "hk_dateBySubtractingDays:fromDate:", a5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    HDSampleEntityPredicateForDataTypes(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  HDSampleEntityPredicateForEndDate(6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
