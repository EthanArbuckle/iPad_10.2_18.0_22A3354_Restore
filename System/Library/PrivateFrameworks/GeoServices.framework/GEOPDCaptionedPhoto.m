@implementation GEOPDCaptionedPhoto

+ (id)captionedPhotosForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__GEOPDCaptionedPhoto_PlaceDataExtras__captionedPhotosForPlaceData___block_invoke;
  v10[3] = &unk_1E1C09968;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateValidComponentValuesOfType:usingBlock:", 26, v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __68__GEOPDCaptionedPhoto_PlaceDataExtras__captionedPhotosForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (v3 && *((_QWORD *)v3 + 16))
  {
    v5 = v3;
    -[GEOPDComponentValue captionedPhoto]((id *)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

    v3 = v5;
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x80u;
    *(_WORD *)(a1 + 108) |= 0x8000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDCaptionedPhoto readAll:](a1, 0);
    -[GEOPDPhoto clearUnknownFields:](*(_QWORD *)(a1 + 80));
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)(v3 + 80) |= 2u;
      *(_BYTE *)(v3 + 80) |= 0x80u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 72));
      v4 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = 0;

      -[GEOPDJoeColor readAll:](v3, 0);
    }
    -[GEOPDAttribution clearUnknownFields:](*(_QWORD *)(a1 + 24), 1);
  }
}

- (GEOPDCaptionedPhoto)init
{
  GEOPDCaptionedPhoto *v2;
  GEOPDCaptionedPhoto *v3;
  GEOPDCaptionedPhoto *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDCaptionedPhoto;
  v2 = -[GEOPDCaptionedPhoto init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCaptionedPhoto)initWithData:(id)a3
{
  GEOPDCaptionedPhoto *v3;
  GEOPDCaptionedPhoto *v4;
  GEOPDCaptionedPhoto *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDCaptionedPhoto;
  v3 = -[GEOPDCaptionedPhoto initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCaption
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCaption_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)caption
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCaptionedPhoto _readCaption]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setCaption:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x400u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readAuthor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuthor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)author
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCaptionedPhoto _readAuthor]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setAuthor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x200u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readLicenseDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicenseDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)licenseDescription
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCaptionedPhoto _readLicenseDescription]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setLicenseDescription:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x1000u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 64), a2);

}

- (void)_readLicenseUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLicenseUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)licenseUrl
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCaptionedPhoto _readLicenseUrl]((uint64_t)a1);
    a1 = (id *)v1[9];
  }
  return a1;
}

- (void)setLicenseUrl:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x2000u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 72), a2);

}

- (void)_readPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)photo
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCaptionedPhoto _readPhoto]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)setPhoto:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x4000u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 80), a2);

}

- (void)_readJoeColor
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readJoeColor_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)joeColor
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCaptionedPhoto _readJoeColor]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setJoeColor:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x800u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readAttribution
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttribution_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (id)attribution
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDCaptionedPhoto _readAttribution]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setAttribution:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 108) |= 0x100u;
  *(_WORD *)(a1 + 108) |= 0x8000u;
  objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOPDCaptionedPhoto;
  -[GEOPDCaptionedPhoto description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCaptionedPhoto dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCaptionedPhoto _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  __int16 v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;

  if (!a1)
    return 0;
  -[GEOPDCaptionedPhoto readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCaptionedPhoto caption]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("caption"));

  -[GEOPDCaptionedPhoto author]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("author"));

  -[GEOPDCaptionedPhoto licenseDescription]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("licenseDescription");
    else
      v8 = CFSTR("license_description");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  -[GEOPDCaptionedPhoto licenseUrl]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("licenseUrl");
    else
      v10 = CFSTR("license_url");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  -[GEOPDCaptionedPhoto photo]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("photo"));

  }
  v14 = *(_WORD *)(a1 + 108);
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("displayFullPhotoInline");
    else
      v22 = CFSTR("display_full_photo_inline");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    v14 = *(_WORD *)(a1 + 108);
    if ((v14 & 0x40) == 0)
    {
LABEL_23:
      if ((v14 & 8) == 0)
        goto LABEL_24;
      goto LABEL_41;
    }
  }
  else if ((v14 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 105));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("useGallery");
  else
    v24 = CFSTR("use_gallery");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v14 = *(_WORD *)(a1 + 108);
  if ((v14 & 8) == 0)
  {
LABEL_24:
    if ((v14 & 0x10) == 0)
      goto LABEL_25;
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 103));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("isBusinessOwned");
    else
      v28 = CFSTR("is_business_owned");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    if ((*(_WORD *)(a1 + 108) & 4) == 0)
      goto LABEL_30;
    goto LABEL_26;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 102));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("highQuality");
  else
    v26 = CFSTR("high_quality");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v14 = *(_WORD *)(a1 + 108);
  if ((v14 & 0x10) != 0)
    goto LABEL_45;
