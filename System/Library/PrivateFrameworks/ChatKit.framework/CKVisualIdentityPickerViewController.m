@implementation CKVisualIdentityPickerViewController

+ (id)imagePickerForGroupIdentity:(id)a3 withConversation:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CKVisualIdentityPickerViewController;
  v5 = a4;
  objc_msgSendSuper2(&v8, sel_imagePickerForGroupIdentity_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConversation:", v5, v8.receiver, v8.super_class);

  objc_msgSend(v6, "setDelegate:", v6);
  return v6;
}

+ (id)imagePickerForContact:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CKVisualIdentityPickerViewController;
  objc_msgSendSuper2(&v5, sel_imagePickerForContact_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v3);
  return v3;
}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C97548], "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKVisualIdentityPickerViewController conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v8, objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "groupPhoto");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToData:", v12);

  if ((v13 & 1) == 0)
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    objc_msgSend(v9, "chat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isGroupChat");

    if (v15)
    {
      objc_msgSend(v6, "thumbnailImageData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKDetailsController saveGroupPhotoDataAndUpdateParticipants:forConversation:](CKDetailsController, "saveGroupPhotoDataAndUpdateParticipants:forConversation:", v16, v9);

    }
    objc_msgSend(v9, "setNeedsUpdatedGroupPhotoForVisualIdentity");
  }
  objc_msgSend(v6, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v19 & 1) != 0)
  {
    if ((v13 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    if (_IMWillLog())
      _IMAlwaysLog();
    objc_msgSend(v6, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisplayName:", v20);

    objc_msgSend(v9, "setNeedsUpdatedGroupNameForVisualIdentity");
  }
  objc_msgSend(v9, "setGroupIdentityUpdateHandleID:", 0);
LABEL_14:
  -[CKVisualIdentityPickerViewController presentationDelegate](self, "presentationDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "visualIdentityPickerDidFinish:", self);

}

- (void)visualIdentityPickerDidCancel:(id)a3
{
  id v4;

  -[CKVisualIdentityPickerViewController presentationDelegate](self, "presentationDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualIdentityPickerDidFinish:", self);

}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (CKVisualIdentityPickerViewControllerDelegate)presentationDelegate
{
  return (CKVisualIdentityPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
