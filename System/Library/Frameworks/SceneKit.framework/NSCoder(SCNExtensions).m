@implementation NSCoder(SCNExtensions)

- (uint64_t)scn_decodeArrayOfObjectsOfClass:()SCNExtensions forKey:
{
  if (objc_msgSend(a1, "requiresSecureCoding"))
    return objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:", a3, a4);
  else
    return objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), a3, 0), a4);
}

- (uint64_t)scn_decodeArrayOfObjectsOfClasses:()SCNExtensions forKey:
{
  if (objc_msgSend(a1, "requiresSecureCoding"))
    return objc_msgSend(a1, "decodeArrayOfObjectsOfClasses:forKey:", a3, a4);
  else
    return objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "setByAddingObject:", objc_opt_class()), a4);
}

- (uint64_t)scn_decodeArrayOfObjectsOfClass:()SCNExtensions containingNestedContainersForKey:
{
  void *v7;
  uint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = a3;
  v8 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2)), a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v8;
  else
    return 0;
}

- (uint64_t)scn_decodeArrayOfObjectsOfClasses:()SCNExtensions containingNestedContainersForKey:
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "setByAddingObject:", objc_opt_class()), a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v4;
  else
    return 0;
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClass:()SCNExtensions objectsOfClass:forKey:
{
  if (objc_msgSend(a1, "requiresSecureCoding"))
    return objc_msgSend(a1, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", a3, a4, a5);
  else
    return objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), a3, a4, 0), a5);
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClasses:()SCNExtensions objectsOfClasses:forKey:
{
  if (objc_msgSend(a1, "requiresSecureCoding"))
    return objc_msgSend(a1, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", a3, a4, a5);
  else
    return objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(a3, "setByAddingObjectsFromSet:", a4), "setByAddingObject:", objc_opt_class()), a5);
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClass:()SCNExtensions objectsOfClass:containingNestedContainersForKey:
{
  void *v9;
  uint64_t v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = a3;
  v12[2] = a4;
  v10 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3)), a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v10;
  else
    return 0;
}

- (uint64_t)scn_decodeDictionaryWithKeysOfClasses:()SCNExtensions objectsOfClasses:containingNestedContainersForKey:
{
  uint64_t v5;

  v5 = objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(a3, "setByAddingObjectsFromSet:", a4), "setByAddingObject:", objc_opt_class()), a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v5;
  else
    return 0;
}

@end
