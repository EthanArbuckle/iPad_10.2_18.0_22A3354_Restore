@implementation CPUIImageRowCellConfiguration

+ (id)configurationWithText:(id)a3 images:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7
{
  return (id)objc_msgSend(a1, "configurationWithText:images:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", a3, a4, a5, a6, a7, 1);
}

+ (id)configurationWithText:(id)a3 images:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7 enabled:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return (id)objc_msgSend(a1, "configurationWithText:images:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", a3, a4, 0, a5, a6, a7, v9);
}

+ (id)configurationWithText:(id)a3 images:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _BOOL4 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v28 = a8;
  HIDWORD(v26) = a9;
  v35 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(MEMORY[0x24BDDC6D8], "staticArtworkCatalogWithImage:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v20);
  }

  LOBYTE(v26) = BYTE4(v26);
  objc_msgSend(a1, "configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", v29, v17, v14, v15, v16, v28, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6
{
  return (id)objc_msgSend(a1, "configurationWithText:artworkCatalogs:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", a3, a4, a5, a6, 0, 1);
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7
{
  return (id)objc_msgSend(a1, "configurationWithText:artworkCatalogs:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", a3, a4, a5, a6, a7, 1);
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 selectGridItemBlock:(id)a5 selectTitleBlock:(id)a6 showActivityIndicator:(BOOL)a7 enabled:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return (id)objc_msgSend(a1, "configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:", a3, a4, 0, a5, a6, a7, v9);
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return (id)objc_msgSend(a1, "configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:bundleIdentifier:", a3, a4, a5, a6, a7, a8, v10, 0);
}

+ (id)configurationWithText:(id)a3 artworkCatalogs:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9 bundleIdentifier:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _BOOL4 v23;

  v23 = a8;
  v15 = a10;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setTitle:", v20);

  objc_msgSend(v21, "setArtworkCatalogs:", v19);
  objc_msgSend(v21, "setSelectGridItemBlock:", v17);

  objc_msgSend(v21, "setSelectTitleBlock:", v16);
  objc_msgSend(v21, "setShowActivityIndicator:", v23);
  objc_msgSend(v21, "setEnabled:", a9);
  objc_msgSend(v21, "setImageTitles:", v18);

  objc_msgSend(v21, "setBundleIdentifier:", v15);
  return v21;
}

+ (id)configurationWithText:(id)a3 images:(id)a4 imageTitles:(id)a5 selectGridItemBlock:(id)a6 selectTitleBlock:(id)a7 showActivityIndicator:(BOOL)a8 enabled:(BOOL)a9 bundleIdentifier:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v27;
  id v29;
  _BOOL4 v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v30 = a8;
  v37 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v14 = a4;
  v29 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a10;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(MEMORY[0x24BDDC6D8], "staticArtworkCatalogWithImage:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

  LOBYTE(v27) = a9;
  objc_msgSend(a1, "configurationWithText:artworkCatalogs:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:bundleIdentifier:", v31, v18, v29, v15, v16, v30, v27, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)selectGridItemBlock
{
  return self->_selectGridItemBlock;
}

- (void)setSelectGridItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)selectTitleBlock
{
  return self->_selectTitleBlock;
}

- (void)setSelectTitleBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (NSArray)artworkCatalogs
{
  return self->_artworkCatalogs;
}

- (void)setArtworkCatalogs:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCatalogs, a3);
}

- (NSArray)imageTitles
{
  return self->_imageTitles;
}

- (void)setImageTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  self->_showActivityIndicator = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_imageTitles, 0);
  objc_storeStrong((id *)&self->_artworkCatalogs, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong(&self->_selectTitleBlock, 0);
  objc_storeStrong(&self->_selectGridItemBlock, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
