@implementation MRUUpNextCellCell

- (MRUUpNextCellCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUUpNextCellCell;
  return -[MRUUpNextCellCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, 3, a4);
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MRUUpNextCellCell;
  -[MRUUpNextCellCell prepareForReuse](&v2, sel_prepareForReuse);
}

- (void)setArtworkCatalog:(id)a3
{
  MPArtworkCatalog *v5;
  MPArtworkCatalog *artworkCatalog;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = (MPArtworkCatalog *)a3;
  if (self->_artworkCatalog != v5)
  {
    objc_storeStrong((id *)&self->_artworkCatalog, a3);
    objc_initWeak(&location, self);
    artworkCatalog = self->_artworkCatalog;
    -[MRUUpNextCellCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke;
    v8[3] = &unk_1E581AC68;
    objc_copyWeak(&v9, &location);
    -[MPArtworkCatalog setDestination:configurationBlock:](artworkCatalog, "setDestination:configurationBlock:", v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke_2;
  v7[3] = &unk_1E5818CB0;
  v7[4] = WeakRetained;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
