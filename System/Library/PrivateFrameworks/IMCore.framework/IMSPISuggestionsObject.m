@implementation IMSPISuggestionsObject

- (IMSPISuggestionsObject)initWithChatGuid:(id)a3 displayName:(id)a4 participants:(id)a5
{
  id v9;
  id v10;
  id v11;
  IMSPISuggestionsObject *v12;
  IMSPISuggestionsObject *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMSPISuggestionsObject;
  v12 = -[IMSPISuggestionsObject init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_chatGUID, a3);
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v13->_participants, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMSPISuggestionsObject chatGUID](self, "chatGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPISuggestionsObject displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPISuggestionsObject participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMSPISuggestionsObject: %p [Chat guid: %@ DisplayName: %@ Participants: %@]"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)chatGUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)participants
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
}

@end
