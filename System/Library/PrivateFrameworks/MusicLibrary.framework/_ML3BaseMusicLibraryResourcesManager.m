@implementation _ML3BaseMusicLibraryResourcesManager

- (id)pathForResourceFileOrFolder:(int)a3
{
  return -[_ML3BaseMusicLibraryResourcesManager _pathForResourceFileOrFolder:basePath:relativeToBase:isFolder:](self, "_pathForResourceFileOrFolder:basePath:relativeToBase:isFolder:", *(_QWORD *)&a3, 0, 0, 0);
}

- (id)_mediaPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  MLMobileUserHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("Media");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 isFolder:(BOOL *)a6
{
  uint64_t v8;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  BOOL v38;
  const __CFString *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[3];
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[3];
  _QWORD v50[5];

  v8 = *(_QWORD *)&a3;
  v50[4] = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a4;
  v12 = v11;
  if (a5)
    goto LABEL_6;
  if (v11 && -[__CFString length](v11, "length"))
    goto LABEL_8;
  if (!-[_ML3BaseMusicLibraryResourcesManager _mediaResourceRequiresLibraryContainerAccess:](self, "_mediaResourceRequiresLibraryContainerAccess:", v8))
  {
LABEL_6:
    v13 = &stru_1E5B66908;
  }
  else
  {
    -[_ML3BaseMusicLibraryResourcesManager libraryContainerPath](self, "libraryContainerPath");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  v12 = (__CFString *)v13;
LABEL_8:
  -[_ML3BaseMusicLibraryResourcesManager _controlDirectoryPathWithBasePath:](self, "_controlDirectoryPathWithBasePath:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  switch((int)v8)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ML3BaseMusicLibraryResourcesManager.m"), 298, CFSTR("Invalid resource"));

      goto LABEL_10;
    case 1:
      v18 = CFSTR("iTunes/iTunesSyncDeletes.plist");
      goto LABEL_18;
    case 2:
      v18 = CFSTR("iTunes/PlayCounts.plist");
      goto LABEL_18;
    case 3:
      v18 = CFSTR("iTunes/OnTheGoPlaylist.plist");
      goto LABEL_18;
    case 4:
      v18 = CFSTR("iTunes/OnTheGoPlaylist_%llu.plist");
      goto LABEL_18;
    case 5:
      v18 = CFSTR("iTunes/GeniusPlaylist.plist");
      goto LABEL_18;
    case 6:
      v18 = CFSTR("iTunes/GeniusPlaylist_%llu.plist");
      goto LABEL_18;
    case 7:
      v18 = CFSTR("iTunes/Playlist_%llu.plist");
LABEL_18:
      objc_msgSend(v14, "stringByAppendingPathComponent:", v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    case 8:
      -[_ML3BaseMusicLibraryResourcesManager _musicAssetsPathRelativeToBasePath:](self, "_musicAssetsPathRelativeToBasePath:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("Cache");
      goto LABEL_22;
    case 9:
      -[_ML3BaseMusicLibraryResourcesManager _musicAssetsPathRelativeToBasePath:](self, "_musicAssetsPathRelativeToBasePath:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("Cache_LoFi");
      goto LABEL_22;
    case 10:
      -[_ML3BaseMusicLibraryResourcesManager _musicAssetsPathRelativeToBasePath:](self, "_musicAssetsPathRelativeToBasePath:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("Downloads");
LABEL_22:
      objc_msgSend(v19, "stringByAppendingPathComponent:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 11:
      v23 = (void *)MEMORY[0x1E0CB3940];
      MLMobileUserHomeDirectory();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v20;
      v50[1] = CFSTR("Media");
      v50[2] = CFSTR("iTunes_Control");
      v50[3] = CFSTR("Music");
      v24 = (void *)MEMORY[0x1E0C99D20];
      v25 = v50;
      goto LABEL_48;
    case 12:
      v26 = (void *)MEMORY[0x1E0CB3940];
      v49[0] = v14;
      v49[1] = CFSTR("iTunes");
      v49[2] = CFSTR("Artwork");
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v49;
      v29 = 3;
      goto LABEL_28;
    case 13:
      v26 = (void *)MEMORY[0x1E0CB3940];
      v48[0] = v14;
      v48[1] = CFSTR("iTunes");
      v48[2] = CFSTR("Artwork");
      v48[3] = CFSTR("Originals");
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v48;
      goto LABEL_27;
    case 14:
      v26 = (void *)MEMORY[0x1E0CB3940];
      v47[0] = v14;
      v47[1] = CFSTR("iTunes");
      v47[2] = CFSTR("Artwork");
      v47[3] = CFSTR("Caches");
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v47;
LABEL_27:
      v29 = 4;
LABEL_28:
      objc_msgSend(v27, "arrayWithObjects:count:", v28, v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pathWithComponents:", v20);
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v17 = (void *)v22;
      goto LABEL_49;
    case 15:
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "msv_stringByResolvingRealPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v31;
      v46[1] = CFSTR("iTunes");
      v46[2] = CFSTR("MediaLibrary.sqlitedb");
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v46;
      v34 = 3;
      goto LABEL_37;
    case 16:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v35;
      v36 = CFSTR("MLSections");
      goto LABEL_33;
    case 17:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v35;
      v36 = CFSTR("SortingDetails");
LABEL_33:
      objc_msgSend(v35, "pathForResource:ofType:", v36, CFSTR("plist"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    case 18:
      v30 = (void *)MEMORY[0x1E0CB3940];
      MLMobileUserHomeDirectory();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v31;
      v45[1] = CFSTR("Library");
      v45[2] = CFSTR("MusicLibrary");
      v45[3] = CFSTR("FailedArtworkConversion.plist");
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v45;
      goto LABEL_36;
    case 19:
      v30 = (void *)MEMORY[0x1E0CB3940];
      MLMobileUserHomeDirectory();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v31;
      v44[1] = CFSTR("Library");
      v44[2] = CFSTR("MusicLibrary");
      v44[3] = CFSTR("Backups");
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v44;
LABEL_36:
      v34 = 4;
LABEL_37:
      objc_msgSend(v32, "arrayWithObjects:count:", v33, v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "pathWithComponents:", v37);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
      goto LABEL_39;
    case 20:
      v40 = CFSTR("Podcasts");
      goto LABEL_46;
    case 21:
      v40 = CFSTR("Purchases");
      goto LABEL_46;
    case 22:
      v40 = CFSTR("ManagedPurchases/TVApp");
      goto LABEL_46;
    case 23:
      v40 = CFSTR("ManagedPurchases/Books");
LABEL_46:
      +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:](ML3MusicLibrary, "mediaFolderPathByAppendingPathComponent:", v40);
      v41 = objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    case 24:
      v23 = (void *)MEMORY[0x1E0CB3940];
      MLMobileUserHomeDirectory();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v20;
      v43[1] = CFSTR("Library");
      v43[2] = CFSTR("Logs");
      v43[3] = CFSTR("MediaServices");
      v24 = (void *)MEMORY[0x1E0C99D20];
      v25 = v43;
LABEL_48:
      objc_msgSend(v24, "arrayWithObjects:count:", v25, 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pathWithComponents:", v42);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_49:
      goto LABEL_52;
    case 25:
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("iTunes"));
      v41 = objc_claimAutoreleasedReturnValue();
LABEL_51:
      v17 = (void *)v41;
LABEL_52:
      v38 = 1;
      if (!a6)
        goto LABEL_41;
      goto LABEL_40;
    default:
LABEL_10:
      v17 = 0;
LABEL_39:
      v38 = 0;
      if (a6)
LABEL_40:
        *a6 = v38;
LABEL_41:

      return v17;
  }
}

- (id)libraryContainerPath
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[_ML3BaseMusicLibraryResourcesManager _mediaPath](self, "_mediaPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ML3BaseMusicLibraryResourcesManager libraryContainerIdentifier](self, "libraryContainerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_ML3BaseMusicLibraryResourcesManager libraryContainerIdentifier](self, "libraryContainerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (NSString)libraryContainerIdentifier
{
  return self->_libraryContainerIdentifier;
}

- (BOOL)_mediaResourceRequiresLibraryContainerAccess:(int)a3
{
  BOOL result;
  void *v6;
  void *v7;

  if (a3 > 0x19)
    goto LABEL_7;
  result = 1;
  if (((1 << a3) & 0x200F8FE) != 0)
    return result;
  if (((1 << a3) & 0x1FF0700) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ML3BaseMusicLibraryResourcesManager.m"), 201, CFSTR("Invalid resource"));

LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ML3BaseMusicLibraryResourcesManager.m"), 232, CFSTR("Invalid resource"));

  }
  return 0;
}

- (id)_controlDirectoryPathWithBasePath:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("iTunes_Control"));
}

- (_ML3BaseMusicLibraryResourcesManager)initWithAccountInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t *v10;
  ldiv_t v11;
  uint64_t v12;
  char *v13;
  const UInt8 *v14;
  unsigned __int8 *v15;
  char *v16;
  char *v17;
  uint64_t m;
  unsigned int v19;
  char *v20;
  id v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  unsigned __int8 *v28;
  char *v29;
  char *v30;
  uint64_t j;
  unsigned int v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t quot;
  lldiv_t v37;
  uint64_t v38;
  CFStringRef v39;
  unsigned __int8 *v40;
  char *v41;
  char *v42;
  uint64_t k;
  unsigned int v44;
  char *v45;
  char *v46;
  uint64_t v47;
  _BYTE *v48;
  unint64_t v49;
  unsigned __int8 *v50;
  char *v51;
  char *v52;
  uint64_t i;
  unsigned int v54;
  char *v55;
  _ML3BaseMusicLibraryResourcesManager *v56;
  void *v58;
  void *v59;
  uint64_t v60;
  CC_SHA1_CTX v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[72];
  _OWORD v70[4];
  uint64_t v71;
  _QWORD v72[3];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "accountDSID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    v62 = 0u;
    memset(&v61, 0, sizeof(v61));
    v60 = 4001;
    CC_SHA1_Init(&v61);
    v7 = objc_retainAutorelease(v6);
    CC_SHA1_Update(&v61, (const void *)objc_msgSend(v7, "UTF8String"), objc_msgSend(v7, "length"));

    memset(&v69[8], 0, 64);
    *(_QWORD *)v69 = 4001;
    CC_SHA1_Final(&v69[8], &v61);
    v70[0] = *(_OWORD *)v69;
    v70[1] = *(_OWORD *)&v69[16];
    v70[2] = *(_OWORD *)&v69[32];
    v70[3] = *(_OWORD *)&v69[48];
    v71 = *(_QWORD *)&v69[64];
    if (*(uint64_t *)v69 > 3999)
    {
      if (*(uint64_t *)v69 > 4255)
      {
        if (*(_QWORD *)v69 == 4256)
        {
          v50 = (unsigned __int8 *)v70 + 8;
          v51 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          v52 = v51;
          for (i = 0; i != 64; i += 2)
          {
            v54 = *v50++;
            v55 = &v51[i];
            *v55 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v54 >> 4];
            v55[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v54 & 0xF];
          }
          v21 = objc_alloc(MEMORY[0x1E0CB3940]);
          v22 = v52;
          v23 = 64;
        }
        else
        {
          if (*(_QWORD *)v69 != 4512)
            goto LABEL_52;
          v28 = (unsigned __int8 *)v70 + 8;
          v29 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          v30 = v29;
          for (j = 0; j != 128; j += 2)
          {
            v32 = *v28++;
            v33 = &v29[j];
            *v33 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v32 >> 4];
            v33[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v32 & 0xF];
          }
          v21 = objc_alloc(MEMORY[0x1E0CB3940]);
          v22 = v30;
          v23 = 128;
        }
      }
      else if (*(_QWORD *)v69 == 4000)
      {
        v40 = (unsigned __int8 *)v70 + 8;
        v41 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        v42 = v41;
        for (k = 0; k != 32; k += 2)
        {
          v44 = *v40++;
          v45 = &v41[k];
          *v45 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v44 >> 4];
          v45[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v44 & 0xF];
        }
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v42;
        v23 = 32;
      }
      else
      {
        if (*(_QWORD *)v69 != 4001)
          goto LABEL_52;
        v15 = (unsigned __int8 *)v70 + 8;
        v16 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        v17 = v16;
        for (m = 0; m != 40; m += 2)
        {
          v19 = *v15++;
          v20 = &v16[m];
          *v20 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v19 >> 4];
          v20[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v19 & 0xF];
        }
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v17;
        v23 = 40;
      }
    }
    else
    {
      if (*(uint64_t *)v69 <= 2999)
      {
        if (*(_QWORD *)v69 == 1000)
        {
          v34 = *((_QWORD *)&v70[0] + 1);
          v35 = (char *)&v73 + 1;
          quot = *((_QWORD *)&v70[0] + 1);
          do
          {
            v37 = lldiv(quot, 10);
            quot = v37.quot;
            if (v37.rem >= 0)
              LOBYTE(v38) = v37.rem;
            else
              v38 = -v37.rem;
            *(v35 - 2) = v38 + 48;
            v14 = (const UInt8 *)(v35 - 2);
            --v35;
          }
          while (v37.quot);
          if (v34 < 0)
          {
            *(v35 - 2) = 45;
            v14 = (const UInt8 *)(v35 - 2);
          }
          v13 = (char *)((char *)&v73 - (char *)v14);
          goto LABEL_38;
        }
        if (*(_QWORD *)v69 == 2000)
        {
          v9 = DWORD2(v70[0]);
          v10 = &v73;
          do
          {
            v11 = ldiv(v9, 10);
            v9 = v11.quot;
            if (v11.rem >= 0)
              LOBYTE(v12) = v11.rem;
            else
              v12 = -v11.rem;
            *((_BYTE *)v10 - 1) = v12 + 48;
            v10 = (uint64_t *)((char *)v10 - 1);
          }
          while (v11.quot);
          v13 = (char *)((char *)&v73 - (char *)v10);
          v14 = (const UInt8 *)v10;
LABEL_38:
          v39 = CFStringCreateWithBytes(0, v14, (CFIndex)v13, 0x8000100u, 0);
LABEL_49:
          v8 = (__CFString *)v39;
LABEL_50:

          goto LABEL_51;
        }
LABEL_52:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 4001, *(_QWORD *)&v61.h0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

        v8 = &stru_1E5B66908;
        goto LABEL_50;
      }
      if (*(_QWORD *)v69 == 3000)
      {
        LODWORD(v72[0]) = bswap32(DWORD2(v70[0]));
        v46 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        v47 = 0;
        v48 = v46 + 1;
        do
        {
          v49 = *((unsigned __int8 *)v72 + v47);
          *(v48 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v49 >> 4];
          *v48 = MSVFastHexStringFromBytes_hexCharacters_22377[v49 & 0xF];
          v48 += 2;
          ++v47;
        }
        while (v47 != 4);
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v46;
        v23 = 8;
      }
      else
      {
        if (*(_QWORD *)v69 != 3001)
          goto LABEL_52;
        v72[0] = bswap64(*((unint64_t *)&v70[0] + 1));
        v24 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        v25 = 0;
        v26 = v24 + 1;
        do
        {
          v27 = *((unsigned __int8 *)v72 + v25);
          *(v26 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v27 >> 4];
          *v26 = MSVFastHexStringFromBytes_hexCharacters_22377[v27 & 0xF];
          v26 += 2;
          ++v25;
        }
        while (v25 != 8);
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = v24;
        v23 = 16;
      }
    }
    v39 = (CFStringRef)objc_msgSend(v21, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v22, v23, 4, 1, 4001, *(_QWORD *)&v61.h0);
    goto LABEL_49;
  }
  v8 = 0;
