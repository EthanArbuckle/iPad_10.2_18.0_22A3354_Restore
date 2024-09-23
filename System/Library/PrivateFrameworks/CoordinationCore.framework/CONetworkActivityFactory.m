@implementation CONetworkActivityFactory

+ (id)activityWithLabel:(unsigned int)a3 parentActivity:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  v5 = (void *)nw_activity_create();
  if (v4)
    nw_activity_set_parent_activity();

  return v5;
}

- (id)activityWithLabel:(unsigned int)a3 parentActivity:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "activityWithLabel:parentActivity:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
