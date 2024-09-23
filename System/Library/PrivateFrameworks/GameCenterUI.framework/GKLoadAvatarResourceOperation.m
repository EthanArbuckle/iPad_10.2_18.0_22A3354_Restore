@implementation GKLoadAvatarResourceOperation

- (GKLoadAvatarResourceOperation)initWithPlayerId:(id)a3
{
  id v4;
  GKLoadAvatarResourceOperation *v5;
  uint64_t v6;
  NSString *playerId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLoadAvatarResourceOperation;
  v5 = -[GKLoadAvatarResourceOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    playerId = v5->_playerId;
    v5->_playerId = (NSString *)v6;

  }
  return v5;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((-[GKLoadAvatarResourceOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "profileServicePrivate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKLoadAvatarResourceOperation playerId](self, "playerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__GKLoadAvatarResourceOperation_main__block_invoke;
    v7[3] = &unk_1E59C7378;
    v7[4] = self;
    objc_msgSend(v4, "getProfilesForPlayerIDs:handler:", v6, v7);

  }
}

void __37__GKLoadAvatarResourceOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "didCompleteWithResource:error:", 0, v6);
    }
    else
    {
      if (objc_msgSend(v5, "count")
        && (objc_msgSend(v5, "objectAtIndex:", 0),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        objc_msgSend(v5, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25358]), "initWithInternalRepresentation:", v8);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __37__GKLoadAvatarResourceOperation_main__block_invoke_2;
        v12[3] = &unk_1E59C7350;
        v12[4] = *(_QWORD *)(a1 + 32);
        v13 = v9;
        v10 = v9;
        objc_msgSend(v10, "loadPhotoForSize:withCompletionHandler:", 1, v12);

      }
      else
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v11, "makePlayerFetchError");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "didCompleteWithResource:error:", 0, v8);
      }

    }
  }

}

uint64_t __37__GKLoadAvatarResourceOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[5];

  if (a2 && !a3)
    return objc_msgSend(*(id *)(a1 + 32), "didCompleteWithResource:error:", a2, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__GKLoadAvatarResourceOperation_main__block_invoke_3;
  v5[3] = &unk_1E59C6E68;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v4, "monogramImageWithPhotoSize:handler:", 1, v5);
}

uint64_t __37__GKLoadAvatarResourceOperation_main__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didCompleteWithResource:error:", a2, 0);
}

- (id)makePlayerFetchError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[GKLoadAvatarResourceOperation playerId](self, "playerId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Unable to load player with Id: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("GKLoadAvatarResourceOperationErrorDomain"), 560557415, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)playerId
{
  return self->_playerId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerId, 0);
}

@end
