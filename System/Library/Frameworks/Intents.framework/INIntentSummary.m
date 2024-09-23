@implementation INIntentSummary

- (INIntentSummary)initWithIntentIdentifier:(id)a3 originatingBundleId:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  INIntentSummary *v11;
  uint64_t v12;
  NSString *intentIdentifier;
  uint64_t v14;
  NSString *originatingBundleId;
  uint64_t v16;
  NSString *languageCode;
  INIntentSummary *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)INIntentSummary;
  v11 = -[INIntentSummary init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    intentIdentifier = v11->_intentIdentifier;
    v11->_intentIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    originatingBundleId = v11->_originatingBundleId;
    v11->_originatingBundleId = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (void)setTitle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
    objc_storeStrong((id *)&self->_title, a3);
  self->_containedProperties |= 1uLL;

}

- (void)setSubtitle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_subtitle, "isEqualToString:"))
    objc_storeStrong((id *)&self->_subtitle, a3);
  self->_containedProperties |= 2uLL;

}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (NSString)originatingBundleId
{
  return self->_originatingBundleId;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (unint64_t)containedProperties
{
  return self->_containedProperties;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_originatingBundleId, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

@end
