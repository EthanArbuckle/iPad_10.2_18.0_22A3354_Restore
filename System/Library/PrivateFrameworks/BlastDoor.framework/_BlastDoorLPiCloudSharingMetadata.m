@implementation _BlastDoorLPiCloudSharingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiCloudSharingMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiCloudSharingMetadata *v5;
  uint64_t v6;
  NSString *application;
  uint64_t v8;
  NSString *kind;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  _BlastDoorLPImage *icon;
  uint64_t v14;
  _BlastDoorLPImage *thumbnail;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *encodedTokens;
  _BlastDoorLPiCloudSharingMetadata *v19;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_BlastDoorLPiCloudSharingMetadata;
  v5 = -[_BlastDoorLPiCloudSharingMetadata init](&v21, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("application"));
    v6 = objc_claimAutoreleasedReturnValue();
    application = v5->_application;
    v5->_application = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("kind"));
    v8 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v12 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("thumbnail"));
    v14 = objc_claimAutoreleasedReturnValue();
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (_BlastDoorLPImage *)v14;

    v16 = objc_opt_class();
    objc_msgSend(v4, "_bd_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v16, objc_opt_class(), CFSTR("encodedTokens"));
    v17 = objc_claimAutoreleasedReturnValue();
    encodedTokens = v5->_encodedTokens;
    v5->_encodedTokens = (NSDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *application;
  id v5;

  application = self->_application;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", application, CFSTR("application"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, CFSTR("thumbnail"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_encodedTokens, CFSTR("encodedTokens"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiCloudSharingMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BlastDoorLPiCloudSharingMetadata *v11;

  v4 = +[_BlastDoorLPiCloudSharingMetadata allocWithZone:](_BlastDoorLPiCloudSharingMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiCloudSharingMetadata application](self, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudSharingMetadata setApplication:](v4, "setApplication:", v5);

    -[_BlastDoorLPiCloudSharingMetadata kind](self, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudSharingMetadata setKind:](v4, "setKind:", v6);

    -[_BlastDoorLPiCloudSharingMetadata title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudSharingMetadata setTitle:](v4, "setTitle:", v7);

    -[_BlastDoorLPiCloudSharingMetadata icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudSharingMetadata setIcon:](v4, "setIcon:", v8);

    -[_BlastDoorLPiCloudSharingMetadata thumbnail](self, "thumbnail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudSharingMetadata setThumbnail:](v4, "setThumbnail:", v9);

    -[_BlastDoorLPiCloudSharingMetadata encodedTokens](self, "encodedTokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudSharingMetadata setEncodedTokens:](v4, "setEncodedTokens:", v10);

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPiCloudSharingMetadata;
  if (-[_BlastDoorLPiCloudSharingMetadata isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[3];
      if (v7 | (unint64_t)self->_application && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[4], v8 | (unint64_t)self->_kind) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[5], v9 | (unint64_t)self->_title) && !objc_msgSend((id)v9, "isEqual:")
        || (v10 = v6[6], v10 | (unint64_t)self->_icon) && !objc_msgSend((id)v10, "isEqual:")
        || (v11 = v6[7], v11 | (unint64_t)self->_thumbnail) && !objc_msgSend((id)v11, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v12 = v6[8];
        if (v12 | (unint64_t)self->_encodedTokens)
          v5 = objc_msgSend((id)v12, "isEqual:");
        else
          v5 = 1;
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
  return -[NSString hash](self->_title, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("thumbnail"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("application"), CFSTR("kind"), CFSTR("title"), CFSTR("icon"), CFSTR("thumbnail"), CFSTR("encodedTokens"), 0);
}

- (void)setTokenData:(id)a3 handle:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *encodedTokens;
  _BlastDoorCKDeviceToDeviceShareInvitationToken *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (!self->_encodedTokens)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    encodedTokens = self->_encodedTokens;
    self->_encodedTokens = v10;

  }
  v12 = -[_BlastDoorCKDeviceToDeviceShareInvitationToken initWithSharingInvitationData:shareURL:]([_BlastDoorCKDeviceToDeviceShareInvitationToken alloc], "initWithSharingInvitationData:shareURL:", v13, v9);
  -[NSDictionary setObject:forKeyedSubscript:](self->_encodedTokens, "setObject:forKeyedSubscript:", v12, v8);

}

- (id)tokenDataForHandle:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_encodedTokens, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingInvitationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)shareURLForHandle:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_encodedTokens, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shareURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)applicationBundleIdenfier
{
  return self->_applicationBundleIdenfier;
}

- (void)setApplicationBundleIdenfier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (_BlastDoorLPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (NSDictionary)encodedTokens
{
  return self->_encodedTokens;
}

- (void)setEncodedTokens:(id)a3
{
  objc_storeStrong((id *)&self->_encodedTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedTokens, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdenfier, 0);
}

@end
