@implementation CKEntity

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKEntity defaultIMHandle](self, "defaultIMHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultIMHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "matchesIMHandle:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CKEntity)initWithChat:(id)a3 imHandle:(id)a4
{
  id v7;
  id v8;
  CKEntity *v9;
  CKEntity *v10;
  uint64_t v11;
  IMAccount *chatAccount;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKEntity;
  v9 = -[CKEntity init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a4);
    objc_storeStrong((id *)&v10->_chat, a3);
    objc_msgSend(v7, "account");
    v11 = objc_claimAutoreleasedReturnValue();
    chatAccount = v10->_chatAccount;
    v10->_chatAccount = (IMAccount *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel__invalidateContactStoreCache_, *MEMORY[0x1E0D373C8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__invalidatePartialContactStoreCache_, *MEMORY[0x1E0D37408], 0);

  }
  return v10;
}

- (IMHandle)defaultIMHandle
{
  void *v3;
  void *v4;
  IMAccount *v5;
  void *v6;
  void *v7;
  IMHandle *v8;
  IMHandle *v9;
  IMHandle *handle;
  IMHandle *v11;

  -[IMHandle account](self->_handle, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (!objc_msgSend(v3, "isActive") || (objc_msgSend(v4, "isOperational") & 1) == 0))
  {
    v5 = self->_chatAccount;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle ID](self->_handle, "ID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "__ck_bestAccountForAddress:", v7);
      v5 = (IMAccount *)objc_claimAutoreleasedReturnValue();

    }
    v8 = self->_handle;
    -[IMHandle imHandleForOtherAccount:](v8, "imHandleForOtherAccount:", v5);
    v9 = (IMHandle *)objc_claimAutoreleasedReturnValue();
    handle = self->_handle;
    self->_handle = v9;

  }
  v11 = self->_handle;

  return v11;
}

