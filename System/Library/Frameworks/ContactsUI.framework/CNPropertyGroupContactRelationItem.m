@implementation CNPropertyGroupContactRelationItem

+ (id)emptyValueForLabel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97288], "contactRelationWithName:", &stru_1E20507A8);
}

- (CNContactRelation)contactRelation
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContactRelation *)v3;
}

- (id)normalizedValue
{
  void *v2;
  void *v3;

  -[CNPropertyGroupContactRelationItem contactRelation](self, "contactRelation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayStringForValue:(id)a3
{
  return (id)objc_msgSend(a3, "name");
}

- (id)valueForDisplayString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97288], "contactRelationWithName:", a3);
}

@end
