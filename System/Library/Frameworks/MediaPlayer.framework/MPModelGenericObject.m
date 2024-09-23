@implementation MPModelGenericObject

+ (id)__tvEpisode_KEY
{
  return CFSTR("MPModelRelationshipGenericTVEpisode");
}

+ (id)__song_KEY
{
  return CFSTR("MPModelRelationshipGenericSong");
}

+ (id)__socialPerson_KEY
{
  return CFSTR("MPModelRelationshipGenericSocialPerson");
}

+ (id)__show_KEY
{
  return CFSTR("MPModelRelationshipGenericTVShow");
}

+ (id)__season_KEY
{
  return CFSTR("MPModelRelationshipGenericTVSeason");
}

+ (id)__recordLabel_KEY
{
  return CFSTR("MPModelRelationshipGenericRecordLabel");
}

+ (id)__radioStation_KEY
{
  return CFSTR("MPModelRelationshipGenericRadioStation");
}

+ (id)__radioStationEvent_KEY
{
  return CFSTR("MPModelRelationshipGenericRadioStationEvent");
}

+ (id)__podcast_KEY
{
  return CFSTR("MPModelRelationshipGenericPodcast");
}

+ (id)__podcastEpisode_KEY
{
  return CFSTR("MPModelRelationshipGenericPodcastEpisode");
}

+ (id)__playlist_KEY
{
  return CFSTR("MPModelRelationshipGenericPlaylist");
}

+ (id)__playlistEntry_KEY
{
  return CFSTR("MPModelRelationshipGenericPlaylistEntry");
}

+ (id)__movie_KEY
{
  return CFSTR("MPModelRelationshipGenericMovie");
}

+ (id)__mediaClip_KEY
{
  return CFSTR("MPModelRelationshipGenericMediaClip");
}

+ (id)__group_KEY
{
  return CFSTR("MPModelRelationshipGenericGroup");
}

+ (id)__genre_KEY
{
  return CFSTR("MPModelRelationshipGenericGenre");
}

+ (id)__curator_KEY
{
  return CFSTR("MPModelRelationshipGenericCurator");
}

+ (id)__creditsArtist_KEY
{
  return CFSTR("MPModelRelationshipGenericCreditsArtist");
}

+ (id)__composer_KEY
{
  return CFSTR("MPModelRelationshipGenericComposer");
}

+ (id)__artist_KEY
{
  return CFSTR("MPModelRelationshipGenericArtist");
}

+ (id)__album_KEY
{
  return CFSTR("MPModelRelationshipGenericAlbum");
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSong:", *(_QWORD *)(a1 + 32));
}

- (id)identifiers
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  switch(-[MPModelGenericObject type](self, "type"))
  {
    case 1:
      -[MPModelGenericObject song](self, "song");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 2:
      -[MPModelGenericObject album](self, "album");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 3:
      -[MPModelGenericObject artist](self, "artist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 4:
      -[MPModelGenericObject playlist](self, "playlist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 5:
      -[MPModelGenericObject playlistEntry](self, "playlistEntry");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 6:
      -[MPModelGenericObject tvEpisode](self, "tvEpisode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 7:
      -[MPModelGenericObject season](self, "season");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 8:
      -[MPModelGenericObject show](self, "show");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 9:
      -[MPModelGenericObject movie](self, "movie");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 10:
      -[MPModelGenericObject mediaClip](self, "mediaClip");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 11:
      -[MPModelGenericObject podcast](self, "podcast");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 12:
      -[MPModelGenericObject podcastEpisode](self, "podcastEpisode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 13:
      -[MPModelGenericObject radioStation](self, "radioStation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 14:
      -[MPModelGenericObject composer](self, "composer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 15:
      -[MPModelGenericObject genre](self, "genre");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 16:
      -[MPModelGenericObject curator](self, "curator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 17:
      -[MPModelGenericObject socialPerson](self, "socialPerson");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 18:
      -[MPModelGenericObject radioStationEvent](self, "radioStationEvent");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 19:
      -[MPModelGenericObject recordLabel](self, "recordLabel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 20:
      -[MPModelGenericObject creditsArtist](self, "creditsArtist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 21:
      -[MPModelGenericObject group](self, "group");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
      v4 = v3;
      objc_msgSend(v3, "identifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        goto LABEL_24;
      return v5;
    default:
LABEL_24:
      v7.receiver = self;
      v7.super_class = (Class)MPModelGenericObject;
      -[MPModelObject identifiers](&v7, sel_identifiers);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
  }
}

- (int64_t)type
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__MPModelGenericObject_type__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __28__MPModelGenericObject_type__block_invoke(uint64_t a1)
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
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "album");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "artist");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 3;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "playlist");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 4;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "playlistEntry");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 5;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (v7)
            {
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 6;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "season");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              if (v8)
              {
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 7;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "show");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                if (v9)
                {
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 8;
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 32), "movie");
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v10)
                  {
                    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 9;
                  }
                  else
                  {
                    objc_msgSend(*(id *)(a1 + 32), "mediaClip");
                    v11 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v11)
                    {
                      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 10;
                    }
                    else
                    {
                      objc_msgSend(*(id *)(a1 + 32), "podcast");
                      v12 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v12)
                      {
                        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 11;
                      }
                      else
                      {
                        objc_msgSend(*(id *)(a1 + 32), "podcastEpisode");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v23)
                        {
                          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 12;
                        }
                        else
                        {
                          objc_msgSend(*(id *)(a1 + 32), "radioStation");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v22)
                          {
                            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 13;
                          }
                          else
                          {
                            objc_msgSend(*(id *)(a1 + 32), "radioStationEvent");
                            v21 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v21)
                            {
                              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 18;
                            }
                            else
                            {
                              objc_msgSend(*(id *)(a1 + 32), "composer");
                              v20 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v20)
                              {
                                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 14;
                              }
                              else
                              {
                                objc_msgSend(*(id *)(a1 + 32), "genre");
                                v19 = (void *)objc_claimAutoreleasedReturnValue();
                                if (v19)
                                {
                                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 15;
                                }
                                else
                                {
                                  objc_msgSend(*(id *)(a1 + 32), "curator");
                                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v18)
                                  {
                                    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 16;
                                  }
                                  else
                                  {
                                    objc_msgSend(*(id *)(a1 + 32), "socialPerson");
                                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (v17)
                                    {
                                      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 17;
                                    }
                                    else
                                    {
                                      objc_msgSend(*(id *)(a1 + 32), "recordLabel");
                                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                                      if (v16)
                                      {
                                        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 19;
                                      }
                                      else
                                      {
                                        objc_msgSend(*(id *)(a1 + 32), "creditsArtist");
                                        v15 = (void *)objc_claimAutoreleasedReturnValue();
                                        if (v15)
                                        {
                                          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 20;
                                        }
                                        else
                                        {
                                          objc_msgSend(*(id *)(a1 + 32), "group");
                                          v13 = (void *)objc_claimAutoreleasedReturnValue();
                                          v14 = 21;
                                          if (!v13)
                                            v14 = 0;
                                          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;

                                        }
                                      }

                                    }
                                  }

                                }
                              }

                            }
                          }

                        }
                      }

                      v11 = 0;
                    }

                    v10 = 0;
                  }

                }
              }

            }
          }

        }
      }

    }
    v2 = 0;
  }

}