- (id)cnContactWithKeys:(id)a3 shouldFetchSuggestedContact:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  IMHandle *handle;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CNContact *v22;
  void (**v23)(void *, void *);
  CNContact *cnContact;
  void *v25;
  CNContact *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  _BOOL4 v35;
  UIImage *v36;
  void *v37;
  _BOOL4 v38;
  CGColorSpace *DeviceRGB;
  CGColor *v40;
  CGColor *v41;
  const __CFArray *v42;
  CGGradient *v43;
  CGFloat MinY;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  UIImage *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  _BOOL4 v55;
  UIImage *v56;
  void *v57;
  CGContext *c;
  _QWORD aBlock[5];
  uint8_t buf[16];
  _QWORD v62[2];
  CGFloat locations[2];
  _QWORD v64[2];
  CGFloat v65[2];
  __int128 v66;
  _OWORD components[2];
  void *v68;
  _QWORD v69[4];
  CGSize v70;
  CGPoint v71;
  CGPoint v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v4 = a4;
  v69[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMHandle cnContactWithKeys:](self->_handle, "cnContactWithKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  if (!v7)
  {
    if ((-[IMHandle isBusiness](handle, "isBusiness") & 1) != 0
      || -[IMHandle isStewieRoadside](self->_handle, "isStewieRoadside"))
    {
      -[IMHandle brand](self->_handle, "brand");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[CNContact imageData](self->_cnContact, "imageData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__CKEntity_cnContactWithKeys_shouldFetchSuggestedContact___block_invoke;
    aBlock[3] = &unk_1E274E100;
    aBlock[4] = self;
    v23 = (void (**)(void *, void *))_Block_copy(aBlock);
    cnContact = self->_cnContact;
    if (cnContact)
    {
      if (v16)
      {
        v25 = (void *)-[CNContact mutableCopy](self->_cnContact, "mutableCopy");
        v23[2](v23, v25);
        -[CKEntity setCnContact:](self, "setCnContact:", v25);
        cnContact = self->_cnContact;

      }
      v26 = cnContact;
LABEL_51:
      v22 = v26;

      goto LABEL_52;
    }
    v26 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
    -[IMHandle ID](self->_handle, "ID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "_appearsToBeEmail"))
    {
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact setEmailAddresses:](v26, "setEmailAddresses:", v29);
    }
    else
    {
      if (!objc_msgSend(v27, "_appearsToBePhoneNumber"))
        goto LABEL_32;
      v30 = (void *)MEMORY[0x1E0C97338];
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "labeledValueWithLabel:value:", 0, v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact setPhoneNumbers:](v26, "setPhoneNumbers:", v29);
    }

LABEL_32:
    if (v16)
      v23[2](v23, v26);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "stewieEnabled");

    if (!v33)
      goto LABEL_46;
    if (-[IMHandle isStewieEmergency](self->_handle, "isStewieEmergency")
      && (-[CNContact imageData](self->_cnContact, "imageData"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = v34 == 0,
          v34,
          v35))
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("SOS_50"));
      v36 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v36);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact setImageData:](v26, "setImageData:", v49);
    }
    else
    {
      if (!-[IMHandle isStewieRoadside](self->_handle, "isStewieRoadside"))
        goto LABEL_46;
      -[CNContact imageData](self->_cnContact, "imageData");
      v36 = (UIImage *)objc_claimAutoreleasedReturnValue();
      if (v36)
        goto LABEL_45;
      -[IMHandle brandSquareLogoImageData](self->_handle, "brandSquareLogoImageData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37 == 0;

      if (!v38)
        goto LABEL_46;
      v70.width = 100.0;
      v70.height = 100.0;
      UIGraphicsBeginImageContextWithOptions(v70, 0, 0.0);
      c = UIGraphicsGetCurrentContext();
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      components[0] = xmmword_18E7C91A0;
      components[1] = unk_18E7C91B0;
      v40 = CGColorCreate(DeviceRGB, (const CGFloat *)components);
      *(_OWORD *)v65 = xmmword_18E7C91C0;
      v66 = unk_18E7C91D0;
      v41 = CGColorCreate(DeviceRGB, v65);
      v64[0] = v40;
      v64[1] = v41;
      v42 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
      *(_OWORD *)locations = xmmword_18E7C9190;
      v43 = CGGradientCreateWithColors(DeviceRGB, v42, locations);
      v73.size.width = 100.0;
      v73.origin.x = 0.0;
      v73.origin.y = 0.0;
      v73.size.height = 100.0;
      MinY = CGRectGetMinY(v73);
      v74.size.width = 100.0;
      v74.origin.x = 0.0;
      v74.origin.y = 0.0;
      v74.size.height = 100.0;
      v72.y = CGRectGetMaxY(v74);
      v71.x = 0.0;
      v72.x = 0.0;
      v71.y = MinY;
      CGContextDrawLinearGradient(c, v43, v71, v72, 0);
      CGGradientRelease(v43);
      CGColorRelease(v40);
      CGColorRelease(v41);
      CGColorSpaceRelease(DeviceRGB);
      v45 = (void *)MEMORY[0x1E0CEA650];
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v46;
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v62[1] = v47;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "configurationWithPaletteColors:", v48);
      v36 = (UIImage *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("car.front.waves.down.fill"), v36);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v75.size.width = 100.0;
      v75.origin.x = 0.0;
      v75.origin.y = 0.0;
      v75.size.height = 100.0;
      v76 = CGRectInset(v75, 20.0, 20.0);
      objc_msgSend(v49, "drawInRect:", v76.origin.x, v76.origin.y, v76.size.width, v76.size.height);
      UIGraphicsGetImageFromCurrentImageContext();
      v50 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      if (v50)
      {
        UIImagePNGRepresentation(v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContact setImageData:](v26, "setImageData:", v51);

      }
    }

LABEL_45:
LABEL_46:
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", c);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isTranscriptSharingEnabled");

    if (v53)
    {
      if (-[IMHandle isStewieTranscriptSharingHandle](self->_handle, "isStewieTranscriptSharingHandle"))
      {
        -[CNContact imageData](self->_cnContact, "imageData");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54 == 0;

        if (v55)
        {
          objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("SOS_50"));
          v56 = (UIImage *)objc_claimAutoreleasedReturnValue();
          UIImagePNGRepresentation(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContact setImageData:](v26, "setImageData:", v57);

        }
      }
    }
    -[CKEntity setCnContact:](self, "setCnContact:", v26);

    goto LABEL_51;
  }
  if ((-[IMHandle isContact](handle, "isContact") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nicknameForHandle:", self->_handle);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "emailAddresses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "phoneNumbers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKEntity _nicknameContactForNickname:emailAddresses:phoneNumbers:includeImageData:](self, "_nicknameContactForNickname:emailAddresses:phoneNumbers:includeImageData:", v10, v11, v12, -[CKEntity _allowedByScreenTime](self, "_allowedByScreenTime"));
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
    else if (v4 && -[IMHandle hasSuggestedName](self->_handle, "hasSuggestedName"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "If we have a suggested name, we should return a contact for it", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D35938], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle displayID](self->_handle, "displayID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fetchCNContactForSuggestedHandle:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = objc_msgSend(v20, "mutableCopy");

        v7 = (void *)v21;
      }

    }
  }
  v22 = v7;
