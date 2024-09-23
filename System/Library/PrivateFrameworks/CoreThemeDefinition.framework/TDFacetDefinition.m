@implementation TDFacetDefinition

- (id)dateOfLastChange
{
  void *v3;

  -[TDFacetDefinition willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("dateOfLastChange"));
  v3 = (void *)-[TDFacetDefinition primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("dateOfLastChange"));
  -[TDFacetDefinition didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("dateOfLastChange"));
  return v3;
}

- (void)setDateOfLastChange:(id)a3
{
  -[TDFacetDefinition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dateOfLastChange"));
  -[TDFacetDefinition setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("dateOfLastChange"));
  -[TDFacetDefinition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dateOfLastChange"));
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setValue:forKey:", -[TDFacetDefinition valueForKey:](self, "valueForKey:", CFSTR("facetName")), CFSTR("facetName"));
}

- (id)keySpec
{
  void *v3;

  -[TDFacetDefinition willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("keySpec"));
  v3 = (void *)-[TDFacetDefinition primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("keySpec"));
  -[TDFacetDefinition didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("keySpec"));
  return v3;
}

@end
