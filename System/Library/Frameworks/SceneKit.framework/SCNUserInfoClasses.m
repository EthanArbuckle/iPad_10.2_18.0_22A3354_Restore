@implementation SCNUserInfoClasses

id __SCNUserInfoClasses_block_invoke()
{
  void *v0;
  id result;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  if (SCNUserInfoClassesWithoutCollections_onceToken != -1)
    dispatch_once(&SCNUserInfoClassesWithoutCollections_onceToken, &__block_literal_global_70);
  v0 = (void *)SCNUserInfoClassesWithoutCollections_set;
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  result = (id)objc_msgSend(v0, "setByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2));
  SCNUserInfoClasses_set = (uint64_t)result;
  return result;
}

@end
