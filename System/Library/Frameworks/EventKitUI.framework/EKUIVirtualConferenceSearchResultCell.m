@implementation EKUIVirtualConferenceSearchResultCell

- (void)updateWithRoomType:(id)a3
{
  id v5;
  EKVirtualConference *currentCustomVirtualConference;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  EKVirtualConferenceRoomType *currentRoomType;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if ((-[EKVirtualConferenceRoomType isEqual:](self->_currentRoomType, "isEqual:", v5) & 1) == 0)
  {
    currentCustomVirtualConference = self->_currentCustomVirtualConference;
    self->_currentCustomVirtualConference = 0;

    objc_storeStrong((id *)&self->_currentRoomType, a3);
    -[EKUILocationSearchResultCell defaultContentConfiguration](self, "defaultContentConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
    objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
    v9 = v8;
    objc_msgSend(v7, "imageProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setReservedLayoutSize:", v9, v9);

    objc_msgSend(v7, "imageProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMaximumSize:", v9, v9);

    if (updateWithRoomType__onceToken != -1)
      dispatch_once(&updateWithRoomType__onceToken, &__block_literal_global_64);
    objc_msgSend((id)updateWithRoomType__cache, "objectForKey:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v5, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v13);

      objc_msgSend(v7, "setImage:", v12);
      -[EKUIVirtualConferenceSearchResultCell setContentConfiguration:](self, "setContentConfiguration:", v7);
    }
    else
    {
      objc_msgSend(v7, "setText:", CFSTR(" "));
      v14 = objc_alloc_init(MEMORY[0x1E0DC3870]);
      objc_msgSend(v7, "setImage:", v14);

      -[EKUIVirtualConferenceSearchResultCell setContentConfiguration:](self, "setContentConfiguration:", v7);
      v15 = (void *)MEMORY[0x1E0D0CD38];
      currentRoomType = self->_currentRoomType;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_2;
      v17[3] = &unk_1E601AF50;
      v17[4] = self;
      v18 = v7;
      objc_msgSend(v15, "imageForRoomType:completionHandler:", currentRoomType, v17);

    }
  }

}

void __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)updateWithRoomType__cache;
  updateWithRoomType__cache = (uint64_t)v0;

}

void __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend((id)updateWithRoomType__cache, "setObject:forKey:", v5, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_3;
  v10[3] = &unk_1E601A360;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __60__EKUIVirtualConferenceSearchResultCell_updateWithRoomType___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "isEqual:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setText:", v3);

    objc_msgSend(*(id *)(a1 + 48), "setImage:", *(_QWORD *)(a1 + 56));
    return objc_msgSend(*(id *)(a1 + 32), "setContentConfiguration:", *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)updateWithCustomVirtualConference:(id)a3
{
  id v5;
  EKVirtualConferenceRoomType *currentRoomType;
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
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v5 = a3;
  currentRoomType = self->_currentRoomType;
  self->_currentRoomType = 0;

  objc_storeStrong((id *)&self->_currentCustomVirtualConference, a3);
  -[EKVirtualConference joinMethods](self->_currentCustomVirtualConference, "joinMethods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUILocationSearchResultCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDirectionalLayoutMargins:", 15.0, 0.0, 15.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  objc_msgSend((id)objc_opt_class(), "_boldTitleFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  objc_msgSend(v10, "setText:", CFSTR(" "));
  objc_msgSend(v10, "setSecondaryText:", CFSTR(" "));
  -[EKUIVirtualConferenceSearchResultCell contentConfiguration](self, "contentConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "secondaryText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 && v17)
    {
      if (objc_msgSend(v16, "rangeOfString:", v17) != 0x7FFFFFFFFFFFFFFFLL)
      {

        goto LABEL_9;
      }
      v19 = objc_msgSend(v18, "rangeOfString:", v16);

      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_9;
    }
    else
    {

    }
  }
  -[EKUIVirtualConferenceSearchResultCell setContentConfiguration:](self, "setContentConfiguration:", v10);
LABEL_9:
  v20 = (void *)MEMORY[0x1E0D0CD38];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke;
  v22[3] = &unk_1E6018990;
  v22[4] = self;
  v23 = v10;
  v21 = v10;
  objc_msgSend(v20, "displayDetailsForURL:completionHandler:", v9, v22);

}

void __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke_2;
  block[3] = &unk_1E601A4C8;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = v8;
  v21 = v9;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __75__EKUIVirtualConferenceSearchResultCell_updateWithCustomVirtualConference___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "joinMethods");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v5);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "setImage:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "setText:", *(_QWORD *)(a1 + 64));
    v6 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1E601DFA8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setSecondaryText:", v10);

    objc_msgSend(*(id *)(a1 + 40), "setContentConfiguration:", *(_QWORD *)(a1 + 48));
  }
}

+ (id)_boldTitleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCustomVirtualConference, 0);
  objc_storeStrong((id *)&self->_currentRoomType, 0);
}

@end
