@implementation MKTransitArtwork

+ (id)artworkWithShield:(id)a3 accessibilityText:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShield:accessibilityText:", v7, v6);

  return v8;
}

- (MKTransitArtwork)initWithShield:(id)a3 accessibilityText:(id)a4
{
  id v7;
  id v8;
  MKTransitArtwork *v9;
  MKTransitArtwork *v10;
  uint64_t v11;
  NSString *accessibilityText;
  MKTransitArtwork *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MKTransitArtwork;
  v9 = -[MKTransitArtwork init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shieldDataSource, a3);
    *(_QWORD *)&v10->_artworkSourceType = 1;
    v11 = objc_msgSend(v8, "copy");
    accessibilityText = v10->_accessibilityText;
    v10->_accessibilityText = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

- (MKTransitArtwork)initWithText:(id)a3
{
  id v5;
  char *v6;
  MKTransitArtwork *v7;
  MKTransitArtwork *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKTransitArtwork;
  v6 = -[MKTransitArtwork init](&v10, sel_init);
  v7 = (MKTransitArtwork *)v6;
  if (v6)
  {
    *(_QWORD *)(v6 + 20) = 3;
    objc_storeStrong((id *)v6 + 7, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)artworkWithText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:", v4);

  return v5;
}

+ (id)artworkWithIcon:(id)a3 accessibilityText:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIcon:accessibilityText:", v7, v6);

  return v8;
}

- (MKTransitArtwork)initWithIcon:(id)a3 accessibilityText:(id)a4
{
  return -[MKTransitArtwork initWithIcon:fallbackShield:accessibilityText:](self, "initWithIcon:fallbackShield:accessibilityText:", a3, 0, 0);
}

- (MKTransitArtwork)initWithIcon:(id)a3 fallbackShield:(id)a4 accessibilityText:(id)a5
{
  id v9;
  id v10;
  id v11;
  MKTransitArtwork *v12;
  MKTransitArtwork *v13;
  uint64_t v14;
  NSString *accessibilityText;
  MKTransitArtwork *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKTransitArtwork;
  v12 = -[MKTransitArtwork init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconDataSource, a3);
    v13->_artworkSourceType = 2;
    v14 = objc_msgSend(v11, "copy");
    accessibilityText = v13->_accessibilityText;
    v13->_accessibilityText = (NSString *)v14;

    objc_storeStrong((id *)&v13->_iconFallbackShieldDataSource, a4);
    v16 = v13;
  }

  return v13;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (int)artworkSourceType
{
  return self->_artworkSourceType;
}

- (GEOTransitShieldDataSource)shieldDataSource
{
  return self->_shieldDataSource;
}

- (GEOTransitIconDataSource)iconDataSource
{
  return self->_iconDataSource;
}

- (int)artworkUseType
{
  return self->_artworkUseType;
}

- (GEOTransitShieldDataSource)iconFallbackShieldDataSource
{
  return self->_iconFallbackShieldDataSource;
}

- (GEOTransitTextDataSource)textDataSource
{
  return self->_textDataSource;
}

- (BOOL)hasRoutingIncidentBadge
{
  return self->_hasRoutingIncidentBadge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDataSource, 0);
  objc_storeStrong((id *)&self->_iconFallbackShieldDataSource, 0);
  objc_storeStrong((id *)&self->_iconDataSource, 0);
  objc_storeStrong((id *)&self->_shieldDataSource, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);
}

@end
