@implementation LPFileMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPFileMetadata)initWithCoder:(id)a3
{
  id v4;
  LPFileMetadata *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *type;
  void *v10;
  uint64_t v11;
  LPImage *thumbnail;
  uint64_t v13;
  LPImage *smallThumbnail;
  uint64_t v15;
  LPImage *icon;
  uint64_t v17;
  NSDate *creationDate;
  LPFileMetadata *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LPFileMetadata;
  v5 = -[LPFileMetadata init](&v21, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    decodeNumberForKey(v4, CFSTR("size"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_size = objc_msgSend(v10, "unsignedLongLongValue");

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("thumbnail"));
    v11 = objc_claimAutoreleasedReturnValue();
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (LPImage *)v11;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("smallThumbnail"));
    v13 = objc_claimAutoreleasedReturnValue();
    smallThumbnail = v5->_smallThumbnail;
    v5->_smallThumbnail = (LPImage *)v13;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v15 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v15;

    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", self->_type, CFSTR("type"));
  if (self->_size)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("size"));

  }
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, CFSTR("thumbnail"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_smallThumbnail, CFSTR("smallThumbnail"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_creationDate, CFSTR("creationDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPFileMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LPFileMetadata *v11;

  v4 = +[LPFileMetadata allocWithZone:](LPFileMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPFileMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setName:](v4, "setName:", v5);

    -[LPFileMetadata type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setType:](v4, "setType:", v6);

    -[LPFileMetadata setSize:](v4, "setSize:", -[LPFileMetadata size](self, "size"));
    -[LPFileMetadata thumbnail](self, "thumbnail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setThumbnail:](v4, "setThumbnail:", v7);

    -[LPFileMetadata smallThumbnail](self, "smallThumbnail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setSmallThumbnail:](v4, "setSmallThumbnail:", v8);

    -[LPFileMetadata icon](self, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setIcon:](v4, "setIcon:", v9);

    -[LPFileMetadata creationDate](self, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata setCreationDate:](v4, "setCreationDate:", v10);

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPFileMetadata;
  if (-[LPFileMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_name) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_type)
        && v6[4] == (void *)self->_size
        && objectsAreEqual_0(v6[5], self->_thumbnail)
        && objectsAreEqual_0(v6[6], self->_smallThumbnail)
        && objectsAreEqual_0(v6[7], self->_icon))
      {
        v5 = objectsAreEqual_0(v6[8], self->_creationDate);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  v3[2](v3, CFSTR("thumbnail"));
  v3[2](v3, CFSTR("smallThumbnail"));
  v3[2](v3, CFSTR("icon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("type"), CFSTR("size"), CFSTR("thumbnail"), CFSTR("smallThumbnail"), CFSTR("icon"), CFSTR("creationDate"), 0);
}

- (BOOL)_canDeferAsynchronousFieldsMetadataUpdateUntilCompletion
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (LPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (LPImage)smallThumbnail
{
  return self->_smallThumbnail;
}

- (void)setSmallThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_smallThumbnail, a3);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_smallThumbnail, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)descriptionForUTI:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *k;
  void *v42;
  __CFString *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[11];
  _BYTE v98[128];
  _QWORD v99[6];
  _QWORD v100[6];
  _BYTE v101[128];
  _QWORD v102[22];
  _QWORD v103[24];

  v103[22] = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if ((-[__CFString _lp_hasCaseInsensitivePrefix:](v3, "_lp_hasCaseInsensitivePrefix:", CFSTR("com.apple.iwork")) & 1) != 0
    || (-[__CFString _lp_hasCaseInsensitivePrefix:](v3, "_lp_hasCaseInsensitivePrefix:", CFSTR("com.apple.itunes")) & 1) != 0
    || (-[__CFString _lp_hasCaseInsensitivePrefix:](v3, "_lp_hasCaseInsensitivePrefix:", CFSTR("org.oasis-open")) & 1) != 0)
  {

LABEL_5:
    v4 = (void *)UTTypeCopyDescription(v3);
    goto LABEL_6;
  }
  v103[0] = CFSTR("Apple Watch");
  v102[0] = CFSTR("com.apple.watchface");
  v102[1] = CFSTR("com.apple.webarchive");
  LPLocalizedString(CFSTR("Web Archive (file type)"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v55;
  v102[2] = CFSTR("com.apple.rtfd");
  LPLocalizedString(CFSTR("RTF Document (file type)"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v53;
  v102[3] = CFSTR("com.apple.flat-rtfd");
  LPLocalizedString(CFSTR("RTF Document (file type)"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v71;
  v102[4] = CFSTR("public.rtf");
  LPLocalizedString(CFSTR("RTF Document (file type)"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v69;
  v102[5] = CFSTR("com.adobe.pdf");
  LPLocalizedString(CFSTR("PDF Document (file type)"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v103[5] = v67;
  v102[6] = CFSTR("com.apple.mpeg-4-ringtone");
  LPLocalizedString(CFSTR("Ringtone (file type)"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v65;
  v102[7] = CFSTR("public.vcard");
  LPLocalizedString(CFSTR("Contact Card (file type)"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v103[7] = v63;
  v102[8] = CFSTR("org.idpf.epub-container");
  LPLocalizedString(CFSTR("Book (file type)"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v103[8] = v61;
  v102[9] = CFSTR("com.apple.ibooks");
  LPLocalizedString(CFSTR("Book (file type)"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v103[9] = v59;
  v102[10] = CFSTR("com.apple.ibooks-container");
  LPLocalizedString(CFSTR("Book (file type)"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v103[10] = v57;
  v102[11] = CFSTR("com.apple.ibooksauthor.book");
  LPLocalizedString(CFSTR("Book (file type)"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v103[11] = v51;
  v102[12] = CFSTR("public.jpeg");
  LPLocalizedString(CFSTR("JPEG Image (file type)"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v103[12] = v49;
  v102[13] = CFSTR("public.png");
  LPLocalizedString(CFSTR("PNG Image (file type)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v103[13] = v6;
  v102[14] = CFSTR("com.compuserve.gif");
  LPLocalizedString(CFSTR("GIF Image (file type)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v103[14] = v7;
  v102[15] = CFSTR("public.tiff");
  LPLocalizedString(CFSTR("TIFF Image (file type)"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v103[15] = v8;
  v102[16] = CFSTR("public.zip-archive");
  LPLocalizedString(CFSTR("ZIP Archive (file type)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v103[16] = v9;
  v102[17] = CFSTR("public.heif");
  LPLocalizedString(CFSTR("HEIF Image (file type)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v103[17] = v10;
  v102[18] = CFSTR("public.heif-standard");
  LPLocalizedString(CFSTR("HEIF Image (file type)"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v103[18] = v11;
  v102[19] = CFSTR("public.data");
  LPLocalizedString(CFSTR("File (file type)"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v103[19] = v12;
  v102[20] = CFSTR("public.folder");
  LPLocalizedString(CFSTR("Folder (file type)"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v102[21] = CFSTR("com.apple.workout");
  v103[20] = v13;
  v103[21] = CFSTR("Apple Watch");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v82;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v82 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
        if (-[__CFString _lp_isEqualIgnoringCase:](v3, "_lp_isEqualIgnoringCase:", v19))
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", v19);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v15;
          goto LABEL_37;
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
      if (v16)
        continue;
      break;
    }
  }

  v99[0] = CFSTR("com.microsoft.excel");
  LPLocalizedString(CFSTR("Office Spreadsheet (file type)"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v20;
  v99[1] = CFSTR("org.openxmlformats.spreadsheetml");
  LPLocalizedString(CFSTR("Office Spreadsheet (file type)"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v21;
  v99[2] = CFSTR("com.microsoft.powerpoint");
  LPLocalizedString(CFSTR("Office Presentation (file type)"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v22;
  v99[3] = CFSTR("org.openxmlformats.presentationml");
  LPLocalizedString(CFSTR("Office Presentation (file type)"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v100[3] = v23;
  v99[4] = CFSTR("com.microsoft.word");
  LPLocalizedString(CFSTR("Word Document (file type)"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v24;
  v99[5] = CFSTR("org.openxmlformats.wordprocessingml");
  LPLocalizedString(CFSTR("Word Document (file type)"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v100[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v98, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v78;
    while (2)
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v78 != v29)
          objc_enumerationMutation(v27);
        v31 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
        if (-[__CFString _lp_hasCaseInsensitivePrefix:](v3, "_lp_hasCaseInsensitivePrefix:", v31))
        {
          objc_msgSend(v27, "objectForKeyedSubscript:", v31);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v27;
          goto LABEL_36;
        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v98, 16);
      if (v28)
        continue;
      break;
    }
  }

  v96[0] = CFSTR("com.apple.disk-image");
  LPLocalizedString(CFSTR("Disk Image (file type)"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v68;
  v95[0] = CFSTR("public.source-code");
  LPLocalizedString(CFSTR("Source Code (file type)"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v64;
  v94[0] = CFSTR("com.apple.application");
  LPLocalizedString(CFSTR("Application (file type)"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v60;
  v93[0] = CFSTR("public.3d-content");
  LPLocalizedString(CFSTR("3D Asset (file type)"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v72;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v58;
  v92[0] = CFSTR("public.executable");
  LPLocalizedString(CFSTR("Executable (file type)"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v97[4] = v54;
  v91[0] = CFSTR("public.archive");
  LPLocalizedString(CFSTR("Archive (file type)"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v97[5] = v50;
  v90[0] = CFSTR("public.image");
  LPLocalizedString(CFSTR("Image (file type)"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v97[6] = v47;
  v89[0] = CFSTR("public.audio");
  LPLocalizedString(CFSTR("Audio Recording (file type)"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v97[7] = v45;
  v88[0] = CFSTR("public.font");
  LPLocalizedString(CFSTR("Font (file type)"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v97[8] = v33;
  v87[0] = CFSTR("public.movie");
  LPLocalizedString(CFSTR("Video (file type)"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v97[9] = v35;
  v86[0] = CFSTR("public.plain-text");
  LPLocalizedString(CFSTR("Text Document (file type)"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v97[10] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 11);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v39 = v38;
  v4 = (void *)objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
  if (v4)
  {
    v40 = *(_QWORD *)v74;
    while (2)
    {
      for (k = 0; k != v4; k = (char *)k + 1)
      {
        if (*(_QWORD *)v74 != v40)
          objc_enumerationMutation(v39);
        v42 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v44 = UTTypeConformsTo(v3, v43);

        if (v44)
        {
          objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
      }
      v4 = (void *)objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_35:

LABEL_36:
LABEL_37:

  if (!v4)
    goto LABEL_5;
LABEL_6:

  return v4;
}

- (id)_fileTypeStringForTransformer:(id)a3
{
  void *v4;
  void *v5;

  -[LPFileMetadata type](self, "type", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPFileMetadata type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPFileMetadata descriptionForUTI:](LPFileMetadata, "descriptionForUTI:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_fileDetailStringForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[LPFileMetadata creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "sourceBundleIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_lp_isEqualIgnoringCase:", CFSTR("com.apple.mobilephone")),
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x1E0CB3578];
    -[LPFileMetadata creationDate](self, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromDate:dateStyle:timeStyle:", v9, 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[LPFileMetadata size](self, "size"))
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[LPFileMetadata size](self, "size"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_bottomCaptionStringForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[LPFileMetadata _fileTypeStringForTransformer:](self, "_fileTypeStringForTransformer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata _fileDetailStringForTransformer:](self, "_fileDetailStringForTransformer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  joinedByDot(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isImage
{
  __CFString *v2;
  BOOL v3;

  -[LPFileMetadata type](self, "type");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5B90]) != 0;

  return v3;
}

- (BOOL)_isPlainText
{
  __CFString *v2;
  BOOL v3;

  -[LPFileMetadata type](self, "type");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5C20]) != 0;

  return v3;
}

- (BOOL)_isWatchFace
{
  __CFString *v2;
  BOOL v3;

  -[LPFileMetadata type](self, "type");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = UTTypeConformsTo(v2, CFSTR("com.apple.watchface")) != 0;

  return v3;
}

- (BOOL)_shouldUseSquareIcon
{
  void *v3;
  BOOL v4;

  -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[LPFileMetadata _isImage](self, "_isImage");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_shouldUseCircularIcon
{
  __CFString *v2;
  BOOL v3;

  -[LPFileMetadata type](self, "type");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5CB0]) != 0;

  return v3;
}

- (BOOL)_shouldUseBackground
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v10;

  -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 5 || -[LPFileMetadata _isWatchFace](self, "_isWatchFace"))
    return 0;
  -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "_hasTransparency");

  return v8;
}

- (id)_singleLineDescriptionForRemoteFileWithTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[LPFileMetadata _fileTypeStringForTransformer:](self, "_fileTypeStringForTransformer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_lp_simplifiedStringForDisplayOnly:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  joinedByEmDash(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_nameForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  __CFString *v19;
  int v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "effectiveSizeClass") != 2)
    goto LABEL_14;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_lp_isHTTPFamilyURL") & 1) == 0)
  {

    goto LABEL_14;
  }
  -[LPFileMetadata type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_14:
    -[LPFileMetadata name](self, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[LPFileMetadata type](self, "type");
  v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v30[0] = CFSTR("public.image");
  LPLocalizedString(CFSTR("Image (file type)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  v29[0] = CFSTR("public.movie");
  LPLocalizedString(CFSTR("Video (file type)"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v13;
  v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0, (_QWORD)v24);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v20 = UTTypeConformsTo(v8, v19);

        if (v20)
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_17:

  if (v15)
  {
    v23 = v15;
  }
  else
  {
    -[LPFileMetadata name](self, "name");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v23;

LABEL_15:
  return v21;
}

- (id)_valueForKeyPathIfLoaded:(id)a3
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;

  -[LPFileMetadata valueForKeyPath:](self, "valueForKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE5E5EA8);
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if ((v4 & 1) != 0)
  {
    if (objc_msgSend(v5, "needsAsynchronousLoad")
      && !objc_msgSend(v6, "hasPlaceholderValueForAsynchronousLoad"))
    {
      v7 = 0;
    }
    else
    {
      v7 = v6;
    }

  }
  return v7;
}

- (id)_thumbnailIfLoaded
{
  return -[LPFileMetadata _valueForKeyPathIfLoaded:](self, "_valueForKeyPathIfLoaded:", CFSTR("thumbnail"));
}

- (id)_smallThumbnailIfLoaded
{
  return -[LPFileMetadata _valueForKeyPathIfLoaded:](self, "_valueForKeyPathIfLoaded:", CFSTR("smallThumbnail"));
}

- (id)_iconIfLoaded
{
  return -[LPFileMetadata _valueForKeyPathIfLoaded:](self, "_valueForKeyPathIfLoaded:", CFSTR("icon"));
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  LPCardHeadingPresentationProperties *v12;
  LPCaptionBarPresentationProperties *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  LPCardHeadingPresentationProperties *v41;
  void *v42;
  void *v43;
  LPImagePresentationProperties *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v4 = a3;
  if (objc_msgSend(v4, "effectiveSizeClass") == 2 || objc_msgSend(v4, "effectiveSizeClass") == 12)
  {
    -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[LPFileMetadata type](self, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scaleFactor");
      customIconForUTI(v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v7 = v10;
      }
      else
      {
        -[LPFileMetadata _iconIfLoaded](self, "_iconIfLoaded");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = v29;
        }
        else
        {
          +[LPResources fileIcon](LPResources, "fileIcon");
          v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        v7 = v31;

      }
    }

    v41 = [LPCardHeadingPresentationProperties alloc];
    -[LPFileMetadata _nameForTransformer:](self, "_nameForTransformer:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFileMetadata _bottomCaptionStringForTransformer:](self, "_bottomCaptionStringForTransformer:", v4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[LPCardHeadingPresentationProperties initWithStyle:topCaption:bottomCaption:icon:](v41, "initWithStyle:topCaption:bottomCaption:icon:", 33, v42, v43, v7);

    v44 = objc_alloc_init(LPImagePresentationProperties);
    -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setLeadingIconProperties:", v44);

    if (-[LPFileMetadata _shouldUseSquareIcon](self, "_shouldUseSquareIcon"))
    {
      -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "leadingIconProperties");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setRequireFixedSize:", 1);

      -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "leadingIconProperties");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setScalingMode:", 2);
    }
    else
    {
      if (!-[LPFileMetadata _shouldUseCircularIcon](self, "_shouldUseCircularIcon"))
        goto LABEL_30;
      -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "leadingIconProperties");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setFilter:", 12);
    }

LABEL_30:
    if (-[LPFileMetadata _shouldUseBackground](self, "_shouldUseBackground"))
    {
      -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "leadingIconProperties");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setShouldApplyBackground:", 1);

    }
    goto LABEL_42;
  }
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 33);
  v12 = (LPCardHeadingPresentationProperties *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(LPCaptionBarPresentationProperties);
  -[LPWebLinkPresentationProperties setCaptionBar:](v12, "setCaptionBar:", v13);

  if (!objc_msgSend(v4, "_rowConfigurationForStyle:", -[LPWebLinkPresentationProperties style](v12, "style")))
  {
    objc_msgSend(v4, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isFileURL");

    if ((v15 & 1) == 0)
    {
      -[LPFileMetadata _singleLineDescriptionForRemoteFileWithTransformer:](self, "_singleLineDescriptionForRemoteFileWithTransformer:", v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "top");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leading");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v25);
      goto LABEL_14;
    }
  }
  -[LPFileMetadata _nameForTransformer:](self, "_nameForTransformer:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "top");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leading");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v16);

  -[LPFileMetadata _bottomCaptionStringForTransformer:](self, "_bottomCaptionStringForTransformer:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v21, "bottom");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leading");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v20);

  objc_msgSend(v4, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v24, "isFileURL");

  if ((v21 & 1) == 0)
  {
    objc_msgSend(v4, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_lp_simplifiedStringForDisplayOnly:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPWebLinkPresentationProperties captionBar](v12, "captionBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "belowBottom");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leading");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v26);

LABEL_14:
  }
  -[LPFileMetadata _smallThumbnailIfLoaded](self, "_smallThumbnailIfLoaded");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32 && (v33 = objc_msgSend(v4, "effectiveSizeClass"), v32, v33 == 8))
  {
    -[LPFileMetadata _smallThumbnailIfLoaded](self, "_smallThumbnailIfLoaded");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v12, v34);
  }
  else
  {
    -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v12, v34);
    }
    else
    {
      -[LPFileMetadata type](self, "type");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scaleFactor");
      customIconForUTI(v34, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (v37)
      {
        v39 = 0;
        v40 = (void *)v37;
      }
      else
      {
        -[LPFileMetadata _iconIfLoaded](self, "_iconIfLoaded");
        v52 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v52;
        if (v52)
        {
          v39 = 0;
          v40 = (void *)v52;
        }
        else
        {
          +[LPResources fileIcon](LPResources, "fileIcon");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          v39 = 1;
        }
      }
      objc_msgSend(v4, "_populateProperties:withPrimaryIcon:iconProperties:canBecomeImage:", v12, v40, 0, 0);
      if (v39)

      if (!v38)
    }
  }

  objc_msgSend(v4, "metadata");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "video");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties setVideo:](v12, "setVideo:", v54);

  objc_msgSend(v4, "metadata");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "audio");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPWebLinkPresentationProperties setAudio:](v12, "setAudio:", v56);

  -[LPWebLinkPresentationProperties audio](v12, "audio");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[LPWebLinkPresentationProperties audio](v12, "audio");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPInlineMediaPlaybackInformation audioFilePlaybackInformationWithAudio:](LPInlineMediaPlaybackInformation, "audioFilePlaybackInformationWithAudio:", v58);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[LPWebLinkPresentationProperties setInlinePlaybackInformation:](v12, "setInlinePlaybackInformation:", v7);
LABEL_42:

  }
  return v12;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return 1;
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("File: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_lp_directionallyIsolatedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[LPFileMetadata thumbnail](self, "thumbnail", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[LPFileMetadata icon](self, "icon");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)fallbackIconForTransformer:(id)a3
{
  +[LPResources fileIcon](LPResources, "fileIcon", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[LPFileMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v4);

  -[LPFileMetadata thumbnail](self, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v5);

  -[LPFileMetadata icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIcon:", v6);

}

- (int64_t)summaryTypeForTransformer:(id)a3
{
  if (-[LPFileMetadata _isImage](self, "_isImage", a3))
    return 1;
  if (-[LPFileMetadata _isPlainText](self, "_isPlainText"))
    return 3;
  return 2;
}

- (id)sharedObjectTitleForTransformer:(id)a3
{
  -[LPFileMetadata name](self, "name", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sharedObjectSubtitleForTransformer:(id)a3
{
  void *v4;
  void *v5;

  -[LPFileMetadata type](self, "type", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LPFileMetadata type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[LPFileMetadata descriptionForUTI:](LPFileMetadata, "descriptionForUTI:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)sharedObjectInformationForTransformer:(id)a3
{
  void *v4;

  v4 = -[LPFileMetadata size](self, "size", a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[LPFileMetadata size](self, "size"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)sharedObjectIconForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[LPFileMetadata type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaleFactor");
    customIconForUTI(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v7 = v10;
    }
    else
    {
      -[LPFileMetadata _iconIfLoaded](self, "_iconIfLoaded");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        +[LPResources fileIcon](LPResources, "fileIcon");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7 = v14;

    }
  }

  return v7;
}

- (BOOL)sharedObjectPrefersIconAsImageForTransformer:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[LPFileMetadata _thumbnailIfLoaded](self, "_thumbnailIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = sizeClassRequiresLargeMedia(objc_msgSend(v4, "effectiveSizeClass"));
  else
    v6 = 0;

  return v6;
}

- (id)sharedObjectPreviewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("“%@”"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFileMetadata name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_lp_directionallyIsolatedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