LABEL_25:
  if ((v14 & 4) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 101));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("displayFullScreenPhotoGallery");
    else
      v16 = CFSTR("display_full_screen_photo_gallery");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
LABEL_30:
  -[GEOPDCaptionedPhoto joeColor]((id *)a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("joeColor");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("joe_color");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  -[GEOPDCaptionedPhoto attribution]((id *)a1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v29, "jsonRepresentation");
    else
      objc_msgSend(v29, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("attribution"));

  }
  v32 = *(_WORD *)(a1 + 108);
  if ((v32 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("dateAdded");
    else
      v34 = CFSTR("date_added");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    v32 = *(_WORD *)(a1 + 108);
  }
  if ((v32 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("obfuscateFullScreenPhoto");
    else
      v36 = CFSTR("obfuscate_full_screen_photo");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  v37 = *(void **)(a1 + 16);
  if (v37)
  {
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __49__GEOPDCaptionedPhoto__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E1C00600;
      v41 = v40;
      v45 = v41;
      objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v44);
      v42 = v41;

      v39 = v42;
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCaptionedPhoto _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_922;
      else
        v6 = (int *)&readAll__nonRecursiveTag_923;
      GEOPDCaptionedPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDCaptionedPhotoCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

void __49__GEOPDCaptionedPhoto__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  GEOPDPhoto *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  char v22;
  const __CFString *v23;
  void *v24;
  char v25;
  const __CFString *v26;
  void *v27;
  char v28;
  const __CFString *v29;
  void *v30;
  char v31;
  const __CFString *v32;
  void *v33;
  char v34;
  const __CFString *v35;
  void *v36;
  GEOPDJoeColor *v37;
  id v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  GEOPDAttribution *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  uint64_t v61;
  const __CFString *v62;
  void *v63;
  char v64;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("caption"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "copy");
      -[GEOPDCaptionedPhoto setCaption:](v6, v8);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("author"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(v9, "copy");
      -[GEOPDCaptionedPhoto setAuthor:](v6, v10);

    }
    if (a3)
      v11 = CFSTR("licenseDescription");
    else
      v11 = CFSTR("license_description");
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[GEOPDCaptionedPhoto setLicenseDescription:](v6, v13);

    }
    if (a3)
      v14 = CFSTR("licenseUrl");
    else
      v14 = CFSTR("license_url");
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (void *)objc_msgSend(v15, "copy");
      -[GEOPDCaptionedPhoto setLicenseUrl:](v6, v16);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = [GEOPDPhoto alloc];
      if (v18)
        v19 = (void *)-[GEOPDPhoto _initWithDictionary:isJSON:](v18, v17, a3);
      else
        v19 = 0;
      -[GEOPDCaptionedPhoto setPhoto:](v6, v19);

    }
    if (a3)
      v20 = CFSTR("displayFullPhotoInline");
    else
      v20 = CFSTR("display_full_photo_inline");
    objc_msgSend(v5, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "BOOLValue");
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 2u;
      *(_BYTE *)(v6 + 100) = v22;
    }

    if (a3)
      v23 = CFSTR("useGallery");
    else
      v23 = CFSTR("use_gallery");
    objc_msgSend(v5, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = objc_msgSend(v24, "BOOLValue");
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 0x40u;
      *(_BYTE *)(v6 + 105) = v25;
    }

    if (a3)
      v26 = CFSTR("highQuality");
    else
      v26 = CFSTR("high_quality");
    objc_msgSend(v5, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = objc_msgSend(v27, "BOOLValue");
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 8u;
      *(_BYTE *)(v6 + 102) = v28;
    }

    if (a3)
      v29 = CFSTR("isBusinessOwned");
    else
      v29 = CFSTR("is_business_owned");
    objc_msgSend(v5, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = objc_msgSend(v30, "BOOLValue");
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 0x10u;
      *(_BYTE *)(v6 + 103) = v31;
    }

    if (a3)
      v32 = CFSTR("displayFullScreenPhotoGallery");
    else
      v32 = CFSTR("display_full_screen_photo_gallery");
    objc_msgSend(v5, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = objc_msgSend(v33, "BOOLValue");
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 4u;
      *(_BYTE *)(v6 + 101) = v34;
    }

    if (a3)
      v35 = CFSTR("joeColor");
    else
      v35 = CFSTR("joe_color");
    objc_msgSend(v5, "objectForKeyedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = [GEOPDJoeColor alloc];
      if (v37)
      {
        v38 = v36;
        v37 = -[GEOPDJoeColor init](v37, "init");
        if (v37)
        {
          if (a3)
            v39 = CFSTR("backgroundColor");
          else
            v39 = CFSTR("background_color");
          objc_msgSend(v38, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v41 = (void *)objc_msgSend(v40, "copy");
            -[GEOPDJoeColor setBackgroundColor:]((uint64_t)v37, v41);

          }
          if (a3)
            v42 = CFSTR("primaryTextColor");
          else
            v42 = CFSTR("primary_text_color");
          objc_msgSend(v38, "objectForKeyedSubscript:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = (void *)objc_msgSend(v43, "copy");
            -[GEOPDJoeColor setPrimaryTextColor:]((uint64_t)v37, v44);

          }
          if (a3)
            v45 = CFSTR("secondaryTextColor");
          else
            v45 = CFSTR("secondary_text_color");
          objc_msgSend(v38, "objectForKeyedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = (void *)objc_msgSend(v46, "copy");
            -[GEOPDJoeColor setSecondaryTextColor:]((uint64_t)v37, v47);

          }
          if (a3)
            v48 = CFSTR("tertiaryTextColor");
          else
            v48 = CFSTR("tertiary_text_color");
          objc_msgSend(v38, "objectForKeyedSubscript:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = (void *)objc_msgSend(v49, "copy");
            -[GEOPDJoeColor setTertiaryTextColor:]((uint64_t)v37, v50);

          }
          if (a3)
            v51 = CFSTR("quaternaryTextColor");
          else
            v51 = CFSTR("quaternary_text_color");
          objc_msgSend(v38, "objectForKeyedSubscript:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v53 = (void *)objc_msgSend(v52, "copy");
            -[GEOPDJoeColor setQuaternaryTextColor:]((uint64_t)v37, v53);

          }
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("curated"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v55 = objc_msgSend(v54, "BOOLValue");
            *(_BYTE *)&v37->_flags |= 0x80u;
            *(_BYTE *)&v37->_flags |= 1u;
            v37->_curated = v55;
          }

        }
      }
      -[GEOPDCaptionedPhoto setJoeColor:](v6, v37);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attribution"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = [GEOPDAttribution alloc];
      if (v57)
        v58 = (void *)-[GEOPDAttribution _initWithDictionary:isJSON:](v57, v56, a3);
      else
        v58 = 0;
      -[GEOPDCaptionedPhoto setAttribution:](v6, v58);

    }
    if (a3)
      v59 = CFSTR("dateAdded");
    else
      v59 = CFSTR("date_added");
    objc_msgSend(v5, "objectForKeyedSubscript:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v60, "doubleValue");
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 1u;
      *(_QWORD *)(v6 + 48) = v61;
    }

    if (a3)
      v62 = CFSTR("obfuscateFullScreenPhoto");
    else
      v62 = CFSTR("obfuscate_full_screen_photo");
    objc_msgSend(v5, "objectForKeyedSubscript:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v64 = objc_msgSend(v63, "BOOLValue");
      *(_WORD *)(v6 + 108) |= 0x8000u;
      *(_WORD *)(v6 + 108) |= 0x20u;
      *(_BYTE *)(v6 + 104) = v64;
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDCaptionedPhotoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  __int16 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDCaptionedPhotoIsDirty((uint64_t)self))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_34;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 0);
  if (self->_caption)
    PBDataWriterWriteStringField();
  v5 = v10;
  if (self->_author)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  if (self->_licenseDescription)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  if (self->_licenseUrl)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  if (self->_photo)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v10;
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_15:
      if ((flags & 8) == 0)
        goto LABEL_16;
      goto LABEL_30;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  v5 = v10;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_16:
    if ((flags & 0x10) == 0)
      goto LABEL_17;
