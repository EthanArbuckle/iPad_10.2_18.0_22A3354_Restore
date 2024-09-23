@implementation CADCalendarItemsWithExternalIdentifierPredicate

uint64_t __137__CADCalendarItemsWithExternalIdentifierPredicate_EKPredicateEvaluating__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[4], "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1[5], "removeObjectForKey:", v3);
      v4 = objc_msgSend(a1[6], "ekPredicateEvaluateWithObject:", v5);
    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

@end
