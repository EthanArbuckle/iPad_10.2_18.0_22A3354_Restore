@implementation EKSerializableParticipant

+ (id)classesForKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[7];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("name");
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v18[1] = CFSTR("emailAddress");
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v18[2] = CFSTR("phoneNumber");
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v18[3] = CFSTR("url");
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("participantRole");
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  v18[5] = CFSTR("participantStatus");
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  v18[6] = CFSTR("participantType");
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (EKSerializableParticipant)initWithParticipant:(id)a3
{
  id v4;
  EKSerializableParticipant *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKSerializableParticipant;
  v5 = -[EKSerializableParticipant init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableParticipant setName:](v5, "setName:", v6);

    objc_msgSend(v4, "emailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableParticipant setEmailAddress:](v5, "setEmailAddress:", v7);

    objc_msgSend(v4, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableParticipant setPhoneNumber:](v5, "setPhoneNumber:", v8);

    objc_msgSend(v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableParticipant setUrl:](v5, "setUrl:", v9);

    -[EKSerializableParticipant setParticipantRole:](v5, "setParticipantRole:", objc_msgSend(v4, "participantRole"));
    -[EKSerializableParticipant setParticipantStatus:](v5, "setParticipantStatus:", objc_msgSend(v4, "participantStatus"));
    -[EKSerializableParticipant setParticipantType:](v5, "setParticipantType:", objc_msgSend(v4, "participantType"));
  }

  return v5;
}

- (id)createAttendee:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[EKSerializableParticipant phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[EKSerializableParticipant emailAddress](self, "emailAddress"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    -[EKSerializableParticipant name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableParticipant emailAddress](self, "emailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableParticipant phoneNumber](self, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSerializableParticipant url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKAttendee attendeeWithName:emailAddress:phoneNumber:url:](EKAttendee, "attendeeWithName:emailAddress:phoneNumber:url:", v6, v7, v8, v9);
    a3 = (id *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a3, "setParticipantRole:", -[EKSerializableParticipant participantRole](self, "participantRole"));
    objc_msgSend(a3, "setParticipantType:", -[EKSerializableParticipant participantType](self, "participantType"));
    objc_msgSend(a3, "setParticipantStatus:", -[EKSerializableParticipant participantStatus](self, "participantStatus"));
    return a3;
  }
  -[EKSerializableParticipant url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  if (a3)
  {
    v13 = *MEMORY[0x1E0CB2D60];
    v14[0] = CFSTR("Either url, phoneNumber or emailAddress should not be nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (int64_t)participantRole
{
  return self->_participantRole;
}

- (void)setParticipantRole:(int64_t)a3
{
  self->_participantRole = a3;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (void)setParticipantStatus:(int64_t)a3
{
  self->_participantStatus = a3;
}

- (int64_t)participantType
{
  return self->_participantType;
}

- (void)setParticipantType:(int64_t)a3
{
  self->_participantType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
