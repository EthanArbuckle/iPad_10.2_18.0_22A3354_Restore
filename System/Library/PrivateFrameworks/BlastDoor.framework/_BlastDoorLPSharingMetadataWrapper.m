@implementation _BlastDoorLPSharingMetadataWrapper

- (id)dataRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPSharingMetadataWrapper)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPSharingMetadataWrapper *v5;
  uint64_t v6;
  _BlastDoorLPLinkMetadata *metadata;
  _BlastDoorLPSharingMetadataWrapper *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPSharingMetadataWrapper;
  v5 = -[_BlastDoorLPSharingMetadataWrapper init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (_BlastDoorLPLinkMetadata *)v6;

    v5->_hasFetchedSubresources = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasFetchedSubresources"));
    v5->_hasCompletedFetch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCompletedFetch"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BlastDoorLPLinkMetadata *metadata;
  id v5;

  metadata = self->_metadata;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasFetchedSubresources, CFSTR("hasFetchedSubresources"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCompletedFetch, CFSTR("hasCompletedFetch"));

}

- (void)setMetadata:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_storeStrong((id *)&self->_metadata, a3);
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  self->_hasCompletedFetch = (isKindOfClass & 1) == 0;
}

- (_BlastDoorLPLinkMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)hasFetchedSubresources
{
  return self->_hasFetchedSubresources;
}

- (void)setHasFetchedSubresources:(BOOL)a3
{
  self->_hasFetchedSubresources = a3;
}

- (BOOL)hasCompletedFetch
{
  return self->_hasCompletedFetch;
}

- (void)setHasCompletedFetch:(BOOL)a3
{
  self->_hasCompletedFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
