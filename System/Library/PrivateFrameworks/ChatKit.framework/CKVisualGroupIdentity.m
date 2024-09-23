@implementation CKVisualGroupIdentity

- (id)initGroupWithName:(id)a3 photo:(id)a4 visualContacts:(id)a5 groupParticipantCount:(int64_t)a6
{
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKVisualGroupIdentity;
  v7 = -[CKVisualGroupIdentity initGroupWithName:photo:contacts:](&v11, sel_initGroupWithName_photo_contacts_, a3, a4, a5);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[5];
    v7[5] = v8;

  }
  return v7;
}

- (int64_t)numberOfContacts
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKVisualGroupIdentity;
  return -[CKVisualGroupIdentity numberOfContacts](&v3, sel_numberOfContacts);
}

- (void)updateContacts:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  if (self->_groupParticipantCount)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[CKVisualGroupIdentity updateContacts:].cold.1(v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)CKVisualGroupIdentity;
  -[CKVisualGroupIdentity updateContacts:](&v6, sel_updateContacts_, v4);

}

- (void)updateVisualContacts:(id)a3 groupParticipantCount:(int64_t)a4
{
  NSNumber *v6;
  NSNumber *groupParticipantCount;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKVisualGroupIdentity;
  -[CKVisualGroupIdentity updateContacts:](&v8, sel_updateContacts_, a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  groupParticipantCount = self->_groupParticipantCount;
  self->_groupParticipantCount = v6;

}

- (NSNumber)groupParticipantCount
{
  return self->_groupParticipantCount;
}

- (void)setGroupParticipantCount:(id)a3
{
  objc_storeStrong((id *)&self->_groupParticipantCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupParticipantCount, 0);
}

- (void)updateContacts:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18DFCD000, log, OS_LOG_TYPE_FAULT, "Should not call [CKVisualGroupIdentity updateContacts:] with groupParticipantCount set", v1, 2u);
}

@end
