@implementation LPInlineMediaPlaybackInformation

+ (id)_inlineiTunesMediaPlaybackInformationWithType:(unint64_t)a3 storeIdentifier:(id)a4 storefrontIdentifier:(id)a5 offers:(id)a6 previewURL:(id)a7 lyricExcerpt:(id)a8
{
  unint64_t v14;
  unint64_t v15;
  id v16;
  LPInlineMediaPlaybackInformation *v17;
  id v19;
  id v20;

  v14 = (unint64_t)a4;
  v20 = a5;
  v19 = a6;
  v15 = (unint64_t)a7;
  v16 = a8;
  if (v14 | v15)
  {
    v17 = objc_alloc_init(LPInlineMediaPlaybackInformation);
    v17->_type = a3;
    objc_storeStrong((id *)&v17->_storeIdentifier, a4);
    objc_storeStrong((id *)&v17->_storefrontIdentifier, a5);
    objc_storeStrong((id *)&v17->_offers, a6);
    objc_storeStrong((id *)&v17->_previewURL, a7);
    objc_storeStrong((id *)&v17->_lyricExcerpt, a8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)songPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5 previewURL:(id)a6 lyricExcerpt:(id)a7
{
  objc_msgSend(a1, "_inlineiTunesMediaPlaybackInformationWithType:storeIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:", 0, a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)albumPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5
{
  objc_msgSend(a1, "_inlineiTunesMediaPlaybackInformationWithType:storeIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:", 1, a3, a4, a5, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)radioPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4
{
  objc_msgSend(a1, "_inlineiTunesMediaPlaybackInformationWithType:storeIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:", 2, a3, a4, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)podcastPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5
{
  objc_msgSend(a1, "_inlineiTunesMediaPlaybackInformationWithType:storeIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:", 3, a3, a4, a5, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)podcastEpisodePlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 offers:(id)a5
{
  objc_msgSend(a1, "_inlineiTunesMediaPlaybackInformationWithType:storeIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:", 4, a3, a4, a5, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)playlistPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4
{
  objc_msgSend(a1, "_inlineiTunesMediaPlaybackInformationWithType:storeIdentifier:storefrontIdentifier:offers:previewURL:lyricExcerpt:", 5, a3, a4, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)audioBookPlaybackInformationWithStoreIdentifier:(id)a3 storefrontIdentifier:(id)a4 previewURL:(id)a5 persistentIdentifier:(id)a6
{
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  LPInlineMediaPlaybackInformation *v14;

  v10 = a3;
  v11 = a4;
  v12 = (unint64_t)a5;
  v13 = (unint64_t)a6;
  if (v12 | v13)
  {
    v14 = objc_alloc_init(LPInlineMediaPlaybackInformation);
    v14->_type = 6;
    objc_storeStrong((id *)&v14->_storeIdentifier, a3);
    objc_storeStrong((id *)&v14->_storefrontIdentifier, a4);
    objc_storeStrong((id *)&v14->_previewURL, a5);
    objc_storeStrong((id *)&v14->_persistentIdentifier, a6);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)audioFilePlaybackInformationWithAudio:(id)a3
{
  LPAudio *v3;
  LPInlineMediaPlaybackInformation *v4;
  LPAudio *audio;

  v3 = (LPAudio *)a3;
  v4 = objc_alloc_init(LPInlineMediaPlaybackInformation);
  v4->_type = 7;
  audio = v4->_audio;
  v4->_audio = v3;

  return v4;
}

- (unint64_t)availability
{
  NSArray *offers;
  NSArray *v4;
  uint64_t v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  offers = self->_offers;
  if (!offers || !-[NSArray count](offers, "count"))
    return 3;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_offers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
  {

    return 3;
  }
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("buy"), (_QWORD)v13) & 1) != 0)
        v6 = 1;
      else
        v7 |= objc_msgSend(v10, "isEqualToString:", CFSTR("subscription"));
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v5);

  v11 = 2;
  if ((v6 & 1) == 0)
    v11 = 3;
  if ((v7 & 1) != 0)
    v11 = 0;
  if ((v7 & v6 & 1) != 0)
    return 1;
  else
    return v11;
}

- (BOOL)isAvailableForAnonymousDownload
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  BOOL v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_offers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isEqualToString:", CFSTR("anonymousDownload"), (_QWORD)v8) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSArray)offers
{
  return self->_offers;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (LPLyricExcerptMetadata)lyricExcerpt
{
  return self->_lyricExcerpt;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_lyricExcerpt, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end
