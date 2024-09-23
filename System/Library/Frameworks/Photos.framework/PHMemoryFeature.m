@implementation PHMemoryFeature

- (id)encodedDataWithPhotoLibrary:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[NSKeyedArchiver initRequiringSecureCoding:]([PHMemoryFeatureEncoder alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "setPhotoLibrary:", v4);

  objc_msgSend(v5, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)personLocalIdentifier
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *subtypeSpecificAttribute;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  id v17;

  if (self->_type != 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "stringForType:", self->_type);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("-[PHMemoryFeature personLocalIdentifier] called on non-Person PHMemoryFeature, (got: %@, %@)"), v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = v8;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Invalid class for Person PHMemoryFeature's _subtypeSpecificAttribute, expected NSString, (got: %@, %@)"), subtypeSpecificAttribute, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = v16;
LABEL_6:
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  return -[PHMemoryFeature _personLocalIdentifierFromSubtypeSpecificAttribute](self, "_personLocalIdentifierFromSubtypeSpecificAttribute");
}

- (id)_personLocalIdentifierFromSubtypeSpecificAttribute
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  int v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = self->_subtypeSpecificAttribute;
  +[PHObject uuidFromLocalIdentifier:](PHPerson, "uuidFromLocalIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PLUUIDFromLocalMercuryLocalIdentifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v10 = 138543362;
        v11 = v2;
        v8 = "Unknown UUID embedded in the person local identifier %{public}@ for memory feature.";
        goto LABEL_9;
      }
LABEL_10:

      v6 = v2;
      goto LABEL_11;
    }
  }
  PLConvertMercuryUUIDString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v10 = 138543362;
      v11 = v2;
      v8 = "UUID conversion for person local identifier %{public}@ returned nil.";
LABEL_9:
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
LABEL_11:

  return v6;
}

- (id)date
{
  void *v4;
  void *v5;
  NSObject *subtypeSpecificAttribute;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;

  if (self->_type != 16)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "stringForType:", self->_type);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Date called on non-Date PHMemoryFeature, (got type %@, %@ of class %@)"), v5, subtypeSpecificAttribute, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = self->_subtypeSpecificAttribute;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid class for Date PHMemoryFeature's _subtypeSpecificAttribute, expected NSDate, (got %@ of class %@)"), v11, v5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  return self->_subtypeSpecificAttribute;
}

- (id)dateInterval
{
  void *v4;
  void *v5;
  NSObject *subtypeSpecificAttribute;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;

  if (self->_type != 512)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "stringForType:", self->_type);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("dateInterval called on non-DateInterval PHMemoryFeature, (got type %@, %@ of class %@)"), v5, subtypeSpecificAttribute, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = self->_subtypeSpecificAttribute;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid class for DateInterval PHMemoryFeature's _subtypeSpecificAttribute, expected NSDateInterval, (got %@ of class %@)"), v11, v5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  return self->_subtypeSpecificAttribute;
}

- (id)holidayName
{
  void *v4;
  void *v5;
  NSObject *subtypeSpecificAttribute;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;

  if (self->_type != 32)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "stringForType:", self->_type);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("holidayName called on non-Holiday PHMemoryFeature, (got type %@, %@ of class %@)"), v5, subtypeSpecificAttribute, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = self->_subtypeSpecificAttribute;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid class for Holiday PHMemoryFeature's _subtypeSpecificAttribute, expected NSDate, (got %@ of class %@)"), v11, v5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  return self->_subtypeSpecificAttribute;
}

- (id)location
{
  void *v4;
  void *v5;
  NSObject *subtypeSpecificAttribute;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;

  if (self->_type != 4096)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "stringForType:", self->_type);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("location called on non-Address PHMemoryFeature, (got type %@, %@ of class %@)"), v5, subtypeSpecificAttribute, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = self->_subtypeSpecificAttribute;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid class for Address PHMemoryFeature's _subtypeSpecificAttribute, expected CLLocation, (got %@ of class %@)"), v11, v5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  return self->_subtypeSpecificAttribute;
}

- (id)areaName
{
  void *v4;
  void *v5;
  NSObject *subtypeSpecificAttribute;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;

  if (self->_type != 0x20000)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "stringForType:", self->_type);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("areaName called on non-Area PHMemoryFeature, (got type %@, %@ of class %@)"), v5, subtypeSpecificAttribute, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = self->_subtypeSpecificAttribute;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid class for Area PHMemoryFeature's _subtypeSpecificAttribute, expected CLLocation, (got %@ of class %@)"), v11, v5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v13);
  }
  return self->_subtypeSpecificAttribute;
}

