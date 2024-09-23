@implementation LPBusinessChatMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPBusinessChatMetadata)initWithCoder:(id)a3
{
  id v4;
  LPBusinessChatMetadata *v5;
  uint64_t v6;
  NSString *subtitle;
  LPBusinessChatMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPBusinessChatMetadata;
  v5 = -[LPBusinessChatMetadata init](&v10, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPBusinessChatMetadata *v4;
  void *v5;
  LPBusinessChatMetadata *v6;

  v4 = +[LPBusinessChatMetadata allocWithZone:](LPBusinessChatMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPBusinessChatMetadata subtitle](self, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPBusinessChatMetadata setSubtitle:](v4, "setSubtitle:", v5);

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
  v7.super_class = (Class)LPBusinessChatMetadata;
  if (-[LPBusinessChatMetadata isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objectsAreEqual_0(v4[2], self->_subtitle);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_subtitle, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("subtitle"), 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "unspecializedPresentationProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPBusinessChatMetadata subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LPBusinessChatMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "captionBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leading");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v6);

  }
  return v4;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return objc_msgSend(a3, "_lp_isHTTPFamilyURL") ^ 1;
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[LPBusinessChatMetadata subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("%@: %@"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPBusinessChatMetadata subtitle](self, "subtitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      goto LABEL_12;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    objc_msgSend(v4, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[LPBusinessChatMetadata subtitle](self, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
    -[LPBusinessChatMetadata subtitle](self, "subtitle");
  else
    LPLocalizedString(CFSTR("Messages for Business"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v14;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3
{
  return 0;
}

@end
