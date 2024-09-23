@implementation CKSpotlightSearchResult

- (CKSpotlightSearchResult)initWithMessageGUID:(id)a3 chatGUID:(id)a4 messageTime:(id)a5 summery:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKSpotlightSearchResult *v14;
  CKSpotlightSearchResult *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKSpotlightSearchResult;
  v14 = -[CKSpotlightSearchResult init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[CKSpotlightSearchResult setSummary:](v14, "setSummary:", v13);
    -[CKSpotlightSearchResult setMessageDate:](v15, "setMessageDate:", v12);
    -[CKSpotlightSearchResult setMessageGUID:](v15, "setMessageGUID:", v10);
    -[CKSpotlightSearchResult setChatGUID:](v15, "setChatGUID:", v11);
  }

  return v15;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[CKSpotlightSearchResult messageDate](self, "messageDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "messageDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[CKSpotlightSearchResult messageDate](self, "messageDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)messageDate
{
  return self->_messageDate;
}

- (void)setMessageDate:(id)a3
{
  objc_storeStrong((id *)&self->_messageDate, a3);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_messageDate, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
}

@end
