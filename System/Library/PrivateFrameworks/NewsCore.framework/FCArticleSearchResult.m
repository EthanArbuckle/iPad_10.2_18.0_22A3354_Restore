@implementation FCArticleSearchResult

- (FCArticleSearchResult)initWithParsecSearchResult:(id)a3 cloudContext:(id)a4
{
  id v7;
  id v8;
  FCArticleSearchResult *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  float v32;
  void *v33;
  int v34;
  float v35;
  FCArticleSearchResult *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *articleID;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  FCTag *v46;
  void *v47;
  void *v48;
  FCTag *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  FCHeadline *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  FCHeadline *v61;
  BOOL v62;
  int v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  char v72;
  void *v73;
  char v74;
  FCTag *v75;
  char v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  char v82;
  void *v83;
  char v84;
  char v85;
  void *v86;
  void *v87;
  NSString *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  FCHeadlineProviding *deflatedHeadline;
  FCArticleSearchResult *v95;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  void *v103;
  FCTag *v104;
  FCArticleSearchResult *v105;
  void *v106;
  void *v107;
  _BOOL4 v108;
  void *v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  objc_super v115;
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v115.receiver = self;
  v115.super_class = (Class)FCArticleSearchResult;
  v9 = -[FCArticleSearchResult init](&v115, sel_init);
  if (!v9)
  {
    v36 = 0;
    goto LABEL_67;
  }
  v105 = v9;
  v106 = v8;
  objc_storeStrong((id *)&v9->_searchResult, a3);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v107 = v7;
  objc_msgSend(v7, "card");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
  if (!v12)
  {
    v108 = 0;
    v109 = 0;
    v110 = 0;
    v14 = 0;
    v16 = 0.0;
    v17 = 0.0;
    goto LABEL_28;
  }
  v13 = v12;
  v108 = 0;
  v109 = 0;
  v110 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v112;
  v16 = 0.0;
  v17 = 0.0;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v112 != v15)
        objc_enumerationMutation(v11);
      v19 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
      objc_opt_class();
      if (!v19 || (objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = 0;
        goto LABEL_23;
      }
      v20 = v19;
      objc_msgSend(v20, "key");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("channel_id"));

      if (v22)
      {
        objc_msgSend(v20, "value");
        v23 = v14;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v20, "key");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("channel_name"));

        if (v25)
        {
          objc_msgSend(v20, "value");
          v23 = v110;
          v110 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v20, "key");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("channel_logo"));

          if (v27)
          {
            objc_msgSend(v20, "image");
            v23 = v109;
            v109 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v20, "key");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("is_paid"));

            if (v29)
            {
              objc_msgSend(v20, "value");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = objc_msgSend(v23, "integerValue") == 1;
            }
            else
            {
              objc_msgSend(v20, "key");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("banner_image_scale"));

              if (v31)
              {
                objc_msgSend(v20, "value");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "floatValue");
                v17 = v32;
              }
              else
              {
                objc_msgSend(v20, "key");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("banner_image_offset"));

                if (!v34)
                  goto LABEL_23;
                objc_msgSend(v20, "value");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "floatValue");
                v16 = v35;
              }
            }
          }
        }
      }

LABEL_23:
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v111, v116, 16);
  }
  while (v13);
