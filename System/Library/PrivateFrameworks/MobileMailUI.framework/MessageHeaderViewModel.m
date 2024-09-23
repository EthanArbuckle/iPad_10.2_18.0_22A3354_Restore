@implementation MessageHeaderViewModel

- (MessageHeaderViewModel)initWithBuilder:(id)a3
{
  void (**v5)(id, MessageHeaderViewModel *);
  MessageHeaderViewModel *v6;
  uint64_t v7;
  EFObserver *observableObserver;
  void *v10;
  objc_super v11;

  v5 = (void (**)(id, MessageHeaderViewModel *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageHeaderViewModel.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v11.receiver = self;
  v11.super_class = (Class)MessageHeaderViewModel;
  v6 = -[MessageHeaderViewModel init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D1EF28], "observableObserver");
    v7 = objc_claimAutoreleasedReturnValue();
    observableObserver = v6->_observableObserver;
    v6->_observableObserver = (EFObserver *)v7;

    v5[2](v5, v6);
  }

  return v6;
}

- (MessageHeaderViewModel)initWithItemBuilder:(id)a3
{
  id v5;

  v5 = a3;
  -[MessageHeaderViewModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageHeaderViewModel initWithItemBuilder:]", "MessageHeaderViewModel.m", 43, "0");
}

- (id)updatedModelWithBuilder:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[5];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageHeaderViewModel.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v6 = objc_alloc((Class)objc_opt_class());
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__MessageHeaderViewModel_updatedModelWithBuilder___block_invoke;
  v13[3] = &unk_1E9A03040;
  v13[4] = self;
  v7 = v5;
  v14 = v7;
  v8 = (void *)objc_msgSend(v6, "initWithBuilder:", v13);
  -[MessageHeaderViewModel observableObserver](self, "observableObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObservableObserver:", v9);

  if (-[MessageHeaderViewModel _viewModelHasChanges:]((_BOOL8)self, v8))
  {
    objc_msgSend(v8, "observableObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "observerDidReceiveResult:", v8);

  }
  return v8;
}