LABEL_31:
    PBDataWriterWriteBOOLField();
    v5 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  v5 = v10;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_31;
LABEL_17:
  if ((flags & 4) != 0)
  {
LABEL_18:
    PBDataWriterWriteBOOLField();
    v5 = v10;
  }
LABEL_19:
  if (self->_joeColor)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  if (self->_attribution)
  {
    PBDataWriterWriteSubmessage();
    v5 = v10;
  }
  v7 = (__int16)self->_flags;
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v5 = v10;
    v7 = (__int16)self->_flags;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v10;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_34:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  __int16 flags;
  id v20;
  void *v21;
  id v22;
  void *v23;
  __int16 v24;
  PBUnknownFields *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDCaptionedPhotoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_caption, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_author, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_licenseDescription, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  v15 = -[NSString copyWithZone:](self->_licenseUrl, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  v17 = -[GEOPDPhoto copyWithZone:](self->_photo, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v17;

  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_displayFullPhotoInline;
    *(_WORD *)(v5 + 108) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((flags & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 105) = self->_useGallery;
  *(_WORD *)(v5 + 108) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
LABEL_20:
    *(_BYTE *)(v5 + 103) = self->_isBusinessOwned;
    *(_WORD *)(v5 + 108) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_19:
  *(_BYTE *)(v5 + 102) = self->_highQuality;
  *(_WORD *)(v5 + 108) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_20;
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    *(_BYTE *)(v5 + 101) = self->_displayFullScreenPhotoGallery;
    *(_WORD *)(v5 + 108) |= 4u;
  }
LABEL_11:
  v20 = -[GEOPDJoeColor copyWithZone:](self->_joeColor, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v22 = -[GEOPDAttribution copyWithZone:](self->_attribution, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  v24 = (__int16)self->_flags;
  if ((v24 & 1) != 0)
  {
    *(double *)(v5 + 48) = self->_dateAdded;
    *(_WORD *)(v5 + 108) |= 1u;
    v24 = (__int16)self->_flags;
  }
  if ((v24 & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 104) = self->_obfuscateFullScreenPhoto;
    *(_WORD *)(v5 + 108) |= 0x20u;
  }
  v25 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *caption;
  NSString *author;
  NSString *licenseDescription;
  NSString *licenseUrl;
  GEOPDPhoto *photo;
  __int16 flags;
  __int16 v11;
  GEOPDJoeColor *joeColor;
  GEOPDAttribution *attribution;
  __int16 v14;
  __int16 v15;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 1);
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)v4, 1);
  caption = self->_caption;
  if ((unint64_t)caption | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](caption, "isEqual:"))
      goto LABEL_63;
  }
  author = self->_author;
  if ((unint64_t)author | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](author, "isEqual:"))
      goto LABEL_63;
  }
  licenseDescription = self->_licenseDescription;
  if ((unint64_t)licenseDescription | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](licenseDescription, "isEqual:"))
      goto LABEL_63;
  }
  licenseUrl = self->_licenseUrl;
  if ((unint64_t)licenseUrl | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](licenseUrl, "isEqual:"))
      goto LABEL_63;
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:"))
      goto LABEL_63;
  }
  flags = (__int16)self->_flags;
  v11 = *((_WORD *)v4 + 54);
  if ((flags & 2) != 0)
  {
    if ((v11 & 2) == 0)
      goto LABEL_63;
    if (self->_displayFullPhotoInline)
    {
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0)
      goto LABEL_63;
    if (self->_useGallery)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 8) != 0)
  {
    if ((v11 & 8) == 0)
      goto LABEL_63;
    if (self->_highQuality)
    {
      if (!*((_BYTE *)v4 + 102))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 102))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0)
      goto LABEL_63;
    if (self->_isBusinessOwned)
    {
      if (!*((_BYTE *)v4 + 103))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 103))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((flags & 4) != 0)
  {
    if ((v11 & 4) == 0)
      goto LABEL_63;
    if (self->_displayFullScreenPhotoGallery)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_63;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_63;
  }
  joeColor = self->_joeColor;
  if ((unint64_t)joeColor | *((_QWORD *)v4 + 7) && !-[GEOPDJoeColor isEqual:](joeColor, "isEqual:"))
    goto LABEL_63;
  attribution = self->_attribution;
  if ((unint64_t)attribution | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDAttribution isEqual:](attribution, "isEqual:"))
      goto LABEL_63;
  }
  v14 = (__int16)self->_flags;
  v15 = *((_WORD *)v4 + 54);
  if ((v14 & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_dateAdded != *((double *)v4 + 6))
      goto LABEL_63;
  }
  else if ((v15 & 1) != 0)
  {
    goto LABEL_63;
  }
  v16 = (v15 & 0x20) == 0;
  if ((v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) != 0)
    {
      if (self->_obfuscateFullScreenPhoto)
      {
        if (!*((_BYTE *)v4 + 104))
          goto LABEL_63;
      }
      else if (*((_BYTE *)v4 + 104))
      {
        goto LABEL_63;
      }
      v16 = 1;
      goto LABEL_64;
    }
