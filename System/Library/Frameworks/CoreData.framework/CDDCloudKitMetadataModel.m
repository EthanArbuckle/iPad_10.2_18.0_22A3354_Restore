@implementation CDDCloudKitMetadataModel

+ (id)newMetadataModel
{
  NSManagedObjectModel *v2;
  NSEntityDescription *v3;
  objc_class *v4;
  NSEntityDescription *v5;
  objc_class *v6;
  _QWORD v8[2];
  _QWORD v9[5];
  const __CFString *v10;
  uint64_t v11;
  _QWORD v12[5];
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD v16[5];
  _QWORD v17[7];

  v17[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(NSManagedObjectModel);
  v3 = objc_alloc_init(NSEntityDescription);
  v4 = (objc_class *)objc_opt_class();
  -[NSEntityDescription setName:](v3, "setName:", NSStringFromClass(v4));
  -[NSEntityDescription setManagedObjectClassName:](v3, "setManagedObjectClassName:", -[NSEntityDescription name](v3, "name"));
  v16[0] = CFSTR("bundleIdentifier");
  v16[1] = CFSTR("storePath");
  v17[0] = &unk_1E1F523F8;
  v17[1] = &unk_1E1F52410;
  v16[2] = CFSTR("fileProtectionType");
  v15[0] = &unk_1E1F4B528;
  v15[1] = MEMORY[0x1E0C9AAA0];
  v15[2] = *MEMORY[0x1E0CB2AE0];
  v17[2] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v17[3] = &unk_1E1F52428;
  v16[3] = CFSTR("storeConfigurationName");
  v16[4] = CFSTR("containerIdentifier");
  v17[4] = &unk_1E1F52440;
  +[CDDCloudKitMetadataModel addAttributes:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5), v3);
  v5 = objc_alloc_init(NSEntityDescription);
  v6 = (objc_class *)objc_opt_class();
  -[NSEntityDescription setName:](v5, "setName:", NSStringFromClass(v6));
  -[NSEntityDescription setManagedObjectClassName:](v5, "setManagedObjectClassName:", -[NSEntityDescription name](v5, "name"));
  +[CDDCloudKitMetadataModel addAttributes:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, &unk_1E1F4AED0, v5);
  v13 = CFSTR("registeredClient");
  v12[0] = &unk_1E1F4B5A0;
  v12[1] = v3;
  v12[2] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12[3] = &unk_1E1F4B5B8;
  v12[4] = &unk_1E1F4B5D0;
  v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  +[CDDCloudKitMetadataModel addRelationships:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1), v5);
  v9[4] = &unk_1E1F4B5A0;
  v10 = CFSTR("scheduledActivities");
  v9[0] = &unk_1E1F4B5D0;
  v9[1] = v5;
  v9[2] = CFSTR("registeredClient");
  v9[3] = &unk_1E1F4B5E8;
  v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  +[CDDCloudKitMetadataModel addRelationships:toPropertiesOfEntity:]((uint64_t)CDDCloudKitMetadataModel, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1), v3);
  v8[0] = v3;
  v8[1] = v5;
  -[NSManagedObjectModel setEntities:](v2, "setEntities:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2));

  return v2;
}

+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:
{
  id v5;
  _QWORD v6[5];

  objc_opt_self();
  v5 = (id)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CDDCloudKitMetadataModel_addAttributes_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_1E1EDE780;
  v6[4] = v5;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(a3, "setProperties:", v5);

}

+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:
{
  id v5;
  _QWORD v6[5];

  objc_opt_self();
  v5 = (id)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__CDDCloudKitMetadataModel_addRelationships_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_1E1EDE780;
  v6[4] = v5;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(a3, "setProperties:", v5);

}

void __63__CDDCloudKitMetadataModel_addAttributes_toPropertiesOfEntity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  NSAttributeDescription *v8;

  v8 = objc_alloc_init(NSAttributeDescription);
  -[NSPropertyDescription setName:](v8, "setName:", a2);
  -[NSAttributeDescription setAttributeType:](v8, "setAttributeType:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "unsignedIntegerValue"));
  if (-[NSAttributeDescription attributeType](v8, "attributeType") == NSTransformableAttributeType)
    -[NSAttributeDescription setValueTransformerName:](v8, "setValueTransformerName:", +[NSCloudKitMirroringDelegate cloudKitMetadataTransformerName](NSCloudKitMirroringDelegate, "cloudKitMetadataTransformerName"));
  if ((unint64_t)objc_msgSend(a3, "count") >= 2)
  {
    -[NSPropertyDescription setOptional:](v8, "setOptional:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "BOOLValue"));
    if ((unint64_t)objc_msgSend(a3, "count") >= 3)
    {
      v6 = -[NSAttributeDescription attributeType](v8, "attributeType");
      v7 = objc_msgSend(a3, "objectAtIndex:", 2);
      if (v6 == 1800)
        -[NSAttributeDescription setAttributeValueClassName:](v8, "setAttributeValueClassName:", v7);
      else
        -[NSAttributeDescription setDefaultValue:](v8, "setDefaultValue:", v7);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __66__CDDCloudKitMetadataModel_addRelationships_toPropertiesOfEntity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  NSRelationshipDescription *v7;

  v7 = objc_alloc_init(NSRelationshipDescription);
  -[NSPropertyDescription setName:](v7, "setName:", a2);
  -[NSRelationshipDescription setMaxCount:](v7, "setMaxCount:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "unsignedIntegerValue"));
  -[NSRelationshipDescription setDestinationEntity:](v7, "setDestinationEntity:", objc_msgSend(a3, "objectAtIndex:", 1));
  if ((unint64_t)objc_msgSend(a3, "count") >= 3)
  {
    v6 = objc_msgSend(a3, "objectAtIndex:", 2);
    if (v6 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    {
      -[NSRelationshipDescription setInverseRelationship:](v7, "setInverseRelationship:", -[NSDictionary objectForKey:](-[NSEntityDescription relationshipsByName](-[NSRelationshipDescription destinationEntity](v7, "destinationEntity"), "relationshipsByName"), "objectForKey:", v6));
      if (-[NSRelationshipDescription inverseRelationship](v7, "inverseRelationship"))
        -[NSRelationshipDescription setInverseRelationship:](-[NSRelationshipDescription inverseRelationship](v7, "inverseRelationship"), "setInverseRelationship:", v7);
    }
    if ((unint64_t)objc_msgSend(a3, "count") >= 4)
    {
      -[NSRelationshipDescription setDeleteRule:](v7, "setDeleteRule:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 3), "unsignedIntegerValue"));
      if ((unint64_t)objc_msgSend(a3, "count") >= 5)
        -[NSPropertyDescription setOptional:](v7, "setOptional:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 4), "BOOLValue"));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

@end
