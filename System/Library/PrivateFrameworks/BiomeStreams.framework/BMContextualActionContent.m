@implementation BMContextualActionContent

- (BMContextualActionContent)initWithType:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  BMContextualActionContent *v9;
  BMContextualActionContent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMContextualActionContent;
  v9 = -[BMContextualActionContent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentType, a3);
    objc_storeStrong((id *)&v10->_contentMetadata, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *contentType;
  id v5;

  contentType = self->_contentType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contentType, CFSTR("contentType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentMetadata, CFSTR("contentMetadata"));

}

- (BMContextualActionContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BMContextualActionContent *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("contentMetadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[BMContextualActionContent initWithType:metadata:](self, "initWithType:metadata:", v5, v13);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[BMContextualActionContent contentType](self, "contentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "contentType"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[BMContextualActionContent contentType](self, "contentType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (v7)
      {
LABEL_9:

        -[BMContextualActionContent contentMetadata](self, "contentMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 || (objc_msgSend(v6, "contentMetadata"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[BMContextualActionContent contentMetadata](self, "contentMetadata");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "contentMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToDictionary:", v14);

          if (v12)
          {
LABEL_15:

            v11 = v10 & v15;
            goto LABEL_16;
          }
        }
        else
        {
          v15 = 1;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSDictionary)contentMetadata
{
  return self->_contentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetadata, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end
