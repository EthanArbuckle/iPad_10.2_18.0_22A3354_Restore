@implementation LPMapCollectionPublisherMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPMapCollectionPublisherMetadata)initWithCoder:(id)a3
{
  id v4;
  LPMapCollectionPublisherMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  void *v10;
  LPMapCollectionPublisherMetadata *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LPMapCollectionPublisherMetadata;
  v5 = -[LPMapCollectionPublisherMetadata init](&v13, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_numberOfPublishedCollections;
    *(_QWORD *)&v5->_numberOfPublishedCollections = v6;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    decodeNumberForKey(v4, CFSTR("numberOfPublishedCollections"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(&v5->super.__disallowsURLOverrideByDelegate + 2) = objc_msgSend(v10, "unsignedIntValue");

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", *(_QWORD *)&self->_numberOfPublishedCollections, CFSTR("name"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("icon"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(&self->super.__disallowsURLOverrideByDelegate + 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("numberOfPublishedCollections"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPMapCollectionPublisherMetadata *v4;
  void *v5;
  void *v6;
  LPMapCollectionPublisherMetadata *v7;

  v4 = +[LPMapCollectionPublisherMetadata allocWithZone:](LPMapCollectionPublisherMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPMapCollectionPublisherMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionPublisherMetadata setName:](v4, "setName:", v5);

    -[LPMapCollectionPublisherMetadata icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionPublisherMetadata setIcon:](v4, "setIcon:", v6);

    -[LPMapCollectionPublisherMetadata setNumberOfPublishedCollections:](v4, "setNumberOfPublishedCollections:", -[LPMapCollectionPublisherMetadata numberOfPublishedCollections](self, "numberOfPublishedCollections"));
    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPMapCollectionPublisherMetadata;
  if (-[LPMapCollectionPublisherMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v5 = (objectsAreEqual_0(v6[2], *(void **)&self->_numberOfPublishedCollections) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_name)
        && *((_DWORD *)v6 + 3) == *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return objc_msgSend(*(id *)&self->_numberOfPublishedCollections, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("icon"));
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("icon"), CFSTR("numberOfPublishedCollections"), 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfPublishedCollections;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (LPImage)icon
{
  return (LPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)numberOfPublishedCollections
{
  return *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);
}

- (void)setNumberOfPublishedCollections:(unsigned int)a3
{
  *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_numberOfPublishedCollections, 0);
}

- (id)_guideCount
{
  void *v3;
  void *v4;
  void *v5;

  if (-[LPMapCollectionPublisherMetadata numberOfPublishedCollections](self, "numberOfPublishedCollections"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("%d Guide(s)"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, -[LPMapCollectionPublisherMetadata numberOfPublishedCollections](self, "numberOfPublishedCollections"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  uint64_t v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  -[LPMapCollectionPublisherMetadata icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_populateProperties:withPrimaryIcon:", v5, v7);

  v8 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v8 - 2) < 2)
  {
    -[LPMapCollectionPublisherMetadata name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "top");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leading");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v19);

    -[LPMapCollectionPublisherMetadata _guideCount](self, "_guideCount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottom");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leading");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v23);

    LPLocalizedString(CFSTR(" Maps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "belowBottom");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v13);
    goto LABEL_7;
  }
  if (!v8)
  {
    -[LPMapCollectionPublisherMetadata name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "top");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v13);
    goto LABEL_7;
  }
  if (v8 == 1)
  {
    -[LPMapCollectionPublisherMetadata name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "top");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leading");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v9);

    LPLocalizedString(CFSTR(" Maps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapCollectionPublisherMetadata _guideCount](self, "_guideCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    joinedByDot(v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottom");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leading");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v15);

LABEL_7:
  }
  objc_msgSend(v4, "effectiveSizeClass");
  populatePropertiesForVisualRefresh(v5);

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isAppleMapsCollectionURL:](LPPresentationSpecializations, "isAppleMapsCollectionURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Maps Guide: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapCollectionPublisherMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  -[LPMapCollectionPublisherMetadata icon](self, "icon", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fallbackIconForTransformer:(id)a3
{
  +[LPResources mapIcon](LPResources, "mapIcon", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LPMapCollectionPublisherMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  -[LPMapCollectionPublisherMetadata icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v5);

}

@end
