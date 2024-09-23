@implementation LPWalletPassMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPWalletPassMetadata)initWithCoder:(id)a3
{
  id v4;
  LPWalletPassMetadata *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSDate *eventDate;
  uint64_t v10;
  NSDate *expirationDate;
  LPWalletPassMetadata *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPWalletPassMetadata;
  v5 = -[LPWalletPassMetadata init](&v14, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventDate = v5->_eventDate;
    v5->_eventDate = (NSDate *)v8;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("style"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_eventDate, CFSTR("eventDate"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPWalletPassMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  LPWalletPassMetadata *v8;

  v4 = +[LPWalletPassMetadata allocWithZone:](LPWalletPassMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPWalletPassMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWalletPassMetadata setName:](v4, "setName:", v5);

    -[LPWalletPassMetadata setStyle:](v4, "setStyle:", -[LPWalletPassMetadata style](self, "style"));
    -[LPWalletPassMetadata eventDate](self, "eventDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWalletPassMetadata setEventDate:](v4, "setEventDate:", v6);

    -[LPWalletPassMetadata expirationDate](self, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWalletPassMetadata setExpirationDate:](v4, "setExpirationDate:", v7);

    v8 = v4;
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
  v8.super_class = (Class)LPWalletPassMetadata;
  if (-[LPWalletPassMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_name) & 1) != 0
        && v6[3] == (void *)self->_style
        && objectsAreEqual_0(v6[4], self->_eventDate))
      {
        v5 = objectsAreEqual_0(v6[5], self->_expirationDate);
      }
      else
      {
        v5 = 0;
      }

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
  return -[NSString hash](self->_name, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("style"), CFSTR("eventDate"), CFSTR("expirationDate"), 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void)setEventDate:(id)a3
{
  objc_storeStrong((id *)&self->_eventDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)_subtitle
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
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

  v3 = -[LPWalletPassMetadata style](self, "style");
  if (v3 > 4)
    v4 = CFSTR("Wallet");
  else
    v4 = off_1E44AA6A0[v3];
  LPLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWalletPassMetadata expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Valid until %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3578];
    -[LPWalletPassMetadata expirationDate](self, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LPWalletPassMetadata eventDate](self, "eventDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v14 = (void *)MEMORY[0x1E0CB3578];
    -[LPWalletPassMetadata eventDate](self, "eventDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringFromDate:dateStyle:timeStyle:", v8, 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  joinedByDot(v5, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v10);
  }
  else
  {
    objc_msgSend(v4, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("creditcard"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "captionBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeadingIcon:", v9);
  }

  v12 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v12 - 1) < 3)
  {
    -[LPWalletPassMetadata name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "top");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v13);

    -[LPWalletPassMetadata _subtitle](self, "_subtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottom");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leading");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v17);
LABEL_10:

    goto LABEL_11;
  }
  if (!v12)
  {
    -[LPWalletPassMetadata name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "top");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leading");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v17);
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return objc_msgSend(a3, "isFileURL");
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[LPWalletPassMetadata name](self, "name", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Pass: %@"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWalletPassMetadata name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    LPLocalizedString(CFSTR("Pass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (id)fallbackIconForTransformer:(id)a3
{
  +[LPImage _systemImageNamed:](LPImage, "_systemImageNamed:", CFSTR("creditcard"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LPWalletPassMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3
{
  return 0;
}

@end
