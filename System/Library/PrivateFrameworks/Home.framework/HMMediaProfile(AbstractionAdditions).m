@implementation HMMediaProfile(AbstractionAdditions)

- (id)hf_accessoryLikeObject
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(a1, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hf_showAsAccessoryTile") & 1) != 0)
  {
    objc_msgSend(a1, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_siriEndpointProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "accessory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFAccessoryLikeObject _accessoryLikeObjectForObject:](HFAccessoryLikeObject, "_accessoryLikeObjectForObject:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
  }
  else
  {

  }
  v8.receiver = a1;
  v8.super_class = (Class)&off_1F04499F0;
  objc_msgSendSuper2(&v8, sel_hf_accessoryLikeObject);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hf_itemClass
{
  return objc_opt_class();
}

- (id)hf_containedServices
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_containedCharacteristics
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_containedServices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_185);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
