@implementation EDAMIdentity

+ (id)structName
{
  return CFSTR("Identity");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[9];

  v14[8] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1002;
  if (!structFields_structFields_1002)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 0, CFSTR("id"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 2, 12, 1, CFSTR("contact"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 8, 1, CFSTR("userId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 2, 1, CFSTR("deactivated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 1, CFSTR("sameBusiness"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 1, CFSTR("blocked"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[5] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 1, CFSTR("userConnected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[6] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 10, 1, CFSTR("eventId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[7] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)structFields_structFields_1002;
    structFields_structFields_1002 = v11;

    v2 = (void *)structFields_structFields_1002;
  }
  return v2;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (EDAMContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSNumber)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSNumber)deactivated
{
  return self->_deactivated;
}

- (void)setDeactivated:(id)a3
{
  objc_storeStrong((id *)&self->_deactivated, a3);
}

- (NSNumber)sameBusiness
{
  return self->_sameBusiness;
}

- (void)setSameBusiness:(id)a3
{
  objc_storeStrong((id *)&self->_sameBusiness, a3);
}

- (NSNumber)blocked
{
  return self->_blocked;
}

- (void)setBlocked:(id)a3
{
  objc_storeStrong((id *)&self->_blocked, a3);
}

- (NSNumber)userConnected
{
  return self->_userConnected;
}

- (void)setUserConnected:(id)a3
{
  objc_storeStrong((id *)&self->_userConnected, a3);
}

- (NSNumber)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_userConnected, 0);
  objc_storeStrong((id *)&self->_blocked, 0);
  objc_storeStrong((id *)&self->_sameBusiness, 0);
  objc_storeStrong((id *)&self->_deactivated, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