- (PHMemoryFeature)initWithCoder:(id)a3
{
  id v4;
  PHMemoryFeature *v5;
  void *v6;
  uint64_t type;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *subtypeSpecificAttribute;
  PHMemoryFeature *v22;
  unint64_t v23;
  objc_super v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PHMemoryFeature;
  v5 = -[PHMemoryFeature init](&v25, sel_init);
  if (!v5)
    goto LABEL_27;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_type = objc_msgSend(v6, "unsignedIntegerValue");

  type = v5->_type;
  if (type > 511)
  {
    if (type == 512 || type == 4096 || type == 0x20000)
      goto LABEL_25;
    goto LABEL_10;
  }
  if (type != 1)
  {
    if (type == 16 || type == 32)
    {
LABEL_25:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attribute"));
      v20 = objc_claimAutoreleasedReturnValue();
      subtypeSpecificAttribute = v5->_subtypeSpecificAttribute;
      v5->_subtypeSpecificAttribute = v20;

      goto LABEL_26;
    }
LABEL_10:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      objc_msgSend((id)objc_opt_class(), "stringForType:", v5->_type);
      v8 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = type;
      v28 = 2112;
      v29 = v8;
      v9 = MEMORY[0x1E0C81028];
      v10 = "Unsupported type %lu (%@) in PHMemoryFeature";
LABEL_30:
      _os_log_fault_impl(&dword_1991EC000, v9, OS_LOG_TYPE_FAULT, v10, buf, 0x16u);
LABEL_31:

    }
LABEL_32:
    v22 = 0;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personUniversalIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[PHMemoryFeature personLocalIdentifierForPersonUniversalIdentifier:photoLibrary:](PHMemoryFeature, "personLocalIdentifierForPersonUniversalIdentifier:photoLibrary:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, v13);

      }
    }

  }
  if (!v5->_subtypeSpecificAttribute)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attribute"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v5->_subtypeSpecificAttribute;
    v5->_subtypeSpecificAttribute = v14;

  }
  -[PHMemoryFeature _personLocalIdentifierFromSubtypeSpecificAttribute](v5, "_personLocalIdentifierFromSubtypeSpecificAttribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    PLPhotoKitGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v17 = v5->_subtypeSpecificAttribute;
      v18 = v5->_type;
      objc_msgSend((id)objc_opt_class(), "stringForType:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v27 = (uint64_t)v17;
      v28 = 2048;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_FAULT, "Unable to retrieve person local identifier from %@ for type %lu (%@) in PHMemoryFeature", buf, 0x20u);

    }
    goto LABEL_31;
  }
LABEL_26:
  if (!v5->_subtypeSpecificAttribute)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v23 = v5->_type;
      objc_msgSend((id)objc_opt_class(), "stringForType:", v23);
      v8 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v27 = v23;
      v28 = 2112;
      v29 = v8;
      v9 = MEMORY[0x1E0C81028];
      v10 = "Unable to retrieve subtypeSpecificAttribute for type %lu (%@) in PHMemoryFeature";
      goto LABEL_30;
    }
    goto LABEL_32;
  }
LABEL_27:
  v22 = v5;
