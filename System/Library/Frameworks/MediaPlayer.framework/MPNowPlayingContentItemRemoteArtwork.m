@implementation MPNowPlayingContentItemRemoteArtwork

- (MPNowPlayingContentItemRemoteArtwork)initWithArtworkURLString:(id)a3 templateData:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  MPNowPlayingContentItemRemoteArtwork *v10;

  v6 = (objc_class *)MEMORY[0x1E0D4C600];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithArtworkURLString:templateData:", v8, v7);

  v10 = -[MPNowPlayingContentItemRemoteArtwork initWithMediaRemoteRemoteArtwork:](self, "initWithMediaRemoteRemoteArtwork:", v9);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  MPNowPlayingContentItemRemoteArtwork *v4;
  MPNowPlayingContentItemRemoteArtwork *v5;
  id v6;
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;

  v4 = (MPNowPlayingContentItemRemoteArtwork *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MPNowPlayingContentItemRemoteArtwork artworkURLString](self, "artworkURLString");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[MPNowPlayingContentItemRemoteArtwork artworkURLString](v5, "artworkURLString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      -[MPNowPlayingContentItemRemoteArtwork artworkURLTemplateData](self, "artworkURLTemplateData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPNowPlayingContentItemRemoteArtwork artworkURLTemplateData](v5, "artworkURLTemplateData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        v9 = 1;
      else
        v9 = objc_msgSend(v10, "isEqual:", v11);

      goto LABEL_13;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v3 = MSVHasherSharedSeed();
  v35 = v3 ^ 0x736F6D6570736575;
  v36 = v4 ^ 0x646F72616E646F6DLL;
  v37 = v3 ^ 0x6C7967656E657261;
  v38 = v4 ^ 0x7465646279746573;
  -[MPNowPlayingContentItemRemoteArtwork artworkURLString](self, "artworkURLString");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  objc_msgSend(v5, "length");

  -[MPNowPlayingContentItemRemoteArtwork artworkURLTemplateData](self, "artworkURLTemplateData");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");

  v7 = (v35 + v36) ^ __ROR8__(v36, 51);
  v8 = __ROR8__(v38, 48);
  v9 = ((v37 + v38) ^ v8) + __ROR8__(v35 + v36, 32);
  v10 = v9 ^ __ROR8__((v37 + v38) ^ v8, 43);
  v11 = v37 + v38 + v7;
  v12 = v11 ^ __ROR8__(v7, 47);
  v13 = v9 + v12;
  v14 = (v9 + v12) ^ __ROR8__(v12, 51);
  v15 = (__ROR8__(v11, 32) ^ 0xFFLL) + v10;
  v16 = __ROR8__(v10, 48);
  v17 = __ROR8__(v13, 32) + (v15 ^ v16);
  v18 = v17 ^ __ROR8__(v15 ^ v16, 43);
  v19 = v14 + v15;
  v20 = v19 ^ __ROR8__(v14, 47);
  v21 = v20 + v17;
  v22 = v21 ^ __ROR8__(v20, 51);
  v23 = __ROR8__(v19, 32) + v18;
  v24 = __ROR8__(v18, 48);
  v25 = __ROR8__(v21, 32) + (v23 ^ v24);
  v26 = v25 ^ __ROR8__(v23 ^ v24, 43);
  v27 = v22 + v23;
  v28 = v27 ^ __ROR8__(v22, 47);
  v29 = v28 + v25;
  v30 = v29 ^ __ROR8__(v28, 51);
  v31 = __ROR8__(v27, 32) + v26;
  v32 = __ROR8__(v26, 48);
  v33 = __ROR8__(v29, 32) + (v31 ^ v32);
  return (v30 + v31) ^ __ROR8__(v30, 47) ^ v33 ^ __ROR8__(v30 + v31, 32) ^ v33 ^ __ROR8__(v31 ^ v32, 43);
}

- (MPNowPlayingContentItemRemoteArtwork)initWithMediaRemoteRemoteArtwork:(id)a3
{
  id v5;
  MPNowPlayingContentItemRemoteArtwork *v6;
  MPNowPlayingContentItemRemoteArtwork *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPNowPlayingContentItemRemoteArtwork;
  v6 = -[MPNowPlayingContentItemRemoteArtwork init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaRemoteRemoteArtwork, a3);

  return v7;
}

- (NSString)artworkURLString
{
  return (NSString *)-[MRRemoteArtwork artworkURLString](self->_mediaRemoteRemoteArtwork, "artworkURLString");
}

- (NSData)artworkURLTemplateData
{
  return (NSData *)-[MRRemoteArtwork artworkURLTemplateData](self->_mediaRemoteRemoteArtwork, "artworkURLTemplateData");
}

- (MRRemoteArtwork)mediaRemoteRemoteArtwork
{
  return self->_mediaRemoteRemoteArtwork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteRemoteArtwork, 0);
}

@end
