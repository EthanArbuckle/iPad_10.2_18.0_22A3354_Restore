@implementation BLJaliscoItem

+ (id)itemWithServerItem:(id)a3
{
  id v3;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "storeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStoreID:", v5);

  objc_msgSend(v3, "artist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtist:", v6);

  objc_msgSend(v3, "artworkTokenCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtworkTokenCode:", v7);

  objc_msgSend(v3, "artworkURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArtworkURLString:", v8);

  objc_msgSend(v3, "cloudID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudID:", v9);

  objc_msgSend(v3, "genre");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGenre:", v10);

  objc_msgSend(v3, "isHidden");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsHidden:", v11);

  objc_msgSend(v3, "purchasedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPurchasedAt:", v12);

  objc_msgSend(v3, "purchasedTokenCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPurchasedTokenCode:", v13);

  objc_msgSend(v3, "purchaseHistoryID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPurchaseHistoryID:", v14);

  objc_msgSend(v3, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v15);

  objc_msgSend(v3, "isExplicit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsExplicit:", v16);

  objc_msgSend(v3, "isDisabled");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsDisabled:", v17);

  objc_msgSend(v3, "expectedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpectedDate:", v18);

  objc_msgSend(v3, "sortedTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortedTitle:", v19);

  objc_msgSend(v3, "sortedAuthor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortedAuthor:", v20);

  objc_msgSend(v3, "displayVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayVersion:", v21);

  objc_msgSend(v3, "storeDownloadParameters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStoreDownloadParameters:", v22);

  objc_msgSend(v3, "fileExtension");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileExtension:", v23);

  objc_msgSend(v3, "isPictureBook");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPictureBook:", v24);

  objc_msgSend(v3, "containsAudio");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainsAudio:", v25);

  objc_msgSend(v3, "isReadAloud");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsReadAloud:", v26);

  objc_msgSend(v3, "chapterMetadataURLString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChapterMetadataURLString:", v27);

  objc_msgSend(v3, "isAudiobook");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAudiobook:", v28);

  objc_msgSend(v3, "hlsPlaylistURLString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHlsPlaylistURLString:", v29);

  objc_msgSend(v3, "storeAccountID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStoreAccountID:", v30);

  objc_msgSend(v3, "additionalAudiobookInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditionalAudiobookInfo:", v31);

  objc_msgSend(v3, "needsImport");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsImport:", v32);

  objc_msgSend(v3, "booklets");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v33, "count"))
  {
    v34 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v33, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLJaliscoBookletItem arrayWithServerBookletItems:](BLJaliscoBookletItem, "arrayWithServerBookletItems:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBooklets:", v37);

  }
  return v4;
}

- (NSNumber)duration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[BLJaliscoItem additionalAudiobookInfo](self, "additionalAudiobookInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("daap.songtime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  BUDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    objc_opt_class();
    BUDynamicCast();
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v7;
}

+ (id)arrayWithServerItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[BLJaliscoItem itemWithServerItem:](BLJaliscoItem, "itemWithServerItem:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[BLJaliscoItem storeAccountID](self, "storeAccountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "storeAccountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 1;
  }

  -[BLJaliscoItem storeID](self, "storeID");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && ((v9 = (void *)v8,
         objc_msgSend(v4, "storeID"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v10,
         v9,
         !v10)
      ? (v11 = 1)
      : (v11 = v7),
        (v11 & 1) == 0))
  {
    objc_msgSend(v4, "storeAccountID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLJaliscoItem storeAccountID](self, "storeAccountID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToNumber:", v14))
    {
      objc_msgSend(v4, "storeID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLJaliscoItem storeID](self, "storeID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqualToString:", v16);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[BLJaliscoItem storeID](self, "storeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BLJaliscoItem storeAccountID](self, "storeAccountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoItem artist](self, "artist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoItem storeID](self, "storeID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoItem storeAccountID](self, "storeAccountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p title=%@ author=%@ storeID=%@ storeAccountID=%@ >"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)artworkTokenCode
{
  return self->_artworkTokenCode;
}

- (void)setArtworkTokenCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (void)setArtworkURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)cloudID
{
  return self->_cloudID;
}

- (void)setCloudID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(id)a3
{
  objc_storeStrong((id *)&self->_isHidden, a3);
}

- (NSDate)purchasedAt
{
  return self->_purchasedAt;
}

- (void)setPurchasedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)purchasedTokenCode
{
  return self->_purchasedTokenCode;
}

- (void)setPurchasedTokenCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)purchaseHistoryID
{
  return self->_purchaseHistoryID;
}

- (void)setPurchaseHistoryID:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseHistoryID, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(id)a3
{
  objc_storeStrong((id *)&self->_isExplicit, a3);
}

- (NSNumber)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(id)a3
{
  objc_storeStrong((id *)&self->_isDisabled, a3);
}

- (NSDate)expectedDate
{
  return self->_expectedDate;
}

- (void)setExpectedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)sortedTitle
{
  return self->_sortedTitle;
}

