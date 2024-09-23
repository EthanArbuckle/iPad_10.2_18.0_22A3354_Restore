@implementation _BlastDoorLPAppleNewsMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPAppleNewsMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPAppleNewsMetadata *v5;
  uint64_t v6;
  NSString *source;
  uint64_t v8;
  NSString *title;
  _BlastDoorLPAppleNewsMetadata *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPAppleNewsMetadata;
  v5 = -[_BlastDoorLPAppleNewsMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("source"));
    v6 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)_BlastDoorLPAppleNewsMetadata;
  v4 = a3;
  -[_BlastDoorLPSpecializationMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v4, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, CFSTR("title"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPAppleNewsMetadata *v4;
  void *v5;
  void *v6;
  _BlastDoorLPAppleNewsMetadata *v7;

  v4 = +[_BlastDoorLPAppleNewsMetadata allocWithZone:](_BlastDoorLPAppleNewsMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPAppleNewsMetadata source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleNewsMetadata setSource:](v4, "setSource:", v5);

    -[_BlastDoorLPAppleNewsMetadata title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPAppleNewsMetadata setTitle:](v4, "setTitle:", v6);

    v7 = v4;
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
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPAppleNewsMetadata;
  if (-[_BlastDoorLPAppleNewsMetadata isEqual:](&v10, sel_isEqual_, v4))
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
      if (v7 | (unint64_t)self->_source && !objc_msgSend((id)v7, "isEqual:"))
      {
        v5 = 0;
      }
      else
      {
        v8 = v6[3];
        if (v8 | (unint64_t)self->_title)
          v5 = objc_msgSend((id)v8, "isEqual:");
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

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("source"), CFSTR("title"), 0);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
