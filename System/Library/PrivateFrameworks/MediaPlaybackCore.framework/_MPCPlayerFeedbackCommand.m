@implementation _MPCPlayerFeedbackCommand

- (_MPCPlayerFeedbackCommand)initWithResponse:(id)a3 mediaRemoteCommand:(unsigned int)a4
{
  _MPCPlayerFeedbackCommand *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPCPlayerFeedbackCommand;
  result = -[_MPCPlayerCommand initWithResponse:](&v6, sel_initWithResponse_, a3);
  if (result)
    result->_command = a4;
  return result;
}

- (id)changeValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  __objc2_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MPCPlayerCommandRequest *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;

  v3 = a3;
  -[_MPCPlayerFeedbackCommand favoritableModelObject](self, "favoritableModelObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_MPCPlayerCommand response](self, "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_MPCPlayerFeedbackCommand isDislikingFavoritableModelObject](self, "isDislikingFavoritableModelObject"))
      v7 = MPCPlayerSuggestLessCommandRequest;
    else
      v7 = MPCPlayerFavoriteCommandRequest;
    v19 = [v7 alloc];
    -[_MPCPlayerFeedbackCommand favoritableModelObject](self, "favoritableModelObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "initWithModelObject:value:controller:label:", v12, v3, v15, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (!v3)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE65918]);
    -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[_MPCPlayerItemCommand contentItemID](self, "contentItemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE658D0]);

    }
    -[_MPCPlayerCommand response](self, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [MPCPlayerCommandRequest alloc];
    v14 = -[_MPCPlayerFeedbackCommand command](self, "command");
    objc_msgSend(v12, "controller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v13, "initWithMediaRemoteCommand:options:controller:label:", v14, v6, v15, v17);
  }
  v20 = (void *)v18;

  return v20;
}

- (unsigned)command
{
  return self->_command;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (void)setLocalizedShortTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

- (BOOL)isDislikingFavoritableModelObject
{
  return self->_isDislikingFavoritableModelObject;
}

- (void)setIsDislikingFavoritableModelObject:(BOOL)a3
{
  self->_isDislikingFavoritableModelObject = a3;
}

- (MPModelObject)favoritableModelObject
{
  return self->_favoritableModelObject;
}

- (void)setFavoritableModelObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritableModelObject, 0);
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
