@implementation _BlastDoorLPSharedObjectMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPSharedObjectMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPSharedObjectMetadata *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *information;
  void *v14;
  uint64_t v15;
  id v16;
  _BlastDoorLPImage *icon;
  _BlastDoorLPSharedObjectMetadata *v18;
  id v20;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_BlastDoorLPSharedObjectMetadata;
  v5 = -[_BlastDoorLPSharedObjectMetadata init](&v21, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)&v5->_isCollaboration;
    *(_QWORD *)&v5->_isCollaboration = v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("information"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v12 = objc_claimAutoreleasedReturnValue();
    information = v5->_information;
    v5->_information = (NSString *)v12;

    *(&v5->super.__dummyPropertyForObservation + 1) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCollaboration"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("specialization")))
    {
      allKnownSpecializationClasses();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      objc_msgSend(v4, "_bd_lp_strictlyDecodeTopLevelObjectOfClasses:forKey:error:", v14, CFSTR("specialization"), &v20);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v20;
      icon = v5->_icon;
      v5->_icon = (_BlastDoorLPImage *)v15;

    }
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&self->_isCollaboration;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("title"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, CFSTR("subtitle"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_subtitle, CFSTR("information"));
  objc_msgSend(v5, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1), CFSTR("isCollaboration"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_information, CFSTR("icon"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("specialization"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPSharedObjectMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BlastDoorLPSharedObjectMetadata *v10;

  v4 = +[_BlastDoorLPSharedObjectMetadata allocWithZone:](_BlastDoorLPSharedObjectMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPSharedObjectMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPSharedObjectMetadata setTitle:](v4, "setTitle:", v5);

    -[_BlastDoorLPSharedObjectMetadata subtitle](self, "subtitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPSharedObjectMetadata setSubtitle:](v4, "setSubtitle:", v6);

    -[_BlastDoorLPSharedObjectMetadata information](self, "information");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPSharedObjectMetadata setInformation:](v4, "setInformation:", v7);

    -[_BlastDoorLPSharedObjectMetadata setIsCollaboration:](v4, "setIsCollaboration:", -[_BlastDoorLPSharedObjectMetadata isCollaboration](self, "isCollaboration"));
    -[_BlastDoorLPSharedObjectMetadata icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPSharedObjectMetadata setIcon:](v4, "setIcon:", v8);

    -[_BlastDoorLPSharedObjectMetadata specialization](self, "specialization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPSharedObjectMetadata setSpecialization:](v4, "setSpecialization:", v9);

    v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  unsigned __int8 *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSString *title;
  uint64_t v12;
  void *v13;
  int v14;
  NSString *subtitle;
  uint64_t v16;
  void *v17;
  int v18;
  NSString *information;
  uint64_t v20;
  void *v21;
  int v22;
  _BlastDoorLPImage *icon;
  uint64_t v24;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_BlastDoorLPSharedObjectMetadata;
  if (-[_BlastDoorLPSharedObjectMetadata isEqual:](&v26, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (unsigned __int8 *)v4;
      v7 = *(_QWORD *)&self->_isCollaboration;
      objc_msgSend(v6, "title");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 | v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend((id)v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_16;
      }
      title = self->_title;
      objc_msgSend(v6, "subtitle");
      v12 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)title | v12)
      {
        v13 = (void *)v12;
        v14 = -[NSString isEqual:](title, "isEqual:", v12);

        if (!v14)
          goto LABEL_16;
      }
      subtitle = self->_subtitle;
      objc_msgSend(v6, "information");
      v16 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)subtitle | v16)
      {
        v17 = (void *)v16;
        v18 = -[NSString isEqual:](subtitle, "isEqual:", v16);

        if (!v18)
          goto LABEL_16;
      }
      if (v6[9] == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1)
        && ((information = self->_information,
             objc_msgSend(v6, "icon"),
             v20 = objc_claimAutoreleasedReturnValue(),
             !((unint64_t)information | v20))
         || (v21 = (void *)v20, v22 = -[NSString isEqual:](information, "isEqual:", v20), v21, v22)))
      {
        icon = self->_icon;
        objc_msgSend(v6, "specialization");
        v24 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)icon | v24)
          v5 = -[_BlastDoorLPImage isEqual:](icon, "isEqual:", v24);
        else
          v5 = 1;

      }
      else
      {
LABEL_16:
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

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), CFSTR("information"), CFSTR("icon"), CFSTR("isCollaboration"), CFSTR("specialization"), 0);
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("icon"));
}

- (NSString)title
{
  return *(NSString **)&self->_isCollaboration;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_title;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)information
{
  return self->_subtitle;
}

- (void)setInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_BlastDoorLPImage)icon
{
  return (_BlastDoorLPImage *)self->_information;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_information, a3);
}

- (BOOL)isCollaboration
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setIsCollaboration:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (_BlastDoorLPSpecializationMetadata)specialization
{
  return (_BlastDoorLPSpecializationMetadata *)self->_icon;
}

- (void)setSpecialization:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_isCollaboration, 0);
}

@end
