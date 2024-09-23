@implementation ATXPosterDescriptor

- (ATXPosterDescriptor)initWithIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 galleryOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXPosterDescriptor *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *extensionBundleIdentifier;
  uint64_t v19;
  NSString *containerBundleIdentifier;
  ATXPosterDescriptorGalleryOptions *v21;
  ATXPosterDescriptorGalleryOptions *galleryOptions;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXPosterDescriptor;
  v14 = -[ATXPosterDescriptor init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    extensionBundleIdentifier = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v19;

    if (v13)
      v21 = (ATXPosterDescriptorGalleryOptions *)v13;
    else
      v21 = (ATXPosterDescriptorGalleryOptions *)objc_opt_new();
    galleryOptions = v14->_galleryOptions;
    v14->_galleryOptions = v21;

  }
  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@; "), v5);

  -[ATXPosterDescriptor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: %@; "), v6);

  -[ATXPosterDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("extensionBundleIdentifier: %@; "), v7);

  -[ATXPosterDescriptor containerBundleIdentifier](self, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("containerBundleIdentifier: %@; "), v8);

  -[ATXPosterDescriptor galleryOptions](self, "galleryOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("galleryOptions: %@; "), v9);

  -[ATXPosterDescriptor score](self, "score");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("score: %@; "), v10);

  return v3;
}

- (NSString)coreIdentifier
{
  NSString *coreIdentifier;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  coreIdentifier = self->_coreIdentifier;
  if (!coreIdentifier)
  {
    -[ATXPosterDescriptor identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19[0] = CFSTR(".STATIC");
    v19[1] = CFSTR(".DYNAMIC");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(v4, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), 14);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v10, v11, &stru_1E4D5DB30);
            v12 = objc_claimAutoreleasedReturnValue();

            v4 = (void *)v12;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    v13 = self->_coreIdentifier;
    self->_coreIdentifier = (NSString *)v4;

    coreIdentifier = self->_coreIdentifier;
  }
  return coreIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXPosterDescriptor *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    __atxlog_handle_lock_screen();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXPosterDescriptor initWithCoder:].cold.1(v6, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    __atxlog_handle_lock_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXPosterDescriptor initWithCoder:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("galleryOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[ATXPosterDescriptor initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:](self, "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", v5, v6, v7, v8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptor setScore:](self, "setScore:", v9);

  v10 = self;
LABEL_10:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ATXPosterDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[ATXPosterDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("extensionBundleIdentifier"));

  -[ATXPosterDescriptor containerBundleIdentifier](self, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("containerBundleIdentifier"));

  -[ATXPosterDescriptor galleryOptions](self, "galleryOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("galleryOptions"));

  -[ATXPosterDescriptor score](self, "score");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("score"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATXPosterDescriptor identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptor containerBundleIdentifier](self, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptor galleryOptions](self, "galleryOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithIdentifier:extensionBundleIdentifier:containerBundleIdentifier:galleryOptions:", v5, v6, v7, v8);

  -[ATXPosterDescriptor score](self, "score");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScore:", v10);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  ATXPosterDescriptor *v4;
  ATXPosterDescriptor *v5;
  BOOL v6;

  v4 = (ATXPosterDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPosterDescriptor isEqualToATXPosterDescriptor:](self, "isEqualToATXPosterDescriptor:", v5);

  return v6;
}

- (BOOL)isEqualToATXPosterDescriptor:(id)a3
{
  id *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *extensionBundleIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *containerBundleIdentifier;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  char v20;
  ATXPosterDescriptorGalleryOptions *v21;
  ATXPosterDescriptorGalleryOptions *v22;

  v4 = (id *)a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = identifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v11 = (NSString *)v4[3];
  if (extensionBundleIdentifier == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = extensionBundleIdentifier;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  containerBundleIdentifier = self->_containerBundleIdentifier;
  v16 = (NSString *)v4[4];
  if (containerBundleIdentifier == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = containerBundleIdentifier;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
    {
LABEL_11:
      v20 = 0;
      goto LABEL_17;
    }
  }
  v21 = self->_galleryOptions;
  v22 = v21;
  if (v21 == v4[5])
    v20 = 1;
  else
    v20 = -[ATXPosterDescriptorGalleryOptions isEqual:](v21, "isEqual:");

LABEL_17:
  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[ATXPosterDescriptor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[ATXPosterDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[ATXPosterDescriptor containerBundleIdentifier](self, "containerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[ATXPosterDescriptor galleryOptions](self, "galleryOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (ATXPosterDescriptorGalleryOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_coreIdentifier, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: error decoding identifier", a5, a6, a7, a8, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A49EF000, a1, a3, "%s: error decoding extensionBundleIdentifier", a5, a6, a7, a8, 2u);
}

@end
