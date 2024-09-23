@implementation ClassesForInitialQueries

void ___ClassesForInitialQueries_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[9];

  v5[8] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  v5[5] = objc_opt_class();
  v5[6] = objc_opt_class();
  v5[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_ClassesForInitialQueries_classesForInitialQueriesInLibrary;
  _ClassesForInitialQueries_classesForInitialQueriesInLibrary = v0;

  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_ClassesForInitialQueries_classesForInitialQueriesInMomentShare;
  _ClassesForInitialQueries_classesForInitialQueriesInMomentShare = v2;

}

@end
