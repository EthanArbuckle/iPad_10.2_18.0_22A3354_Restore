@implementation CNContainerDiff

+ (id)diffContainer:(id)a3 to:(id)a4
{
  void *v4;
  CNContainerDiff *v5;

  +[CNContainerDiffCalculator diffContainer:to:](CNContainerDiffCalculator, "diffContainer:to:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContainerDiff initWithUpdates:]([CNContainerDiff alloc], "initWithUpdates:", v4);

  return v5;
}

- (CNContainerDiff)initWithUpdates:(id)a3
{
  id v4;
  CNContainerDiff *v5;
  uint64_t v6;
  NSArray *updates;
  CNContainerDiff *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContainerDiff;
  v5 = -[CNContainerDiff init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    updates = v5->_updates;
    v5->_updates = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("updates"), self->_updates);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_updates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
}

@end
