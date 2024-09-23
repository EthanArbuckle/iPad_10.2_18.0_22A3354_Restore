@implementation HKUserDomainConceptPropertyCollection(Medications)

+ (id)propertyCollectionWithUserSpecifiedName:()Medications userSpecifiedNotes:medicationVisualizationConfig:freeTextProperties:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:stringValue:", 160000, 1, v9);
    objc_msgSend(v13, "addObject:", v14);

  }
  if (v10)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:stringValue:", 160001, 1, v10);
    objc_msgSend(v13, "addObject:", v15);

  }
  if (v11 && objc_msgSend(v11, "length"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:stringValue:", 160008, 1, v11);
    objc_msgSend(v13, "addObject:", v16);

  }
  if (v12)
    objc_msgSend(v13, "addObjectsFromArray:", v12);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v13);

  return v17;
}

+ (id)userDomainConceptPropertyListWithFreeTextMedicationName:()Medications freeTextFormCode:freeTextStrengthQuantity:
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    v9 = (objc_class *)MEMORY[0x1E0CB6D10];
    v10 = a5;
    v11 = (void *)objc_msgSend([v9 alloc], "initWithName:quantity:type:", 0, v10, 160021);

    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(a1, "_userDomainConceptPropertyListWithFreeTextMedicationName:freeTextFormCode:namedQuantities:", v8, a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_userDomainConceptPropertyListWithFreeTextMedicationName:()Medications freeTextFormCode:namedQuantities:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a5;
  v9 = a3;
  v10 = [v7 alloc];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:stringValue:", 160020, 1, v9);

  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithArray:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:integerValue:", 160014, 1, a4);
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(v13, "addObjectsFromArray:", v8);
  return v13;
}

@end
