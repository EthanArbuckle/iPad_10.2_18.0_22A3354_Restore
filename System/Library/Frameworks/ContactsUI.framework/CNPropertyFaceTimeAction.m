@implementation CNPropertyFaceTimeAction

- (CNPropertyFaceTimeAction)initWithContact:(id)a3 propertyItems:(id)a4
{
  CNPropertyFaceTimeAction *v4;
  CNPropertyFaceTimeAction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyFaceTimeAction;
  v4 = -[CNPropertyAction initWithContact:propertyItems:](&v7, sel_initWithContact_propertyItems_, a3, a4);
  v5 = v4;
  if (v4)
    -[CNPropertyFaceTimeAction performSelector:withObject:afterDelay:](v4, "performSelector:withObject:afterDelay:", sel__queryFaceTimeStatus, 0, 0.0);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CNPropertyBestIDSValueQuery cancel](self->_bestFaceTimeQuery, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyFaceTimeAction;
  -[CNPropertyFaceTimeAction dealloc](&v3, sel_dealloc);
}

- (BOOL)canPerformAction
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNPropertyFaceTimeAction bestFaceTimeQuery](self, "bestFaceTimeQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestIDSProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)performActionForItem:(id)a3 sender:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  id v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  __CFString **v24;
  __CFString *v25;
  uint64_t *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CNPropertyFaceTimeAction bestFaceTimeQuery](self, "bestFaceTimeQuery", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestIDSProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CNPropertyAction propertyItems](self, "propertyItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[CNPropertyAction propertyItems](self, "propertyItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }
  CNUILogContactCard();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEFAULT, "[CNPropertyFaceTimeAction performActionForItem:sender:], bestFaceTimePropertyItem = %@", buf, 0xCu);
  }

  if (v6)
  {
    objc_msgSend(v6, "labeledValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "stringValue");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 2;
    }
    else
    {
      v14 = v12;
      v15 = 3;
    }
    v16 = -[CNPropertyFaceTimeAction type](self, "type");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13C68]), "initWithStringValue:type:", v14, v15);
    v18 = (void *)MEMORY[0x1E0C99E98];
    -[CNContactAction contact](self, "contact");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == 1)
      objc_msgSend(v18, "_cnui_faceTimeAudioURLWithHandle:contact:", v17, v19);
    else
      objc_msgSend(v18, "_cnui_faceTimeVideoURLWithHandle:contact:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    CNUILogContactCard();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl(&dword_18AC56000, v21, OS_LOG_TYPE_DEFAULT, "[CNPropertyFaceTimeAction performActionForItem:sender:], url = %@", buf, 0xCu);
    }

    if (v20)
    {
      +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CNUIContactActionFaceTimeMediaType;
      v23 = CNUIContactActionTypeFaceTime;
      if (v16 == 1)
        v24 = &CNUIContactActionFaceTimeMediaTypeAudioOnly;
      else
        v24 = &CNUIContactActionFaceTimeMediaTypeVideo;
      v25 = *v24;
      v29 = CNUIContactActionDestinationType;
      v30[0] = v25;
      v26 = &CNUIContactActionDestinationTypePhoneNumber;
      if ((isKindOfClass & 1) == 0)
        v26 = (uint64_t *)&CNUIContactActionDestinationTypeEmail;
      v30[1] = *v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v28, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logContactActionType:attributes:", v23, v27, v28, v29, v30[0]);

      objc_msgSend((id)*MEMORY[0x1E0DC4730], "openURL:withCompletionHandler:", v20, &__block_literal_global_29438);
    }

  }
}

- (void)_queryFaceTimeStatus
{
  CNPropertyBestIDSValueQuery *v3;
  void *v4;
  void *v5;
  CNPropertyBestIDSValueQuery *v6;
  id v7;

  v3 = [CNPropertyBestIDSValueQuery alloc];
  -[CNPropertyAction propertyItems](self, "propertyItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getIDSServiceNameFaceTime_29420();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNPropertyBestIDSValueQuery initWithPropertyItems:service:](v3, "initWithPropertyItems:service:", v4, v5);
  -[CNPropertyFaceTimeAction setBestFaceTimeQuery:](self, "setBestFaceTimeQuery:", v6);

  -[CNPropertyFaceTimeAction bestFaceTimeQuery](self, "bestFaceTimeQuery");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

}

- (void)queryComplete
{
  void *v3;
  char v4;
  id v5;

  -[CNContactAction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactAction delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionDidUpdate:", self);

  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CNPropertyBestIDSValueQuery)bestFaceTimeQuery
{
  return self->_bestFaceTimeQuery;
}

- (void)setBestFaceTimeQuery:(id)a3
{
  objc_storeStrong((id *)&self->_bestFaceTimeQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestFaceTimeQuery, 0);
}

void __56__CNPropertyFaceTimeAction_performActionForItem_sender___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CNUILogContactCard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("failure");
    if (a2)
      v4 = CFSTR("success");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEFAULT, "[CNPropertyFaceTimeAction performActionForItem:sender:], UIApp openURL = %@", (uint8_t *)&v5, 0xCu);
  }

}

@end