LABEL_52:

  return v22;
}

- (id)cnContactWithKeys:(id)a3
{
  return -[CKEntity cnContactWithKeys:shouldFetchSuggestedContact:](self, "cnContactWithKeys:shouldFetchSuggestedContact:", a3, 0);
}

- (void)setCnContact:(id)a3
{
  objc_storeStrong((id *)&self->_cnContact, a3);
}

+ (id)_copyEntityForAddressString:(id)a3 onAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CKEntity *v10;

  v5 = a3;
  v6 = a4;
  if (CKIsRunningInFullCKClient())
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "__ck_handlesFromAddressStrings:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "__imFirstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", v9);

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {
      v7 = 0;
    }
    v10 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", 0);
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (id)copyEntityForAddressString:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D35738];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__ck_bestAccountForAddress:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(a1, "_copyEntityForAddressString:onAccount:", v5, v7);
  return v8;
}

- (CKEntity)initWithIMHandle:(id)a3
{
  return -[CKEntity initWithChat:imHandle:](self, "initWithChat:imHandle:", 0, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKEntity;
  -[CKEntity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [Default IM Handle: %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)entityForAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKEntity *v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    IMStripFormattingFromAddress();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__ck_bestAccountForAddress:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "imHandleWithID:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "ID");
        v9 = (CKEntity *)objc_claimAutoreleasedReturnValue();

        if (v9)
          v9 = -[CKEntity initWithIMHandle:]([CKEntity alloc], "initWithIMHandle:", v8);
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_allowedByScreenTime
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CKEntity chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKEntity chat](self, "chat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowedByScreenTime");
  }
  else
  {
    -[CKEntity handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return 1;
    objc_msgSend(MEMORY[0x1E0D35808], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEntity handle](self, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowedToShowConversationWithHandleIDs:sync:context:", v10, 1, 0);

  }
  return v5;
}

- (CNContact)cnContact
{
  return (CNContact *)-[CKEntity cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
}

void __58__CKEntity_cnContactWithKeys_shouldFetchSuggestedContact___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "enlargedContactImage"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "brandSquareLogoImageData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = *(id **)(a1 + 32);
      objc_msgSend(v4[5], "brandSquareLogoImageData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_croppedImageFromImageData:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_setBusinessInfoForMutableContact:enlargedImageData:", v6, v3);

}

- (id)_nicknameContactForNickname:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 includeImageData:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  CNMutableContact **p_cachedCNContactForNickname;
  IMNickname *cachedNicknameForCNContact;
  int v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  CNMutableContact *v27;
  int v29;
  int v30;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  p_cachedCNContactForNickname = &self->_cachedCNContactForNickname;
  if (!self->_cachedCNContactForNickname)
    goto LABEL_17;
  cachedNicknameForCNContact = self->_cachedNicknameForCNContact;
  if (!cachedNicknameForCNContact)
    goto LABEL_17;
  v16 = -[IMNickname isUpdateFromNickname:withOptions:](cachedNicknameForCNContact, "isUpdateFromNickname:withOptions:", v11, 8);
  -[CNMutableContact emailAddresses](*p_cachedCNContactForNickname, "emailAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  v19 = v17;
  v20 = v19;
  if (v19 == v18)
  {
    v21 = 0;
  }
  else
  {
    v21 = 1;
    if (v18 && v19)
      v21 = objc_msgSend(v18, "isEqualToArray:", v19) ^ 1;
  }
  v29 = v21;

  -[CNMutableContact phoneNumbers](*p_cachedCNContactForNickname, "phoneNumbers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  v24 = v22;
  v25 = v24;
  v30 = v16;
  if (v24 == v23)
  {
    v26 = 0;
  }
  else
  {
    v26 = 1;
    if (v23 && v24)
      v26 = objc_msgSend(v23, "isEqualToArray:", v24) ^ 1;
  }

  if (((v30 | v29) & 1) == 0 && (v26 & 1) == 0 && self->_cachedCNContactForNicknameIncludesImageData == v6)
  {
    v27 = *p_cachedCNContactForNickname;
  }
  else
  {
LABEL_17:
    -[CKEntity _createNicknameContactForNickname:emailAddresses:phoneNumbers:includeImageData:](self, "_createNicknameContactForNickname:emailAddresses:phoneNumbers:includeImageData:", v11, v12, v13, v6);
    v27 = (CNMutableContact *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_cachedCNContactForNickname, v27);
    objc_storeStrong((id *)&self->_cachedNicknameForCNContact, a3);
    self->_cachedCNContactForNicknameIncludesImageData = v6;
  }

  return v27;
}

- (id)_createNicknameContactForNickname:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5 includeImageData:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v19;
  id v20;
  uint64_t v21;

  v6 = a6;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v6)
  {
    objc_msgSend(v9, "avatar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v9, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v16, "setImageData:", v13);
  objc_msgSend(v16, "setGivenName:", v14);
  objc_msgSend(v16, "setFamilyName:", v15);
  objc_msgSend(v16, "setEmailAddresses:", v10);
  objc_msgSend(v16, "setPhoneNumbers:", v11);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v16;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Created nickname contact: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  return v16;
}

- (BOOL)isMe
{
  void *v2;
  char v3;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoginIMHandle");

  return v3;
}

- (void)setEnlargedContactImage:(BOOL)a3
{
  CNContact *cnContact;

  self->_enlargedContactImage = a3;
  cnContact = self->_cnContact;
  self->_cnContact = 0;

}

- (NSString)abbreviatedDisplayName
{
  void *v2;
  void *v3;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_displayNameWithAbbreviation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_invalidateContactStoreCache:(id)a3
{
  CNContact *cnContact;

  cnContact = self->_cnContact;
  self->_cnContact = 0;

}

- (void)_invalidatePartialContactStoreCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IMHandle *v7;
  IMHandle *v8;
  void *v9;
  NSObject *v10;
  CNContact *cnContact;
  IMHandle *v12;
  _BOOL4 v13;
  CNContact *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  CKEntity *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D37400]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = self->_handle;
    -[CKEntity defaultIMHandle](self, "defaultIMHandle");
    v8 = (IMHandle *)objc_claimAutoreleasedReturnValue();
    -[IMHandle ID](v8, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length") && objc_msgSend(v9, "isEqualToString:", v6))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v16 = 138412546;
          v17 = v6;
          v18 = 2112;
          v19 = self;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Received partial change notification for UID %@. Invalidating contact for IMHandle: %@", (uint8_t *)&v16, 0x16u);
        }

      }
      if (!-[IMHandle isBusiness](self->_handle, "isBusiness"))
        goto LABEL_12;
      if (v7 != v8)
      {
        cnContact = self->_cnContact;
        self->_cnContact = 0;

      }
      objc_msgSend(v4, "object");
      v12 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == v8;

      if (v13)
      {
LABEL_12:
        v14 = self->_cnContact;
        self->_cnContact = 0;

      }
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Received a partial change notification without a UID. Ignoring.", (uint8_t *)&v16, 2u);
    }

  }
}