void __46__MPModelGenericObject_flattenedGenericObject__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "playlistEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v2;
  if (v2)
  {
    objc_msgSend(v2, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v7;
    v3 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }

}

void __33__MPModelGenericObject_anyObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  void *v35;

  objc_msgSend(*(id *)(a1 + 32), "song");
  v2 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v2;
  if (v2)
  {
    v33 = 0;
    memset(v34, 0, sizeof(v34));
    v32 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
LABEL_17:
    v11 = (void *)v2;
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 32), "album");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v33 = 0;
    memset(v34, 0, sizeof(v34));
    v32 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v24 = (void *)v2;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "artist");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v24 = 0;
    v32 = 0;
    v33 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    memset(v34, 0, 20);
    HIDWORD(v34[2]) = 1;
    v31 = (void *)v2;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "playlist");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v24 = 0;
    v31 = 0;
    v34[0] = 0;
    v34[1] = 0;
    v32 = 0;
    v33 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v34[2] = 0x100000001;
    v30 = (void *)v2;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "playlistEntry");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    *(_QWORD *)((char *)v34 + 4) = 0;
    v32 = 0;
    v33 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    LODWORD(v34[0]) = 0;
    v34[2] = 0x100000001;
    HIDWORD(v34[1]) = 1;
    v29 = (void *)v2;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "tvEpisode");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v29 = 0;
    v33 = 0;
    v34[0] = 0;
    v32 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v28 = (void *)v2;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "season");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    v32 = 0;
    v33 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v34[0] = 0x100000000;
    v27 = (void *)v2;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "show");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    v27 = 0;
    v32 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v34[0] = 0x100000000;
    v33 = 0x100000000;
    v26 = (void *)v2;
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "movie");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v24 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 0;
    v29 = 0;
    v26 = 0;
    v27 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = (void *)v13;
    v34[2] = 0x100000001;
    v34[1] = 0x100000001;
    v34[0] = 0x100000000;
    v33 = 0x100000000;
    v32 = 0x100000000;
    v23 = (void *)v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaClip");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v23 = 0;
      v24 = 0;
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v29 = 0;
      v26 = 0;
      v27 = 0;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v34[2] = 0x100000001;
      v34[1] = 0x100000001;
      v34[0] = 0x100000000;
      v33 = 0x100000000;
      v32 = 0x100000000;
      v3 = 1;
      v25 = (void *)v2;
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 32), "podcast");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = 0;
      v24 = 0;
      v30 = 0;
      v31 = 0;
      v28 = 0;
      v29 = 0;
      v26 = 0;
      v27 = 0;
      v25 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v34[2] = 0x100000001;
      v34[1] = 0x100000001;
      v34[0] = 0x100000000;
      v33 = 0x100000000;
      v32 = 0x100000000;
      v3 = 1;
      v4 = 1;
      v11 = v22;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "podcastEpisode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v23 = 0;
        v24 = 0;
        v30 = 0;
        v31 = 0;
        v28 = 0;
        v29 = 0;
        v26 = 0;
        v27 = 0;
        v25 = 0;
        v22 = 0;
        v6 = 0;
        v7 = 0;
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v34[2] = 0x100000001;
        v34[1] = 0x100000001;
        v34[0] = 0x100000000;
        v33 = 0x100000000;
        v32 = 0x100000000;
        v3 = 1;
        v4 = 1;
        v5 = 1;
        v11 = v21;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "radioStation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v23 = 0;
          v24 = 0;
          v30 = 0;
          v31 = 0;
          v28 = 0;
          v29 = 0;
          v26 = 0;
          v27 = 0;
          v25 = 0;
          v21 = 0;
          v22 = 0;
          v7 = 0;
          v8 = 0;
          v9 = 0;
          v10 = 0;
          v34[2] = 0x100000001;
          v34[1] = 0x100000001;
          v34[0] = 0x100000000;
          v33 = 0x100000000;
          v32 = 0x100000000;
          v3 = 1;
          v4 = 1;
          v5 = 1;
          v6 = 1;
          v11 = v20;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "composer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v23 = 0;
            v24 = 0;
            v30 = 0;
            v31 = 0;
            v28 = 0;
            v29 = 0;
            v26 = 0;
            v27 = 0;
            v25 = 0;
            v21 = 0;
            v22 = 0;
            v20 = 0;
            v8 = 0;
            v9 = 0;
            v10 = 0;
            v34[2] = 0x100000001;
            v34[1] = 0x100000001;
            v34[0] = 0x100000000;
            v33 = 0x100000000;
            v32 = 0x100000000;
            v3 = 1;
            v4 = 1;
            v5 = 1;
            v6 = 1;
            v7 = 1;
            v11 = v19;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "genre");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v23 = 0;
              v24 = 0;
              v30 = 0;
              v31 = 0;
              v28 = 0;
              v29 = 0;
              v26 = 0;
              v27 = 0;
              v25 = 0;
              v21 = 0;
              v22 = 0;
              v19 = 0;
              v20 = 0;
              v9 = 0;
              v10 = 0;
              v34[2] = 0x100000001;
              v34[1] = 0x100000001;
              v34[0] = 0x100000000;
              v33 = 0x100000000;
              v32 = 0x100000000;
              v3 = 1;
              v4 = 1;
              v5 = 1;
              v6 = 1;
              v7 = 1;
              v8 = 1;
              v11 = v18;
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "curator");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v23 = 0;
                v24 = 0;
                v30 = 0;
                v31 = 0;
                v28 = 0;
                v29 = 0;
                v26 = 0;
                v27 = 0;
                v25 = 0;
                v21 = 0;
                v22 = 0;
                v19 = 0;
                v20 = 0;
                v18 = 0;
                v10 = 0;
                v34[2] = 0x100000001;
                v34[1] = 0x100000001;
                v34[0] = 0x100000000;
                v33 = 0x100000000;
                v32 = 0x100000000;
                v3 = 1;
                v4 = 1;
                v5 = 1;
                v6 = 1;
                v7 = 1;
                v8 = 1;
                v9 = 1;
                v11 = v17;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "socialPerson");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v23 = 0;
                  v24 = 0;
                  v30 = 0;
                  v31 = 0;
                  v28 = 0;
                  v29 = 0;
                  v26 = 0;
                  v27 = 0;
                  v25 = 0;
                  v21 = 0;
                  v22 = 0;
                  v19 = 0;
                  v20 = 0;
                  v17 = 0;
                  v18 = 0;
                  v34[2] = 0x100000001;
                  v34[1] = 0x100000001;
                  v34[0] = 0x100000000;
                  v33 = 0x100000000;
                  v32 = 0x100000000;
                  v3 = 1;
                  v4 = 1;
                  v5 = 1;
                  v6 = 1;
                  v7 = 1;
                  v8 = 1;
                  v9 = 1;
                  v10 = 1;
                  v11 = v16;
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 32), "recordLabel");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v15)
                  {
                    v23 = 0;
                    v24 = 0;
                    v30 = 0;
                    v31 = 0;
                    v28 = 0;
                    v29 = 0;
                    v26 = 0;
                    v27 = 0;
                    v25 = 0;
                    v21 = 0;
                    v22 = 0;
                    v19 = 0;
                    v20 = 0;
                    v17 = 0;
                    v18 = 0;
                    v16 = 0;
                    v34[2] = 0x100000001;
                    v34[1] = 0x100000001;
                    v34[0] = 0x100000000;
                    v33 = 0x100000000;
                    v32 = 0x100000001;
                    v3 = 1;
                    v4 = 1;
                    v5 = 1;
                    v6 = 1;
                    v7 = 1;
                    v8 = 1;
                    v9 = 1;
                    v10 = 1;
                    v11 = v15;
                  }
                  else
                  {
                    objc_msgSend(*(id *)(a1 + 32), "creditsArtist");
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v14)
                    {
                      v23 = 0;
                      v24 = 0;
                      v30 = 0;
                      v31 = 0;
                      v28 = 0;
                      v29 = 0;
                      v26 = 0;
                      v27 = 0;
                      v25 = 0;
                      v21 = 0;
                      v22 = 0;
                      v19 = 0;
                      v20 = 0;
                      v17 = 0;
                      v18 = 0;
                      v15 = 0;
                      v16 = 0;
                      v34[2] = 0x100000001;
                      v34[1] = 0x100000001;
                      v34[0] = 0x100000000;
                      v33 = 0x100000001;
                      v32 = 0x100000001;
                      v3 = 1;
                      v4 = 1;
                      v5 = 1;
                      v6 = 1;
                      v7 = 1;
                      v8 = 1;
                      v9 = 1;
                      v10 = 1;
                      v11 = v14;
                    }
                    else
                    {
                      objc_msgSend(*(id *)(a1 + 32), "group");
                      v11 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = 0;
                      v24 = 0;
                      v30 = 0;
                      v31 = 0;
                      v28 = 0;
                      v29 = 0;
                      v26 = 0;
                      v27 = 0;
                      v25 = 0;
                      v21 = 0;
                      v22 = 0;
                      v19 = 0;
                      v20 = 0;
                      v17 = 0;
                      v18 = 0;
                      v15 = 0;
                      v16 = 0;
                      v14 = 0;
                      v34[2] = 0x100000001;
                      v34[1] = 0x100000001;
                      v34[0] = 0x100000001;
                      v33 = 0x100000001;
                      v32 = 0x100000001;
                      v3 = 1;
                      v4 = 1;
                      v5 = 1;
                      v6 = 1;
                      v7 = 1;
                      v8 = 1;
                      v9 = 1;
                      v10 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_18:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11);
  if (LODWORD(v34[0]))

  if ((_DWORD)v33)
  if ((_DWORD)v32)
  {

    if (!v10)
      goto LABEL_24;
  }
  else if (!v10)
  {
LABEL_24:
    if (v9)
      goto LABEL_25;
    goto LABEL_33;
  }

  if (v9)
  {
LABEL_25:

    if (!v8)
      goto LABEL_26;
    goto LABEL_34;
  }
