@implementation _PFModelUtilities

+ (void)addAttributes:(void *)a3 toPropertiesOfEntity:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSAttributeDescription *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v15 = (void *)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  objc_opt_self();
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(a2);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(a2, "objectForKey:", v9);
        objc_opt_self();
        v11 = objc_alloc_init(NSAttributeDescription);
        -[NSPropertyDescription setName:](v11, "setName:", v9);
        -[NSAttributeDescription setAttributeType:](v11, "setAttributeType:", objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 0), "unsignedIntegerValue"));
        if ((unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          -[NSPropertyDescription setOptional:](v11, "setOptional:", objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 1), "BOOLValue"));
          if ((unint64_t)objc_msgSend(v10, "count") >= 3)
          {
            if (-[NSAttributeDescription attributeType](v11, "attributeType") == NSTransformableAttributeType)
            {
              v12 = objc_msgSend(v10, "objectAtIndex:", 2);
              if (v12 != objc_msgSend(MEMORY[0x1E0C99E38], "null"))
                -[NSAttributeDescription setAttributeValueClassName:](v11, "setAttributeValueClassName:", objc_msgSend(v10, "objectAtIndex:", 2));
              if ((unint64_t)objc_msgSend(v10, "count") >= 4)
                -[NSAttributeDescription setValueTransformerName:](v11, "setValueTransformerName:", objc_msgSend(v10, "objectAtIndex:", 3));
            }
            else
            {
              v13 = -[NSAttributeDescription attributeType](v11, "attributeType");
              v14 = (void *)objc_msgSend(v10, "objectAtIndex:", 2);
              if (v13 == 1000)
                -[NSAttributeDescription setAllowsExternalBinaryDataStorage:](v11, "setAllowsExternalBinaryDataStorage:", objc_msgSend(v14, "BOOLValue"));
              else
                -[NSAttributeDescription setDefaultValue:](v11, "setDefaultValue:", v14);
            }
          }
        }
        objc_msgSend(v16, "addObject:", v11);

      }
      v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  objc_msgSend(v15, "addObjectsFromArray:", v16);
  objc_msgSend(a3, "setProperties:", v15);

}

+ (void)addRelationships:(void *)a3 toPropertiesOfEntity:
{
  id v5;
  _QWORD v6[5];

  objc_opt_self();
  v5 = (id)objc_msgSend((id)objc_msgSend(a3, "properties"), "mutableCopy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___PFModelUtilities_addRelationships_toPropertiesOfEntity___block_invoke;
  v6[3] = &unk_1E1EDE780;
  v6[4] = v5;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(a3, "setProperties:", v5);

}

@end
