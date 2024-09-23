@implementation FCFeedTransformationIdentity

+ (id)sharedInstance
{
  if (qword_1ED0F84D0 != -1)
    dispatch_once(&qword_1ED0F84D0, &__block_literal_global_109);
  return (id)_MergedGlobals_183;
}

void __46__FCFeedTransformationIdentity_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_183;
  _MergedGlobals_183 = v0;

}

- (id)transformFeedItems:(id)a3
{
  return (id)objc_msgSend(a3, "copy");
}

@end