- (NSString)propertyType
{
  void *v2;
  void *v3;
  int IsEmail;
  id *v5;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsEmail = IMStringIsEmail();

  v5 = (id *)MEMORY[0x1E0C967C0];
  if (IsEmail)
    v5 = (id *)MEMORY[0x1E0C966A8];
  return (NSString *)*v5;
}

- (NSString)rawAddress
{
  void *v2;
  void *v3;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)originalAddress
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[CKEntity rawAddress](self, "rawAddress");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return (NSString *)v4;
}

- (NSString)IDSCanonicalAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[CKEntity rawAddress](self, "rawAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMStripFormattingFromAddress();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKEntity propertyType](self, "propertyType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C967C0];

  if (v5 == v6)
  {
    v9 = IDSCopyIDForPhoneNumber();
    goto LABEL_5;
  }
  -[CKEntity propertyType](self, "propertyType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0C966A8];

  if (v7 == v8)
  {
    v9 = MEMORY[0x193FF32B8](v4);
LABEL_5:
    v10 = (void *)v9;

    v4 = v10;
  }
  return (NSString *)v4;
}

- (NSString)fullName
{
  void *v2;
  void *v3;
  void *v4;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E276D870, CFSTR("ChatKit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;
  void *v4;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E276D870, CFSTR("ChatKit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (NSString)textToneIdentifier
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0C96888];
  v3 = v9[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity cnContactWithKeys:](self, "cnContactWithKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sound");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)textVibrationIdentifier
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0C96888];
  v3 = v9[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity cnContactWithKeys:](self, "cnContactWithKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "vibration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_setBusinessInfoForMutableContact:(id)a3 enlargedImageData:(id)a4
{
  _CKSetBusinessInfoForMutableContact(a3, self->_handle, a4);
}

- (UIImage)locationMapViewContactImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x193FF3C18](CFSTR("FMFMapViewController"), CFSTR("FMFUI"));
    if (v4)
    {
      objc_msgSend(v4, "annotationImageSize");
      v6 = v5;
    }
    else
    {
      v6 = 0.0;
    }
    -[CKEntity rawAddress](self, "rawAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAddressBook locationSharingContactImageOfDiameter:forID:useCustomFont:](CKAddressBook, "locationSharingContactImageOfDiameter:forID:useCustomFont:", v8, 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (UIImage *)v7;
}

