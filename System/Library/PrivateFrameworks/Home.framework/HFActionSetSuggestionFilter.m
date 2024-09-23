@implementation HFActionSetSuggestionFilter

+ (HFActionSetSuggestionFilter)filterWithServices:(id)a3
{
  id v3;
  HFActionSetSuggestionFilter *v4;

  v3 = a3;
  v4 = -[HFActionSetSuggestionFilter init]([HFActionSetSuggestionFilter alloc], "init");
  -[HFActionSetSuggestionFilter setServices:](v4, "setServices:", v3);

  return v4;
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
}

@end
