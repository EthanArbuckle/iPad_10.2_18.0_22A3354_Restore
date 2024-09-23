@implementation IMClarityDetailedTranscriptChatItemRules

- (id)chatItemForIMChatItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IMClarityDetailedTranscriptChatItemRules;
    -[IMClarityTranscriptChatItemRules chatItemForIMChatItem:](&v8, sel_chatItemForIMChatItem_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)_shouldAppendDateForItem:(id)a3 previousItem:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4)
  {
    v7 = a3;
    objc_msgSend(a4, "time");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "time");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v7) = 1;
    if (v5 && v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "components:fromDate:", 30, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "components:fromDate:", 30, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v9, "isEqual:", v10) ^ 1;

    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return (char)v7;
}

@end