- (UIImage)locationShareBalloonContactImage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationShareBalloonContactImageDiameter");
  v5 = v4;
  -[CKEntity rawAddress](self, "rawAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAddressBook locationSharingContactImageOfDiameter:forID:useCustomFont:](CKAddressBook, "locationSharingContactImageOfDiameter:forID:useCustomFont:", v6, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

- (id)_croppedImageFromImageData:(id)a3
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  CGImage *v13;
  CGImage *v14;
  UIImage *v15;
  void *v16;
  CGRect v18;

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4 * 0.17;
  objc_msgSend(v3, "size");
  v7 = v6 * 0.14;
  objc_msgSend(v3, "size");
  v9 = v8 + v5 * -2.0;
  objc_msgSend(v3, "size");
  v11 = v10 + v5 * -2.0;
  v12 = objc_retainAutorelease(v3);
  v13 = (CGImage *)objc_msgSend(v12, "CGImage");
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v14 = CGImageCreateWithImageInRect(v13, v18);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v14);
  v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v14);
  UIImagePNGRepresentation(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (UIImage)transcriptContactImage
{
  return self->_transcriptContactImage;
}

- (UIImage)transcriptDrawerContactImage
{
  return self->_transcriptDrawerContactImage;
}

- (BOOL)enlargedContactImage
{
  return self->_enlargedContactImage;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (IMAccount)chatAccount
{
  return self->_chatAccount;
}

- (void)setChatAccount:(id)a3
{
  objc_storeStrong((id *)&self->_chatAccount, a3);
}

- (IMChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (CNMutableContact)cachedCNContactForNickname
{
  return self->_cachedCNContactForNickname;
}

- (void)setCachedCNContactForNickname:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCNContactForNickname, a3);
}

- (IMNickname)cachedNicknameForCNContact
{
  return self->_cachedNicknameForCNContact;
}

- (void)setCachedNicknameForCNContact:(id)a3
{
  objc_storeStrong((id *)&self->_cachedNicknameForCNContact, a3);
}

- (BOOL)cachedCNContactForNicknameIncludesImageData
{
  return self->_cachedCNContactForNicknameIncludesImageData;
}

- (void)setCachedCNContactForNicknameIncludesImageData:(BOOL)a3
{
  self->_cachedCNContactForNicknameIncludesImageData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNicknameForCNContact, 0);
  objc_storeStrong((id *)&self->_cachedCNContactForNickname, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_chatAccount, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_transcriptDrawerContactImage, 0);
  objc_storeStrong((id *)&self->_transcriptContactImage, 0);
  objc_storeStrong((id *)&self->_cnContact, 0);
}

- (BOOL)isMentionable
{
  void *v2;
  char v3;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContact");

  return v3;
}

- (id)mentionTokens
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

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity abbreviatedDisplayName](self, "abbreviatedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mentionsSafeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v5, v3);

  -[CKEntity name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mentionsSafeText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v7, v3);

  -[CKEntity fullName](self, "fullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mentionsSafeText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v9, v3);

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nickname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mentionsSafeText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v12, v3);

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mentionsSafeText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v15, v3);

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mentionsSafeText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v18, v3);

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "phoneticFirstName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mentionsSafeText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v21, v3);

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "phoneticLastName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "mentionsSafeText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v24, v3);

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "phoneticFullName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mentionsSafeText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity addToken:ifAvailableToTokens:](self, "addToken:ifAvailableToTokens:", v27, v3);

  v28 = (void *)objc_msgSend(v3, "copy");
  return v28;
}

- (void)addToken:(id)a3 ifAvailableToTokens:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v5, "addObject:", v6);

}