LABEL_33:
  if (!v8)
  {
LABEL_26:
    if (v7)
      goto LABEL_27;
    goto LABEL_35;
  }
LABEL_34:

  if (v7)
  {
LABEL_27:

    if (!v6)
      goto LABEL_28;
    goto LABEL_36;
  }
LABEL_35:
  if (!v6)
  {
LABEL_28:
    if (v5)
      goto LABEL_29;
LABEL_37:
    if (!v4)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_36:

  if (!v5)
    goto LABEL_37;
LABEL_29:

  if (v4)
LABEL_38:

LABEL_39:
  if (v3)

  if (HIDWORD(v32))
  if (HIDWORD(v33))

  if (HIDWORD(v34[0]))
  if (LODWORD(v34[1]))

  if (HIDWORD(v34[1]))
  if (LODWORD(v34[2]))

  if (HIDWORD(v34[2]))
  v12 = v35;
  if (!v35)
  {

    v12 = 0;
  }

}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  MPPropertySet *v32;
  MPPropertySet *v33;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelAlbum requiredStoreLibraryPersonalizationProperties](MPModelAlbum, "requiredStoreLibraryPersonalizationProperties");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("MPModelRelationshipGenericAlbum"));
  +[MPModelArtist requiredStoreLibraryPersonalizationProperties](MPModelArtist, "requiredStoreLibraryPersonalizationProperties");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v3;
  v11 = v10;

  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("MPModelRelationshipGenericArtist"));
  +[MPModelMovie requiredStoreLibraryPersonalizationProperties](MPModelMovie, "requiredStoreLibraryPersonalizationProperties");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = v3;
  v15 = v14;

  objc_msgSend(v2, "setObject:forKey:", v15, CFSTR("MPModelRelationshipGenericMovie"));
  +[MPModelPlaylistEntry requiredStoreLibraryPersonalizationProperties](MPModelPlaylistEntry, "requiredStoreLibraryPersonalizationProperties");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v3;
  v19 = v18;

  objc_msgSend(v2, "setObject:forKey:", v19, CFSTR("MPModelRelationshipGenericPlaylistEntry"));
  +[MPModelSong requiredStoreLibraryPersonalizationProperties](MPModelSong, "requiredStoreLibraryPersonalizationProperties");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = v3;
  v23 = v22;

  objc_msgSend(v2, "setObject:forKey:", v23, CFSTR("MPModelRelationshipGenericSong"));
  +[MPModelTVEpisode requiredStoreLibraryPersonalizationProperties](MPModelTVEpisode, "requiredStoreLibraryPersonalizationProperties");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (void *)v24;
  else
    v26 = v3;
  v27 = v26;

  objc_msgSend(v2, "setObject:forKey:", v27, CFSTR("MPModelRelationshipGenericTVEpisode"));
  +[MPModelTVSeason requiredStoreLibraryPersonalizationProperties](MPModelTVSeason, "requiredStoreLibraryPersonalizationProperties");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (void *)v28;
  else
    v30 = v3;
  v31 = v30;

  objc_msgSend(v2, "setObject:forKey:", v31, CFSTR("MPModelRelationshipGenericTVSeason"));
  v32 = [MPPropertySet alloc];
  v33 = -[MPPropertySet initWithProperties:relationships:](v32, "initWithProperties:relationships:", MEMORY[0x1E0C9AA60], v2);

  return v33;
}

