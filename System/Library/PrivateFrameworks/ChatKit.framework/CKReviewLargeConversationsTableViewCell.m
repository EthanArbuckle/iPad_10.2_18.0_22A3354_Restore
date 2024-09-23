@implementation CKReviewLargeConversationsTableViewCell

+ (double)requestedHeight
{
  return 58.0;
}

+ (CGSize)leftHandSideViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 45.0;
  v3 = 45.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setModelObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("chat"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKReviewLargeConversationsTableViewCell setChat:](self, "setChat:", v5);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("size"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAbstractReviewTableViewCell setSize:](self, "setSize:", objc_msgSend(v6, "unsignedLongLongValue"));

  }
  else
  {
    -[CKReviewLargeConversationsTableViewCell setChat:](self, "setChat:", 0);
    -[CKAbstractReviewTableViewCell setSize:](self, "setSize:", 0);
  }

}

- (id)leftHandSideView
{
  void *v3;
  id v4;
  void *v5;

  -[CKReviewLargeConversationsTableViewCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C97468]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKReviewLargeConversationsTableViewCell setAvatarView:](self, "setAvatarView:", v5);

  }
  return -[CKReviewLargeConversationsTableViewCell avatarView](self, "avatarView");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKReviewLargeConversationsTableViewCell;
  -[CKAbstractReviewTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKReviewLargeConversationsTableViewCell setChat:](self, "setChat:", 0);
}

- (void)setChat:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD *v38;
  _QWORD v39[3];
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_chat, a3);
  if (!v5)
  {
    -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", 0);
    -[CKReviewLargeConversationsTableViewCell avatarView](self, "avatarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContacts:", MEMORY[0x1E0C9AA60]);

    -[CKAbstractReviewTableViewCell setSubheadingText:](self, "setSubheadingText:", 0);
    goto LABEL_24;
  }
  objc_msgSend(v5, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastMessage");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_msgSend(v5, "displayName"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", &stru_1E276D870),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    objc_msgSend(v5, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", v10);
  }
  else
  {
    if (objc_msgSend(v6, "count") != 1)
    {
      if ((unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        v13 = MEMORY[0x1E0C809B0];
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke;
        v41[3] = &unk_1E274A230;
        v42 = v5;
        objc_msgSend(v6, "__imArrayByApplyingBlock:", v41);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = 0;
        v39[1] = v39;
        v39[2] = 0x2020000000;
        v40 = 0;
        v40 = objc_msgSend(v14, "count") - 1;
        v36[0] = v13;
        v36[1] = 3221225472;
        v36[2] = __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke_2;
        v36[3] = &unk_1E274A258;
        v16 = v15;
        v37 = v16;
        v38 = v39;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v36);
        v17 = (void *)objc_msgSend(v16, "copy");
        -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", v17);

        _Block_object_dispose(v39, 8);
      }
      goto LABEL_11;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayNameForChat:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAbstractReviewTableViewCell setMainText:](self, "setMainText:", v11);

  }
LABEL_11:
  v18 = v6;
  v19 = v18;
  if ((unint64_t)objc_msgSend(v18, "count") >= 2)
  {
    v19 = v18;
    if (v35)
    {
      v19 = v18;
      if ((objc_msgSend(v35, "isFromMe") & 1) == 0)
      {
        objc_msgSend(v35, "sender");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "arrayByExcludingObjectsInArray:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  objc_msgSend(v19, "__imArrayByApplyingBlock:", &__block_literal_global_0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKReviewLargeConversationsTableViewCell avatarView](self, "avatarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContacts:", v24);

  objc_msgSend(v35, "time");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isDateInToday:", v26))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("TODAY"), &stru_1E276D870, CFSTR("General"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v27, "isDateInYesterday:", v26))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("YESTERDAY"), &stru_1E276D870, CFSTR("General"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v26, 2, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("LAST_UPDATED_FMT"), &stru_1E276D870, CFSTR("General"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", v33, v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAbstractReviewTableViewCell setSubheadingText:](self, "setSubheadingText:", v34);

  }
  else
  {
    -[CKAbstractReviewTableViewCell setSubheadingText:](self, "setSubheadingText:", 0);
  }

LABEL_24:
  -[CKReviewLargeConversationsTableViewCell setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayNameForChat:", *(_QWORD *)(a1 + 32));
}

void __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == a3)
      v9 = CFSTR("PARTICIPANT_ADDRESS_FINAL_ITEM");
    else
      v9 = CFSTR("PARTICIPANT_ADDRESS_NON_FINAL_ITEM");
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("PARTICIPANT_ADDRESS_FIRST_ITEM");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E276D870, CFSTR("General"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", v10, v11);

}

id __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_11;
  v3 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v2, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_appearsToBeEmail"))
  {
    objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEmailAddresses:", v6);
  }
  else
  {
    if (!objc_msgSend(v4, "_appearsToBePhoneNumber"))
      goto LABEL_7;
    v7 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "labeledValueWithLabel:value:", 0, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPhoneNumbers:", v6);
  }

LABEL_7:
  if (objc_msgSend(v2, "isBusiness"))
  {
    objc_msgSend(v2, "brand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      _CKSetBusinessInfoForMutableContact(v3, v2, 0);
  }

LABEL_11:
  return v3;
}

- (IMChat)chat
{
  return self->_chat;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_chat, 0);
}

@end