LABEL_33:

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("type"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_subtypeSpecificAttribute, CFSTR("attribute"));
  if (self->_type == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[PHMemoryFeature personUniversalIdentifierForPersonLocalIdentifier:photoLibrary:](PHMemoryFeature, "personUniversalIdentifierForPersonLocalIdentifier:photoLibrary:", self->_subtypeSpecificAttribute, v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("personUniversalIdentifier"));

        }
      }

    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PHMemoryFeature;
  -[PHMemoryFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringForType:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: type=%@, subtypeSpecificAttribute='%@'"), v4, v5, self->_subtypeSpecificAttribute);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  PHMemoryFeature *v4;
  PHMemoryFeature *v5;
  unint64_t type;
  NSObject *subtypeSpecificAttribute;
  NSObject *v8;
  double v9;
  char v10;

  v4 = (PHMemoryFeature *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == v5->_type)
      {
        subtypeSpecificAttribute = self->_subtypeSpecificAttribute;
        v8 = v5->_subtypeSpecificAttribute;
        if (type == 4096)
        {
          if (subtypeSpecificAttribute != v8)
          {
            -[NSObject distanceFromLocation:](subtypeSpecificAttribute, "distanceFromLocation:");
            v10 = v9 <= 2.22044605e-16;
LABEL_13:

            goto LABEL_14;
          }
        }
        else if (subtypeSpecificAttribute != v8)
        {
          v10 = -[NSObject isEqual:](subtypeSpecificAttribute, "isEqual:");
          goto LABEL_13;
        }
        v10 = 1;
        goto LABEL_13;
      }
      v10 = 0;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (BOOL)collidesWithFeature:(id)a3
{
  PHMemoryFeature *v4;
  unint64_t type;
  unint64_t v6;
  BOOL v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  double v14;
  PHMemoryFeature *v15;

  v4 = (PHMemoryFeature *)a3;
  type = v4->_type;
  v6 = self->_type;
  if (v6 != type)
  {
    if (v6 != 512 && v6 != 16)
      goto LABEL_24;
    if (type != 512 && type != 16)
      goto LABEL_24;
  }
  if (!-[PHMemoryFeature isEqual:](self, "isEqual:", v4))
  {
    v10 = self->_type;
    switch(v10)
    {
      case 0x10uLL:
        if (type == 512)
        {
          -[PHMemoryFeature date](self, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v4;
          goto LABEL_26;
        }
        if (type != 16)
          goto LABEL_24;
        break;
      case 0x1000uLL:
        -[PHMemoryFeature location](self, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHMemoryFeature location](v4, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "distanceFromLocation:", v13);
        v9 = v14 <= 100.0;

LABEL_28:
        goto LABEL_29;
      case 0x200uLL:
        if (type != 16)
        {
          if (type == 512)
          {
            -[PHMemoryFeature dateInterval](v4, "dateInterval");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[PHMemoryFeature collidesWithDateInterval:](self, "collidesWithDateInterval:", v11);
LABEL_27:
            v9 = v12;
            goto LABEL_28;
          }
LABEL_24:
          v9 = 0;
          goto LABEL_29;
        }
        break;
      default:
        goto LABEL_24;
    }
    -[PHMemoryFeature date](v4, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self;
LABEL_26:
    v12 = -[PHMemoryFeature collidesWithDate:](v15, "collidesWithDate:", v11);
    goto LABEL_27;
  }
  v9 = 1;
LABEL_29:

  return v9;
}

- (BOOL)collidesWithDate:(id)a3
{
  id v4;
  unint64_t type;
  void *v6;
  double v7;
  char v8;

  v4 = a3;
  type = self->_type;
  if (type == 512)
  {
    -[PHMemoryFeature dateInterval](self, "dateInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsDate:", v4);
  }
  else
  {
    if (type != 16)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[PHMemoryFeature date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v4);
    v8 = fabs(v7) <= 43200.0;
  }

LABEL_7:
  return v8;
}

- (BOOL)collidesWithDateInterval:(id)a3
{
  id v4;
  unint64_t type;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  type = self->_type;
  if (type == 512)
  {
    -[PHMemoryFeature dateInterval](self, "dateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "intersectsDateInterval:", v11);
  }
  else
  {
    if (type != 16)
    {
      v13 = 0;
      goto LABEL_7;
    }
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", -43200.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", 43200.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v8, v10);

    -[PHMemoryFeature date](self, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsDate:", v12);

  }
LABEL_7:

  return v13;
}

- (BOOL)collidesWithHolidayWithName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (self->_type != 32)
    return 0;
  v4 = a3;
  -[PHMemoryFeature holidayName](self, "holidayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)collidesWithLocationAtCoordinates:(CLLocationCoordinate2D)a3
{
  void *v3;
  double v4;

  if (self->_type != 4096)
    return 0;
  -[PHMemoryFeature location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinate");

  CLLocationCoordinate2DGetDistanceFrom();
  return v4 <= 100.0;
}

- (BOOL)collidesWithAreaWithName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (self->_type != 0x20000)
    return 0;
  v4 = a3;
  -[PHMemoryFeature areaName](self, "areaName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)collidesWithPersonWithLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (self->_type != 1)
    return 0;
  v4 = a3;
  -[PHMemoryFeature personLocalIdentifier](self, "personLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtypeSpecificAttribute, 0);
}

+ (id)peopleMemoryFeatureWithPersonLocalIdentifier:(id)a3
{
  id v4;
  PHMemoryFeature *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(PHMemoryFeature);
    v5->_type = 1;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature peopleMemoryFeatureWithPersonLocalIdentifier:] Failed to generate feature with invalid personLocalIdentifier %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)timeMemoryFeatureWithDate:(id)a3
{
  id v4;
  PHMemoryFeature *v5;
  NSObject *v6;
  uint8_t v8[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(PHMemoryFeature);
    v5->_type = 16;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature timeMemoryFeatureWithDate:] Failed to generate feature with nil date.", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)timeMemoryFeatureWithDateInterval:(id)a3
{
  id v4;
  PHMemoryFeature *v5;
  NSObject *v6;
  uint8_t v8[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(PHMemoryFeature);
    v5->_type = 512;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature timeMemoryFeatureWithDateInterval:] Failed to generate feature with nil dateInterval.", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)timeMemoryFeatureWithHolidayForName:(id)a3
{
  id v4;
  PHMemoryFeature *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(PHMemoryFeature);
    v5->_type = 32;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature timeMemoryFeatureWithHolidayForName:] Failed to generate feature with invalid holidayName %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)locationMemoryFeatureWithLocation:(id)a3
{
  id v4;
  void *v5;
  PHMemoryFeature *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;
  CLLocationCoordinate2D v12;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "coordinate"), CLLocationCoordinate2DIsValid(v12)))
  {
    v6 = objc_alloc_init(PHMemoryFeature);
    v6->_type = 4096;
    objc_storeStrong((id *)&v6->_subtypeSpecificAttribute, a3);
  }
  else
  {
    PLPhotoKitGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature locationMemoryFeatureWithLocation:] Failed to generate feature with invalid location %{public}@.", (uint8_t *)&v9, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)locationMemoryFeatureWithAreaForName:(id)a3
{
  id v4;
  PHMemoryFeature *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(PHMemoryFeature);
    v5->_type = 0x20000;
    objc_storeStrong((id *)&v5->_subtypeSpecificAttribute, a3);
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_FAULT, "+[PHMemoryFeature locationMemoryFeatureWithAreaForName:] Failed to generate feature with invalid areaName %{public}@.", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (id)memoryFeatureWithData:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v11 = 0;
  v7 = (void *)-[PHMemoryFeatureDecoder initForReadingFromData:error:]([PHMemoryFeatureDecoder alloc], "initForReadingFromData:error:", v6, &v11);

  v8 = v11;
  if (v7)
  {
    objc_msgSend(v7, "setPhotoLibrary:", v5);
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Couldn't unarchive memory feature: error %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)encodedBlockableFeatures:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "encodedDataWithPhotoLibrary:", v6, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringForType:(unint64_t)a3
{
  int v3;
  __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (!a3)
  {
    v4 = CFSTR("None");
    return v4;
  }
  v3 = a3;
  if (a3 != -1)
  {
    if ((~(_DWORD)a3 & 3) != 0)
    {
      if ((a3 & 1) != 0)
      {
        if ((a3 & 2) != 0)
        {
          objc_msgSend(CFSTR("Person"), "stringByAppendingString:", CFSTR("+SocialGroup"));
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = CFSTR("Person");
        }
      }
      else
      {
        if ((a3 & 2) == 0)
        {
          if ((~(_DWORD)a3 & 0x3F0) == 0)
          {
LABEL_13:
            v4 = CFSTR("Time");
LABEL_63:
            if ((~v3 & 0x7F000) == 0)
            {
              if (v4)
              {
                v12 = CFSTR("+Location");
LABEL_94:
                -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v12);
                v19 = objc_claimAutoreleasedReturnValue();

                v4 = (__CFString *)v19;
                goto LABEL_95;
              }
              goto LABEL_72;
            }
            if ((v3 & 0x1000) == 0)
            {
LABEL_69:
              if ((v3 & 0x2000) == 0)
              {
LABEL_75:
                if ((v3 & 0x4000) == 0)
                  goto LABEL_78;
                if (v4)
                {
                  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+County"));
                  v15 = objc_claimAutoreleasedReturnValue();

                  v4 = (__CFString *)v15;
LABEL_78:
                  if ((v3 & 0x8000) == 0)
                  {
LABEL_83:
                    if ((v3 & 0x10000) == 0)
                      goto LABEL_86;
                    if (v4)
                    {
                      -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Country"));
                      v17 = objc_claimAutoreleasedReturnValue();

                      v4 = (__CFString *)v17;
LABEL_86:
                      if ((v3 & 0x40000) == 0)
                      {
LABEL_91:
                        if ((v3 & 0x20000) == 0)
                          goto LABEL_95;
                        if (v4)
                        {
                          v12 = CFSTR("+Area");
                          goto LABEL_94;
                        }
LABEL_105:
                        v4 = CFSTR("Area");
                        goto LABEL_95;
                      }
                      if (!v4)
                      {
LABEL_88:
                        v4 = CFSTR("HomeWork");
                        goto LABEL_91;
                      }
LABEL_90:
                      -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+HomeWork"));
                      v18 = objc_claimAutoreleasedReturnValue();

                      v4 = (__CFString *)v18;
                      goto LABEL_91;
                    }
LABEL_89:
                    v4 = CFSTR("Country");
                    if ((v3 & 0x40000) == 0)
                      goto LABEL_91;
                    goto LABEL_90;
                  }
                  if (!v4)
                  {
LABEL_80:
                    v4 = CFSTR("State");
                    goto LABEL_83;
                  }
LABEL_82:
                  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+State"));
                  v16 = objc_claimAutoreleasedReturnValue();

                  v4 = (__CFString *)v16;
                  goto LABEL_83;
                }
LABEL_81:
                v4 = CFSTR("County");
                if ((v3 & 0x8000) == 0)
                  goto LABEL_83;
                goto LABEL_82;
              }
              if (!v4)
              {
LABEL_71:
                v4 = CFSTR("City");
                goto LABEL_75;
              }
LABEL_74:
              -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+City"));
              v14 = objc_claimAutoreleasedReturnValue();

              v4 = (__CFString *)v14;
              goto LABEL_75;
            }
            if (v4)
            {
              -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Address"));
              v13 = objc_claimAutoreleasedReturnValue();

              v4 = (__CFString *)v13;
              goto LABEL_69;
            }
LABEL_73:
            v4 = CFSTR("Address");
            if ((v3 & 0x2000) == 0)
              goto LABEL_75;
            goto LABEL_74;
          }
          if ((a3 & 0x10) == 0)
          {
            if ((a3 & 0x200) == 0)
            {
              if ((a3 & 0x20) == 0)
              {
                if ((a3 & 0x40) == 0)
                {
                  if ((a3 & 0x80) == 0)
                  {
                    if ((a3 & 0x100) == 0)
                    {
                      if ((~(_DWORD)a3 & 0x7F000) == 0)
                      {
LABEL_72:
                        v4 = CFSTR("Location");
LABEL_95:
                        if ((~v3 & 0x3000000) == 0)
                        {
                          if (v4)
                          {
                            v20 = CFSTR("+Place");
LABEL_108:
                            -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v20);
                            v22 = objc_claimAutoreleasedReturnValue();

                            v4 = (__CFString *)v22;
                            goto LABEL_109;
                          }
                          goto LABEL_104;
                        }
                        if ((v3 & 0x1000000) == 0)
                        {
LABEL_101:
                          if ((v3 & 0x2000000) == 0)
                          {
LABEL_109:
                            if ((v3 & 0x10000000) == 0)
                            {
LABEL_112:
                              if ((v3 & 0x40000000) == 0)
                                goto LABEL_117;
                              if (!v4)
                                goto LABEL_114;
LABEL_116:
                              -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Meaning"));
                              v24 = objc_claimAutoreleasedReturnValue();

                              v4 = (__CFString *)v24;
LABEL_117:
                              if (v4)
                                return v4;
                              goto LABEL_118;
                            }
                            if (v4)
                            {
                              -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Scene"));
                              v23 = objc_claimAutoreleasedReturnValue();

                              v4 = (__CFString *)v23;
                              goto LABEL_112;
                            }
LABEL_115:
                            v4 = CFSTR("Scene");
                            if ((v3 & 0x40000000) == 0)
                              return v4;
                            goto LABEL_116;
                          }
                          if (!v4)
                          {
LABEL_103:
                            v4 = CFSTR("ROI");
                            goto LABEL_109;
                          }
LABEL_107:
                          v20 = CFSTR("+ROI");
                          goto LABEL_108;
                        }
                        if (v4)
                        {
                          -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+POI"));
                          v21 = objc_claimAutoreleasedReturnValue();

                          v4 = (__CFString *)v21;
                          goto LABEL_101;
                        }
LABEL_106:
                        v4 = CFSTR("POI");
                        if ((v3 & 0x2000000) == 0)
                          goto LABEL_109;
                        goto LABEL_107;
                      }
                      if ((a3 & 0x1000) == 0)
                      {
                        if ((a3 & 0x2000) == 0)
                        {
                          if ((a3 & 0x4000) == 0)
                          {
                            if ((a3 & 0x8000) == 0)
                            {
                              if ((a3 & 0x10000) == 0)
                              {
                                if ((a3 & 0x40000) == 0)
                                {
                                  if ((a3 & 0x20000) == 0)
                                  {
                                    if ((~(_DWORD)a3 & 0x3000000) == 0)
                                    {
LABEL_104:
                                      v4 = CFSTR("Place");
                                      goto LABEL_109;
                                    }
                                    if ((a3 & 0x1000000) == 0)
                                    {
                                      if ((a3 & 0x2000000) == 0)
                                      {
                                        if ((a3 & 0x10000000) == 0)
                                        {
                                          if ((a3 & 0x40000000) != 0)
                                          {
LABEL_114:
                                            v4 = CFSTR("Meaning");
                                            return v4;
                                          }
LABEL_118:
                                          v4 = CFSTR("Unknown");
                                          return v4;
                                        }
                                        goto LABEL_115;
                                      }
                                      goto LABEL_103;
                                    }
                                    goto LABEL_106;
                                  }
                                  goto LABEL_105;
                                }
                                goto LABEL_88;
                              }
                              goto LABEL_89;
                            }
                            goto LABEL_80;
                          }
                          goto LABEL_81;
                        }
                        goto LABEL_71;
                      }
                      goto LABEL_73;
                    }
                    goto LABEL_59;
                  }
                  goto LABEL_60;
                }
                goto LABEL_51;
              }
              goto LABEL_52;
            }
            goto LABEL_19;
          }
          goto LABEL_44;
        }
        v4 = CFSTR("SocialGroup");
      }
    }
    else
    {
      v4 = CFSTR("People");
    }
    if ((~v3 & 0x3F0) == 0)
    {
      if (v4)
      {
        v5 = CFSTR("+Time");
LABEL_62:
        -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v5);
        v11 = objc_claimAutoreleasedReturnValue();

        v4 = (__CFString *)v11;
        goto LABEL_63;
      }
      goto LABEL_13;
    }
    if ((v3 & 0x10) == 0)
    {
LABEL_17:
      if ((v3 & 0x200) == 0)
      {
LABEL_46:
        if ((v3 & 0x20) == 0)
          goto LABEL_49;
        if (v4)
        {
          -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Holiday"));
          v8 = objc_claimAutoreleasedReturnValue();

          v4 = (__CFString *)v8;
LABEL_49:
          if ((v3 & 0x40) == 0)
          {
LABEL_54:
            if ((v3 & 0x80) == 0)
              goto LABEL_57;
            if (v4)
            {
              -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Season"));
              v10 = objc_claimAutoreleasedReturnValue();

              v4 = (__CFString *)v10;
LABEL_57:
              if ((v3 & 0x100) == 0)
                goto LABEL_63;
              if (!v4)
              {
LABEL_59:
                v4 = CFSTR("Weekend");
                goto LABEL_63;
              }
LABEL_61:
              v5 = CFSTR("+Weekend");
              goto LABEL_62;
            }
LABEL_60:
            v4 = CFSTR("Season");
            if ((v3 & 0x100) == 0)
              goto LABEL_63;
            goto LABEL_61;
          }
          if (!v4)
          {
LABEL_51:
            v4 = CFSTR("Year");
            goto LABEL_54;
          }
LABEL_53:
          -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Year"));
          v9 = objc_claimAutoreleasedReturnValue();

          v4 = (__CFString *)v9;
          goto LABEL_54;
        }
LABEL_52:
        v4 = CFSTR("Holiday");
        if ((v3 & 0x40) == 0)
          goto LABEL_54;
        goto LABEL_53;
      }
      if (!v4)
      {
LABEL_19:
        v4 = CFSTR("DateInterval");
        goto LABEL_46;
      }
LABEL_45:
      -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+DateInterval"));
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v7;
      goto LABEL_46;
    }
    if (v4)
    {
      -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+Date"));
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v6;
      goto LABEL_17;
    }
LABEL_44:
    v4 = CFSTR("Date");
    if ((v3 & 0x200) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
  v4 = CFSTR("Any");
  return v4;
}

+ (id)personLocalIdentifierForPersonUniversalIdentifier:(id)a3 photoLibrary:(id)a4
{
  return +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:", a3, a4);
}

+ (id)personUniversalIdentifierForPersonLocalIdentifier:(id)a3 photoLibrary:(id)a4
{
  return +[PHObject uuidFromLocalIdentifier:](PHPerson, "uuidFromLocalIdentifier:", a3, a4);
}

@end
