@implementation MPMediaPropertyPredicate

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_property, "hash");
  return objc_msgSend(self->_value, "hash") ^ v3 ^ self->_comparisonType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_7;
  v5 = v4;
  if (!-[NSString isEqualToString:](self->_property, "isEqualToString:", v5[1])
    || self->_comparisonType != v5[3]
    || (objc_msgSend(self->_value, "isEqual:", v5[2]) & 1) == 0)
  {

LABEL_7:
    v8.receiver = self;
    v8.super_class = (Class)MPMediaPropertyPredicate;
    v6 = -[MPMediaPropertyPredicate isEqual:](&v8, sel_isEqual_, v4);
    goto LABEL_8;
  }

  v6 = 1;
LABEL_8:

  return v6;
}

- (id)ML3PredicateForContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D51230];
  -[MPMediaPropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForMPMediaEntityProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPMediaPropertyPredicate _ML3PredicateForML3EntityProperty:](self, "_ML3PredicateForML3EntityProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ML3PredicateForTrack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D512C8];
  -[MPMediaPropertyPredicate property](self, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForMPMediaEntityProperty:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPMediaPropertyPredicate _ML3PredicateForML3EntityProperty:](self, "_ML3PredicateForML3EntityProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)property
{
  return self->_property;
}

- (id)_ML3PredicateForML3EntityProperty:(id)a3
{
  id v4;
  MPMediaPredicateComparison v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  MPMediaPredicateComparison v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[MPMediaPropertyPredicate comparisonType](self, "comparisonType");
    -[MPMediaPropertyPredicate value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D50938]))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MLMediaTypeForMPMediaType(objc_msgSend(v6, "unsignedIntegerValue")));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", v4, v7, 10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:equalToInt64:", v4, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D511E0];
        v35[0] = v8;
        v35[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "predicateMatchingPredicates:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
LABEL_37:

        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke;
        v31[3] = &unk_1E31583B8;
        v14 = v13;
        v32 = v14;
        objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
        v15 = v14;

        v5 = 108;
        v6 = v15;
      }
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D50F30]))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", MLMediaTypeForMPMediaType(objc_msgSend(v6, "unsignedIntegerValue")));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:", v4, v7, 10);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v12 = (void *)v16;
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = MEMORY[0x1E0C809B0];
        v27 = 3221225472;
        v28 = __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke_2;
        v29 = &unk_1E31583B8;
        v18 = v17;
        v30 = v18;
        objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v26);
        v19 = v18;

        v6 = v19;