LABEL_51:
  v56 = -[_ML3BaseMusicLibraryResourcesManager initWithLibraryContainerIdentifier:](self, "initWithLibraryContainerIdentifier:", v8, v60);

  return v56;
}

- (_ML3BaseMusicLibraryResourcesManager)initWithLibraryContainerIdentifier:(id)a3
{
  id v4;
  _ML3BaseMusicLibraryResourcesManager *v5;
  uint64_t v6;
  NSString *libraryContainerIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ML3BaseMusicLibraryResourcesManager;
  v5 = -[_ML3BaseMusicLibraryResourcesManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    libraryContainerIdentifier = v5->_libraryContainerIdentifier;
    v5->_libraryContainerIdentifier = (NSString *)v6;

  }
  return v5;
}

- (_ML3BaseMusicLibraryResourcesManager)init
{
  return -[_ML3BaseMusicLibraryResourcesManager initWithLibraryContainerIdentifier:](self, "initWithLibraryContainerIdentifier:", 0);
}

- (_ML3BaseMusicLibraryResourcesManager)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _ML3BaseMusicLibraryResourcesManager *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ah"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_ML3BaseMusicLibraryResourcesManager initWithLibraryContainerIdentifier:](self, "initWithLibraryContainerIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_ML3BaseMusicLibraryResourcesManager libraryContainerIdentifier](self, "libraryContainerIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ah"));

}

- (id)libraryContainerPathByAppendingPathComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ML3BaseMusicLibraryResourcesManager libraryContainerPath](self, "libraryContainerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)libraryContainerRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ML3BaseMusicLibraryResourcesManager libraryContainerPath](self, "libraryContainerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relativePathFromBasePath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pathForResourceFileOrFolder:(int)a3 basePath:(id)a4 relativeToBase:(BOOL)a5 createParentFolderIfNecessary:(BOOL)a6
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  char v22;

  v6 = a6;
  v22 = 0;
  -[_ML3BaseMusicLibraryResourcesManager _pathForResourceFileOrFolder:basePath:relativeToBase:isFolder:](self, "_pathForResourceFileOrFolder:basePath:relativeToBase:isFolder:", *(_QWORD *)&a3, a4, a5, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v22)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v7, "stringByDeletingLastPathComponent");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "pathComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6 && (unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "count");
    if (v15 >= 2)
    {
      v16 = v15;
      for (i = 1; i != v16; ++i)
      {
        v18 = v14;
        objc_msgSend(v12, "objectAtIndex:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingPathComponent:", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v14, 0) & 1) == 0)
          objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0);
      }
    }

  }
  v20 = v8;

  return v20;
}

- (id)pathForBaseLocationPath:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3 <= 299)
  {
    switch(a3)
    {
      case 100:
        v3 = 9;
        goto LABEL_17;
      case 200:
        v3 = 8;
        goto LABEL_17;
      case 250:
        v3 = 10;
        goto LABEL_17;
    }
  }
  else if (a3 > 499)
  {
    if (a3 == 500)
    {
      v3 = 22;
      goto LABEL_17;
    }
    if (a3 == 600)
    {
      v3 = 23;
      goto LABEL_17;
    }
  }
  else
  {
    if (a3 == 300)
    {
      v3 = 21;
      goto LABEL_17;
    }
    if (a3 == 400)
    {
      v3 = 20;
LABEL_17:
      -[_ML3BaseMusicLibraryResourcesManager pathForResourceFileOrFolder:](self, "pathForResourceFileOrFolder:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
  }
  if ((a3 & 0xF00) != 0)
  {
    v6 = a3;
    -[_ML3BaseMusicLibraryResourcesManager _pathForResourceFileOrFolder:basePath:relativeToBase:isFolder:](self, "_pathForResourceFileOrFolder:basePath:relativeToBase:isFolder:", 11, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("F%02lld"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)mediaFolderRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_ML3BaseMusicLibraryResourcesManager _mediaPath](self, "_mediaPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relativePathFromBasePath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)musicAssetsContainerPath
{
  void *v3;
  void *v4;
  void *v5;

  -[_ML3BaseMusicLibraryResourcesManager _mediaPath](self, "_mediaPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ML3BaseMusicLibraryResourcesManager _mediaRelativeMusicAssetsDirectoryPath](self, "_mediaRelativeMusicAssetsDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_libraryContainerPathForDSID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  ldiv_t v8;
  uint64_t v9;
  char *v10;
  const UInt8 *v11;
  unsigned __int8 *v12;
  char *v13;
  char *v14;
  uint64_t m;
  unsigned int v16;
  char *v17;
  id v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unsigned __int8 *v25;
  char *v26;
  char *v27;
  uint64_t j;
  unsigned int v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t quot;
  lldiv_t v34;
  uint64_t v35;
  CFStringRef v36;
  unsigned __int8 *v37;
  char *v38;
  char *v39;
  uint64_t k;
  unsigned int v41;
  char *v42;
  char *v43;
  uint64_t v44;
  _BYTE *v45;
  unint64_t v46;
  unsigned __int8 *v47;
  char *v48;
  char *v49;
  uint64_t i;
  unsigned int v51;
  char *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  CC_SHA1_CTX v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[72];
  _OWORD v68[4];
  uint64_t v69;
  _QWORD v70[3];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v66 = 0u;
  v65 = 0u;
  v64 = 0u;
  v63 = 0u;
  v62 = 0u;
  v61 = 0u;
  v60 = 0u;
  memset(&v59, 0, sizeof(v59));
  CC_SHA1_Init(&v59);
  v5 = objc_retainAutorelease(v4);
  CC_SHA1_Update(&v59, (const void *)objc_msgSend(v5, "UTF8String"), objc_msgSend(v5, "length"));

  memset(&v67[8], 0, 64);
  *(_QWORD *)v67 = 4001;
  CC_SHA1_Final(&v67[8], &v59);
  v68[0] = *(_OWORD *)v67;
  v68[1] = *(_OWORD *)&v67[16];
  v68[2] = *(_OWORD *)&v67[32];
  v68[3] = *(_OWORD *)&v67[48];
  v69 = *(_QWORD *)&v67[64];
  if (*(uint64_t *)v67 > 3999)
  {
    if (*(uint64_t *)v67 > 4255)
    {
      if (*(_QWORD *)v67 == 4256)
      {
        v47 = (unsigned __int8 *)v68 + 8;
        v48 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v49 = v48;
        for (i = 0; i != 64; i += 2)
        {
          v51 = *v47++;
          v52 = &v48[i];
          *v52 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v51 >> 4];
          v52[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v51 & 0xF];
        }
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        v19 = v49;
        v20 = 64;
      }
      else
      {
        if (*(_QWORD *)v67 != 4512)
          goto LABEL_48;
        v25 = (unsigned __int8 *)v68 + 8;
        v26 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v27 = v26;
        for (j = 0; j != 128; j += 2)
        {
          v29 = *v25++;
          v30 = &v26[j];
          *v30 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v29 >> 4];
          v30[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v29 & 0xF];
        }
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        v19 = v27;
        v20 = 128;
      }
    }
    else if (*(_QWORD *)v67 == 4000)
    {
      v37 = (unsigned __int8 *)v68 + 8;
      v38 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v39 = v38;
      for (k = 0; k != 32; k += 2)
      {
        v41 = *v37++;
        v42 = &v38[k];
        *v42 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v41 >> 4];
        v42[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v41 & 0xF];
      }
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v39;
      v20 = 32;
    }
    else
    {
      if (*(_QWORD *)v67 != 4001)
        goto LABEL_48;
      v12 = (unsigned __int8 *)v68 + 8;
      v13 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v14 = v13;
      for (m = 0; m != 40; m += 2)
      {
        v16 = *v12++;
        v17 = &v13[m];
        *v17 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v16 >> 4];
        v17[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v16 & 0xF];
      }
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v14;
      v20 = 40;
    }
LABEL_45:
    v36 = (CFStringRef)objc_msgSend(v18, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v19, v20, 4, 1, 4001, *(_QWORD *)&v59.h0);
    goto LABEL_46;
  }
  if (*(uint64_t *)v67 > 2999)
  {
    if (*(_QWORD *)v67 == 3000)
    {
      LODWORD(v70[0]) = bswap32(DWORD2(v68[0]));
      v43 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v44 = 0;
      v45 = v43 + 1;
      do
      {
        v46 = *((unsigned __int8 *)v70 + v44);
        *(v45 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v46 >> 4];
        *v45 = MSVFastHexStringFromBytes_hexCharacters_22377[v46 & 0xF];
        v45 += 2;
        ++v44;
      }
      while (v44 != 4);
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v43;
      v20 = 8;
    }
    else
    {
      if (*(_QWORD *)v67 != 3001)
        goto LABEL_48;
      v70[0] = bswap64(*((unint64_t *)&v68[0] + 1));
      v21 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v22 = 0;
      v23 = v21 + 1;
      do
      {
        v24 = *((unsigned __int8 *)v70 + v22);
        *(v23 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v24 >> 4];
        *v23 = MSVFastHexStringFromBytes_hexCharacters_22377[v24 & 0xF];
        v23 += 2;
        ++v22;
      }
      while (v22 != 8);
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v21;
      v20 = 16;
    }
    goto LABEL_45;
  }
  if (*(_QWORD *)v67 == 1000)
  {
    v31 = *((_QWORD *)&v68[0] + 1);
    v32 = (char *)&v71 + 1;
    quot = *((_QWORD *)&v68[0] + 1);
    do
    {
      v34 = lldiv(quot, 10);
      quot = v34.quot;
      if (v34.rem >= 0)
        LOBYTE(v35) = v34.rem;
      else
        v35 = -v34.rem;
      *(v32 - 2) = v35 + 48;
      v11 = (const UInt8 *)(v32 - 2);
      --v32;
    }
    while (v34.quot);
    if (v31 < 0)
    {
      *(v32 - 2) = 45;
      v11 = (const UInt8 *)(v32 - 2);
    }
    v10 = (char *)((char *)&v71 - (char *)v11);
    goto LABEL_35;
  }
  if (*(_QWORD *)v67 != 2000)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 4001, *(_QWORD *)&v59.h0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v53 = &stru_1E5B66908;
    goto LABEL_47;
  }
  v6 = DWORD2(v68[0]);
  v7 = &v71;
  do
  {
    v8 = ldiv(v6, 10);
    v6 = v8.quot;
    if (v8.rem >= 0)
      LOBYTE(v9) = v8.rem;
    else
      v9 = -v8.rem;
    *((_BYTE *)v7 - 1) = v9 + 48;
    v7 = (uint64_t *)((char *)v7 - 1);
  }
  while (v8.quot);
  v10 = (char *)((char *)&v71 - (char *)v7);
  v11 = (const UInt8 *)v7;
LABEL_35:
  v36 = CFStringCreateWithBytes(0, v11, (CFIndex)v10, 0x8000100u, 0);
LABEL_46:
  v53 = (__CFString *)v36;
LABEL_47:

  -[_ML3BaseMusicLibraryResourcesManager libraryContainerPath](self, "libraryContainerPath");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "stringByAppendingPathComponent:", v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)_musicAssetsPathRelativeToBasePath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_ML3BaseMusicLibraryResourcesManager musicAssetsContainerPath](self, "musicAssetsContainerPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v6 = v5;
    if (objc_msgSend(v4, "length"))
    {
      v7 = objc_msgSend(v5, "rangeOfString:", v4);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          v10 = 138543619;
          v11 = v4;
          v12 = 2113;
          v13 = v5;
          _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_FAULT, "_musicAssetsPathWithBasePath recieved invalid base path %{public}@ for music assets path %{private}@", (uint8_t *)&v10, 0x16u);
        }

        v6 = v5;
      }
      else
      {
        objc_msgSend(v5, "substringFromIndex:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v6;
}

- (id)_mediaRelativeMusicAssetsDirectoryPath
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[_ML3BaseMusicLibraryResourcesManager libraryContainerIdentifier](self, "libraryContainerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_ML3BaseMusicLibraryResourcesManager libraryContainerIdentifier](self, "libraryContainerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Music"), "stringByAppendingPathComponent:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("Music");
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryContainerIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
