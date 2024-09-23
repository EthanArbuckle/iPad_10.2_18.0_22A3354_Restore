@implementation CTLazuliSuggestedActionShowLocation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSuggestedActionShowLocation coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", coordinates = %@"), v4);

  -[CTLazuliSuggestedActionShowLocation query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", query = %@"), v5);

  -[CTLazuliSuggestedActionShowLocation label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", label = %@"), v6);

  -[CTLazuliSuggestedActionShowLocation fallbackUrl](self, "fallbackUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fallbackUrl = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionShowLocation:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;

  v6 = a3;
  -[CTLazuliSuggestedActionShowLocation coordinates](self, "coordinates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_msgSend(v6, "coordinates"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSuggestedActionShowLocation coordinates](self, "coordinates");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToCTLazuliSuggestedActionShowCoordinates:", v4) & 1) == 0)
    {

      v8 = 0;
      goto LABEL_36;
    }
    v25 = 1;
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  -[CTLazuliSuggestedActionShowLocation query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v6, "query"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSuggestedActionShowLocation query](self, "query");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "query");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToCTLazuliSuggestedActionShowQuery:") & 1) == 0)
    {

      if (v9)
      else

      v8 = 0;
      if ((v25 & 1) == 0)
        goto LABEL_36;
      goto LABEL_35;
    }
    v21 = 1;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  -[CTLazuliSuggestedActionShowLocation label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v6, "label"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSuggestedActionShowLocation label](self, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "isEqualToString:"))
    {
      v8 = 0;
      goto LABEL_27;
    }
    v18 = 1;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  -[CTLazuliSuggestedActionShowLocation fallbackUrl](self, "fallbackUrl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v6, "fallbackUrl"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSuggestedActionShowLocation fallbackUrl](self, "fallbackUrl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fallbackUrl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v11)
    {

      if (!v18)
        goto LABEL_28;
      goto LABEL_27;
    }
    v15 = (void *)v16;
  }
  else
  {
    v15 = 0;
    v8 = 1;
  }

  if ((v18 & 1) != 0)
  {
LABEL_27:

  }
LABEL_28:
  if (!v10)

  if (v21)
  {

  }
  if (!v9)

  if (v25)
  {
LABEL_35:

  }
LABEL_36:
  if (!v7)

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSuggestedActionShowLocation *v4;
  CTLazuliSuggestedActionShowLocation *v5;
  BOOL v6;

  v4 = (CTLazuliSuggestedActionShowLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSuggestedActionShowLocation isEqualToCTLazuliSuggestedActionShowLocation:](self, "isEqualToCTLazuliSuggestedActionShowLocation:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSuggestedActionShowLocation *v4;

  v4 = +[CTLazuliSuggestedActionShowLocation allocWithZone:](CTLazuliSuggestedActionShowLocation, "allocWithZone:", a3);
  -[CTLazuliSuggestedActionShowLocation setCoordinates:](v4, "setCoordinates:", self->_coordinates);
  -[CTLazuliSuggestedActionShowLocation setQuery:](v4, "setQuery:", self->_query);
  -[CTLazuliSuggestedActionShowLocation setLabel:](v4, "setLabel:", self->_label);
  -[CTLazuliSuggestedActionShowLocation setFallbackUrl:](v4, "setFallbackUrl:", self->_fallbackUrl);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_coordinates, CFSTR("kCoordinatesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, CFSTR("kQueryKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("kLabelKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackUrl, CFSTR("kFallbackUrlKey"));

}

- (CTLazuliSuggestedActionShowLocation)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSuggestedActionShowLocation *v5;
  uint64_t v6;
  CTLazuliSuggestedActionShowCoordinates *coordinates;
  uint64_t v8;
  CTLazuliSuggestedActionShowQuery *query;
  uint64_t v10;
  NSString *label;
  uint64_t v12;
  NSString *fallbackUrl;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliSuggestedActionShowLocation;
  v5 = -[CTLazuliSuggestedActionShowLocation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoordinatesKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    coordinates = v5->_coordinates;
    v5->_coordinates = (CTLazuliSuggestedActionShowCoordinates *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kQueryKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (CTLazuliSuggestedActionShowQuery *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLabelKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFallbackUrlKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    fallbackUrl = v5->_fallbackUrl;
    v5->_fallbackUrl = (NSString *)v12;

  }
  return v5;
}

- (CTLazuliSuggestedActionShowLocation)initWithReflection:(const void *)a3
{
  CTLazuliSuggestedActionShowLocation *v4;
  CTLazuliSuggestedActionShowLocation *v5;
  CTLazuliSuggestedActionShowCoordinates *v6;
  uint64_t v7;
  CTLazuliSuggestedActionShowCoordinates *coordinates;
  CTLazuliSuggestedActionShowQuery *v9;
  uint64_t v10;
  CTLazuliSuggestedActionShowQuery *query;
  char *v12;
  uint64_t v13;
  NSString *label;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  NSString *fallbackUrl;
  CTLazuliSuggestedActionShowLocation *result;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CTLazuliSuggestedActionShowLocation;
  v4 = -[CTLazuliSuggestedActionShowLocation init](&v22, sel_init);
  v5 = v4;
  if (!v4)
    return v5;
  if (*((_BYTE *)a3 + 16))
  {
    v6 = [CTLazuliSuggestedActionShowCoordinates alloc];
    if (!*((_BYTE *)a3 + 16))
      goto LABEL_24;
    v7 = -[CTLazuliSuggestedActionShowCoordinates initWithReflection:](v6, "initWithReflection:", a3);
    coordinates = v5->_coordinates;
    v5->_coordinates = (CTLazuliSuggestedActionShowCoordinates *)v7;
  }
  else
  {
    coordinates = v4->_coordinates;
    v4->_coordinates = 0;
  }

  if (!*((_BYTE *)a3 + 56))
  {
    query = v5->_query;
    v5->_query = 0;
    goto LABEL_10;
  }
  v9 = [CTLazuliSuggestedActionShowQuery alloc];
  if (*((_BYTE *)a3 + 56))
  {
    v10 = -[CTLazuliSuggestedActionShowQuery initWithReflection:](v9, "initWithReflection:", (char *)a3 + 24);
    query = v5->_query;
    v5->_query = (CTLazuliSuggestedActionShowQuery *)v10;
LABEL_10:

    if (*((_BYTE *)a3 + 88))
    {
      if (*((char *)a3 + 87) >= 0)
        v12 = (char *)a3 + 64;
      else
        v12 = (char *)*((_QWORD *)a3 + 8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      label = v5->_label;
      v5->_label = (NSString *)v13;
    }
    else
    {
      label = v5->_label;
      v5->_label = 0;
    }

    if (*((_BYTE *)a3 + 120))
    {
      v17 = (char *)*((_QWORD *)a3 + 12);
      v16 = (char *)a3 + 96;
      v15 = v17;
      if (v16[23] >= 0)
        v18 = v16;
      else
        v18 = v15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      fallbackUrl = v5->_fallbackUrl;
      v5->_fallbackUrl = (NSString *)v19;
    }
    else
    {
      fallbackUrl = v5->_fallbackUrl;
      v5->_fallbackUrl = 0;
    }

    return v5;
  }
LABEL_24:
  result = (CTLazuliSuggestedActionShowLocation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliSuggestedActionShowCoordinates)coordinates
{
  return self->_coordinates;
}

- (void)setCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_coordinates, a3);
}

- (CTLazuliSuggestedActionShowQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)fallbackUrl
{
  return self->_fallbackUrl;
}

- (void)setFallbackUrl:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_coordinates, 0);
}

@end