- (void)setSortedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)sortedAuthor
{
  return self->_sortedAuthor;
}

- (void)setSortedAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)displayVersion
{
  return self->_displayVersion;
}

- (void)setDisplayVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)storeDownloadParameters
{
  return self->_storeDownloadParameters;
}

- (void)setStoreDownloadParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (void)setFileExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)isPictureBook
{
  return self->_isPictureBook;
}

- (void)setIsPictureBook:(id)a3
{
  objc_storeStrong((id *)&self->_isPictureBook, a3);
}

- (NSNumber)containsAudio
{
  return self->_containsAudio;
}

- (void)setContainsAudio:(id)a3
{
  objc_storeStrong((id *)&self->_containsAudio, a3);
}

- (NSNumber)isReadAloud
{
  return self->_isReadAloud;
}

- (void)setIsReadAloud:(id)a3
{
  objc_storeStrong((id *)&self->_isReadAloud, a3);
}

- (NSString)chapterMetadataURLString
{
  return self->_chapterMetadataURLString;
}

- (void)setChapterMetadataURLString:(id)a3
{
  objc_storeStrong((id *)&self->_chapterMetadataURLString, a3);
}

- (NSNumber)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(id)a3
{
  objc_storeStrong((id *)&self->_isAudiobook, a3);
}

- (NSString)hlsPlaylistURLString
{
  return self->_hlsPlaylistURLString;
}

- (void)setHlsPlaylistURLString:(id)a3
{
  objc_storeStrong((id *)&self->_hlsPlaylistURLString, a3);
}

- (NSNumber)storeAccountID
{
  return self->_storeAccountID;
}

- (void)setStoreAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccountID, a3);
}

- (NSDictionary)additionalAudiobookInfo
{
  return self->_additionalAudiobookInfo;
}

- (void)setAdditionalAudiobookInfo:(id)a3
{
  objc_storeStrong((id *)&self->_additionalAudiobookInfo, a3);
}

- (NSNumber)needsImport
{
  return self->_needsImport;
}

- (void)setNeedsImport:(id)a3
{
  objc_storeStrong((id *)&self->_needsImport, a3);
}

- (NSSet)booklets
{
  return self->_booklets;
}

- (void)setBooklets:(id)a3
{
  objc_storeStrong((id *)&self->_booklets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_booklets, 0);
  objc_storeStrong((id *)&self->_needsImport, 0);
  objc_storeStrong((id *)&self->_additionalAudiobookInfo, 0);
  objc_storeStrong((id *)&self->_storeAccountID, 0);
  objc_storeStrong((id *)&self->_hlsPlaylistURLString, 0);
  objc_storeStrong((id *)&self->_isAudiobook, 0);
  objc_storeStrong((id *)&self->_chapterMetadataURLString, 0);
  objc_storeStrong((id *)&self->_isReadAloud, 0);
  objc_storeStrong((id *)&self->_containsAudio, 0);
  objc_storeStrong((id *)&self->_isPictureBook, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_storeDownloadParameters, 0);
  objc_storeStrong((id *)&self->_displayVersion, 0);
  objc_storeStrong((id *)&self->_sortedAuthor, 0);
  objc_storeStrong((id *)&self->_sortedTitle, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_isDisabled, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_purchaseHistoryID, 0);
  objc_storeStrong((id *)&self->_purchasedTokenCode, 0);
  objc_storeStrong((id *)&self->_purchasedAt, 0);
  objc_storeStrong((id *)&self->_isHidden, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_cloudID, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
  objc_storeStrong((id *)&self->_artworkTokenCode, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

@end
