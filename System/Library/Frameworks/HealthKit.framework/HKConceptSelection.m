@implementation HKConceptSelection

- (HKConceptSelection)init
{
  HKConceptSelection *v2;
  HKConceptSelection *v3;
  HKConceptSelection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKConceptSelection;
  v2 = -[HKConceptSelection init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)selectionForAllNodes
{
  return -[HKAllConceptSelection initWithValue:]([HKAllConceptSelection alloc], "initWithValue:", 1);
}

+ (id)selectionForNoNodes
{
  return -[HKAllConceptSelection initWithValue:]([HKAllConceptSelection alloc], "initWithValue:", 0);
}

+ (id)selectionForNodeWithIdentifier:(id)a3
{
  id v3;
  HKIdentifierConceptSelection *v4;

  v3 = a3;
  v4 = -[HKIdentifierConceptSelection initWithIdentifier:]([HKIdentifierConceptSelection alloc], "initWithIdentifier:", v3);

  return v4;
}

+ (id)selectionForObjectsWithRelationshipFromSubjectSelection:(id)a3
{
  id v3;
  HKRelationshipConceptSelection *v4;

  v3 = a3;
  v4 = -[HKRelationshipConceptSelection initWithDirection:type:selection:]([HKRelationshipConceptSelection alloc], "initWithDirection:type:selection:", 1, -1, v3);

  return v4;
}

+ (id)selectionForSubjectsWithRelationshipToObjectSelection:(id)a3
{
  id v3;
  HKRelationshipConceptSelection *v4;

  v3 = a3;
  v4 = -[HKRelationshipConceptSelection initWithDirection:type:selection:]([HKRelationshipConceptSelection alloc], "initWithDirection:type:selection:", 0, -1, v3);

  return v4;
}

+ (id)selectionForObjectsWithRelationship:(int64_t)a3 fromSubjectSelection:(id)a4
{
  id v5;
  HKRelationshipConceptSelection *v6;

  v5 = a4;
  v6 = -[HKRelationshipConceptSelection initWithDirection:type:selection:]([HKRelationshipConceptSelection alloc], "initWithDirection:type:selection:", 1, a3, v5);

  return v6;
}

+ (id)selectionForSubjectsWithRelationship:(int64_t)a3 toObjectSelection:(id)a4
{
  id v5;
  HKRelationshipConceptSelection *v6;

  v5 = a4;
  v6 = -[HKRelationshipConceptSelection initWithDirection:type:selection:]([HKRelationshipConceptSelection alloc], "initWithDirection:type:selection:", 0, a3, v5);

  return v6;
}

+ (id)selectionForNodesWithAttribute:(int64_t)a3 value:(id)a4
{
  id v7;
  HKAttributeConceptSelection *v8;
  void *v10;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKConceptSelection.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    +[HKConceptSelection selectionForNodesWithAttribute:value:].cold.1();
  v8 = -[HKAttributeConceptSelection initWithAttribute:operatorType:value:]([HKAttributeConceptSelection alloc], "initWithAttribute:operatorType:value:", a3, 4, v7);

  return v8;
}

+ (id)selectionForNodesWithAttribute:(int64_t)a3 stringValue:(id)a4
{
  id v5;
  HKAttributeConceptSelection *v6;

  v5 = a4;
  v6 = -[HKAttributeConceptSelection initWithAttribute:operatorType:value:]([HKAttributeConceptSelection alloc], "initWithAttribute:operatorType:value:", a3, 4, v5);

  return v6;
}

+ (id)selectionForNodesWithAttribute:(int64_t)a3 likeStringValue:(id)a4
{
  id v5;
  HKAttributeConceptSelection *v6;

  v5 = a4;
  v6 = -[HKAttributeConceptSelection initWithAttribute:operatorType:value:]([HKAttributeConceptSelection alloc], "initWithAttribute:operatorType:value:", a3, 7, v5);

  return v6;
}

+ (id)selectionForNodesWithCoding:(id)a3
{
  id v3;
  HKMedicalCodingConceptSelection *v4;

  v3 = a3;
  v4 = -[HKMedicalCodingConceptSelection initWithMedicalCoding:]([HKMedicalCodingConceptSelection alloc], "initWithMedicalCoding:", v3);

  return v4;
}

+ (id)andSelectionWithSubselections:(id)a3
{
  id v3;
  HKCompoundConceptSelection *v4;

  v3 = a3;
  v4 = -[HKCompoundConceptSelection initWithSelections:operationType:]([HKCompoundConceptSelection alloc], "initWithSelections:operationType:", v3, 1);

  return v4;
}

+ (id)orSelectionWithSubselections:(id)a3
{
  id v3;
  HKCompoundConceptSelection *v4;

  v3 = a3;
  v4 = -[HKCompoundConceptSelection initWithSelections:operationType:]([HKCompoundConceptSelection alloc], "initWithSelections:operationType:", v3, 2);

  return v4;
}

+ (id)notSelectionWithSubselections:(id)a3
{
  id v3;
  HKCompoundConceptSelection *v4;

  v3 = a3;
  v4 = -[HKCompoundConceptSelection initWithSelections:operationType:]([HKCompoundConceptSelection alloc], "initWithSelections:operationType:", v3, 0);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConceptSelection)initWithCoder:(id)a3
{
  HKConceptSelection *v3;
  HKConceptSelection *v4;
  HKConceptSelection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKConceptSelection;
  v3 = -[HKConceptSelection init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

+ (void)selectionForNodesWithAttribute:value:.cold.1()
{
  __assert_rtn("+[HKConceptSelection selectionForNodesWithAttribute:value:]", "HKConceptSelection.m", 86, "[value isKindOfClass:[NSString class]]");
}

@end
