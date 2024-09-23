@implementation LPSummarizedLinkMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSummarizedLinkMetadata)initWithCoder:(id)a3
{
  LPSummarizedLinkMetadata *v3;
  LPSummarizedLinkMetadata *v4;
  LPSummarizedLinkMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPSummarizedLinkMetadata;
  v3 = -[LPSummarizedLinkMetadata init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPSummarizedLinkMetadata *v3;
  LPSummarizedLinkMetadata *v4;
  LPSummarizedLinkMetadata *v5;

  v3 = +[LPSummarizedLinkMetadata allocWithZone:](LPSummarizedLinkMetadata, "allocWithZone:", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LPSummarizedLinkMetadata;
  if (-[LPSummarizedLinkMetadata isEqual:](&v7, sel_isEqual_, v4))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  objc_msgSend(a3, "unspecializedPresentationPropertiesForStyle:", 39);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return a3 == 0;
}

@end