LABEL_28:

  v7 = v107;
  objc_msgSend(v107, "punchout");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "urls");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "fc_firstObjectPassingTest:", &__block_literal_global_131);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "fc_NewsArticleID");
  v40 = objc_claimAutoreleasedReturnValue();
  v36 = v105;
  articleID = v105->_articleID;
  v105->_articleID = (NSString *)v40;

  if (v105->_articleID)
  {
    objc_opt_class();
    v8 = v106;
    objc_msgSend(v106, "tagController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "slowCachedTagForID:", v14);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v44 = v43;
      else
        v44 = 0;
    }
    else
    {
      v44 = 0;
    }
    v46 = v44;

    if (!v46)
    {
      v46 = -[FCTag initWithTagType:identifier:name:]([FCTag alloc], "initWithTagType:identifier:name:", 2, v14, v110);
      if (v109)
      {
        objc_msgSend(v106, "assetManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "internalContentContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "contentDatabase");
        v49 = v46;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "assetHandleForRecordID:field:lifetimeHint:contentDatabase:", v14, 2, 0, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = v49;
        if (v51)
        {
          -[FCTag setNameImageAssetHandle:](v49, "setNameImageAssetHandle:", v51);
          objc_msgSend(v109, "size");
          -[FCTag setNameImageSize:](v49, "setNameImageSize:");
          -[FCTag setBannerImageScale:](v49, "setBannerImageScale:", v17);
          -[FCTag setBannerImageBaselineOffsetPercentage:](v49, "setBannerImageBaselineOffsetPercentage:", v16);
        }

      }
    }
    v52 = v108;
    if (v108 && !-[FCTag isPurchaseSetup](v46, "isPurchaseSetup"))
    {
      v45 = 0;
    }
    else
    {
      v103 = v39;
      v53 = objc_alloc_init(FCHeadline);
      -[FCHeadline setIdentifier:](v53, "setIdentifier:", v105->_articleID);
      -[FCHeadline setArticleID:](v53, "setArticleID:", v105->_articleID);
      objc_msgSend(v107, "title");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "text");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCHeadline setTitle:](v53, "setTitle:", v55);

      -[FCHeadline setSourceChannel:](v53, "setSourceChannel:", v46);
      v104 = v46;
      -[FCTag name](v46, "name");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCHeadline setSourceName:](v53, "setSourceName:", v56);

      v57 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v107, "publishDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "doubleValue");
      objc_msgSend(v57, "dateWithTimeIntervalSince1970:");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCHeadline setPublishDate:](v53, "setPublishDate:", v59);

      -[FCHeadline setPaid:](v53, "setPaid:", v108);
      -[FCHeadline setRole:](v53, "setRole:", 1);
      -[FCHeadline setTopicIDs:](v53, "setTopicIDs:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(v106, "paidAccessChecker");
      v60 = (id)objc_claimAutoreleasedReturnValue();
      v61 = v53;
      v62 = -[FCHeadline isPaid](v61, "isPaid");
      v63 = -[FCHeadline isBundlePaid](v61, "isBundlePaid");
      -[FCHeadline sourceChannel](v61, "sourceChannel");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "identifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v60;
      v66 = v64;
      objc_msgSend(v65, "bundleSubscriptionProvider");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "purchaseProvider");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v67;
      v70 = v68;
      v71 = v66;
      if (v62 || v63)
      {
        v72 = !v62;
        if (!v70)
          v72 = 1;
        if ((v72 & 1) == 0)
        {
          objc_msgSend(v70, "purchasedTagIDs");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "containsObject:", v71);

          if ((v74 & 1) != 0)
          {
            v63 = 0;
            goto LABEL_49;
          }
        }
        v76 = v63 ^ 1;
        if (!v69)
          v76 = 1;
        v75 = v104;
        if ((v76 & 1) != 0)
          goto LABEL_56;
        v77 = v69;
        v78 = v71;
        if (!v78)
          goto LABEL_55;
        objc_msgSend(v77, "bundleSubscription");
        v101 = v77;
        v79 = objc_claimAutoreleasedReturnValue();
        objc_getAssociatedObject((id)v79, (const void *)(v79 + 1));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v99, "unsignedIntegerValue");
        v81 = v78;
        v82 = v80;
        objc_getAssociatedObject((id)v79, (const void *)~v80);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "unsignedIntegerValue");
        v85 = v82 + 1;
        v78 = v81;
        LOBYTE(v81) = (v84 + 1) ^ v85;

        v75 = v104;
        v77 = v101;
        if ((v81 & 1) == 0)
        {
LABEL_55:

          v52 = v108;
          goto LABEL_56;
        }
        objc_msgSend(v101, "bundleSubscription");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "bundleChannelIDs");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v98, "containsObject:", v78);

        v75 = v104;
        v52 = v108;
        if ((v100 & 1) == 0)
LABEL_56:
          v63 = 1;
        else
          v63 = 0;
      }
      else
      {
LABEL_49:
        v75 = v104;
      }

      -[FCHeadline setShowSubscriptionRequiredText:](v61, "setShowSubscriptionRequiredText:", v52 & v63);
      v7 = v107;
      objc_msgSend(v107, "thumbnail");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = v105;
      v8 = v106;
      if (v86)
      {
        objc_msgSend(v106, "assetManager");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v105->_articleID;
        objc_msgSend(v106, "internalContentContext");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "contentDatabase");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "assetHandleForRecordID:field:lifetimeHint:contentDatabase:", v88, 0, 0, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        if (v91)
        {
          objc_msgSend(v107, "thumbnail");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "size");
          +[FCHeadlineThumbnail headlineThumbnailWithAssetHandle:thumbnailSize:](FCHeadlineThumbnail, "headlineThumbnailWithAssetHandle:thumbnailSize:", v91);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCHeadline setThumbnail:](v61, "setThumbnail:", v93);

          -[FCHeadline setHasThumbnail:](v61, "setHasThumbnail:", 1);
          -[FCHeadline setThumbnailFocalFrame:](v61, "setThumbnailFocalFrame:", 0.0, 0.0, 1.0, 1.0);
        }

        v75 = v104;
      }
      deflatedHeadline = v105->_deflatedHeadline;
      v105->_deflatedHeadline = (FCHeadlineProviding *)v61;

      v45 = 1;
      if (v105->_articleID)
      {
        v39 = v103;
        goto LABEL_66;
      }
      v46 = (FCTag *)v105;
      v36 = 0;
      v39 = v103;
    }
  }
  else
  {
    v45 = 1;
    v46 = (FCTag *)v105;
    v36 = 0;
    v8 = v106;
  }

LABEL_66:
  if (v45)
  {
LABEL_67:
    v36 = v36;
    v95 = v36;
  }
  else
  {
    v95 = 0;
  }

  return v95;
}

uint64_t __65__FCArticleSearchResult_initWithParsecSearchResult_cloudContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_isNewsArticleURL");
}

- (NSString)articleID
{
  return self->_articleID;
}

- (FCHeadlineProviding)deflatedHeadline
{
  return self->_deflatedHeadline;
}

- (FCHeadlineProviding)inflatedHeadline
{
  return self->_inflatedHeadline;
}

- (void)setInflatedHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_inflatedHeadline, a3);
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_inflatedHeadline, 0);
  objc_storeStrong((id *)&self->_deflatedHeadline, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
}

@end
