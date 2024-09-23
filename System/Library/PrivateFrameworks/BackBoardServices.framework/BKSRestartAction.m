@implementation BKSRestartAction

+ (id)actionWithOptions:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forSetting:", v5, 1);

  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInfo:responder:", v4, 0);
  return v6;
}

- (unint64_t)options
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[BKSRestartAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

@end