void __50__MessageHeaderViewModel_updatedModelWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v34;

  v34 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setItemID:", v3);

  objc_msgSend(*(id *)(a1 + 32), "dateSent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v34, "setDateSent:", v5);

  objc_msgSend(*(id *)(a1 + 32), "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v34, "setSubject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "senderList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v34, "setSenderList:", v9);

  objc_msgSend(*(id *)(a1 + 32), "replyToList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v34, "setReplyToList:", v11);

  objc_msgSend(*(id *)(a1 + 32), "toList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v34, "setToList:", v13);

  objc_msgSend(*(id *)(a1 + 32), "ccList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v34, "setCcList:", v15);

  objc_msgSend(*(id *)(a1 + 32), "bccList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v34, "setBccList:", v17);

  objc_msgSend(*(id *)(a1 + 32), "atomManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAtomManager:", v18);

  objc_msgSend(*(id *)(a1 + 32), "brandIndicatorFuture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBrandIndicatorFuture:", v19);

  objc_msgSend(*(id *)(a1 + 32), "sendLaterDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v34, "setSendLaterDate:", v21);

  objc_msgSend(v34, "setRead:", objc_msgSend(*(id *)(a1 + 32), "isRead"));
  objc_msgSend(v34, "setFlagged:", objc_msgSend(*(id *)(a1 + 32), "isFlagged"));
  objc_msgSend(*(id *)(a1 + 32), "flagColors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v34, "setFlagColors:", v23);

  objc_msgSend(v34, "setReplied:", objc_msgSend(*(id *)(a1 + 32), "isReplied"));
  objc_msgSend(v34, "setForwarded:", objc_msgSend(*(id *)(a1 + 32), "isForwarded"));
  objc_msgSend(v34, "setRedirected:", objc_msgSend(*(id *)(a1 + 32), "isRedirected"));
  objc_msgSend(v34, "setJunk:", objc_msgSend(*(id *)(a1 + 32), "isJunk"));
  objc_msgSend(v34, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v34, "setNotify:", objc_msgSend(*(id *)(a1 + 32), "isNotify"));
  objc_msgSend(v34, "setMute:", objc_msgSend(*(id *)(a1 + 32), "isMute"));
  objc_msgSend(*(id *)(a1 + 32), "readLaterDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v34, "setReadLaterDate:", v25);

  objc_msgSend(*(id *)(a1 + 32), "sendLaterDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v34, "setSendLaterDate:", v27);

  objc_msgSend(*(id *)(a1 + 32), "displayDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");
  objc_msgSend(v34, "setDisplayDate:", v29);

  objc_msgSend(*(id *)(a1 + 32), "followUp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copy");
  objc_msgSend(v34, "setFollowUp:", v31);

  objc_msgSend(v34, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlockedSender"));
  objc_msgSend(v34, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v34, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  objc_msgSend(*(id *)(a1 + 32), "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copy");
  objc_msgSend(v34, "setDate:", v33);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_viewModelHasChanges:(_BOOL8)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v36;
  void *v37;

  v3 = a2;
  if (a1)
  {
    if ((-[MessageHeaderViewModel _flagsChangedInModel:](a1, v3) & 1) != 0)
    {
      a1 = 1;
    }
    else
    {
      objc_msgSend((id)a1, "itemID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "itemID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqual:", v5))
      {
        objc_msgSend((id)a1, "dateSent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "dateSent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "isEqual:", v7))
        {
          objc_msgSend((id)a1, "subject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "subject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqual:", v9))
          {
            objc_msgSend((id)a1, "sendLaterDate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "sendLaterDate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "isEqual:", v11))
            {
              objc_msgSend((id)a1, "readLaterDate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "readLaterDate");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v37, "isEqual:"))
              {
                objc_msgSend((id)a1, "sendLaterDate");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "sendLaterDate");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v35, "isEqual:"))
                {
                  objc_msgSend((id)a1, "displayDate");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "displayDate");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v33, "isEqual:"))
                  {
                    objc_msgSend((id)a1, "followUp");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v3, "followUp");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v31, "isEqual:"))
                    {
                      objc_msgSend((id)a1, "date");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v3, "date");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v29, "isEqual:"))
                      {
                        objc_msgSend((id)a1, "displayDate");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v3, "displayDate");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v27, "isEqual:"))
                        {
                          objc_msgSend((id)a1, "senderList");
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v3, "senderList");
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v25, "isEqualToArray:"))
                          {
                            objc_msgSend((id)a1, "replyToList");
                            v23 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v3, "replyToList");
                            v22 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v23, "isEqualToArray:", v22))
                            {
                              objc_msgSend((id)a1, "toList");
                              v21 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v3, "toList");
                              v20 = (void *)objc_claimAutoreleasedReturnValue();
                              if (objc_msgSend(v21, "isEqualToArray:", v20))
                              {
                                objc_msgSend((id)a1, "ccList");
                                v19 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v3, "ccList");
                                v18 = (void *)objc_claimAutoreleasedReturnValue();
                                if (objc_msgSend(v19, "isEqualToArray:", v18))
                                {
                                  objc_msgSend((id)a1, "bccList");
                                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v3, "bccList");
                                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (objc_msgSend(v17, "isEqualToArray:", v16)
                                    && (v14 = objc_msgSend((id)a1, "hasAttachments"),
                                        v14 == objc_msgSend(v3, "hasAttachments"))
                                    && (v15 = objc_msgSend((id)a1, "isBlockedSender"),
                                        v15 == objc_msgSend(v3, "isBlockedSender")))
                                  {
                                    v13 = objc_msgSend((id)a1, "unsubscribeType");
                                    a1 = v13 != objc_msgSend(v3, "unsubscribeType");
                                  }
                                  else
                                  {
                                    a1 = 1;
                                  }

                                }
                                else
                                {
                                  a1 = 1;
                                }

                              }
                              else
                              {
                                a1 = 1;
                              }

                            }
                            else
                            {
                              a1 = 1;
                            }

                          }
                          else
                          {
                            a1 = 1;
                          }

                        }
                        else
                        {
                          a1 = 1;
                        }

                      }
                      else
                      {
                        a1 = 1;
                      }

                    }
                    else
                    {
                      a1 = 1;
                    }

                  }
                  else
                  {
                    a1 = 1;
                  }

                }
                else
                {
                  a1 = 1;
                }

              }
              else
              {
                a1 = 1;
              }

            }
            else
            {
              a1 = 1;
            }

          }
          else
          {
            a1 = 1;
          }

        }
        else
        {
          a1 = 1;
        }

      }
      else
      {
        a1 = 1;
      }

    }
  }

  return a1;
}

