@implementation _BlastDoorLPiCloudFamilyInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiCloudFamilyInvitationMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPiCloudFamilyInvitationMetadata *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *action;
  uint64_t v12;
  NSString *kind;
  uint64_t v14;
  _BlastDoorLPImage *image;
  uint64_t v16;
  _BlastDoorLPImage *icon;
  _BlastDoorLPiCloudFamilyInvitationMetadata *v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_BlastDoorLPiCloudFamilyInvitationMetadata;
  v5 = -[_BlastDoorLPiCloudFamilyInvitationMetadata init](&v20, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("action"));
    v10 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("kind"));
    v12 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v14 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (_BlastDoorLPImage *)v14;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v16 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (_BlastDoorLPImage *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPiCloudFamilyInvitationMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BlastDoorLPiCloudFamilyInvitationMetadata *v11;

  v4 = +[_BlastDoorLPiCloudFamilyInvitationMetadata allocWithZone:](_BlastDoorLPiCloudFamilyInvitationMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPiCloudFamilyInvitationMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudFamilyInvitationMetadata setTitle:](v4, "setTitle:", v5);

    -[_BlastDoorLPiCloudFamilyInvitationMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudFamilyInvitationMetadata setSubtitle:](v4, "setSubtitle:", v6);

    -[_BlastDoorLPiCloudFamilyInvitationMetadata action](self, "action");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudFamilyInvitationMetadata setAction:](v4, "setAction:", v7);

    -[_BlastDoorLPiCloudFamilyInvitationMetadata kind](self, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudFamilyInvitationMetadata setKind:](v4, "setKind:", v8);

    -[_BlastDoorLPiCloudFamilyInvitationMetadata image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudFamilyInvitationMetadata setImage:](v4, "setImage:", v9);

    -[_BlastDoorLPiCloudFamilyInvitationMetadata icon](self, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPiCloudFamilyInvitationMetadata setIcon:](v4, "setIcon:", v10);

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
  v14.super_class = (Class)_BlastDoorLPiCloudFamilyInvitationMetadata;
  if (-[_BlastDoorLPiCloudFamilyInvitationMetadata isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = v6[2];
      if (v7 | (unint64_t)self->_title && !objc_msgSend((id)v7, "isEqual:")
        || (v8 = v6[3], v8 | (unint64_t)self->_subtitle) && !objc_msgSend((id)v8, "isEqual:")
        || (v9 = v6[4], v9 | (unint64_t)self->_action) && !objc_msgSend((id)v9, "isEqual:")
        || (v10 = v6[5], v10 | (unint64_t)self->_kind) && !objc_msgSend((id)v10, "isEqual:")
        || (v11 = v6[6], v11 | (unint64_t)self->_image) && !objc_msgSend((id)v11, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v12 = v6[7];
        if (v12 | (unint64_t)self->_icon)
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
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSString hash](self->_subtitle, "hash") ^ v3;
  v5 = -[NSString hash](self->_action, "hash");
  return v4 ^ v5 ^ -[_BlastDoorLPImage hash](self->_image, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("icon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("action"), CFSTR("kind"), CFSTR("image"), CFSTR("icon"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (_BlastDoorLPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (_BlastDoorLPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
