@implementation CNUICoreContactPropertyValueFilterFactory

+ (CNUICoreContactPropertyValueFilter)nicknameFilter
{
  return (CNUICoreContactPropertyValueFilter *)objc_alloc_init(CNUICoreContactNicknameValueFilter);
}

+ (CNUICoreContactPropertyValueFilter)photoFilter
{
  return (CNUICoreContactPropertyValueFilter *)objc_alloc_init(CNUICoreContactPhotoValueFilter);
}

+ (CNUICoreContactPropertyValueFilter)noteFilter
{
  return (CNUICoreContactPropertyValueFilter *)objc_alloc_init(CNUICoreContactNoteValueFilter);
}

+ (CNUICoreContactPropertyValueFilter)relationshipsFilter
{
  return (CNUICoreContactPropertyValueFilter *)objc_alloc_init(CNUICoreContactRelationshipsFilter);
}

+ (id)aggregatePropertyValueFilterWithValueFilters:(id)a3
{
  id v3;
  CNUICoreContactAggregateValueFilter *v4;

  v3 = a3;
  v4 = -[CNUICoreContactAggregateValueFilter initWithValueFilters:]([CNUICoreContactAggregateValueFilter alloc], "initWithValueFilters:", v3);

  return v4;
}

@end
