@implementation NSString

void __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsStrings__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = &unk_1E23FAED8;
  objc_msgSend(&unk_1E23FAED8, "if_compactMap:", &__block_literal_global_9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1E23F9B40);
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_intents_allowedUnarchiverClassesForProtoAsStrings___classesAsStrings;
  _intents_allowedUnarchiverClassesForProtoAsStrings___classesAsStrings = v4;

}

id __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsStrings__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("ObjCCollectionType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3
     || (objc_msgSend(v2, "objectForKey:", CFSTR("ObjCType")), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && ((v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("<")), v4 != 0x7FFFFFFFFFFFFFFFLL)
     || (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v4 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v5),
         v5,
         v4 != 0x7FFFFFFFFFFFFFFFLL)))
  {
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, objc_msgSend(v3, "length") - v4, &stru_1E2295770);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsClasses__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_intents_allowedUnarchiverClassesForProtoAsStrings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_compactMap:", &__block_literal_global_86541);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_intents_allowedUnarchiverClassesForProtoAsClasses___allowedClasses;
  _intents_allowedUnarchiverClassesForProtoAsClasses___allowedClasses = v3;

}

Class __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsClasses__block_invoke_2(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

@end
