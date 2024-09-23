@implementation SGContactDetailSupervision

- (SGContactDetailSupervision)initWithMessage:(id)a3 ddMatch:(id)a4 isUnlikelyPhone:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SGContactDetailSupervision *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v32;
  void *v33;
  objc_super v34;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SGContactDetailSupervision;
  v10 = -[SGContactDetailSupervision init](&v34, sel_init);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    -[SGContactDetailSupervision setIsUnlikelyPhone:](v10, "setIsUnlikelyPhone:", v5);
    -[SGContactDetailSupervision setIgnoreAfter:](v10, "setIgnoreAfter:", objc_msgSend(v9, "valueRange"));
    objc_msgSend(v8, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGContactDetailSupervision setMatchDate:](v10, "setMatchDate:", v12);

    objc_msgSend(v8, "author");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGContactDetailSupervision setSenderDisplayName:](v10, "setSenderDisplayName:", v14);

    objc_msgSend(v9, "valueString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      v18 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v8, "textContent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v9, "valueRange");
      objc_msgSend(v19, "substringWithRange:", v20, v21);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v18);
    }

    -[SGContactDetailSupervision setIsFirstPerson:](v10, "setIsFirstPerson:", 0);
    -[SGContactDetailSupervision setIsThirdPerson:](v10, "setIsThirdPerson:", 0);
    if (hasMessageAndValidAuthorsName(v8))
    {
      v22 = objc_msgSend(v9, "matchType");
      if (v22 >= 3)
        v23 = -1;
      else
        v23 = v22;
      +[SGContactPipelineHelper findContactsForDetailType:andValue:](SGContactPipelineHelper, "findContactsForDetailType:andValue:", v23, v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24 && objc_msgSend(v24, "count"))
      {
        -[SGContactDetailSupervision setIsUnlikelyPhone:](v10, "setIsUnlikelyPhone:", 0);
        objc_msgSend(v8, "author");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "displayName");
        v33 = v11;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "author");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handles");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = +[SGContactPipelineHelper personExistsInContacts:name:handle:](SGContactPipelineHelper, "personExistsInContacts:name:handle:", v25, v26, v29);

        v11 = v33;
        -[SGContactDetailSupervision setIsFirstPerson:](v10, "setIsFirstPerson:", v30);
        -[SGContactDetailSupervision setIsThirdPerson:](v10, "setIsThirdPerson:", v30 ^ 1);
        objc_storeStrong((id *)&v10->_matchingContacts, v25);
      }

    }
    objc_autoreleasePoolPop(v11);
  }

  return v10;
}

- (SGMContactDetailOwner_)metricsContactDetailOwner
{
  SGMContactDetailOwner_ *v3;
  _BOOL4 v4;

  if (-[SGContactDetailSupervision isFirstPerson](self, "isFirstPerson"))
  {
    v3 = (SGMContactDetailOwner_ *)MEMORY[0x1E0D19B88];
  }
  else
  {
    v4 = -[SGContactDetailSupervision isThirdPerson](self, "isThirdPerson");
    v3 = (SGMContactDetailOwner_ *)MEMORY[0x1E0D19B78];
    if (v4)
      v3 = (SGMContactDetailOwner_ *)MEMORY[0x1E0D19B80];
  }
  return (SGMContactDetailOwner_)v3->var0;
}

- (SGMContactDetailFoundIn_)metricsContactDetailFoundIn
{
  SGMContactDetailFoundIn_ *v3;
  _BOOL4 v4;

  if (-[SGContactDetailSupervision isFirstPerson](self, "isFirstPerson"))
  {
    v3 = (SGMContactDetailFoundIn_ *)MEMORY[0x1E0D19B68];
  }
  else
  {
    v4 = -[SGContactDetailSupervision isThirdPerson](self, "isThirdPerson");
    v3 = (SGMContactDetailFoundIn_ *)MEMORY[0x1E0D19B58];
    if (v4)
      v3 = (SGMContactDetailFoundIn_ *)MEMORY[0x1E0D19B60];
  }
  return (SGMContactDetailFoundIn_)v3->var0;
}

- (BOOL)regexBelongsToSender
{
  return self->_regexBelongsToSender;
}

- (void)setRegexBelongsToSender:(BOOL)a3
{
  self->_regexBelongsToSender = a3;
}

- (BOOL)regexDoesNotBelongToSender
{
  return self->_regexDoesNotBelongToSender;
}

- (void)setRegexDoesNotBelongToSender:(BOOL)a3
{
  self->_regexDoesNotBelongToSender = a3;
}

- (BOOL)isFirstPerson
{
  return self->_isFirstPerson;
}

- (void)setIsFirstPerson:(BOOL)a3
{
  self->_isFirstPerson = a3;
}

- (BOOL)isThirdPerson
{
  return self->_isThirdPerson;
}

- (void)setIsThirdPerson:(BOOL)a3
{
  self->_isThirdPerson = a3;
}

- (NSArray)matchingContacts
{
  return self->_matchingContacts;
}

- (BOOL)isUnlikelyPhone
{
  return self->_isUnlikelyPhone;
}

- (void)setIsUnlikelyPhone:(BOOL)a3
{
  self->_isUnlikelyPhone = a3;
}

- (unint64_t)ignoreAfter
{
  return self->_ignoreAfter;
}

- (void)setIgnoreAfter:(unint64_t)a3
{
  self->_ignoreAfter = a3;
}

- (NSDate)matchDate
{
  return (NSDate *)objc_loadWeakRetained((id *)&self->_matchDate);
}

- (void)setMatchDate:(id)a3
{
  objc_storeWeak((id *)&self->_matchDate, a3);
}

- (NSString)senderDisplayName
{
  return (NSString *)objc_loadWeakRetained((id *)&self->_senderDisplayName);
}

- (void)setSenderDisplayName:(id)a3
{
  objc_storeWeak((id *)&self->_senderDisplayName, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_senderDisplayName);
  objc_destroyWeak((id *)&self->_matchDate);
  objc_storeStrong((id *)&self->_matchingContacts, 0);
}

@end
