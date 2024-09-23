@implementation LPFaceTimeInviteMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 1024;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  LPFaceTimeInviteMetadataProviderSpecialization *v6;

  v3 = a3;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_lp_isFaceTimeInviteURL");

  if (v5)
    v6 = -[LPMetadataProviderSpecialization initWithContext:]([LPFaceTimeInviteMetadataProviderSpecialization alloc], "initWithContext:", v3);
  else
    v6 = 0;

  return v6;
}

- (void)start
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  LPFaceTimeInviteMetadata *v7;

  -[LPMetadataProviderSpecialization URL](self, "URL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "_lp_isFaceTimeInviteURL");

  if ((v3 & 1) != 0)
  {
    v7 = objc_alloc_init(LPFaceTimeInviteMetadata);
    -[LPMetadataProviderSpecialization URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_faceTimeInviteTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFaceTimeInviteMetadata setTitle:](v7, "setTitle:", v5);

    -[LPFaceTimeInviteMetadataProviderSpecialization completeWithMetadata:](self, "completeWithMetadata:", v7);
  }
}

- (void)completeWithMetadata:(id)a3
{
  id v4;
  LPLinkMetadata *v5;
  void *v6;
  void *v7;
  LPLinkMetadata *v8;
  _QWORD v9[5];
  LPLinkMetadata *v10;

  v4 = a3;
  v5 = objc_alloc_init(LPLinkMetadata);
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setURL:](v5, "setURL:", v6);

  -[LPMetadataProviderSpecialization URL](self, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setOriginalURL:](v5, "setOriginalURL:", v7);

  -[LPLinkMetadata setSpecialization:](v5, "setSpecialization:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__LPFaceTimeInviteMetadataProviderSpecialization_completeWithMetadata___block_invoke;
  v9[3] = &unk_1E44A7D10;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __71__LPFaceTimeInviteMetadataProviderSpecialization_completeWithMetadata___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataProviderSpecialization:didCompleteWithMetadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
