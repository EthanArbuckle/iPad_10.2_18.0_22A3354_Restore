@implementation MPMediaChaptersFromML3Entity

void __MPMediaChaptersFromML3Entity_block_invoke(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  MPMediaLibraryArtworkRequest *v12;
  MPMediaChapter *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void (**v20)(void);

  v19 = a2;
  v20 = a4;
  v6 = objc_msgSend(a1[4], "countOfGroupsForProperty:", a3);
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = 0;
    do
    {
      v11 = objc_msgSend(a1[4], "chapterIndexForGroupIndex:groupingProperty:", v10, a3, v19);
      v12 = -[MPMediaLibraryArtworkRequest initWithLibrary:identifier:entityType:artworkType:]([MPMediaLibraryArtworkRequest alloc], "initWithLibrary:identifier:entityType:artworkType:", v9, objc_msgSend(a1[6], "persistentID"), 0, 3);
      v13 = objc_alloc_init(MPMediaChapter);
      -[MPMediaChapter setArtworkRequest:](v13, "setArtworkRequest:", v12);
      objc_msgSend(a1[5], "artworkDataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPMediaChapter setArtworkDataSource:](v13, "setArtworkDataSource:", v14);

      -[MPMediaChapter setChapterType:](v13, "setChapterType:", v19);
      -[MPMediaChapter setIndexInChaptersWithSameType:](v13, "setIndexInChaptersWithSameType:", v10);
      -[MPMediaChapter setIndexInChaptersWithAnyType:](v13, "setIndexInChaptersWithAnyType:", v11);
      -[MPMediaChapter setPlaybackTime:](v13, "setPlaybackTime:", (double)objc_msgSend(a1[4], "timeLocationInMSOfChapterAtIndex:", v11) / 1000.0);
      -[MPMediaChapter setPlaybackDuration:](v13, "setPlaybackDuration:", (double)objc_msgSend(a1[4], "durationInMSOfGroupAtIndex:groupingProperty:", v10, a3) / 1000.0);
      -[MPMediaChapter playbackTime](v13, "playbackTime");
      -[MPMediaLibraryArtworkRequest setRetrievalTime:](v12, "setRetrievalTime:");
      objc_msgSend(v8, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[MPMediaChapter playbackTime](v13, "playbackTime");
        v17 = v16;
        objc_msgSend(v15, "playbackTime");
        objc_msgSend(v15, "setPlaybackDuration:", v17 - v18 + -2.22044605e-16);
      }
      if (v20)
        v20[2]();
      objc_msgSend(v8, "addObject:", v13);

      ++v10;
    }
    while (v7 != v10);
  }
  objc_msgSend(a1[7], "addObjectsFromArray:", v8, v19);

}

void __MPMediaChaptersFromML3Entity_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "titlePropertyOfChapterAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v6);

}

void __MPMediaChaptersFromML3Entity_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "urlPropertyOfChapterAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v6);

}

void __MPMediaChaptersFromML3Entity_block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "urlTitlePropertyOfChapterAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v6);

}

uint64_t __MPMediaChaptersFromML3Entity_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValueLoader:", &__block_literal_global_623);
}

uint64_t __MPMediaChaptersFromML3Entity_block_invoke_6()
{
  return 0;
}

@end
