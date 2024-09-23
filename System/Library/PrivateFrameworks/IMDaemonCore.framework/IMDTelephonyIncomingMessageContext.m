@implementation IMDTelephonyIncomingMessageContext

- (id)copyWithZone:(_NSZone *)a3
{
  IMDTelephonyIncomingMessageContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = objc_alloc_init(IMDTelephonyIncomingMessageContext);
  -[IMDTelephonyIncomingMessageContext setCategory:](v4, "setCategory:", -[IMDTelephonyIncomingMessageContext category](self, "category"));
  -[IMDTelephonyIncomingMessageContext setSubCategory:](v4, "setSubCategory:", -[IMDTelephonyIncomingMessageContext subCategory](self, "subCategory"));
  -[IMDTelephonyIncomingMessageContext spamExtensionName](self, "spamExtensionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setSpamExtensionName:](v4, "setSpamExtensionName:", v5);

  -[IMDTelephonyIncomingMessageContext setIsSendEnabled:](v4, "setIsSendEnabled:", -[IMDTelephonyIncomingMessageContext isSendEnabled](self, "isSendEnabled"));
  -[IMDTelephonyIncomingMessageContext setCapability:](v4, "setCapability:", -[IMDTelephonyIncomingMessageContext capability](self, "capability"));
  -[IMDTelephonyIncomingMessageContext originalAlias](self, "originalAlias");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setOriginalAlias:](v4, "setOriginalAlias:", v6);

  -[IMDTelephonyIncomingMessageContext chatIdentifier](self, "chatIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setChatIdentifier:](v4, "setChatIdentifier:", v7);

  -[IMDTelephonyIncomingMessageContext mySIMIDString](self, "mySIMIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setMySIMIDString:](v4, "setMySIMIDString:", v8);

  -[IMDTelephonyIncomingMessageContext myNumberString](self, "myNumberString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setMyNumberString:](v4, "setMyNumberString:", v9);

  -[IMDTelephonyIncomingMessageContext sender](self, "sender");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setSender:](v4, "setSender:", v10);

  -[IMDTelephonyIncomingMessageContext senderUnformatted](self, "senderUnformatted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setSenderUnformatted:](v4, "setSenderUnformatted:", v11);

  -[IMDTelephonyIncomingMessageContext countryCode](self, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setCountryCode:](v4, "setCountryCode:", v12);

  -[IMDTelephonyIncomingMessageContext participants](self, "participants");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  -[IMDTelephonyIncomingMessageContext setParticipants:](v4, "setParticipants:", v14);

  -[IMDTelephonyIncomingMessageContext unformattedIDs](self, "unformattedIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  -[IMDTelephonyIncomingMessageContext setUnformattedIDs:](v4, "setUnformattedIDs:", v16);

  -[IMDTelephonyIncomingMessageContext countryCodes](self, "countryCodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  -[IMDTelephonyIncomingMessageContext setCountryCodes:](v4, "setCountryCodes:", v18);

  -[IMDTelephonyIncomingMessageContext setStyle:](v4, "setStyle:", -[IMDTelephonyIncomingMessageContext style](self, "style"));
  -[IMDTelephonyIncomingMessageContext setWasRelayed:](v4, "setWasRelayed:", -[IMDTelephonyIncomingMessageContext wasRelayed](self, "wasRelayed"));
  -[IMDTelephonyIncomingMessageContext groupID](self, "groupID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setGroupID:](v4, "setGroupID:", v19);

  -[IMDTelephonyIncomingMessageContext originalGroupID](self, "originalGroupID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setOriginalGroupID:](v4, "setOriginalGroupID:", v20);

  -[IMDTelephonyIncomingMessageContext displayName](self, "displayName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext setDisplayName:](v4, "setDisplayName:", v21);

  return v4;
}

- (BOOL)isGroupMessagingEnabled
{
  void *v4;
  void *v5;
  void *v6;

  if (-[IMDTelephonyIncomingMessageContext wasRelayed](self, "wasRelayed"))
    return 1;
  v4 = (void *)MEMORY[0x1E0D39730];
  -[IMDTelephonyIncomingMessageContext myNumberString](self, "myNumberString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDTelephonyIncomingMessageContext mySIMIDString](self, "mySIMIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:", v5, v6);

  return (char)v4;
}

- (BOOL)isGroupChat
{
  void *v3;
  BOOL v4;

  -[IMDTelephonyIncomingMessageContext participants](self, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") >= 2
    && -[IMDTelephonyIncomingMessageContext isGroupMessagingEnabled](self, "isGroupMessagingEnabled");

  return v4;
}

- (NSString)destinationCallerID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[IMDTelephonyIncomingMessageContext myNumberString](self, "myNumberString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[IMDTelephonyIncomingMessageContext mySIMIDString](self, "mySIMIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)replaceParticipants:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[IMDTelephonyIncomingMessageContext setParticipants:](self, "setParticipants:", v4);

}

- (void)replaceUnformattedIDs:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[IMDTelephonyIncomingMessageContext setUnformattedIDs:](self, "setUnformattedIDs:", v4);

}

- (void)replaceCountryCodes:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[IMDTelephonyIncomingMessageContext setCountryCodes:](self, "setCountryCodes:", v4);

}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (int64_t)subCategory
{
  return self->_subCategory;
}

- (void)setSubCategory:(int64_t)a3
{
  self->_subCategory = a3;
}

- (NSString)spamExtensionName
{
  return self->_spamExtensionName;
}

- (void)setSpamExtensionName:(id)a3
{
  objc_storeStrong((id *)&self->_spamExtensionName, a3);
}

- (BOOL)isSendEnabled
{
  return self->_isSendEnabled;
}

- (void)setIsSendEnabled:(BOOL)a3
{
  self->_isSendEnabled = a3;
}

- (int64_t)capability
{
  return self->_capability;
}

- (void)setCapability:(int64_t)a3
{
  self->_capability = a3;
}

- (NSString)originalAlias
{
  return self->_originalAlias;
}

- (void)setOriginalAlias:(id)a3
{
  objc_storeStrong((id *)&self->_originalAlias, a3);
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void)setChatIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_chatIdentifier, a3);
}

- (NSString)mySIMIDString
{
  return self->_mySIMIDString;
}

- (void)setMySIMIDString:(id)a3
{
  objc_storeStrong((id *)&self->_mySIMIDString, a3);
}

- (NSString)myNumberString
{
  return self->_myNumberString;
}

- (void)setMyNumberString:(id)a3
{
  objc_storeStrong((id *)&self->_myNumberString, a3);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSString)senderUnformatted
{
  return self->_senderUnformatted;
}

- (void)setSenderUnformatted:(id)a3
{
  objc_storeStrong((id *)&self->_senderUnformatted, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSMutableArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSMutableArray)unformattedIDs
{
  return self->_unformattedIDs;
}

- (void)setUnformattedIDs:(id)a3
{
  objc_storeStrong((id *)&self->_unformattedIDs, a3);
}

- (NSMutableArray)countryCodes
{
  return self->_countryCodes;
}

- (void)setCountryCodes:(id)a3
{
  objc_storeStrong((id *)&self->_countryCodes, a3);
}

- (unsigned)style
{
  return self->_style;
}

- (void)setStyle:(unsigned __int8)a3
{
  self->_style = a3;
}

- (BOOL)wasRelayed
{
  return self->_wasRelayed;
}

- (void)setWasRelayed:(BOOL)a3
{
  self->_wasRelayed = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)originalGroupID
{
  return self->_originalGroupID;
}

- (void)setOriginalGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_originalGroupID, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_countryCodes, 0);
  objc_storeStrong((id *)&self->_unformattedIDs, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_senderUnformatted, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_myNumberString, 0);
  objc_storeStrong((id *)&self->_mySIMIDString, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_originalAlias, 0);
  objc_storeStrong((id *)&self->_spamExtensionName, 0);
}

@end
