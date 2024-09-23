@implementation _CNUILikenessFingerprintNonpersistedContactImpl

- (_CNUILikenessFingerprintNonpersistedContactImpl)initWithGivenName:(id)a3 middleName:(id)a4 familyName:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 imageData:(id)a8 thumbnailImageData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _CNUILikenessFingerprintNonpersistedContactImpl *v22;
  uint64_t v23;
  NSString *givenName;
  uint64_t v25;
  NSString *middleName;
  uint64_t v27;
  NSString *familyName;
  uint64_t v29;
  NSArray *emailAddresses;
  uint64_t v31;
  NSArray *phoneNumbers;
  uint64_t v33;
  NSValue *imageDataPointer;
  uint64_t v35;
  _CNUILikenessFingerprintNonpersistedContactImpl *v36;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)_CNUILikenessFingerprintNonpersistedContactImpl;
  v22 = -[_CNUILikenessFingerprintNonpersistedContactImpl init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    givenName = v22->_givenName;
    v22->_givenName = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    middleName = v22->_middleName;
    v22->_middleName = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    familyName = v22->_familyName;
    v22->_familyName = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    emailAddresses = v22->_emailAddresses;
    v22->_emailAddresses = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    phoneNumbers = v22->_phoneNumbers;
    v22->_phoneNumbers = (NSArray *)v31;

    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v20);
      v33 = objc_claimAutoreleasedReturnValue();
      imageDataPointer = v22->_imageDataPointer;
      v22->_imageDataPointer = (NSValue *)v33;
    }
    else
    {
      if (!objc_msgSend(v21, "length"))
      {
LABEL_7:
        v36 = v22;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v21);
      v35 = objc_claimAutoreleasedReturnValue();
      imageDataPointer = v22->_thumbnailImageDataPointer;
      v22->_thumbnailImageDataPointer = (NSValue *)v35;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  _CNUILikenessFingerprintNonpersistedContactImpl *v4;
  NSString *givenName;
  NSString *middleName;
  NSString *familyName;
  NSArray *emailAddresses;
  NSArray *phoneNumbers;
  NSValue *imageDataPointer;
  NSValue *thumbnailImageDataPointer;
  BOOL v12;

  v4 = (_CNUILikenessFingerprintNonpersistedContactImpl *)a3;
  if (self == v4)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  givenName = self->_givenName;
  if ((unint64_t)givenName | (unint64_t)v4->_givenName)
  {
    if (!-[NSString isEqual:](givenName, "isEqual:"))
      goto LABEL_18;
  }
  if (((middleName = self->_middleName, !((unint64_t)middleName | (unint64_t)v4->_middleName))
     || -[NSString isEqual:](middleName, "isEqual:"))
    && ((familyName = self->_familyName, !((unint64_t)familyName | (unint64_t)v4->_familyName))
     || -[NSString isEqual:](familyName, "isEqual:"))
    && ((emailAddresses = self->_emailAddresses,
         !((unint64_t)emailAddresses | (unint64_t)v4->_emailAddresses))
     || -[NSArray isEqual:](emailAddresses, "isEqual:"))
    && ((phoneNumbers = self->_phoneNumbers, !((unint64_t)phoneNumbers | (unint64_t)v4->_phoneNumbers))
     || -[NSArray isEqual:](phoneNumbers, "isEqual:"))
    && ((imageDataPointer = self->_imageDataPointer,
         !((unint64_t)imageDataPointer | (unint64_t)v4->_imageDataPointer))
     || -[NSValue isEqual:](imageDataPointer, "isEqual:"))
    && ((thumbnailImageDataPointer = self->_thumbnailImageDataPointer,
         !((unint64_t)thumbnailImageDataPointer | (unint64_t)v4->_thumbnailImageDataPointer))
     || -[NSValue isEqual:](thumbnailImageDataPointer, "isEqual:")))
  {
LABEL_17:
    v12 = 1;
  }
  else
  {
LABEL_18:
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_givenName);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_middleName) - v3 + 32 * v3;
  v5 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_familyName) - v4 + 32 * v4;
  v6 = objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", self->_emailAddresses) - v5 + 32 * v5;
  v7 = objc_msgSend(MEMORY[0x1E0D13A78], "arrayHash:", self->_phoneNumbers) - v6 + 32 * v6;
  v8 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_imageDataPointer) - v7 + 32 * v7;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_thumbnailImageDataPointer)
       - v8
       + 32 * v8
       + 0x6CE5F3FACFLL;
}

- (_CNUILikenessFingerprintNonpersistedContactImpl)initWithContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _CNUILikenessFingerprintNonpersistedContactImpl *v13;

  v3 = a3;
  objc_msgSend(v3, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_compactMap:", &__block_literal_global_114);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_compactMap:", &__block_literal_global_115);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailImageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_CNUILikenessFingerprintNonpersistedContactImpl initWithGivenName:middleName:familyName:emailAddresses:phoneNumbers:imageData:thumbnailImageData:](self, "initWithGivenName:middleName:familyName:emailAddresses:phoneNumbers:imageData:thumbnailImageData:", v4, v5, v6, v8, v10, v11, v12);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageDataPointer, 0);
  objc_storeStrong((id *)&self->_imageDataPointer, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

- (_CNUILikenessFingerprintNonpersistedContactImpl)init
{
  _CNUILikenessFingerprintNonpersistedContactImpl *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_givenName, "length"))
    v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("givenName"), self->_givenName);
  if (-[NSString length](self->_middleName, "length"))
    v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("middleName"), self->_middleName);
  if (-[NSString length](self->_familyName, "length"))
    v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("familyName"), self->_familyName);
  if (-[NSArray count](self->_emailAddresses, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_emailAddresses, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("emailAddresses"), v7);

  }
  if (-[NSArray count](self->_phoneNumbers, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_phoneNumbers, "componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("phoneNumbers"), v9);

  }
  if (self->_imageDataPointer)
    v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("imageData"));
  if (self->_thumbnailImageDataPointer)
    v12 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("thumbnailImageData"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)hasContactIdentifier:(id)a3
{
  return 0;
}

- (NSString)givenName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)middleName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)familyName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)emailAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)phoneNumbers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSValue)imageDataPointer
{
  return (NSValue *)objc_getProperty(self, a2, 48, 1);
}

- (NSValue)thumbnailImageDataPointer
{
  return (NSValue *)objc_getProperty(self, a2, 56, 1);
}

@end