- (id)flattenedGenericObject
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__33688;
  v9 = __Block_byref_object_dispose__33689;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MPModelGenericObject_flattenedGenericObject__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)anyObject
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__33688;
  v9 = __Block_byref_object_dispose__33689;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__MPModelGenericObject_anyObject__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)kindWithRelationshipKinds:(id)a3
{
  return +[MPModelGenericObjectKind kindWithRelationshipKinds:](MPModelGenericObjectKind, "kindWithRelationshipKinds:", a3);
}

+ (MPModelGenericObject)genericObjectWithModelObject:(id)a3
{
  id v3;
  MPModelGenericObject *v4;
  MPModelGenericObject *v5;
  void *v6;
  MPModelGenericObject *v7;
  void *v8;
  MPModelGenericObject *v9;
  void *v10;
  MPModelGenericObject *v11;
  void *v12;
  MPModelGenericObject *v13;
  void *v14;
  MPModelGenericObject *v15;
  void *v16;
  MPModelGenericObject *v17;
  void *v18;
  MPModelGenericObject *v19;
  void *v20;
  MPModelGenericObject *v21;
  void *v22;
  MPModelGenericObject *v23;
  void *v24;
  MPModelGenericObject *v25;
  void *v26;
  MPModelGenericObject *v27;
  void *v28;
  MPModelGenericObject *v29;
  void *v30;
  MPModelGenericObject *v31;
  void *v32;
  MPModelGenericObject *v33;
  void *v34;
  MPModelGenericObject *v35;
  void *v36;
  MPModelGenericObject *v37;
  void *v38;
  MPModelGenericObject *v39;
  void *v40;
  MPModelGenericObject *v41;
  void *v42;
  MPModelGenericObject *v43;
  void *v44;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (MPModelGenericObject *)v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_47;
    v5 = [MPModelGenericObject alloc];
    objc_msgSend(v3, "identifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke;
    v84[3] = &unk_1E315CC98;
    v85 = v3;
    v4 = -[MPModelObject initWithIdentifiers:block:](v5, "initWithIdentifiers:block:", v6, v84);

    if (!v4)
    {
LABEL_47:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_48;
      v7 = [MPModelGenericObject alloc];
      objc_msgSend(v3, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_2;
      v82[3] = &unk_1E315CC98;
      v83 = v3;
      v4 = -[MPModelObject initWithIdentifiers:block:](v7, "initWithIdentifiers:block:", v8, v82);

      if (!v4)
      {
LABEL_48:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_49;
        v9 = [MPModelGenericObject alloc];
        objc_msgSend(v3, "identifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_3;
        v80[3] = &unk_1E315CC98;
        v81 = v3;
        v4 = -[MPModelObject initWithIdentifiers:block:](v9, "initWithIdentifiers:block:", v10, v80);

        if (!v4)
        {
LABEL_49:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_50;
          v11 = [MPModelGenericObject alloc];
          objc_msgSend(v3, "identifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = MEMORY[0x1E0C809B0];
          v78[1] = 3221225472;
          v78[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_4;
          v78[3] = &unk_1E315CC98;
          v79 = v3;
          v4 = -[MPModelObject initWithIdentifiers:block:](v11, "initWithIdentifiers:block:", v12, v78);

          if (!v4)
          {
LABEL_50:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_51;
            v13 = [MPModelGenericObject alloc];
            objc_msgSend(v3, "identifiers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v76[0] = MEMORY[0x1E0C809B0];
            v76[1] = 3221225472;
            v76[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_5;
            v76[3] = &unk_1E315CC98;
            v77 = v3;
            v4 = -[MPModelObject initWithIdentifiers:block:](v13, "initWithIdentifiers:block:", v14, v76);

            if (!v4)
            {
LABEL_51:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_52;
              v15 = [MPModelGenericObject alloc];
              objc_msgSend(v3, "identifiers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v74[0] = MEMORY[0x1E0C809B0];
              v74[1] = 3221225472;
              v74[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_6;
              v74[3] = &unk_1E315CC98;
              v75 = v3;
              v4 = -[MPModelObject initWithIdentifiers:block:](v15, "initWithIdentifiers:block:", v16, v74);

              if (!v4)
              {
LABEL_52:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_53;
                v17 = [MPModelGenericObject alloc];
                objc_msgSend(v3, "identifiers");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v72[0] = MEMORY[0x1E0C809B0];
                v72[1] = 3221225472;
                v72[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_7;
                v72[3] = &unk_1E315CC98;
                v73 = v3;
                v4 = -[MPModelObject initWithIdentifiers:block:](v17, "initWithIdentifiers:block:", v18, v72);

                if (!v4)
                {
LABEL_53:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    goto LABEL_54;
                  v19 = [MPModelGenericObject alloc];
                  objc_msgSend(v3, "identifiers");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v70[0] = MEMORY[0x1E0C809B0];
                  v70[1] = 3221225472;
                  v70[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_8;
                  v70[3] = &unk_1E315CC98;
                  v71 = v3;
                  v4 = -[MPModelObject initWithIdentifiers:block:](v19, "initWithIdentifiers:block:", v20, v70);

                  if (!v4)
                  {
LABEL_54:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      goto LABEL_55;
                    v21 = [MPModelGenericObject alloc];
                    objc_msgSend(v3, "identifiers");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v68[0] = MEMORY[0x1E0C809B0];
                    v68[1] = 3221225472;
                    v68[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_9;
                    v68[3] = &unk_1E315CC98;
                    v69 = v3;
                    v4 = -[MPModelObject initWithIdentifiers:block:](v21, "initWithIdentifiers:block:", v22, v68);

                    if (!v4)
                    {
LABEL_55:
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_56;
                      v23 = [MPModelGenericObject alloc];
                      objc_msgSend(v3, "identifiers");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v66[0] = MEMORY[0x1E0C809B0];
                      v66[1] = 3221225472;
                      v66[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_10;
                      v66[3] = &unk_1E315CC98;
                      v67 = v3;
                      v4 = -[MPModelObject initWithIdentifiers:block:](v23, "initWithIdentifiers:block:", v24, v66);

                      if (!v4)
                      {
LABEL_56:
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                          goto LABEL_57;
                        v25 = [MPModelGenericObject alloc];
                        objc_msgSend(v3, "identifiers");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        v64[0] = MEMORY[0x1E0C809B0];
                        v64[1] = 3221225472;
                        v64[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_11;
                        v64[3] = &unk_1E315CC98;
                        v65 = v3;
                        v4 = -[MPModelObject initWithIdentifiers:block:](v25, "initWithIdentifiers:block:", v26, v64);

                        if (!v4)
                        {
LABEL_57:
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_58;
                          v27 = [MPModelGenericObject alloc];
                          objc_msgSend(v3, "identifiers");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          v62[0] = MEMORY[0x1E0C809B0];
                          v62[1] = 3221225472;
                          v62[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_12;
                          v62[3] = &unk_1E315CC98;
                          v63 = v3;
                          v4 = -[MPModelObject initWithIdentifiers:block:](v27, "initWithIdentifiers:block:", v28, v62);

                          if (!v4)
                          {
LABEL_58:
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                              goto LABEL_59;
                            v29 = [MPModelGenericObject alloc];
                            objc_msgSend(v3, "identifiers");
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            v60[0] = MEMORY[0x1E0C809B0];
                            v60[1] = 3221225472;
                            v60[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_13;
                            v60[3] = &unk_1E315CC98;
                            v61 = v3;
                            v4 = -[MPModelObject initWithIdentifiers:block:](v29, "initWithIdentifiers:block:", v30, v60);

                            if (!v4)
                            {
LABEL_59:
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                goto LABEL_60;
                              v31 = [MPModelGenericObject alloc];
                              objc_msgSend(v3, "identifiers");
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              v58[0] = MEMORY[0x1E0C809B0];
                              v58[1] = 3221225472;
                              v58[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_14;
                              v58[3] = &unk_1E315CC98;
                              v59 = v3;
                              v4 = -[MPModelObject initWithIdentifiers:block:](v31, "initWithIdentifiers:block:", v32, v58);

                              if (!v4)
                              {
LABEL_60:
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                  goto LABEL_61;
                                v33 = [MPModelGenericObject alloc];
                                objc_msgSend(v3, "identifiers");
                                v34 = (void *)objc_claimAutoreleasedReturnValue();
                                v56[0] = MEMORY[0x1E0C809B0];
                                v56[1] = 3221225472;
                                v56[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_15;
                                v56[3] = &unk_1E315CC98;
                                v57 = v3;
                                v4 = -[MPModelObject initWithIdentifiers:block:](v33, "initWithIdentifiers:block:", v34, v56);

                                if (!v4)
                                {
LABEL_61:
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                    goto LABEL_62;
                                  v35 = [MPModelGenericObject alloc];
                                  objc_msgSend(v3, "identifiers");
                                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                                  v54[0] = MEMORY[0x1E0C809B0];
                                  v54[1] = 3221225472;
                                  v54[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_16;
                                  v54[3] = &unk_1E315CC98;
                                  v55 = v3;
                                  v4 = -[MPModelObject initWithIdentifiers:block:](v35, "initWithIdentifiers:block:", v36, v54);

                                  if (!v4)
                                  {
LABEL_62:
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                      goto LABEL_63;
                                    v37 = [MPModelGenericObject alloc];
                                    objc_msgSend(v3, "identifiers");
                                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                                    v52[0] = MEMORY[0x1E0C809B0];
                                    v52[1] = 3221225472;
                                    v52[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_17;
                                    v52[3] = &unk_1E315CC98;
                                    v53 = v3;
                                    v4 = -[MPModelObject initWithIdentifiers:block:](v37, "initWithIdentifiers:block:", v38, v52);

                                    if (!v4)
                                    {
LABEL_63:
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                        goto LABEL_39;
                                      v39 = [MPModelGenericObject alloc];
                                      objc_msgSend(v3, "identifiers");
                                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                                      v50[0] = MEMORY[0x1E0C809B0];
                                      v50[1] = 3221225472;
                                      v50[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_18;
                                      v50[3] = &unk_1E315CC98;
                                      v51 = v3;
                                      v4 = -[MPModelObject initWithIdentifiers:block:](v39, "initWithIdentifiers:block:", v40, v50);

                                      if (!v4)
                                      {
LABEL_39:
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                          goto LABEL_41;
                                        v41 = [MPModelGenericObject alloc];
                                        objc_msgSend(v3, "identifiers");
                                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                                        v48[0] = MEMORY[0x1E0C809B0];
                                        v48[1] = 3221225472;
                                        v48[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_19;
                                        v48[3] = &unk_1E315CC98;
                                        v49 = v3;
                                        v4 = -[MPModelObject initWithIdentifiers:block:](v41, "initWithIdentifiers:block:", v42, v48);

                                        if (!v4)
                                        {
LABEL_41:
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v43 = [MPModelGenericObject alloc];
                                            objc_msgSend(v3, "identifiers");
                                            v44 = (void *)objc_claimAutoreleasedReturnValue();
                                            v46[0] = MEMORY[0x1E0C809B0];
                                            v46[1] = 3221225472;
                                            v46[2] = __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_20;
                                            v46[3] = &unk_1E315CC98;
                                            v47 = v3;
                                            v4 = -[MPModelObject initWithIdentifiers:block:](v43, "initWithIdentifiers:block:", v44, v46);

                                          }
                                          else
                                          {
                                            v4 = 0;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (id)mediaItemPropertyValues
{
  void *v3;
  void *v4;
  void *v5;

  v3 = 0;
  switch(-[MPModelGenericObject type](self, "type"))
  {
    case 1:
      -[MPModelGenericObject song](self, "song");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 5:
      -[MPModelGenericObject playlistEntry](self, "playlistEntry");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 6:
      -[MPModelGenericObject tvEpisode](self, "tvEpisode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 9:
      -[MPModelGenericObject movie](self, "movie");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = v4;
      objc_msgSend(v4, "mediaItemPropertyValues");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)copyWithIdentifiers:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  MPModelGenericObject *v12;
  MPModelGenericObject *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  -[MPModelGenericObject anyObject](self, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke_2;
    v19 = &unk_1E315CCC0;
    v9 = &v20;
    v20 = v7;
    v10 = v7;
    v11 = (void *)objc_msgSend(v8, "copyWithIdentifiers:block:", v6, &v16);
    +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v11, v16, v17, v18, v19);
    v12 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = [MPModelGenericObject alloc];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke;
    v21[3] = &unk_1E315CCC0;
    v9 = &v22;
    v22 = v7;
    v14 = v7;
    v12 = -[MPModelObject initWithIdentifiers:block:](v13, "initWithIdentifiers:block:", v6, v21);
  }

  return v12;
}

- (id)copyWithIdentifiers:(id)a3 propertySet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  MPModelGenericObject *v15;

  v6 = a3;
  v7 = a4;
  -[MPModelGenericObject anyObject](self, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPModelGenericObject type](self, "type");
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v7, "relationships");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelGenericObject relationshipKeyForGenericObjectType:](MPModelGenericObject, "relationshipKeyForGenericObjectType:", -[MPModelGenericObject type](self, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  if (v10)
  {
    v14 = (void *)objc_msgSend(v8, "copyWithIdentifiers:propertySet:", v6, v10);
    +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v14);
    v15 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = -[MPModelObject initWithIdentifiers:block:]([MPModelGenericObject alloc], "initWithIdentifiers:block:", v6, &__block_literal_global_33703);
  }

  return v15;
}

- (id)mergeWithObject:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPModelGenericObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelGenericObject.m"), 261, CFSTR("MPModelObject mergeWithObject: called with a different object class: %@ %@"), v24, objc_opt_class());

  }
  v6 = v5;
  -[MPModelGenericObject anyObject](self, "anyObject");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!(v7 | v8))
  {
    -[MPModelGenericObject identifiers](self, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[MPModelObject initWithIdentifiers:]([MPModelGenericObject alloc], "initWithIdentifiers:", v12);
LABEL_15:
    v20 = v13;
    goto LABEL_16;
  }
  if (!v7 || v8)
  {
    if (v7 || !v8)
    {
      v21 = -[MPModelGenericObject type](self, "type");
      if (v21 != objc_msgSend(v6, "type"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelGenericObject.m"), 281, CFSTR("MPModelObject mergeWithObject: called with a different generic relationship type: %@ %@"), self, v6);

      }
      objc_msgSend((id)v7, "mergeWithObject:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v12);
      v13 = (MPModelGenericObject *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    -[MPModelGenericObject identifiers](self, "identifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unionSet:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v9;
  }
  else
  {
    -[MPModelGenericObject identifiers](self, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)v7;
  }
  v19 = (void *)objc_msgSend(v16, "copyWithIdentifiers:", v12);
  +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v20;
}

- (id)humanDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MPModelGenericObject anyObject](self, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "humanDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("generic %@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPModelGenericObject identifiers](self, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "humanDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("generic %@"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)artworkCatalog
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = 0;
  switch(-[MPModelGenericObject type](self, "type"))
  {
    case 1:
      -[MPModelGenericObject song](self, "song");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 2:
      -[MPModelGenericObject album](self, "album");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 3:
      -[MPModelGenericObject artist](self, "artist");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 4:
      -[MPModelGenericObject playlist](self, "playlist");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 6:
      -[MPModelGenericObject tvEpisode](self, "tvEpisode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 7:
      -[MPModelGenericObject season](self, "season");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 8:
      -[MPModelGenericObject show](self, "show");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 9:
      -[MPModelGenericObject movie](self, "movie");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 10:
      -[MPModelGenericObject mediaClip](self, "mediaClip");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "previewArtworkCatalog");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 11:
      -[MPModelGenericObject podcast](self, "podcast");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 12:
      -[MPModelGenericObject podcastEpisode](self, "podcastEpisode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 13:
      -[MPModelGenericObject radioStation](self, "radioStation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 15:
      -[MPModelGenericObject genre](self, "genre");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 16:
      -[MPModelGenericObject curator](self, "curator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "editorialArtworkCatalog");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 18:
      -[MPModelGenericObject radioStationEvent](self, "radioStationEvent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 19:
      -[MPModelGenericObject recordLabel](self, "recordLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 20:
      -[MPModelGenericObject creditsArtist](self, "creditsArtist");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v5 = v4;
      objc_msgSend(v4, "artworkCatalog");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v3 = (void *)v6;

      break;
    default:
      return v3;
  }
  return v3;
}

uint64_t __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__MPModelGenericObject_copyWithIdentifiers_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)relationshipKeyForGenericObjectType:(int64_t)a3
{
  id result;
  void *v7;
  void *v8;

  result = CFSTR("MPModelRelationshipGenericAlbum");
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 169, CFSTR("Cannot provide relationship key for unknown generic object type."));

      goto LABEL_3;
    case 1:
      result = CFSTR("MPModelRelationshipGenericSong");
      break;
    case 2:
      return result;
    case 3:
      result = CFSTR("MPModelRelationshipGenericArtist");
      break;
    case 4:
      result = CFSTR("MPModelRelationshipGenericPlaylist");
      break;
    case 5:
      result = CFSTR("MPModelRelationshipGenericPlaylistEntry");
      break;
    case 6:
      result = CFSTR("MPModelRelationshipGenericTVEpisode");
      break;
    case 7:
      result = CFSTR("MPModelRelationshipGenericTVSeason");
      break;
    case 8:
      result = CFSTR("MPModelRelationshipGenericTVShow");
      break;
    case 9:
      result = CFSTR("MPModelRelationshipGenericMovie");
      break;
    case 10:
      result = CFSTR("MPModelRelationshipGenericMediaClip");
      break;
    case 11:
      result = CFSTR("MPModelRelationshipGenericPodcast");
      break;
    case 12:
      result = CFSTR("MPModelRelationshipGenericPodcastEpisode");
      break;
    case 13:
      result = CFSTR("MPModelRelationshipGenericRadioStation");
      break;
    case 14:
      result = CFSTR("MPModelRelationshipGenericComposer");
      break;
    case 15:
      result = CFSTR("MPModelRelationshipGenericGenre");
      break;
    case 16:
      result = CFSTR("MPModelRelationshipGenericCurator");
      break;
    case 17:
      result = CFSTR("MPModelRelationshipGenericSocialPerson");
      break;
    case 18:
      result = CFSTR("MPModelRelationshipGenericRadioStationEvent");
      break;
    case 19:
      result = CFSTR("MPModelRelationshipGenericRecordLabel");
      break;
    case 20:
      result = CFSTR("MPModelRelationshipGenericCreditsArtist");
      break;
    case 21:
      result = CFSTR("MPModelRelationshipGenericGroup");
      break;
    default:
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 171, CFSTR("Unsupported generic object type: %ld"), a3);

      result = 0;
      break;
  }
  return result;
}

+ (void)__MPModelRelationshipGenericSong__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 291, CFSTR("Translator was missing mapping for MPModelRelationshipGenericSong"));

}

+ (void)__MPModelRelationshipGenericAlbum__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 292, CFSTR("Translator was missing mapping for MPModelRelationshipGenericAlbum"));

}

+ (void)__MPModelRelationshipGenericArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 293, CFSTR("Translator was missing mapping for MPModelRelationshipGenericArtist"));

}

+ (void)__MPModelRelationshipGenericPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 294, CFSTR("Translator was missing mapping for MPModelRelationshipGenericPlaylist"));

}

+ (void)__MPModelRelationshipGenericPlaylistEntry__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 295, CFSTR("Translator was missing mapping for MPModelRelationshipGenericPlaylistEntry"));

}

+ (void)__MPModelRelationshipGenericTVEpisode__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 296, CFSTR("Translator was missing mapping for MPModelRelationshipGenericTVEpisode"));

}

+ (void)__MPModelRelationshipGenericTVSeason__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 297, CFSTR("Translator was missing mapping for MPModelRelationshipGenericTVSeason"));

}

+ (void)__MPModelRelationshipGenericTVShow__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 298, CFSTR("Translator was missing mapping for MPModelRelationshipGenericTVShow"));

}

+ (void)__MPModelRelationshipGenericMovie__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 299, CFSTR("Translator was missing mapping for MPModelRelationshipGenericMovie"));

}

+ (void)__MPModelRelationshipGenericMediaClip__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 300, CFSTR("Translator was missing mapping for MPModelRelationshipGenericMediaClip"));

}

+ (void)__MPModelRelationshipGenericPodcast__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 301, CFSTR("Translator was missing mapping for MPModelRelationshipGenericPodcast"));

}

+ (void)__MPModelRelationshipGenericPodcastEpisode__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 302, CFSTR("Translator was missing mapping for MPModelRelationshipGenericPodcastEpisode"));

}

+ (void)__MPModelRelationshipGenericRadioStation__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 303, CFSTR("Translator was missing mapping for MPModelRelationshipGenericRadioStation"));

}

+ (void)__MPModelRelationshipGenericRadioStationEvent__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 304, CFSTR("Translator was missing mapping for MPModelRelationshipGenericRadioStationEvent"));

}

+ (void)__MPModelRelationshipGenericComposer__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 305, CFSTR("Translator was missing mapping for MPModelRelationshipGenericComposer"));

}

+ (void)__MPModelRelationshipGenericGenre__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 306, CFSTR("Translator was missing mapping for MPModelRelationshipGenericGenre"));

}

+ (void)__MPModelRelationshipGenericCurator__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 307, CFSTR("Translator was missing mapping for MPModelRelationshipGenericCurator"));

}

+ (void)__MPModelRelationshipGenericSocialPerson__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 308, CFSTR("Translator was missing mapping for MPModelRelationshipGenericSocialPerson"));

}

+ (void)__MPModelRelationshipGenericRecordLabel__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 309, CFSTR("Translator was missing mapping for MPModelRelationshipGenericRecordLabel"));

}

+ (void)__MPModelRelationshipGenericCreditsArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 310, CFSTR("Translator was missing mapping for MPModelRelationshipGenericCreditsArtist"));

}

+ (void)__MPModelRelationshipGenericGroup__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelGenericObject.m"), 311, CFSTR("Translator was missing mapping for MPModelRelationshipGenericGroup"));

}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlbum:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setArtist:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaylist:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlaylistEntry:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTvEpisode:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSeason:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShow:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMovie:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMediaClip:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPodcast:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPodcastEpisode:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRadioStation:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setComposer:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGenre:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCurator:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSocialPerson:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_18(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRecordLabel:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_19(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCreditsArtist:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__MPModelGenericObject_genericObjectWithModelObject___block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGroup:", *(_QWORD *)(a1 + 32));
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "relationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[MPModelGenericObject type](self, "type"))
  {
    case 1:
      -[MPModelGenericObject song](self, "song");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericSong"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    case 2:
      -[MPModelGenericObject album](self, "album");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericAlbum"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    case 3:
      -[MPModelGenericObject artist](self, "artist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericArtist"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    case 4:
      -[MPModelGenericObject playlist](self, "playlist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericPlaylist"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    case 5:
      -[MPModelGenericObject playlistEntry](self, "playlistEntry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericPlaylistEntry"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    case 6:
      -[MPModelGenericObject tvEpisode](self, "tvEpisode");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericTVEpisode"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    case 7:
      -[MPModelGenericObject season](self, "season");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericTVSeason"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    case 9:
      -[MPModelGenericObject movie](self, "movie");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("MPModelRelationshipGenericMovie"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6)
      {
        +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_25:
      objc_msgSend(v5, "personalizationScopedPropertiesForProperties:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {

        v6 = 0;
      }

      if (!v8)
        goto LABEL_28;
      goto LABEL_29;
    default:
LABEL_28:
      +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

      return v8;
  }
}

- (id)relativeModelObjectForStoreLibraryPersonalization
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = 0;
  switch(-[MPModelGenericObject type](self, "type"))
  {
    case 1:
      -[MPModelGenericObject song](self, "song");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      -[MPModelGenericObject album](self, "album");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      -[MPModelGenericObject artist](self, "artist");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      -[MPModelGenericObject playlist](self, "playlist");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      -[MPModelGenericObject playlistEntry](self, "playlistEntry");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6:
      -[MPModelGenericObject tvEpisode](self, "tvEpisode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 7:
      -[MPModelGenericObject season](self, "season");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 9:
      -[MPModelGenericObject movie](self, "movie");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "relativeModelObjectForStoreLibraryPersonalization");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v3 = (void *)v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (MPModelGenericObject)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MPModelGenericObject anyObject](self, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectWithStoreLibraryPersonalizationRelativeModelObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPModelGenericObject *)v7;
}

@end
