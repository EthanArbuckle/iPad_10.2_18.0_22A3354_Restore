@implementation ICNoteUserActivityState

- (ICNoteUserActivityState)initWithNote:(id)a3
{
  id v4;
  ICNoteUserActivityState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICNoteUserActivityState;
  v5 = -[ICNoteBaseUserActivityState initWithNote:](&v15, sel_initWithNote_, v4);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteUserActivityState setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteUserActivityState setNoteID:](v5, "setNoteID:", v7);

    objc_msgSend(v4, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteUserActivityState setFolderID:](v5, "setFolderID:", v9);

    objc_msgSend(v4, "folder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteUserActivityState setFolderName:](v5, "setFolderName:", v11);

    -[ICNoteUserActivityState setWantsContinuationStreams:](v5, "setWantsContinuationStreams:", ICNotesSupportsContinuationStreamsForNote(v4));
    objc_msgSend(v4, "modificationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteUserActivityState setModificationDate:](v5, "setModificationDate:", v12);

    objc_msgSend(v4, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNoteUserActivityState setCreationDate:](v5, "setCreationDate:", v13);

  }
  return v5;
}

- (void)updateUserActivity:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteUserActivityState;
  v4 = a3;
  -[ICNoteBaseUserActivityState updateUserActivity:](&v5, sel_updateUserActivity_, v4);
  ICNotesUpdateUserActivityForViewingNoteWithState(v4, self);

}

- (NSString)noteID
{
  return self->_noteID;
}

- (void)setNoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)wantsContinuationStreams
{
  return self->_wantsContinuationStreams;
}

- (void)setWantsContinuationStreams:(BOOL)a3
{
  self->_wantsContinuationStreams = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)contentHash
{
  return self->_contentHash;
}

- (void)setContentHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ICTextViewScrollState)scrollState
{
  return self->_scrollState;
}

- (void)setScrollState:(id)a3
{
  objc_storeStrong((id *)&self->_scrollState, a3);
}

- (_NSRange)visibleRange
{
  _NSRange *p_visibleRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_visibleRange = &self->_visibleRange;
  location = self->_visibleRange.location;
  length = p_visibleRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  self->_visibleRange = a3;
}

- (NSData)visibleRangeData
{
  return self->_visibleRangeData;
}

- (void)setVisibleRangeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (_NSRange)selectionRange
{
  _NSRange *p_selectionRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectionRange = &self->_selectionRange;
  location = self->_selectionRange.location;
  length = p_selectionRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSelectionRange:(_NSRange)a3
{
  self->_selectionRange = a3;
}

- (NSData)selectionRangeData
{
  return self->_selectionRangeData;
}

- (void)setSelectionRangeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRangeData, 0);
  objc_storeStrong((id *)&self->_visibleRangeData, 0);
  objc_storeStrong((id *)&self->_scrollState, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_noteID, 0);
}

@end
