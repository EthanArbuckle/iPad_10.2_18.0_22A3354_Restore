@implementation IMAssistantHandleFromContact

- (id)_initWithPhoneNumber:(id)a3 emailAddress:(id)a4 businessID:(id)a5 handleType:(int64_t)a6 contact:(id)a7
{
  id v13;
  id v14;
  IMAssistantHandleFromContact *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSString *handleID;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  IMAssistantHandleFromContact *v23;
  id v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v26 = a4;
  v13 = a5;
  v14 = a7;
  v27.receiver = self;
  v27.super_class = (Class)IMAssistantHandleFromContact;
  v15 = -[IMAssistantHandleFromContact init](&v27, sel_init);
  if (!v15)
  {
LABEL_17:
    v23 = 0;
    goto LABEL_18;
  }
  switch(a6)
  {
    case 0:
    case 4:
      if (!IMOSLoggingEnabled())
        goto LABEL_17;
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v29 = a6;
        _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Initialized IMAssistantHandleFromContact with an unrecognized handle type %ld, returning nil", buf, 0xCu);
      }
      goto LABEL_16;
    case 1:
      objc_msgSend(v25, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringValue");
      v18 = objc_claimAutoreleasedReturnValue();
      handleID = v15->_handleID;
      v15->_handleID = (NSString *)v18;

      v20 = 2;
      goto LABEL_10;
    case 2:
      objc_msgSend(v26, "value");
      v21 = objc_claimAutoreleasedReturnValue();
      v17 = v15->_handleID;
      v15->_handleID = (NSString *)v21;
      v20 = 1;
      goto LABEL_10;
    case 3:
      v22 = (NSString *)v13;
      v20 = 0;
      v17 = v15->_handleID;
      v15->_handleID = v22;
LABEL_10:

      v15->_personHandleType = v20;
      break;
    default:
      break;
  }
  if (!-[NSString length](v15->_handleID, "length", v25))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Can't initalize IMAssistantHandleFromContact with an empty handle", buf, 2u);
      }
LABEL_16:

    }
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v15->_contact, a7);
  objc_storeStrong((id *)&v15->_labeledPhoneNumber, a3);
  objc_storeStrong((id *)&v15->_labeledEmailAddress, a4);
  objc_storeStrong((id *)&v15->_businessID, a5);
  v15->_handleType = a6;
  v23 = v15;
LABEL_18:

  return v23;
}

- (IMAssistantHandleFromContact)initWithCNLabeledPhoneNumber:(id)a3 contact:(id)a4
{
  return (IMAssistantHandleFromContact *)MEMORY[0x24BEDD108](self, sel__initWithPhoneNumber_emailAddress_businessID_handleType_contact_);
}

- (IMAssistantHandleFromContact)initWithCNLabeledEmailAddress:(id)a3 contact:(id)a4
{
  return (IMAssistantHandleFromContact *)MEMORY[0x24BEDD108](self, sel__initWithPhoneNumber_emailAddress_businessID_handleType_contact_);
}

- (IMAssistantHandleFromContact)initWithBusinessID:(id)a3
{
  return (IMAssistantHandleFromContact *)MEMORY[0x24BEDD108](self, sel__initWithPhoneNumber_emailAddress_businessID_handleType_contact_);
}

- (NSString)personHandleLabel
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[IMAssistantHandleFromContact handleType](self, "handleType");
  if (v3 == 2)
  {
    -[IMAssistantHandleFromContact labeledEmailAddress](self, "labeledEmailAddress");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 1)
    {
      v6 = 0;
      return (NSString *)v6;
    }
    -[IMAssistantHandleFromContact labeledPhoneNumber](self, "labeledPhoneNumber");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (v4)
  {
    INPersonHandleLabelForCNLabeledValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (BOOL)matchesHandleID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x24BDD9F38], "__im_assistant_handleTypeForString:", v4);
  if (-[IMAssistantHandleFromContact handleType](self, "handleType") == v5)
  {
    -[IMAssistantHandleFromContact handleID](self, "handleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 3)
    {
      v11 = objc_msgSend(v6, "isEqualToString:", v4);
    }
    else
    {
      if (v5 == 2)
      {
        IMNormalizeFormattedString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        IMNormalizeFormattedString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);
      }
      else
      {
        if (v5 != 1)
        {
          v11 = 0;
          goto LABEL_11;
        }
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v6);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v4);
        v10 = objc_msgSend(v8, "isLikePhoneNumber:", v9);
      }
      v11 = v10;

    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)matchesIMHandle:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "normalizedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[IMAssistantHandleFromContact matchesHandleID:](self, "matchesHandleID:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)description
{
  unint64_t v3;
  void *v4;

  v3 = -[IMAssistantHandleFromContact handleType](self, "handleType") - 1;
  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", off_24E396308[v3], self, *(Class *)((char *)&self->super.isa + qword_21EDBD7F0[v3]), self->_contact);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNLabeledValue)labeledEmailAddress
{
  return self->_labeledEmailAddress;
}

- (CNLabeledValue)labeledPhoneNumber
{
  return self->_labeledPhoneNumber;
}

- (NSString)businessID
{
  return self->_businessID;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (NSString)displayID
{
  return self->_displayID;
}

- (int64_t)personHandleType
{
  return self->_personHandleType;
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_handleID, 0);
  objc_storeStrong((id *)&self->_businessID, 0);
  objc_storeStrong((id *)&self->_labeledPhoneNumber, 0);
  objc_storeStrong((id *)&self->_labeledEmailAddress, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
