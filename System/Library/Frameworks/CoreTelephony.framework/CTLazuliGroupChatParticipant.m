@implementation CTLazuliGroupChatParticipant

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliGroupChatParticipant member](self, "member");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", member = %@"), v4);

  v5 = -[CTLazuliGroupChatParticipant role](self, "role");
  v7 = -[CTLazuliGroupChatParticipant role](self, "role");
  objc_msgSend(v3, "appendFormat:", CFSTR(", role = [%ld - %s]"), v5, print_CTLazuliGroupChatParticipantRoleType(&v7));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatParticipant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  -[CTLazuliGroupChatParticipant member](self, "member");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "member");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = -[CTLazuliGroupChatParticipant role](self, "role");
    v8 = v7 == objc_msgSend(v4, "role");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliGroupChatParticipant *v4;
  CTLazuliGroupChatParticipant *v5;
  BOOL v6;

  v4 = (CTLazuliGroupChatParticipant *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliGroupChatParticipant isEqualToCTLazuliGroupChatParticipant:](self, "isEqualToCTLazuliGroupChatParticipant:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliGroupChatParticipant *v4;

  v4 = +[CTLazuliGroupChatParticipant allocWithZone:](CTLazuliGroupChatParticipant, "allocWithZone:", a3);
  -[CTLazuliGroupChatParticipant setMember:](v4, "setMember:", self->_member);
  -[CTLazuliGroupChatParticipant setRole:](v4, "setRole:", self->_role);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_member, CFSTR("kMemberKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_role);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kRoleKey"));

}

- (CTLazuliGroupChatParticipant)initWithCoder:(id)a3
{
  id v4;
  CTLazuliGroupChatParticipant *v5;
  uint64_t v6;
  NSString *member;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliGroupChatParticipant;
  v5 = -[CTLazuliGroupChatParticipant init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMemberKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    member = v5->_member;
    v5->_member = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRoleKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_role = objc_msgSend(v8, "longValue");

  }
  return v5;
}

- (CTLazuliGroupChatParticipant)initWithReflection:(const void *)a3
{
  CTLazuliGroupChatParticipant *v4;
  const void *v5;
  uint64_t v6;
  NSString *member;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CTLazuliGroupChatParticipant;
  v4 = -[CTLazuliGroupChatParticipant init](&v9, sel_init);
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0)
      v5 = a3;
    else
      v5 = *(const void **)a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    member = v4->_member;
    v4->_member = (NSString *)v6;

    v4->_role = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 6);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)member
{
  return self->_member;
}

- (void)setMember:(id)a3
{
  objc_storeStrong((id *)&self->_member, a3);
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member, 0);
}

@end
