@implementation VNRecognizedPointsSpecifier

- (VNRecognizedPointsSpecifier)initWithOriginatingRequestSpecifier:(id)a3 allRecognizedPoints:(id)a4
{
  id v7;
  id v8;
  VNRecognizedPointsSpecifier *v9;
  VNRecognizedPointsSpecifier *v10;
  uint64_t v11;
  NSDictionary *allRecognizedPoints;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNRecognizedPointsSpecifier;
  v9 = -[VNRecognizedPointsSpecifier init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originatingRequestSpecifier, a3);
    v11 = objc_msgSend(v8, "copy");
    allRecognizedPoints = v10->_allRecognizedPoints;
    v10->_allRecognizedPoints = (NSDictionary *)v11;

  }
  return v10;
}

- (id)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (id)availableKeys
{
  return -[NSDictionary allKeys](self->_allRecognizedPoints, "allKeys");
}

- (id)availableGroupKeys
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)pointKeyGroupLabelsMapping
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)populatedMLMultiArrayAndReturnError:(id *)a3
{
  if (a3)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)recognizedPointsForGroupKey:(id)a3 error:(id *)a4
{
  id v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("VNIPOAll")))
  {
    v7 = self->_allRecognizedPoints;
  }
  else
  {
    -[VNRecognizedPointsSpecifier pointKeyGroupLabelsMapping](self, "pointKeyGroupLabelsMapping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v18 = v8;
      v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            -[NSDictionary objectForKeyedSubscript:](self->_allRecognizedPoints, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setValue:forKey:](v7, "setValue:forKey:", v16, v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

      v8 = v18;
    }
    else if (a4)
    {
      +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v6, CFSTR("groupKey"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)recognizedPointForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  -[NSDictionary objectForKey:](self->_allRecognizedPoints, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to locate point '%@'"), v6);
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_allRecognizedPoints, "hash") ^ __ROR8__(-[VNRequestSpecifier hash](self->_originatingRequestSpecifier, "hash"), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizedPointsSpecifier *v4;
  VNRecognizedPointsSpecifier *v5;
  VNRequestSpecifier *originatingRequestSpecifier;
  void *v7;
  NSDictionary *v8;
  char v9;

  v4 = (VNRecognizedPointsSpecifier *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      originatingRequestSpecifier = self->_originatingRequestSpecifier;
      -[VNRecognizedPointsSpecifier originatingRequestSpecifier](v5, "originatingRequestSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(originatingRequestSpecifier) = -[VNRequestSpecifier isEqual:](originatingRequestSpecifier, "isEqual:", v7);

      if ((_DWORD)originatingRequestSpecifier)
      {
        v8 = self->_allRecognizedPoints;
        v9 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  VNRequestSpecifier *originatingRequestSpecifier;
  id v5;

  originatingRequestSpecifier = self->_originatingRequestSpecifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originatingRequestSpecifier, CFSTR("Req"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allRecognizedPoints, CFSTR("AllPoints"));

}

- (VNRecognizedPointsSpecifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  VNRecognizedPointsSpecifier *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Req"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("AllPoints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    self = -[VNRecognizedPointsSpecifier initWithOriginatingRequestSpecifier:allRecognizedPoints:](self, "initWithOriginatingRequestSpecifier:allRecognizedPoints:", v5, v10);
    v11 = self;
  }
  else
  {
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("recognized points are not available"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v12);

    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allRecognizedPoints, 0);
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
