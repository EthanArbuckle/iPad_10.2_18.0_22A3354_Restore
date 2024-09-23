@implementation IMMessagePartHistoricalContent

- (IMMessagePartHistoricalContent)initWithMessagePartText:(id)a3 dateSent:(id)a4 backwardCompatibleMessageGUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMMessagePartHistoricalContent *v11;
  uint64_t v12;
  NSAttributedString *messagePartText;
  uint64_t v14;
  NSString *backwardCompatibleMessageGUID;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMMessagePartHistoricalContent;
  v11 = -[IMMessagePartHistoricalContent init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    messagePartText = v11->_messagePartText;
    v11->_messagePartText = (NSAttributedString *)v12;

    objc_storeStrong((id *)&v11->_dateSent, a4);
    v14 = objc_msgSend(v10, "copy");
    backwardCompatibleMessageGUID = v11->_backwardCompatibleMessageGUID;
    v11->_backwardCompatibleMessageGUID = (NSString *)v14;

  }
  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IMMessagePartHistoricalContent %p> {date: %@ guid: %@}"), self, self->_dateSent, self->_backwardCompatibleMessageGUID);
}

- (NSAttributedString)messagePartText
{
  return self->_messagePartText;
}

- (void)setMessagePartText:(id)a3
{
  objc_storeStrong((id *)&self->_messagePartText, a3);
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_storeStrong((id *)&self->_dateSent, a3);
}

- (NSString)backwardCompatibleMessageGUID
{
  return self->_backwardCompatibleMessageGUID;
}

- (void)setBackwardCompatibleMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_backwardCompatibleMessageGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backwardCompatibleMessageGUID, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_messagePartText, 0);
}

- (IMMessagePartHistoricalContent)initWithMessageSummaryInfoDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  IMMessagePartHistoricalContent *v8;

  v4 = a3;
  objc_msgSend(v4, "__immphc_attributedStringForKey:", CFSTR("t"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__immphc_dateForKey:", CFSTR("d"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringForKey:", CFSTR("bcg"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IMMessagePartHistoricalContent initWithMessagePartText:dateSent:backwardCompatibleMessageGUID:](self, "initWithMessagePartText:dateSent:backwardCompatibleMessageGUID:", v5, v6, v7);
  return v8;
}

- (id)messageSummaryInfoDictionaryRepresentation
{
  id v3;
  void *v4;
  NSAttributedString *messagePartText;
  NSDate *dateSent;
  NSString *backwardCompatibleMessageGUID;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  messagePartText = self->_messagePartText;
  if (messagePartText)
    objc_msgSend(v3, "__immphc_setAttributedString:forKey:", messagePartText, CFSTR("t"));
  dateSent = self->_dateSent;
  if (dateSent)
    objc_msgSend(v4, "__immphc_setDate:forKey:", dateSent, CFSTR("d"));
  backwardCompatibleMessageGUID = self->_backwardCompatibleMessageGUID;
  if (backwardCompatibleMessageGUID)
    objc_msgSend(v4, "setObject:forKey:", backwardCompatibleMessageGUID, CFSTR("bcg"));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (id)copyWithUpdatedMessagePartText:(id)a3
{
  id v4;
  IMMessagePartHistoricalContent *v5;

  v4 = a3;
  v5 = -[IMMessagePartHistoricalContent initWithMessagePartText:dateSent:backwardCompatibleMessageGUID:]([IMMessagePartHistoricalContent alloc], "initWithMessagePartText:dateSent:backwardCompatibleMessageGUID:", v4, self->_dateSent, self->_backwardCompatibleMessageGUID);

  return v5;
}

@end
