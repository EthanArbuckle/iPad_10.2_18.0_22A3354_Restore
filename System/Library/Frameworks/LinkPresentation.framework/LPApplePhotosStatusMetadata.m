@implementation LPApplePhotosStatusMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPApplePhotosStatusMetadata)initWithCoder:(id)a3
{
  id v4;
  LPApplePhotosStatusMetadata *v5;
  uint64_t v6;
  NSAttributedString *status;
  LPApplePhotosStatusMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPApplePhotosStatusMetadata;
  v5 = -[LPApplePhotosStatusMetadata init](&v10, sel_init);
  if (v5)
  {
    decodeAttributedStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSAttributedString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_lp_encodeObjectIfNotNil:forKey:", self->_status, CFSTR("title"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPApplePhotosStatusMetadata *v4;
  void *v5;
  LPApplePhotosStatusMetadata *v6;

  v4 = +[LPApplePhotosStatusMetadata allocWithZone:](LPApplePhotosStatusMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPApplePhotosStatusMetadata status](self, "status");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosStatusMetadata setStatus:](v4, "setStatus:", v5);

    v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  char v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPApplePhotosStatusMetadata;
  if (-[LPApplePhotosStatusMetadata isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objectsAreEqual_0(v4[2], self->_status);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSAttributedString hash](self->_status, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("status"), 0);
}

- (NSAttributedString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  LPCardHeadingPresentationProperties *v19;
  void *v20;
  void *v21;
  void *v22;
  LPCardHeadingPresentationProperties *v23;

  v4 = a3;
  if (sizeClassAllowsStatusTransformation(objc_msgSend(v4, "effectiveSizeClass")))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alternateImages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "alternateImages");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v13);

    }
    objc_msgSend(v4, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "icon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "icon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v17);

    }
    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "sourceContextIcon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v18);

    }
    v19 = [LPCardHeadingPresentationProperties alloc];
    objc_msgSend(v4, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPApplePhotosStatusMetadata status](self, "status");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[LPCardHeadingPresentationProperties initWithStyle:topCaption:attributedBottomCaption:icons:](v19, "initWithStyle:topCaption:attributedBottomCaption:icons:", 38, v21, v22, v5);

  }
  else
  {
    objc_msgSend(v4, "unspecializedPresentationProperties");
    v23 = (LPCardHeadingPresentationProperties *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", a3);
}

@end
