@implementation EKPersistentParticipant

- (id)displayNameRaw
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B868]);
}

- (id)phoneNumber
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B890]);
}

- (id)lastName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B888]);
}

- (id)firstName
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B878]);
}

- (id)emailAddress
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B870]);
}

- (id)inviterNameString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B880]);
}

- (id)comment
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B858]);
}

- (id)URLString
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B850]);
}

void __50__EKPersistentParticipant_defaultPropertiesToLoad__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B878];
  v5[0] = *MEMORY[0x1E0D0B868];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D0B820];
  v5[2] = *MEMORY[0x1E0D0B888];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D0B890];
  v5[4] = *MEMORY[0x1E0D0B870];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0D0B850];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_10;
  defaultPropertiesToLoad_defaultPropertiesToLoad_10 = v3;

}

+ (id)defaultPropertiesToLoad
{
  if (defaultPropertiesToLoad_onceToken_11 != -1)
    dispatch_once(&defaultPropertiesToLoad_onceToken_11, &__block_literal_global_69);
  return (id)defaultPropertiesToLoad_defaultPropertiesToLoad_10;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return (id)*MEMORY[0x1E0D0B820];
}

- (id)UUID
{
  return -[EKPersistentObject primitiveStringValueForKey:](self, "primitiveStringValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (void)setUUID:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (void)setDisplayNameRaw:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B868]);
}

- (void)setEmailAddress:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B870]);
}

- (void)setPhoneNumber:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B890]);
}

- (void)setFirstName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B878]);
}

- (void)setLastName:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B888]);
}

- (void)setURLString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B850]);
}

- (void)setComment:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B858]);
}

- (id)commentLastModifiedDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B860]);
}

- (void)setCommentLastModifiedDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B860]);
}

- (id)owner
{
  return -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", *MEMORY[0x1E0D0B830]);
}

- (void)setOwner:(id)a3
{
  -[EKPersistentObject primitiveSetRelationValue:forKey:](self, "primitiveSetRelationValue:forKey:", a3, *MEMORY[0x1E0D0B830]);
}

- (id)proposedStartDate
{
  return -[EKPersistentObject primitiveDateValueForKey:](self, "primitiveDateValueForKey:", *MEMORY[0x1E0D0B898]);
}

- (void)setProposedStartDate:(id)a3
{
  -[EKPersistentObject primitiveSetDateValue:forKey:](self, "primitiveSetDateValue:forKey:", a3, *MEMORY[0x1E0D0B898]);
}

- (void)setInviterNameString:(id)a3
{
  -[EKPersistentObject primitiveSetStringValue:forKey:](self, "primitiveSetStringValue:forKey:", a3, *MEMORY[0x1E0D0B880]);
}

- (int)proposedStartDateStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B8A0]);
}

- (void)setProposedStartDateStatus:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B8A0]);
}

- (int)scheduleStatus
{
  return -[EKPersistentObject primitiveIntValueForKey:](self, "primitiveIntValueForKey:", *MEMORY[0x1E0D0B8B0]);
}

- (void)setScheduleStatus:(int)a3
{
  -[EKPersistentObject primitiveSetIntValue:forKey:](self, "primitiveSetIntValue:forKey:", *(_QWORD *)&a3, *MEMORY[0x1E0D0B8B0]);
}

- (BOOL)scheduleForceSend
{
  return -[EKPersistentObject primitiveBoolValueForKey:](self, "primitiveBoolValueForKey:", *MEMORY[0x1E0D0B8A8]);
}

- (void)setScheduleForceSend:(BOOL)a3
{
  -[EKPersistentObject primitiveSetBoolValue:forKey:](self, "primitiveSetBoolValue:forKey:", a3, *MEMORY[0x1E0D0B8A8]);
}

- (id)url
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKPersistentParticipant URLString](self, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[EKPersistentParticipant URLString](self, "URLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)semanticIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[EKPersistentParticipant emailAddress](self, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[EKPersistentParticipant phoneNumber](self, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[EKPersistentParticipant URLString](self, "URLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v5 = v8;
      }
      else
      {
        -[EKPersistentParticipant displayNameRaw](self, "displayNameRaw");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v5 = v10;
        }
        else
        {
          -[EKPersistentParticipant firstName](self, "firstName");
          v12 = objc_claimAutoreleasedReturnValue();
          -[EKPersistentParticipant lastName](self, "lastName");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v12 | v13)
          {
            objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14;
            if (v12)
              objc_msgSend(v14, "appendFormat:", CFSTR("FIRST=%@;"), v12);
            if (v13)
              objc_msgSend(v15, "appendFormat:", CFSTR("LAST=%@;"), v13);
            v5 = (id)objc_msgSend(v15, "copy");

          }
          else
          {
            v5 = 0;
          }

        }
      }

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return self;
}

@end
