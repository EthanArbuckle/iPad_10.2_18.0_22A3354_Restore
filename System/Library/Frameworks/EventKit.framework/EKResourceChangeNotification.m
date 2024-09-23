@implementation EKResourceChangeNotification

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownRelationshipMultiValueKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__EKResourceChangeNotification_knownRelationshipMultiValueKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (knownRelationshipMultiValueKeys_onceToken_1 != -1)
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_1, block);
  return (id)knownRelationshipMultiValueKeys_keys_1;
}

void __63__EKResourceChangeNotification_knownRelationshipMultiValueKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *MEMORY[0x1E0D0B7E8]);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKResourceChangeNotification;
  objc_msgSendSuper2(&v6, sel_knownRelationshipMultiValueKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v4 = objc_msgSend(v2, "copy");
  v5 = (void *)knownRelationshipMultiValueKeys_keys_1;
  knownRelationshipMultiValueKeys_keys_1 = v4;

}

- (NSDate)lastModifiedDate
{
  return (NSDate *)-[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B7E0]);
}

- (void)setLastModifiedDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B7E0]);
}

- (NSSet)resourceChanges
{
  return (NSSet *)-[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B7E8]);
}

- (void)setResourceChanges:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B7E8]);
}

- (void)addResourceChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil resource change passed."));
    v4 = 0;
  }
  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", v4, *MEMORY[0x1E0D0B7E8]);

}

- (void)removeResourceChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Nil resource change passed."));
    v4 = 0;
  }
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", v4, *MEMORY[0x1E0D0B7E8]);

}

@end
