@implementation TDNamedEffectProduction

- (id)_nameAssociatedWithNameIdentifier:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  id v11;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("NamedElement"));
  v6 = objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %@"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3));
  v7 = (void *)-[TDNamedEffectProduction managedObjectContext](self, "managedObjectContext");
  objc_msgSend(v5, "setPredicate:", v6);
  v11 = 0;
  v8 = (void *)objc_msgSend(v7, "executeFetchRequest:error:", v5, &v11);

  if (v11)
  {
    NSLog(CFSTR("Unable to lookup named effect using identifier: %d  %@"), v3, objc_msgSend(v11, "localizedDescription"));
    return 0;
  }
  else
  {
    v10 = (void *)objc_msgSend(v8, "count");
    if (v10)
      v10 = (void *)objc_msgSend(v8, "objectAtIndex:", 0);
    return (id)objc_msgSend(v10, "name");
  }
}

- (id)displayName
{
  id v3;

  if (-[TDNamedEffectProduction name](self, "name"))
    v3 = (id)objc_msgSend((id)-[TDNamedEffectProduction name](self, "name"), "name");
  else
    v3 = -[TDNamedEffectProduction _nameAssociatedWithNameIdentifier:](self, "_nameAssociatedWithNameIdentifier:", objc_msgSend((id)-[TDNamedEffectProduction baseKeySpec](self, "baseKeySpec"), "nameIdentifier"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v3);
}

@end
