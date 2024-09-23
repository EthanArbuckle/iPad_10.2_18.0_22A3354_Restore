@implementation LPAppleNewsMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAppleNewsMetadata)initWithCoder:(id)a3
{
  id v4;
  LPAppleNewsMetadata *v5;
  uint64_t v6;
  NSString *source;
  uint64_t v8;
  NSString *title;
  LPAppleNewsMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPAppleNewsMetadata;
  v5 = -[LPAppleNewsMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("source"));
    v6 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPAppleNewsMetadata;
  -[LPSpecializationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPAppleNewsMetadata *v4;
  void *v5;
  void *v6;
  LPAppleNewsMetadata *v7;

  v4 = +[LPAppleNewsMetadata allocWithZone:](LPAppleNewsMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPAppleNewsMetadata source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleNewsMetadata setSource:](v4, "setSource:", v5);

    -[LPAppleNewsMetadata title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPAppleNewsMetadata setTitle:](v4, "setTitle:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPAppleNewsMetadata;
  if (-[LPAppleNewsMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_source) & 1) != 0)
        v5 = objectsAreEqual_0(v6[3], self->_title);
      else
        v5 = 0;

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
  return -[NSString hash](self->_title, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("source"), CFSTR("title"), 0);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  LPCaptionBarPresentationProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v5 = a3;
  objc_msgSend(v5, "commonPresentationPropertiesForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v6, "setCaptionBar:", v7);

  if ((sizeClassAllowsMedia(objc_msgSend(v5, "effectiveSizeClass")) & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v5, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "_lp_isNewsSportsEventURL") & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v5, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_lp_isNewsPuzzleURL");

    if ((v14 & 1) == 0)
    {
LABEL_2:
      objc_msgSend(v5, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
      {
        objc_msgSend(v5, "metadata");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "icon");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "_populateProperties:withPrimaryImage:", v6, v10);
      goto LABEL_11;
    }
  }
  objc_msgSend(v5, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(v5, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "_populateProperties:withPrimaryIcon:", v6, v10);
LABEL_11:
  if (!v9)
  {

  }
  objc_msgSend(v5, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[LPPresentationSpecializations isStocksNewsURL:](LPPresentationSpecializations, "isStocksNewsURL:", v16);

  objc_msgSend(v5, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "rangeOfString:options:", CFSTR(" — "), 4);
  v22 = v21;
  v23 = objc_msgSend(v19, "rangeOfString:options:", CFSTR(" - "), 4);
  if (v22)
    v25 = v20;
  else
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (v24 && (v23 > v20 || v22 == 0))
  {
    v25 = v23;
    v22 = v24;
  }
  v26 = 0;
  if (v22 && v25)
  {
    if (v22 + v25 == objc_msgSend(v19, "length"))
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v19, "substringFromIndex:");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "substringToIndex:", v25);
      v28 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v28;
      v26 = (void *)v27;
    }
  }
  v29 = objc_msgSend(v5, "_rowConfigurationForStyle:", objc_msgSend(v6, "style"));
  if ((unint64_t)(v29 - 2) < 2)
  {
    objc_msgSend(v6, "captionBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "top");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leading");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setText:", v19);

    objc_msgSend(v6, "captionBar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottom");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leading");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setText:", v26);

    -[LPAppleNewsMetadata displayNameForOriginatingApp:](self, "displayNameForOriginatingApp:", v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captionBar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "belowBottom");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leading");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v30);
    goto LABEL_32;
  }
  if (v29 == 1)
  {
    objc_msgSend(v6, "captionBar");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "top");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leading");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setText:", v19);

    if (objc_msgSend(v5, "effectiveSizeClass") == 2)
    {
      objc_msgSend(v6, "captionBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottom");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "leading");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v26);
      goto LABEL_33;
    }
    -[LPAppleNewsMetadata displayNameForOriginatingApp:](self, "displayNameForOriginatingApp:", v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    joinedBySpace(v26, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captionBar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottom");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leading");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v31);

LABEL_32:
    goto LABEL_33;
  }
  if (!v29)
  {
    objc_msgSend(v6, "captionBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "top");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leading");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setText:", v19);
LABEL_33:

  }
  return v6;
}

- (id)displayNameForOriginatingApp:(unint64_t)a3
{
  __CFString *v3;

  if (!a3)
  {
    v3 = CFSTR(" News");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = CFSTR("Stocks");
LABEL_5:
    LPLocalizedString(v3);
    self = (LPAppleNewsMetadata *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[LPPresentationSpecializations isAppleNewsURL:](LPPresentationSpecializations, "isAppleNewsURL:", v3)|| +[LPPresentationSpecializations isStocksNewsURL:](LPPresentationSpecializations, "isStocksNewsURL:", v3);

  return v4;
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[LPPresentationSpecializations isStocksNewsURL:](LPPresentationSpecializations, "isStocksNewsURL:", v5);

  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
    LPLocalizedString(CFSTR("Stocks: %@"));
  else
    LPLocalizedString(CFSTR("News: %@"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)previewImageForTransformer:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
