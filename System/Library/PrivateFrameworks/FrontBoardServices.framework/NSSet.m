@implementation NSSet

id __65__NSSet_FrontBoardServices__fbs_singleLineDescriptionOfBSActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;

  v2 = a2;
  if (objc_msgSend(v2, "canSendResponse"))
  {
    objc_msgSend(off_1E38E9DF0, "succinctDescriptionForObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (objc_class *)objc_opt_class();

    NSStringFromClass(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
