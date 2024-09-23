@implementation CTLazuliGroupChatParticipantList

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliGroupChatParticipantList list](self, "list");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", list = %@"), v4);

  -[CTLazuliGroupChatParticipantList memberList](self, "memberList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", memberList = %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatParticipantList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTLazuliGroupChatParticipantList list](self, "list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "list");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToArray:", v6))
  {
    -[CTLazuliGroupChatParticipantList memberList](self, "memberList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memberList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliGroupChatParticipantList *v4;
  CTLazuliGroupChatParticipantList *v5;
  BOOL v6;

  v4 = (CTLazuliGroupChatParticipantList *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliGroupChatParticipantList isEqualToCTLazuliGroupChatParticipantList:](self, "isEqualToCTLazuliGroupChatParticipantList:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliGroupChatParticipantList *v4;

  v4 = +[CTLazuliGroupChatParticipantList allocWithZone:](CTLazuliGroupChatParticipantList, "allocWithZone:", a3);
  -[CTLazuliGroupChatParticipantList setList:](v4, "setList:", self->_list);
  -[CTLazuliGroupChatParticipantList setMemberList:](v4, "setMemberList:", self->_memberList);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_list, CFSTR("kListKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_memberList, CFSTR("kMemberListKey"));

}

- (CTLazuliGroupChatParticipantList)initWithCoder:(id)a3
{
  id v4;
  CTLazuliGroupChatParticipantList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *list;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *memberList;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliGroupChatParticipantList;
  v5 = -[CTLazuliGroupChatParticipantList init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kListKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    list = v5->_list;
    v5->_list = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kMemberListKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    memberList = v5->_memberList;
    v5->_memberList = (NSArray *)v14;

  }
  return v5;
}

- (CTLazuliGroupChatParticipantList)initWithReflection:(const void *)a3
{
  CTLazuliGroupChatParticipantList *v4;
  id v5;
  uint64_t *v6;
  uint64_t *v7;
  id v8;
  uint64_t *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t i;
  CTLazuliGroupChatParticipant *v14;
  NSArray *memberList;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CTLazuliGroupChatParticipantList;
  v4 = -[CTLazuliGroupChatParticipantList init](&v17, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(uint64_t **)a3;
    v7 = (uint64_t *)*((_QWORD *)a3 + 1);
    if (*(uint64_t **)a3 != v7)
    {
      do
      {
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9 = v6;
        if (*((char *)v6 + 23) < 0)
          v9 = (uint64_t *)*v6;
        v10 = (void *)objc_msgSend(v8, "initWithUTF8String:", v9);
        objc_msgSend(v5, "addObject:", v10);

        v6 += 3;
      }
      while (v6 != v7);
    }
    objc_storeStrong((id *)&v4->_list, v5);
    v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = *((_QWORD *)a3 + 3);
    for (i = *((_QWORD *)a3 + 4); v12 != i; v12 += 32)
    {
      v14 = -[CTLazuliGroupChatParticipant initWithReflection:]([CTLazuliGroupChatParticipant alloc], "initWithReflection:", v12);
      -[NSArray addObject:](v11, "addObject:", v14);

    }
    memberList = v4->_memberList;
    v4->_memberList = v11;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

- (NSArray)memberList
{
  return self->_memberList;
}

- (void)setMemberList:(id)a3
{
  objc_storeStrong((id *)&self->_memberList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberList, 0);
  objc_storeStrong((id *)&self->_list, 0);
}

@end
