@implementation FCPuzzleOverrides

- (FCPuzzleOverrides)initWithTitle:(id)a3 subtitle:(id)a4 description:(id)a5 author:(id)a6 teaserClue:(id)a7 teaserAnswer:(id)a8 teaserInfo:(id)a9 teaserDirection:(id)a10 teaserNumber:(id)a11
{
  id v18;
  FCPuzzleOverrides *v19;
  FCPuzzleOverrides *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)FCPuzzleOverrides;
  v19 = -[FCPuzzleOverrides init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, a3);
    objc_storeStrong((id *)&v20->_subtitle, a4);
    objc_storeStrong((id *)&v20->_puzzleDescription, a5);
    objc_storeStrong((id *)&v20->_author, a6);
    objc_storeStrong((id *)&v20->_teaserClue, a7);
    objc_storeStrong((id *)&v20->_teaserAnswer, a8);
    objc_storeStrong((id *)&v20->_teaserInfo, a9);
    objc_storeStrong((id *)&v20->_teaserDirection, a10);
    objc_storeStrong((id *)&v20->_teaserNumber, a11);
  }

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)puzzleDescription
{
  return self->_puzzleDescription;
}

- (NSString)author
{
  return self->_author;
}

- (NSString)teaserClue
{
  return self->_teaserClue;
}

- (NSString)teaserAnswer
{
  return self->_teaserAnswer;
}

- (NSString)teaserInfo
{
  return self->_teaserInfo;
}

- (NSString)teaserDirection
{
  return self->_teaserDirection;
}

- (NSString)teaserNumber
{
  return self->_teaserNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teaserNumber, 0);
  objc_storeStrong((id *)&self->_teaserDirection, 0);
  objc_storeStrong((id *)&self->_teaserInfo, 0);
  objc_storeStrong((id *)&self->_teaserAnswer, 0);
  objc_storeStrong((id *)&self->_teaserClue, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_puzzleDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
