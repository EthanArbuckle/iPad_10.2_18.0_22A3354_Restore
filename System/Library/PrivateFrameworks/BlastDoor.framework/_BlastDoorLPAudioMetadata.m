@implementation _BlastDoorLPAudioMetadata

- (_BlastDoorLPAudioMetadata)init
{
  _BlastDoorLPAudioMetadata *v2;
  _BlastDoorLPAudioMetadata *v3;
  _BlastDoorLPAudioMetadata *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPAudioMetadata;
  v2 = -[_BlastDoorLPAudioMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  _BlastDoorLPAudioMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *type;
  _BlastDoorLPAudioMetadata *v10;

  v4 = a3;
  v5 = -[_BlastDoorLPAudioMetadata init](self, "init");
  if (v5
    && (URLForKey(v4, CFSTR("LPMetadataAudioURL")),
        v6 = objc_claimAutoreleasedReturnValue(),
        URL = v5->_URL,
        v5->_URL = (NSURL *)v6,
        URL,
        v5->_URL))
  {
    stringForKey(v4, CFSTR("LPMetadataAudioType"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAudioMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPAudioMetadata *v5;
  uint64_t v6;
  NSURL *URL;
  uint64_t v8;
  NSString *type;
  uint64_t v10;
  NSString *accessibilityText;
  _BlastDoorLPAudioMetadata *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPAudioMetadata;
  v5 = -[_BlastDoorLPAudioMetadata init](&v14, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
    decodeURLForKey(v4, CFSTR("URL"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("accessibilityText"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessibilityText = v5->_accessibilityText;
    v5->_accessibilityText = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "_bd_lp_encodeURLIfNotNilOrLocalFile:forKey:", self->_URL, CFSTR("URL"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_accessibilityText, CFSTR("accessibilityText"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPAudioMetadata;
  if (-[_BlastDoorLPAudioMetadata isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6;
      if (*((_DWORD *)v6 + 2) == self->_version
        && ((v8 = v6[2], !(v8 | (unint64_t)self->_URL)) || objc_msgSend((id)v8, "isEqual:"))
        && ((v9 = v7[3], !(v9 | (unint64_t)self->_type)) || objc_msgSend((id)v9, "isEqual:")))
      {
        v10 = v7[4];
        if (v10 | (unint64_t)self->_accessibilityText)
          v5 = objc_msgSend((id)v10, "isEqual:");
        else
          v5 = 1;
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
  return -[NSURL hash](self->_URL, "hash");
}

- (unsigned)version
{
  return self->_version;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityText, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
