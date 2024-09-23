@implementation _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation

- (void)execute
{
  _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *v2;
  MPMediaItem *mediaItem;
  void *v4;
  MPMediaItem *v5;
  void *v6;
  _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *v7;
  _QWORD v8[4];
  _MPModelLibraryKeepLocalChangeRequestUpdateItemOperation *v9;

  v2 = self;
  mediaItem = v2->_mediaItem;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2->_keepLocalConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaItem setValue:forProperty:](mediaItem, "setValue:forProperty:", v4, CFSTR("keepLocalConstraints"));

  v5 = v2->_mediaItem;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2->_keepLocal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67___MPModelLibraryKeepLocalChangeRequestUpdateItemOperation_execute__block_invoke;
  v8[3] = &unk_1E31637D0;
  v9 = v2;
  v7 = v2;
  -[MPMediaItem setValue:forProperty:withCompletionBlock:](v5, "setValue:forProperty:withCompletionBlock:", v6, CFSTR("keepLocal"), v8);

}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (int64_t)keepLocal
{
  return self->_keepLocal;
}

- (void)setKeepLocal:(int64_t)a3
{
  self->_keepLocal = a3;
}

- (unint64_t)keepLocalConstraints
{
  return self->_keepLocalConstraints;
}

- (void)setKeepLocalConstraints:(unint64_t)a3
{
  self->_keepLocalConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end
