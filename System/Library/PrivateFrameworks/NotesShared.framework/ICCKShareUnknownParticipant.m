@implementation ICCKShareUnknownParticipant

- (ICCKShareUnknownParticipant)initWithParticipantUserID:(id)a3
{
  id v5;
  ICCKShareUnknownParticipant *v6;
  ICCKShareUnknownParticipant *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCKShareUnknownParticipant;
  v6 = -[ICCKShareUnknownParticipant init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_participantUserID, a3);

  return v7;
}

- (NSString)displayName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Somebody"), CFSTR("Somebody"), 0, 1);
}

- (NSString)participantUserID
{
  return self->_participantUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantUserID, 0);
}

@end
