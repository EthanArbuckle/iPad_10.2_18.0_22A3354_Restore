@implementation _BlastDoorLPFaceTimeInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPFaceTimeInviteMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPFaceTimeInviteMetadata *v5;
  uint64_t v6;
  NSString *title;
  _BlastDoorLPFaceTimeInviteMetadata *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPFaceTimeInviteMetadata;
  v5 = -[_BlastDoorLPFaceTimeInviteMetadata init](&v10, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_title, CFSTR("title"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPFaceTimeInviteMetadata *v4;
  void *v5;
  _BlastDoorLPFaceTimeInviteMetadata *v6;

  v4 = +[_BlastDoorLPFaceTimeInviteMetadata allocWithZone:](_BlastDoorLPFaceTimeInviteMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPFaceTimeInviteMetadata title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPFaceTimeInviteMetadata setTitle:](v4, "setTitle:", v5);

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
  v8.super_class = (Class)_BlastDoorLPFaceTimeInviteMetadata;
  if (-[_BlastDoorLPFaceTimeInviteMetadata isEqual:](&v8, sel_isEqual_, v4))
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  v5 = v4[2];
  if (!(v5 | (unint64_t)self->_title))
LABEL_5:
    v6 = 1;
  else
    v6 = objc_msgSend((id)v5, "isEqual:");
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
