@implementation MPModelRadioStationEvent

- (id)artworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelRadioStationEvent artworkCatalogBlock](self, "artworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelRadioStationEvent *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)heroArtworkCatalog
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[MPModelRadioStationEvent heroArtworkCatalogBlock](self, "heroArtworkCatalogBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, MPModelRadioStationEvent *))(v3 + 16))(v3, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)__title_KEY
{
  return CFSTR("MPModelPropertyRadioStationEventTitle");
}

+ (void)__MPModelPropertyRadioStationEventTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStationEvent.m"), 27, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEventTitle"));

}

+ (id)__descriptionText_KEY
{
  return CFSTR("MPModelPropertyRadioStationEventDescriptionText");
}

+ (void)__MPModelPropertyRadioStationEventDescriptionText__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStationEvent.m"), 28, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEventDescriptionText"));

}

+ (id)__startTime_KEY
{
  return CFSTR("MPModelPropertyRadioStationEventStartTime");
}

+ (void)__MPModelPropertyRadioStationEventStartTime__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStationEvent.m"), 29, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEventStartTime"));

}

+ (id)__endTime_KEY
{
  return CFSTR("MPModelPropertyRadioStationEventEndTime");
}

+ (void)__MPModelPropertyRadioStationEventEndTime__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStationEvent.m"), 30, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEventEndTime"));

}

+ (id)__artworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyRadioStationEventArtwork");
}

+ (void)__MPModelPropertyRadioStationEventArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStationEvent.m"), 31, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEventArtwork"));

}

+ (id)__heroArtworkCatalogBlock_KEY
{
  return CFSTR("MPModelPropertyRadioStationEventHeroArtwork");
}

+ (void)__MPModelPropertyRadioStationEventHeroArtwork__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelRadioStationEvent.m"), 32, CFSTR("Translator was missing mapping for MPModelPropertyRadioStationEventHeroArtwork"));

}

+ (int64_t)genericObjectType
{
  return 18;
}

@end
