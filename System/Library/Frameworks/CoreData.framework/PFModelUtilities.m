@implementation PFModelUtilities

void __59___PFModelUtilities_addRelationships_toPropertiesOfEntity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
