@implementation CPLDiffTracker

- (void)noteObjectAreTotallyDifferent
{
  self->_objectsAreTotallyDifferent = 1;
}

- (void)noteObjectsDifferOnProperty:(id)a3
{
  id v4;
  NSMutableSet *differingProperties;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  differingProperties = self->_differingProperties;
  v8 = v4;
  if (!differingProperties)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_differingProperties;
    self->_differingProperties = v6;

    v4 = v8;
    differingProperties = self->_differingProperties;
  }
  -[NSMutableSet addObject:](differingProperties, "addObject:", v4);

}

- (BOOL)areObjectsDifferentOnProperty:(id)a3
{
  if (self->_objectsAreTotallyDifferent)
    return 1;
  else
    return -[NSMutableSet containsObject:](self->_differingProperties, "containsObject:", a3);
}

- (id)redactedDescription
{
  __CFString *v2;
  id v4;
  void *v5;
  void *v6;

  if (self->_objectsAreTotallyDifferent)
  {
    v2 = CFSTR("[totally different objects]");
  }
  else if (-[NSMutableSet count](self->_differingProperties, "count"))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSMutableSet allObjects](self->_differingProperties, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("[diff. on %@]"), v6);

  }
  else
  {
    v2 = CFSTR("[different objects]");
  }
  return v2;
}

- (BOOL)shouldCompareAllProperties
{
  return self->_shouldCompareAllProperties;
}

- (void)setShouldCompareAllProperties:(BOOL)a3
{
  self->_shouldCompareAllProperties = a3;
}

- (BOOL)objectsAreTotallyDifferent
{
  return self->_objectsAreTotallyDifferent;
}

- (NSSet)differingProperties
{
  return &self->_differingProperties->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_differingProperties, 0);
}

@end
