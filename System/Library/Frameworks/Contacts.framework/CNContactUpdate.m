@implementation CNContactUpdate

+ (id)updateWithValue:(id)a3 property:(id)a4
{
  id v5;
  id v6;
  CNContactKeyValueUpdate *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNContactKeyValueUpdate initWithProperty:value:]([CNContactKeyValueUpdate alloc], "initWithProperty:value:", v5, v6);

  return v7;
}

+ (id)updateMultiValueWithDiff:(id)a3 property:(id)a4
{
  id v5;
  id v6;
  CNContactMultiValueDiffUpdate *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CNContactMultiValueDiffUpdate initWithProperty:diff:]([CNContactMultiValueDiffUpdate alloc], "initWithProperty:diff:", v5, v6);

  return v7;
}

@end
