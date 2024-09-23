@implementation _BlastDoorLPAppStoreStoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAppStoreStoryMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPAppStoreStoryMetadata *v5;
  uint64_t v6;
  NSString *subtitle;
  _BlastDoorLPAppStoreStoryMetadata *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPAppStoreStoryMetadata;
  v5 = -[_BlastDoorLPAppStoreStoryMetadata init](&v10, sel_init);
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
  objc_msgSend(a3, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPAppStoreStoryMetadata *v4;
  void *v5;
  _BlastDoorLPAppStoreStoryMetadata *v6;

  v4 = +[_BlastDoorLPAppStoreStoryMetadata allocWithZone:](_BlastDoorLPAppStoreStoryMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPAppStoreStoryMetadata subtitle](self, "subtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppStoreStoryMetadata setSubtitle:](v4, "setSubtitle:", v5);

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
  v8.super_class = (Class)_BlastDoorLPAppStoreStoryMetadata;
  if (-[_BlastDoorLPAppStoreStoryMetadata isEqual:](&v8, sel_isEqual_, v4))
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v5 = v4[2];
  if (!(v5 | (unint64_t)self->_subtitle))
LABEL_5:
    v6 = 1;
  else
    v6 = objc_msgSend((id)v5, "isEqual:");
LABEL_7:

  return v6;
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

@end
