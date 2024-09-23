@implementation HUQuickControlSingleItemPredicate

+ (id)predicateWithControlItemClass:(Class)a3
{
  HUQuickControlSingleItemPredicate *v4;
  _QWORD v6[5];

  v4 = [HUQuickControlSingleItemPredicate alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HUQuickControlSingleItemPredicate_predicateWithControlItemClass___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8lu32l8;
  v6[4] = a3;
  return -[HUQuickControlSingleItemPredicate initWithBlock:](v4, "initWithBlock:", v6);
}

uint64_t __67__HUQuickControlSingleItemPredicate_predicateWithControlItemClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (HUQuickControlSingleItemPredicate)initWithBlock:(id)a3
{
  id v4;
  HUQuickControlSingleItemPredicate *v5;
  HUQuickControlSingleItemPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlSingleItemPredicate;
  v5 = -[HUQuickControlSingleItemPredicate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HUQuickControlSingleItemPredicate setBlock:](v5, "setBlock:", v4);

  return v6;
}

- (BOOL)matchesControlItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;

  v4 = a3;
  -[HUQuickControlSingleItemPredicate block](self, "block");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HUQuickControlSingleItemPredicate block](self, "block");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)matchingControlItemsForControlItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0C99D20];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HUQuickControlSingleItemPredicate_matchingControlItemsForControlItems___block_invoke;
  v7[3] = &unk_1E6F4C330;
  v7[4] = self;
  objc_msgSend(a3, "na_firstObjectPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_arrayWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __73__HUQuickControlSingleItemPredicate_matchingControlItemsForControlItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesControlItem:", a2);
}

- (unint64_t)maximumNumberOfMatches
{
  return 1;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
