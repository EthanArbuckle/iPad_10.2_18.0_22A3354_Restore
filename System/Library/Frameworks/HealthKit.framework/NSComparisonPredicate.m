@implementation NSComparisonPredicate

void __95__NSComparisonPredicate_HKFilterExtension__hk_filterRepresentationForDataTypes_isSubpredicate___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("sumQuantity");
  v2[1] = CFSTR("averageQuantity");
  v2[2] = CFSTR("minimumQuantity");
  v2[3] = CFSTR("maximumQuantity");
  v2[4] = CFSTR("activitySumQuantity");
  v2[5] = CFSTR("activityAverageQuantity");
  v2[6] = CFSTR("activityMinimumQuantity");
  v2[7] = CFSTR("activityMaximumQuantity");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hk_filterRepresentationForDataTypes_isSubpredicate__statsPrefixes;
  hk_filterRepresentationForDataTypes_isSubpredicate__statsPrefixes = v0;

}

@end
