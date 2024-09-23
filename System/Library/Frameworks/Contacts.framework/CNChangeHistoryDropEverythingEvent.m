@implementation CNChangeHistoryDropEverythingEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;

  v3 = (void *)objc_opt_class();
  return objc_msgSend(v3, "isEqual:", objc_opt_class());
}

- (unint64_t)hash
{
  return 42;
}

- (id)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4;
  CNSafeChangeHistoryEventVisitorWrapper *v5;

  v4 = a3;
  v5 = -[CNSafeChangeHistoryEventVisitorWrapper initWithChangeHistoryEventVisitor:]([CNSafeChangeHistoryEventVisitorWrapper alloc], "initWithChangeHistoryEventVisitor:", v4);

  -[CNSafeChangeHistoryEventVisitorWrapper visitDropEverythingEvent:](v5, "visitDropEverythingEvent:", self);
}

+ (unint64_t)instanceSortOrder
{
  return 0;
}

@end
