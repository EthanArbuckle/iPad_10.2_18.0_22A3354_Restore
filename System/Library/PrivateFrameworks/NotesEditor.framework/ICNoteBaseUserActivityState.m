@implementation ICNoteBaseUserActivityState

- (ICNoteBaseUserActivityState)initWithNote:(id)a3
{
  id v4;
  ICNoteBaseUserActivityState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteBaseUserActivityState;
  v5 = -[ICNoteBaseUserActivityState init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "userActivityContentAttributeSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteBaseUserActivityState setAttributeSet:](v5, "setAttributeSet:", v6);

      objc_msgSend(v4, "searchIndexingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteBaseUserActivityState attributeSet](v5, "attributeSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRelatedUniqueIdentifier:", v7);

      objc_msgSend(MEMORY[0x1E0D64278], "userActivityPersistentIdentifierForNote:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNoteBaseUserActivityState setPersistentIdentifier:](v5, "setPersistentIdentifier:", v9);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "note", "-[ICNoteBaseUserActivityState initWithNote:]", 1, 0, CFSTR("note is nil"));
    }
  }

  return v5;
}

- (void)updateUserActivity:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ICNoteBaseUserActivityState attributeSet](self, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentAttributeSet:", v4);

  -[ICNoteBaseUserActivityState persistentIdentifier](self, "persistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersistentIdentifier:", v5);

  objc_msgSend(v6, "setEligibleForHandoff:", 1);
  objc_msgSend(v6, "setEligibleForSearch:", 1);
  objc_msgSend(v6, "setEligibleForPublicIndexing:", 0);

}

- (NSDictionary)contentAttributes
{
  return self->_contentAttributes;
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return self->_attributeSet;
}

- (void)setAttributeSet:(id)a3
{
  objc_storeStrong((id *)&self->_attributeSet, a3);
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_persistentIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_attributeSet, 0);
  objc_storeStrong((id *)&self->_contentAttributes, 0);
}

@end