LABEL_17:
        objc_msgSend(MEMORY[0x1E0D51248], "predicateWithProperty:values:", v4, v6, v26, v27, v28, v29);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_36:
        v12 = (void *)v22;
        goto LABEL_37;
      }
    }
    switch(v5)
    {
      case 'd':
        v20 = 0;
        v21 = 2;
        goto LABEL_35;
      case 'e':
        v20 = 0;
        v21 = 3;
        goto LABEL_35;
      case 'f':
        v20 = 0;
        v21 = 4;
        goto LABEL_35;
      case 'g':
        v20 = 0;
        v21 = 5;
        goto LABEL_35;
      case 'h':
        v20 = 0;
        v21 = 6;
        goto LABEL_35;
      case 'i':
        v20 = 1;
        v21 = 8;
        goto LABEL_35;
      case 'j':
        v20 = 1;
        v21 = 9;
        goto LABEL_35;
      case 'k':
        v20 = 0;
        v21 = 10;
        goto LABEL_35;
      case 'l':
        goto LABEL_17;
      case 'm':
        if (v6 && objc_msgSend(v6, "BOOLValue"))
        {
          objc_msgSend(MEMORY[0x1E0D51298], "predicateWithProperty:", v4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        v25 = (void *)MEMORY[0x1E0D51280];
        objc_msgSend(MEMORY[0x1E0D51298], "predicateWithProperty:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "predicateWithPredicate:", v7);
        v16 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        if (v5)
        {
          if (v5 == MPMediaPredicateComparisonContains)
          {
            v20 = 1;
            v21 = 7;
          }
          else
          {
            v23 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              v34 = v5;
              _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_ERROR, "Unknown comparison type %ld.", buf, 0xCu);
            }

            v21 = 0;
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
          v21 = 1;
        }
LABEL_35:
        objc_msgSend(MEMORY[0x1E0D51218], "predicateWithProperty:value:comparison:caseInsensitive:", v4, v6, v21, v20);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_38:

  return v12;
}

- (id)value
{
  return self->_value;
}

- (MPMediaPredicateComparison)comparisonType
{
  return self->_comparisonType;
}

+ (MPMediaPropertyPredicate)predicateWithValue:(id)value forProperty:(NSString *)property comparisonType:(MPMediaPredicateComparison)comparisonType
{
  id v7;
  NSString *v8;
  MPMediaPropertyPredicate *v9;

  v7 = value;
  v8 = property;
  if (+[MPMediaItem canFilterByProperty:](MPMediaItem, "canFilterByProperty:", v8)
    || +[MPMediaPlaylist canFilterByProperty:](MPMediaPlaylist, "canFilterByProperty:", v8))
  {
    v9 = objc_alloc_init(MPMediaPropertyPredicate);
    -[MPMediaPropertyPredicate setProperty:](v9, "setProperty:", v8);
    -[MPMediaPropertyPredicate setValue:](v9, "setValue:", v7);
    -[MPMediaPropertyPredicate setComparisonType:](v9, "setComparisonType:", comparisonType);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("MPMediaPropertyPredicate cannot filter using the %@ property."), v8);
    v9 = 0;
  }

  return v9;
}

- (void)setProperty:(id)a3
{
  NSString *v4;
  NSString *property;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  property = self->_property;
  self->_property = v4;

}

- (void)setValue:(id)a3
{
  void *v4;
  id value;

  v4 = (void *)objc_msgSend(a3, "copy");
  value = self->_value;
  self->_value = v4;

}

- (void)setComparisonType:(int64_t)a3
{
  self->_comparisonType = a3;
}

+ (MPMediaPropertyPredicate)predicateWithValue:(id)value forProperty:(NSString *)property
{
  return (MPMediaPropertyPredicate *)objc_msgSend(a1, "predicateWithValue:forProperty:comparisonType:", value, property, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPMediaPropertyPredicate)initWithCoder:(id)a3
{
  id v4;
  MPMediaPropertyPredicate *v5;
  uint64_t v6;
  NSString *property;
  uint64_t v8;
  id value;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaPropertyPredicate;
  v5 = -[MPMediaPropertyPredicate init](&v15, sel_init);
  if (v5)
  {
    if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPProperty"));
      v6 = objc_claimAutoreleasedReturnValue();
      property = v5->_property;
      v5->_property = (NSString *)v6;

      objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("MPValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      value = v5->_value;
      v5->_value = (id)v8;

      v5->_comparisonType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPComparisonType"));
    }
    else
    {
      objc_msgSend(v4, "decodeObject");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_property;
      v5->_property = (NSString *)v10;

      objc_msgSend(v4, "decodeObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_value;
      v5->_value = (id)v12;

      objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "q", &v5->_comparisonType, 8);
    }
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  int64_t comparisonType;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  -[MPMediaPropertyPredicate descriptionOfValue:forProperty:](self, "descriptionOfValue:forProperty:", self->_value, self->_property);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  comparisonType = self->_comparisonType;
  switch(comparisonType)
  {
    case 'd':
      v5 = CFSTR("not equal to");
      break;
    case 'e':
      v5 = CFSTR("greater than");
      break;
    case 'f':
      v5 = CFSTR("greater than or equal");
      break;
    case 'g':
      v5 = CFSTR("less than");
      break;
    case 'h':
      v5 = CFSTR("less than or equal");
      break;
    case 'i':
      v5 = CFSTR("starts with");
      break;
    case 'j':
      v5 = CFSTR("ends with");
      break;
    case 'k':
      v5 = CFSTR("bit test");
      break;
    case 'l':
      v5 = CFSTR("in");
      break;
    case 'm':
      v5 = CFSTR("has");
      break;
    default:
      v6 = CFSTR("equal to");
      if (comparisonType)
        v6 = 0;
      if (comparisonType == 1)
        v5 = CFSTR("contains");
      else
        v5 = v6;
      break;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> '%@' %@ %@"), objc_opt_class(), self, self->_property, v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)descriptionOfValue:(id)a3 forProperty:(id)a4
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
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("mediaType")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      _NSStringFromMPMediaType(objc_msgSend(v5, "integerValue"), CFSTR(" | "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("'%@' %@"), v5, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("'%@'"), v5);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          _NSStringFromMPMediaType(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "integerValue"), CFSTR(" | "));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR(" %@"), v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  if (objc_msgSend(v6, "hasSuffix:", CFSTR("PID"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v5);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *property;
  id v5;

  property = self->_property;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", property, CFSTR("MPProperty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("MPValue"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_comparisonType, CFSTR("MPComparisonType"));

}

- (MPMediaPropertyPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  MPMediaPropertyPredicate *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *property;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id value;
  NSObject *v26;
  id v27;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaQuery.m"), 1391, CFSTR("Cannot decode object of type %@"), objc_opt_class());

  }
  v30.receiver = self;
  v30.super_class = (Class)MPMediaPropertyPredicate;
  v9 = -[MPMediaPropertyPredicate init](&v30, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "propertyPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "property");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    property = v9->_property;
    v9->_property = (NSString *)v12;

    v14 = objc_msgSend(v10, "comparisonType");
    switch(v14)
    {
      case 'd':
        v15 = 100;
        break;
      case 'e':
        v15 = 101;
        break;
      case 'f':
        v15 = 102;
        break;
      case 'g':
        v15 = 103;
        break;
      case 'h':
        v15 = 104;
        break;
      case 'i':
        v15 = 105;
        break;
      case 'j':
        v15 = 106;
        break;
      case 'k':
        v15 = 107;
        break;
      default:
        v15 = v14 == 2;
        break;
    }
    v9->_comparisonType = v15;
    if (_MPMediaItemPropertyIsPersistentIDProperty(v9->_property))
    {
      if (v8)
      {
        v16 = v8;
      }
      else
      {
        +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;
      objc_msgSend(v10, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      MPPCreateFoundationObjectFromPredicateValue(v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D511C0]), "initWithData:", v19);
      objc_msgSend(v17, "entityWithMultiverseIdentifier:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v32 = v21;
        v33 = 2114;
        v34 = v17;
        v35 = 2114;
        v36 = v22;
        _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "RPQ: -[MPMediaQuery initWithProtobufferDecodableObject:library:] resolving PID predicate multiverseID=%{public}@ library=%{public}@ entity=%{public}@", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "persistentID"));
      v24 = objc_claimAutoreleasedReturnValue();
      value = v9->_value;
      v9->_value = (id)v24;

      v26 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v9->_value;
        *(_DWORD *)buf = 138543362;
        v32 = v27;
        _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "RPQ: -[MPMediaQuery initWithProtobufferDecodableObject:library:] resolving PID predicate value=%{public}@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v10, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      MPPCreateFoundationObjectFromPredicateValue(v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v9->_value;
      v9->_value = (id)v18;
    }

  }
  return v9;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  id v4;
  MPPPropertyPredicate *v5;
  int64_t comparisonType;
  uint64_t v7;
  unsigned int v8;
  int IsPersistentIDProperty;
  id value;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  int v23;
  NSString *property;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  MPPMediaPredicate *v34;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[8];
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MPPPropertyPredicate);
  -[MPPPropertyPredicate setProperty:](v5, "setProperty:", self->_property);
  comparisonType = self->_comparisonType;
  switch(comparisonType)
  {
    case 'd':
      v7 = 100;
      break;
    case 'e':
      v7 = 101;
      break;
    case 'f':
      v7 = 102;
      break;
    case 'g':
      v7 = 103;
      break;
    case 'h':
      v7 = 104;
      break;
    case 'i':
      v7 = 105;
      break;
    case 'j':
      v7 = 106;
      break;
    case 'k':
      v7 = 107;
      break;
    default:
      if (comparisonType == 1)
        v8 = 2;
      else
        v8 = 0;
      if (comparisonType)
        v7 = v8;
      else
        v7 = 1;
      break;
  }
  -[MPPPropertyPredicate setComparisonType:](v5, "setComparisonType:", v7);
  IsPersistentIDProperty = _MPMediaItemPropertyIsPersistentIDProperty(self->_property);
  value = self->_value;
  if (IsPersistentIDProperty)
  {
    v36 = objc_msgSend(value, "longLongValue");
    v37 = v4;
    if (v4)
    {
      v11 = v4;
    }
    else
    {
      +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v11;
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = self->_property;
    objc_msgSend(v20, "setWithObjects:", CFSTR("albumPID"), CFSTR("artistPID"), CFSTR("albumArtistPID"), CFSTR("genrePID"), CFSTR("composerPID"), CFSTR("podcastPID"), CFSTR("playlistPersistentID"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", v21);

    if (v23)
    {
      property = self->_property;
      v43[0] = CFSTR("persistentID");
      v43[1] = CFSTR("albumPID");
      v44[0] = &unk_1E31E48D0;
      v44[1] = &unk_1E31E48E8;
      v43[2] = CFSTR("artistPID");
      v43[3] = CFSTR("albumArtistPID");
      v44[2] = &unk_1E31E4900;
      v44[3] = &unk_1E31E4918;
      v43[4] = CFSTR("genrePID");
      v43[5] = CFSTR("composerPID");
      v44[4] = &unk_1E31E4930;
      v44[5] = &unk_1E31E4948;
      v43[6] = CFSTR("podcastPID");
      v43[7] = CFSTR("playlistPersistentID");
      v44[6] = &unk_1E31E4960;
      v44[7] = &unk_1E31E4978;
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = property;
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v44, v43, 8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "integerValue");
      objc_msgSend(v19, "multiverseIdentifierForCollectionWithPersistentID:groupingType:", v36, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v19, "multiverseIdentifierForTrackWithPersistentID:", v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v30;
    v4 = v37;
    if (v30)
    {
      objc_msgSend(v30, "data");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MPPCreatePredicateValueFromFoundationObject(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPPPropertyPredicate setValue:](v5, "setValue:", v32);

    }
  }
  else
  {
    v12 = value;
    if (-[NSString isEqualToString:](self->_property, "isEqualToString:", CFSTR("mediaType")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = self->_value;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v14)
        {
          v15 = v14;
          v16 = 0;
          v17 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v39 != v17)
                objc_enumerationMutation(v13);
              v16 |= objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "longLongValue");
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v15);
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v16);
        v33 = objc_claimAutoreleasedReturnValue();

        -[MPPPropertyPredicate setComparisonType:](v5, "setComparisonType:", 107);
        v12 = (id)v33;
      }
    }
    MPPCreatePredicateValueFromFoundationObject(v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPPPropertyPredicate setValue:](v5, "setValue:", v19);
  }

  v34 = objc_alloc_init(MPPMediaPredicate);
  -[MPPMediaPredicate setType:](v34, "setType:", 1);
  -[MPPMediaPredicate setPropertyPredicate:](v34, "setPropertyPredicate:", v5);

  return v34;
}

void __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", MLMediaTypeForMPMediaType(objc_msgSend(a2, "unsignedIntegerValue")));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", MLMediaTypeForMPMediaType(objc_msgSend(a2, "unsignedIntegerValue")));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