- (id)updatedFlagsModelWithBuilder:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[5];
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageHeaderViewModel.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flagsBuilderBlock"));

  }
  v6 = objc_alloc((Class)objc_opt_class());
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__MessageHeaderViewModel_updatedFlagsModelWithBuilder___block_invoke;
  v13[3] = &unk_1E9A03040;
  v13[4] = self;
  v7 = v5;
  v14 = v7;
  v8 = (void *)objc_msgSend(v6, "initWithBuilder:", v13);
  -[MessageHeaderViewModel observableObserver](self, "observableObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObservableObserver:", v9);

  if (-[MessageHeaderViewModel _flagsChangedInModel:]((uint64_t)self, v8))
  {
    objc_msgSend(v8, "observableObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "observerDidReceiveResult:", v8);

  }
  return v8;
}

void __55__MessageHeaderViewModel_updatedFlagsModelWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setItemID:", v3);

  objc_msgSend(v27, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlockedSender"));
  objc_msgSend(v27, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  objc_msgSend(*(id *)(a1 + 32), "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v27, "setDate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "dateSent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v27, "setDateSent:", v7);

  objc_msgSend(*(id *)(a1 + 32), "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v27, "setSubject:", v9);

  objc_msgSend(*(id *)(a1 + 32), "mailbox");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v27, "setMailbox:", v11);

  objc_msgSend(*(id *)(a1 + 32), "senderList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v27, "setSenderList:", v13);

  objc_msgSend(*(id *)(a1 + 32), "replyToList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v27, "setReplyToList:", v15);

  objc_msgSend(*(id *)(a1 + 32), "toList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v27, "setToList:", v17);

  objc_msgSend(*(id *)(a1 + 32), "ccList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v27, "setCcList:", v19);

  objc_msgSend(*(id *)(a1 + 32), "bccList");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v27, "setBccList:", v21);

  objc_msgSend(*(id *)(a1 + 32), "atomManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAtomManager:", v22);

  objc_msgSend(*(id *)(a1 + 32), "brandIndicatorFuture");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBrandIndicatorFuture:", v23);

  objc_msgSend(*(id *)(a1 + 32), "readLaterDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setReadLaterDate:", v24);

  objc_msgSend(*(id *)(a1 + 32), "followUp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFollowUp:", v25);

  objc_msgSend(*(id *)(a1 + 32), "sendLaterDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSendLaterDate:", v26);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (uint64_t)_flagsChangedInModel:(uint64_t)a1
{
  id v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v13;

  v3 = a2;
  if (a1)
  {
    v4 = objc_msgSend((id)a1, "isRead");
    if (v4 == objc_msgSend(v3, "isRead")
      && (v5 = objc_msgSend((id)a1, "isFlagged"), v5 == objc_msgSend(v3, "isFlagged")))
    {
      objc_msgSend((id)a1, "flagColors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "flagColors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToIndexSet:", v7)
        && (v8 = objc_msgSend((id)a1, "isReplied"), v8 == objc_msgSend(v3, "isReplied"))
        && (v9 = objc_msgSend((id)a1, "isForwarded"), v9 == objc_msgSend(v3, "isForwarded"))
        && (v10 = objc_msgSend((id)a1, "isVIP"), v10 == objc_msgSend(v3, "isVIP"))
        && (v11 = objc_msgSend((id)a1, "isNotify"), v11 == objc_msgSend(v3, "isNotify")))
      {
        v13 = objc_msgSend((id)a1, "isMute");
        a1 = v13 ^ objc_msgSend(v3, "isMute");
      }
      else
      {
        a1 = 1;
      }

    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (id)updatedModelWithMessage:(id)a3 brandIndicatorFuture:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  MessageHeaderViewModel *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageHeaderViewModel.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v9 = objc_alloc((Class)objc_opt_class());
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__MessageHeaderViewModel_updatedModelWithMessage_brandIndicatorFuture___block_invoke;
  v17[3] = &unk_1E9A03068;
  v10 = v7;
  v18 = v10;
  v19 = self;
  v11 = v8;
  v20 = v11;
  v12 = (void *)objc_msgSend(v9, "initWithBuilder:", v17);
  -[MessageHeaderViewModel observableObserver](self, "observableObserver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObservableObserver:", v13);

  if (-[MessageHeaderViewModel _viewModelHasChanges:]((_BOOL8)self, v12))
  {
    objc_msgSend(v12, "observableObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "observerDidReceiveResult:", v12);

  }
  return v12;
}

void __71__MessageHeaderViewModel_updatedModelWithMessage_brandIndicatorFuture___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setItemID:", v4);

  objc_msgSend(v22, "setRead:", objc_msgSend(v3, "read"));
  objc_msgSend(v22, "setFlagged:", objc_msgSend(v3, "flagged"));
  objc_msgSend(*(id *)(a1 + 32), "flagColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFlagColors:", v5);

  objc_msgSend(v22, "setReplied:", objc_msgSend(v3, "replied"));
  objc_msgSend(v22, "setForwarded:", objc_msgSend(v3, "forwarded"));
  objc_msgSend(v22, "setRedirected:", objc_msgSend(v3, "redirected"));
  objc_msgSend(v22, "setJunk:", objc_msgSend(v3, "isJunk"));
  objc_msgSend(v22, "setVIP:", objc_msgSend(*(id *)(a1 + 32), "isVIP"));
  objc_msgSend(v22, "setNotify:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 2);
  objc_msgSend(v22, "setMute:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel") == 1);
  objc_msgSend(v22, "setBlockedSender:", objc_msgSend(*(id *)(a1 + 32), "isBlocked"));
  objc_msgSend(v22, "setUnsubscribeType:", objc_msgSend(*(id *)(a1 + 32), "unsubscribeType"));
  objc_msgSend(v22, "setHasAttachments:", objc_msgSend(*(id *)(a1 + 32), "hasAttachments"));
  objc_msgSend(*(id *)(a1 + 32), "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDateSent:", v6);

  objc_msgSend(*(id *)(a1 + 32), "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDate:", v7);

  objc_msgSend(*(id *)(a1 + 32), "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSubject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "senderList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSenderList:", v9);

  objc_msgSend(*(id *)(a1 + 40), "replyToList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setReplyToList:", v10);

  objc_msgSend(*(id *)(a1 + 32), "toList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setToList:", v11);

  objc_msgSend(*(id *)(a1 + 32), "ccList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCcList:", v12);

  objc_msgSend(*(id *)(a1 + 32), "bccList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBccList:", v13);

  objc_msgSend(*(id *)(a1 + 32), "readLater");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setReadLaterDate:", v15);

  objc_msgSend(*(id *)(a1 + 32), "sendLaterDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSendLaterDate:", v16);

  objc_msgSend(*(id *)(a1 + 32), "followUp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFollowUp:", v17);

  objc_msgSend(*(id *)(a1 + 32), "displayDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDisplayDate:", v18);

  objc_msgSend(*(id *)(a1 + 40), "mailbox");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v22, "setMailbox:", v20);

  objc_msgSend(*(id *)(a1 + 40), "atomManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAtomManager:", v21);

  objc_msgSend(v22, "setBrandIndicatorFuture:", *(_QWORD *)(a1 + 48));
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ECSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)replyToList
{
  return self->_replyToList;
}

- (void)setReplyToList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)toList
{
  return self->_toList;
}

- (void)setToList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)ccList
{
  return self->_ccList;
}

- (void)setCcList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)bccList
{
  return self->_bccList;
}

- (void)setBccList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (MFAddressAtomStatusManager)atomManager
{
  return self->_atomManager;
}

- (void)setAtomManager:(id)a3
{
  objc_storeStrong((id *)&self->_atomManager, a3);
}

- (EFFuture)brandIndicatorFuture
{
  return self->_brandIndicatorFuture;
}

- (void)setBrandIndicatorFuture:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorFuture, a3);
}

- (EFObserver)observableObserver
{
  return self->_observableObserver;
}

- (void)setObservableObserver:(id)a3
{
  objc_storeStrong((id *)&self->_observableObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableObserver, 0);
  objc_storeStrong((id *)&self->_brandIndicatorFuture, 0);
  objc_storeStrong((id *)&self->_atomManager, 0);
  objc_storeStrong((id *)&self->_bccList, 0);
  objc_storeStrong((id *)&self->_ccList, 0);
  objc_storeStrong((id *)&self->_toList, 0);
  objc_storeStrong((id *)&self->_replyToList, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
