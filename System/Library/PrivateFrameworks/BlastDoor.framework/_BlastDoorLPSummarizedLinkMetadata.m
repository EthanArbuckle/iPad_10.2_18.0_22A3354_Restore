@implementation _BlastDoorLPSummarizedLinkMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPSummarizedLinkMetadata)initWithCoder:(id)a3
{
  _BlastDoorLPSummarizedLinkMetadata *v3;
  _BlastDoorLPSummarizedLinkMetadata *v4;
  _BlastDoorLPSummarizedLinkMetadata *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPSummarizedLinkMetadata;
  v3 = -[_BlastDoorLPSummarizedLinkMetadata init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPSummarizedLinkMetadata *v3;
  _BlastDoorLPSummarizedLinkMetadata *v4;
  _BlastDoorLPSummarizedLinkMetadata *v5;

  v3 = +[_BlastDoorLPSummarizedLinkMetadata allocWithZone:](_BlastDoorLPSummarizedLinkMetadata, "allocWithZone:", a3);
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
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPSummarizedLinkMetadata;
  if (-[_BlastDoorLPSummarizedLinkMetadata isEqual:](&v7, sel_isEqual_, v4))
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

@end