LABEL_63:
    v16 = 0;
  }
LABEL_64:

  return v16;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  double dateAdded;
  double v14;
  long double v15;
  double v16;
  uint64_t v17;
  unint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;

  -[GEOPDCaptionedPhoto readAll:]((uint64_t)self, 1);
  v23 = -[NSString hash](self->_caption, "hash");
  v22 = -[NSString hash](self->_author, "hash");
  v21 = -[NSString hash](self->_licenseDescription, "hash");
  v20 = -[NSString hash](self->_licenseUrl, "hash");
  v19 = -[GEOPDPhoto hash](self->_photo, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v4 = 2654435761 * self->_displayFullPhotoInline;
    if ((flags & 0x40) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_useGallery;
      if ((flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 0x40) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_highQuality;
    if ((flags & 0x10) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((flags & 4) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((flags & 0x10) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_isBusinessOwned;
  if ((flags & 4) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_displayFullScreenPhotoGallery;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = -[GEOPDJoeColor hash](self->_joeColor, "hash");
  v10 = -[GEOPDAttribution hash](self->_attribution, "hash");
  v11 = (__int16)self->_flags;
  if ((v11 & 1) != 0)
  {
    dateAdded = self->_dateAdded;
    v14 = -dateAdded;
    if (dateAdded >= 0.0)
      v14 = self->_dateAdded;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  if ((v11 & 0x20) != 0)
    v17 = 2654435761 * self->_obfuscateFullScreenPhoto;
  else
    v17 = 0;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int16 v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int16 v28;
  _QWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  -[GEOPDCaptionedPhoto readAll:]((uint64_t)v29, 0);
  v3 = v29;
  v4 = (void *)v29[5];
  if (v4)
  {
    -[GEOPDCaptionedPhoto setCaption:](a1, v4);
    v3 = v29;
  }
  v5 = (void *)v3[4];
  if (v5)
  {
    -[GEOPDCaptionedPhoto setAuthor:](a1, v5);
    v3 = v29;
  }
  v6 = (void *)v3[8];
  if (v6)
  {
    -[GEOPDCaptionedPhoto setLicenseDescription:](a1, v6);
    v3 = v29;
  }
  v7 = (void *)v3[9];
  if (v7)
  {
    -[GEOPDCaptionedPhoto setLicenseUrl:](a1, v7);
    v3 = v29;
  }
  v8 = *(_QWORD *)(a1 + 80);
  v9 = (void *)v3[10];
  if (v8)
  {
    if (!v9)
      goto LABEL_24;
    v10 = v9;
    -[GEOPDPhoto readAll:]((uint64_t)v10, 0);
    v11 = (void *)*((_QWORD *)v10 + 3);
    if (v11)
      -[GEOPDPhoto setPhotoId:](v8, v11);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = *((id *)v10 + 4);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          -[GEOPDPhoto addPhotoVersion:](v8, *(void **)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

  }
  else
  {
    if (!v9)
      goto LABEL_24;
    -[GEOPDCaptionedPhoto setPhoto:](a1, v9);
  }
  v3 = v29;
LABEL_24:
  v17 = *((_WORD *)v3 + 54);
  if ((v17 & 2) != 0)
  {
    *(_BYTE *)(a1 + 100) = *((_BYTE *)v3 + 100);
    *(_WORD *)(a1 + 108) |= 2u;
    v17 = *((_WORD *)v3 + 54);
    if ((v17 & 0x40) == 0)
    {
LABEL_26:
      if ((v17 & 8) == 0)
        goto LABEL_27;
      goto LABEL_47;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_26;
  }
  *(_BYTE *)(a1 + 105) = *((_BYTE *)v3 + 105);
  *(_WORD *)(a1 + 108) |= 0x40u;
  v17 = *((_WORD *)v3 + 54);
  if ((v17 & 8) == 0)
  {
LABEL_27:
    if ((v17 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(a1 + 102) = *((_BYTE *)v3 + 102);
  *(_WORD *)(a1 + 108) |= 8u;
  v17 = *((_WORD *)v3 + 54);
  if ((v17 & 0x10) == 0)
  {
LABEL_28:
    if ((v17 & 4) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_48:
  *(_BYTE *)(a1 + 103) = *((_BYTE *)v3 + 103);
  *(_WORD *)(a1 + 108) |= 0x10u;
  if ((*((_WORD *)v3 + 54) & 4) != 0)
  {
LABEL_29:
    *(_BYTE *)(a1 + 101) = *((_BYTE *)v3 + 101);
    *(_WORD *)(a1 + 108) |= 4u;
  }
LABEL_30:
  v18 = *(_QWORD *)(a1 + 56);
  v19 = (void *)v3[7];
  if (v18)
  {
    if (!v19)
      goto LABEL_53;
    v20 = v19;
    -[GEOPDJoeColor readAll:]((uint64_t)v20, 0);
    v21 = (void *)v20[3];
    if (v21)
      -[GEOPDJoeColor setBackgroundColor:](v18, v21);
    v22 = (void *)v20[4];
    if (v22)
      -[GEOPDJoeColor setPrimaryTextColor:](v18, v22);
    v23 = (void *)v20[6];
    if (v23)
      -[GEOPDJoeColor setSecondaryTextColor:](v18, v23);
    v24 = (void *)v20[7];
    if (v24)
      -[GEOPDJoeColor setTertiaryTextColor:](v18, v24);
    v25 = (void *)v20[5];
    if (v25)
      -[GEOPDJoeColor setQuaternaryTextColor:](v18, v25);
    if ((v20[10] & 1) != 0)
    {
      *(_BYTE *)(v18 + 76) = *((_BYTE *)v20 + 76);
      *(_BYTE *)(v18 + 80) |= 1u;
    }

  }
  else
  {
    if (!v19)
      goto LABEL_53;
    -[GEOPDCaptionedPhoto setJoeColor:](a1, v19);
  }
  v3 = v29;
LABEL_53:
  v26 = *(_QWORD *)(a1 + 24);
  v27 = (void *)v3[3];
  if (v26)
  {
    if (!v27)
      goto LABEL_59;
    -[GEOPDAttribution mergeFrom:](v26, v27);
  }
  else
  {
    if (!v27)
      goto LABEL_59;
    -[GEOPDCaptionedPhoto setAttribution:](a1, v27);
  }
  v3 = v29;
LABEL_59:
  v28 = *((_WORD *)v3 + 54);
  if ((v28 & 1) != 0)
  {
    *(_QWORD *)(a1 + 48) = v3[6];
    *(_WORD *)(a1 + 108) |= 1u;
    v28 = *((_WORD *)v3 + 54);
  }
  if ((v28 & 0x20) != 0)
  {
    *(_BYTE *)(a1 + 104) = *((_BYTE *)v3 + 104);
    *(_WORD *)(a1 + 108) |= 0x20u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_licenseUrl, 0);
  objc_storeStrong((id *)&self->_licenseDescription, 0);
  objc_storeStrong((id *)&self->_joeColor, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
