@implementation _BlastDoorLPApplePhotosStatusMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPApplePhotosStatusMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPApplePhotosStatusMetadata *v5;
  void *v6;
  uint64_t v7;
  NSAttributedString *status;
  _BlastDoorLPApplePhotosStatusMetadata *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorLPApplePhotosStatusMetadata;
  v5 = -[_BlastDoorLPApplePhotosStatusMetadata init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_bd_lp_strictlyDecodeNSAttributedStringForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    truncatedAttributedStringAtMaximumMetadataLength(v6);
    v7 = objc_claimAutoreleasedReturnValue();

    status = v5->_status;
    v5->_status = (NSAttributedString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_status, CFSTR("title"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPApplePhotosStatusMetadata *v4;
  void *v5;
  _BlastDoorLPApplePhotosStatusMetadata *v6;

  v4 = +[_BlastDoorLPApplePhotosStatusMetadata allocWithZone:](_BlastDoorLPApplePhotosStatusMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPApplePhotosStatusMetadata status](self, "status");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPApplePhotosStatusMetadata setStatus:](v4, "setStatus:", v5);

    v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  char v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorLPApplePhotosStatusMetadata;
  if (-[_BlastDoorLPApplePhotosStatusMetadata isEqual:](&v8, sel_isEqual_, v4))
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v5 = v4[2];
  if (!(v5 | (unint64_t)self->_status))
LABEL_5:
    v6 = 1;
  else
    v6 = objc_msgSend((id)v5, "isEqual:");
LABEL_7:

  return v6;
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

@end
