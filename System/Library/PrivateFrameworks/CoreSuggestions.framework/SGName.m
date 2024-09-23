@implementation SGName

- (SGName)initWithFirstName:(id)a3 middleName:(id)a4 lastName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 recordId:(id)a9 origin:(id)a10 extractionInfo:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SGName *v24;
  uint64_t v25;
  NSString *firstName;
  uint64_t v27;
  NSString *middleName;
  uint64_t v29;
  NSString *lastName;
  uint64_t v31;
  NSString *prefix;
  uint64_t v33;
  NSString *suffix;
  uint64_t v35;
  NSString *fullName;
  void *v38;
  id v40;
  id v41;
  objc_super v42;

  v41 = a3;
  v40 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGName.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullName"));

  }
  v42.receiver = self;
  v42.super_class = (Class)SGName;
  v24 = -[SGObject initWithRecordId:origin:](&v42, sel_initWithRecordId_origin_, v21, v22);
  if (v24)
  {
    v25 = objc_msgSend(v41, "copy");
    firstName = v24->_firstName;
    v24->_firstName = (NSString *)v25;

    v27 = objc_msgSend(v40, "copy");
    middleName = v24->_middleName;
    v24->_middleName = (NSString *)v27;

    v29 = objc_msgSend(v17, "copy");
    lastName = v24->_lastName;
    v24->_lastName = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    prefix = v24->_prefix;
    v24->_prefix = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    suffix = v24->_suffix;
    v24->_suffix = (NSString *)v33;

    v35 = objc_msgSend(v18, "copy");
    fullName = v24->_fullName;
    v24->_fullName = (NSString *)v35;

    objc_storeStrong((id *)&v24->_extractionInfo, a11);
  }

  return v24;
}

- (SGName)initWithFirstName:(id)a3 middleName:(id)a4 lastName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 recordId:(id)a9 origin:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  SGName *v26;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  +[SGExtractionInfo extractionInfoWithExtractionType:modelVersion:confidence:](SGExtractionInfo, "extractionInfoWithExtractionType:modelVersion:confidence:", 0, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SGName initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:extractionInfo:](self, "initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:extractionInfo:", v24, v23, v22, v21, v20, v19, v18, v17, v25);

  return v26;
}

- (id)name
{
  return self->_fullName;
}

- (SGName)initWithCoder:(id)a3
{
  id v5;
  SGName *v6;
  void *v7;
  uint64_t v8;
  NSString *firstName;
  void *v10;
  uint64_t v11;
  NSString *middleName;
  void *v13;
  uint64_t v14;
  NSString *lastName;
  void *v16;
  void *v17;
  NSString *v18;
  void *fullName;
  void *v20;
  uint64_t v21;
  NSString *prefix;
  void *v23;
  uint64_t v24;
  NSString *suffix;
  void *v26;
  uint64_t v27;
  SGExtractionInfo *extractionInfo;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SGName;
  v6 = -[SGObject initWithCoder:](&v30, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("firstName"));
    v8 = objc_claimAutoreleasedReturnValue();
    firstName = v6->_firstName;
    v6->_firstName = (NSString *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("middleName"));
    v11 = objc_claimAutoreleasedReturnValue();
    middleName = v6->_middleName;
    v6->_middleName = (NSString *)v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("lastName"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastName = v6->_lastName;
    v6->_lastName = (NSString *)v14;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v16, CFSTR("fullName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = v17;
      fullName = v6->_fullName;
      v6->_fullName = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      fullName = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(fullName, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGName.m"), 71, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "fullName");
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v20, CFSTR("prefix"));
    v21 = objc_claimAutoreleasedReturnValue();
    prefix = v6->_prefix;
    v6->_prefix = (NSString *)v21;

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v23, CFSTR("suffix"));
    v24 = objc_claimAutoreleasedReturnValue();
    suffix = v6->_suffix;
    v6->_suffix = (NSString *)v24;

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v26, CFSTR("extractionInfo"));
    v27 = objc_claimAutoreleasedReturnValue();
    extractionInfo = v6->_extractionInfo;
    v6->_extractionInfo = (SGExtractionInfo *)v27;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGName;
  v4 = a3;
  -[SGObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_middleName, CFSTR("middleName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fullName, CFSTR("fullName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_prefix, CFSTR("prefix"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_suffix, CFSTR("suffix"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extractionInfo, CFSTR("extractionInfo"));

}

- (BOOL)isEqual:(id)a3
{
  SGName *v4;
  SGName *v5;
  BOOL v6;

  v4 = (SGName *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGName isEqualToName:](self, "isEqualToName:", v5);

  return v6;
}

- (BOOL)isEqualToName:(id)a3
{
  _QWORD *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = a3;
  if (-[SGObject isEqualToSuggestion:](self, "isEqualToSuggestion:", v4))
  {
    v5 = self->_fullName;
    v6 = v5;
    if (v5 == (NSString *)v4[3])
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_firstName, "hash");
  v4 = -[NSString hash](self->_lastName, "hash") - v3 + 32 * v3;
  return -[NSString hash](self->_fullName, "hash") - v4 + 32 * v4;
}

- (id)description
{
  id v3;
  NSString *prefix;
  __CFString *v5;
  const __CFString *firstName;
  NSString *middleName;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *lastName;
  void *v11;
  void *v12;
  NSString *fullName;
  id v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  fullName = self->_fullName;
  v15 = v3;
  prefix = self->_prefix;
  if (prefix)
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ "), self->_prefix);
  else
    v5 = &stru_1E4762D08;
  if (self->_firstName)
    firstName = (const __CFString *)self->_firstName;
  else
    firstName = &stru_1E4762D08;
  middleName = self->_middleName;
  if (middleName)
    v8 = CFSTR(" ");
  else
    v8 = &stru_1E4762D08;
  if (middleName)
    v9 = (const __CFString *)self->_middleName;
  else
    v9 = &stru_1E4762D08;
  if (self->_lastName)
    lastName = (const __CFString *)self->_lastName;
  else
    lastName = &stru_1E4762D08;
  if (!self->_suffix)
  {
    v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("<SGName[%@]: %@{%@}%@%@ {%@}%@>"), fullName, v5, firstName, v8, v9, lastName, &stru_1E4762D08);
    if (!prefix)
      return v12;
    goto LABEL_18;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ "), self->_suffix);
  v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("<SGName[%@]: %@{%@}%@%@ {%@}%@>"), fullName, v5, firstName, v8, v9, lastName, v11);

  if (prefix)
LABEL_18:

  return v12;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)nameWithFirstName:(id)a3 lastName:(id)a4 middleName:(id)a5 fullName:(id)a6 prefix:(id)a7 suffix:(id)a8 withRecordId:(id)a9 origin:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SGName *v24;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  v24 = -[SGName initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:]([SGName alloc], "initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:", v23, v21, v22, v20, v19, v18, v17, v16);

  return v24;
}

+ (id)nameWithFirstName:(id)a3 lastName:(id)a4 withRecordId:(id)a5 origin:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SGName *v13;
  void *v14;
  void *v15;
  SGName *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [SGName alloc];
  v18[0] = v12;
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_pas_componentsJoinedByString:", CFSTR(" "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SGName initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:](v13, "initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:", v12, 0, v11, v15, 0, 0, v10, v9);

  return v16;
}

+ (id)nameWithFirstName:(id)a3 withRecordId:(id)a4 origin:(id)a5
{
  id v7;
  id v8;
  id v9;
  SGName *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SGName initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:]([SGName alloc], "initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:", v9, 0, 0, v9, 0, 0, v8, v7);

  return v10;
}

@end
