@implementation LPSharingStatusMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSharingStatusMetadata)initWithCoder:(id)a3
{
  id v4;
  LPSharingStatusMetadata *v5;
  uint64_t v6;
  NSAttributedString *status;
  LPSharingStatusMetadata *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPSharingStatusMetadata;
  v5 = -[LPSharingStatusMetadata init](&v10, sel_init);
  if (v5)
  {
    decodeAttributedStringForKey(v4, (uint64_t)CFSTR("status"));
    v6 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSAttributedString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_lp_encodeObjectIfNotNil:forKey:", self->_status, CFSTR("status"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPSharingStatusMetadata *v4;
  void *v5;
  LPSharingStatusMetadata *v6;

  v4 = +[LPSharingStatusMetadata allocWithZone:](LPSharingStatusMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPSharingStatusMetadata status](self, "status");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPSharingStatusMetadata setStatus:](v4, "setStatus:", v5);

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
  v7.super_class = (Class)LPSharingStatusMetadata;
  if (-[LPSharingStatusMetadata isEqual:](&v7, sel_isEqual_, v4))
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
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "unspecializedPresentationProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (sizeClassAllowsStatusTransformation(objc_msgSend(v4, "effectiveSizeClass")))
  {
    -[LPSharingStatusMetadata status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leading");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", v6);

  }
  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 0;
}

@end
