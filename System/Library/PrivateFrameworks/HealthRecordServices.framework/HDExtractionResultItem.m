@implementation HDExtractionResultItem

- (HDExtractionResultItem)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDExtractionResultItem)initWithOriginalFHIRResource:(id)a3 units:(id)a4 flags:(unint64_t)a5
{
  id v9;
  id v10;
  HDExtractionResultItem *v11;
  uint64_t v12;
  HDOriginalFHIRResourceObject *originalFHIRResource;
  uint64_t v14;
  NSArray *units;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDExtractionResultItem.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalFHIRResource"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HDExtractionResultItem;
  v11 = -[HDExtractionResultItem init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    originalFHIRResource = v11->_originalFHIRResource;
    v11->_originalFHIRResource = (HDOriginalFHIRResourceObject *)v12;

    v14 = objc_msgSend(v10, "copy");
    units = v11->_units;
    v11->_units = (NSArray *)v14;

    v11->_flags = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDExtractionResultItem *v5;
  HDExtractionResultItem *v6;
  HDOriginalFHIRResourceObject *originalFHIRResource;
  HDOriginalFHIRResourceObject *v8;
  uint64_t v9;
  HDOriginalFHIRResourceObject *v10;
  void *v11;
  BOOL v12;
  NSArray *units;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  void *v19;
  unint64_t v20;
  unint64_t flags;
  void *v23;

  v5 = (HDExtractionResultItem *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      originalFHIRResource = self->_originalFHIRResource;
      -[HDExtractionResultItem originalFHIRResource](v6, "originalFHIRResource");
      v8 = (HDOriginalFHIRResourceObject *)objc_claimAutoreleasedReturnValue();
      if (originalFHIRResource != v8)
      {
        -[HDExtractionResultItem originalFHIRResource](v6, "originalFHIRResource");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v12 = 0;
          goto LABEL_20;
        }
        v3 = (void *)v9;
        v10 = self->_originalFHIRResource;
        -[HDExtractionResultItem originalFHIRResource](v6, "originalFHIRResource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[HDOriginalFHIRResourceObject isEqual:](v10, "isEqual:", v11))
        {
          v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        v23 = v11;
      }
      units = self->_units;
      -[HDExtractionResultItem units](v6, "units");
      v14 = objc_claimAutoreleasedReturnValue();
      if (units == (NSArray *)v14)
      {
        flags = self->_flags;
        v12 = flags == -[HDExtractionResultItem flags](v6, "flags");

      }
      else
      {
        v15 = (void *)v14;
        -[HDExtractionResultItem units](v6, "units");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v18 = self->_units;
          -[HDExtractionResultItem units](v6, "units");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray isEqualToArray:](v18, "isEqualToArray:", v19))
          {
            v20 = self->_flags;
            v12 = v20 == -[HDExtractionResultItem flags](v6, "flags");

            goto LABEL_18;
          }

        }
        v12 = 0;
      }
LABEL_18:
      v11 = v23;
      if (originalFHIRResource != v8)
        goto LABEL_19;
LABEL_20:

      goto LABEL_21;
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HDOriginalFHIRResourceObject hash](self->_originalFHIRResource, "hash");
  return -[NSArray hash](self->_units, "hash") ^ v3 ^ self->_flags;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFHIRResourceObject identifier](self->_originalFHIRResource, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, FHIR resource: %@, units: %lu, raw flags: %lu>"), v5, self, v6, -[NSArray count](self->_units, "count"), self->_flags);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSArray hk_map:](self->_units, "hk_map:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDOriginalFHIRResourceObject debugDescription](self->_originalFHIRResource, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n\t"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p, FHIR resource: %@, units:\n\t%@>"), v6, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __42__HDExtractionResultItem_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "debugDescription");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExtractionResultItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDExtractionResultItem *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalFHIRResource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("units"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HDExtractionResultItem initWithOriginalFHIRResource:units:flags:](self, "initWithOriginalFHIRResource:units:flags:", v5, v7, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags")));

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  HDOriginalFHIRResourceObject *originalFHIRResource;
  id v5;

  originalFHIRResource = self->_originalFHIRResource;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalFHIRResource, CFSTR("originalFHIRResource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_units, CFSTR("units"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_flags, CFSTR("flags"));

}

- (HDOriginalFHIRResourceObject)originalFHIRResource
{
  return self->_originalFHIRResource;
}

- (NSArray)units
{
  return self->_units;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_originalFHIRResource, 0);
}

@end
