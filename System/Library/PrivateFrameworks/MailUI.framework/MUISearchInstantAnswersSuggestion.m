@implementation MUISearchInstantAnswersSuggestion

- (MUISearchInstantAnswersSuggestion)initWithInstantAnswer:(id)a3
{
  id v4;
  MUISearchInstantAnswersSuggestion *v5;
  MUISearchInstantAnswer *v6;
  MUISearchInstantAnswer *instantAnswer;
  MUISearchInstantAnswersSuggestion *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUISearchInstantAnswersSuggestion;
  v5 = -[MUISearchInstantAnswersSuggestion init](&v10, sel_init);
  if (!v5)
    goto LABEL_8;
  if (objc_msgSend(v4, "instantAnswersKind"))
  {
    if (objc_msgSend(v4, "instantAnswersKind") != 1)
      goto LABEL_7;
    v6 = -[MUISearchInstantAnswer initHotelAnswerWithCSInstantAnswer:]([MUISearchInstantAnswer alloc], "initHotelAnswerWithCSInstantAnswer:", v4);
  }
  else
  {
    v6 = -[MUISearchInstantAnswer initFlightAnswerWithCSInstantAnswer:]([MUISearchInstantAnswer alloc], "initFlightAnswerWithCSInstantAnswer:", v4);
  }
  instantAnswer = v5->_instantAnswer;
  v5->_instantAnswer = v6;

LABEL_7:
  if (!v5->_instantAnswer)
  {
    v8 = 0;
    goto LABEL_10;
  }
LABEL_8:
  v8 = v5;
LABEL_10:

  return v8;
}

- (MUISearchInstantAnswersSuggestion)initWithMessageList:(id)a3 itemID:(id)a4 instantAnswer:(id)a5
{
  id v9;
  id v10;
  id v11;
  MUISearchInstantAnswersSuggestion *v12;
  MUISearchInstantAnswersSuggestion *v13;
  MUISearchInstantAnswer *v14;
  MUISearchInstantAnswer *instantAnswer;
  MUISearchInstantAnswersSuggestion *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MUISearchInstantAnswersSuggestion;
  v12 = -[MUISearchInstantAnswersSuggestion init](&v18, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_9;
  objc_storeStrong((id *)&v12->_messageList, a3);
  objc_storeStrong((id *)&v13->_itemID, a4);
  if (!objc_msgSend(v11, "instantAnswersKind"))
  {
    v14 = -[MUISearchInstantAnswer initFlightAnswerWithCSInstantAnswer:]([MUISearchInstantAnswer alloc], "initFlightAnswerWithCSInstantAnswer:", v11);
    goto LABEL_6;
  }
  if (objc_msgSend(v11, "instantAnswersKind") == 1)
  {
    v14 = -[MUISearchInstantAnswer initHotelAnswerWithCSInstantAnswer:]([MUISearchInstantAnswer alloc], "initHotelAnswerWithCSInstantAnswer:", v11);
LABEL_6:
    instantAnswer = v13->_instantAnswer;
    v13->_instantAnswer = v14;

  }
  if (!v13->_instantAnswer)
  {
    v16 = 0;
    goto LABEL_11;
  }
  -[MUISearchInstantAnswersSuggestion populateInlineCard](v13, "populateInlineCard");
LABEL_9:
  v16 = v13;
LABEL_11:

  return v16;
}

- (id)category
{
  return +[MUISearchSuggestionCategory instantAnswersCategory](MUISearchSuggestionCategory, "instantAnswersCategory");
}

- (id)_conversationID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[MUISearchInstantAnswersSuggestion message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "conversationID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (EMMessage)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MUISearchInstantAnswersSuggestion messageList](self, "messageList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUISearchInstantAnswersSuggestion itemID](self, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageListItemForItemID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMMessage *)v6;
}

- (void)populateInlineCard
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  int64_t v11;
  MUISearchInstantAnswer *instantAnswer;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  SFCard *feedbackInlineCard;
  _QWORD v20[2];
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D8C210]);
  v4 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  -[MUISearchInstantAnswer bodyCardSectionID](self->_instantAnswer, "bodyCardSectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardSectionId:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0D8C820]);
  objc_msgSend(v4, "setCommand:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0D8C1E8]);
  -[MUISearchInstantAnswer buttonsCardSectionID](self->_instantAnswer, "buttonsCardSectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCardSectionId:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0D8C2A0]);
  v10 = objc_alloc_init(MEMORY[0x1E0D8C820]);
  objc_msgSend(v9, "setCommand:", v10);

  objc_msgSend(v9, "setUniqueId:", 1);
  v11 = -[MUISearchInstantAnswer instantAnswersKind](self->_instantAnswer, "instantAnswersKind");
  instantAnswer = self->_instantAnswer;
  if (!v11)
  {
    -[MUISearchInstantAnswer flightCheckInUrl](instantAnswer, "flightCheckInUrl");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

LABEL_7:
      v14 = objc_alloc_init(MEMORY[0x1E0D8C2A0]);
      v16 = objc_alloc_init(MEMORY[0x1E0D8C4C8]);
      objc_msgSend(v14, "setCommand:", v16);

      objc_msgSend(v14, "setUniqueId:", 2);
      v22[0] = v9;
      v22[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setButtons:", v17);

      goto LABEL_8;
    }
    instantAnswer = self->_instantAnswer;
  }
  if (-[MUISearchInstantAnswer instantAnswersKind](instantAnswer, "instantAnswersKind") == 1)
  {
    -[MUISearchInstantAnswer hotelReservationForAddress](self->_instantAnswer, "hotelReservationForAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_7;
  }
  v21 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setButtons:", v14);
LABEL_8:

  v20[0] = v4;
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCardSections:", v18);

  feedbackInlineCard = self->_feedbackInlineCard;
  self->_feedbackInlineCard = (SFCard *)v3;

}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (MUISearchInstantAnswer)instantAnswer
{
  return self->_instantAnswer;
}

- (SFCard)feedbackInlineCard
{
  return self->_feedbackInlineCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackInlineCard, 0);
  objc_storeStrong((id *)&self->_instantAnswer, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
}

@end
