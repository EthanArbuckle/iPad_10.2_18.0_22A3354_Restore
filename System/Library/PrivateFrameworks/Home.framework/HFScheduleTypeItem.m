@implementation HFScheduleTypeItem

- (HFScheduleTypeItem)initWithScheduleType:(unint64_t)a3 scheduleBuilder:(id)a4
{
  id v7;
  HFScheduleTypeItem *v8;
  HFScheduleTypeItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFScheduleTypeItem;
  v8 = -[HFScheduleTypeItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_scheduleBuilder, a4);
    v9->_selected = objc_msgSend(v7, "estimatedScheduleType") == a3;
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = +[HFScheduleTypeItem sortOrderForType:](HFScheduleTypeItem, "sortOrderForType:", -[HFScheduleTypeItem type](self, "type", a3));
  v13[0] = CFSTR("title");
  +[HFScheduleUtilities localizedStringFromScheduleType:](HFScheduleUtilities, "localizedStringFromScheduleType:", -[HFScheduleTypeItem type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("selected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFScheduleTypeItem isSelected](self, "isSelected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("manualSortKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = CFSTR("shouldDisableForNonAdminUsers");
  v14[2] = v7;
  v14[3] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (unint64_t)sortOrderForType:(unint64_t)a3
{
  unint64_t v3;
  void *v6;
  void *v7;

  v3 = a3;
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFScheduleTypeItemProvider.m"), 52, CFSTR("Unknown schedule type [%@]"), v7);

    return 0;
  }
  return v3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleBuilder, 0);
}

@end
