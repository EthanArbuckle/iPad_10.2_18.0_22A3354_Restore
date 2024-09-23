@implementation PHPersonSuggestion

- (PHPersonSuggestion)initWithKeyFace:(id)a3 person:(id)a4 confirmed:(BOOL)a5 similarityScore:(double)a6
{
  id v11;
  id v12;
  PHPersonSuggestion *v13;
  PHPersonSuggestion *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHPersonSuggestion;
  v13 = -[PHPersonSuggestion init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    if (v11 && v12)
    {
      objc_storeStrong((id *)&v13->_keyFace, a3);
      objc_storeStrong((id *)&v14->_person, a4);
      v14->_confirmed = a5;
      v14->_similarityScore = a6;
    }
    else
    {

      v14 = 0;
    }
  }

  return v14;
}

- (PHFace)keyFace
{
  return self->_keyFace;
}

- (PHPerson)person
{
  return self->_person;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (double)similarityScore
{
  return self->_similarityScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_keyFace, 0);
}

@end
