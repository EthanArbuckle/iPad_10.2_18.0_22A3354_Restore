@implementation _BlastDoorLPPasswordsInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPPasswordsInviteMetadata)initWithCoder:(id)a3
{
  id v4;
  _BlastDoorLPPasswordsInviteMetadata *v5;
  uint64_t v6;
  NSString *groupName;
  uint64_t v8;
  NSString *urlParameters;
  _BlastDoorLPPasswordsInviteMetadata *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPPasswordsInviteMetadata;
  v5 = -[_BlastDoorLPPasswordsInviteMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("groupName"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("urlParameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    urlParameters = v5->_urlParameters;
    v5->_urlParameters = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *groupName;
  id v5;

  groupName = self->_groupName;
  v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", groupName, CFSTR("groupName"));
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_urlParameters, CFSTR("urlParameters"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPPasswordsInviteMetadata *v4;
  void *v5;
  void *v6;
  _BlastDoorLPPasswordsInviteMetadata *v7;

  v4 = +[_BlastDoorLPPasswordsInviteMetadata allocWithZone:](_BlastDoorLPPasswordsInviteMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPPasswordsInviteMetadata groupName](self, "groupName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPPasswordsInviteMetadata setGroupName:](v4, "setGroupName:", v5);

    -[_BlastDoorLPPasswordsInviteMetadata urlParameters](self, "urlParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPPasswordsInviteMetadata setUrlParameters:](v4, "setUrlParameters:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  id v6;
  NSString *groupName;
  uint64_t v8;
  void *v9;
  int v10;
  NSString *urlParameters;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPPasswordsInviteMetadata;
  if (-[_BlastDoorLPPasswordsInviteMetadata isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      groupName = self->_groupName;
      objc_msgSend(v6, "groupName");
      v8 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)groupName | v8
        && (v9 = (void *)v8, v10 = -[NSString isEqual:](groupName, "isEqual:", v8), v9, !v10))
      {
        v5 = 0;
      }
      else
      {
        urlParameters = self->_urlParameters;
        objc_msgSend(v6, "urlParameters");
        v12 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)urlParameters | v12)
          v5 = -[NSString isEqual:](urlParameters, "isEqual:", v12);
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

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)urlParameters
{
  return self->_urlParameters;
}

- (void)setUrlParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlParameters, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

@end
