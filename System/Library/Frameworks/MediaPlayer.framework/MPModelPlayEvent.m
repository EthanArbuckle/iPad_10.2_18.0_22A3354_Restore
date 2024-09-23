@implementation MPModelPlayEvent

+ (id)__radioStation_KEY
{
  return CFSTR("MPModelRelationshipPlayEventRadioStation");
}

+ (id)__playlist_KEY
{
  return CFSTR("MPModelRelationshipPlayEventPlaylist");
}

+ (id)__group_KEY
{
  return CFSTR("MPModelRelationshipPlayEventGroup");
}

+ (id)__featureName_KEY
{
  return CFSTR("MPModelPropertyPlayEventFeatureName");
}

+ (id)__datePlayed_KEY
{
  return CFSTR("MPModelPropertyPlayEventDatePlayed");
}

+ (id)__artist_KEY
{
  return CFSTR("MPModelRelationshipPlayEventArtist");
}

+ (id)__album_KEY
{
  return CFSTR("MPModelRelationshipPlayEventAlbum");
}

- (id)contentItemCollectionInfo
{
  void *v3;
  void *v4;
  void *v5;

  switch(-[MPModelPlayEvent itemType](self, "itemType"))
  {
    case 1:
      -[MPModelPlayEvent album](self, "album");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[MPModelPlayEvent artist](self, "artist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[MPModelPlayEvent playlist](self, "playlist");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      -[MPModelPlayEvent radioStation](self, "radioStation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = v3;
      objc_msgSend(v3, "contentItemCollectionInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

void __28__MPModelPlayEvent_itemType__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "album");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "artist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v3 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "playlist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v3 = 3;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "radioStation");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v3 = 4;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "group");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
            return;
          v3 = 5;
        }
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
}

void __47__MPModelPlayEvent_genericObjectRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "album");
  v2 = objc_claimAutoreleasedReturnValue();
  v18 = (id)v2;
  if (v2)
  {
    +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "artist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "playlist");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "radioStation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "group");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v14);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v17 = *(void **)(v16 + 40);
            *(_QWORD *)(v16 + 40) = v15;

          }
        }

      }
    }

  }
}

- (int64_t)itemType
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
  v4[2] = __28__MPModelPlayEvent_itemType__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "setRadioStation:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "setAlbum:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "setPlaylist:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "setArtist:", *(_QWORD *)(a1 + 32));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v3, "setGroup:", *(_QWORD *)(a1 + 32));
        }
      }
    }
  }
  objc_msgSend(v3, "setFeatureName:", *(_QWORD *)(a1 + 40));

}

+ (MPModelPlayEvent)playEventWithModelObject:(id)a3 featureName:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  MPModelPlayEvent *v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  MPModelPlayEvent *v12;
  _QWORD v14[4];
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = (uint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)v5, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke;
      v17[3] = &unk_1E3154300;
      v9 = &v18;
      v18 = (id)v6;
      v7 = (MPModelPlayEvent *)objc_msgSend((id)v5, "copyWithIdentifiers:block:", v8, v17);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)v5, "flattenedGenericObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anyObject");
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = v11;
      }
      v12 = [MPModelPlayEvent alloc];
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke_2;
      v14[3] = &unk_1E3154328;
      v9 = (id *)&v15;
      v15 = v5;
      v16 = (id)v6;
      v5 = (uint64_t)(id)v5;
      v7 = -[MPModelObject initWithIdentifiers:block:](v12, "initWithIdentifiers:block:", v8, v14);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)genericObjectRepresentation
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
  v8 = __Block_byref_object_copy__5654;
  v9 = __Block_byref_object_dispose__5655;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__MPModelPlayEvent_genericObjectRepresentation__block_invoke;
  v4[3] = &unk_1E3163580;
  v4[4] = self;
  v4[5] = &v5;
  +[MPModelObject performWithoutEnforcement:](MPModelObject, "performWithoutEnforcement:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (void)__MPModelPropertyPlayEventDatePlayed__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlayEvent.m"), 20, CFSTR("Translator was missing mapping for MPModelPropertyPlayEventDatePlayed"));

}

+ (void)__MPModelPropertyPlayEventFeatureName__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlayEvent.m"), 21, CFSTR("Translator was missing mapping for MPModelPropertyPlayEventFeatureName"));

}

+ (void)__MPModelRelationshipPlayEventAlbum__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlayEvent.m"), 22, CFSTR("Translator was missing mapping for MPModelRelationshipPlayEventAlbum"));

}

+ (void)__MPModelRelationshipPlayEventArtist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlayEvent.m"), 23, CFSTR("Translator was missing mapping for MPModelRelationshipPlayEventArtist"));

}

+ (void)__MPModelRelationshipPlayEventPlaylist__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlayEvent.m"), 24, CFSTR("Translator was missing mapping for MPModelRelationshipPlayEventPlaylist"));

}

+ (void)__MPModelRelationshipPlayEventRadioStation__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlayEvent.m"), 25, CFSTR("Translator was missing mapping for MPModelRelationshipPlayEventRadioStation"));

}

+ (void)__MPModelRelationshipPlayEventGroup__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelPlayEvent.m"), 26, CFSTR("Translator was missing mapping for MPModelRelationshipPlayEventGroup"));

}

uint64_t __57__MPModelPlayEvent_playEventWithModelObject_featureName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFeatureName:", *(_QWORD *)(a1 + 32));
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  switch(-[MPModelPlayEvent itemType](self, "itemType"))
  {
    case 1:
      -[MPModelPlayEvent album](self, "album");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[MPModelPlayEvent artist](self, "artist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[MPModelPlayEvent playlist](self, "playlist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
      -[MPModelPlayEvent radioStation](self, "radioStation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = v5;
      objc_msgSend(v5, "name");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      -[MPModelPlayEvent group](self, "group");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = v3;
      objc_msgSend(v3, "title");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v4 = (void *)v7;

      break;
    default:
      v4 = 0;
      break;
  }
  return (NSString *)v4;
}

@end