- (id)mentionsHandleID
{
  void *v2;
  void *v3;

  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayNameMatchingInputText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;

  v4 = a3;
  objc_msgSend(v4, "mentionsSafeText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity abbreviatedDisplayName](self, "abbreviatedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mentionsSafeText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToIgnoringCase:", v5);

  if (v8)
  {
    -[CKEntity abbreviatedDisplayName](self, "abbreviatedDisplayName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKEntity name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mentionsSafeText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToIgnoringCase:", v5);

    if (v12)
    {
      -[CKEntity name](self, "name");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKEntity fullName](self, "fullName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mentionsSafeText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToIgnoringCase:", v5);

      if (!v15)
      {
        -[CKEntity defaultIMHandle](self, "defaultIMHandle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "nickname");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "mentionsSafeText");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToIgnoringCase:", v5);

        -[CKEntity defaultIMHandle](self, "defaultIMHandle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v21)
        {
          objc_msgSend(v22, "nickname");
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v22, "firstName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "mentionsSafeText");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToIgnoringCase:", v5);

          -[CKEntity defaultIMHandle](self, "defaultIMHandle");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v28;
          if (v27)
          {
            objc_msgSend(v28, "firstName");
            v24 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v28, "lastName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "mentionsSafeText");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToIgnoringCase:", v5);

            -[CKEntity defaultIMHandle](self, "defaultIMHandle");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v32;
            if (v31)
            {
              objc_msgSend(v32, "lastName");
              v24 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v32, "phoneticFirstName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "mentionsSafeText");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "isEqualToIgnoringCase:", v5);

              -[CKEntity defaultIMHandle](self, "defaultIMHandle");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v36;
              if (v35)
              {
                objc_msgSend(v36, "phoneticFirstName");
                v24 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v36, "phoneticLastName");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "mentionsSafeText");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "isEqualToIgnoringCase:", v5);

                -[CKEntity defaultIMHandle](self, "defaultIMHandle");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v40;
                if (v39)
                {
                  objc_msgSend(v40, "phoneticLastName");
                  v24 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v40, "phoneticFullName");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "mentionsSafeText");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "isEqualToIgnoringCase:", v5);

                  if (!v43)
                  {
                    v9 = v4;
                    goto LABEL_7;
                  }
                  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "phoneticFullName");
                  v24 = objc_claimAutoreleasedReturnValue();
                }
              }
            }
          }
        }
        v16 = (void *)v24;

        goto LABEL_8;
      }
      -[CKEntity fullName](self, "fullName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_7:
  v16 = v9;
LABEL_8:

  return v16;
}

+ (BOOL)string:(id)a3 hasPrefix:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("SELF beginswith[cld] %@"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "evaluateWithObject:", v6);

  return (char)v5;
}

- (id)personViewControllerWithDelegate:(id)a3 isUnknown:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[_CKEntityContactStoreProvider sharedInstance](_CKEntityContactStoreProvider, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntity personViewControllerWithDelegate:isUnknown:contactStoreProvider:](self, "personViewControllerWithDelegate:isUnknown:contactStoreProvider:", v6, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)personViewControllerWithDelegate:(id)a3 isUnknown:(BOOL *)a4 contactStoreProvider:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[CKEntity defaultIMHandle](self, "defaultIMHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cnContactWithKeys:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v11))
  {
    *a4 = 0;
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayMode:", 2);
    objc_msgSend(v12, "setAllowsActions:", 1);
    objc_msgSend(v12, "setAllowsEditing:", 1);
    objc_msgSend(v12, "setShouldShowLinkedContacts:", 1);
    objc_msgSend(v12, "setActions:", objc_msgSend(v12, "actions") | 0x80);
    -[CKEntity propertyType](self, "propertyType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "highlightPropertyWithKey:identifier:", v13, 0);

  }
  else
  {
    *a4 = 1;
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisplayMode:", 2);
    -[CKEntity propertyType](self, "propertyType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrimaryPropertyKey:", v14);

    objc_msgSend(v12, "setAllowsActions:", 1);
    objc_msgSend(v12, "setActions:", objc_msgSend(v12, "actions") | 0x80);
  }
  objc_msgSend(v12, "setDelegate:", v7);

  return v12;
}

- (id)pinnedConversationContactItemIdentifier
{
  void *v3;
  uint64_t v4;

  -[CKEntity rawAddress](self, "rawAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    _IMWarn();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

@end
