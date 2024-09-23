@implementation IMMomentShareStatusChatItem

+ (id)_guidForItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)sub_1A2132A84();

  return v4;
}

- (id)_initWithItem:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IMMomentShareStatusChatItem;
  v11 = -[IMChatItem _initWithItem:](&v18, sel__initWithItem_, v8);
  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "_guidForItem:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setGUID:", v12);
    v13 = objc_msgSend(v9, "copy");
    v14 = (void *)v11[7];
    v11[7] = v13;

    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)v11[8];
    v11[8] = v15;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;

  -[IMTranscriptChatItem guid](self, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[NSString hash](self->_activityTitle, "hash") ^ v4;
  return v5 ^ -[NSDate hash](self->_expirationDate, "hash");
}

- (BOOL)_isEqualToGuid:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  int v14;
  int v15;
  NSDate *v16;
  NSDate *v17;
  NSDate *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMTranscriptChatItem guid](self, "guid");
  v11 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  v12 = (NSDate *)v8;
  v13 = v12;
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  if (!v12 || !v11)
  {

    LOBYTE(v15) = 0;
    v16 = v11;
    goto LABEL_19;
  }
  v14 = -[NSDate isEqualToString:](v11, "isEqualToString:", v12);

  if (v14)
  {
LABEL_7:
    v16 = self->_activityTitle;
    v17 = (NSDate *)v9;
    v11 = v17;
    if (v16 == v17)
    {

LABEL_14:
      v16 = self->_expirationDate;
      v18 = (NSDate *)v10;
      v11 = v18;
      if (v16 == v18)
      {
        LOBYTE(v15) = 1;
      }
      else
      {
        LOBYTE(v15) = 0;
        if (v18 && v16)
          LOBYTE(v15) = -[NSDate isEqualToDate:](v16, "isEqualToDate:", v18);
      }
      goto LABEL_19;
    }
    LOBYTE(v15) = 0;
    if (v17 && v16)
    {
      v15 = -[NSDate isEqualToString:](v16, "isEqualToString:", v17);

      if (!v15)
        goto LABEL_20;
      goto LABEL_14;
    }
LABEL_19:

    goto LABEL_20;
  }
  LOBYTE(v15) = 0;
LABEL_20:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMMomentShareStatusChatItem;
  if (-[IMTranscriptChatItem isEqual:](&v10, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "guid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[IMMomentShareStatusChatItem _isEqualToGuid:activityTitle:expirationDate:](self, "_isEqualToGuid:activityTitle:expirationDate:", v5, v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMMomentShareStatusChatItem;
  -[IMTranscriptChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[%@] activityTitle: \"%@\", expirationDate: \"%@\"]"), v4, self->_activityTitle, self->_expirationDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:activityTitle:expirationDate:", v5, self->_activityTitle, self->_expirationDate);

  return v6;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)wouldBeEqualIfInitializedWithItem:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_guidForItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = -[IMMomentShareStatusChatItem _isEqualToGuid:activityTitle:expirationDate:](self, "_isEqualToGuid:activityTitle:expirationDate:", v11, v9, v8);
  return (char)v10;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
}

@end
