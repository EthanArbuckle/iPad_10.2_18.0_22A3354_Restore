@implementation QLListCellDataGenerationOperation

- (QLListCellDataGenerationOperation)initWithListCell:(id)a3 index:(unint64_t)a4 item:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  QLListCellDataGenerationOperation *v14;
  QLListCellDataGenerationOperation *v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)QLListCellDataGenerationOperation;
  v13 = -[QLListCellDataGenerationOperation init](&v17, sel_init);
  v14 = (QLListCellDataGenerationOperation *)v13;
  if (v13)
  {
    objc_storeWeak((id *)v13 + 33, v10);
    objc_storeWeak((id *)&v14->_cell, v11);
    *(_QWORD *)&v14->_didGenerateThumbnail = a4;
    objc_storeWeak((id *)&v14->_item, v12);
    v15 = v14;
  }

  return v14;
}

- (void)main
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  if (-[QLListCellDataGenerationOperation isCancelled](self, "isCancelled"))
  {
    -[QLAsynchronousOperation finish](self, "finish");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    objc_msgSend(WeakRetained, "thumbnailGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    QLCGSizeFromQLItemThumbnailSize();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __41__QLListCellDataGenerationOperation_main__block_invoke;
    v15[3] = &unk_24C725678;
    v15[4] = self;
    objc_msgSend(v4, "generateThumbnailWithSize:completionBlock:", v15);

    v5 = objc_loadWeakRetained((id *)&self->_cell);
    objc_msgSend(v5, "fetcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemSize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_loadWeakRetained((id *)&self->_cell);
    objc_msgSend(v8, "previewItemContentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDF8238];
      v11 = objc_loadWeakRetained((id *)&self->_cell);
      objc_msgSend(v11, "previewItemContentType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "typeWithIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    -[QLListCellDataGenerationOperation _didDetermineFileSize:fileTypeString:](self, "_didDetermineFileSize:fileTypeString:", v7, v14);

  }
}

uint64_t __41__QLListCellDataGenerationOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didGenerateThumbnail:", a2);
}

- (void)_finishIfNeeded
{
  if (*(&self->super._executing + 1) && *(&self->super._executing + 2))
    -[QLAsynchronousOperation finish](self, "finish");
}

- (void)_didGenerateThumbnail:(id)a3
{
  id WeakRetained;
  QLListCellDataGenerationOperation *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "operation:didGenerateThumbnail:", self, v6);

  v5 = self;
  objc_sync_enter(v5);
  *(&v5->super._executing + 1) = 1;
  -[QLListCellDataGenerationOperation _finishIfNeeded](v5, "_finishIfNeeded");
  objc_sync_exit(v5);

}

- (void)_didDetermineFileSize:(id)a3 fileTypeString:(id)a4
{
  id v6;
  id WeakRetained;
  QLListCellDataGenerationOperation *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "operation:didDetermineFileSize:fileTypeString:", self, v9, v6);

  v8 = self;
  objc_sync_enter(v8);
  *(&v8->super._executing + 2) = 1;
  -[QLListCellDataGenerationOperation _finishIfNeeded](v8, "_finishIfNeeded");
  objc_sync_exit(v8);

}

- (unint64_t)index
{
  return *(_QWORD *)&self->_didGenerateThumbnail;
}

- (void)setIndex:(unint64_t)a3
{
  *(_QWORD *)&self->_didGenerateThumbnail = a3;
}

- (QLListCell)cell
{
  return (QLListCell *)objc_loadWeakRetained((id *)&self->_index);
}

- (void)setCell:(id)a3
{
  objc_storeWeak((id *)&self->_index, a3);
}

- (QLItem)item
{
  return (QLItem *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (QLListCellDataGenerationOperationDelegate)delegate
{
  return (QLListCellDataGenerationOperationDelegate *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_destroyWeak((id *)&self->_cell);
  objc_destroyWeak((id *)&self->_index);
}

@end
