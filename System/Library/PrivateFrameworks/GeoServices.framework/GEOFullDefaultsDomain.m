@implementation GEOFullDefaultsDomain

void ___GEOFullDefaultsDomain_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[GEOFilePaths pathFor:](GEOFilePaths, "pathFor:", 9);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v0;
  if (qword_1ECDBBA88 != -1)
  {
    dispatch_once(&qword_1ECDBBA88, &__block_literal_global_57);
    v0 = v3;
  }
  objc_msgSend(v0, "stringByAppendingPathComponent:", qword_1ECDBBA80);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECDBBA90;
  qword_1ECDBBA90 = v1;

}

@end
